{$I ok_sklad.inc}
unit OrdersInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxCntner6, dxEditor6, StdCtrls, ssBaseConst, xLngDefs,
  ActnList, ssBaseTypes, ssFormStorage, cxLookAndFeelPainters, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit, ssbaseDlg, dxTL6, dxDBCtrl6,
  dxDBGrid6, dxDBTLCl6, dxGrClms6, DB, DBClient, ssClientDataSet,
  ImgList, ssSpeedButton, ssPanel, ssGradientPanel, ssBevel, cxMaskEdit,
  cxDropDownEdit, cxCalendar, ssDBLookupCombo, ssLabel, FR_Class, FR_DSet,
  FR_DBSet, TB2Item, Menus, dxmdaset, xButton, ssDBGrid, okSearchEdit,
  cxCheckBox, ssPeriod, okPeriod, okMoneyFun;

type
  TfrmOrdersInfo = class(TBaseDlg)
    aColOptions: TAction;
    aLocate: TAction;
    aPrint: TAction;
    aPrintDoc: TAction;
    aPrintMain: TAction;
    aRefresh: TAction;
    btnKagent: TssSpeedButton;
    btnLocate: TssSpeedButton;
    btnPrint: TssSpeedButton;
    btnPrintDoc: TssSpeedButton;
    cbDocStatus: TcxComboBox;
    cbDocType: TcxComboBox;
    cdsKAgent: TssClientDataSet;
    cdsView: TssClientDataSet;
    chbGrp: TcxCheckBox;
    colAmount: TdxDBGridColumn;
    colArtikul: TdxDBGridColumn;
    colChecked: TdxDBGridImageColumn;
    colCurrency: TdxDBGridColumn;
    colDocType: TdxDBGridImageColumn;
    colID: TdxDBGridColumn;
    colKAgent: TdxDBGridColumn;
    colMatName: TdxDBGridColumn;
    colMeasure: TdxDBGridColumn;
    colNCurrency: TdxDBGridColumn;
    colNPrice: TdxDBGridColumn;
    colNum: TdxDBGridColumn;
    colOnDate: TdxDBGridColumn;
    colPrice: TdxDBGridColumn;
    colRate: TdxDBGridColumn;
    colType: TdxDBGridColumn;
    colWHouse: TdxDBGridColumn;
    colWID: TdxDBGridColumn;
    edMat: TokMatSearchEdit;
    fdsReport: TfrDBDataSet;
    fdsView: TfrDBDataSet;
    frDoc: TfrReport;
    grdMain: TssDBGrid;
    lcbKAgent: TssDBLookupCombo;
    lDocStatus: TLabel;
    lDocType: TLabel;
    lKAgentF: TLabel;
    lTotalAmount: TssLabel;
    lTotalDocs: TssLabel;
    lTotalSum: TssLabel;
    mdReport: TdxMemData;
    mdReportAllSumm: TStringField;
    mdReportAllSummNDS: TStringField;
    mdReportAllSummNDSOut: TStringField;
    mdReportCurNDS: TFloatField;
    mdReportDocDate: TDateField;
    mdReportdocnum: TStringField;
    mdReportEntName: TStringField;
    mdReportKAFullName: TStringField;
    mdReportMatName: TStringField;
    mdReportMsrName: TStringField;
    mdReportPerson: TStringField;
    mdReportPosAmount: TFloatField;
    mdReportPosNo: TIntegerField;
    mdReportPosPrice: TFloatField;
    mdReportPosSumm: TStringField;
    mdReportPropis: TStringField;
    mdReportReason: TStringField;
    panEmpty: TPanel;
    pmMain: TTBPopupMenu;
    prdMain: TokPeriod;
    srcKAgent: TDataSource;
    srcView: TDataSource;
    ssBevel1: TssBevel;
    ssBevel3: TssBevel;
    ssBevel4: TssBevel;
    ssBevel8: TssBevel;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBSeparatorItem3: TTBSeparatorItem;
    txtTotalAmount: TssBevel;
    txtTotalDocs: TssBevel;
    txtTotalSum: TssBevel;

    procedure aApplyExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aColOptionsExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aLocateExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aPrintDocExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aPrintMainExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure btnKagentClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnPrintDocClick(Sender: TObject);
    procedure cdsViewAfterOpen(DataSet: TDataSet);
    procedure cdsViewBeforeOpen(DataSet: TDataSet);
    procedure chbGrpClick(Sender: TObject);
    procedure colAmountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colCheckedGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colCurrencyGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colDocTypeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colNCurrencyGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colNPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colOnDateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colTypeCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure colTypeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colWHouseGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure DataModified(Sender: TObject);
    procedure edFromDateKeyPress(Sender: TObject; var Key: Char);
    procedure edFromDatePropertiesChange(Sender: TObject);
    procedure edFromDatePropertiesEditValueChanged(Sender: TObject);
    procedure edMatRefButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure frDocGetValue(const ParName: String; var ParValue: Variant);
    procedure grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure grdMainDblClick(Sender: TObject);
    procedure grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure grdMainNeedAdjust(Sender: TObject);
    procedure lcbKAgentPropertiesChange(Sender: TObject);
    procedure lcbKAgentPropertiesInitPopup(Sender: TObject);
    procedure ssBevel3MouseEnter(Sender: TObject);
    procedure ssBevel3MouseLeave(Sender: TObject);

  private
    CanRefresh: Boolean;
    f: Boolean;
    FAttDate: TDateTime;
    FCurrCol: TdxDBTreeListColumn;
    FCurrNode: TdxTreeListNode;
    FDocType: Integer;
    FKAID: Integer;
    FMatName, FReceived, FAttNum: String;
    FMeasureName: String;
    FWHName: String;

    procedure CalcSummary;
    procedure SetGrdWidth;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    procedure SetKAID(const Value: Integer);
    procedure SetDocType(const Value: Integer);

  protected
    procedure setid(const Value: integer); override;
    procedure SetParentName(const Value: string); override;
    procedure SetOnDate(const Value: TDateTime); override;
    procedure GroupData(AGrp: Boolean);

  public
    ParentHandle: HWND;
    WID: Integer;
    procedure SetCaptions; override;
    property KAID: Integer read FKAID write SetKAID;
    property DocType: Integer read FDocType write SetDocType;
  end;

var
  frmOrdersInfo: TfrmOrdersInfo;

implementation

uses 
  prConst, ClientData, prFun, ssFun, ssRegUtils,
  DateUtils, ssDateUtils, prTypes, prRep, udebug;

var 
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}
//==============================================================================================
procedure TfrmOrdersInfo.setid(const Value: integer);
  var
    FWName: String;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmOrdersInfo.setid') else _udebug := nil;{$ENDIF}


  Fid := Value;
  with newDataSet do
   try
     if WID > 0 then begin
       ProviderName := 'pWHouse_Get';
       FetchParams;
       Params.ParamByName('wid').AsInteger := WID;
       Open;
       FWHName := FieldByName('name').AsString;
       FWName := rs(ParentNameEx, 'Title') + ':  ' + FWHName;
       Close;
     end
     else FWName := EmptyStr;

     ProviderName := 'pMat_GetEx';
     FetchParams;
     Params.ParamByName('matid').AsInteger := Value;
     Open;
     if not IsEmpty then begin
       Self.Caption := rs(ParentNameEx, 'MatMoveEx') + ':  ' + FieldByName('name').AsString +
            ' (' + FieldByName('shortname').AsString + ')   ' + FWName;
       FMeasureName := FieldByName('shortname').AsString;
       FMatName := FieldByName('name').AsString;
       DSRefresh(cdsView, 'posid', 0);
     end;
     Close;
   finally
     Free;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  (*
  var
    NewRecord: boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmOrdersInfo.FormCloseQuery') else _udebug := nil;{$ENDIF}

     if ModalResult in [mrOK, mrYes] then begin
      CanClose := False;
      with TClientDataSet.Create(nil) do
       try
        TrStart;
       try
        RemoteServer := dmData.SConnection;
        ProviderName := prvTemp;

        NewRecord := ID=0;
        if ID=0 then begin
         ProviderName := 'pUserGroups_Max';
         Open;
         FID := Fields[0].AsInteger+1;
         Close;
        end;

        if NewRecord
         then ProviderName := 'pUserGroups_Ins'
         else ProviderName := 'pUserGroups_Upd';
        FetchParams;
        Params.ParamByName('grpid').AsInteger := ID;
        Params.ParamByName('name').AsString := edName.Text;
        Execute;

        TrCommit;

        SendMessage(MainHandle, WM_REFRESH, ID, 0);
        if (ModalResult=mrYes) then
         if NewRecord then begin
          edName.Text := EmptyStr;
          edName.SetFocus;
          FID := 0;
         end
         else
        else CanClose := True;
        FModified := False;
       finally
        Free;
       end;
       except
        on e:exception do begin
         TrRollback;
         MessageDlg(e.Message, mtError, [mbOk], 0);
        end;
       end;

     end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmOrdersInfo.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.ActionListUpdate') else _udebug := nil;{$ENDIF}

  aOk.Enabled := True;
  //aApply.Enabled := aOk.Enabled and FModified;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.DataModified(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.DataModified') else _udebug := nil;{$ENDIF}

  FModified := True;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.aApplyExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.aApplyExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrYes;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.aOKExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.aOKExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrOK;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.aCancelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.aCancelExecute') else _udebug := nil;{$ENDIF}
  
  ModalResult := mrCancel;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.SetCaptions') else _udebug := nil;{$ENDIF}


  inherited;

  with LangMan do begin
    Self.Caption := GetRS('fmOrders', 'OrdersInfoEx') + ': ' + lcbKAgent.Text;

    aOK.Caption := GetRS('Common', 'OK');
    aCancel.Caption := GetRS('Common', 'Cancel');
    aColOptions.Caption := GetRS('Common', 'ColOptions') + '...';
    panEmpty.Caption := GetRS('fmOrders', 'NoOrders');
    with cbDocType do begin
      Properties.Items.Add(GetRS('Common', 'All'));
      Properties.Items.AddObject(GetRS('frmOptions', 'OrdersIn'), Pointer(16));
      Properties.Items.AddObject(GetRS('frmOptions', 'OrdersOut'), Pointer(-16));
      ItemIndex := 0;
    end;
    with cbDocStatus do begin
      Properties.Items.Add(GetRS('fmOrders', 'AllOrders'));
      Properties.Items.Add(GetRS('fmOrders', 'OnlyActiveOrders'));
      ItemIndex := 0;
    end;

    lcbKAgent.DisplayEmpty := GetRS('Common', 'All');
    prdMain.InitRes;
    prdMain.CapFrom := GetRS('fmPayDoc', 'FromDate') + ':';

    //lFromDate.Caption := GetRS('fmWaybill', 'FromDate');
    //lToDate.Caption := GetRS('fmWaybill', 'ToDate');

    lKAgentF.Caption := GetRS('fmWaybill', 'KAgent') + ':';
    lDocType.Caption := GetRS('fmWaybill', 'DocType') + ':';
    lDocStatus.Caption := GetRS('fmOrders', 'ToShow') + ':';

    lTotalSum.Caption := GetRS('fmWMat', 'OnSum') + ':';
    lTotalDocs.Caption := GetRS('fmOrders', 'TotalDocs') + ':';
    lTotalAmount.Caption := GetRS('fmOrders', 'TotalMat') + ':';
    chbGrp.Properties.Caption := GetRS('fmOrders', 'GrpByOrders');
    aRefresh.Caption := GetRS('Common', 'Refresh');

    with grdMain do begin
      Bands[0].Caption := GetRS('fmWMat', 'Doc');
      Bands[1].Caption := GetRS('fmWMat', 'Mat');
      Bands[2].Caption := GetRS('fmWMat', 'PriceEx');
    end;

    colNum.Caption := GetRS('fmOrders', 'OrderNum');
    colChecked.Caption := '';
    colOnDate.Caption := GetRS('fmWMat', 'Date');
    colAmount.Caption := GetRS('fmWMat', 'Amount');
    colWHouse.Caption := GetRS('fmWMat', 'Title');
    colPrice.Caption := GetRS('fmWMat', 'InCurr');
    colCurrency.Caption := GetRS('fmWMat', 'Currency');
    colRate.Caption := GetRS('fmWMat', 'Rate');
    colNPrice.Caption := GetRS('fmWMat', 'InNCurr');
    colNCurrency.Caption := GetRS('fmWMat', 'Currency');
    colKAgent.Caption := GetRS('fmWMat', 'KAgent');
    colMatName.Caption := GetRS('fmMaterials', 'Name');
    colArtikul.Caption := GetRS('fmMaterials', 'Artikul');
    colMeasure.Caption := GetRS('fmWaybill', 'Measure');

    aPrint.Caption := GetRS('Common', 'Print');
    //aPrintMain.Caption := GetRS('', 'PrintMain');
    //btnPrint.Hint := GetRS('Common', 'PrintMain');
    aPrintDoc.Caption := GetRS('fmWMat', 'Doc');
    btnPrintDoc.Hint := GetRS('fmWMat', 'DocPreview');
    btnKAgent.Hint := GetRS('fmWaybill', 'KAAdd');;

    aLocate.Caption := GetRS('Common', 'Jump');
    btnLocate.Hint := GetRS('Common', 'Jump');

    edMat.InitRes;
    edMat.Caption.Caption := GetRS('fmMaterials', 'Mat') + ':';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.SetParentName') else _udebug := nil;{$ENDIF}


  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.cdsViewBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.cdsViewBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsView.Params.ParamByName('matid').AsInteger := edMat.MatID;

  if prdMain.FromDate <= 0
    then cdsView.Params.ParamByName('fromdate').AsDateTime := MinDateTime
    else cdsView.Params.ParamByName('fromdate').AsDateTime := prdMain.FromDate;

  if (prdMain.ToDate = 0) or (prdMain.ToDate = MaxDateTime)
    then cdsView.Params.ParamByName('todate').AsDateTime := MaxDateTime
    else cdsView.Params.ParamByName('todate').AsDateTime := LastSecondInDay(prdMain.ToDate);

  if lcbKAgent.EmptyValue <> lcbKAgent.KeyValue
    then cdsView.Params.ParamByName('kaid').AsInteger := lcbKAgent.KeyValue
    else cdsView.Params.ParamByName('kaid').AsInteger := 0;

  if cbDocType.ItemIndex > 0
    then cdsView.Params.ParamByName('wtype').AsInteger := 
         Integer(cbDocType.Properties.Items.Objects[cbDocType.ItemIndex])
    else cdsView.Params.ParamByName('wtype').AsInteger := 0;  

  cdsView.Params.ParamByName('checked').AsInteger := cbDocStatus.ItemIndex;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.colPriceGetText') else _udebug := nil;{$ENDIF}

  try
    if not VarIsNull(ANode.Values[colDocType.Index])
           and (ANode.Values[colDocType.Index] = 1) and (not ShowPrices)
      then AText := rs('Common', 'NA')
      else AText := FormatFloat(PriceDisplayFormat, StrToFloat(AText));
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.SetOnDate(const Value: TDateTime);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.SetOnDate') else _udebug := nil;{$ENDIF}


  inherited;

  prdMain.BaseDate := Value;
  prdMain.LoadFromRegistry;
  if prdMain.PeriodType = ptCustom then
    if Value = MaxDateTime
      then prdMain.ToDate := Date
      else prdMain.ToDate := Value;
  CanRefresh := True;
  edFromDatePropertiesEditValueChanged(prdMain);
  

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.SetGrdWidth;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.SetGrdWidth') else _udebug := nil;{$ENDIF}

  AdjustGrid(grdMain, colWHouse);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.cdsViewAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.cdsViewAfterOpen') else _udebug := nil;{$ENDIF}

  //SetGrdWidth;
  panEmpty.Visible := DataSet.IsEmpty;
  CalcSummary;
  grdMain.FullExpand;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.colNPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.colNPriceGetText') else _udebug := nil;{$ENDIF}

  try
    with ANode do
      if not VarIsNull(ANode.Values[colDocType.Index]) and
        (ANode.Values[colDocType.Index] = 1) and (not ShowPrices)
        then AText := rs('Common', 'NA')
        else AText := FormatFloat(PriceDisplayFormat, RoundToA(ANode.Values[colRate.Index] *
             ANode.Values[colPrice.Index], PriceDisplayDigits));
  except
  end;      

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.colNCurrencyGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.colNCurrencyGetText') else _udebug := nil;{$ENDIF}

  AText := BaseCurrName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.aPrintExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.aPrintExecute') else _udebug := nil;{$ENDIF}


  {}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.FormCreate(Sender: TObject);
  var
    Temp: TDateTime;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  CanRefresh := False;
  prdMain.RegistryPath := MainRegKey + '\' + Self.Name;
  grdMain.LoadFromRegistry(MainRegKey + '\' + Self.Name);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.FormDestroy') else _udebug := nil;{$ENDIF}

  prdMain.SaveToRegistry;
  grdMain.SaveToRegistry(MainRegKey + '\' + Self.Name);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.edFromDateKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.edFromDateKeyPress') else _udebug := nil;{$ENDIF}

  if (Key = #13) and (TcxDateEdit(Sender).Text <> EmptyStr) then begin
    TcxDateEdit(Sender).Date := StrToDate(TcxDateEdit(Sender).Text);
    TcxDateEdit(Sender).EditValue := TcxDateEdit(Sender).Date;
    if CanRefresh then DSRefresh(cdsView, 'posid', 0);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.edFromDatePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.edFromDatePropertiesChange') else _udebug := nil;{$ENDIF}


  if not f then begin
    f := True;
    if (TcxDateEdit(Sender).Text = EmptyStr) then begin
      TcxDateEdit(Sender).EditValue := 0;
      TcxDateEdit(Sender).EditText := EmptyStr;
    end;
    f := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.edFromDatePropertiesEditValueChanged(
  Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.edFromDatePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}


  Self.Caption := rs('fmOrders', 'OrdersInfoEx') + ': ' + lcbKAgent.Text;
  if CanRefresh then DSRefresh(cdsView, 'posid', 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.lcbKAgentPropertiesInitPopup(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.lcbKAgentPropertiesInitPopup') else _udebug := nil;{$ENDIF}


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
procedure TfrmOrdersInfo.lcbKAgentPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.lcbKAgentPropertiesChange') else _udebug := nil;{$ENDIF}


  if lcbKAgent.Text = EmptyStr then lcbKAgent.ItemIndex := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.btnKagentClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.btnKagentClick') else _udebug := nil;{$ENDIF}


  ShowModalRef(Self, rtKAgent, vtKAgent, 'TfmKAgent', Self.OnDate,
    lcbKAgent.KeyValue);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.WMRefresh') else _udebug := nil;{$ENDIF}


  case M.LParam of
   Integer(rtMat):
     edMat.MatID := M.WParam;
   Integer(rtKAgent):
     begin
       if not cdsKAgent.Active then cdsKAgent.Open;
       lcbKAgent.KeyValue := M.WParam;
     end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.CalcSummary;
var
  i: Integer;
  FSum, FAmount: Extended;
  BM: TBookmark;
  FList: TList;
  FDocCount: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.CalcSummary') else _udebug := nil;{$ENDIF}


  FList := TList.Create;
  with cdsView do begin
    BM := GetBookmark;
    DisableControls;
    try
      First;
      FDocCount := 0;
      FAmount := 0;
      FSum := 0;
      while not Eof do begin
        FAmount := FAmount + FieldByName('amount').AsFloat;
        FSum := FSum + RoundToA(FieldByName('amount').AsFloat * FieldByName('price').AsFloat *
          FieldByName('onvalue').AsFloat, -2);
        if FList.IndexOf(Pointer(FieldByName('wbillid').AsInteger)) = -1 then begin
          FList.Add(Pointer(FieldByName('wbillid').AsInteger));
          Inc(FDocCount);
        end;
        Next;
      end;
    finally
      GotoBookmark(BM);
      FreeBookmark(BM);
      EnableControls;
    end;
  end;
  FList.Free;

  txtTotalDocs.Caption := IntToStr(FDocCount);
  txtTotalAmount.Caption := FormatFloat(MatDisplayFormat, FAmount);
  txtTotalSum.Caption := FormatFloat(MoneyDisplayFormat, FSum);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.frDocGetValue(const ParName: String; var ParValue: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.frDocGetValue') else _udebug := nil;{$ENDIF}


  if 0 = AnsiCompareText(ParName, 'basecurrname') then ParValue := BaseCurrName else
  if 0 = AnsiCompareText(ParName, 'wname') then
    if WID = 0 then ParValue := rs('Common', 'All')
      else ParValue := FWHName else
  if 0 = AnsiCompareText(ParName, 'matname') then ParValue := FMatName else
  if 0 = AnsiCompareText(ParName, 'personname') then ParValue := mdReport.FieldByName('person').AsString else
  if 0 = AnsiCompareText(ParName, 'measure') then ParValue := FMeasureName else
  if 0 = AnsiCompareText(ParName, 'fromdate') then begin
    if prdMain.FromDate <= 0
      then ParValue := '__________'
      else ParValue := prdMain.FromDate;
  end else
  if 0 = AnsiCompareText(ParName, 'todate') then begin
    if prdMain.ToDate = 0
      then ParValue := '__________'
      else ParValue := prdMain.ToDate;
  end else
  if 0 = AnsiCompareText(ParName, 'RECEIVED') then ParValue := FReceived else
  if 0 = AnsiCompareText(ParName, 'att') then
    if Trim(FAttNum) <> EmptyStr
      then ParValue := FAttNum + ' ' + DateToStr(FAttDate);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.aPrintMainExecute(Sender: TObject);
  (*var
    BM: TBookmark;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
    *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.aPrintMainExecute') else _udebug := nil;{$ENDIF}

  if not ShowPrices then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  SmartShowRep(frDoc, 'MatMove.frf', False);

  with cdsView do
    try
      DisableControls;
      BM := GetBookmark;
      frDoc.ShowReport;

    finally
      GotoBookmark(BM);
      FreeBookmark(BM);
      EnableControls;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmOrdersInfo.btnPrintClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.btnPrintClick') else _udebug := nil;{$ENDIF}


  aPrintMain.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.aPrintDocExecute(Sender: TObject);
var
  FKAName, FDocNum, FSumStr: String;
  FDocDate: TDateTime;
  FID: Integer;
  FReason, FPerson, FCurrName: String;
  FCurrRate: Extended;
  FNDS, FSumWithoutNDS, FSumWithoutNDSPos, FSumNDS, FSumNDSPos: Extended;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.aPrintDocExecute') else _udebug := nil;{$ENDIF}


  if cdsView.IsEmpty then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;


  FID := cdsView.fieldbyname('wbillid').AsInteger;
  case cdsView.FieldByName('wtype').AsInteger of
    1: if ShowPrices then xRep.ShowRep(rtWBIn, FID);
    5: xRep.ShowRep(rtWBRest, FID);
   -1: xRep.ShowRep(rtWBOut, FID);
   -5: xRep.ShowRep(rtWriteOff, FID);
   -6: xRep.ShowRep(rtReturnOut, FID);
    6: xRep.ShowRep(rtReturnIn, FID);
    4: xRep.ShowRep(rtWBMove, FID);
  end;

  {with newDataSet do
    try
      mdReport.Close;
      mdReport.Open;
      ProviderName := 'pWayBill_GetHeader';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := FID;
      Open;
      FKAName := FieldByName('fullname').AsString;
      FDocNum := FieldByName('num').AsString;
      FDocDate := FieldByName('ondate').AsDateTime;
      FReason := FieldByName('reason').AsString;
      FPerson := FieldByName('personname').AsString;
      FCurrName := FieldByName('shortname').AsString;
      FCurrRate := FieldByName('onvalue').AsFloat;
      FReceived := FieldByName('received').AsString;
      FAttNum := FieldByName('attnum').AsString;
      FAttDate := FieldByName('attdate').AsDateTime;
      FNDS := FieldByName('nds').AsFloat;
      Close;

      ProviderName := 'pWaybillDet_Get';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := FID;
      Open;
      FSumWithoutNDS := 0;
      FSumNDS := 0;
      while not Eof do begin
        NDSCalc(FieldByName('amount').AsFloat, FieldByName('price').AsFloat *
          FCurrRate, FNDS, 1, FSumWithoutNDSPos, FSumNDSPos);
        FSumWithoutNDS := FSumWithoutNDS + FSumWithoutNDSPos;
        FSumNDS := FSumNDS + FSumNDSPos;
        Next;
      end;

      First;
      while not Eof do begin
        mdReport.Append;
        mdReport.FieldByName('docnum').AsString := FDocNum;
        mdReport.FieldByName('docdate').AsDateTime := FDocDate;
        mdReport.FieldByName('kafullname').AsString := FKAName;
        mdReport.FieldByName('reason').AsString := FReason;
        mdReport.FieldByName('person').AsString := FPerson;
        mdReport.FieldByName('entname').AsString := EntName;
        mdReport.FieldByName('posno').AsInteger := RecNo;
        mdReport.FieldByName('posmatname').AsString := FieldByName('matname').AsString;
        mdReport.FieldByName('posmsrname').AsString := FieldByName('msrname').AsString;
        mdReport.FieldByName('posamount').AsFloat := FieldByName('amount').AsFloat;
        mdReport.FieldByName('posprice').AsFloat := FieldByName('price').AsFloat * FCurrRate;
        mdReport.FieldByName('possumm').AsFloat := RoundToA(FieldByName('price').AsFloat *
          FieldByName('amount').AsFloat * FCurrRate, -2);
        mdReport.FieldByName('curnds').AsFloat := FNDS;
        mdReport.FieldByName('allsummnds').AsFloat := FSumNDS;
        mdReport.FieldByName('allsummndsout').AsFloat := FSumWithoutNDS;
        mdReport.FieldByName('allsumm').AsFloat := FSumNDS + FSumWithoutNDS;
        FSumStr := MoneyToStr(FSumWithoutNDS + FSumNDS);
        FSumStr := AnsiUpperCase(FSumStr[1]) + Copy(FSumStr, 2, Length(FSumStr) - 1);
        mdReport.FieldByName('propis').AsString := FSumStr;
        mdReport.Post;
        Next;
      end;
      Close;

    finally
      Free;
    end;

//  frDoc.DesignReport;
  frDoc.ShowReport;
}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.btnPrintDocClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.btnPrintDocClick') else _udebug := nil;{$ENDIF}


  aPrintDoc.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.ssBevel3MouseEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.ssBevel3MouseEnter') else _udebug := nil;{$ENDIF}

  with Sender as TssBevel do
    if HotTrack then bvlFooterSep.ColorInner := HotTrackColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmOrdersInfo.ssBevel3MouseLeave(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.ssBevel3MouseLeave') else _udebug := nil;{$ENDIF}

  with Sender as TssBevel do
    if HotTrack then bvlFooterSep.ColorInner := clBtnShadow;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmOrdersInfo.grdMainDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.grdMainDblClick') else _udebug := nil;{$ENDIF}

  if grdMain.Count > 0 then aPrintDoc.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.colTypeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
 var
   FType: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.colTypeGetText') else _udebug := nil;{$ENDIF}

  try
    FType := ANode.Values[colDocType.Index];

    case FType of
        1: AText := rs('Common', 'DocWBIn');
       -1: AText := rs('Common', 'DocWBOut');
        5: AText := rs('Common', 'DocWBRest');
       -5: AText := rs('Common', 'DocWriteOff');
       -6: AText := rs('Common', 'DocWBRetOut');
        6: AText := rs('Common', 'DocWBRetIn');
        4: AText := rs('Common', 'DocWBMove');
       16: AText := rs('Common', 'DocOrderIn');
      -16: AText := rs('Common', 'DocOrderOut');
    end;

  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.colTypeCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.colTypeCustomDrawCell') else _udebug := nil;{$ENDIF}

  if not ASelected then AFont.Color := clMaroon;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.colWHouseGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.colWHouseGetText') else _udebug := nil;{$ENDIF}

  if VarToStr(ANode.Values[colToWH.Index]) <> EmptyStr
    then AText := AText + ' -> ' + VarToStr(ANode.Values[colToWH.Index]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmOrdersInfo.aColOptionsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.aColOptionsExecute') else _udebug := nil;{$ENDIF}

  grdMain.ShowColOptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.grdMainGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := rs('fmOrders', 'OrdersInfo');
  ImgList := dmData.Images;
  AIndex := 203;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.grdMainNeedAdjust(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.grdMainNeedAdjust') else _udebug := nil;{$ENDIF}

  SetGrdWidth;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.colAmountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.colAmountGetText') else _udebug := nil;{$ENDIF}

  try AText := FormatFloat(MatDisplayFormat, StrToFloat(AText)); except end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.grdMainCustomDrawCell') else _udebug := nil;{$ENDIF}

  if not ANode.HasChildren and Odd(ANode.Index) and not ASelected
    then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.aLocateExecute(Sender: TObject);
  var
    FWType: Integer;
    FClass: string;
    FViewType: TCCViewType;
    FGType: Integer;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.aLocateExecute') else _udebug := nil;{$ENDIF}

  if cdsView.IsEmpty then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  FWType := cdsView.FieldByName('wtype').AsInteger;
  with LocateInfo do begin
    FGType := 0;
    case FWType of
        1: begin
             FClass := 'TfmWaybill';
             FViewType := vtDocs;
           end;

       16: begin
             FClass := 'TfmOrders';
             FViewType := vtDocs;
             FGType := 16;
           end;

      -16: begin
             FClass := 'TfmOrders';
             FViewType := vtDocs;
             FGType := -16;
           end;
    end;
    ViewType := FViewType;
    ClassName := FClass;
    ID := cdsView.FieldByName('docid').AsInteger;
    GType := FGType;
  end;
  PostMessage(frmMainForm.Handle, WM_OK_EXECLOCATE, Integer(@LocateInfo), 0);
  Close;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmOrdersInfo.colOnDateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.colOnDateGetText') else _udebug := nil;{$ENDIF}

  AText := DateToStr(ANode.Values[colOnDate.Index]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.colCurrencyGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.colCurrencyGetText') else _udebug := nil;{$ENDIF}

  if VarToStr(ANode.Values[colPrice.Index]) = ''
    then AText := '';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.colCheckedGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.colCheckedGetText') else _udebug := nil;{$ENDIF}

  if AText = '' then AText := '-1';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.colDocTypeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.colDocTypeGetText') else _udebug := nil;{$ENDIF}

  if ANode.Values[colChecked.Index] = 1
    then if ANode.Values[colDocType.Index] = 16
      then AText := '1016'
      else AText := '-1016';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.aRefreshExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.aRefreshExecute') else _udebug := nil;{$ENDIF}

  DSRefresh(cdsView, 'posid', 0); 

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.SetKAID(const Value: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.SetKAID') else _udebug := nil;{$ENDIF}

  FKAID := Value;
  if lcbKAgent.KeyValue <> Value then begin
    if not cdsKAgent.Active then cdsKAgent.Open;
    lcbKAgent.KeyValue := Value;
  end;  

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.SetDocType(const Value: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.SetDocType') else _udebug := nil;{$ENDIF}

  FDocType := Value;

  cbDocType.ItemIndex := cbDocType.Properties.Items.IndexOfObject(Pointer(Value));
  cbDocType.Enabled := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.chbGrpClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.chbGrpClick') else _udebug := nil;{$ENDIF}

  GroupData(chbGrp.Checked);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.GroupData(AGrp: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.GroupData') else _udebug := nil;{$ENDIF}

  if AGrp then begin
    grdMain.AddGroupColumn(colNum);
    grdMain.FullExpand;
  end
  else begin
    grdMain.DeleteGroupColumn(0);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmOrdersInfo.edMatRefButtonClick(Sender: TObject);
  var
    AID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmOrdersInfo.edMatRefButtonClick') else _udebug := nil;{$ENDIF}

  try
    AID := edMat.MatID;
  except
    AID := 0;
  end;

  edMat.Editor.SetFocus;
  ShowModalRef(Self, rtMat, vtMat, 'TfmMaterials', Self.OnDate, AID);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('OrdersInfo', @Debugging, DEBUG_group_ID);{$ENDIF}
    
//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
