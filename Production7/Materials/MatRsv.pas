{$I ok_sklad.inc}
unit MatRsv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxCntner6, dxEditor6, StdCtrls, ssBaseConst, xLngDefs,
  ActnList, ssBaseTypes, ssFormStorage, cxLookAndFeelPainters, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit, ssbaseDlg, dxTL6, dxDBCtrl6,
  dxDBGrid6, dxDBTLCl6, dxGrClms6, DB, DBClient, ssClientDataSet,
  ImgList, ssSpeedButton, ssPanel, ssGradientPanel, ssBevel, cxMaskEdit,
  cxDropDownEdit, cxCalendar, ssDBLookupCombo, ssLabel, FR_Class, FR_DSet,
  FR_DBSet, TB2Item, Menus, dxmdaset, xButton, ssDBGrid, dxDBTL6, ssPeriod,
  okPeriod, okMoneyFun;

type
  TfrmMatRsv = class(TBaseDlg)
    aColOptions: TAction;
    aPrint: TAction;
    aPrintDoc: TAction;
    aPrintMain: TAction;
    aRefresh: TAction;
    btnKagent: TssSpeedButton;
    btnPrint: TssSpeedButton;
    btnPrintDoc: TssSpeedButton;
    cbDocType: TcxComboBox;
    cdsKAgent: TssClientDataSet;
    cdsRsv_Temp: TssClientDataSet;
    cdsView: TssClientDataSet;
    cdsWHouse: TssClientDataSet;
    colAmount: TdxDBGridColumn;
    colCurrency: TdxDBGridColumn;
    colDocType: TdxDBGridImageColumn;
    colID: TdxDBGridColumn;
    colKAName: TdxDBGridColumn;
    colNCurrency: TdxDBGridColumn;
    colNPrice: TdxDBGridColumn;
    colNum: TdxDBGridColumn;
    colOnDate: TdxDBGridColumn;
    colPrice: TdxDBGridColumn;
    colPriceIn: TdxDBGridColumn;
    colRate: TdxDBGridColumn;
    colType: TdxDBGridColumn;
    colWHouse: TdxDBGridColumn;
    fdsReport: TfrDBDataSet;
    fdsView: TfrDBDataSet;
    frDoc: TfrReport;
    grdMain: TssDBTreeList;
    lAmount: TssLabel;
    lcbKAgent: TssDBLookupCombo;
    lDocType: TLabel;
    lKAgentF: TLabel;
    lTotal: TssLabel;
    mdMain: TdxMemData;
    mdMainamount: TFloatField;
    mdMainkagentname: TStringField;
    mdMainkaid: TIntegerField;
    mdMainname: TStringField;
    mdMainnum: TStringField;
    mdMainondate: TDateTimeField;
    mdMainonvalue: TFloatField;
    mdMainpid: TIntegerField;
    mdMainposid: TIntegerField;
    mdMainprice: TFloatField;
    mdMainpricein: TFloatField;
    mdMainshortname: TStringField;
    mdMainwbillid: TIntegerField;
    mdMainwtype: TIntegerField;
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
    mdReportOnValue: TFloatField;
    mdReportPerson: TStringField;
    mdReportPosAmount: TFloatField;
    mdReportPosNo: TIntegerField;
    mdReportPosPrice: TFloatField;
    mdReportPosSumm: TStringField;
    mdReportPropis: TStringField;
    mdReportReason: TStringField;
    panEmpty: TPanel;
    panFooter: TPanel;
    pmMain: TTBPopupMenu;
    prdMain: TokPeriod;
    srcKAgent: TDataSource;
    srcMain: TDataSource;
    ssBevel3: TssBevel;
    ssBevel4: TssBevel;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem5: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSubmenuItem1: TTBSubmenuItem;
    txtAmount: TssBevel;
    txtTotal: TssBevel;

    procedure aApplyExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aColOptionsExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aOKExecute(Sender: TObject);
    procedure aPrintDocExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aPrintMainExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure btnKagentClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnPrintDocClick(Sender: TObject);
    procedure cbDocTypePropertiesEditValueChanged(Sender: TObject);
    procedure cdsViewAfterOpen(DataSet: TDataSet);
    procedure cdsViewBeforeOpen(DataSet: TDataSet);
    procedure cdsWHouseBeforeOpen(DataSet: TDataSet);
    procedure colAmountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colDocTypeCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure colDocTypeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colNCurrencyGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colNPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colTypeCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure colTypeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure DataModified(Sender: TObject);
    procedure edFromDateKeyPress(Sender: TObject; var Key: Char);
    procedure edFromDatePropertiesChange(Sender: TObject);
    procedure edFromDatePropertiesEditValueChanged(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure frDocGetValue(const ParName: String; var ParValue: Variant);
    procedure grdMainDblClick(Sender: TObject);
    procedure grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure grdMainMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure lcbKAgentPropertiesChange(Sender: TObject);
    procedure lcbKAgentPropertiesInitPopup(Sender: TObject);
    procedure srcMainDataChange(Sender: TObject; Field: TField);
    procedure ssBevel3MouseEnter(Sender: TObject);
    procedure ssBevel3MouseLeave(Sender: TObject);

  private
    CanRefresh: Boolean;
    f: Boolean;
    FAttDate: TDateTime;
    FCurrCol: TdxDBTreeListColumn;
    FCurrNode: TdxTreeListNode;
    FDocDate: TDateTime;
    FDocNum, FKAName, FPerson, FKAAddr, FKAPhone: string;
    FMatName, FReceived, FAttNum: String;
    FMeasureName: String;
    FSummAll: Extended;
    FWHName, WHIn, WHOut: String;

    procedure CalcSummary;
    procedure SetGrdWidth;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    procedure BuildRsv;

  protected
    procedure setid(const Value: integer); override;
    procedure SetParentName(const Value: string); override;
    procedure SetOnDate(const Value: TDateTime); override;

  public
    ParentHandle: HWND;
    WID: Integer;
    procedure SetCaptions; override;
  end;

var
  frmMatRsv: TfrmMatRsv;

implementation

uses
  prConst, ClientData, prFun, ssFun, ssRegUtils,
  DateUtils, ssDateUtils, prTypes, prRep, ssStrUtil, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}
//==============================================================================================
procedure TfrmMatRsv.setid(const Value: integer);
  var
    FWName: String;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmMatRsv.setid') else _udebug := nil;{$ENDIF}

  Fid := Value;

  with newDataSet do
  try
    ProviderName := 'pWMat_GetAllRsv';
    FetchParams;
    Params.ParamByName('matid').AsInteger := Value;
    Open;
    panEmpty.Visible := Fields[0].AsInteger = 0;
    Close;

    if panEmpty.Visible then begin
      ProviderName := 'pWMat_GetTurn';
      FetchParams;
      FetchMacros;
      Params.ParamByName('matid').AsInteger := Value;
      if WID > 0 then Macros.ParamByName('m').AsString := ' and wmt.wid=' + IntToStr(WID);
      Open;
      if Fields[0].AsInteger = 0 then panEmpty.Caption := rs(ParentNameEx, 'NoMat') + #13#10#13#10;
      Close;
    end;

    if WID > 0 then begin
      ProviderName := 'pWHouse_Get';
      FetchParams;
      Params.ParamByName('wid').AsInteger := WID;
      Open;
      FWHName := FieldByName('name').AsString;
      FWName := rs(ParentNameEx, 'Title') + ':  ' + FWHName;
      Close;
    end
    else FWName := '';

    ProviderName := 'pMat_GetEx';
    FetchParams;
    Params.ParamByName('matid').AsInteger := Value;
    Open;

    if not IsEmpty then begin
      Self.Caption := rs(ParentNameEx, 'MatRsv') + ':  ' + FieldByName('name').AsString +
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
procedure TfrmMatRsv.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  (*var
    NewRecord: boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  *)
begin
  (*if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.FormCloseQuery') else _udebug := nil;{$ENDIF}

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
          edName.Text := '';
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
procedure TfrmMatRsv.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.ActionListUpdate') else _udebug := nil;{$ENDIF}

  aOk.Enabled := True;
  //aApply.Enabled := aOk.Enabled and FModified;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.DataModified') else _udebug := nil;{$ENDIF}

  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.aApplyExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.aApplyExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrYes;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.aOKExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.aOKExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrOK;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.aCancelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.aCancelExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrCancel;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  CanRefresh := False;
  with LangMan do begin
    aOK.Caption := GetRS('Common', 'OK');
    aRefresh.Caption := GetRS('Common', 'Refresh');
    aCancel.Caption := GetRS('Common', 'Cancel');
    aColOptions.Caption := GetRS('Common', 'ColOptions') + '...';

    with cbDocType do begin
      Properties.Items.Add(GetRS('Common', 'All'));
      Properties.Items.AddObject(GetRS(ParentNameEx, 'DocOut'), Pointer(-1));
      Properties.Items.AddObject(GetRS(ParentNameEx, 'MoveMat'), Pointer(4));
      Properties.Items.AddObject(GetRS(ParentNameEx, 'TempRsv'), Pointer(0));
      Properties.Items.AddObject(GetRS(ParentNameEx, 'DocBill'), Pointer(2));
      ItemIndex := 0;
    end;

    lcbKAgent.DisplayEmpty := GetRS('Common', 'All');

    //lFromDate.Caption := GetRS(ParentNameEx, 'From');
    //lToDate.Caption := GetRS(ParentNameEx, 'To');
    prdMain.InitRes;
    prdMain.CapFrom := GetRS('fmPayDoc', 'FromDate') + ':';
    lKAgentF.Caption := GetRS(ParentNameEx, 'KAgent');
    lDocType.Caption := GetRS(ParentNameEx, 'DocType');

    lTotal.Caption := GetRS(ParentNameEx, 'OnSum') + ':';
    lAmount.Caption := GetRS(ParentNameEx, 'AmountAll') + ':';

    with grdMain do begin
      Bands[0].Caption := GetRS(ParentNameEx, 'Doc');
      Bands[1].Caption := GetRS(ParentNameEx, 'Mat');
      Bands[2].Caption := GetRS(ParentNameEx, 'PriceEx');
    end;

    colNum.Caption := GetRS(ParentNameEx, 'Num');
    colOnDate.Caption := GetRS(ParentNameEx, 'Date');
    colAmount.Caption := GetRS(ParentNameEx, 'Amount');
    colWHouse.Caption := GetRS(ParentNameEx, 'Title');
    colPrice.Caption := GetRS(ParentNameEx, 'InCurr');
    colCurrency.Caption := GetRS(ParentNameEx, 'Currency');
    colRate.Caption := GetRS(ParentNameEx, 'Rate');
    colKAName.Caption := GetRS('fmWMat', 'KAgent');
    colNPrice.Caption := GetRS(ParentNameEx, 'InNCurr');
    colNCurrency.Caption := GetRS(ParentNameEx, 'Currency');

    panEmpty.Caption := GetRS(ParentNameEx, 'EmptyRsv') + #13#10#13#10;

    aPrint.Caption := GetRS('Common', 'Print');
    aPrintMain.Caption := GetRS(ParentNameEx, 'PrintRsv');
    btnPrint.Hint := GetRS('Common', 'PrintMain');
    aPrintDoc.Caption := GetRS(ParentNameEx, 'Doc');
    btnPrintDoc.Hint := GetRS(ParentNameEx, 'DocPreview');
  end;
  CanRefresh := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.SetParentName') else _udebug := nil;{$ENDIF}

  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.cdsViewBeforeOpen(DataSet: TDataSet);
  var
    m: String;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.cdsViewBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsView.Params.ParamByName('matid').AsInteger := FID;

  if prdMain.FromDate <= 0
    then cdsView.Params.ParamByName('fromdate').AsDateTime := 0
    else cdsView.Params.ParamByName('fromdate').AsDateTime := prdMain.FromDate;

  if prdMain.ToDate = 0
    then cdsView.Params.ParamByName('todate').AsDateTime := MaxDateTime
    else cdsView.Params.ParamByName('todate').AsDateTime := LastSecondInDay(prdMain.ToDate);

  m := '';

  if lcbKAgent.EmptyValue <> lcbKAgent.KeyValue
    then m := ' and wbl.kaid=' + IntToStr(lcbKAgent.KeyValue);

  if cbDocType.ItemIndex > 0
    then m := m + ' and wbl.wtype=' + IntToStr(Integer(cbDocType.Properties.Items.Objects[cbDocType.ItemIndex]));

  if WID > 0
    then m := m + ' and wbd.wid='+IntToStr(WID);

  cdsView.Macros.ParamByName('m').AsString := m;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.colPriceGetText') else _udebug := nil;{$ENDIF}

  if (ANode.Values[colDocType.Index] = -1) or (ANode.Values[colDocType.Index] = 2)
    then AText := VarToStr(ANode.Values[colPriceIn.Index]);

  //AText := FormatFloat(MoneyDisplayFormat, StrToFloat(AText));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.SetOnDate(const Value: TDateTime);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.SetOnDate') else _udebug := nil;{$ENDIF}

  inherited;

  CanRefresh := False;
  prdMain.BaseDate := Value;
  prdMain.LoadFromRegistry;
  if prdMain.PeriodType = ptCustom then
    if Value = MaxDateTime
      then prdMain.ToDate := Date
      else prdMain.ToDate := Value;

  CanRefresh := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.SetGrdWidth;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.SetGrdWidth') else _udebug := nil;{$ENDIF}

  AdjustGrid(grdMain, colWHouse);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmMatRsv.cdsViewAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.cdsViewAfterOpen') else _udebug := nil;{$ENDIF}

  SetGrdWidth;
  BuildRsv;
  CalcSummary;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.colNPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.colNPriceGetText') else _udebug := nil;{$ENDIF}

 try
   with ANode do
     if (ANode.Values[colDocType.Index] = -1) or (ANode.Values[colDocType.Index] = 2)
       then AText := FloatToStr(RoundToA(ANode.Values[colRate.Index] * ANode.Values[colPriceIn.Index], -6))
       else AText := FloatToStr(RoundToA(ANode.Values[colRate.Index] * ANode.Values[colPrice.Index], -6));
 except
 end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.colNCurrencyGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.colNCurrencyGetText') else _udebug := nil;{$ENDIF}

  AText := BaseCurrName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.srcMainDataChange(Sender: TObject; Field: TField);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.srcMainDataChange') else _udebug := nil;{$ENDIF}

  if cdsView.FieldByName('wtype').AsInteger = 1
    then lKAgent.Caption := rs(ParentNameEx, 'Supplier')+':'
    else lKAgent.Caption := rs(ParentNameEx, 'Client')+':';

  txtKAgent.Caption := cdsView.FieldByName('kagentname').AsString;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmMatRsv.aPrintExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.aPrintExecute') else _udebug := nil;{$ENDIF}
  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  CanRefresh := False;
  prdMain.RegistryPath := MainRegKey + '\' + Self.Name;
  CanRefresh := True;
  grdMain.LoadFromRegistry(MainRegKey + '\' + Self.Name);
  colDocType.Width := 50;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.FormDestroy') else _udebug := nil;{$ENDIF}

  prdMain.SaveToRegistry;
  grdMain.SaveToRegistry(MainRegKey + '\' + Self.Name);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.edFromDateKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.edFromDateKeyPress') else _udebug := nil;{$ENDIF}

  if (Key = #13) and (TcxDateEdit(Sender).Text <> '') then begin
    TcxDateEdit(Sender).Date := StrToDate(TcxDateEdit(Sender).Text);
    TcxDateEdit(Sender).EditValue := TcxDateEdit(Sender).Date;
    if CanRefresh then DSRefresh(cdsView, 'posid', 0);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.edFromDatePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.edFromDatePropertiesChange') else _udebug := nil;{$ENDIF}

  if not f then begin
    f := True;
    if (TcxDateEdit(Sender).Text = '') then begin
      TcxDateEdit(Sender).EditValue := 0;
      TcxDateEdit(Sender).EditText := '';
    end;
    f := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.edFromDatePropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.edFromDatePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  {case cbDocType.ItemIndex of
   1: begin
        lAmount.Enabled := True;
        lTotalIn.Enabled := True;
        txtAmountIn.Font.Color := clMaroon;
        txtTotalIn.Font.Color := clMaroon;
        lAmountOut.Enabled := False;
        lTotalOut.Enabled := False;
        txtAmountOut.Font.Color := clBtnShadow;
        txtTotalOut.Font.Color := clBtnShadow;
      end;
   2: begin
        lAmountOut.Enabled := True;
        lTotalOut.Enabled := True;
        txtAmountOut.Font.Color := clMaroon;
        txtTotalOut.Font.Color := clMaroon;
        lAmountIn.Enabled := False;
        lTotalIn.Enabled := False;
        txtAmountIn.Font.Color := clBtnShadow;
        txtTotalIn.Font.Color := clBtnShadow;
      end;
   0: begin
        lAmountOut.Enabled := True;
        lTotalOut.Enabled := True;
        txtAmountOut.Font.Color := clMaroon;
        txtTotalOut.Font.Color := clMaroon;
        lAmountIn.Enabled := True;
        lTotalIn.Enabled := True;
        txtAmountIn.Font.Color := clMaroon;
        txtTotalIn.Font.Color := clMaroon;
      end;
  end;}

  if CanRefresh then DSRefresh(cdsView, 'posid', 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.lcbKAgentPropertiesInitPopup(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.lcbKAgentPropertiesInitPopup') else _udebug := nil;{$ENDIF}

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
procedure TfrmMatRsv.lcbKAgentPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.lcbKAgentPropertiesChange') else _udebug := nil;{$ENDIF}

  if lcbKAgent.Text = '' then begin
    if not cdsKAgent.Active then cdsKAgent.Open;
    lcbKAgent.ItemIndex := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.btnKagentClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.btnKagentClick') else _udebug := nil;{$ENDIF}

  ShowModalRef(Self, rtKAgent, vtKAgent, 'TfmKAgent', Self.OnDate, lcbKAgent.KeyValue);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.WMRefresh') else _udebug := nil;{$ENDIF}

  case M.LParam of
   Integer(rtKAgent):
     begin
       if not cdsKAgent.Active then cdsKAgent.Open;
       lcbKAgent.KeyValue := M.WParam;
     end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.CalcSummary;
  var
    i, j: Integer;
    FTotal, FAmount: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.CalcSummary') else _udebug := nil;{$ENDIF}

  FTotal := 0;
  FAmount := 0;
  with grdMain do
    for i := 0 to Count - 1 do begin
      if Items[i].Values[colID.Index] > 0 then begin
        if (Items[i].Values[colDocType.Index] = -1) or (Items[i].Values[colDocType.Index] = 2)
          then FTotal := FTotal + RoundToA(VarToFloat(Items[i].Values[colPriceIn.Index]) * Items[i].Values[colAmount.Index], -2)
          else FTotal := FTotal + RoundToA(VarToFloat(Items[i].Values[colNPrice.Index]) * Items[i].Values[colAmount.Index], -2);

        FAmount := FAmount + Items[i].Values[colAmount.Index];
      end
      else begin
        for j := 0 to Items[i].Count - 1 do begin
          if (Items[i].Items[j].Values[colDocType.Index] = -1) or (Items[i].Items[j].Values[colDocType.Index] = 2)
            then FTotal := FTotal + RoundToA(VarToFloat(Items[i].Items[j].Values[colPriceIn.Index]) * Items[i].Items[j].Values[colAmount.Index], -2)
            else FTotal := FTotal + RoundToA(VarToFloat(Items[i].Items[j].Values[colNPrice.Index]) * Items[i].Items[j].Values[colAmount.Index], -2);

          FAmount := FAmount + Items[i].Items[j].Values[colAmount.Index];
        end;
      end;
    end;

  txtAmount.Caption := FormatFloat(MatDisplayFormat, FAmount) + ' ' + FMeasureName;
  txtTotal.Caption := FormatFloat(MoneyDisplayFormat, FTotal) + ' ' + BaseCurrName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.grdMainMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  var
    FCol: TdxDBTreeListColumn;
    FNode: TdxTreeListNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.grdMainMouseMove') else _udebug := nil;{$ENDIF}

  FCol := grdMain.GetColumnAt(X, Y);
  FNode := grdMain.GetNodeAt(X, Y);

  if (FCol <> nil) and (FNode <> nil) then begin
    if (FCol <> FCurrCol) or (FNode <> FCurrNode) then begin
      Application.CancelHint;

      if grdMain.Canvas.TextWidth(VarToStr(FNode.Values[FCol.Index])) > FCol.Width
        then grdMain.Hint := FNode.Values[FCol.Index]
        else grdMain.Hint := '';

      FCurrCol := FCol;
      FCurrNode := FNode;
    end;
  end
  else begin
    grdMain.Hint := '';
    FCurrCol := nil;
    FCurrNode := nil;
    Application.CancelHint;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.frDocGetValue(const ParName: String; var ParValue: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.frDocGetValue') else _udebug := nil;{$ENDIF}

  if 0 = AnsiCompareText(ParName, 'EntName') then ParValue := EntName
  else if 0 = AnsiCompareText(ParName, 'EntAddr') then ParValue := EntAddr
  else if 0 = AnsiCompareText(ParName, 'EntPhone') then ParValue := EntPhone
  else if 0 = AnsiCompareText(ParName, 'EntAccount') then ParValue := EntAccount
  else if 0 = AnsiCompareText(ParName, 'EntBank') then ParValue := EntBank
  else if 0 = AnsiCompareText(ParName, 'EntMFO') then ParValue := EntMFO
  else if 0 = AnsiCompareText(ParName, 'EntOKPO') then ParValue := EntOKPO
  else if 0 = AnsiCompareText(ParName, 'KAPhone') then ParValue := FKAPhone
  else if 0 = AnsiCompareText(ParName, 'KAAddr') then ParValue := FKAAddr
  else if 0 = AnsiCompareText(ParName, 'DocNum') then ParValue := FDocNum
  else if 0 = AnsiCompareText(ParName, 'DocDate') then ParValue := FormatDateTime(ReplaceStr('dd.mm.yyyy', '.', DateSeparator), FDocDate)
  else if 0 = AnsiCompareText(ParName, 'WHouseOut') then ParValue := WHOut
  else if 0 = AnsiCompareText(ParName, 'WHouseIn') then ParValue := WHIn
  else if 0 = AnsiCompareText(ParName, 'PersonOut') then ParValue := FKAName
  else if 0 = AnsiCompareText(ParName, 'PersonIn') then ParValue := FPerson
  else if 0 = AnsiCompareText(ParName, 'DocSumm') then ParValue := MoneyToStr(FSummAll)
  else if 0 = AnsiCompareText(ParName, 'basecurrname') then ParValue := BaseCurrName
  else if 0 = AnsiCompareText(ParName, 'wname') then begin
    if WID = 0
      then ParValue := rs('Common', 'All')
      else ParValue := FWHName
  end
  else if 0 = AnsiCompareText(ParName, 'matname') then ParValue := FMatName
  else if 0 = AnsiCompareText(ParName, 'personname') then ParValue := mdReport.FieldByName('person').AsString
  else if 0 = AnsiCompareText(ParName, 'measure') then ParValue := FMeasureName
  else if 0 = AnsiCompareText(ParName, 'fromdate') then begin
    if prdMain.FromDate <= 0
      then ParValue := '__________'
      else ParValue := prdMain.FromDate;
  end
  else if 0 = AnsiCompareText(ParName, 'todate') then begin
    if prdMain.ToDate = 0
      then ParValue := '__________'
      else ParValue := prdMain.ToDate;
  end
  else if 0 = AnsiCompareText(ParName, 'amountin') then ParValue := Trim(txtAmount.Caption)
  //else if 0 = AnsiCompareText(ParName, 'amountout') then ParValue := Trim(txtAmountOut.Caption)
  else if 0 = AnsiCompareText(ParName, 'totalin') then ParValue := Trim(txtTotal.Caption)
  //else if 0 = AnsiCompareText(ParName, 'totalout') then ParValue := Trim(txtTotalOut.Caption)
  else if 0 = AnsiCompareText(ParName, 'RECEIVED') then ParValue := FReceived
  else if 0 = AnsiCompareText(ParName, 'att')
       then if Trim(FAttNum) <> '' then ParValue := FAttNum + ' ' + DateToStr(FAttDate);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.aPrintMainExecute(Sender: TObject);
  var
    BM: TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.aPrintMainExecute') else _udebug := nil;{$ENDIF}

  if mdMain.IsEmpty then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  SmartShowRep(frDoc, 'MatRsv.frf', False);

  BM := nil;
  with mdMain do
    try
      BM := GetBookmark;
      //frDoc.DesignReport;
      frDoc.ShowReport;

    finally
      if BM <> nil then begin
        GotoBookmark(BM);
        FreeBookmark(BM);
      end;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.btnPrintClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.btnPrintClick') else _udebug := nil;{$ENDIF}

  aPrintMain.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.aPrintDocExecute(Sender: TObject);
  var
    FSumStr: String;
    FID: Integer;
    FReason, FCurrName: String;
    FCurrRate: Extended;
    FNDS, FSumWithoutNDS, FSumWithoutNDSPos, FSumNDS, FSumNDSPos: Extended;
    cdsT: TssClientDataSet;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.aPrintDocExecute') else _udebug := nil;{$ENDIF}

  if cdsView.IsEmpty then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  FID := mdMain.fieldbyname('wbillid').AsInteger;

  case mdMain.FieldByName('wtype').AsInteger of
    -1: xRep.ShowRep(rtWBOut, FID);
     2: xRep.ShowRep(rtAccOut, FID);
     4: xRep.ShowRep(rtWBMove, FID);
    -5: xRep.ShowRep(rtWriteOff, FID);
    else begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;
  end;

  {cdsT := newDataSet;
  with cdsT do
    try
      mdReport.Close;
      mdReport.Open;

      if mdMain.FieldByName('wtype').AsInteger = 4
        then ProviderName := 'pWB_GetMH'
        else ProviderName := 'pWayBill_GetHeader';

      FetchParams;
      Params.ParamByName('wbillid').AsInteger := FID;
      Open;
      if mdMain.FieldByName('wtype').AsInteger = 4 then begin
        WHIn := FieldByName('whnamein').AsString;
        WHOut := FieldByName('whnameout').AsString;
      end;

      if mdMain.FieldByName('wtype').AsInteger = 2 then begin
        FKAPhone := FieldByName('phone').AsString;
        FKAAddr := FieldByName('postindex').AsString;
        if (trim(FKAAddr) <> '') and (trim(FieldByName('country').AsString)<>'')
          then FKAAddr := FieldByName('country').AsString+', '+FKAAddr
          else FKAAddr := FieldByName('country').AsString+FKAAddr;
        if (trim(FKAAddr)<>'') and (trim(FieldByName('district').AsString)<>'')
          then FKAAddr := FieldByName('district').AsString+', '+FKAAddr
          else FKAAddr := FieldByName('district').AsString+FKAAddr;
        if (trim(FKAAddr)<>'') and (trim(FieldByName('city').AsString)<>'')
          then FKAAddr := FieldByName('city').AsString+', '+FKAAddr
          else FKAAddr := FieldByName('city').AsString+FKAAddr;
        if (trim(FKAAddr)<>'') and (trim(FieldByName('address').AsString)<>'')
          then FKAAddr := FieldByName('address').AsString+', '+FKAAddr
          else FKAAddr := FieldByName('address').AsString+FKAAddr;
      end;

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
      FSummAll := FieldByName('summall').AsFloat;
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
        mdReport.FieldByName('onvalue').AsFloat := FieldByName('onvalue').AsFloat;
        mdReport.FieldByName('posmatname').AsString := FieldByName('matname').AsString;
        mdReport.FieldByName('posmsrname').AsString := FieldByName('msrname').AsString;
        mdReport.FieldByName('posamount').AsFloat := FieldByName('amount').AsFloat;
        if mdMain.FieldByName('wtype').AsInteger = 4
          then mdReport.FieldByName('posprice').AsFloat := FieldByName('price').AsFloat
          else mdReport.FieldByName('posprice').AsFloat := FieldByName('price').AsFloat *
            FCurrRate;
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

  //frDoc.DesignReport;
  frDoc.ShowReport;
  }

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.btnPrintDocClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.btnPrintDocClick') else _udebug := nil;{$ENDIF}

  aPrintDoc.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.ssBevel3MouseEnter(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.ssBevel3MouseEnter') else _udebug := nil;{$ENDIF}
  with Sender as TssBevel do if HotTrack then bvlFooterSep.ColorInner := HotTrackColor;
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmMatRsv.ssBevel3MouseLeave(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.ssBevel3MouseLeave') else _udebug := nil;{$ENDIF}
  with Sender as TssBevel do if HotTrack then bvlFooterSep.ColorInner := clBtnShadow;
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmMatRsv.BuildRsv;
  var
    FWBillID, FNewID, FBaseID, FWType: Integer;
    BM: TBookmark;
    FNum, FCurrName, FName: string;
    FDocDate: TDateTime;
    FPrice, FOnValue, FPriceIn, FAmount: Extended;
    FCurrID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.BuildRsv') else _udebug := nil;{$ENDIF}

  with newDataSet do
    try
      ProviderName := 'pWMat_GetPosInfo';
      FetchParams;
      mdMain.Close;
      mdMain.Open;
      DSRefresh(cdsRsv_Temp, 'posid', 0);
      DSRefresh(cdsWHouse, 'wid', 0);
      mdMain.CopyFromDataSet(cdsView);

      if cbDocType.ItemIndex in [0, 3] then begin
        cdsRsv_Temp.First;

        while not cdsRsv_Temp.Eof do begin
          if cdsRsv_Temp.FieldByName('matid').AsInteger = FID then begin
            mdMain.Append;

            if cdsWHouse.Locate('wid', cdsRsv_Temp.FieldByName('wid').AsInteger, [])
              then mdMain.FieldByName('name').AsString := cdsWHouse.FieldByName('Name').AsString;

            mdMain.FieldByName('amount').AsFloat := cdsRsv_Temp.FieldByName('amount').AsFloat;
            mdMain.FieldByName('wtype').AsInteger := 0;
            mdMain.FieldByName('posid').AsInteger := cdsRsv_Temp.FieldByName('posid').AsInteger;
            Params.ParamByName('posid').AsInteger := cdsRsv_Temp.FieldByName('posid').AsInteger;
            Open;
            if not IsEmpty then begin
              mdMain.FieldByName('price').AsFloat := FieldByName('price').AsFloat;
              mdMain.FieldByName('onvalue').AsFloat := FieldByName('onvalue').AsFloat;
              mdMain.FieldByName('shortname').AsString := FieldByName('shortname').AsString;
            end;
            Close;

            mdMain.Post;
          end;
          cdsRsv_Temp.Next;
        end;
      end;

      with mdMain do begin
        First;
        FWBillID := -1;
        FNewID := -1;
        FBaseID := - GetMaxAbs(mdMain, 'posid') - 1;
        FAmount := 0;
        while not Eof do begin
          if FieldByName('posid').AsInteger > 0 then begin
            if FWBillID = FieldByName('wbillid').AsInteger then begin
              if FNewID = -1 then begin
                Dec(FBaseID);
                FNewID := FBaseID;
                FWType := FieldByName('wtype').AsInteger;
                FDocDate := FieldByName('ondate').AsDateTime;
                FNum := FieldByName('num').AsString;
                FName := FieldByName('name').AsString;
                FPrice := FieldByName('price').AsFloat;
                FPriceIn := FieldByName('pricein').AsFloat;
                FOnValue := FieldByName('onvalue').AsFloat;
                FCurrName := FieldByName('shortname').AsString;
                //FCurrID := FieldByName('currid').AsInteger;

                BM := GetBookmark;
                try
                  Append;
                  FieldByName('posid').AsInteger := FNewID;
                  FieldByName('pid').AsInteger := FNewID;
                  FieldByName('wtype').AsInteger := FWType;
                  FieldByName('wbillid').AsInteger := FWBillID;
                  //FieldByName('currid').AsInteger := FCurrID;
                  FieldByName('pricein').AsFloat := FPriceIn;
                  FieldByName('price').AsFloat := FPrice;
                  FieldByName('onvalue').AsFloat := FOnValue;
                  FieldByName('shortname').AsString := FCurrName;
                  FieldByName('ondate').AsDateTime := FDocDate;
                  FieldByName('num').AsString := FNum;
                  FieldByName('name').AsString := FName;
                  Post;

                finally
                  GotoBookmark(BM);
                  FreeBookmark(BM);
                end;

                Prior;
                Edit;
                FieldByName('pid').AsInteger := FNewID;
                FAmount := FAmount + FieldByName('amount').AsFloat;
                Post;

                Next;
                Edit;
                FieldByName('pid').AsInteger := FNewID;
                FAmount := FAmount + FieldByName('amount').AsFloat;
                Post;
              end
              else begin
                Edit;
                FieldByName('pid').AsInteger := FNewID;
                FAmount := FAmount + FieldByName('amount').AsFloat;
                Post;
              end;
            end
            else begin
              if FNewID < -1 then begin
                BM := GetBookmark;
                try
                  if Locate('posid', FNewID, []) then begin
                    Edit;
                    FieldByName('amount').AsFloat := FAmount;
                    Post;
                    FAmount := 0;
                  end;

                finally
                  GotoBookmark(BM);
                  FreeBookmark(BM);
                end;

                FNewID := -1;
              end;
            end;

            FWBillID := FieldByName('wbillid').AsInteger;
          end;

          Next;
        end;

        if FNewID < -1 then begin
          BM := GetBookmark;

          try
            if Locate('posid', FNewID, []) then begin
              Edit;
              FieldByName('amount').AsFloat := FAmount;
              Post;
              FAmount := 0;
            end;

          finally
            GotoBookmark(BM);
            FreeBookmark(BM);
          end;

          FNewID := -1;
        end;

      end;

    finally
      Free;
    end;

    panEmpty.Visible := mdMain.IsEmpty;
    grdMain.FullCollapse;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.aRefreshExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.aRefreshExecute') else _udebug := nil;{$ENDIF}

  DSRefresh(cdsView, 'posid', 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.colDocTypeCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.colDocTypeCustomDrawCell') else _udebug := nil;{$ENDIF}

  if ANode.Values[colDocType.Index] = 0 then begin
    with ACanvas do begin
      Font.Color := clWindowText;

      if ASelected then
        if grdMain.Focused then begin
          Brush.Color := grdMain.HighlightColor;
          Font.Color := grdMain.HighlightTextColor;
        end
        else begin
          Brush.Color := grdMain.HideSelectionColor;
          Font.Color := grdMain.HideSelectionTextColor;
        end
      else begin
          Brush.Color := grdMain.Color;
          Font.Color := clWindowText;
      end;

      FillRect(ARect);
      TextOut(ARect.Left + 9, ARect.Top + 2, '?');
      ADone := True;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.cbDocTypePropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.cbDocTypePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  cbDocType.SelStart := 0;
  cbDocType.SelLength := 0;

  if CanRefresh then DSRefresh(cdsView, 'posid', 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.grdMainDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.grdMainDblClick') else _udebug := nil;{$ENDIF}

  if grdMain.Count > 0 then aPrintDoc.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.colTypeCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.colTypeCustomDrawCell') else _udebug := nil;{$ENDIF}

  if not ASelected then AFont.Color := clMaroon;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.colTypeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  var
    FType: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.colTypeGetText') else _udebug := nil;{$ENDIF}

  try
    FType := ANode.Values[colDocType.Index];

    case FType of
      1: AText := rs('Common', 'DocWBIn');
     -1: AText := rs('Common', 'DocWBOut');
      5: AText := rs('Common', 'DocWBRest');
     -5: AText := rs('Common', 'DocWriteOff');
     -6: AText := rs('Common', 'DocWBRetOut');
      6: AText := rs('Common', 'DocWBRetIn');
      2: AText := rs('Common', 'DocAccOut');
    -16: AText := rs('Common', 'DocOrderOut');
     16: AText := rs('Common', 'DocOrderIn');
    end;

  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.colAmountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.colAmountGetText') else _udebug := nil;{$ENDIF}

  try AText := FormatFloat(MatDisplayFormat, StrToFloat(AText)); except end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.aColOptionsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.aColOptionsExecute') else _udebug := nil;{$ENDIF}

  grdMain.ShowColOptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.grdMainGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := rs('fmWMat', 'MatRsv');
  ImgList := dmData.Images;
  AIndex := 100;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.cdsWHouseBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.cdsWHouseBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsWHouse.Macros.ParamByName('m').AsString := WHAccessMacro;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatRsv.colDocTypeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatRsv.colDocTypeGetText') else _udebug := nil;{$ENDIF}

  if ANode.Level = 1 then
    case ANode.Values[colDocType.Index] of
      -1: AText := '-1001';
      -5: AText := '-1005';
      -6: AText := '-1006';
       2: AText := '1002';
       4: AText := '1004';
     -16: AText := '-1016';
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('MatRsv', @Debugging, DEBUG_group_ID);{$ENDIF}

finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
