{$I ok_sklad.inc}
unit MatMove;

interface

uses
  ssbaseDlg, ssDBGrid, ssPeriod, okPeriod, okMoneyFun, ssBaseConst, ssBaseTypes, ssFormStorage, ssClientDataSet,
  ssSpeedButton, ssPanel, ssGradientPanel, ssBevel, cxMaskEdit, ssDBLookupCombo, ssLabel,
  dxCntner6, dxEditor6, dxmdaset, dxTL6, dxDBCtrl6, dxDBGrid6, dxDBTLCl6, dxGrClms6,
  cxLookAndFeelPainters, cxButtons, cxControls, cxContainer, cxEdit, cxTextEdit, cxDropDownEdit, cxCalendar,
  xLngDefs,  xButton,
  DB, DBClient, ImgList, FR_Class, FR_DSet, FR_DBSet, TB2Item, Menus,
  Dialogs, ExtCtrls, StdCtrls, ActnList, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms;

type
  TfrmMatMove = class(TBaseDlg)
    aColOptions: TAction;
    aLocate: TAction;
    aPrint: TAction;
    aPrintDoc: TAction;
    aPrintMain: TAction;
    btnKagent: TssSpeedButton;
    btnLocate: TssSpeedButton;
    btnPrint: TssSpeedButton;
    btnPrintDoc: TssSpeedButton;
    bvlFooterSep: TssBevel;
    cbDocType: TcxComboBox;
    cdsKAgent: TssClientDataSet;
    cdsView: TssClientDataSet;
    colAmount: TdxDBGridColumn;
    colCurrency: TdxDBGridColumn;
    colDocType: TdxDBGridImageColumn;
    colFromWID: TdxDBGridColumn;
    colID: TdxDBGridColumn;
    colKAgent: TdxDBGridColumn;
    colNCurrency: TdxDBGridColumn;
    colNPrice: TdxDBGridColumn;
    colNum: TdxDBGridColumn;
    colOnDate: TdxDBGridColumn;
    colPrice: TdxDBGridColumn;
    colRate: TdxDBGridColumn;
    colRemain: TdxDBGridColumn;
    colToWH: TdxDBGridColumn;
    colToWID: TdxDBGridColumn;
    colType: TdxDBGridColumn;
    colWHouse: TdxDBGridColumn;
    fdsReport: TfrDBDataSet;
    fdsView: TfrDBDataSet;
    frDoc: TfrReport;
    grdMain: TssDBGrid;
    lAmountIn: TssLabel;
    lAmountOut: TssLabel;
    lcbKAgent: TssDBLookupCombo;
    lDocType: TLabel;
    lKAgent: TLabel;
    lKAgentF: TLabel;
    lRemain: TssLabel;
    lTotalIn: TssLabel;
    lTotalOut: TssLabel;
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
    panSummary: TPanel;
    pmMain: TTBPopupMenu;
    prdMain: TokPeriod;
    srcKAgent: TDataSource;
    srcView: TDataSource;
    ssBevel3: TssBevel;
    ssBevel4: TssBevel;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem5: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSeparatorItem2: TTBSeparatorItem;
    txtAmountIn: TssBevel;
    txtAmountOut: TssBevel;
    txtKAgent: TLabel;
    txtRemain: TssBevel;
    txtTotalIn: TssBevel;
    txtTotalOut: TssBevel;

    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure DataModified(Sender: TObject);
    procedure aApplyExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure cdsViewBeforeOpen(DataSet: TDataSet);
    procedure colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure cdsViewAfterOpen(DataSet: TDataSet);
    procedure colNPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colNCurrencyGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure srcViewDataChange(Sender: TObject; Field: TField);
    procedure aPrintExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edFromDateKeyPress(Sender: TObject; var Key: Char);
    procedure edFromDatePropertiesChange(Sender: TObject);
    procedure edFromDatePropertiesEditValueChanged(Sender: TObject);
    procedure lcbKAgentPropertiesInitPopup(Sender: TObject);
    procedure lcbKAgentPropertiesChange(Sender: TObject);
    procedure btnKagentClick(Sender: TObject);
    procedure frDocGetValue(const ParName: String; var ParValue: Variant);
    procedure aPrintMainExecute(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure aPrintDocExecute(Sender: TObject);
    procedure btnPrintDocClick(Sender: TObject);
    procedure ssBevel3MouseEnter(Sender: TObject);
    procedure ssBevel3MouseLeave(Sender: TObject);
    procedure grdMainDblClick(Sender: TObject);
    procedure colTypeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colTypeCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure colWHouseGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure aColOptionsExecute(Sender: TObject);
    procedure grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure grdMainNeedAdjust(Sender: TObject);
    procedure colAmountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure aLocateExecute(Sender: TObject);

  private
    CanRefresh: Boolean;
    f: Boolean;
    FMeasureName: String;
    FCurrCol: TdxDBTreeListColumn;
    FCurrNode: TdxTreeListNode;
    FWHName: String;
    FMatName, FReceived, FAttNum: String;
    FAttDate: TDateTime;

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
  frmMatMove: TfrmMatMove;

//==============================================================================================
implementation

uses
  prConst, ClientData, prFun, ssFun, ssRegUtils,
  DateUtils, ssDateUtils, prTypes, prRep, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}
//==============================================================================================
procedure TfrmMatMove.setid(const Value: integer);
  var
    FWName: String;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmMatMove.setid') else _udebug := nil;{$ENDIF}

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
    else FWName := '';

    ProviderName := 'pMat_GetEx';
    FetchParams;
    Params.ParamByName('matid').AsInteger := Value;
    Open;

    if not IsEmpty then begin
      Self.Caption := rs(ParentNameEx, 'MatMoveEx') + ':  ' + FieldByName('name').AsString
        + ' (' + FieldByName('shortname').AsString + ')   ' + FWName;
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
procedure TfrmMatMove.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  (*var
     NewRecord: boolean;
     {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  *)
begin
  (*if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmMatMove.FormCloseQuery') else _udebug := nil;{$ENDIF}

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
procedure TfrmMatMove.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.ActionListUpdate') else _udebug := nil;{$ENDIF}

  aOk.Enabled := True;
  //aApply.Enabled := aOk.Enabled and FModified;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.DataModified') else _udebug := nil;{$ENDIF}

  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.aApplyExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.aApplyExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrYes;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.aOKExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.aOKExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrOK;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.aCancelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.aCancelExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrCancel;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    aOK.Caption := GetRS('Common', 'OK');
    aCancel.Caption := GetRS('Common', 'Cancel');
    aColOptions.Caption := GetRS('Common', 'ColOptions') + '...';

    with cbDocType do begin
      Properties.Items.Add(GetRS('Common', 'All'));
      Properties.Items.AddObject(GetRS('frmOptions', 'WBIn'), Pointer(1));
      Properties.Items.AddObject(GetRS('frmOptions', 'WBOut'), Pointer(-1));
      Properties.Items.AddObject(GetRS('frmOptions', 'WBMove'), Pointer(4));
      Properties.Items.AddObject(GetRS('frmOptions', 'WBRest'), Pointer(5));
      Properties.Items.AddObject(GetRS('frmOptions', 'WriteOff'), Pointer(-5));
      Properties.Items.AddObject(GetRS('frmOptions', 'WBRetOut'), Pointer(-6));
      Properties.Items.AddObject(GetRS('frmOptions', 'WBRetIn'), Pointer(6));
      ItemIndex := 0;
    end;

    lcbKAgent.DisplayEmpty := GetRS('Common', 'All');

//lFromDate.Caption := GetRS(ParentNameEx, 'From');
//lToDate.Caption := GetRS(ParentNameEx, 'To');
    prdMain.InitRes;
    prdMain.CapFrom := GetRS('fmPayDoc', 'FromDate') + ':';
    lKAgentF.Caption := GetRS(ParentNameEx, 'KAgent');
    lDocType.Caption := GetRS(ParentNameEx, 'DocType');

    lTotalIn.Caption := GetRS(ParentNameEx, 'OnSum') + ':';
    lTotalOut.Caption := GetRS(ParentNameEx, 'OnSum') + ':';
    lAmountIn.Caption := GetRS(ParentNameEx, 'AmountIn') + ':';
    lAmountOut.Caption := GetRS(ParentNameEx, 'AmountOut') + ':';
    lRemain.Caption := GetRS(ParentNameEx, 'RemainEx') + ':';

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
    colNPrice.Caption := GetRS(ParentNameEx, 'InNCurr');
    colNCurrency.Caption := GetRS(ParentNameEx, 'Currency');
    colKAgent.Caption := GetRS('fmWMat', 'KAgent');
    colRemain.Caption := GetRS('fmWMat', 'CurrentRemain');

    aPrint.Caption := GetRS('Common', 'Print');
    aPrintMain.Caption := GetRS(ParentNameEx, 'PrintMain');
    btnPrint.Hint := GetRS('Common', 'PrintMain');
    aPrintDoc.Caption := GetRS(ParentNameEx, 'Doc');
    btnPrintDoc.Hint := GetRS(ParentNameEx, 'DocPreview');

    aLocate.Caption := GetRS('Common', 'Jump');
    btnLocate.Hint := GetRS('Common', 'Jump');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.SetParentName') else _udebug := nil;{$ENDIF}

  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.cdsViewBeforeOpen(DataSet: TDataSet);
  var
    m: String;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.cdsViewBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsView.Params.ParamByName('matid').AsInteger := FID;
  cdsView.Params.ParamByName('wh').AsString := AllowedWH;

  if prdMain.FromDate <= 0
    then cdsView.Params.ParamByName('fromdate').AsDateTime := MinDateTime
    else cdsView.Params.ParamByName('fromdate').AsDateTime := prdMain.FromDate;

  if prdMain.ToDate = 0
   then cdsView.Params.ParamByName('todate').AsDateTime := MaxDateTime
   else cdsView.Params.ParamByName('todate').AsDateTime := LastSecondInDay(prdMain.ToDate);

  m := '';

  if lcbKAgent.EmptyValue <> lcbKAgent.KeyValue
    then cdsView.Params.ParamByName('kaid').AsInteger := lcbKAgent.KeyValue
    else cdsView.Params.ParamByName('kaid').AsInteger := 0;

  if cbDocType.ItemIndex > 0
    then cdsView.Params.ParamByName('wtype').AsInteger := Integer(cbDocType.Properties.Items.Objects[cbDocType.ItemIndex])
    else cdsView.Params.ParamByName('wtype').AsInteger := 0;

  if WID > 0
    then cdsView.Params.ParamByName('wid').AsInteger := WID
    else cdsView.Params.ParamByName('wid').AsInteger := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.colPriceGetText') else _udebug := nil;{$ENDIF}

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
procedure TfrmMatMove.SetOnDate(const Value: TDateTime);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.SetOnDate') else _udebug := nil;{$ENDIF}

  inherited;

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
procedure TfrmMatMove.SetGrdWidth;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.SetGrdWidth') else _udebug := nil;{$ENDIF}

  AdjustGrid(grdMain, colWHouse);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.cdsViewAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.cdsViewAfterOpen') else _udebug := nil;{$ENDIF}

  SetGrdWidth;
  CalcSummary;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.colNPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.colNPriceGetText') else _udebug := nil;{$ENDIF}

  with ANode do try
    if not VarIsNull(ANode.Values[colDocType.Index]) and (ANode.Values[colDocType.Index] = 1) and (not ShowPrices)
      then AText := rs('Common', 'NA')
      else AText := FormatFloat(PriceDisplayFormat, RoundToA(ANode.Values[colRate.Index] * ANode.Values[colPrice.Index], -6));
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.colNCurrencyGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.colNCurrencyGetText') else _udebug := nil;{$ENDIF}

  AText := BaseCurrName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.srcViewDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.srcViewDataChange') else _udebug := nil;{$ENDIF}

  if cdsView.FieldByName('wtype').AsInteger = 1
    then lKAgent.Caption := rs(ParentNameEx, 'Supplier')+':'
    else lKAgent.Caption := rs(ParentNameEx, 'Client')+':';

  txtKAgent.Caption := cdsView.FieldByName('kagentname').AsString;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.aPrintExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.aPrintExecute') else _udebug := nil;{$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmMatMove.FormCreate(Sender: TObject);
  var
    Temp: TDateTime;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.FormCreate') else _udebug := nil;{$ENDIF}

  FormStorage.IniFileName := MainRegKey;
  FormStorage.IniSection := Self.ClassName;
  FormStorage.Active := True;

  inherited;

  CanRefresh := False;
  prdMain.RegistryPath := MainRegKey + '\' + Self.Name;
  grdMain.LoadFromRegistry(MainRegKey + '\' + Self.Name);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.FormDestroy') else _udebug := nil;{$ENDIF}

  prdMain.SaveToRegistry;
  grdMain.SaveToRegistry(MainRegKey + '\' + Self.Name);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.edFromDateKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.edFromDateKeyPress') else _udebug := nil;{$ENDIF}

  if (Key = #13) and (TcxDateEdit(Sender).Text <> '') then begin
    TcxDateEdit(Sender).Date := StrToDate(TcxDateEdit(Sender).Text);
    TcxDateEdit(Sender).EditValue := TcxDateEdit(Sender).Date;
    if CanRefresh then DSRefresh(cdsView, 'posid', 0);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.edFromDatePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.edFromDatePropertiesChange') else _udebug := nil;{$ENDIF}

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
procedure TfrmMatMove.edFromDatePropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.edFromDatePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  case cbDocType.ItemIndex of
   1, 4, 7: begin
        lAmountIn.Enabled := True;
        lTotalIn.Enabled := True;
        txtAmountIn.Font.Color := clMaroon;
        txtTotalIn.Font.Color := clMaroon;
        lAmountOut.Enabled := False;
        lTotalOut.Enabled := False;
        txtAmountOut.Font.Color := clBtnShadow;
        txtTotalOut.Font.Color := clBtnShadow;
      end;

   2, 5, 6: begin
        lAmountOut.Enabled := True;
        lTotalOut.Enabled := True;
        txtAmountOut.Font.Color := clMaroon;
        txtTotalOut.Font.Color := clMaroon;
        lAmountIn.Enabled := False;
        lTotalIn.Enabled := False;
        txtAmountIn.Font.Color := clBtnShadow;
        txtTotalIn.Font.Color := clBtnShadow;
      end;

   0, 3: begin
        lAmountOut.Enabled := True;
        lTotalOut.Enabled := True;
        txtAmountOut.Font.Color := clMaroon;
        txtTotalOut.Font.Color := clMaroon;
        lAmountIn.Enabled := True;
        lTotalIn.Enabled := True;
        txtAmountIn.Font.Color := clMaroon;
        txtTotalIn.Font.Color := clMaroon;
      end;
  end;

  if CanRefresh then DSRefresh(cdsView, 'posid', 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.lcbKAgentPropertiesInitPopup(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.lcbKAgentPropertiesInitPopup') else _udebug := nil;{$ENDIF}

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
procedure TfrmMatMove.lcbKAgentPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.lcbKAgentPropertiesChange') else _udebug := nil;{$ENDIF}

  if lcbKAgent.Text = '' then begin
    if not cdsKAgent.Active then cdsKAgent.Open;
    lcbKAgent.ItemIndex := 0;
  end;  

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.btnKagentClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.btnKagentClick') else _udebug := nil;{$ENDIF}

  ShowModalRef(Self, rtKAgent, vtKAgent, 'TfmKAgent', Self.OnDate, lcbKAgent.KeyValue);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.WMRefresh') else _udebug := nil;{$ENDIF}

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
procedure TfrmMatMove.CalcSummary;
  var
    i: Integer;
    FTotalIn, FTotalOut, FAmountIn, FAmountOut: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.CalcSummary') else _udebug := nil;{$ENDIF}

  FTotalIn := 0; FTotalOut := 0;
  FAmountIn := 0; FAmountOut := 0;

  with grdMain do
    for i := 0 to Count - 1 do begin
      try
        case Integer(Items[i].Values[colDocType.Index]) of
          1, 5, 6:
            begin
              FTotalIn := FTotalIn +
                RoundToA(Items[i].Values[colNPrice.Index] * Items[i].Values[colAmount.Index], -2);
              FAmountIn := FAmountIn + RoundToA(Items[i].Values[colAmount.Index], MatDisplayDigits);
            end;

          -1, -6, -5:
            begin
              FTotalOut := FTotalOut +
                RoundToA(Items[i].Values[colNPrice.Index] * Items[i].Values[colAmount.Index], -2);
              FAmountOut := FAmountOut + RoundToA(Items[i].Values[colAmount.Index], MatDisplayDigits);
            end;

          4:if WID > 0 then begin
              if Items[i].Values[colFromWID.Index] = WID then begin
                FTotalOut := FTotalOut +
                  RoundToA(Items[i].Values[colNPrice.Index] * Items[i].Values[colAmount.Index], -2);
                FAmountOut := FAmountOut + RoundToA(Items[i].Values[colAmount.Index], MatDisplayDigits);
              end else
              if Items[i].Values[colToWID.Index] = WID then begin
                FTotalIn := FTotalIn +
                  RoundToA(Items[i].Values[colNPrice.Index] * Items[i].Values[colAmount.Index], -2);
                FAmountIn := FAmountIn + RoundToA(Items[i].Values[colAmount.Index], MatDisplayDigits);
              end;
            end;
        end;

      except
      end;
    end;

  if lAmountIn.Enabled then begin
    txtAmountIn.Caption := FormatFloat(MatDisplayFormat, FAmountIn) + ' ' + FMeasureName;
    if ShowPrices
      then txtTotalIn.Caption := FormatFloat(MoneyDisplayFormat, FTotalIn) + ' ' + BaseCurrName
      else txtTotalIn.Caption := rs('Common', 'NA');
  end
  else begin
    txtAmountIn.Caption := '';
    txtTotalIn.Caption := '';
  end;

  if lAmountOut.Enabled then begin
    txtAmountOut.Caption := FormatFloat(MatDisplayFormat, FAmountOut) + ' ' + FMeasureName;
    txtTotalOut.Caption := FormatFloat(MoneyDisplayFormat, FTotalOut) + ' ' + BaseCurrName;
  end
  else begin
    txtAmountOut.Caption := '';
    txtTotalOut.Caption := '';
  end;

  txtRemain.Caption := FormatFloat(MatDisplayFormat, FAmountIn - FAmountOut) + ' ' + FMeasureName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.frDocGetValue(const ParName: String; var ParValue: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.frDocGetValue') else _udebug := nil;{$ENDIF}

  if 0 = AnsiCompareText(ParName, 'basecurrname') then ParValue := BaseCurrName else
  if 0 = AnsiCompareText(ParName, 'wname') then begin
    if WID = 0
      then ParValue := rs('Common', 'All')
      else ParValue := FWHName
  end
  else if 0 = AnsiCompareText(ParName, 'matname') then ParValue := FMatName else
  if 0 = AnsiCompareText(ParName, 'personname') then ParValue := mdReport.FieldByName('person').AsString else
  if 0 = AnsiCompareText(ParName, 'measure') then ParValue := FMeasureName else
  if 0 = AnsiCompareText(ParName, 'fromdate') then begin
    if prdMain.FromDate <= 0
      then ParValue := '__________'
      else ParValue := prdMain.FromDate;
  end
  else if 0 = AnsiCompareText(ParName, 'todate') then begin
    if prdMain.ToDate = 0
      then ParValue := '__________'
      else ParValue := prdMain.ToDate;
  end
  else if 0 = AnsiCompareText(ParName, 'amountin') then ParValue := Trim(txtAmountIn.Caption) else
  if 0 = AnsiCompareText(ParName, 'amountout') then ParValue := Trim(txtAmountOut.Caption) else
  if 0 = AnsiCompareText(ParName, 'totalin') then ParValue := Trim(txtTotalIn.Caption) else
  if 0 = AnsiCompareText(ParName, 'totalout') then ParValue := Trim(txtTotalOut.Caption);
  if 0 = AnsiCompareText(ParName, 'RECEIVED') then ParValue := FReceived else
  if 0 = AnsiCompareText(ParName, 'att') then begin
    if Trim(FAttNum) <> ''
      then ParValue := FAttNum + ' ' + DateToStr(FAttDate);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.aPrintMainExecute(Sender: TObject);
  var
    BM: TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.aPrintMainExecute') else _udebug := nil;{$ENDIF}

  if not ShowPrices then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  SmartShowRep(frDoc, 'MatMove.frf', False);
  BM := nil; // AP: stop warning

  with cdsView do
    try
      DisableControls;
      BM := GetBookmark;
      frDoc.ShowReport;
      //frDoc.DesignReport;

    finally
      if BM <> nil then begin
      GotoBookmark(BM);
      FreeBookmark(BM);
      end;
      EnableControls;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.btnPrintClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.btnPrintClick') else _udebug := nil;{$ENDIF}

  aPrintMain.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.aPrintDocExecute(Sender: TObject);
  var
    FKAName, FDocNum, FSumStr: String;
    FDocDate: TDateTime;
    FID: Integer;
    FReason, FPerson, FCurrName: String;
    FCurrRate: Extended;
    FNDS, FSumWithoutNDS, FSumWithoutNDSPos, FSumNDS, FSumNDSPos: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.aPrintDocExecute') else _udebug := nil;{$ENDIF}

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

  //frDoc.DesignReport;
  frDoc.ShowReport;
}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.btnPrintDocClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.btnPrintDocClick') else _udebug := nil;{$ENDIF}

  aPrintDoc.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.ssBevel3MouseEnter(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.ssBevel3MouseEnter') else _udebug := nil;{$ENDIF}

  with Sender as TssBevel do
    if HotTrack then bvlFooterSep.ColorInner := HotTrackColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmMatMove.ssBevel3MouseLeave(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.ssBevel3MouseLeave') else _udebug := nil;{$ENDIF}

  with Sender as TssBevel do
    if HotTrack then bvlFooterSep.ColorInner := clBtnShadow;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmMatMove.grdMainDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.grdMainDblClick') else _udebug := nil;{$ENDIF}

  if grdMain.Count > 0 then aPrintDoc.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.colTypeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  var
    FType: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.colTypeGetText') else _udebug := nil;{$ENDIF}

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
    end;

  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.colTypeCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.colTypeCustomDrawCell') else _udebug := nil;{$ENDIF}

  if not ASelected then AFont.Color := clMaroon;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.colWHouseGetText(Sender: TObject;  ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.colWHouseGetText') else _udebug := nil;{$ENDIF}

  if VarToStr(ANode.Values[colToWH.Index]) <> ''
    then AText := AText + ' -> ' + VarToStr(ANode.Values[colToWH.Index]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.aColOptionsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.aColOptionsExecute') else _udebug := nil;{$ENDIF}

  grdMain.ShowColOptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.grdMainGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := rs(ParentNameEx, 'MatMoveEx');
  ImgList := dmData.Images;
  AIndex := 61;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.grdMainNeedAdjust(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.grdMainNeedAdjust') else _udebug := nil;{$ENDIF}

  SetGrdWidth;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.colAmountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.colAmountGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MatDisplayFormat, StrToFloat(AText));
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.grdMainCustomDrawCell') else _udebug := nil;{$ENDIF}

  if Odd(ANode.Index) and not ASelected then AColor := GridOddLinesColor;

  if (AColumn = colRemain) and not ASelected then AColor := $00FCF8E2;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMatMove.aLocateExecute(Sender: TObject);
  var
    FWType: Integer;
    FClass: string;
    FViewType: TCCViewType;
    FGType: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMatMove.aLocateExecute') else _udebug := nil;{$ENDIF}

  if cdsView.IsEmpty then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  FWType := cdsView.FieldByName('wtype').AsInteger;

  with LocateInfo do begin
    FGType := 0;
    case FWType of
      1: begin
           FClass := 'TfmWaybill';
           FViewType := vtDocs;
         end;

     -1: begin
           FClass := 'TfmWaybillOut';
           FViewType := vtDocs;
         end;

     -5: begin
           FClass := 'TfmWriteOff';
           FViewType := vtWMat;
         end;

     -6: begin
           FClass := 'TfmWBReturnOut';
           FViewType := vtDocs;
         end;

      6: begin
           FClass := 'TfmWBReturnIn';
           FViewType := vtDocs;
         end;

      4: begin
           FClass := 'TfmWaybillMov';
           FViewType := vtWMat;
         end;

      5: begin
           FClass := 'TfmWBRest';
           FViewType := vtWMat;
         end;

      else
        FViewType := vtAll; //AP: to remove the warn
    end;

    ViewType := FViewType;
    ClassName := FClass;
    ID := cdsView.FieldByName('docid').AsInteger;
    GType := FGType;
  end;

  PostMessage(frmMainForm.Handle, WM_OK_EXECLOCATE, Integer(@LocateInfo), 0);
  Close;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('MatMove', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
