{$I ok_sklad.inc}
unit DCTurnover;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxEditor6, StdCtrls, ssBaseConst,
  ActnList, ssBaseTypes, ssFormStorage, cxLookAndFeelPainters, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit, ssbaseDlg, dxTL6, dxDBCtrl6,
  dxDBGrid6, dxCntner6, dxDBTLCl6, dxGrClms6, DB, DBClient, ssClientDataSet,
  ImgList, ssSpeedButton, ssPanel, ssGradientPanel, ssBevel, cxMaskEdit,
  cxDropDownEdit, cxCalendar, ssDBLookupCombo, ssLabel, FR_Class, FR_DSet,
  FR_DBSet, TB2Item, Menus, dxmdaset, xButton, dxDBTL6, ssDBGrid;

type
  TfrmDCTurnover = class(TBaseDlg)
    aPrint: TAction;
    aPrintDoc: TAction;
    aPrintMain: TAction;
    btnPrint: TssSpeedButton;
    btnPrintDoc: TssSpeedButton;
    cdsView: TssClientDataSet;
    colAmount: TdxDBTreeListColumn;
    colArtikul: TdxDBTreeListColumn;
    colBarCode: TdxDBTreeListColumn;
    colCurr: TdxDBTreeListColumn;
    colDiscount: TdxDBTreeListColumn;
    colDocType: TdxDBTreeListImageColumn;
    colKAName: TdxDBTreeListColumn;
    colMatName: TdxDBTreeListColumn;
    colMsr: TdxDBTreeListColumn;
    colNPrice: TdxDBTreeListColumn;
    colNum: TdxDBTreeListColumn;
    colOnDate: TdxDBTreeListColumn;
    colOnValue: TdxDBTreeListColumn;
    colPosID: TdxDBTreeListColumn;
    colPrice: TdxDBTreeListColumn;
    colTotal: TdxDBTreeListColumn;
    edFromDate: TcxDateEdit;
    edToDate: TcxDateEdit;
    lFromDate: TLabel;
    lToDate: TLabel;
    lTotalPos: TssLabel;
    lTotalSumm: TssLabel;
    pmMain: TTBPopupMenu;
    srcView: TDataSource;
    ssBevel3: TssBevel;
    ssBevel4: TssBevel;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    tlMain: TssDBTreeList;
    txtTotalPos: TssBevel;
    txtTotalSumm: TssBevel;

    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aPrintDocExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aPrintMainExecute(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnPrintDocClick(Sender: TObject);
    procedure cdsViewAfterOpen(DataSet: TDataSet);
    procedure cdsViewBeforeOpen(DataSet: TDataSet);
    procedure colDiscountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colNPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colTotalCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure colTotalGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure edFromDateKeyPress(Sender: TObject; var Key: Char);
    procedure edFromDatePropertiesChange(Sender: TObject);
    procedure edFromDatePropertiesEditValueChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure frDocGetValue(const ParName: String; var ParValue: Variant);
    procedure grdMainDblClick(Sender: TObject);
    procedure tlMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure tlMainDblClick(Sender: TObject);

  private
    CanRefresh: Boolean;
    f: Boolean;
    FHolder, FNum: String;

    procedure CalcSummary;
    procedure SetGrdWidth;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    function GetPosCount: Integer;

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
  frmDCTurnover: TfrmDCTurnover;

implementation

uses
  prConst, ClientData, prFun, ssFun, ssRegUtils, DateUtils,
  ssDateUtils, prTypes, prRep, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}
//==============================================================================================
procedure TfrmDCTurnover.setid(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmDCTurnover.setid') else _udebug := nil;{$ENDIF}

  FID := Value;

  with newDataSet do
  try
    ProviderName := 'pDiscCards_GetEx';
    FetchParams;
    Params.ParamByName('cardid').AsInteger := Value;
    Open;
    if not IsEmpty then begin
      FHolder := FieldByName('name').AsString;
      FNum := FieldByName('num').AsString;
      panTitleBar.Caption := rs('fmDiscCards', 'DC') + ' ' + FNum + ' (' + FHolder + ')';
      DSRefresh(cdsView, 'posid', 0);
    end;
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDCTurnover.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDCTurnover.ActionListUpdate') else _udebug := nil;{$ENDIF}


  aOk.Enabled := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDCTurnover.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDCTurnover.SetCaptions') else _udebug := nil;{$ENDIF}


  inherited;

  with LangMan do begin
    aOK.Caption := GetRS('Common', 'OK');
    aCancel.Caption := GetRS('Common', 'Cancel');

    lFromDate.Caption := GetRS('fmWaybill', 'FromDate');
    lToDate.Caption := GetRS('fmWaybill', 'ToDate');

    lTotalPos.Caption := GetRS('fmDiscCards', 'TotalPos') + ':';
    lTotalSumm.Caption := GetRS('fmDiscCards', 'TotalSumm') + ':';

    with tlMain do begin
      Bands[0].Caption := GetRS('fmWMat', 'Doc');
      Bands[1].Caption := GetRS('fmWMat', 'Mat');
    end;

    colNum.Caption := GetRS('fmDiscCards', 'Num');
    colOnDate.Caption := GetRS('fmWMat', 'Date');
    colKAName.Caption := GetRS('fmWaybill', 'KAgent');
    colPrice.Caption := GetRS('fmKAgent', 'SumInDef');
    colCurr.Caption := GetRS('fmKAgent', 'Curr');
    colOnValue.Caption := GetRS('fmKAgent', 'Rate');
    colNPrice.Caption := GetRS('fmKAgent', 'SumInBase');
    colMatName.Caption := GetRS('fmMaterials', 'Name');
    colArtikul.Caption := GetRS('fmMaterials', 'Artikul');
    colBarCode.Caption := GetRS('fmMaterials', 'BarCode');
    colMsr.Caption := GetRS('fmMaterials', 'Measure');
    colAmount.Caption := GetRS('fmWaybill', 'Amount');
    colTotal.Caption := GetRS('fmWaybill', 'Summ') + ', ' + BaseCurrName;
    colDocType.Caption := '';
    colDiscount.Caption := GetRS('fmWaybill', 'Discount');

    aPrint.Caption := GetRS('Common', 'Print');
    aPrintMain.Caption := GetRS('fmDiscCards', 'DCTurnover');
    btnPrint.Hint := GetRS('fmDiscCards', 'DCTurnover');
    aPrintDoc.Caption := GetRS('fmKAgent', 'Doc');
    btnPrintDoc.Hint := GetRS('fmWMat', 'DocPreview');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDCTurnover.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDCTurnover.SetParentName') else _udebug := nil;{$ENDIF}


  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDCTurnover.cdsViewBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDCTurnover.cdsViewBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsView.Params.ParamByName('cardid').AsInteger := FID;

  if edFromDate.EditText = EmptyStr
    then cdsView.Params.ParamByName('fromdate').AsDateTime := 0
    else cdsView.Params.ParamByName('fromdate').AsDateTime := edFromDate.Date;

  if (edToDate.EditText = EmptyStr) or (edToDate.Date = 0)
   then cdsView.Params.ParamByName('todate').AsDateTime := MaxDateTime
   else cdsView.Params.ParamByName('todate').AsDateTime := LastSecondInDay(edToDate.Date);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDCTurnover.colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDCTurnover.colPriceGetText') else _udebug := nil;{$ENDIF}

  AText := FormatFloat(PriceDisplayFormat, RoundToA(StrToFloat(AText), PriceDisplayDigits));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDCTurnover.SetOnDate(const Value: TDateTime);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDCTurnover.SetOnDate') else _udebug := nil;{$ENDIF}

  inherited;

  edToDate.Date := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDCTurnover.SetGrdWidth;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDCTurnover.SetGrdWidth') else _udebug := nil;{$ENDIF}
  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDCTurnover.cdsViewAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDCTurnover.cdsViewAfterOpen') else _udebug := nil;{$ENDIF}

  SetGrdWidth;
  CalcSummary;
  tlMain.FullExpand;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDCTurnover.colNPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDCTurnover.colNPriceGetText') else _udebug := nil;{$ENDIF}

  try
    with ANode do
      AText := FormatFloat(PriceDisplayFormat, RoundToA(ANode.Values[colOnValue.Index] * ANode.Values[colPrice.Index], PriceDisplayDigits));
  except
  end;      

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDCTurnover.aPrintExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDCTurnover.aPrintExecute') else _udebug := nil;{$ENDIF}


  {}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDCTurnover.FormCreate(Sender: TObject);
  var Temp: TDateTime;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDCTurnover.FormCreate') else _udebug := nil;{$ENDIF}


  inherited;
  
  CanRefresh := False;
  if ReadFromRegDate(MainRegKey + '\' + Self.ClassName, 'FromDate', Temp)
    then begin
      if Temp = 0
        then edFromDate.Text := EmptyStr
        else edFromDate.Date := Temp;
    end
    else edFromDate.Text := EmptyStr;
  CanRefresh := True;

  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDCTurnover.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDCTurnover.FormDestroy') else _udebug := nil;{$ENDIF}


  WriteToRegDate(MainRegKey + '\' + Self.ClassName, 'FromDate', edFromDate.Date);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDCTurnover.edFromDateKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDCTurnover.edFromDateKeyPress') else _udebug := nil;{$ENDIF}


  if (Key = #13) and (TcxDateEdit(Sender).Text <> EmptyStr) then begin
    TcxDateEdit(Sender).Date := StrToDate(TcxDateEdit(Sender).Text);
    TcxDateEdit(Sender).EditValue := TcxDateEdit(Sender).Date;
    if CanRefresh then DSRefresh(cdsView, 'posid', 0);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDCTurnover.edFromDatePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDCTurnover.edFromDatePropertiesChange') else _udebug := nil;{$ENDIF}


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
procedure TfrmDCTurnover.edFromDatePropertiesEditValueChanged(
  Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDCTurnover.edFromDatePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}


  if CanRefresh then DSRefresh(cdsView, 'posid', 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDCTurnover.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDCTurnover.WMRefresh') else _udebug := nil;{$ENDIF}



  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDCTurnover.CalcSummary;
  var
    i, j: Integer;
    FBallance: Extended;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDCTurnover.CalcSummary') else _udebug := nil;{$ENDIF}


  FBallance := 0;
  with tlMain do
    for i := 0 to Count - 1 do begin
      if Items[i].Values[colDocType.Index] = -1
        then FBallance := FBallance + Items[i].Values[colTotal.Index]
        else FBallance := FBallance - Items[i].Values[colTotal.Index];
      for j := 0 to Items[i].Count - 1 do
        FBallance := FBallance - Items[i].Values[colTotal.Index];
    end;
  txtTotalSumm.Caption := FormatFloat(MoneyDisplayFormat, FBallance) + ' ' +
    BaseCurrName;
  txtTotalPos.Caption := IntToStr(GetPosCount) + ' ';
  if FBallance < 0 then txtTotalSumm.Font.Color := clRed
    else txtTotalSumm.Font.Color := clMaroon;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDCTurnover.frDocGetValue(const ParName: String; var ParValue: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDCTurnover.frDocGetValue') else _udebug := nil;{$ENDIF}


  {if 0 = AnsiCompareText(ParName, 'basecurrname') then ParValue := BaseCurrName else
  if 0 = AnsiCompareText(ParName, 'BaseCurrID') then ParValue := BaseCurrID else
  if 0 = AnsiCompareText(ParName, 'wname') then
    if WID = 0 then ParValue := rs('Common', 'All')
      else ParValue := FWHName else
  if 0 = AnsiCompareText(ParName, 'matname') then ParValue := FKAName else
  if 0 = AnsiCompareText(ParName, 'personname') then ParValue := mdReport.FieldByName('person').AsString else
  if 0 = AnsiCompareText(ParName, 'measure') then ParValue := FMeasureName else
  if 0 = AnsiCompareText(ParName, 'fromdate') then begin
    if edFromDate.EditText = EmptyStr
      then ParValue := '<>'
      else ParValue := edFromDate.EditText;
  end else
  if 0 = AnsiCompareText(ParName, 'todate') then begin
    if edToDate.EditText = EmptyStr
      then ParValue := '<>'
      else ParValue := edToDate.EditText;
  end else
//  if 0 = AnsiCompareText(ParName, 'amountin') then ParValue := Trim(txtAmountIn.Caption) else
//  if 0 = AnsiCompareText(ParName, 'amountout') then ParValue := Trim(txtAmountOut.Caption) else
//  if 0 = AnsiCompareText(ParName, 'totalin') then ParValue := Trim(txtTotalIn.Caption) else
//  if 0 = AnsiCompareText(ParName, 'totalout') then ParValue := Trim(txtTotalOut.Caption) else
  if 0 = AnsiCompareText(ParName, 'RECEIVED') then ParValue := FReceived else
  if 0 = AnsiCompareText(ParName, 'att') then
    if Trim(FAttNum) <> EmptyStr
      then ParValue := FAttNum + ' ' + DateToStr(FAttDate);}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDCTurnover.aPrintMainExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDCTurnover.aPrintMainExecute') else _udebug := nil;{$ENDIF}


  xRep.ShowRep(rtDCTurnover, FID, edFromDate.Date, LastSecondInDay(edToDate.Date));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDCTurnover.btnPrintClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDCTurnover.btnPrintClick') else _udebug := nil;{$ENDIF}


  aPrintMain.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDCTurnover.aPrintDocExecute(Sender: TObject);
  var FID: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDCTurnover.aPrintDocExecute') else _udebug := nil;{$ENDIF}


  if cdsView.IsEmpty then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;


  FID := cdsView.fieldbyname('wbillid').AsInteger;
  case cdsView.FieldByName('wtype').AsInteger of
   -1: xRep.ShowRep(rtWBOut, FID);
    6: xRep.ShowRep(rtReturnIn, FID);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDCTurnover.btnPrintDocClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDCTurnover.btnPrintDocClick') else _udebug := nil;{$ENDIF}


  aPrintDoc.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDCTurnover.grdMainDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDCTurnover.grdMainDblClick') else _udebug := nil;{$ENDIF}


  aPrintDoc.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDCTurnover.tlMainCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDCTurnover.tlMainCustomDrawCell') else _udebug := nil;{$ENDIF}


  if Odd(ANode.Index) and not ASelected then AColor := GridOddLinesColor;
  if (AColumn = colTotal) and not ASelected then AColor := $00FCF8E2;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDCTurnover.colTotalGetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDCTurnover.colTotalGetText') else _udebug := nil;{$ENDIF}


  try AText := FormatFloat(MoneyDisplayFormat, StrToFloat(AText)); except end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmDCTurnover.GetPosCount: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDCTurnover.GetPosCount') else _udebug := nil;{$ENDIF}


  Result := tlMain.Count;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDCTurnover.tlMainDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDCTurnover.tlMainDblClick') else _udebug := nil;{$ENDIF}


//  aPrintDoc.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDCTurnover.colDiscountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDCTurnover.colDiscountGetText') else _udebug := nil;{$ENDIF}


  if AText <> '' then AText := AText + ' %';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmDCTurnover.colTotalCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmDCTurnover.colTotalCustomDrawCell') else _udebug := nil;{$ENDIF}


  if (ANode.Level = 1) and not ASelected
    then AColor := CL_OK_WMAT_HIGHLIGHT_NEEDED;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('DCTurnover', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
