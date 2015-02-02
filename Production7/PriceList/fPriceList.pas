{$I ok_sklad.inc}
unit fPriceList;

interface

uses
  Windows, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  BaseFrame, Menus, ActnList, dxTL6, dxDBCtrl6, dxDBGrid6, dxCntner6,
  DB, DBClient, ssBaseConst, ssClientDataSet, ssMemDS, dxExEdtr6,
  dxInspRw, dxInspct, Grids, DBGrids, ExtCtrls, cxControls, cxGroupBox,
  ssGroupBox, FR_Class, FR_DSet, FR_DBSet, StdCtrls, cxPC, dxDBTLCl6,
  dxGrClms6, ssDataSource, ssBevel, FR_Desgn, Buttons, xLngDefs,
  dxmdaset, cxDropDownEdit, ssDBLookupCombo, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxCalendar, cxGraphics, cxImageComboBox,
  ssSpeedButton, TB2Item, ssBaseTypes, dxDBTL6, FR_PTabl, XLSExportComp,
  ssXLSExport, ssDBGrid, ssPeriod, okPeriod, FR_BarC, FR_RRect, FR_Shape;

type
  TfmPriceList = class(TssBaseFrame)
    aGrpInfo: TAction;
    aMatInfo: TAction;
    aMatMove: TAction;
    aMatRsv: TAction;
    aSvcInfo: TAction;
    bvlRight: TssBevel;
    bvlTop: TssBevel;
    cdsFind: TssClientDataSet;
    cdsPriceList: TssClientDataSet;
    colCrName: TdxDBGridColumn;
    colDocImg: TdxDBGridImageColumn;
    colName: TdxDBGridColumn;
    colOnDate: TdxDBGridColumn;
    dbgListDet: TssDBGrid;
    dbgListDetRecId: TdxDBGridColumn;
    dbgPriceList: TssDBGrid;
    dsListDet: TDataSource;
    dsPriceList: TssDataSource;
    frBarCodeObject1: TfrBarCodeObject;
    frDBDataSet1: TfrDBDataSet;
    frDBDataSetLbl: TfrDBDataSet;
    frReport1: TfrReport;
    frReportLabels: TfrReport;
    frRoundRectObject1: TfrRoundRectObject;
    frShapeObject1: TfrShapeObject;
    frUserDataset1: TfrUserDataset;
    frUserDataset2: TfrUserDataset;
    lDocsCount: TLabel;
    mdListDet: TssMemoryData;
    mdRep: TssMemoryData;
    PagePositions: TcxTabSheet;
    Panel1: TPanel;
    panFilter: TPanel;
    panFooter: TPanel;
    PanMaster: TPanel;
    pcMain: TcxPageControl;
    pmDet: TTBPopupMenu;
    prdMain: TokPeriod;
    Splitter1: TSplitter;
    ssBevel12: TssBevel;
    ssBevel14: TssBevel;
    ssBevel15: TssBevel;
    ssBevel16: TssBevel;
    ssBevel17: TssBevel;
    ssBevel1: TssBevel;
    ssBevel2: TssBevel;
    ssBevel4: TssBevel;
    ssBevel8: TssBevel;
    ssBevel9: TssBevel;
    stCount: TssBevel;
    TBItem10: TTBItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    TBItem13: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    TBItemDetLabelPrint: TTBItem;
    TBItemPrintLbl: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBSeparatorItem4: TTBSeparatorItem;
    xlsExpFile: TXLSExportFile;
    xlsExport: TssXLSExport;

    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aGrpInfoExecute(Sender: TObject);
    procedure aMatInfoExecute(Sender: TObject);
    procedure aMatMoveExecute(Sender: TObject);
    procedure aMatRsvExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aSvcInfoExecute(Sender: TObject);
    procedure cdsPriceListBeforeOpen(DataSet: TDataSet);
    procedure colOnDateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colRecNoGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colSummCurrGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colSummDefGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure dbgListDet1GetImageIndex(Sender: TObject; Node: TdxTreeListNode; var Index: Integer);
    procedure dbgListDetCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure dbgPriceListChangeNode(Sender: TObject; OldNode, Node: TdxTreeListNode);
    procedure dbgPriceListCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure dbgPriceListDblClick(Sender: TObject);
    procedure dbgWaybillDetCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure dsPriceListDelayedDataChange(Sender: TObject; Field: TField);
    procedure edFromDatePropertiesEditValueChanged(Sender: TObject);
    procedure edToDatePropertiesEditValueChanged(Sender: TObject);
    procedure FrameResize(Sender: TObject);
    procedure frPrintTable1PrintData(Field: TField; Memo: TStringList; View: TfrView; Section: TfrDataSection);
    procedure frReport11GetValue(const ParName: String; var ParValue: Variant);
    procedure frReport1BeforePrint(Memo: TStringList; View: TfrView);
    procedure frReport1PrintColumn(ColNo: Integer; var Width: Integer);
    procedure frReportLabelsGetValue(const ParName: String; var ParValue: Variant);
    procedure pcMainResize(Sender: TObject);
    procedure TBItemPrintLblClick(Sender: TObject);

  private
    f :boolean;
    priceColumns: TStringList;
    blobds: TssClientDataSet; // for images fetching
    colProdImage: TdxDBTreeListImageColumn;

    procedure GetSummAll;//Функция подсчёта итоговых сумм
    procedure colAmount_GetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);

  protected
    CanRefresh:boolean;
    ColsWidth,PWidth,VisColCount, CurWidth, CurAlign:integer;

    procedure SetOnDate(const Value: TDateTime); override;
    function GetIDForUpdate: integer; override;
    procedure SetNumMat;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure DoClose; override;
    procedure DoDelete; override;
    procedure DoExcel(Grid: TdxDBGrid); override;
    procedure DoFind(const AFName, AStr: string; ALocateType: TLocateType; AFwd: Boolean = True); override;
    procedure DoLocate(const AID: Integer; ASubID: Integer = 0); override;
    procedure DoOpen(AParam: Variant); override;
    procedure DoPatternInsert; override;
    procedure DoPrint(AParam: integer = 0); override;
    procedure DoRefresh(const AID: integer; AParam: integer = 0); override;
    procedure DoShow; override;
    procedure DoShowFilter; override;
    procedure NotifyChanged; override;
    procedure SetCaptions; override;
    procedure UpdateActionList; override;
  end;

var
  fmPriceList: TfmPriceList;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  ClientData, prFun, EditPriceList, prConst, ssFun, DateUtils,
  prTypes, ssCallbackConst, ssRegUtils, ssStrUtil, fMessageDlg,
  ssDateUtils, Math, ssBaseDlg,Dialogs, ShellAPI, jpeg,
  EditMaterials,MatMove, MatRsv,EditServices, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

const
  _ID_ = 'PLID';

//==============================================================================================
constructor TfmPriceList.Create(AOwner: TComponent);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.Create') else _udebug := nil;{$ENDIF}

  inherited;
  priceColumns := TStringList.Create;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
destructor TfmPriceList.Destroy;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.Destroy') else _udebug := nil;{$ENDIF}

  priceColumns.Destroy;
  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.DoExcel(Grid: TdxDBGrid);
  var
    AFName, AImgFName: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.DoExcel') else _udebug := nil;{$ENDIF}

  with TSaveDialog.Create(nil) do
  try
    DefaultExt := 'xls';
    Filter := 'Excel files (*.xls)|*.xls';
    if not Execute then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

    if FileName <> '' then AFName := FileName;

  finally
    Free;
  end;

  Application.ProcessMessages;

  {fProgress.Caption := rs('Common', 'Excel') + '...';
  fProgress.Show;
  fProgress.Update;
  fProgress.pbMain.Max := dbgKAgent.Count;
  fProgress.pbMain.Position := 0;
  }

  try
    xlsExpFile.Workbook.Sheets.Clear;
    xlsExpFile.Workbook.Sheets.Add('Sheet1');
    //Сохранение лого в tmplogo.bmp
    if (cdsPriceList.FieldByName('uselogo').AsInteger = 1)and(EntLogo.Size > 0) then begin
      EntLogo.Position := 0;
      AImgFName := ExtractFilePath(Application.ExeName) + 'tmplogo.bmp';
      EntLogo.SaveToFile(AImgFName);
    end
    else AImgFName := '';

    try
      xlsExport.ExportPL(0, 6, 0, dbgListDet, ExportList, AFName, EntName, EntAddr, EntPhone, cdsPriceList.FieldByName('name').AsString,
                         cdsPriceList.FieldByName('notes').AsString, AImgFName, PLGrpColor);
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
procedure TfmPriceList.DoPatternInsert;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.DoPatternInsert') else _udebug := nil;{$ENDIF}

  with TfrmEditPriceList.Create(nil) do
  try
    GrpID := Self.GrpID;
    MainHandle := Self.Handle;
    ParentNameEx := Self.Name;
    OnDate := Self.OnDate;
    IsPattern := True;
    ID := GetIDForUpdate;
    Caption := rs(ParentNameEx,'TitleAdd');
    edDate.Date := Self.OnDate;
    edName.Text := '';

    if ShowModal = mrOk then dbgPriceList.SetFocus;

    UpdateActionList;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.SetNumMat;
  var
    i, num: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.SetNumMat') else _udebug := nil;{$ENDIF}

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

//Функция подсчёта итоговых сумм
//==============================================================================================
procedure TfmPriceList.GetSummAll;
  (*var i:integer;
    PriceCurrOutNDS,SummCurrOutNDS,SummCurrNDS,SummCurr,
    PriceDefOutNDS,SummDefOutNDS,SummDefNDS,SummDef:Extended;
    AllSummCurr, AllSummDefOutNDS, AllSummDefNDS, AllSummDef,
    FAmount :Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.GetSummAll') else _udebug := nil;{$ENDIF}

  with dbgWaybillDet do
  begin
    AllSummCurr := 0;
    AllSummDefOutNDS := 0;
    AllSummDefNDS := 0;
    AllSummDef := 0;

    for i := 0 to Count-1 do
    begin
      try
        NDSCalc(ssStrToFloat(Items[i].Values[colAmount.Index]), ssStrToFloat(Items[i].Values[colPrice.Index]),ssstrtofloat(cdsWaybill.fieldbyname('NDS').AsString), 1,SummCurrOutNDS,SummCurrNDS);
        //Сумма в валюте с НДС
        SummCurr := SummCurrOutNDS+SummCurrNDS;
        Items[i].Values[colSummCurr.Index] := SummCurr;
        AllSummCurr := AllSummCurr+SummCurr;
      except
        Items[i].Values[colSummCurr.Index] := -1;
      end;

      try
         if CurKurs>0 then begin
          SummDef := RoundToA(SummCurr * CurKurs, -2);
          SummDefOutNDS := NDSOut(SummDef, cdsWaybill.fieldbyname('NDS').AsFloat);
          SummDefNDS := SummDef - SummDefOutNDS;
          AllSummDefOutNDS := AllSummDefOutNDS+SummDefOutNDS;
          AllSummDefNDS := AllSummDefNDS+SummDefNDS;
          //Сумма в нац. валюте с НДС;
          SummDef := SummDefOutNDS+SummDefNDS;
          AllSummDef := AllSummDef+SummDef;
          Items[i].Values[colSummDef.Index] := SummDef;
         end
         else  Items[i].Values[colSummDef.Index] := 0;

      except
        Items[i].Values[colSummDef.Index] := 0;
      end;
    end;

    stSummCurr.Caption := formatfloat(MoneyDisplayFormat, AllSummCurr);
    stSummDefNoNDS.Caption := formatfloat(MoneyDisplayFormat, AllSummDefOutNDS);
    stSummDefNDS.Caption := formatfloat(MoneyDisplayFormat, AllSummDefNDS);
    stSummDef.Caption := formatfloat(MoneyDisplayFormat, AllSummDef);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmPriceList.DoPrint;
  var
    i,j: integer;
    BM: TBookmark;
    BSRead, BSWrite: TStream;
    jpeg: TJPEGImage;
    frpv: TfrPictureView;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.DoPrint') else _udebug := nil;{$ENDIF}

  // code import from TfrmEditPriceList.aPrintExecute
  mdListDet.DisableControls;
  BM := mdListDet.GetBookmark;

  try
    mdListDet.SortOnFields('pldetid');

    j := 0;
    ColsWidth := 0;
    for i := 0 to dbgListDet.ColumnCount - 1 do begin
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
            mdListDet.Post;
            BSRead.Free;
            BSWrite.Free;
            jpeg.free;
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

  (* old code
  mdListDet.DisableControls;
  BM := mdListDet.GetBookmark;
  try
    mdListDet.SortOnFields('pldetid');

    j := 0;
    ColsWidth := 0;
    for i := 0 to dbgListDet.ColumnCount - 1 do begin
      if dbgListDet.Columns[i].Visible then begin
        dbgListDet.Columns[i].Index := j;
        inc(j);
      end;
    end;

    VisColCount := j - 1;
    ColsWidth := 0;

    for i := 2 to VisColCount do ColsWidth := ColsWidth + dbgListDet.Columns[i].Width;

    frUserDataset1.RangeEndCount := VisColCount - 1;
    frUserDataset2.RangeEndCount := VisColCount - 1;
    SmartShowRep(frreport1, 'PriceList.frf')

  finally
    mdListDet.GotoBookmark(BM);
    mdListDet.FreeBookmark(BM);
    mdListDet.EnableControls;
    SetNumMat;
  end;
  *)
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.DoClose;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.DoClose') else _udebug := nil;{$ENDIF}

  WriteToRegInt(MainRegKey + '\' + Self.ClassName + '\' + PanMaster.Name, 'Height', PanMaster.Height);
  prdMain.SaveToRegistry;
  cdsPriceList.Close;
  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//************* Удаление ******
//==============================================================================================
procedure TfmPriceList.DoDelete;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.DoDelete') else _udebug := nil;{$ENDIF}

  if ssMessageDlg(rs('Common','DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes then begin
    Screen.Cursor := crSQLWait;
    with newDataSet do
    try
      Application.ProcessMessages;
      TrStart;
      try
        //Проверка сущ. ли таблица
        ProviderName := 'pTable_Exists';
        FetchParams;
        Params.ParamByName('TableName').AsString := cdsPriceList.fieldbyname('tablename').AsString;
        Open;
        if not IsEmpty then begin
          //Удаление таблицы PL_X
          Close;
          ProviderName := 'pPL_X_Drop';
          FetchMacros;
          Macros.ParamByName('m').AsString := cdsPriceList.fieldbyname('tablename').AsString;
          Execute;
        end
        else Close;

        if not DeleteDataEx(dmData.SConnection, 'pricelist',_ID_,cdsPriceList.fieldbyname(_ID_).AsInteger)
          then raise Exception.Create(rs('Common','DeleteError'));

        if not DelToRecycleBin
          then TrCommit
          else begin
            TrRollback;

            if not AddToRecycleBin(dmData.SConnection, Self.ClassName, cdsPriceList.fieldbyname(_ID_).AsInteger, cdsPriceList.fieldbyname('name').AsString, false, Self.FunID)
            then begin
              ssMessageDlg(rs('Common','ErrorInsToRecycleBin'), ssmtError, [ssmbOk]);
              {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
              Exit;
            end;
          end;

        aRefresh.Execute;
        UpdateActionList;

      except
        on e:exception do begin
          TrRollback;
          ssMessageDlg(rs('Common','NoDelete') + #10#13 + e.Message, ssmtError, [ssmbOk]);
        end;
      end;

    finally
      Free;
      Screen.Cursor := crDefault;
    end;
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.DoOpen(AParam: Variant);
 var
   tmpHeight:Integer;
   tmpdate:TDateTime;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.DoOpen') else _udebug := nil;{$ENDIF}

  prdMain.RegistryPath := MainRegKey + '\' + Self.ClassName;
  tmpHeight := 0;
  tmpdate := 0;
  FrameResize(Self);
  RefType := rtPriceList;
  CheckSrvLocked := True;
  EditingClass := TfrmEditPriceList;
  CanRefresh := false;
  ReadFromRegInt(MainRegKey + '\' + Self.ClassName + '\' + PanMaster.Name, 'Height', tmpHeight);

  if tmpHeight > 0 then PanMaster.Height := tmpHeight;

  inherited;
  prdMain.LoadFromRegistry;
  DoRefresh(0);
  CanRefresh := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.SetCaptions;
  var
    FTitle: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    Self.Caption := GetRS(Self.Name,'TitlePriceList');
    colName.Caption := GetRS(Self.Name,'Name');
    colOnDate.Caption := GetRS(Self.Name,'OnDate');
    colCrName.Caption := GetRS(Self.Name,'CurrName');
    prdMain.InitRes;
    prdMain.CapFrom := GetRS('fmPayDoc', 'FromDate') + ':';
    lDocsCount.Caption := GetRS(Self.Name,'DocCount');
    PagePositions.Caption := GetRS(Self.Name,'Positions')+' ';
    aMatRsv.Caption := GetRS('fmWaybill', 'RsvInfo');
    aMatMove.Caption := GetRS('fmWaybill', 'MoveInfo');
    aMatInfo.Caption := GetRS('fmWaybill', 'MatInfo');
    aGrpInfo.Caption := GetRS(Self.Name,'GprInfo');
    aSvcInfo.Caption := GetRS('fmWaybill', 'SvcInfo');
    aSvcInfo.Hint := aSvcInfo.Caption;
  end;

  FTitle := Self.Caption;
  SendMessage(ParentHandle, WM_SETPARENTCAPTION, integer(@FTitle), 0);

  inherited;

  TBItemPrintLbl.Caption := rs(Self.Name, 'mnuPrintLbl');
  TBItemDetLabelPrint.Caption := rs(Self.Name, 'mnuPrintLbl');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.UpdateActionList') else _udebug := nil;{$ENDIF}

  if cdsPriceList.Active then begin
    aNew.Enabled := true;
    aProperties.Enabled := (not cdsPriceList.IsEmpty);
    aDel.Enabled := aProperties.Enabled;
    aPatternInsert.Enabled := aProperties.Enabled;
    aRefresh.Enabled := true;
    aPrint.Enabled := aDel.Enabled;
    aPrint.Caption := rs('Common','Print');
    aDynamic.Enabled := False;
    aCheck.Enabled := false;
  end
  else begin
    aNew.Enabled := false;
    aDel.Enabled := false;
    aProperties.Enabled := false;
    aPrint.Enabled := false;
    aDynamic.Enabled := false;
    aCheck.Enabled := false;
    aRefresh.Enabled := True;
  end;//else

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.DoRefresh(const AID: integer; AParam: integer = 0);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.DoRefresh') else _udebug := nil;{$ENDIF}

  case AParam of
   0: begin
       DSRefresh(cdsPriceList, _ID_, AID);
       if cdsPriceList.Active
         then stCount.Caption := (inttostr(cdsPriceList.RecordCount))
         else stCount.Caption := '';
      end;
  end;
  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmPriceList.GetIDForUpdate: integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.GetIDForUpdate') else _udebug := nil;{$ENDIF}

  Result := cdsPriceList.fieldbyname(_ID_).AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.dbgPriceListDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.dbgPriceListDblClick') else _udebug := nil;{$ENDIF}

  if (dbgPriceList.Count>0) and aProperties.Enabled then DoProperties;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.dbgPriceListCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.dbgPriceListCustomDrawCell') else _udebug := nil;{$ENDIF}

  if odd(ANode.Index) and not ASelected then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.dbgPriceListChangeNode(Sender: TObject; OldNode, Node: TdxTreeListNode);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.dbgPriceListChangeNode') else _udebug := nil;{$ENDIF}

  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.dsPriceListDelayedDataChange(Sender: TObject; Field: TField);
  var
    i,j,iimg:integer;
    AColumn: TdxDBTreeListColumn;
    TabName, m, mRestCols :string;
    AField :TField;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.dsPriceListDelayedDataChange') else _udebug := nil;{$ENDIF}

   mdRep.Close; mdRep.FieldDefs.Clear; // memory data set for labels printing
   mdRep.FieldDefs.Add('matname', ftString, 128, True);
   mdRep.FieldDefs.Add('art', ftString, 128, True);
   mdRep.FieldDefs.Add('msrname', ftString, 64, True);
   mdRep.FieldDefs.Add('barcode', ftString, 64, True);
   mdRep.FieldDefs.Add('price', ftString, 256, True);
   mdRep.FieldDefs.Add('labeldescr', ftString, 256, True);

   //Удаление полей из mdListDet
   mdListDet.Close;
   while mdListDet.Fields.Count > 0 do mdListDet.Fields[0].Destroy;
   mdListDet.FieldDefs.Clear;

   //Удаление столбцов из dbgListDet
   while dbgListDet.ColumnCount > 0 do dbgListDet.Columns[0].Destroy;

   if cdsPriceList.RecordCount > 0 then begin
     //Создаём столбец # товара
     AColumn := dbgListDet.CreateColumnEx(TdxDBTreeListColumn, dbgListDet);
     AColumn.Name := 'colNumMat';
     AColumn.FieldName := '';
     AColumn.Tag := -100;
     AColumn.Visible := true;
     AColumn.MinWidth := 30;
     AColumn.Width := 30;
     AColumn.Sizing := false;
     AColumn.Caption := amountPrefix(False);
     AColumn.HeaderAlignment := taCenter;
     AColumn.Alignment := taCenter;

     //Создаём поле PLDetId
     with TIntegerField.Create(mdListDet) do  begin
       FieldName := 'PLDetId';
       Tag := 0;
       FieldKind := fkData;
       DataSet := mdListDet;
       Required := false;
       mdListDet.FieldDefs.Add(FieldName,ftInteger,0,false);
       //Создаём столбец в dbgListDet;
       AColumn := dbgListDet.CreateColumnEx(TdxDBTreeListColumn,dbgListDet);
       AColumn.Name := 'col'+FieldName;
       AColumn.FieldName := FieldName;
       AColumn.Tag := -1;
       AColumn.Visible := false;
       AColumn.Sorted := csUp;
       AColumn.MinWidth := 30;
       AColumn.Width := 30;
       AColumn.Sizing := false;
       AColumn.Caption := amountPrefix(False);
     end; //with

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
       AColumn.Name := 'col'+FieldName;
       AColumn.FieldName := FieldName;
       AColumn.Tag := -1;
       AColumn.Visible := false;
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
           74:  (AColumn as TdxDBTreeListImageColumn).Values.Add('0');
           132: (AColumn as TdxDBTreeListImageColumn).Values.Add('2');
           else (AColumn as TdxDBTreeListImageColumn).Values.Add('');
         end;//case
       end;//for
     end; // with TIntegerField.Create(mdListDet)

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
       AColumn.ReadOnly := true;
       AColumn.FieldName := FieldName;
       AColumn.Tag := 1;
       AColumn.Caption := DisplayLabel;
       AColumn.Alignment := taLeftJustify;
       AColumn.HeaderAlignment := taCenter;
       AColumn.Visible := true;
       AColumn.Width := 50; AColumn.MinWidth := 50;
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
       AColumn.ReadOnly := true;
       AColumn.FieldName := FieldName;
       AColumn.Tag := 2;
       AColumn.Caption := DisplayLabel;
       AColumn.Alignment := taLeftJustify;
       AColumn.HeaderAlignment := taCenter;
       AColumn.Visible := true;
       AColumn.Width := 50; AColumn.MinWidth := 50;
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
       AColumn.ReadOnly := true;
       AColumn.FieldName := FieldName;
       AColumn.Tag := 3;
       AColumn.Caption := DisplayLabel;
       AColumn.Alignment := taLeftJustify;
       AColumn.HeaderAlignment := taCenter;
       AColumn.Visible := true;
       AColumn.Width := 30; AColumn.MinWidth := 30;
     end;

     //Создаём поле c изображением товара
     with TGraphicField.Create(mdListDet) do begin
       FieldName := 'ProdImage';
       Tag := 0;
       FieldKind := fkData;
       Required := false;
       DataSet := mdListDet;
       DisplayLabel := rs(Self.Name, 'ProdImage');
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
     end;

     (*//Создаём поле Image
     with TGraphicField.Create(mdListDet) do  begin
       FieldName := 'ProdImage';
       Tag := 0;
       FieldKind := fkData;
       DataSet := mdListDet;
       Required := false;
       DisplayLabel := rs(Self.Name, 'ProdImage');
       mdListDet.FieldDefs.Add(FieldName, ftGraphic);

       //Создаём столбец в dbgListDet;
       AColumn := dbgListDet.CreateColumnEx(TdxDBTreeListImageColumn, dbgListDet);
       colProdImage := TdxDBTreeListImageColumn(AColumn);
       AColumn.Name := 'col' + FieldName;
       AColumn.FieldName := FieldName;
       AColumn.Tag := 5;
       AColumn.Visible := true;
       AColumn.MinWidth := 25;
       AColumn.Width := 50;
       AColumn.Sizing := true;
       AColumn.Caption := DisplayLabel;
       AColumn.HeaderAlignment := taCenter;
       AColumn.Alignment := taCenter;
       AColumn.DisableEditor := True;
       Application.ProcessMessages;
       {(AColumn as TdxDBTreeListImageColumn).Images := dmData.Images;
       (AColumn as TdxDBTreeListImageColumn).Values.Clear;

       for iimg := 0 to dmData.Images.Count - 1  do begin
         case iimg of
           156: (AColumn as TdxDBTreeListImageColumn).Values.Add('0');
           157: (AColumn as TdxDBTreeListImageColumn).Values.Add('2');
           else (AColumn as TdxDBTreeListImageColumn).Values.Add('');
         end;//case
       end;//for
       }
     end; // with TGraphicField.Create(mdListDet)
     *)

     //Создаём поле barcode
     with TStringField.Create(mdListDet) do  begin
       FieldName := 'barcode';
       Tag := 0;
       FieldKind := fkData;
       Required := false;
       Size := 16;
       DataSet := mdListDet;
       DisplayLabel := rs('Common','Barcode');
       mdListDet.FieldDefs.Add(FieldName,ftString,6,false);
       //Создаём столбец в dbgListDet;
       AColumn := dbgListDet.CreateColumnEx(TdxDBTreeListColumn,dbgListDet);
       AColumn.Name := 'col'+FieldName;
       AColumn.ReadOnly := true;
       AColumn.FieldName := FieldName;
       AColumn.Tag := 3;
       AColumn.Caption := DisplayLabel;
       AColumn.Alignment := taLeftJustify;
       AColumn.HeaderAlignment := taCenter;
       AColumn.Visible := false;
       AColumn.Width := 30; AColumn.MinWidth := 30;
     end;

     with TStringField.Create(mdListDet) do  begin
       FieldName := 'labeldescr';
       Tag := 0;
       FieldKind := fkData;
       Required := false;
       Size := 30;
       DataSet := mdListDet;
       DisplayLabel := rs('Common','Description');
       mdListDet.FieldDefs.Add(FieldName,ftString,6,false);
       //Создаём столбец в dbgListDet;
       AColumn := dbgListDet.CreateColumnEx(TdxDBTreeListColumn,dbgListDet);
       AColumn.Name := 'col'+FieldName;
       AColumn.ReadOnly := true;
       AColumn.FieldName := FieldName;
       AColumn.Tag := 3;
       AColumn.Caption := DisplayLabel;
       AColumn.Alignment := taLeftJustify;
       AColumn.HeaderAlignment := taCenter;
       AColumn.Visible := false;
       AColumn.Width := 30; AColumn.MinWidth := 30;
     end;

     priceColumns.Clear;

     TrStart;
     with newDataSet do
     try
       // Чтение ценовых категорий и запись их в меню_
       ProviderName := 'pPriceTypes_List';
       Open;
       First;
       while not Eof do begin
         //Создаём соответствующее поле
         with TStringField.Create(mdListDet) do  begin
           FieldName := 'aPrice' + inttostr(fieldbyname('ptypeid').AsInteger);
           Tag := fieldbyname('ptypeid').AsInteger;
           FieldKind := fkData;
           Required := false;
           Size := 255;
           DataSet := mdListDet;
           DisplayLabel := fieldbyname('name').AsString;
           mdListDet.FieldDefs.Add(FieldName, ftString, 255, false);
         end;
         //Создаём столбец в dbgListDet;
         AColumn := dbgListDet.CreateColumnEx(TdxDBTreeListColumn,dbgListDet);
         AColumn.Name := 'colPrice' + inttostr(fieldbyname('ptypeid').AsInteger);
         AColumn.ReadOnly := false;
         AColumn.FieldName := 'aPrice' + inttostr(fieldbyname('ptypeid').AsInteger);
         AColumn.Width := 50;
         AColumn.Tag := 0;//Цена
         AColumn.Caption := fieldbyname('name').AsString;
         AColumn.Alignment := taRightJustify;
         AColumn.HeaderAlignment := taCenter;
         AColumn.Visible := false;
         AColumn.MinWidth := 50;
         priceColumns.Append(AColumn.Name); // for easy label printing
         Next;
       end;
       Close;
       for i := 0 to dbgListDet.ColumnCount-1 do begin
         dbgListDet.Columns[i].Visible := false;
         if dbgListDet.Columns[i].Tag <> -100 then dbgListDet.Columns[i].Field.Visible := false;
       end;
     finally
       Free;
     end; // with newDataSet

     mdListDet.DisableControls;
     with newDataSet do
     try
       Screen.Cursor := crSQLWait;
       TabName := cdsPriceList.FieldByName('TableName').AsString;

       //Чтение из PLCols
       ProviderName := 'pPLCols_Get';
       FetchParams;
       Params.ParamByName('plid').AsInteger := cdsPriceList.FieldByName('plid').AsInteger;
       Open;
       First;
       mRestCols := '';

       while not Eof do begin
         AColumn := dbgListDet.FindColumnByFieldName(FieldByName('fname').AsString);

         if AColumn <> nil then begin
           AColumn.Caption := FieldByName('name').AsString;
           AColumn.Index := FieldByName('num').AsInteger;
           AColumn.Visible := (FieldByName('visible').AsInteger = 1);

           if AColumn.Tag <> -100 then AColumn.Field.Visible := AColumn.Visible;

           AColumn.Width := FieldByName('width').AsInteger;
           AColumn.Field.Tag := FieldByName('width').AsInteger;

           case FieldByName('coltype').AsInteger of
             0:begin
               mRestCols := mRestCols + AColumn.Field.FieldName + ', ';
             end;//0-стандартная цена
           end;//case

           case FieldByName('align').AsInteger of
             -1:begin
                  AColumn.Alignment := taLeftJustify;
                  AColumn.Field.Alignment := taLeftJustify;
                end;

             0:begin
                 AColumn.Alignment := taCenter;
                 AColumn.Field.Alignment := taCenter;
               end;

             1:begin
                 AColumn.Alignment := taRightJustify;
                 AColumn.Field.Alignment := taRightJustify;
               end;
           end;//case 'align'
         end // if AColumn <> nil
         else begin
           //Создаём поле
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
             AColumn.Field.Tag := FieldByName('width').AsInteger;
             AColumn.Width := FieldByName('width').AsInteger;
             AColumn.Tag := FieldByName('coltype').AsInteger;
             AColumn.HeaderAlignment := taCenter;
             {if LowerCase(FieldByName('fname').AsString) = 'amount'
               then AColumn.OnGetText := colAmount_GetText;}
             case FieldByName('align').AsInteger of
               -1: AColumn.Alignment := taLeftJustify;
                0: AColumn.Alignment := taCenter;
                1: AColumn.Alignment := taRightJustify;
             end;//case
             AColumn.Index := FieldByName('num').AsInteger;
             AColumn.Visible := FieldByName('VISIBLE').AsInteger=1;
             mRestCols := mRestCols+'PL_X.'+AColumn.Field.FieldName+', ';
           end;//with TStringField.Create(mdListDet)
         end; // else of (if AColumn <> nil)

         Next;
       end; // while not Eof

       Close;
       if mRestCols <> '' then begin
         mRestCols := ', ' + mRestCols;
         mRestCols[Length(mRestCols)-1] := ' ';
       end;

       mdListDet.Open;
       //Чтение из PL_X
       m := '';
       ProviderName := 'pSQL';
       FetchMacros;
       m := 'select PL_X.PLDetId, PL_X.matid, -PL_X.pmatid as pmatid, PL_X.IsGroup'
            + ', mats.name as matname, mats.artikul as art, msr.shortname as msrname, mats.barcode as barcode'
            + ', mats.labeldescr as labeldescr '

            + mRestCols
            + ' from ' + TabName + ' PL_X, materials mats, measures msr '
            + ' where PL_X.IsGroup = 0 and mats.matid = PL_X.matid and msr.mid = mats.mid '

            + ' union all '
            + ' select PL_X.PLDetId, -PL_X.matid as matid, -PL_X.pmatid as pmatid, PL_X.IsGroup, '
            + ' CAST(mg.name as varchar(255)) as matname, CAST(Null as varchar(255)) as art'
            + ', CAST(Null as varchar(6)) as msrname, CAST(Null as varchar(64)) as barcode'
            + ', cast(null as varchar(255)) as labeldescr'
            + mRestCols

            + ' from ' + TabName + ' PL_X, matgroup mg '
            + ' where PL_X.IsGroup = 1 and mg.grpid = PL_X.matid'

            + ' union all'
            + ' select PL_X.PLDetId, PL_X.matid, PL_X.pmatid as pmatid, PL_X.IsGroup,'
            + ' cast(svc.name as varchar(255)) as matname, cast(svc.artikul as varchar(255)) as art'
            + ', msr.shortname as msrname, CAST(Null as varchar(64)) as barcode '
            + ', cast(null as varchar(255)) as labeldescr'
            + mRestCols

            + ' from ' + TabName + ' PL_X, services svc, measures msr '
            + ' where PL_X.IsGroup = 2 and svc.svcid = PL_X.matid and msr.mid = svc.mid '

            + ' union all '
            + ' select PL_X.PLDetId, PL_X.matid as matid, PL_X.pmatid as pmatid, PL_X.IsGroup, '
            + ' CAST(mg.name as varchar(255)) as matname, CAST(Null as varchar(255)) as art'
            + ', CAST(Null as varchar(6)) as msrname, CAST(Null as varchar(64)) as barcode '
            + ', cast(null as varchar(255)) as labeldescr'
            + mRestCols

            + ' from ' + TabName + ' PL_X, services mg '
            + ' where PL_X.IsGroup = 3 and mg.svcid = PL_X.matid';

       Macros.ParamByName('sql').AsString := m;
       Open;
       First;
       while not Eof do begin
         mdListDet.Append;
         for i := 0 to Fields.Count-1 do begin
           AField := mdListDet.FindField(Fields[i].FieldName);
           if AField <> nil then begin
             case AField.DataType of
               ftInteger:
                 begin
                   AField.AsInteger := Fields[i].AsInteger;
                 end;

               ftString:
                 begin
                   AField.AsString := Fields[i].AsString;
                 end;
             end;//case
           end;//if AField<>nil
         end;//for i := 1 to ...
         mdListDet.Post;
         Next;
       end;

     finally //with newDataSet do
       TrCommit;
       mdListDet.EnableControls;
       dbgListDet.FullExpand;
       dbgListDet.ColumnByName('colNumMat').Visible := true;
       mdListDet.SortOnFields('pldetid');
       j := 0;
       ColsWidth := 0;
       for i := 0 to dbgListDet.ColumnCount - 1 do begin
         if dbgListDet.Columns[i].Visible then begin
           dbgListDet.Columns[i].Index := j;
           inc(j);
         end;
       end;//for
       VisColCount := j - 1;
       SetNumMat;
       dbgListDet.GotoFirst;
       Screen.Cursor := crDefault;
       Free;
     end; //with newDataSet do

  end;//if mdListDet.RecordCount>0 then begin

  dbgListDet.Visible := mdListDet.Active;
  Application.ProcessMessages;
  with ExportList do begin
    Clear;
    for i := 0 to dbgListDet.ColumnCount - 1 do begin
      if dbgListDet.Columns[i].Visible  then
         AddObject(dbgListDet.Columns[i].Name, pointer(1));
    end;
  end;//with

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.colRecNoGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.colRecNoGetText') else _udebug := nil;{$ENDIF}

  try
    AText := IntToStr(ANode.Index+1);
  except
    AText := '';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.colPriceGetText') else _udebug := nil;{$ENDIF}

  try
    AText := formatfloat(MoneyDisplayFormat, strtofloat(atext));
  except
    AText := '';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.colSummCurrGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.colSummCurrGetText') else _udebug := nil;{$ENDIF}

  try
    AText := formatfloat(MoneyDisplayFormat, strtofloat(atext));
  except
    AText := '';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.colSummDefGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.colSummDefGetText') else _udebug := nil;{$ENDIF}

  try
    AText := formatfloat(MoneyDisplayFormat, strtofloat(atext));
  except
    AText := '';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.FrameResize(Sender: TObject);
  var
    AStyle: integer;
    Offset: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.FrameResize') else _udebug := nil;{$ENDIF}

  inherited;
  AStyle := GetWindowLong(dbgPriceList.Handle, GWL_STYLE);

  if AStyle and WS_VSCROLL = WS_VSCROLL
    then Offset := 19
    else Offset := 2;

  colName.Width := dbgPriceList.Width - colDocImg.Width -Offset - colOnDate.Width - colCrName.Width;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.edFromDatePropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.edFromDatePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if CanRefresh then DoRefresh(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.edToDatePropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.edToDatePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if CanRefresh then DoRefresh(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.DoShowFilter;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.DoShowFilter') else _udebug := nil;{$ENDIF}

  inherited;
  panFilter.Visible := aShowFilter.Checked;
  Application.ProcessMessages;
  DoRefresh(0);
  FrameResize(Self);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.DoShow;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.DoShow') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmPriceList.pcMainResize(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.pcMainResize') else _udebug := nil;{$ENDIF}

  FrameResize(Self);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.dbgWaybillDetCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.dbgWaybillDetCustomDrawCell') else _udebug := nil;{$ENDIF}

  if odd(ANode.Index) and not ASelected then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.colOnDateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.colOnDateGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatDateTime(ReplaceStr('dd.mm.yyyy', '.', DateSeparator), ANode.Values[colOnDate.Index])
  except
    AText := '';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.DoFind(const AFName, AStr: string; ALocateType: TLocateType; AFwd: Boolean = True);
(*var
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
  *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.DoFind') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmPriceList.TBItemPrintLblClick(Sender: TObject);
  var
    BM:TBookmark;
    i,j,matname,art,msrname,barcode,isgroup,descr: Integer;
    s: String;
    unselect: Boolean;
    pcols: array of Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.TBItemPrintLblClick') else _udebug := nil;{$ENDIF}

  unselect := False;
  with dbgListDet do begin
    if Count = 0 then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

    matname := ColumnByFieldName('matname').Index;
    art     := ColumnByFieldName('art').Index;
    msrname := ColumnByFieldName('msrname').Index;
    barcode := ColumnByFieldName('barcode').Index;
    isgroup := ColumnByFieldName('isgroup').Index;
    descr   := ColumnByFieldName('labeldescr').Index;

    SetLength(pcols, priceColumns.Count);
    for i := 0 to High(pcols) do pcols[i] := ColumnByName(priceColumns[i]).Index;

    //DisableControls;
    //BM := GetBookmark;
    try
      mdRep.Open;
      if (SelectedCount = 0) or (TAction(Sender).Tag = 1) then begin
        unselect := True;
        SelectAll;
      end;

      for i := 0 to SelectedCount - 1 do begin
        if SelectedNodes[i].Values[isgroup] <> 0 then break;

        mdRep.Insert;
        mdRep.FieldValues['matname']    := SelectedNodes[i].Values[matname];
        mdRep.FieldValues['msrname']    := SelectedNodes[i].Values[msrname];
        mdRep.FieldValues['art']        := SelectedNodes[i].Values[art];
        mdRep.FieldValues['labeldescr'] := SelectedNodes[i].Values[descr];

        if BarcodesEnabled
          then mdRep.FieldValues['barcode'] := SelectedNodes[i].Values[barcode]
          else mdRep.FieldValues['barcode'] := '';

        s := '';
        for j := 0 to High(pcols) do begin
          with SelectedNodes[i] do begin
            if VarIsNull(Values[pcols[j]]) or (Values[pcols[j]] = '') then continue;
            s := s + dbgListDet.Columns[pcols[j]].Caption + ': ' + Values[pcols[j]] + #10#13;
          end;
        end; // for j
        mdRep.FieldValues['price'] := s;

      end; // for i

      if BarcodesEnabled
        then SmartShowRep(frReportLabels, 'PriceLabelBC.frf')
        else SmartShowRep(frReportLabels, 'PriceLabel.frf');

    finally
      mdRep.Close;
      //mdRep.Free;
      if unselect then ClearSelection;
      SetNumMat;
    end;
  end; // with dbgListDet

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.aPrintExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.aPrintExecute') else _udebug := nil;{$ENDIF}

  DoPrint(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.cdsPriceListBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.cdsPriceListBeforeOpen') else _udebug := nil;{$ENDIF}

  with cdsPriceList do begin
    ProviderName := 'p_PriceList_List';
    FetchParams;

    if panFilter.Visible
      then Params.ParamByName('fromdate').AsDateTime := prdMain.FromDate
      else Params.ParamByName('fromdate').AsDateTime := MinDateTime;

    if panFilter.Visible
      then Params.ParamByName('todate').AsDateTime := LastSecondInDay(prdMain.ToDate)
      else Params.ParamByName('todate').AsDateTime := MaxDateTime;
  end;//with cdsPriceList do begin

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.dbgListDet1GetImageIndex(Sender: TObject; Node: TdxTreeListNode; var Index: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.dbgListDet1GetImageIndex') else _udebug := nil;{$ENDIF}

  if Node.Values[dbgListDet.ColumnByName('colisgroup').Index] = 1 then begin
    if Node.Expanded
      then Index := 49
      else Index := 48;
  end
  else index := 14;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.frReport11GetValue(const ParName: String; var ParValue: Variant);
  var
    i, colIndex:integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.frReport11GetValue') else _udebug := nil;{$ENDIF}

  if 0 = AnsiCompareText(ParName, 'Cell') then ParValue := dbgListDet.Columns[frUserDataset1.RecNo+2].Field.Value
  else if 0 = AnsiCompareText(ParName, 'Header') then ParValue := dbgListDet.Columns[frUserDataset2.RecNo+2].Caption
  else if 0 = AnsiCompareText(ParName, 'entname') then ParValue := EntName
  else if 0 = AnsiCompareText(ParName, 'reptitle') then ParValue := cdsPriceList.fieldbyname('name').AsString
  else if 0 = AnsiCompareText(ParName, 'notes') then ParValue := cdsPriceList.fieldbyname('notes').AsString
  else if 0 = AnsiCompareText(ParName, 'ondate') then ParValue := DateToStr(cdsPriceList.fieldbyname('ondate').AsDateTime)
  else if 0 = AnsiCompareText(ParName, 'entadr') then ParValue := EntAddr
  else if 0 = AnsiCompareText(ParName, 'entphone') then ParValue := EntPhone;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.frPrintTable1PrintData(Field: TField; Memo: TStringList; View: TfrView; Section: TfrDataSection);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.frPrintTable1PrintData') else _udebug := nil;{$ENDIF}

   if mdListDet.FieldByName('isgroup').AsInteger=1 then begin
     frPrintTable1.Body.Font.Style := [fsBold,fsItalic];
   end
   else begin
     frPrintTable1.Body.Font.Style := [];
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmPriceList.dbgListDetCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.dbgListDetCustomDrawCell') else _udebug := nil;{$ENDIF}

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
procedure TfmPriceList.frReport1PrintColumn(ColNo: Integer; var Width: Integer);
  var
    p: TfrPage;
    tmpw: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.frReport1PrintColumn') else _udebug := nil;{$ENDIF}

  case dbgListDet.Columns[ColNo+1].Alignment of
    taLeftJustify:CurAlign := 0;
    taCenter:CurAlign := 2;
    taRightJustify:CurAlign := 1
  end;//case
  CurWidth := Trunc(dbgListDet.Columns[ColNo+1].Width*(711/ColsWidth));
  Width := CurWidth;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.frReport1BeforePrint(Memo: TStringList;  View: TfrView);
  var
    jpeg: TJPEGImage;
    str: TStream;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.frReport1BeforePrint') else _udebug := nil;{$ENDIF}

  if (View.Name = 'EntLogo')and(cdsPriceList.FieldByName('uselogo').AsInteger = 1)and(EntLogo.Size > 0)
  then begin
    EntLogo.Position := 0;
    TfrPictureView(View).Picture.Bitmap.LoadFromStream(EntLogo);
  end
  else if View.Name = 'MemoH' then begin // header band
    if dbgListDet.Columns[frUserDataset1.RecNo + 2].Name = 'colProdImage'
      then View.dx := 100
      else View.dx := CurWidth;
  end
  else if View.Name = 'MemoC' then begin
    View.dx := CurWidth;
    (View as TfrMemoView).Alignment := CurAlign;
    if dbgListDet.Columns[frUserDataset1.RecNo + 2].Name = 'colProdImage' then begin // here goes image. repositioning.
      View.dx := 0;// to not block the image
    end;

    if mdListDet.FieldByName('isgroup').AsInteger in [1,3] then begin
      (View as TfrMemoView).Font.Style := [fsBold];
      (View as TfrMemoView).Font.Color := clBlack;
      (View as TfrMemoView).FillColor := PLGrpColor;
    end
    else begin
      (View as TfrMemoView).Font.Style := [];
      (View as TfrMemoView).Font.Color := clBlack;
      (View as TfrMemoView).FillColor := clWhite;
    end;
  end
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
procedure TfmPriceList.aMatInfoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.aMatInfoExecute') else _udebug := nil;{$ENDIF}

  with TfrmEditMaterials.Create(nil) do
    try
      ParentNameEx := 'fmMaterials';
      OnDate := Self.OnDate;
      ID := mdListDet.FieldByName('matid').AsInteger;
      CanModify := False;
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.aMatMoveExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.aMatMoveExecute') else _udebug := nil;{$ENDIF}

  with TfrmMatMove.Create(nil) do
    try
      ParentNameEx := 'fmWMat';
      OnDate := Self.OnDate;
      WID := 0;
      ID := mdListDet.FieldByName('matid').AsInteger;
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.aMatRsvExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.aMatRsvExecute') else _udebug := nil;{$ENDIF}

  with TfrmMatRsv.Create(nil) do
    try
     ParentNameEx := 'fmWMat';
     OnDate := Self.OnDate;
     WID := 0;
     ID := mdListDet.FieldByName('matid').AsInteger;
     ShowModal;

   finally
     Free;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.ActionListUpdate') else _udebug := nil;{$ENDIF}

  //inherited;
  aMatInfo.Enabled := (not mdListDet.IsEmpty) and ( mdListDet.FieldByName('isgroup').AsInteger = 0);
  aMatMove.Enabled := aMatInfo.Enabled;
  aMatRsv.Enabled := aMatInfo.Enabled;
  aSvcInfo.Enabled := (not mdListDet.IsEmpty) and ( mdListDet.FieldByName('isgroup').AsInteger = 2 );
  aGrpInfo.Enabled := (not mdListDet.IsEmpty) and ( mdListDet.FieldByName('isgroup').AsInteger = 1 );

  if aGrpInfo.Enabled
    then aGrpInfo.ShortCut := TextToShortCut('Ctrl+I')
    else aGrpInfo.ShortCut := TextToShortCut('');

  if aMatInfo.Enabled
    then aMatInfo.ShortCut := TextToShortCut('Ctrl+I')
    else aMatInfo.ShortCut := TextToShortCut('');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.aGrpInfoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.aGrpInfoExecute') else _udebug := nil;{$ENDIF}

  with TfrmEditMaterials.Create(nil) do
  try
    ParentNameEx := 'fmMaterials';
    OnDate := Self.OnDate;
    cbType.ItemIndex := 1;
    cbType.Enabled := False;
    lcbParent.Enabled := False;
    btnGrp.Enabled := False;
    ID := mdListDet.FieldByName('matid').AsInteger*-1;
    CanModify := False;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.DoLocate(const AID: Integer; ASubID: Integer = 0);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.DoLocate') else _udebug := nil;{$ENDIF}

  cdsPriceList.Locate(_ID_, AID, []);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.aSvcInfoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.aSvcInfoExecute') else _udebug := nil;{$ENDIF}

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
procedure TfmPriceList.colAmount_GetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.colAmount_GetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MatDisplayFormat, RoundToA(StrToFloat(AText), MatDisplayDigits));
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.NotifyChanged;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.NotifyChanged') else _udebug := nil;{$ENDIF}

  if not JumpFromBuffer
    then frmMainForm.AddToBuffer(vtDocs, FunID, Self.Caption, ClassName, Tag, FCurrentID, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.SetOnDate(const Value: TDateTime);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.SetOnDate') else _udebug := nil;{$ENDIF}

  inherited;

  prdMain.BaseDate := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPriceList.frReportLabelsGetValue(const ParName: String; var ParValue: Variant);
  (*var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
    *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPriceList.frReportLabelsGetValue') else _udebug := nil;{$ENDIF}

  if 0 = AnsiCompareText(ParName, 'price') then begin
    ParValue := '';
    for i := 0 to priceColumns.Count - 1 do begin
      //if i > 0 then ParValue := ParValue + ?;
      with dbgListDet.ColumnByName(priceColumns[i]) do begin
        if not Field.IsNull then ParValue := ParValue + Caption + ': ' + Field.Value + #10#13;
      end;
    end; // for
  end; // [price]

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fPriceList', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
