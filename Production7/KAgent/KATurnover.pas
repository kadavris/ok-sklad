{$I ok_sklad.inc}
unit KATurnover;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxCntner6, dxEditor6, StdCtrls, ssBaseConst,
  ActnList, ssBaseTypes, ssFormStorage, cxLookAndFeelPainters, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit, ssbaseDlg, dxTL6, dxDBCtrl6,
  dxDBGrid6, dxDBTLCl6, dxGrClms6, DB, DBClient, ssClientDataSet,
  ImgList, ssSpeedButton, ssPanel, ssGradientPanel, ssBevel, cxMaskEdit,
  cxDropDownEdit, cxCalendar, ssDBLookupCombo, ssLabel, FR_Class, FR_DSet,
  prTypes, FR_DBSet, TB2Item, Menus, dxmdaset, xButton, ssPeriod, okPeriod;

type
  TfrmKATurnover = class(TBaseDlg)
    aPrint: TAction;
    aPrintDoc: TAction;
    aPrintMain: TAction;
    btnPrint: TssSpeedButton;
    btnPrintDoc: TssSpeedButton;
    cbDocType: TcxComboBox;
    cdsView: TssClientDataSet;
    colCurrency: TdxDBGridColumn;
    colDocType: TdxDBGridImageColumn;
    colID: TdxDBGridColumn;
    colName: TdxDBGridColumn;
    colNCurrency: TdxDBGridColumn;
    colNPrice: TdxDBGridColumn;
    colNum: TdxDBGridColumn;
    colOnDate: TdxDBGridColumn;
    colPrice: TdxDBGridColumn;
    colRate: TdxDBGridColumn;
    colSaldo: TdxDBGridCurrencyColumn;
    colType: TdxDBGridColumn;
    DateField1: TDateField;
    fdsReport: TfrDBDataSet;
    fdsView: TfrDBDataSet;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    frDoc: TfrReport;
    grdMain: TdxDBGrid;
    IntegerField1: TIntegerField;
    lDocType: TLabel;
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
    mdView: TdxMemData;
    mdViewsaldo: TCurrencyField;
    pmMain: TTBPopupMenu;
    prdMain: TokPeriod;
    srcView: TDataSource;
    ssBevel4: TssBevel;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    TBItem1: TTBItem;
    TBItem5: TTBItem;
    TBSubmenuItem1: TTBSubmenuItem;
    Panel1: TPanel;
    lBallance: TssLabel;
    txtBallance: TssBevel;

    procedure aApplyExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aOKExecute(Sender: TObject);
    procedure aPrintDocExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aPrintMainExecute(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnPrintDocClick(Sender: TObject);
    procedure cdsViewAfterOpen(DataSet: TDataSet);
    procedure cdsViewBeforeOpen(DataSet: TDataSet);
    procedure colCurrencyGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colNameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colNCurrencyGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colNPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colTypeCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure colTypeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure DataModified(Sender: TObject);
    procedure edFromDatePropertiesEditValueChanged(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure frDocGetValue(const ParName: String; var ParValue: Variant);
    procedure grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure grdMainDblClick(Sender: TObject);
    procedure grdMainMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);

  private
    CanRefresh: Boolean;
    f: Boolean;
    FAttDate: TDateTime;
    FCurrCol: TdxDBTreeListColumn;
    FCurrNode: TdxTreeListNode;
    FKAName, FReceived, FAttNum: String;
    FMeasureName: String;
    FStartSaldo: Extended;
    FStartSaldoDate: TDateTime;
    FWHName: String;

    procedure CalcSummary;
    procedure SetGrdWidth;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;

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
  frmKATurnover: TfrmKATurnover;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  prConst, ClientData, prFun, ssFun, ssRegUtils, DateUtils,
  ssDateUtils, prRep, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}
//==============================================================================================
procedure TfrmKATurnover.setid(const Value: integer);
  var
    FWName: String;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmKATurnover.setid') else _udebug := nil;{$ENDIF}

  Fid := Value;

  with newDataSet do
  try
    ProviderName := 'pKAgent_Get';
    FetchParams;
    Params.ParamByName('kaid').AsInteger := Value;
    Open;
    if not IsEmpty then begin
      FKAName := FieldByName('name').AsString;
      FStartSaldo := FieldByName('startsaldo').AsCurrency;
      FStartSaldoDate := FieldByName('startsaldodate').AsDateTime;
      Self.Caption := rs(ParentNameEx, 'KATurnover') + ':  ' + FKAName;
      DSRefresh(cdsView, 'id', 0);
    end;
    Close;
    Application.ProcessMessages;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKATurnover.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  (*var
    NewRecord: boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmKATurnover.FormCloseQuery') else _udebug := nil;{$ENDIF}

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
procedure TfrmKATurnover.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKATurnover.ActionListUpdate') else _udebug := nil;{$ENDIF}

  aOk.Enabled := True;
  //aApply.Enabled := aOk.Enabled and FModified;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKATurnover.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKATurnover.DataModified') else _udebug := nil;{$ENDIF}

  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKATurnover.aApplyExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKATurnover.aApplyExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrYes;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKATurnover.aOKExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKATurnover.aOKExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrOK;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKATurnover.aCancelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKATurnover.aCancelExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrCancel;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKATurnover.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKATurnover.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    aOK.Caption := GetRS('Common', 'OK');
    aCancel.Caption := GetRS('Common', 'Cancel');

    with cbDocType do begin
      Properties.Items.Add(GetRS('Common', 'All'));
      Properties.Items.AddObject(GetRS(ParentNameEx, 'WBIn'), Pointer(1));
      Properties.Items.AddObject(GetRS(ParentNameEx, 'WBOut'), Pointer(-1));
      Properties.Items.AddObject(GetRS(ParentNameEx, 'PayDocIn'), Pointer(1));
      Properties.Items.AddObject(GetRS(ParentNameEx, 'PayDocOut'), Pointer(-1));
      Properties.Items.AddObject(GetRS('frmOptions', 'WBRetIn'), Pointer(6));
      ItemIndex := 0;
    end;

    prdMain.InitRes;
    prdMain.CapFrom := GetRS('fmPayDoc', 'FromDate') + ':';
    lDocType.Caption := GetRS(ParentNameEx, 'DocType');

    lBallance.Caption := GetRS(ParentNameEx, 'Ballance') + ':';

    with grdMain do begin
      Bands[0].Caption := GetRS(ParentNameEx, 'Doc');
      Bands[1].Caption := GetRS(ParentNameEx, 'Sum');
    end;

    colNum.Caption := GetRS(ParentNameEx, 'DocNum');
    colOnDate.Caption := GetRS(ParentNameEx, 'Date');
    colName.Caption := GetRS(ParentNameEx, 'KAgent');
    colPrice.Caption := GetRS(ParentNameEx, 'SumInDef');
    colCurrency.Caption := GetRS(ParentNameEx, 'Curr');
    colRate.Caption := GetRS(ParentNameEx, 'Rate');
    colSaldo.Caption := GetRS(ParentNameEx, 'CurrSaldo');
    colNPrice.Caption := GetRS(ParentNameEx, 'SumInBase');
    colNCurrency.Caption := GetRS(ParentNameEx, 'Curr');

    aPrint.Caption := GetRS('Common', 'Print');
    aPrintMain.Caption := GetRS(ParentNameEx, 'KATurnover');
    btnPrint.Hint := GetRS(ParentNameEx, 'KATurnover');
    aPrintDoc.Caption := GetRS(ParentNameEx, 'Doc');
    btnPrintDoc.Hint := GetRS('fmWMat', 'DocPreview');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKATurnover.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKATurnover.SetParentName') else _udebug := nil;{$ENDIF}

  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKATurnover.cdsViewBeforeOpen(DataSet: TDataSet);
  var
    m: String;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKATurnover.cdsViewBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsView.Params.ParamByName('kaid').AsInteger := FID;
  cdsView.Params.ParamByName('kaid1').AsInteger := FID;

  if prdMain.FromDate <= 0
    then cdsView.Params.ParamByName('fromdate').AsDateTime := 0
    else cdsView.Params.ParamByName('fromdate').AsDateTime := prdMain.FromDate;

  if prdMain.ToDate = 0
   then cdsView.Params.ParamByName('todate').AsDateTime := MaxDateTime
   else cdsView.Params.ParamByName('todate').AsDateTime := LastSecondInDay(prdMain.ToDate);

  cdsView.Params.ParamByName('todate1').AsDateTime := cdsView.Params.ParamByName('todate').AsDateTime;
  cdsView.Params.ParamByName('fromdate1').AsDateTime := cdsView.Params.ParamByName('fromdate').AsDateTime;
  m := '';
  cdsView.Macros.ParamByName('m').AsString := '';
  cdsView.Macros.ParamByName('p').AsString := '';

  if cbDocType.ItemIndex > 0 then
    if cbDocType.ItemIndex in [1, 2, 5] then begin
      m := m + ' and wbl.wtype=' + IntToStr(Integer(cbDocType.Properties.Items.Objects[cbDocType.ItemIndex]));
      cdsView.Macros.ParamByName('m').AsString := m;
      cdsView.Macros.ParamByName('p').AsString := ' and pd.doctype=-100';
    end
    else begin
      m := m + ' and pd.doctype=' +
        IntToStr(Integer(cbDocType.Properties.Items.Objects[cbDocType.ItemIndex]));
      cdsView.Macros.ParamByName('p').AsString := m;
      cdsView.Macros.ParamByName('m').AsString := 'and wbl.wtype=-100';
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKATurnover.colPriceGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKATurnover.colPriceGetText') else _udebug := nil;{$ENDIF}


  AText := FormatFloat(MoneyDisplayFormat, RoundToA(StrToFloat(AText), -2));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKATurnover.SetOnDate(const Value: TDateTime);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKATurnover.SetOnDate') else _udebug := nil;{$ENDIF}

  inherited;

  prdMain.BaseDate := Value;
  prdMain.LoadFromRegistry;
  if prdMain.PeriodType = ptCustom then
    if Value = MaxDateTime
      then prdMain.ToDate := Date
      else prdMain.ToDate := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKATurnover.SetGrdWidth;
  var
    AStyle: Integer;
    Offset: Integer;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKATurnover.SetGrdWidth') else _udebug := nil;{$ENDIF}


  AStyle := GetWindowLong(grdMain.Handle, GWL_STYLE);
  if AStyle and WS_VSCROLL = WS_VSCROLL then Offset := 19
    else Offset := 2;
  colName.Width := grdMain.Width - colOnDate.Width - colNum.Width -
    colDocType.Width - Offset - colPrice.Width - colCurrency.Width -
    colRate.Width - colNPrice.Width - colNCurrency.Width - colType.Width - colSaldo.Width;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKATurnover.cdsViewAfterOpen(DataSet: TDataSet);
var
  FSaldo: Extended;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKATurnover.cdsViewAfterOpen') else _udebug := nil;{$ENDIF}


  mdView.CopyFromDataSet(DataSet);
  FSaldo := 0;
  if (FStartSaldo <> 0) and (FStartSaldoDate > prdMain.FromDate) and
   (FStartSaldoDate < prdMain.ToDate) then
  begin
    mdView.First;
    if not mdView.IsEmpty then mdView.Insert
      else mdView.Append;
    mdView.FieldByName('id').AsInteger := -1;
    mdView.FieldByName('wtype').AsInteger := -100;
    mdView.FieldByName('ondate').AsDateTime := FStartSaldoDate;
    mdView.FieldByName('summall').AsCurrency := FStartSaldo;
    mdView.FieldByName('shortname').AsString := BaseCurrName;
    mdView.FieldByName('onvalue').AsCurrency := 1;
    mdView.FieldByName('summall').AsCurrency := FStartSaldo;
    mdView.FieldByName('saldo').AsCurrency := FStartSaldo;
    mdView.Post;
    FSaldo := FStartSaldo;
  end;

  if prdMain.FromDate > 0 then
    with newDataSet do
    try
      ProviderName := 'pKA_GetSaldo';
      FetchParams;
      Params.ParamByName('kaid').AsInteger := FID;
      Params.ParamByName('ondate').AsDateTime := prdMain.FromDate;
      Open;
      if not IsEmpty then begin
        mdView.First;

        if not mdView.IsEmpty
          then mdView.Insert
          else mdView.Append;

        mdView.FieldByName('id').AsInteger := -100;
        mdView.FieldByName('wtype').AsInteger := -200;
        mdView.FieldByName('ondate').AsDateTime := prdMain.FromDate;
        mdView.FieldByName('summall').AsCurrency := Fields[0].AsCurrency;
        mdView.FieldByName('shortname').AsString := BaseCurrName;
        mdView.FieldByName('onvalue').AsCurrency := 1;
        mdView.FieldByName('summall').AsCurrency := Fields[0].AsCurrency;
        mdView.FieldByName('saldo').AsCurrency := Fields[0].AsCurrency;
        mdView.Post;
        FSaldo := Fields[0].AsCurrency;
      end;
      Close;

    finally
      Free;
    end;
    mdView.SortedField := 'docdate';

  mdView.First;
  while not mdView.Eof do begin
    if mdView.FieldByName('wtype').AsInteger > -100 then begin
      mdView.Edit;
      FSaldo := FSaldo + RoundToA(mdView.FieldByName('summall').AsCurrency * mdView.FieldByName('onvalue').AsFloat, -2)
                * Abs(mdView.FieldByName('wtype').AsInteger) / mdView.FieldByName('wtype').AsInteger;
      mdView.FieldByName('saldo').AsCurrency := FSaldo;
      mdView.Post;
    end;
    mdView.Next;
  end;
  mdView.First;

  SetGrdWidth;
  CalcSummary;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKATurnover.colNPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKATurnover.colNPriceGetText') else _udebug := nil;{$ENDIF}

  with ANode do
    AText := FormatFloat(MoneyDisplayFormat, RoundToA(ANode.Values[colRate.Index] * ANode.Values[colPrice.Index], -2));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKATurnover.colNCurrencyGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKATurnover.colNCurrencyGetText') else _udebug := nil;{$ENDIF}

  AText := BaseCurrName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKATurnover.aPrintExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKATurnover.aPrintExecute') else _udebug := nil;{$ENDIF}
  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKATurnover.FormCreate(Sender: TObject);
  var
    Temp: TDateTime;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKATurnover.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  CanRefresh := False;
  prdMain.RegistryPath := MainRegKey + '\' + Self.Name;
  CanRefresh := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKATurnover.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKATurnover.FormDestroy') else _udebug := nil;{$ENDIF}

  prdMain.SaveToRegistry;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKATurnover.edFromDatePropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKATurnover.edFromDatePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  case cbDocType.ItemIndex of
   1: begin
     {lAmountIn.Enabled := True;
        lTotalIn.Enabled := True;
        txtAmountIn.Font.Color := clMaroon;
        txtTotalIn.Font.Color := clMaroon;
        lAmountOut.Enabled := False;
        lTotalOut.Enabled := False;
        txtAmountOut.Font.Color := clBtnShadow;
        txtTotalOut.Font.Color := clBtnShadow;
        }
      end;

   2: begin
     {lAmountOut.Enabled := True;
        lTotalOut.Enabled := True;
        txtAmountOut.Font.Color := clMaroon;
        txtTotalOut.Font.Color := clMaroon;
        lAmountIn.Enabled := False;
        lTotalIn.Enabled := False;
        txtAmountIn.Font.Color := clBtnShadow;
        txtTotalIn.Font.Color := clBtnShadow;
        }
      end;

   0: begin
     {lAmountOut.Enabled := True;
        lTotalOut.Enabled := True;
        txtAmountOut.Font.Color := clMaroon;
        txtTotalOut.Font.Color := clMaroon;
        lAmountIn.Enabled := True;
        lTotalIn.Enabled := True;
        txtAmountIn.Font.Color := clMaroon;
        txtTotalIn.Font.Color := clMaroon;
     }
      end;
  end;
  
  if CanRefresh then DSRefresh(cdsView, 'id', 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKATurnover.WMRefresh(var M: TMessage);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKATurnover.WMRefresh') else _udebug := nil;{$ENDIF}
  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKATurnover.CalcSummary;
  var
    i: Integer;
    FBallance: Extended;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKATurnover.CalcSummary') else _udebug := nil;{$ENDIF}

  FBallance := 0;

  with grdMain do
    for i := 0 to Count - 1 do
      case Items[i].Values[colDocType.Index] of
        1, 2, 6: FBallance := FBallance + Items[i].Values[colNPrice.Index];
        -2, -1, -6: FBallance := FBallance - Items[i].Values[colNPrice.Index]
        else FBallance := FBallance + Items[i].Values[colNPrice.Index];
      end;

  txtBallance.Caption := FormatFloat(MoneyDisplayFormat, FBallance) + ' ' + BaseCurrName;

  if FBallance < 0
    then txtBallance.Font.Color := clRed
    else txtBallance.Font.Color := clMaroon;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKATurnover.grdMainMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  FCol: TdxDBTreeListColumn;
  FNode: TdxTreeListNode;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKATurnover.grdMainMouseMove') else _udebug := nil;{$ENDIF}


 FCol := grdMain.GetColumnAt(X, Y);
 FNode := grdMain.GetNodeAt(X, Y);
 if (FCol <> nil) and (FNode <> nil) then begin
   if (FCol <> FCurrCol) or (FNode <> FCurrNode) then begin
     Application.CancelHint;
     if grdMain.Canvas.TextWidth(FNode.Values[FCol.Index]) > FCol.Width
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
procedure TfrmKATurnover.frDocGetValue(const ParName: String; var ParValue: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKATurnover.frDocGetValue') else _udebug := nil;{$ENDIF}


  if 0 = AnsiCompareText(ParName, 'basecurrname') then ParValue := BaseCurrName else
  if 0 = AnsiCompareText(ParName, 'BaseCurrID') then ParValue := BaseCurrID else
  if 0 = AnsiCompareText(ParName, 'wname') then
    if WID = 0 then ParValue := rs('Common', 'All')
      else ParValue := FWHName else
  if 0 = AnsiCompareText(ParName, 'matname') then ParValue := FKAName else
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
//  if 0 = AnsiCompareText(ParName, 'amountin') then ParValue := Trim(txtAmountIn.Caption) else
//  if 0 = AnsiCompareText(ParName, 'amountout') then ParValue := Trim(txtAmountOut.Caption) else
//  if 0 = AnsiCompareText(ParName, 'totalin') then ParValue := Trim(txtTotalIn.Caption) else
//  if 0 = AnsiCompareText(ParName, 'totalout') then ParValue := Trim(txtTotalOut.Caption) else
  if 0 = AnsiCompareText(ParName, 'RECEIVED') then ParValue := FReceived else
  if 0 = AnsiCompareText(ParName, 'att') then
    if Trim(FAttNum) <> ''
      then ParValue := FAttNum + ' ' + DateToStr(FAttDate);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKATurnover.aPrintMainExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKATurnover.aPrintMainExecute') else _udebug := nil;{$ENDIF}


  xRep.ShowRep(rtKABallance, FID, prdMain.FromDate, LastSecondInDay(prdMain.ToDate));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKATurnover.btnPrintClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKATurnover.btnPrintClick') else _udebug := nil;{$ENDIF}


  aPrintMain.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKATurnover.aPrintDocExecute(Sender: TObject);
var
  FKAName, FDocNum, FSumStr: String;
  FDocDate: TDateTime;
  FID: Integer;
  FReason, FPerson, FCurrName: String;
  FCurrRate: Extended;
  FNDS, FSumWithoutNDS, FSumWithoutNDSPos, FSumNDS, FSumNDSPos: Extended;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKATurnover.aPrintDocExecute') else _udebug := nil;{$ENDIF}


  if mdView.IsEmpty or (abs(mdView.FieldByName('wtype').AsInteger)=2) then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;


  FID := mdView.fieldbyname('id').AsInteger;
  case mdView.FieldByName('wtype').AsInteger of
    1: xRep.ShowRep(rtWBIn, FID);
   -1: xRep.ShowRep(rtWBOut, FID);
   -6: xRep.ShowRep(rtReturnOut, FID);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKATurnover.btnPrintDocClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKATurnover.btnPrintDocClick') else _udebug := nil;{$ENDIF}

  aPrintDoc.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKATurnover.colNameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKATurnover.colNameGetText') else _udebug := nil;{$ENDIF}

  if ANode.Values[colID.Index] = -1
    then AText := rs('fmKAgent', 'StartSaldo')
  else if ANode.Values[colID.Index] = -100
    then AText := rs('fmKAgent', 'FromDateSaldo')
    else AText := FKAName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKATurnover.colCurrencyGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKATurnover.colCurrencyGetText') else _udebug := nil;{$ENDIF}

  if AText = '' then AText := BaseCurrName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKATurnover.grdMainDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKATurnover.grdMainDblClick') else _udebug := nil;{$ENDIF}

  aPrintDoc.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKATurnover.colTypeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  var FType: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKATurnover.colTypeGetText') else _udebug := nil;{$ENDIF}

  FType := ANode.Values[colDocType.Index];

  case FType of
    2: AText := rs('Common', 'DocPayDocIn');
   -2: AText := rs('Common', 'DocPayDocOut');
    1: AText := rs('Common', 'DocWBIn');
   -1: AText := rs('Common', 'DocWBOut');
   -6: AText := rs('Common', 'DocWBRetOut');
    6: AText := rs('Common', 'DocWBRetIn');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKATurnover.colTypeCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKATurnover.colTypeCustomDrawCell') else _udebug := nil;{$ENDIF}


  if not ASelected then AFont.Color := clMaroon;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmKATurnover.grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmKATurnover.grdMainCustomDrawCell') else _udebug := nil;{$ENDIF}

  if ANode.Values[colDocType.Index] = -200 then AFont.Color := clBlue;

  if Odd(ANode.Index) and not ASelected
    then AColor := GridOddLinesColor;

  if (AColumn = colSaldo) and not ASelected then AColor := $00FCF8E2;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('KATurnover', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
