{$I ok_sklad.inc}
unit fMaterials;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrame, Menus, ActnList, StdCtrls,
  DB, DBClient, ExtCtrls, Grids, DBGrids, TB2Item, Clipbrd,
  dxTL6, dxDBCtrl6, dxDBGrid6, dxCntner6, dxExEdtr6,
  dxDBInsp, dxInspct, dxInspRw, dxDBInRw, dxDBTLCl6, dxGrClms6,
  cxPC, cxControls, cxContainer, cxEdit, cxTextEdit, cxMemo,
  prTypes, ssBaseTypes, ssDBGrid, ssBaseConst, ssClientDataSet, ssBevel,
  ssMemDS, ssDataSource, ssPeriod, okPeriod, apTree, dxExEdtr, dxCntner;
                                       
type
  TfmMaterials = class(TssBaseFrame)
    aFindAtWH: TAction;
    aGotoAnalog: TAction;
    aMatMove: TAction;
    aMatRsv: TAction;
    aMatsColOptions: TAction;
    aMatsDel: TAction;
    aMatsSelectAll: TAction;
    aMCColParams: TAction;
    aMCMatInfo: TAction;
    aMCMatMove: TAction;
    aMCMatRsv: TAction;
    aNewEx: TAction;
    aNewGrp: TAction;
    cdsFind: TssClientDataSet;
    cdsMaterials: TssClientDataSet;
    cdsMaterialsARCHIVED: TIntegerField;
    cdsMaterialsARTIKUL: TStringField;
    cdsMaterialsAVGPRICE: TFloatField;
    cdsMaterialsBARCODE: TStringField;
    cdsMaterialsCID: TIntegerField;
    cdsMaterialsCNAME: TStringField;
    cdsMaterialsDEMANDCAT: TIntegerField;
    cdsMaterialsGRPID: TIntegerField;
    cdsMaterialsMATID: TIntegerField;
    cdsMaterialsMID: TIntegerField;
    cdsMaterialsMINRESERV: TFloatField;
    cdsMaterialsMSIZE: TFloatField;
    cdsMaterialsMTYPE: TIntegerField;
    cdsMaterialsNAME: TStringField;
    cdsMaterialsNOTES: TStringField;
    cdsMaterialsNUM: TIntegerField;
    cdsMaterialsnumex: TIntegerField;
    cdsMaterialsPRICES: TStringField;
    cdsMaterialsPRODUCER: TStringField;
    cdsMaterialsSHORTNAME: TStringField;
    cdsMaterialsWEIGHT: TFloatField;
    cdsMaterialsWID: TIntegerField;
    cdsMaterialsCF1: TIntegerField;
    cdsMaterialsCF2: TIntegerField;
    cdsMaterialsCF3: TIntegerField;
    cdsMaterialsCF4: TIntegerField;
    cdsMaterialsCF5: TIntegerField;
    cdsMatGroup: TssClientDataSet;
    cdsMC: TssClientDataSet;
    cdsPriceTypes: TssClientDataSet;
    cdsWHouse: TssClientDataSet;
    colAmount: TdxDBGridColumn;
    colArchived: TdxDBGridColumn;
    colArtikul: TdxDBGridColumn;
    colAvgPrice: TdxDBGridColumn;
    colBarCode: TdxDBGridColumn;
    colCountry: TdxDBGridColumn;
    colCurrName: TdxDBGridColumn;
    colDef: TdxDBGridColumn;
    colID: TdxDBGridColumn;
    colMatArtikul: TdxDBGridColumn;
    colMatID: TdxDBGridColumn;
    colMatName: TdxDBGridColumn;
    colMCArtikul: TdxDBGridColumn;
    colMCBarCode: TdxDBGridColumn;
    colMCCountry: TdxDBGridColumn;
    colMCGrpName: TdxDBGridColumn;
    colMCMatName: TdxDBGridColumn;
    colMCMsrName: TdxDBGridColumn;
    colMCNotes: TdxDBGridMemoColumn;
    colMCProducer: TdxDBGridColumn;
    colMCRemain: TdxDBGridColumn;
    colMeasure: TdxDBGridColumn;
    colMID: TdxDBGridColumn;
    colMinReserv: TdxDBGridColumn;
    colMSize: TdxDBGridColumn;
    colName: TdxDBGridColumn;
    colNotes: TdxDBGridColumn;
    colNum: TdxDBGridColumn;
    colPName: TdxDBGridColumn;
    colPrice: TdxDBGridColumn;
    colPrices: TdxDBGridColumn;
    colProducer: TdxDBGridColumn;
    colPType: TdxDBGridColumn;
    colPTypeCurrName: TdxDBGridColumn;
    colPTypeDef: TdxDBGridColumn;
    colPTypeExtra: TdxDBGridColumn;
    colPTypeName: TdxDBGridColumn;
    colPTypeType: TdxDBGridColumn;
    colPWithNDS: TdxDBGridColumn;
    colRealNum: TdxDBGridColumn;
    colRecNo: TdxDBGridColumn;
    colType: TdxDBGridImageColumn;
    colWeight: TdxDBGridColumn;
    dbgMaterials: TssDBGrid;
    grdMats: TssDBGrid;
    grdMC: TssDBGrid;
    grdPrices: TssDBGrid;
    inspAddInfo: TdxInspector;
    inspMain: TdxInspector;
    irArtikul: TdxInspectorTextRow;
    irBarCode: TdxInspectorTextRow;
    irCountry: TdxInspectorTextRow;
    irDemandCat: TdxInspectorTextRow;
    irMatGroup: TdxInspectorTextRow;
    irMeasure: TdxInspectorTextRow;
    irMinReserv: TdxInspectorTextRow;
    irName: TdxInspectorTextRow;
    irProducer: TdxInspectorTextRow;
    irSize: TdxInspectorTextRow;
    irWeight: TdxInspectorTextRow;
    irWH: TdxInspectorTextRow;
    lCount: TLabel;
    mdMats: TssMemoryData;
    mdMatsamount: TFloatField;
    mdMatsartikul: TStringField;
    mdMatsbarcode: TStringField;
    mdMatsmatid: TIntegerField;
    mdMatsmid: TIntegerField;
    mdMatsmsrname: TStringField;
    mdMatsname: TStringField;
    mdMatsposid: TIntegerField;
    mdMatsprice: TFloatField;
    mdMatsproducer: TStringField;
    mdPrices: TssMemoryData;
    mdPricesCurrID: TIntegerField;
    mdPricesCurrName: TStringField;
    mdPricesDef: TIntegerField;
    mdPricesen: TIntegerField;
    mdPricesExtraType: TIntegerField;
    mdPricesName: TStringField;
    mdPricesOnValue: TFloatField;
    mdPricespname: TStringField;
    mdPricespptypeid: TIntegerField;
    mdPricesPTypeID: TIntegerField;
    mdPricesSrc: TIntegerField;
    mdPriceswithnds: TIntegerField;
    memNotes: TcxMemo;
    panFooter: TPanel;
    panGrid: TPanel;
    pcMain: TcxPageControl;
    pmMats: TTBPopupMenu;
    pmMC: TTBPopupMenu;
    sepClip: TTBSeparatorItem;
    splMain: TSplitter;
    srcMaterials: TssDataSource;
    srcMats: TDataSource;
    srcMC: TDataSource;
    srcPrices: TDataSource;
    ssBevel10: TssBevel;
    ssBevel11: TssBevel;
    ssBevel12: TssBevel;
    ssBevel13: TssBevel;
    ssBevel14: TssBevel;
    ssBevel15: TssBevel;
    ssBevel16: TssBevel;
    ssBevel17: TssBevel;
    ssBevel1: TssBevel;
    ssBevel2: TssBevel;
    ssBevel3: TssBevel;
    ssBevel4: TssBevel;
    ssBevel5: TssBevel;
    ssBevel6: TssBevel;
    ssBevel7: TssBevel;
    ssBevel8: TssBevel;
    ssBevel9: TssBevel;
    stCount: TssBevel;
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
    TBItem24: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBSeparatorItem5: TTBSeparatorItem;
    TBSeparatorItem6: TTBSeparatorItem;
    TBSeparatorItem7: TTBSeparatorItem;
    TBSeparatorItem8: TTBSeparatorItem;
    tsAdd: TcxTabSheet;
    tsAddInfo: TcxTabSheet;
    tsMain: TcxTabSheet;
    tsMC: TcxTabSheet;
    tsNotes: TcxTabSheet;
    tsPrice: TcxTabSheet;
    colCF1: TdxDBGridColumn;
    colCF2: TdxDBGridColumn;
    colCF3: TdxDBGridColumn;
    colCF4: TdxDBGridColumn;
    colCF5: TdxDBGridColumn;
    mdMatsCF1: TIntegerField;
    mdMatsCF2: TIntegerField;
    mdMatsCF3: TIntegerField;
    mdMatsCF4: TIntegerField;
    mdMatsCF5: TIntegerField;
    WebShopMenu: TTBSubmenuItem;
    TBSeparatorItem9: TTBSeparatorItem;

    procedure aFindAtWHExecute(Sender: TObject);
    procedure aGotoAnalogExecute(Sender: TObject);
    procedure aMatMoveExecute(Sender: TObject);
    procedure aMatRsvExecute(Sender: TObject);
    procedure aMatsColOptionsExecute(Sender: TObject);
    procedure aMatsDelExecute(Sender: TObject);
    procedure aMatsSelectAllExecute(Sender: TObject);
    procedure aMCColParamsExecute(Sender: TObject);
    procedure aMCMatInfoExecute(Sender: TObject);
    procedure aMCMatMoveExecute(Sender: TObject);
    procedure aMCMatRsvExecute(Sender: TObject);
    procedure aNewExExecute(Sender: TObject);
    procedure aNewGrpExecute(Sender: TObject);
    procedure aSelectAllExecute(Sender: TObject);
    procedure aShowArchivedExecute(Sender: TObject);
    procedure cdsMaterialsAfterOpen(DataSet: TDataSet);
    procedure cdsMaterialsBeforeOpen(DataSet: TDataSet);
    procedure cdsMaterialsCalcFields(DataSet: TDataSet);
    procedure cdsMCAfterOpen(DataSet: TDataSet);
    procedure cdsMCBeforeOpen(DataSet: TDataSet);
    procedure cdsPriceTypesAfterOpen(DataSet: TDataSet);
    procedure cdsWHouseBeforeOpen(DataSet: TDataSet);
    procedure colAvgPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colMCArtikulGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colMCMatNameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colMCRemainGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colMinReservGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colNameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPTypeExtraGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPTypeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPTypeNameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colRecNoGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure dbgMaterialsCanBandDragging(Sender: TObject; ABand: TdxTreeListBand; var Allow: Boolean);
    procedure dbgMaterialsCanHeaderDragging(Sender: TObject; AColumn: TdxTreeListColumn; var Allow: Boolean);
    procedure dbgMaterialsChangedColumnsWidth(Sender: TObject);
    procedure dbgMaterialsCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure dbgMaterialsDblClick(Sender: TObject);
    procedure dbgMaterialsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure dbgMaterialsDragEndHeader(Sender: TObject; AColumn: TdxTreeListColumn; P: TPoint; var NewPosInfo: TdxHeaderPosInfo; var Accept: Boolean);
    procedure dbgMaterialsDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure dbgMaterialsDragOverHeader(Sender: TObject; AColumn: TdxTreeListColumn; P: TPoint; var Accept: Boolean);
    procedure dbgMaterialsGetNodeDragText(Sender: TObject; Node: TdxTreeListNode; Column: TdxTreeListColumn; var AText: String);
    procedure dbgMaterialsGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure dbgMaterialsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgMaterialsMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dbgMaterialsMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure dbgMaterialsNeedAdjust(Sender: TObject);
    procedure dbgMaterialsSelectedCountChange(Sender: TObject);
    procedure dbgMaterialsStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure FrameResize(Sender: TObject);
    procedure grdMatsColumnSorting(Sender: TObject; Column: TdxDBTreeListColumn; var Allow: Boolean);
    procedure grdMatsCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure grdMatsDblClick(Sender: TObject);
    procedure grdMatsDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure grdMatsDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure grdMatsGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure grdMatsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grdMCDblClick(Sender: TObject);
    procedure grdMCGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure grdPricesColumnSorting(Sender: TObject; Column: TdxDBTreeListColumn; var Allow: Boolean);
    procedure inspMainDrawCaption(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
    procedure inspMainDrawValue(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
    procedure irNotesDrawValue(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
    procedure pcMainChange(Sender: TObject);
    procedure pmMainPopup(Sender: TObject);
    procedure srcMaterialsDelayedDataChange(Sender: TObject; Field: TField);
    procedure tsNotesShow(Sender: TObject);
    procedure webShopDelete(Sender: TObject);
    procedure webShopUpload(Sender: TObject);
    procedure webShopUploadWHState(Sender: TObject);

  private
    DocInfo: TokAddDocInfo;
    FIns: Boolean;
    DI: TDragInfo;
    FDown: Boolean;
    FromTime, ToTime: Cardinal;
    {$IFDEF GOLD}
    FGoldColors, FGoldSizes: TstringList; // index = name format
    {$ENDIF}

    procedure WMLocateID(var M: TMessage); message WM_LOCATEID;
    procedure WMOKShowModal(var M: TMessage); message WM_OK_SHOWMODAL;
    function SetNewMatParent(AID, APID: integer): integer;
    procedure GetPrices;
    procedure SavePTColumns;
    procedure AddMatToDoc;
    procedure RefreshDetail;
    procedure colPTGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);

  protected
    function GetIDForUpdate: integer; override;
    procedure SetCurrentID(const Value: integer); override;
    procedure SetGrpID(const Value: integer); override;
    procedure RebuildExportList;

  public
    WebCatNode: TapTreeNode; // when listing products belonging to specific web-category it is a pointer to node of the category. nil otherwise

    procedure DoOpen(AParam: Variant); override;
    procedure DoClose; override;
    procedure DoProperties; override;
    procedure DoGrpInsert; override;
    procedure DoDelete; override;
    procedure DoDown; override;
    procedure DoUp; override;
    procedure DoSomething; override;
    procedure DoRefresh(const AID: integer; AParam: integer = 0); override;
    procedure DoLocate(const AID: Integer; ASubID: Integer = 0); override;
    procedure SetCaptions; override;
    procedure UpdateActionList; override;
    procedure DoFind(const AFName, AStr: string; ALocateType: TLocateType; AFwd: Boolean = True); override;
    procedure DoExcel(Grid: TdxDBGrid); override;
    procedure DoDrillDown; override;
    procedure DoShow; override;
    procedure DoPatternInsert; override;
    procedure DoInsert; override;
    procedure DoAfterFind(AParam: Integer = 0); override;
    procedure SelectRecord(AHandle: HWND); override;
    procedure DoCut; override;
    procedure DoPaste; override;
    procedure DoSetFocus; override;
    procedure DoColParams; override;
    procedure DoArchive; override;
    procedure LoadSkin; override;
    procedure NotifyChanged; override;

    procedure SetParam(const Value: Integer); override;
    procedure DoShowModal; override;
  end;

var
  fmMaterials: TfmMaterials;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  EditMaterials, ClientData, prFun, prConst, ssFun, Export,
  ssCallbackConst, fMessageDlg, Progress, ssStrUtil,
  ssRegUtils, MatRsv, MatMove, Udebug,
  WebReq, MetaProduct;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

const
  _ID_ = 'MATID';
  _union_ = ' union all select -grpid, 0, cast(name as varchar(128)), cast('''' as varchar(15)),'
            + ' cast('''' as varchar(255)), 0, 0, 0.0, 0.0, 0, 0, pid, cast('''' as varchar(6)),'
            + ' cast('''' as varchar(3)), 0, 0 from matgroup where deleted=0 ';

//==============================================================================================
procedure TfmMaterials.DoClose;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.DoClose') else _udebug := nil;{$ENDIF}

  cdsMaterials.Close;

  if ModalView then begin
    if pcMain.Visible then WriteToRegInt(MainRegKey + '\' + Self.ClassName, 'pcMain.Height.Modal', pcMain.Height)
  end
  else WriteToRegInt(MainRegKey + '\' + Self.ClassName, 'pcMain.Height.Normal', pcMain.Height);

  {$IFDEF GOLD}
  FGoldColors.Free;
  FGoldSizes.Free;
  {$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.DoDelete;
  var
    id_, i: integer;
    ResetDef: boolean;
    FErr: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}

  function okToDelete: Boolean;
  begin
    Result := False;
    if ((dbgMaterials.SelectedCount = 1) and (mrYes = ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo])))
       or
       ((dbgMaterials.SelectedCount > 1)
        and (mrYes = ssMessageDlg(Format(rs('Common', 'DelConfirmEx'), [dbgMaterials.SelectedCount]), ssmtWarning, [ssmbYes, ssmbNo])))
    then Result := True;
  end;

  function isRefs(idx: Integer): Integer;
  begin
    with newDataSet do try
      ProviderName := 'pSQL';
      FetchMacros;
      Macros.ParamByName('sql').asString := 'select count(distinct wbillid) from waybilldet where matid=' + IntTostr(dbgMaterials.SelectedNodes[idx].Values[colID.Index]);
      Open;
      Result := Fields[0].AsInteger;
      Close;

      if Result > 0
        then ssMessageDlg(rs('Common', 'NoDelete') + crlf
              + Format(rs('Common', 'RefCount'), [Result, Trim(dbgMaterials.SelectedNodes[idx].Values[colName.Index])]), ssmtError, [ssmbOk]);

    finally
      Free;
    end;
  end;

begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.DoDelete') else _udebug := nil;{$ENDIF}

  if WebCatNode <> nil then begin // deleting from web category
    if okToDelete then begin
      for i := 0 to dbgMaterials.SelectedCount - 1 do begin
        WebCatNode.FindData(dbgMaterials.SelectedNodes[i].Values[colID.Index]).Delete;
      end;

      WebCatNode.SaveData(-1, False);
      DSRefresh(cdsMaterials, _ID_, 0);
    end;

    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  if (dbgMaterials.SelectedCount = 1) and (isRefs(0) > 0) then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  if okToDelete then begin
    fProgress.Show;
    with newDataSet do try
      ProviderName := 'pMat_Del';
      FetchParams;
      Application.ProcessMessages;
      fProgress.Caption := rs('Common', 'Deleting');
      fProgress.UpDate;
      fProgress.pbMain.Max := dbgMaterials.SelectedCount;

      for i := 0 to dbgMaterials.SelectedCount - 1 do begin
        try
          if (dbgMaterials.SelectedCount > 1) and (isRefs(i) > 0) then Continue;

          if DelToRecycleBin then begin
            //TrRollback;
            if not AddToRecycleBin(dmData.SConnection, Self.ClassName, dbgMaterials.SelectedNodes[i].Values[colID.Index],
                      Trim(dbgMaterials.SelectedNodes[i].Values[colName.Index]), False, Self.FunID)
            then begin
              ssMessageDlg(rs('Common', 'ErrorInsToRecycleBin'), ssmtError, [ssmbOk]);
              {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
              Exit;
            end;
          end
          else begin // permanent erase
            DeleteProduct(dbgMaterials.SelectedNodes[i].Values[colID.Index]);

            {TrStart;
            Params.ParamByName('matid').AsInteger := dbgMaterials.SelectedNodes[i].Values[colID.Index];
            Execute;
            TrCommit;
            }

          end;

        except
          on e:exception do begin
            TrRollback;

            if ShowErrorText
              then FErr := crlf + E.Message
              else FErr := '';

            if (dbgMaterials.SelectedCount = 1) then begin
              fProgress.Hide;
              ssMessageDlg(rs('Common', 'NoDelete') + FErr, ssmtError, [ssmbOk]);
              {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
              Exit;
            end
            else if mrYes <> ssMessageDlg(Format(rs('Common', 'NoDeleteEx'), [dbgMaterials.SelectedNodes[i].Values[colName.Index]]), ssmtError, [ssmbYes, ssmbNo])
              then begin
                //TrRollback;
                Break;
              end;
          end;
        end;

        fProgress.lText.Caption := VarToStr(dbgMaterials.SelectedNodes[i].Values[colName.Index]);
        fProgress.pbMain.StepIt;
        Application.ProcessMessages;
      end;

      with dbgMaterials do
        if SelectedCount > 1 then begin
 //cdsMaterials.First;
        end
        else if (FocusedNode.Index = Count - 1) and (FocusedNode.Index > 0)
          then cdsMaterials.Locate(_ID_, FocusedNode.GetPrev.Values[ColumnByFieldName(KeyField).Index], [])
          else cdsMaterials.Locate(_ID_, FocusedNode.GetNext.Values[ColumnByFieldName(KeyField).Index], []);

      if dbgMaterials.FocusedNode.Values[colType.Index] = 0 then begin
        DoRefresh(0, -1);
      //cdsMaterials.Locate(_ID_, id_, []);
      end
      else aRefresh.Execute;

      UpdateActionList;
 //if RefreshAllClients
 //   then dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_MATERIALS);

    finally
      fProgress.Hide;
      Free;
    end;

    inherited;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.DoOpen(AParam: Variant);
  var
    i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.DoOpen') else _udebug := nil;{$ENDIF}

  RefType := rtMat;
  EditingClass := TfrmEditMaterials;

  inherited;
  colID.Index := 0;

  //RebuildExportList;
  colNum.Visible := (GrpID <> 0) and not FDrillDown;

  if ModalView then begin
    if ReadFromRegInt(MainRegKey + '\' + Self.ClassName, 'pcMain.Height.Modal', i)
      then pcMain.Height := i
  end
  else if ReadFromRegInt(MainRegKey + '\' + Self.ClassName, 'pcMain.Height.Normal', i)
       then pcMain.Height := i;

  {$IFDEF GOLD}
  FGoldColors := TStringList.Create;
  FGoldSizes := TStringList.Create;

  with newDataSet do
    try
      ProviderName := 'pCT_Tree_Get';
      FetchParams;
      Params.ParamByName('ownertype').asInteger := cfOwnerTypeProduct;
      Params.ParamByName('treeid').asInteger := 1;
      Open;
      while not eof do begin
        FGoldColors.Add(FieldByName('id').AsString + '=' + FieldByName('name').AsString);
        Next;
      end;
      Close;

      Params.ParamByName('treeid').asInteger := 2;
      Open;
      while not eof do begin
        FGoldSizes.Add(FieldByName('id').AsString + '=' + FieldByName('name').AsString);
        Next;
      end;
      Close;

    finally
      Free;
    end;
  {$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.SetCaptions;
  var
    FTitle, FMat, FMatGroup: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    Self.Caption := GetRS(Self.Name, 'TitleMaterials');

    FTitle := Self.Caption;
    FMat := GetRS(Self.Name, 'Mat');
    FMatGroup := GetRS(Self.Name, 'MatGroupR');

    aFindAtWH.Caption := GetRS('fmWaybill', 'FindAtWH') + '...';
    aGotoAnalog.Caption := GetRS('fmMaterials', 'GotoAnalog');
    aMatMove.Caption := GetRS('fmWaybill', 'MoveInfo');
    aMatRsv.Caption := GetRS('fmWaybill', 'RsvInfo');
    aMatsColOptions.Caption := GetRS('Common', 'ColOptions') + '...';
    aMatsDel.Caption := GetRS('Common', 'Del');
    aMatsSelectAll.Caption := GetRS('Common', 'SelectAll');
    aMCColParams.Caption := GetRS('Common', 'ColOptions') + '...';
    aMCMatInfo.Caption := GetRS('fmWaybill', 'MatInfo');
    aMCMatMove.Caption := GetRS('fmWaybill', 'MoveInfo');
    aMCMatRsv.Caption := GetRS('fmWaybill', 'RsvInfo');
    aShowArchived.Caption := GetRS('fmMaterials', 'ShowArchivedMats');

    colAmount.Caption := GetRS('fmWaybill', 'Amount');
    colArtikul.Caption := GetRS(Self.Name, 'Artikul');
    colAVgPrice.Caption := GetRS(Self.Name, 'avgPrice');
    colBarCode.Caption := GetRS(Self.Name, 'BarCode');
    colCountry.Caption := GetRS(Self.Name, 'Country');
    colCurrName.Caption := GetRS(Self.Name, 'Currency');
    colMatArtikul.Caption := GetRS(Self.Name, 'Artikul');
    colMatName.Caption := GetRS('fmMaterials', 'Name');
    colMeasure.Caption := GetRS(Self.Name, 'Measure');
    colMinReserv.Caption := GetRS(Self.Name, 'MinReserv');
    colMSize.Caption := GetRS(Self.Name, 'Size');
    colName.Caption := GetRS(Self.Name, 'Name');
    colNotes.Caption := GetRS(Self.Name, 'Notes');
    colNum.Caption := GetRS('Common', 'Num');
    colProducer.Caption := GetRS(Self.Name, 'Producer');
    colType.Caption := '';
    colWeight.Caption := GetRS(Self.Name, 'Weight');

    colMCArtikul.Caption := colArtikul.Caption;
    colMCBarCode.Caption := colBarCode.Caption;
    colMCCountry.Caption := colCountry.Caption;
    colMCGrpName.Caption := GetRS('fmMaterials', 'MatGroup');
    colMCMatName.Caption := GetRS(Self.Name, 'MCName');
    colMCMsrName.Caption := GetRS(Self.Name, 'Measure');
    colMCNotes.Caption := GetRS(Self.Name, 'Notes');
    colMCProducer.Caption := colProducer.Caption;
    colMCRemain.Caption := GetRS('fmWMat', 'FreeAtWh');

    colPType.Caption := GetRS('fmPriceTypes', 'Type');
    colPTypeExtra.Caption := GetRS(Self.Name, 'ExtraDiscPrice');
    colPTypeName.Caption := GetRS(Self.Name, 'PriceType');

    irArtikul.Caption := GetRS(Self.Name, 'Artikul');
    irBarCode.Caption := GetRS(Self.Name, 'BarCode');
    irCountry.Caption := GetRS(Self.Name, 'Country');
    irDemandCat.Caption := GetRS(Self.Name, 'DemandCat');
    irMatGroup.Caption := GetRS(Self.Name, 'MatGroup');
    irMeasure.Caption := GetRS(Self.Name, 'Measure');
    irMinReserv.Caption := GetRS(Self.Name, 'MinReserv');
    irName.Caption := GetRS(Self.Name, 'Name');
    irProducer.Caption := GetRS(Self.Name, 'Producer');
    irSize.Caption := GetRS(Self.Name, 'Size');
    irWeight.Caption := GetRS(Self.Name, 'Weight');
    irWH.Caption := GetRS(Self.Name, 'DefWHouse');

    lCount.Caption := GetRS(Self.Name, 'TotalMat') + ':';

    tsAdd.Caption := ' ' + GetRS('fmMaterials', 'MatList') + ' ';
    tsAddInfo.Caption := GetRS(Self.Name, 'AddInfoEx');
    tsMain.Caption := GetRS(Self.Name, 'MainInfoEx');
    tsMC.Caption := GetRS(Self.Name, 'MatChange');
    tsNotes.Caption := GetRS(Self.Name, 'Notes') + ' ';
    tsPrice.Caption := GetRS(Self.Name, 'PageCena');

    WebShopMenu.Caption := GetRS('Common', 'WebShops');

    SendMessage(ParentHandle, WM_SETPARENTCAPTION, integer(@FTitle), 0);
    SendMessage(ParentHandle, WM_SETNEWCAPTION, integer(@FMat), integer(@FMatGroup));

    FindList.Clear;
    FindList.AddObject(GetRS(Self.Name, 'NameD') + ';' + 'name', pointer(1));
    FindList.AddObject(GetRS(Self.Name, 'ArtikulD') + ';' + 'artikul', pointer(2));
    FindList.AddObject(GetRS(Self.Name, 'BarCodeD') + ';' + 'barcode', pointer(3));

    DoRefreshFindParams;

    aSelectAll.Caption := GetRS('Common', 'SelectAll');

    aNew.Caption := GetRS('Common', 'Add');
    aNewGrp.Caption := GetRS(Self.Name, 'MatGroupR');
    aNewEx.Caption := GetRS('Common', 'Add');

    {$IFDEF GOLD}
    colCF1.Caption := 'Color';
    colCF1.Visible := True;
    colCF1.Tag := 1;
    colCF2.Caption := 'Size';
    colCF2.Visible := True;
    colCF2.Tag := 1;
    {$ENDIF}
  end;

  inherited;
  colType.Index := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.dbgMaterialsDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.dbgMaterialsDblClick') else _udebug := nil;{$ENDIF}

  with dbgMaterials do begin
    if FocusedNode.Values[colType.Index] = 1 then begin
      if cdsMaterials.FieldByName('archived').AsInteger <> 0 then begin
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;

      if Count > 0 then begin
        if ModalView then begin
          if Param = 0 then begin
            FCurrentID := cdsMaterials.FieldByName('matid').AsInteger;
            SendMessage(ParentHandle, WM_SELECTITEM, 0, 0);
          end
          else AddMatToDoc;
        end //if ModalView
        else if aProperties.Enabled then DoProperties;
      end;
    end // if FocusedNode.Values[colType.Index] = 1
    else begin
      GrpID := -FocusedNode.Values[colID.Index];
      DoDown;
      SendMessage(ParentHandle, WM_SETTREEITEM, GrpID, 0);
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.UpdateActionList;
  var
    limited: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.UpdateActionList') else _udebug := nil;{$ENDIF}

  {$IFDEF LIMITED}
    limited := (cdsMaterials.Active and (cdsMaterials.recordCount >= limitProductsCount));
  {$ELSE}
    limited := False;
  {$ENDIF}

  aNew.Enabled := not limited;
  aPatternInsert.Enabled := not limited;

  aProperties.Enabled := not cdsMaterials.IsEmpty and (dbgMaterials.SelectedCount > 0);
  aDel.Enabled := not cdsMaterials.IsEmpty;
  aDrillDown.Enabled := True;

  aMatsDel.Enabled := grdMats.SelectedCount > 0;

  if (mdMats.IsEmpty and (Param > 0))
    then FCurrentID := -1
    else FCurrentID := 1;

  inherited;

  aCut.Visible := dbgMaterials.SelectedCount > 0;
  aPaste.Visible := (not limited) and (Clipboard.AsText <> '') and colNum.Visible;
  aPaste.Enabled := (not limited) and aPaste.Visible;
  aCut.Enabled := aCut.Visible;
  sepClip.Visible := aCut.Visible or aPaste.Visible;

  aGotoAnalog.Enabled := not cdsMC.IsEmpty;
  aFindAtWH.Enabled := (dbgMaterials.Count > 0);
  aArchive.Enabled := (not limited) and aProperties.Enabled;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.DoRefresh(const AID: integer; AParam: integer = 0);
  var
    FLastIndex: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.DoRefresh(' + IntToStr(AID) + ', ' + IntToStr(Aparam) + ')') else _udebug := nil;{$ENDIF}

  if colNum.Font.Name <> 'Small Fonts' then colNum.Font.Name := 'Small Fonts';
  if colNum.Font.Size <> 7 then colNum.Font.Size := 7;
  
  FLastIndex := dbgMaterials.TopIndex;
  cdsMaterials.DisableControls;
  if AParam <> 0 then WebCatNode := nil;

  case AParam of
    -2: begin
          WebCatNode := TapTreeNode(AID);
          DSRefresh(cdsMaterials, _ID_, 0);
        end;

    -1: begin
          GrpID := AID;
          SendMessage(ParentHandle, WM_SETTREEITEM, PGrpInfo(pointer(AID))^.ID, PGrpInfo(pointer(AID))^.PID);
          DSRefresh(cdsMaterials, _ID_, 0);
        end;

    0: begin
         DSRefresh(cdsMaterials, _ID_, AID);
       end;

    1: begin
         GrpID := AID;
         DSRefresh(cdsMaterials, _ID_, 0);
       end;

    2: begin
         GrpID := 0;
         DSRefresh(cdsMaterials, _ID_, 0);
       end;

    3: begin
         GrpID := -1;
         DSRefresh(cdsMaterials, _ID_, 0);
       end;

    else begin
      if GrpID <> AParam - 10 then begin
        GrpID := AParam - 10;
        SendMessage(ParentHandle, WM_SETTREEITEM, GrpID, -1);
      end;

      DSRefresh(cdsMaterials, _ID_, AID);
    end;
  end; // case AParam

  dbgMaterials.TopIndex := FLastIndex;
  cdsMaterials.EnableControls;

  UpdateActionList;

  with dbgMaterials do begin
    ClearSelection;
    if FocusedNode <> nil then FocusedNode.Selected := True;
  end;
  dbgMaterials.Update;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmMaterials.GetIDForUpdate: integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.GetIDForUpdate') else _udebug := nil;{$ENDIF}

  Result := cdsMaterials.fieldbyname(_ID_).AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.dbgMaterialsCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.dbgMaterialsCustomDrawCell') else _udebug := nil;{$ENDIF}

  try // except : AP: debug off as it is true cosmetics
    if UseGridOddColor and not ASelected and Odd(ANode.AbsoluteIndex)
      then AColor := GridOddLinesColor;

    if Sender = dbgMaterials then begin
      if (ANode.Values[colArchived.Index] = 1) and not ASelected
        then AFont.Color := clBtnShadow;

      {$IFDEF GOLD}
      try // in case of empty fields
        if AColumn = colCF1
          then Atext := FGoldColors.Values[ANode.Values[colCF1.Index]]
        else if AColumn = colCF2
          then Atext := FGoldSizes.Values[ANode.Values[colCF2.Index]];
      except
      end;
      {$ENDIF}
    end; // if Sender = dbgMaterials

  except
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.irNotesDrawValue(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.irNotesDrawValue') else _udebug := nil;{$ENDIF}

  AText := cdsMaterials.fieldbyname('notes').AsString;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.cdsMaterialsBeforeOpen(DataSet: TDataSet);
  var
    m: string;
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.cdsMaterialsBeforeOpen') else _udebug := nil;{$ENDIF}

  if MatShowPrices and not cdsPriceTypes.Active then cdsPriceTypes.Open;

  FromTime := GetTickCount;
  m := '';

  if MatShowPrices and (WebCatNode = nil) // for product from web category listing do not show prices as it is unnecessary and cumbersome to retrieve
    then cdsMaterials.ProviderName := 'pMaterials_ListEx'
    else cdsMaterials.ProviderName := 'pMaterials_list';

  cdsMaterials.FetchParams;
  cdsMaterials.FetchMacros;

  if WebCatNode <> nil then begin
    WebCatNode.LoadData(-1, False); // happily, it will not try to reload this node's data in future

    for i := 0 to WebCatNode.DataCount - 1 do
      if not WebCatNode.Data[i].isDeleted and (WebCatNode.Data[i].OwnerID > 0) and WebCatNode.Data[i].asBoolean // product and ready to go to web
        then m := m + IntToStr(WebCatNode.Data[i].OwnerID) + ',';

    if m <> '' then begin
      setlength(m, length(m) - 1); // strip last comma
      m := ' and m.matid in (' + m + ') ';
    end
    else m := ' and m.matid = -1'; // no (enabled) products for this category - empty list
  end // if WebCatNode <> nil

  else case GrpID of
    0: m := '';

    else begin
      if MatShowPrices then begin
        if FDrillDown
          then m := m + GetDrillDownList(dmData.SConnection, 'matgroup', 'grpid', 'pid', GrpID)
          else m := m + IntToStr(GrpID);
      end

      else begin
        if FDrillDown
          then m := m + ' and m.grpid in (' + GetDrillDownList(dmData.SConnection, 'matgroup', 'grpid', 'pid', GrpID) + ') '
          else m := m + ' and m.grpid=' + IntToStr(GrpID);

        if not aShowArchived.Checked
          then m := m + ' and m.archived=0';
      end;
    end; // case else
  end; // case

  if MatShowPrices and (WebCatNode = nil) then begin
    cdsMaterials.Params.ParamByName('grp').AsString := m;
    cdsMaterials.Params.ParamByName('getprices').AsInteger := 1;
    cdsMaterials.Params.ParamByName('getarchived').AsInteger := Integer(aShowArchived.Checked);
  end
  else cdsMaterials.Macros.ParamByName('grp').AsString := m;

  colNum.Visible := (GrpID <> 0) and not FDrillDown;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.DoDown;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.DoDown') else _udebug := nil;{$ENDIF}

  aRefresh.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.DoUp;
  var
   id_: integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.DoUp') else _udebug := nil;{$ENDIF}

  id_ := GrpID;
  if GrpID > 0 then
    with newDataSet do
      try
        ProviderName := 'pMatGroup_Get';
        FetchParams;
        Params.ParamByName('grpid').AsInteger := GrpID;
        Open;

        if fieldbyname('pid').AsInteger=GrpID
          then GrpID := 0
          else GrpID := fieldbyname('pid').AsInteger;

        Close;
        //aRefresh.Execute;
    //cdsMaterials.Locate(_ID_, -id_, []);
        
      finally
        Free;
      end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.aNewExExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.aNewExExecute') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmMaterials.aNewGrpExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.aNewGrpExecute') else _udebug := nil;{$ENDIF}

  with TfrmEditMaterials.Create(nil) do
    try
      MainHandle := Self.Handle;
      ParentNameEx := 'fmMaterials';
      OnDate := Self.OnDate;
      GrpID := Self.GrpID;
      cbType.ItemIndex := 1;
      cbType.Enabled := False;

      ID := 0;

      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.inspMainDrawCaption(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.inspMainDrawCaption') else _udebug := nil;{$ENDIF}

  if UseGridOddColor and Odd(Sender.Node.AbsoluteIndex)
    then AColor := GridOddLinesColor
    else AColor := clWindow;

  AFont.Color := clWindowText;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.DoGrpInsert;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.DoGrpInsert') else _udebug := nil;{$ENDIF}

  aNewGrp.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.dbgMaterialsGetNodeDragText(Sender: TObject; Node: TdxTreeListNode; Column: TdxTreeListColumn; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.dbgMaterialsGetNodeDragText') else _udebug := nil;{$ENDIF}

  if dbgMaterials.SelectedCount = 1
    then AText := Node.Values[colName.Index]
    else AText := IntToStr(dbgMaterials.SelectedCount) + ' ' + rs(Self.Name, 'MatREx');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.dbgMaterialsCanBandDragging(Sender: TObject; ABand: TdxTreeListBand; var Allow: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.dbgMaterialsCanBandDragging') else _udebug := nil;{$ENDIF}

  Allow := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.dbgMaterialsCanHeaderDragging(Sender: TObject; AColumn: TdxTreeListColumn; var Allow: Boolean);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.dbgMaterialsCanHeaderDragging') else _udebug := nil;{$ENDIF}
  Allow := (AColumn = colName) or (AColumn = colArtikul);
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmMaterials.dbgMaterialsStartDrag(Sender: TObject; var DragObject: TDragObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.dbgMaterialsStartDrag') else _udebug := nil;{$ENDIF}

  DI.ID := dbgMaterials.FocusedNode.Values[colID.Index];
  DI.GrpID := GrpID;

  if dbgMaterials.SelectedCount = 1
    then DI.Name := dbgMaterials.FocusedNode.Values[colName.Index]
    else DI.Name := IntToStr(dbgMaterials.SelectedCount) + ' ' + rs(Self.Name, 'MatREx');

  DI.IsGrp := trunc(abs(dbgMaterials.FocusedNode.Values[colType.Index]-1));
  DI.Num := dbgMaterials.FocusedNode.Values[colNum.Index];
  DI.Sender := dbgMaterials;
  dbgMaterials.Tag := Integer(@DI);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.WMLocateID(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.WMLocateID') else _udebug := nil;{$ENDIF}

  cdsMaterials.Locate(_ID_, M.WParam, []);
  with dbgMaterials do begin
    ClearSelection;
    FocusedNode.Selected := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.cdsMaterialsAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.cdsMaterialsAfterOpen') else _udebug := nil;{$ENDIF}

  DSRefresh(cdsMatGroup, 'grpid', 0);
  DSRefresh(cdsWHouse, 'wid', 0);
  stCount.Caption := IntToStr(cdsMaterials.RecordCount);
  ToTime := GetTickCount;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.DoProperties;
  var
    i: Integer;
    tmpStr: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.DoProperties') else _udebug := nil;{$ENDIF}

  if dbgMaterials.FocusedNode.Values[colType.Index] = 0 then begin
    {with TfrmMatGroupEdit.Create(nil) do
       try
         MainHandle := Self.Handle;
         ParentNameEx := 'TfmMatGroup';
         OnDate := Self.OnDate;
         SourceID := -1;
         ID := -cdsMaterials.fieldbyname('matid').AsInteger;
         ShowModal;
       finally
         Free;
       end;
    }
  end

  else
    with TfrmEditMaterials.Create(nil) do
    try
      GrpID := Self.GrpID;
      MainHandle := Self.Handle;
      ParentNameEx := Self.Name;
      OnDate := Self.OnDate;
      ID := GetIDForUpdate;

      if dbgMaterials.SelectedCount > 1 then begin
        tmpStr := '';

        for i := 0 to dbgMaterials.SelectedCount - 1 do
          tmpStr := tmpStr + VarToStr(dbgMaterials.SelectedNodes[i].Values[Self.colID.Index]) + ',';

        if tmpStr <> '' then System.Delete(tmpStr, Length(tmpStr), 1);

        IDs := tmpStr;
      end;

      if ShowModal = mrOk then dbgMaterials.SetFocus;

      UpdateActionList;
      
    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.DoFind(const AFName, AStr: string; ALocateType: TLocateType; AFwd: Boolean = True);
  var
    FNode: TdxTreeListNode;
    s, FChar: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.DoFind') else _udebug := nil;{$ENDIF}

  inherited;

  if GrpID = 0 then begin
    SearchInfo.Failed := False;

    if FindStr <> AStr then begin
      if FilterOnSearch then begin
       case ALocateType of
         ltSubstr: FChar := '%';

         else FChar := '';
       end;

       if AStr = ''
         then cdsMaterials.Filter := ''
         else begin
           if cdsMaterials.FieldByName(AFName) is TDateTimeField
             then cdsMaterials.Filter := ''
             else cdsMaterials.Filter := AFName + ' like ''' + FChar + AStr + '%''';
         end;
       cdsMaterials.Filtered := True;
      end;
      //else cdsMain.Filtered := True;
      FindIndex := -1;
    end;

    FindStr := AStr;
    if AStr = '' then begin
      if FilterOnSearch then cdsMaterials.Filtered := False;
      SearchInfo.PrevFindStr := '';
      DoRefreshFindParams;
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    FNode := FindNode(dbgMaterials, AFName, AStr, ALocateType, FindIndex, AFwd);
    if FNode <> nil then begin
      FindIndex := FNode.Index;
      dbgMaterials.ClearSelection;
      dbgMaterials.TopIndex := FNode.AbsoluteIndex;
      dbgMaterials.FocusedAbsoluteIndex := FNode.AbsoluteIndex;
      FNode.Focused := True;

      if dbgMaterials.FocusedNode <> nil then dbgMaterials.FocusedNode.Selected := True;

      SearchInfo.PrevFindStr := FindStr;
     end
     else begin
       SearchInfo.Failed := True;
       if FilterOnSearch then cdsMaterials.Filtered := False;
       SendMessage(ParentHandle, WM_SEARCHFAILED, 0, 0);
   //ssMessageDlg(rs('Common', 'FindError') + ', ' + rs('Common', 'DSEnd'), ssmtInformation, [ssmbOk]);
     end;
  end
  else begin
     if FindStr<>AStr then begin
      cdsFind.Close;
      s := 'select matid, grpid, upper(' + AFName + ') from materials where upper('+AFName+')';

      case ALocateType of
       ltBegin:  s := s + ' like ''' + QuotedStrEx(AnsiUpperCaseEx(AStr), '''') + '%''';
       ltFull:   s := s + '=''' + QuotedStrEx(AnsiUpperCaseEx(AStr), '''') + '''';
       ltSubstr: s := s + ' like ''%' + QuotedStrEx(AnsiUpperCaseEx(AStr), '''') + '%''';
      end;

      s := s + ' order by 3';
      cdsFind.Macros.ParamByName('sql').AsString := s;
      cdsFind.Open;
     end;

     FindStr := AStr;

     if AStr = '' then begin
       cdsMaterials.Filter := '';
       if FilterOnSearch then cdsMaterials.Filtered := True;
       SearchInfo.PrevFindStr := '';
       DoRefreshFindParams;
       stCount.Caption := IntToStr(cdsMaterials.RecordCount);
       {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
       Exit;
     end;

     if not cdsFind.Eof then begin
       if (GrpID=0) or (GrpID=cdsFind.FieldByName('grpid').AsInteger) then begin
        if not cdsMaterials.Locate('matid', cdsFind.fieldbyname('matid').AsInteger, [])
          then DSRefresh(cdsMaterials, 'matid', cdsFind.fieldbyname('matid').AsInteger);
       end
       else begin
         GrpID := cdsFind.FieldByName('grpid').AsInteger;
         SendMessage(ParentHandle, WM_SETTREEITEM, GrpID, 0);
         DSRefresh(cdsMaterials, 'matid', cdsFind.fieldbyname('matid').AsInteger);
       end;

       if FilterOnSearch then begin
         case ALocateType of
           ltSubstr: FChar := '%';
           else FChar := '';
         end;

         if AStr = ''
           then cdsMaterials.Filter := ''
           else cdsMaterials.Filter := AFName + ' like ''' + FChar + AStr + '%''';
         cdsMaterials.Filtered := True;
       end
       else cdsMaterials.Filtered := True;

       stCount.Caption := IntToStr(cdsMaterials.RecordCount);

       cdsMaterials.Locate('matid', cdsFind.fieldbyname('matid').AsInteger, []);
       dbgMaterials.ClearSelection;
       if dbgMaterials.FocusedNode <> nil then dbgMaterials.FocusedNode.Selected := True;
       cdsFind.Next;
       SearchInfo.PrevFindStr := FindStr;
     end
     else begin
       SearchInfo.Failed := True;
       if FilterOnSearch then cdsMaterials.Filtered := False;
       SendMessage(ParentHandle, WM_SEARCHFAILED, 0, 0);
   //ssMessageDlg(rs('Common', 'FindError') + ', ' + rs('Common', 'DSEnd'), ssmtInformation, [ssmbOk]);
     end;
  end;
  DoRefreshFindParams;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.DoExcel(Grid: TdxDBGrid);
  var
    FShowExcel: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.DoExcel') else _udebug := nil;{$ENDIF}

  inherited;

  with TfrmExport.Create(nil) do
    try
      if cdsFunc.Locate('classname', Self.ClassName, [])
        then FunID := cdsFunc.fieldbyname('funid').AsInteger
        else FunID := 0;

      grdExp := dbgMaterials;
      lName.Caption := Self.Caption;
      FList := ExportList;

      if ShowModal <> mrOk then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

      FShowExcel := chbShowExcel.Checked;
    finally
      Free;
    end;

  ExportToExcel(dbgMaterials, ExportList, FShowExcel);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.FrameResize(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.FrameResize') else _udebug := nil;{$ENDIF}

  inherited;
  AdjustGrid(dbgMaterials, colName);
  grdMats.Adjust(nil, [colRecNo]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.DoDrillDown;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.DoDrillDown') else _udebug := nil;{$ENDIF}


  inherited;

  DoRefresh(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.SetCurrentID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.SetCurrentID') else _udebug := nil;{$ENDIF}

  inherited;
  if cdsMaterials.Active then begin
    dbgMaterials.ClearSelection;
    cdsMaterials.Locate(_ID_, Value, []);

    with dbgMaterials do
      if FocusedNode <> nil
        then FocusedNode.Selected := True; 
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.DoSomething;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.DoSomething') else _udebug := nil;{$ENDIF}

  inherited;
  pcMain.Visible := False;
  splMain.Visible := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.DoShow;
  var
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
    mi: TTBItem;
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.DoShow') else _udebug := nil;{$ENDIF}

  inherited;
  UpdateActionList;
  pcMain.ActivePageIndex := 0;

  WebShopMenu.Clear;
  with newDataSet do try
    ProviderName := 'pWebShops_List';
    Open;
    while not eof do begin
      // adding upload prods item
      mi := TTBItem.Create(pmMain);
      mi.Caption := rs('Common', 'UploadTo') + ' ' + FieldByName('name').asString;
      mi.Tag := FieldByName('id').asInteger;
      mi.OnClick := webShopUpload;
      WebShopMenu.Add(mi);

      // adding upload WH state
      mi := TTBItem.Create(pmMain);
      mi.Caption := rs('fmWebShops', 'UploadWHState') + ' ' + FieldByName('name').asString;
      mi.Tag := FieldByName('id').asInteger;
      mi.OnClick := webShopUploadWHState;
      WebShopMenu.Add(mi);

      // adding delete mat
      mi := TTBItem.Create(pmMain);
      mi.Caption := rs('Common', 'DelFrom') + ' ' + FieldByName('name').asString;
      mi.Tag := FieldByName('id').asInteger;
      mi.OnClick := webShopDelete;
      WebShopMenu.Add(mi);

      Next;
    end;

    Close;

  finally
    Free;
  end;

  WebShopMenu.Visible := (WebShopMenu.Count > 0);

  Application.ProcessMessages;
  DoRefresh(0);

  with dbgMaterials do
    if FocusedNode <> nil
      then FocusedNode.Selected := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.DoInsert;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.DoInsert') else _udebug := nil;{$ENDIF}

  with TfrmEditMaterials.Create(nil) do
   try
     GrpID := Self.GrpID;
     MainHandle := Self.Handle;
     ParentNameEx := Self.Name;
     OnDate := Self.OnDate;

     cbType.ItemIndex := 0; // default is product editing mode
     cbType.Enabled := True;

     ID := 0;
     if ShowModal = mrOk then dbgMaterials.SetFocus;
     UpdateActionList;

   finally
     Free;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.dbgMaterialsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.dbgMaterialsKeyDown') else _udebug := nil;{$ENDIF}

  if not FIns and (Key = 13) then begin
     dbgMaterialsDblClick(dbgMaterials);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.SetGrpID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.SetGrpID') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.cdsMaterialsCalcFields(DataSet: TDataSet);
 {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.cdsMaterialsCalcFields') else _udebug := nil;{$ENDIF}

  with cdsMaterials do begin
    FieldByName('numex').AsInteger := RecNo;
    if WebCatNode = nil then CalcPriceFields(TDataSet(cdsMaterials), TDataSet(cdsPriceTypes));
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.dbgMaterialsDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
  var
    FNode: TdxTreeListNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.dbgMaterialsDragOver') else _udebug := nil;{$ENDIF}

  if Source = dbgMaterials then begin
    FNode := dbgMaterials.GetNodeAt(X, Y);
    Accept := (FNode <> nil) and (FNode.Values[colID.Index] <> DI.ID) and colNum.Visible;
  end
  else if Source = grdMats
       then Accept := True
       else Accept := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.dbgMaterialsDragDrop(Sender, Source: TObject; X, Y: Integer);
  var
    FNode: TdxTreeListNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.dbgMaterialsDragDrop') else _udebug := nil;{$ENDIF}

  if Source = dbgMaterials then begin
    FNode := dbgMaterials.GetNodeAt(X, Y);
    Screen.Cursor := crSQLWait;

    with newDataSet do
     try
       TrStart;

       try
         ProviderName := 'pMaterials_UpdNum';
         FetchParams;
         Params.ParamByName('matid').AsInteger := DI.ID;
         Params.ParamByName('num').AsInteger := -1;
         Execute;

         if DI.Num > FNode.Values[colNum.Index]
           then ProviderName := 'pMaterials_UpdNumUp'
           else ProviderName := 'pMaterials_UpdNumDown';

         FetchParams;
         Params.ParamByName('grpid').AsInteger := GrpID;
         Params.ParamByName('num').AsInteger := FNode.Values[colRealNum.Index];
         Execute;

         ProviderName := 'pMaterials_UpdNum';
         FetchParams;
         Params.ParamByName('matid').AsInteger := DI.ID;
         Params.ParamByName('num').AsInteger := FNode.Values[colRealNum.Index];
         Execute;

         TrCommit;
         aRefresh.Execute;

       except
         TrRollback;
         raise;
       end;

     finally
       Free;
       Screen.Cursor := crDefault;
     end;
   end
   else begin
     aMatsDel.Execute;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.dbgMaterialsChangedColumnsWidth(Sender: TObject);
  (*var
    AStyle: Integer;
    Offset: Integer;
    BandWidth: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.dbgMaterialsChangedColumnsWidth') else _udebug := nil;{$ENDIF}

  AStyle := GetWindowLong(dbgMaterials.Handle, GWL_STYLE);
  if AStyle and WS_VSCROLL = WS_VSCROLL then Offset := 19
    else Offset := 2;
  BandWidth := dbgMaterials.Width - Offset - colType.Width - colMeasure.Width;
  if colNum.Visible then BandWidth := BandWidth - colNum.Width;
  if BandWidth - colName.Width < 20 then begin
    colArtikul.Width := 20;
    colName.Width := BandWidth - 20;
  end
  else if colName.Width < 20 then begin
    colName.Width := 20;
    colArtikul.Width := BandWidth - 20;
  end
  else colArtikul.Width := BandWidth - colName.Width;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmMaterials.dbgMaterialsDragOverHeader(Sender: TObject; AColumn: TdxTreeListColumn; P: TPoint; var Accept: Boolean);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.dbgMaterialsDragOverHeader') else _udebug := nil;{$ENDIF}

  Accept := (
             (AColumn = colName) and (dbgMaterials.GetHeaderColumnAt(P.X, P.Y) = colArtikul)
            ) or
            (
             (AColumn = colArtikul) and (dbgMaterials.GetHeaderColumnAt(P.X, P.Y) = colName)
            );

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmMaterials.dbgMaterialsDragEndHeader(Sender: TObject; AColumn: TdxTreeListColumn; P: TPoint; var NewPosInfo: TdxHeaderPosInfo; var Accept: Boolean);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.dbgMaterialsDragEndHeader') else _udebug := nil;{$ENDIF}

  Accept := (
             (AColumn = colName) and (dbgMaterials.GetHeaderColumnAt(P.X, P.Y) = colArtikul)
            ) or
            (
             (AColumn = colArtikul) and (dbgMaterials.GetHeaderColumnAt(P.X, P.Y) = colName)
            );

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmMaterials.DoAfterFind(AParam: Integer = 0);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.DoAfterFind') else _udebug := nil;{$ENDIF}

  inherited;

  if ModalView
    then dbgMaterialsDblClick(dbgMaterials)
    else dbgMaterials.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.SelectRecord(AHandle: HWND);
  var
    FMatInfo: TNewRecordInfo;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.SelectRecord') else _udebug := nil;{$ENDIF}

  inherited;
  FMatInfo.ID := CurrentID;
  FMatInfo.Name := cdsMaterials.FieldByName('name').AsString;
  FMatInfo.Notes := cdsMaterials.FieldByName('artikul').AsString;
  FMatInfo.Str1 := cdsMaterials.FieldByName('shortname').AsString;
  FMatInfo.Int1 := cdsMaterials.FieldByName('wid').AsInteger;

  SendMessage(AHandle, WM_RECORDCHANGED, Integer(@FMatInfo), Integer(RefType));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.DoPatternInsert;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.DoPatternInsert') else _udebug := nil;{$ENDIF}

  with TfrmEditMaterials.Create(nil) do
    try
      GrpID := Self.GrpID;
      MainHandle := Self.Handle;
      ParentNameEx := Self.Name;
      OnDate := Self.OnDate;
      IsPattern := True;
      ID := GetIDForUpdate;
      if ShowModal = mrOk then dbgMaterials.SetFocus;
      UpdateActionList;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.dbgMaterialsSelectedCountChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.dbgMaterialsSelectedCountChange') else _udebug := nil;{$ENDIF}

  UpdateActionList;

  {with dbgMaterials do
    if SelectedCount > 1
      then OptionsView := OptionsView + [edgoHideFocusRect]
      else OptionsView := OptionsView - [edgoHideFocusRect];
  }

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.dbgMaterialsMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.dbgMaterialsMouseDown') else _udebug := nil;{$ENDIF}

  FDown := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.dbgMaterialsMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.dbgMaterialsMouseUp') else _udebug := nil;{$ENDIF}

  FDown := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.DoCut;
  var
    i: Integer;
    strClip: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.DoCut') else _udebug := nil;{$ENDIF}

  inherited;

  with Clipboard do begin
    Open;
    Clear;
    strClip := ClipText + 'mat:';
    for i := 0 to dbgMaterials.SelectedCount - 1 do begin
      strClip := strClip + VarToStr(dbgMaterials.SelectedNodes[i].Values[colID.Index]) + ';'
    end;
    Delete(strClip, Length(strClip), 1);
    SetTextBuf(PChar(strClip));
    Close;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.DoPaste;
  var
    strClip: string;
    i, FCount, FID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.DoPaste') else _udebug := nil;{$ENDIF}

  inherited;

  if tsAdd.TabVisible then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with Clipboard do begin
    strClip := AsText;
    if Pos(ClipText + 'mat:', strClip) <> 1 then begin
      ssMessageDlg(rs('Common', 'ClipboardError'), ssmtError, [ssmbOk]);
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;
  end;

  Delete(strClip, 1, Length(ClipText + 'mat:'));
  FCount := WordCount(strClip, [';']);
  fProgress.Caption := rs('Common', 'Moving');
  fProgress.pbMain.Max := FCount;

  try
    fProgress.Show;
    fProgress.Update;
    for i := 1 to FCount do begin
      FID := StrToInt(ExtractWord(i, strClip, [';']));

      if WebCatNode <> nil then begin
        WebCatNode.FindData(FID, -1, True).asBoolean := True; // autocreating if necessary
      end
      else begin
        if SetNewMatParent(FID, GrpID) <> 0 then begin
          ssMessageDlg('Error!', ssmtError, [ssmbOk]);
          {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
          Exit;
        end;
      end;

      fProgress.pbMain.StepIt;

      if WebCatNode <> nil then WebCatNode.SaveData(-1, False);
      aRefresh.Execute;
      //DoRefresh(FID);

      Application.ProcessMessages;
    end;

  finally
    fProgress.Hide;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmMaterials.SetNewMatParent(AID, APID: integer): integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.SetNewMatParent') else _udebug := nil;{$ENDIF}

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

//==============================================================================================
procedure TfmMaterials.aSelectAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.aSelectAllExecute') else _udebug := nil;{$ENDIF}

  dbgMaterials.SelectAll;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.colNameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.colNameGetText') else _udebug := nil;{$ENDIF}

  //AText := ' ' + AText; // AP: this is looping in debug.

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.DoSetFocus;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.DoSetFocus') else _udebug := nil;{$ENDIF}

  if dbgMaterials.Visible then dbgMaterials.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.tsNotesShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.tsNotesShow') else _udebug := nil;{$ENDIF}

  memNotes.Width := tsNotes.Width - 20;
  memNotes.Height := tsNotes.Height + 2;
  tsNotes.Color := clWindow;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.inspMainDrawValue(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.inspMainDrawValue') else _udebug := nil;{$ENDIF}

  if UseGridOddColor and Odd(Sender.Node.AbsoluteIndex)
    then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.GetPrices;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.GetPrices') else _udebug := nil;{$ENDIF}

  mdPrices.Close;
  mdPrices.Open;
  Screen.Cursor := crSQLWait;

  with newDataSet do
    try
      ProviderName := 'pPriceTypes_List';
      Open;

      while not Eof do begin
        mdPrices.Append;
        mdPrices.FieldByName('def').AsInteger := 1;
        mdPrices.FieldByName('ptypeid').AsInteger := FieldByName('ptypeid').AsInteger;
        mdPrices.FieldByName('extratype').AsInteger := 0;
        mdPrices.FieldByName('name').AsString := FieldByName('name').AsString;
        mdPrices.FieldByName('onvalue').AsFloat := FieldByName('onvalue').AsFloat;
        mdPrices.FieldByName('src').AsInteger := 0;
        mdPrices.FieldByName('en').AsInteger := 1;
        mdPrices.FieldByName('pptypeid').AsInteger := FieldByName('pptypeid').AsInteger;
        mdPrices.FieldByName('pname').AsString := FieldByName('pname').AsString;
        mdPrices.Post;
        Next;
      end;
      Close;

      ProviderName := 'pMatPrices_GetFromGroup';
      FetchParams;
      Params.ParamByName('matid').AsInteger := cdsMaterials.FieldByName('matid').AsInteger;
      Open;
      while not Eof do begin
        if mdPrices.Locate('ptypeid', FieldByName('ptypeid').AsInteger, []) then begin
          mdPrices.Edit;
          mdPrices.FieldByName('onvalue').AsFloat := FieldByName('onvalue').AsFloat;
          mdPrices.FieldByName('currid').AsInteger := FieldByName('currid').AsInteger;
          mdPrices.FieldByName('currname').AsString := FieldByName('shortname').AsString;
          mdPrices.FieldByName('extratype').AsInteger := FieldByName('extratype').AsInteger;
          mdPrices.FieldByName('src').AsInteger := 1;
          mdPrices.FieldByName('pptypeid').AsInteger := FieldByName('pptypeid').AsInteger;
          mdPrices.FieldByName('pname').AsString := FieldByName('pname').AsString;
          mdPrices.Post;
        end;
        Next;
      end;
      Close;

      ProviderName := 'pMatPrices_Get';
      FetchParams;
      Params.ParamByName('matid').AsInteger := cdsMaterials.FieldByName('matid').AsInteger;
      Open;
      while not Eof do begin
        if mdPrices.Locate('ptypeid', FieldByName('ptypeid').AsInteger, []) then begin
          mdPrices.Edit;

          if FieldByName('dis').AsInteger = 0 then begin
            mdPrices.FieldByName('onvalue').AsFloat := FieldByName('onvalue').AsFloat;
            mdPrices.FieldByName('withnds').AsInteger := FieldByName('withnds').AsInteger;
            mdPrices.FieldByName('currid').AsInteger := FieldByName('currid').AsInteger;
            mdPrices.FieldByName('currname').AsString := FieldByName('shortname').AsString;
            mdPrices.FieldByName('extratype').AsInteger := FieldByName('extratype').AsInteger;
          end;
          mdPrices.FieldByName('def').AsInteger := 0;
          mdPrices.FieldByName('src').AsInteger := 2;
          mdPrices.FieldByName('en').AsInteger := 1 - FieldByName('dis').AsInteger;
          mdPrices.FieldByName('pptypeid').AsInteger := FieldByName('pptypeid').AsInteger;
          mdPrices.FieldByName('pname').AsString := FieldByName('pname').AsString;
          mdPrices.Post;
        end;

        Next;
      end;

      Close;
      mdPrices.First;

    finally
      Free;
      Screen.Cursor := crDefault;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.colPTypeExtraGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.colPTypeExtraGetText') else _udebug := nil;{$ENDIF}

  try
    if not VarIsNull(ANode.Values[colPTypeType.Index]) then
      if (ANode.Values[colPTypeType.Index] = 0) then begin
        if VarToStr(ANode.Values[colPName.Index]) = ''
          then AText := AText + '% ' + rs('fmPriceTypes', 'ExtraText')
          else AText := AText + '% ' + rs('fmPriceTypes', 'From') + ' ' + VarToStr(ANode.Values[colPName.Index]);
      end

      else if (ANode.Values[colPTypeType.Index] = 2) then begin
        AText := AText + '% ' + rs('fmMaterials', 'On') + ' ' + VarToStr(ANode.Values[colPName.Index]);
      end

      else begin
        AText := AText + ' ' + ANode.Values[colPTypeCurrName.Index];

        if VarToInt(ANode.Values[colPWithNDS.Index]) = 1
          then AText := AText + ' (' + rs('fmWaybill', 'withNDS') + ')'
          else AText := AText + ' (' + rs('fmWaybill', 'outNDS') + ')';
      end;
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.grdPricesColumnSorting(Sender: TObject; Column: TdxDBTreeListColumn; var Allow: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.grdPricesColumnSorting') else _udebug := nil;{$ENDIF}

  Allow := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.colPTypeNameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.colPTypeNameGetText') else _udebug := nil;{$ENDIF}

  AText := '    ' + AText;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.srcMaterialsDelayedDataChange(Sender: TObject; Field: TField);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.srcMaterialsDelayedDataChange') else _udebug := nil;{$ENDIF}

  for i := 0 to pcMain.PageCount - 1 do pcMain.Pages[i].Tag := 1;

  if not cdsMaterials.IsEmpty and (cdsMaterials.FieldByName('mtype').AsInteger = 1)
     and (cdsMaterials.FieldByName('archived').AsInteger = 0) and (Param = 0)
  then FCurrentID := cdsMaterials.FieldByName(_id_).AsInteger
  else if (Param = 0) then FCurrentID := -1;

  if not pcMain.Visible or (Param <> 0) then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  irName.Text := cdsMaterials.fieldbyname('name').AsString;
  irArtikul.Text := cdsMaterials.fieldbyname('artikul').AsString;
  irMeasure.Text := cdsMaterials.fieldbyname('shortname').AsString;

  memNotes.Enabled := True;
  memNotes.Text := trim(cdsMaterials.fieldbyname('notes').AsString);
  memNotes.Enabled := False;
  tsNotes.Enabled := (memNotes.Text <> ''); 

  irProducer.Text := cdsMaterials.fieldbyname('producer').AsString;
  irCountry.Text := cdsMaterials.fieldbyname('cname').AsString;
  irWeight.Text := cdsMaterials.fieldbyname('weight').AsString;
  irSize.Text := cdsMaterials.fieldbyname('msize').AsString;

  if not cdsMaterials.FieldByName('demandcat').IsNull then begin
    case cdsMaterials.FieldByName('demandcat').AsInteger of
      0: irDemandCat.Text := rs(Self.Name, 'AverageDemand');
      1: irDemandCat.Text := rs(Self.Name, 'HighDemand');
      2: irDemandCat.Text := rs(Self.Name, 'LowDemand');
    end;
  end
  else irDemandCat.Text := '';

  irBarCode.Text := cdsMaterials.fieldbyname('barcode').AsString;
  if not cdsMaterials.fieldbyname('minreserv').IsNull
    then irMinReserv.Text := cdsMaterials.fieldbyname('minreserv').AsString + ' ' + cdsMaterials.FieldByName('shortname').AsString
    else irMinReserv.Text := '';

  if cdsMatGroup.Active and cdsMatGroup.Locate('grpid', cdsMaterials.FieldByName('grpid').AsInteger, [])
    then irMatGroup.Text := cdsMatGroup.FieldByName('name').AsString
    else irMatGroup.Text := '';

  if cdsWHouse.Active and cdsWHouse.Locate('wid', cdsMaterials.fieldbyname('wid').AsInteger, [])
    then irWH.Text := cdsWHouse.fieldbyname('name').AsString
    else irWH.Text := '';//rs_NotDefine;

  RefreshDetail;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.colMCMatNameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.colMCMatNameGetText') else _udebug := nil;{$ENDIF}

  AText := '    ' + AText;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.cdsMCBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.cdsMCBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsMC.Params.ParamByName(_ID_).AsInteger := cdsMaterials.FieldByName(_ID_).AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.DoColParams;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.DoColParams') else _udebug := nil;{$ENDIF}

  dbgMaterials.ShowColOptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.dbgMaterialsNeedAdjust(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.dbgMaterialsNeedAdjust') else _udebug := nil;{$ENDIF}

  AdjustGrid(dbgMaterials, colName);
  SavePTColumns;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.colMinReservGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.colMinReservGetText') else _udebug := nil;{$ENDIF}

  if AText <> '' then AText := FormatFloat(MatDisplayFormat, RoundToA(StrToFloat(AText), MatDisplayDigits));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.cdsPriceTypesAfterOpen(DataSet: TDataSet);
  var
    i: Integer;
    ACol: TdxDBTreeListColumn;
    FIndex, FColWidth, FColVis: Integer;
    FField: TFloatField;
    FFieldCurr: TStringField;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.cdsPriceTypesAfterOpen') else _udebug := nil;{$ENDIF}

  with dbgMaterials do begin
    BeginUpdate;
    i := 0;
    while i <= ColumnCount - 1 do begin
      if (Pos('colPT', Columns[i].Name) = 1) or (Pos('colCurrPT', Columns[i].Name) = 1)
        then Columns[i].Free
        else Inc(i);
    end;

    while i <= cdsMaterials.Fields.Count - 1 do begin
      if (Pos('fldPT', cdsMaterials.Fields[i].FieldName) = 1) or (Pos('fldCurrPT', cdsMaterials.Fields[i].FieldName) = 1)
        then cdsMaterials.Fields[i].Free
        else Inc(i);
    end;

    cdsPriceTypes.First;
    while not cdsPriceTypes.Eof do begin
      ACol := CreateColumnEx(TdxDBGridColumn, dbgMaterials);
      ACol.Name := 'colCurrPT' + cdsPriceTypes.FieldByName('ptypeid').AsString;
      ACol.FieldName := 'CurrPT' + cdsPriceTypes.FieldByName('ptypeid').AsString;
      ACol.Visible := False;

      ACol := CreateColumnEx(TdxDBGridColumn, dbgMaterials);
      ACol.Name := 'colPT' + cdsPriceTypes.FieldByName('ptypeid').AsString;
      ACol.FieldName := 'PT' + cdsPriceTypes.FieldByName('ptypeid').AsString;

      if ReadFromRegInt(MainRegKey + '\' + Self.Name + '\' + ACol.Name, 'Width', FColWidth)
        then ACol.Width := FColWidth
        else ACol.Width := 70;

      if ReadFromRegInt(MainRegKey + '\' + Self.Name + '\' + ACol.Name, 'Visible', FColVis)
        then ACol.Visible := FColVis = 1
        else ACol.Visible := False;

      if ReadFromRegInt(MainRegKey + '\' + Self.Name + '\' + ACol.Name, 'Index', FIndex)
        then ACol.Index := FIndex;

      ACol.MinWidth := 30;

      ACol.Tag := 1;
      ACol.Sizing := True;
      ACol.Caption := cdsPriceTypes.FieldByName('name').AsString;
      ACol.HeaderAlignment := taCenter;
      ACol.Alignment := taRightJustify;
      ACol.OnGetText := colPTGetText;

      FField := TFloatField.Create(cdsMaterials);
      FField.Name := 'fldPT' + cdsPriceTypes.FieldByName('ptypeid').AsString;
      FField.FieldKind := fkInternalCalc;
      FField.FieldName := 'PT' + cdsPriceTypes.FieldByName('ptypeid').AsString;
      FField.DataSet := cdsMaterials;

      FFieldCurr := TStringField.Create(cdsMaterials);
      FFieldCurr.Name := 'fldCurrPT' + cdsPriceTypes.FieldByName('ptypeid').AsString;
      FFieldCurr.FieldKind := fkInternalCalc;
      FFieldCurr.Size := 24;
      FFieldCurr.FieldName := 'CurrPT' + cdsPriceTypes.FieldByName('ptypeid').AsString;
      FFieldCurr.DataSet := cdsMaterials;
      cdsPriceTypes.Next;
    end;

    EndUpdate;

  end;

  RebuildExportList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.SavePTColumns;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.SavePTColumns') else _udebug := nil;{$ENDIF}

  with dbgMaterials do begin
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
procedure TfmMaterials.colPTGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.colPTGetText') else _udebug := nil;{$ENDIF}

  if AText <> '' then
    AText := FormatFloat(',0.######', RoundToA(StrToFloat(AText), -5)) + ' '
         + VarToStr(ANode.Values[dbgMaterials.ColumnByName('colCurrPT'
         + Copy(TdxTreeListColumn(Sender).Name, 6, Length(TdxTreeListColumn(Sender).Name) - 5)).Index]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.dbgMaterialsGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.dbgMaterialsGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := Self.Caption;
  ImgList := dmData.Images;
  AIndex := II_MAT;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.RefreshDetail;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.RefreshDetail') else _udebug := nil;{$ENDIF}

  if pcMain.ActivePage.Tag = 1 then begin
    if pcMain.ActivePage = tsPrice then GetPrices
    else if pcMain.ActivePage = tsMC then DSRefresh(cdsMC, 'id', 0);

    pcMain.ActivePage.Tag := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.pcMainChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.pcMainChange') else _udebug := nil;{$ENDIF}

  RefreshDetail;
  if pcMain.ActivePage = tsAdd
    then aPaste.ShortCut := 0
    else aPaste.ShortCut := TextToShortCut('Ctrl+V');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.colPTypeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.colPTypeGetText') else _udebug := nil;{$ENDIF}

  try
    if ANode.Values[colPTypeType.Index] = 1
      then AText := rs(Self.Name, 'FixPrice')
      else if VarToStr(ANode.Values[colPName.Index]) = ''
        then AText := rs('fmPriceTypes', 'Extra')
        else AText := rs('fmPriceTypes', 'Disc');
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.LoadSkin;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.LoadSkin') else _udebug := nil;{$ENDIF}

  inherited;

  panFooter.Color := clokFooter;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.aMatRsvExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.aMatRsvExecute') else _udebug := nil;{$ENDIF}

  if cdsMaterials.IsEmpty then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmMatRsv.Create(nil) do
    try
     ParentNameEx := 'fmWMat';
     OnDate := Self.OnDate;
     WID := 0;
     ID := cdsMaterials.FieldByName('matid').AsInteger;
     ShowModal;

   finally
     Free;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.aMatMoveExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.aMatMoveExecute') else _udebug := nil;{$ENDIF}

  if cdsMaterials.IsEmpty then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmMatMove.Create(nil) do
    try
      ParentNameEx := 'fmWMat';
      OnDate := Self.OnDate;
      WID := 0; //cbWHouse.KeyValue;
      ID := cdsMaterials.FieldByName('matid').AsInteger;
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.RebuildExportList;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.RebuildExportList') else _udebug := nil;{$ENDIF}

  ExportList.Clear;
  LoadExpParams;

  with ExportList do
    for i := 0 to dbgMaterials.ColumnCount - 1 do
      if (dbgMaterials.Columns[i].Tag > 0) and (ExportList.IndexOf(dbgMaterials.Columns[i].Name) = -1)
       then AddObject(dbgMaterials.Columns[i].Name, pointer(1));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.grdMCDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.grdMCDblClick') else _udebug := nil;{$ENDIF}

  if not cdsMC.IsEmpty then begin
    aGotoAnalog.Execute;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.aGotoAnalogExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.aGotoAnalogExecute') else _udebug := nil;{$ENDIF}

  if (GrpID = -1) or (GrpID = cdsMC.FieldByName('grpid').AsInteger) then begin
    if not cdsMaterials.Locate('matid', cdsMC.fieldbyname('id').AsInteger, [])
      then DSRefresh(cdsMaterials, 'matid', cdsMC.fieldbyname('id').AsInteger);
  end
  else begin
    GrpID := cdsMC.FieldByName('grpid').AsInteger;
    SendMessage(ParentHandle, WM_SETTREEITEM, GrpID, 0);
    DSRefresh(cdsMaterials, 'matid', cdsMC.fieldbyname('id').AsInteger);
  end;

  dbgMaterials.ClearSelection;

  if dbgMaterials.FocusedNode <> nil
    then dbgMaterials.FocusedNode.Selected := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.cdsMCAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.cdsMCAfterOpen') else _udebug := nil;{$ENDIF}

  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.aFindAtWHExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.aFindAtWHExecute') else _udebug := nil;{$ENDIF}

  frmMainForm.ExecLocate(vtWMat, 'TfmWMat', cdsMaterials.FieldByName('matid').AsInteger, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.aMCMatMoveExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.aMCMatMoveExecute') else _udebug := nil;{$ENDIF}

  if cdsMC.IsEmpty then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmMatMove.Create(nil) do
    try
      ParentNameEx := 'fmWMat';
      OnDate := Self.OnDate;
      WID := 0; //cbWHouse.KeyValue;
      ID := cdsMC.FieldByName('id').AsInteger;
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.aMCMatRsvExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.aMCMatRsvExecute') else _udebug := nil;{$ENDIF}

  if cdsMC.IsEmpty then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmMatRsv.Create(nil) do
    try
     ParentNameEx := 'fmWMat';
     OnDate := Self.OnDate;
     WID := 0;
     ID := cdsMC.FieldByName('id').AsInteger;
     ShowModal;

   finally
     Free;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.aMCMatInfoExecute(Sender: TObject);
 var
   FID: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.aMCMatInfoExecute') else _udebug := nil;{$ENDIF}

  if cdsMC.IsEmpty then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmEditMaterials.Create(nil) do
    try
      ParentNameEx := 'fmMaterials';
      OnDate := Self.OnDate;
      ID := cdsMC.FieldByName('id').AsInteger;;
      CanModify := False;
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.pmMainPopup(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.pmMainPopup') else _udebug := nil;{$ENDIF}

  if cdsMaterials.FieldByName('archived').AsInteger = 0
    then aArchive.Caption := rs('Common', 'MoveToArchive')
    else aArchive.Caption := rs('Common', 'ExtractFromArchive');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.DoArchive;
 var
   FArchive: Integer;
   i: Integer;
   FRemain: Extended;
   FSkip: Boolean;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.DoArchive') else _udebug := nil;{$ENDIF}

  FSkip := False;
  if cdsMaterials.FieldByName('archived').AsInteger = 0 then begin
    if not (((dbgMaterials.SelectedCount = 1)
            and (mrYes = ssMessageDlg(rs('fmMaterials', 'ArchiveConfirm'), ssmtWarning, [ssmbYes, ssmbNo]))
            )
            or
            ((dbgMaterials.SelectedCount > 1) and (mrYes = ssMessageDlg(Format(rs('fmMaterials', 'ArchiveConfirmEx'), [dbgMaterials.SelectedCount]), ssmtWarning, [ssmbYes, ssmbNo]))))
    then begin
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    FArchive := 1;
  end
  else begin // un-archive request
    if not (((dbgMaterials.SelectedCount = 1) and (ssMessageDlg(rs('fmMaterials', 'UnArchiveConfirm'), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes))
            or
           ((dbgMaterials.SelectedCount > 1) and (ssMessageDlg(Format(rs('fmMaterials', 'UnArchiveConfirmEx'), [dbgMaterials.SelectedCount]), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes)))
    then begin
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    FArchive := 0;
  end;

  fProgress.Show;

  with newDataSet do
  try
    ProviderName := 'pMat_Archive';
    FetchParams;
    Application.ProcessMessages;
    fProgress.Caption := rs('Common', 'Processing');
    fProgress.UpDate;
    fProgress.pbMain.Max := dbgMaterials.SelectedCount;

    Params.ParamByName('archived').AsInteger := FArchive;

    for i := 0 to dbgMaterials.SelectedCount - 1 do begin
      FRemain := GetMatRest(dmData.SConnection, dbgMaterials.SelectedNodes[i].Values[colID.Index], MaxDateTime);
      if FRemain = 0 then begin
        Params.ParamByName('matid').AsInteger := dbgMaterials.SelectedNodes[i].Values[colID.Index];
        Execute;
      end
      else begin
        if (not FSkip) and (FArchive = 1) then // show only for archiving req
          case ssMessageDlg(Format(rs('fmMaterials', 'ArchiveError'),
                            [VarToStr(dbgMaterials.SelectedNodes[i].Values[colName.Index]),
                            FormatFloat(MatDisplayFormat, FRemain)]), ssmtError, [ssmbYes, ssmbNo, ssmbSkip])
          of
            mrYes:;
            mrIgnore: FSkip := True;
            else Break;
          end;
      end;
      fProgress.lText.Caption := VarToStr(dbgMaterials.SelectedNodes[i].Values[colName.Index]);
      fProgress.pbMain.StepIt;
      Application.ProcessMessages;
    end;

    Application.ProcessMessages;
    aRefresh.Execute;
    RefreshFun('TfmWaybill', 0);
    RefreshFun('TfmWBRest', 0);
    UpdateActionList;

  finally
    fProgress.Hide;
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.aShowArchivedExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.aShowArchivedExecute') else _udebug := nil;{$ENDIF}

  aRefresh.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.DoLocate(const AID: Integer; ASubID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.DoLocate') else _udebug := nil;{$ENDIF}

  if not JumpFromBuffer then begin
    if not cdsMaterials.Locate(_ID_, AID, []) then begin
      GrpID := ASubID;
      SendMessage(ParentHandle, WM_SETTREEITEM, GrpID, -1);
      DSRefresh(cdsMaterials, _ID_, AID);
    end;

    with dbgMaterials do begin
      ClearSelection;
      if FocusedNode <> nil then FocusedNode.Selected := True;
    end;

    if cdsMaterials.FieldByName(_ID_).AsInteger <> AID
      then ssMessageDlg(rs('fmMaterials', 'MatNotFound'), ssmtInformation, [ssmbOk]);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.NotifyChanged;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.NotifyChanged') else _udebug := nil;{$ENDIF}

  if not JumpFromBuffer
    then frmMainForm.AddToBuffer(vtRefs, FunID, Self.Caption, ClassName, Tag, FCurrentID, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.SetParam(const Value: Integer);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.SetParam') else _udebug := nil;{$ENDIF}

  inherited;

  FParam := Value;
  pcMain.Visible := not (ModalView and (Value = 0));
  splMain.Visible := pcMain.Visible;

  if Value <> 0 then begin
    DocInfo := TokAddDocInfo(Pointer(Value)^);
    colPrice.Caption := rs('fmWaybill', 'Price') + ', ' + DocInfo.CurrName;

    for i := 0 to pcMain.PageCount - 1 do
      if pcMain.Pages[i] = tsAdd
        then tsAdd.TabVisible := True
        else pcMain.Pages[i].TabVisible := False;

    pcMain.ActivePage := tsAdd;
  end;

  mdMats.Open;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.colRecNoGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.colRecNoGetText') else _udebug := nil;{$ENDIF}

  AText := IntToStr(ANode.AbsoluteIndex + 1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.AddMatToDoc;
 var
   FPrice: Extended;
   i: Integer;
   ANode: TdxTreeListNode;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.AddMatToDoc') else _udebug := nil;{$ENDIF}

  fProgress.Caption := rs('Common', 'Executing');
  fProgress.pbMain.Max := dbgMaterials.SelectedCount;

  if dbgMaterials.SelectedCount > 1 then fProgress.Show;

  try
    mdMats.DisableControls;
    for i := 0 to dbgMaterials.SelectedCount - 1 do begin
      ANode := dbgMaterials.SelectedNodes[i];
      fProgress.lText.Caption := ANode.Values[colName.Index];
      Application.ProcessMessages;

      with mdMats do begin
        FPrice := GetDefPriceIn(ANode.Values[colID.Index], DocInfo.PTypeID, DocInfo.CurrID, DocInfo.OnDate, DocInfo.NDS);
        Append;
        FieldByName('posid').AsInteger := RecordCount + 1;
        FieldByName('matid').AsInteger := ANode.Values[colID.Index];
        FieldByName('mid').AsInteger := ANode.Values[colMID.Index];
        FieldByName('name').AsString := ANode.Values[colName.Index];
        FieldByName('amount').AsFloat := WBInDefAmount;
        FieldByName('artikul').AsString := ANode.Values[colArtikul.Index];
        FieldByName('msrname').AsString := ANode.Values[colMeasure.Index];
        FieldByName('producer').AsString := ANode.Values[colProducer.Index];
        FieldByName('barcode').AsString := ANode.Values[colBarCode.Index];
        FieldByName('price').AsFloat := FPrice;
        Post;
      end;
      fProgress.pbMain.StepIt;
      Application.ProcessMessages;
    end;

  finally
    if fProgress.Visible then fProgress.Hide;

    mdMats.EnableControls;
    AdjustGrid(grdMats, colMatName);
  end;
  grdMats.SetFocus;
  grdMats.ClearSelection;

  if grdMats.FocusedNode <> nil then grdMats.FocusedNode.Selected := True;

  UpdateActionList;
  grdMats.FocusedColumn := colAmount.ColIndex;
  grdMats.ShowEditor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.grdMatsCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.grdMatsCustomDrawCell') else _udebug := nil;{$ENDIF}

  try
    if odd(ANode.Index) and not ASelected then AColor := GridOddLinesColor;

    if (ASelected) and (AColumn.ColIndex <> grdMats.FocusedColumn) or not AFocused
      then AColor := $00BEBEBE;

    if ASelected and AFocused and AColumn.DisableEditor then AColor := grdMats.HighlightColor;

    if not ASelected or not AFocused then AFont.Color := clWindowText;
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.grdMatsColumnSorting(Sender: TObject; Column: TdxDBTreeListColumn; var Allow: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.grdMatsColumnSorting') else _udebug := nil;{$ENDIF}

  Allow := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.grdMatsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.grdMatsKeyDown') else _udebug := nil;{$ENDIF}

  if (Key = 13) and (grdMats.FocusedColumn = colAmount.ColIndex)
    then dbgMaterials.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.grdMatsDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.grdMatsDragOver') else _udebug := nil;{$ENDIF}

  Accept := (Source = dbgMaterials);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.grdMatsDragDrop(Sender, Source: TObject; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.grdMatsDragDrop') else _udebug := nil;{$ENDIF}

  AddMatToDoc;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.aMatsDelExecute(Sender: TObject);
  var
    i: Integer;
    ANode: TdxTreeListNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.aMatsDelExecute') else _udebug := nil;{$ENDIF}

  fProgress.Caption := rs('Common', 'Deleting');
  fProgress.pbMain.Max := grdMats.SelectedCount;

  if grdMats.SelectedCount > 1 then fProgress.Show;

  try
    mdMats.DisableControls;
    for i := 0 to grdMats.SelectedCount - 1 do begin
      ANode := grdMats.SelectedNodes[i];
      fProgress.lText.Caption := ANode.Values[colName.Index];
      fProgress.pbMain.StepIt;
      mdMats.Locate('matid', ANode.Values[colMatID.Index], []);
      mdMats.Delete;
      Application.ProcessMessages;
    end;

  finally
    if fProgress.Visible then fProgress.Hide;
    mdMats.EnableControls;
    AdjustGrid(grdMats, colMatName);
  end;

  if grdMats.FocusedNode <> nil then grdMats.FocusedNode.Selected := True;

  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.aMatsColOptionsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.aMatsColOptionsExecute') else _udebug := nil;{$ENDIF}

  grdMats.ShowColOptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.grdMatsGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.grdMatsGetOptionsTitle') else _udebug := nil;{$ENDIF}

  ImgList := dmData.Images;
  AIndex := tsAdd.ImageIndex;
  AText := rs('fmMaterials', 'MatList');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.grdMatsDblClick(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.grdMatsDblClick') else _udebug := nil;{$ENDIF}
  aMatsDel.Execute;
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmMaterials.aMatsSelectAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.aMatsSelectAllExecute') else _udebug := nil;{$ENDIF}

  grdMats.SelectAll;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.DoShowModal;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.DoShowModal') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.WMOKShowModal(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.WMOKShowModal') else _udebug := nil;{$ENDIF}

  Sleep(250);
  if Param > 0 then ssMessageDlg(rs('fmMaterials', 'MatsNote'), ssmtInformation, [ssmbOk], 'MatsNote', True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.cdsWHouseBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.cdsWHouseBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsWhouse.Macros.ParamByName('m').AsString := WHAccessMacro;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.aMCColParamsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.aMCColParamsExecute') else _udebug := nil;{$ENDIF}

  grdMC.ShowColOptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.grdMCGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.grdMCGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := tsMC.Caption;
  ImgList := dmData.Images;
  AIndex := II_MC;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.colMCRemainGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.colMCRemainGetText') else _udebug := nil;{$ENDIF}

  try
    if AText <> ''
      then AText := FormatFloat(MatDisplayFormat, RoundToA(StrToFloat(AText), MatDisplayDigits));

  except
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.colMCArtikulGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.colMCArtikulGetText') else _udebug := nil;{$ENDIF}

  AText := Trim(AText);

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.colAvgPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.colAvgPriceGetText') else _udebug := nil;{$ENDIF}

  if AText <> '' then AText := FormatFloat(PriceDisplayFormat, RoundToA(StrToFloat(AText), -2));

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMaterials.webShopUpload(Sender: TObject);
  {$IFNDEF FREE}
  var
    i: Integer;
    mi: TTBItem;
    Problems: Boolean;
    ANode: TdxTreeListNode;
    prod: TMetaProduct;
    Stream: TStringStream;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
    {$ENDIF}
begin
  {$IFNDEF FREE}
  if dbgMaterials.SelectedCount = 0 then Exit;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.webShopUpload') else _udebug := nil;{$ENDIF}

  mi := TTBItem(Sender);

  fProgress.Caption := rs('Common', 'Uploading');
  fProgress.pbMain.Max := dbgMaterials.SelectedCount * 2; // to show load and post separately
  fProgress.Show;
  fProgress.ShowLog;

  try
    Problems := False;
    prod := TMetaProduct.Create(nil);
    Stream := TStringStream.Create('');
    for i := 0 to dbgMaterials.SelectedCount - 1 do begin
      ANode := dbgMaterials.SelectedNodes[i];

      fProgress.lText.Caption := ANode.Values[colName.Index];

      //mdMats.Locate('matid', ANode.Values[colMatID.Index], []);
      if prod.XMLForWeb(stream, mi.Tag, ANode.Values[colID.Index]) then begin
        fProgress.pbMain.StepIt;
        Application.ProcessMessages;
        fProgress.AddLine(ANode.Values[colName.Index] + ':');
        XMLshowServerResponse(XMLpost(mi.tag, 'InsertProducts', Stream, fProgress.Log), True, fProgress.Log);
      end
      else begin
        Problems := True;
        fProgress.Log.Lines.Add('product ID: ' + VarToStr(ANode.Values[colID.Index]) + prod.StatusMessage);
        fProgress.pbMain.StepIt;
      end;
      fProgress.pbMain.StepIt;

      Application.ProcessMessages;
    end;

  except
    on e: Exception do begin
      debugInstantLog('! ERROR: TfmMaterials.webShopUpload exception: ' + e.Message);
      Problems := True;
    end;
  end;

  if Problems
    then fProgress.Done
    else fProgress.Hide;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  {$ENDIF}//not free
end;

//==============================================================================================
procedure TfmMaterials.webShopUploadWHState(Sender: TObject);
  {$IFNDEF FREE}
  var
    i, prodID: Integer;
    remain: Double;
    mi: TTBItem;
    ANode: TdxTreeListNode;
    Stream: TStringStream;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
    {$ENDIF}
begin
  {$IFNDEF FREE}

  if dbgMaterials.SelectedCount = 0 then Exit;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.webShopUpload') else _udebug := nil;{$ENDIF}

  mi := TTBItem(Sender);

  fProgress.Caption := rs('Common', 'PreparingUpload');
  fProgress.pbMain.Max := dbgMaterials.SelectedCount + 1; // to show upload as last step
  fProgress.ShowLog;
  fProgress.ShowButtons(False, False, True);
  fProgress.Show;

  Stream := TStringStream.Create('');

  with newDataSet do try
    ProviderName := 'pWHPosRemains';
    FetchParams;

    for i := 0 to dbgMaterials.SelectedCount - 1 do begin
      remain := 0.0;
      ANode := dbgMaterials.SelectedNodes[i];
      fProgress.lText.Caption := ANode.Values[colName.Index];

      ProdID := ANode.Values[colID.Index];

      Params.ParamByName('wid').asInteger := 0;
      Params.ParamByName('ProdID').asInteger := ProdID;
      Open;
      while not eof do remain := remain + FieldByName('remain').asFloat;
      Close;

      Application.ProcessMessages;

      if fProgress.buttonPressed = mrCancel then begin
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Stream.Free;
        Free;
        Exit;
      end;

      Stream.WriteString('<Product><ID>' + IntTostr(ProdID) + '</ID><Remain>' + FloatToStr(remain) + '</Remain></Product>' + crlf);
      fProgress.pbMain.StepIt;
    end;

  finally
    Free;
  end;

  fProgress.Caption := rs('Common', 'Uploading');
  if XMLshowServerResponse(XMLpost(mi.tag, 'ProductsRemains', Stream, fProgress.Log), True, fProgress.Log)
    then fProgress.Hide
    else fProgress.Done; // wait for user to press OK

  Stream.Free;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  {$ENDIF} // not free
end;

//==============================================================================================
procedure TfmMaterials.webShopDelete(Sender: TObject);
  {$IFNDEF FREE}
  var
    i: Integer;
    mi: TTBItem;
    ANode: TdxTreeListNode;
    Stream: TStringStream;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  {$ENDIF}
begin
  {$IFNDEF FREE}
  if dbgMaterials.SelectedCount = 0 then Exit;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMaterials.webShopDelete') else _udebug := nil;{$ENDIF}

  mi := TTBItem(Sender);

  fProgress.Caption := rs('Common', 'Deleting');
  fProgress.InfoText := rs('Common', 'Deleting');
  fProgress.ProgressMain.Max := 1; // to show load and post separately
  fProgress.Show;

  try
    Stream := TStringStream.Create('');
    Stream.WriteString('<Products>' + crlf);

    for i := 0 to dbgMaterials.SelectedCount - 1 do begin
      ANode := dbgMaterials.SelectedNodes[i];

      Stream.WriteString('<Id>' + IntToStr(Anode.Values[colID.Index]) + '</Id>' + crlf);

      Application.ProcessMessages;
    end;
    fProgress.ProgressMain.StepIt;

    Stream.WriteString('</Products>' + crlf);

    if cmdLineDebugLevel > 5 then fProgress.ShowLog;

    if not XMLshowServerResponse(XMLpost(mi.tag, 'HideProducts', Stream, fProgress.Log), True, fProgress.Log)
      then fProgress.ShowLog; // error ersponse

  finally
  end;

  fProgress.ProgressMain.StepIt;
  fProgress.InfoText := rs('Common', 'DeletingComplete');
  fProgress.Caption := rs('Common', 'DeletingComplete');
  fProgress.Done; // waiting for user to press OK

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  {$ENDIF} // not free
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fMaterials', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
