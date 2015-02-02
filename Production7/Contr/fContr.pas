{$I ok_sklad.inc}
unit fContr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, TB2Item, Menus, ActnList, StdCtrls,

  BaseWBDoc, ssDataSource, ssDBLookupCombo, ssClientDataSet, ssSpeedButton,
  ssPeriod, okPeriod, ssMemDS, prTypes, ssDBGrid, ssBevel,

  ExtCtrls, Grids, DBGrids,

  dxExEdtr6, dxInspRw, dxInspct, dxCntner6, dxDBTLCl6, dxGrClms6,
  dxDBGrid6, dxTL6, dxDBCtrl6,
  cxPC, cxDropDownEdit, cxImageComboBox, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxCalendar, dxExEdtr, dxCntner;

type
  TfmContr = class(TfmBaseWBDoc)
    aPrintF: TAction;
    aPrintFRF: TAction;
    aRecalc: TAction;
    aRecalcAll: TAction;
    aReport: TAction;
    aSet0: TAction;
    aSet1: TAction;
    aSet2: TAction;
    aSet3: TAction;
    cdsDetailshippedamount: TFloatField;
    colAllAmount: TdxDBGridColumn;
    colDetShAmount: TdxDBGridColumn;
    colFpath: TdxDBGridColumn;
    colImgFPath: TdxDBGridImageColumn;
    colRest: TdxDBGridColumn;
    colRestSumm: TdxDBGridColumn;
    colShAmount: TdxDBGridColumn;
    colShSumm: TdxDBGridColumn;
    colStatus: TdxDBGridColumn;
    colToDate: TdxDBGridColumn;
    itmPrintWork: TTBItem;
    mnuStatus: TTBSubmenuItem;
    pmCheck: TTBPopupMenu;
    pmPrint: TTBPopupMenu;
    TBItem10: TTBItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    TBItem13: TTBItem;
    TBItem14: TTBItem;
    TBItem15: TTBItem;
    TBItem16: TTBItem;
    TBItem17: TTBItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;

    procedure aPrintFExecute(Sender: TObject);
    procedure aPrintFRFExecute(Sender: TObject);
    procedure aRecalcAllExecute(Sender: TObject);
    procedure aRecalcExecute(Sender: TObject);
    procedure aReportExecute(Sender: TObject);
    procedure aSet0Execute(Sender: TObject);
    procedure aSet1Execute(Sender: TObject);
    procedure aSet2Execute(Sender: TObject);
    procedure aSet3Execute(Sender: TObject);
    procedure cdsDetailBeforeOpen(DataSet: TDataSet);
    procedure cdsMainBeforeOpen(DataSet: TDataSet);
    procedure colCheckedGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colDocSaldoCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure colImgFPathCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure colImgFPathGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colSummPayGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colToDateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure grdMainDblClick(Sender: TObject);
    procedure grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure grdMainNeedAdjust(Sender: TObject);
    procedure mnuStatusPopup(Sender: TTBCustomItem; FromLink: Boolean);
    procedure pmCheckPopup(Sender: TObject);
    procedure srcMainDelayedDataChange(Sender: TObject; Field: TField);
    procedure cdsDetailFetchAfterOpen(DataSet: TDataSet);

  private
    procedure RecalcSaldo(ACount: Integer);

  protected
    procedure RefreshDetail; override;

  public
    procedure DoDelete; override;
    procedure SetCaptions; override;
    procedure DoOpen(AParam: Variant); override;
    procedure UpdateActionList; override;
    procedure SetCheck(ACheck:Integer);
    procedure DoCheckPopup(X, Y: Integer); override;
    procedure DoPrint(AParam: integer = 0); override;
    procedure DoPrintPopup(X, Y: Integer); override;
    procedure DoHelp; override;
  end;

var
  fmContr: TfmContr;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  EditContr, ssDateUtils, ClientData, BaseFrame, prConst,
  ssBaseConst, BaseRef, fMessageDlg, prFun, ssFun, xLngManager,
  ssStrUtil, prRep, Rep24, BaseRep, ssBaseIntfDlg, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

{ TfmContr }

//==============================================================================================
procedure TfmContr.DoOpen(AParam: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.DoOpen') else _udebug := nil;{$ENDIF}

  case FunID of
    34: RefType := rtContrIn;
    35: RefType := rtContrOut;
  end;

  _ID_ := 'docid';
  EditingClass := TfrmEditContr;

  inherited;

  GrpID := Self.Tag;

  pcMain.Visible := not ModalView;
  Splitter1.Visible := not ModalView;

  if ModalView then panClient.Align := alClient;

  SetCaptions;
  grdMainNeedAdjust(grdMain);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmContr.cdsMainBeforeOpen(DataSet: TDataSet);
  var
    m:String;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.cdsMainBeforeOpen') else _udebug := nil;{$ENDIF}

  M := '';
  with cdsMain do begin
    if (lcbKAgent.KeyValue <> lcbKAgent.EmptyValue) and panFilter.Visible
      then M := M + ' and cntr.kaid=' + IntToStr(lcbKAgent.KeyValue);

    if cbChecked.EditValue = 1 then M := M + ' and cntr.checked=1'
    else if cbChecked.EditValue = 2 then M := M + ' and cntr.checked=0'
    else if cbChecked.EditValue = 3 then M := M + ' and cntr.checked=2'
    else if cbChecked.EditValue = 4 then M := M + ' and cntr.checked=3';

    FetchMacros;
    Macros.ParamByName('m').AsString := M;
    FetchParams;

    case RefType of
      rtContrIn:Params.ParamByName('doctype').AsInteger := 8;
      rtContrOut:Params.ParamByName('doctype').AsInteger := -8;
    end;

    if panFilter.Visible
      then Params.ParamByName('fromdate').AsDateTime := prdMain.FromDate
      else Params.ParamByName('fromdate').AsDateTime := 0;

    if panFilter.Visible
      then Params.ParamByName('todate').AsDateTime := LastSecondInDay(prdMain.ToDate)
      else Params.ParamByName('todate').AsDateTime := MaxDateTime;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmContr.colDocSaldoCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.colDocSaldoCustomDrawCell') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmContr.colSummPayGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.colSummPayGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MoneyDisplayFormat, Abs(StrToFloat(DelChars(AText, [ThousandSeparator]))));
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmContr.colImgFPathCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.colImgFPathCustomDrawCell') else _udebug := nil;{$ENDIF}

  if (AText = '1') and (ASelected) then AText := '-1';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmContr.colImgFPathGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.colImgFPathGetText') else _udebug := nil;{$ENDIF}

  if trim(VarToStr(ANode.Values[colFPath.Index])) <> ''
    then AText := '1'
    else AText := '10000';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmContr.SetCaptions;
  var
    FTitle: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    aReport.Caption := GetRS('fmContr', 'Rep24');
    FindList.Clear;
    FindList.AddObject(GetRS('fmWaybill', 'FiltNum') + ';' + 'num', pointer(1));
    FindList.AddObject(GetRS('fmWaybill', 'FiltDate') + ';' + 'ondate', pointer(2));
    FindList.AddObject(GetRS('fmWaybill', 'FiltKAIn') + ';' + 'kaname', pointer(3));

    inherited;

    case RefType of
      rtContrIn : FTitle := GetRS('fmContr', 'ContractsIn');
      rtContrOut: FTitle := GetRS('fmContr', 'ContractsOut');
    end;
    
    Self.Caption := FTitle;

    SendMessage(ParentHandle, WM_SETPARENTCAPTION, Integer(@FTitle), 0);

    tsInfo.Caption := GetRS('fmContr','Info');
    irPerson.Caption := GetRS('fmContr','Responsible');
    irKAgent.Caption := GetRS('fmWaybill','KAgent');
    mnuStatus.Caption := GetRS('fmContr','Status');
    aSet0.Caption := GetRS('fmContr','Status0');
    aSet1.Caption := GetRS('fmContr','Status1');
    aSet2.Caption := GetRS('fmContr','Status2');
    aSet3.Caption := GetRS('fmContr','Status3');
    aPatternInsert.Caption := GetRS('fmContr','Agreement');
    aPatternInsert.Hint := aPatternInsert.Caption;

    CanRefresh := False;
    cbChecked.Properties.Items.Clear;
    cbChecked.Properties.Items.Add;
    cbChecked.Properties.Items.Add;
    cbChecked.Properties.Items.Add;
    cbChecked.Properties.Items.Add;
    cbChecked.Properties.Items.Add;

    cbChecked.Properties.Items[0].Description := GetRS('Common', 'All');
    cbChecked.Properties.Items[0].Value := 0;
    cbChecked.Properties.Items[0].ImageIndex := 42;

    cbChecked.Properties.Items[1].Description := GetRS('fmContr','Status0');
    cbChecked.Properties.Items[1].Value := 2;
    cbChecked.Properties.Items[1].ImageIndex := 32;

    cbChecked.Properties.Items[2].Description := GetRS('fmContr','Status1');
    cbChecked.Properties.Items[2].Value := 1;
    cbChecked.Properties.Items[2].ImageIndex := 31;

    cbChecked.Properties.Items[3].Description := GetRS('fmContr','Status2');
    cbChecked.Properties.Items[3].Value := 3;
    cbChecked.Properties.Items[3].ImageIndex := -1;
    cbChecked.Properties.Items[4].Description := GetRS('fmContr','Status3');
    cbChecked.Properties.Items[4].Value := 4;
    cbChecked.Properties.Items[4].ImageIndex := -1;

    colCurrName.Caption := '';
    colAllAmount.Caption := GetRS('fmWaybill','Amount');
    colSummAll.Caption := GetRS('fmWaybill','Summ');
    colSummPay.Caption := GetRS('fmWaybill','PaySumm');
    colShAmount.Caption := GetRS('fmWaybill','Amount');
    colShSumm.Caption := GetRS('fmWaybill','Summ');
    colRest.Caption := GetRS('fmWaybill','Amount');
    colRestSumm.Caption := GetRS('fmWaybill','Summ');

    case RefType of
      rtContrIn:colDetShAmount.Caption := GetRS('fmWMat','InDate');
      rtContrOut:colDetShAmount.Caption := GetRS('fmWaybill','Shipped');
    end;

    colToDate.Caption := GetRS('fmWaybill','ToDate');

    aRecalc.Caption := GetRS('fmKAgent','Recalc');
    aRecalcAll.Caption := GetRS('fmKAgent','RecalcAll');
    grdMain.Bands[0].Caption := GetRS('fmWaybill','MainInfo');
    grdMain.Bands[1].Caption := '';

    case RefType of
      rtContrIn:grdMain.Bands[2].Caption := GetRS('fmWMat','InDate');
      rtContrOut:grdMain.Bands[2].Caption := GetRS('fmWaybill','Shipped');
    end;

    grdMain.Bands[3].Caption := GetRS('fmWMat','RemainEx');
    colCurrName.Caption := GetRS('fmWaybill','Curr');
    aCheck.Hint := mnuStatus.Caption;
    CanRefresh := True;
    aPrintFRF.Caption := GetRS('fmContr','PrintFRF');
    aPrintF.Caption := GetRS('fmContr','PrintF');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmContr.grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.grdMainCustomDrawCell') else _udebug := nil;{$ENDIF}

  //inherited;

  if UseGridOddColor and not ASelected and Odd(ANode.AbsoluteIndex)
    then AColor := GridOddLinesColor;

  case VarToInt(ANode.Values[colStatus.Index]) of
    2:AFont.Color := clRed;
    3:AFont.Color := clBtnShadow;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmContr.colCheckedGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.colCheckedGetText') else _udebug := nil;{$ENDIF}

  if VarToInt(ANode.Values[colStatus.Index]) > 0
    then AText := '1'
    else AText := '-1';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmContr.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.UpdateActionList') else _udebug := nil;{$ENDIF}

  inherited;

  aRefresh.Enabled := True;
  aPrint.Enabled := (grdMain.SelectedCount > 0);
  aPatternInsert.Enabled := False;
  aCheck.Enabled := False;

  mnuStatus.Enabled := (grdMain.SelectedCount > 0);
  aProperties.Enabled := (not cdsMain.IsEmpty)
                        and (grdMain.SelectedCount > 0)
                        and (VarToInt(grdMain.FocusedNode.Values[colStatus.Index]) = 0);
                        
  aDel.Enabled := aProperties.Enabled;
  aRecalc.Enabled := (cdsMain.Active and(not cdsMain.IsEmpty));
  aRecalcAll.Enabled := aRecalc.Enabled and (cdsMain.RecordCount>1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmContr.RefreshDetail;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.RefreshDetail') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmContr.srcMainDelayedDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.srcMainDelayedDataChange') else _udebug := nil;{$ENDIF}

  if not ModalView then begin
    with cdsMain do
    if not IsEmpty then begin
      case FieldByName('checked').AsInteger of
        0: aSet0.Checked := True;
        1: aSet1.Checked := True;
        2: aSet2.Checked := True;
        3: aSet3.Checked := True;
      end;
    end;

    inherited;
  end
  else begin
    if cdsMain.FieldByName('checked').AsInteger = 1
      then FCurrentID := cdsMain.FieldByName('docid').AsInteger
      else FCurrentID := 0;
  end;
  
  aPrintF.Enabled := (cdsMain.Active and (not cdsMain.FieldByName('fpath').IsNull) and (Trim(cdsMain.FieldByName('fpath').AsString) <> ''));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmContr.SetCheck(ACheck:integer);
  var
    DocId: integer;
    str: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.SetCheck') else _udebug := nil;{$ENDIF}

  DocId := cdsMain.fieldbyname(_ID_).AsInteger;

  case aCheck of
    0: str := aSet0.Caption;
    1: str := aSet1.Caption;
    2: str := aSet2.Caption;
    3: str := aSet3.Caption;
  end;

  if mrYes = ssMessageDlg(rs('fmContr', 'SetSatus') + ' ' + str + '?', ssmtWarning, [ssmbYes, ssmbNo])
  then with newDataSet do
    try
      Screen.Cursor := crSQLWait;
      ProviderName := 'pContrCheck_Set';
      FetchParams;
      Params.ParamByName('docid').AsInteger := DocId;
      Params.ParamByName('CHECKED').AsInteger := ACheck;
      Execute;

    finally
      Free;
      DoRefresh(0);
      Screen.Cursor := crDefault;
    end;

  case cdsMain.FieldByName('checked').AsInteger of
    0: aSet0.Checked := True;
    1: aSet1.Checked := True;
    2: aSet2.Checked := True;
    3: aSet3.Checked := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmContr.aSet0Execute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.aSet0Execute') else _udebug := nil;{$ENDIF}

  cdsRel.Close;
  cdsRel.Open;

  if cdsRel.IsEmpty
    then SetCheck(0)
    else begin
      ssMessageDlg(rs('fmContr','Set0Errror'), ssmtError,[ssmbOK]);
      pcMain.ActivePage := tsDocRel;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmContr.aSet1Execute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.aSet1Execute') else _udebug := nil;{$ENDIF}

  SetCheck(1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmContr.aSet2Execute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.aSet2Execute') else _udebug := nil;{$ENDIF}

  SetCheck(2);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmContr.aSet3Execute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.aSet3Execute') else _udebug := nil;{$ENDIF}

  with cdsMain do begin
    if (FieldByName('rest').AsFloat = 0) and (FieldByName('summrest').AsFloat = 0)
       and (-FieldByName('paidsumm').AsFloat = FieldByName('shippedsumm').AsFloat)
    then SetCheck(3)
    else ssMessageDlg(rs('fmContr','Set3Errror'), ssmtError,[ssmbOK]);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmContr.DoDelete;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.DoDelete') else _udebug := nil;{$ENDIF}

  try //finally
    if ssMessageDlg(rs('Common','DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo]) <> mrYes
      then Exit;

    with newDataSet do
      try
        Application.ProcessMessages;

        TrStart;

        try
          if not DeleteDataEx(dmData.SConnection,'docs', _ID_, cdsMain.FieldByName(_ID_).AsInteger)
            then raise Exception.Create(rs('Common', 'DeleteError'));

          if not DelToRecycleBin
             then TrCommit
             else begin
               TrRollback;

               if not AddToRecycleBin(dmData.SConnection, Self.ClassName, cdsMain.fieldbyname(_ID_).AsInteger, GetDelStr(cdsMain.fieldbyname(_ID_).AsInteger), False, Self.FunID) then
               begin
                 ssMessageDlg(rs('Common','ErrorInsToRecycleBin'), ssmtError, [ssmbOk]);
                 Exit;
               end;
             end;

          DoRefresh(0);
          UpdateActionList;

          if RefreshAllClients then begin
            //dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WBIN);
            //dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
          end;

        except
          on e:exception do begin
            TrRollback;
            ssMessageDlg(rs('Common','NoDelete'), ssmtError, [ssmbOk]);
          end;
        end;

      finally
        Free;
      end;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure TfmContr.cdsDetailBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.cdsDetailBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsDetailFetch.FetchParams;

  if cdsMain.Active
    then cdsDetailFetch.Params.ParamByName(_ID_).AsInteger := cdsMain.fieldbyname(_ID_).AsInteger
    else cdsDetailFetch.Params.ParamByName(_ID_).AsInteger := 0;

  inherited;
  
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmContr.grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.grdMainGetOptionsTitle') else _udebug := nil;{$ENDIF}

  ImgList := dmData.Images;

  case Self.RefType of
    rtContrIn:
      begin
        AText := rs('fmWaybill','DocContrIn');
        AIndex := II_CONTRIN;
      end;

    rtContrOut:
      begin
        AText := rs('fmWaybill','DocContrOut');
        AIndex := II_CONTROUT;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmContr.colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.colImgGetText') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmContr.grdMainDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.grdMainDblClick') else _udebug := nil;{$ENDIF}

  if ModalView then begin
    if grdMain.Count > 0 then begin
      if cdsMain.FieldByName('checked').AsInteger = 1
        then FCurrentID := cdsMain.FieldByName('docid').AsInteger
        else FCurrentID := 0;

      SendMessage(ParentHandle, WM_SELECTITEM, 0, 0);
    end;
  end
  else inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmContr.RecalcSaldo(ACount: Integer);
  var
    FCount, i: Integer;
    BM: TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.RecalcSaldo') else _udebug := nil;{$ENDIF}

  if ACount = 1
    then FCount := ACount
    else FCount := cdsMain.RecordCount;

  fProgress.Show;
  BM := nil;

  try
    fProgress.Caption := rs('fmKAgent', 'RecalcBallance') + '...';
    fProgress.UpDate;
    fProgress.pbMain.Max := FCount;
    cdsMain.DisableControls;
    BM := cdsMain.GetBookmark;

    if ACount <> 1 then cdsMain.First;

    for i := 1 to FCount do begin
      fProgress.lText.Caption := cdsMain.FieldByName('num').AsString;
      Application.ProcessMessages;
      DoRecalcContract(dmData.SConnection, cdsMain.FieldByName(_ID_).AsInteger);
      fProgress.pbMain.StepIt;
      if ACount <> 1 then cdsMain.Next;
    end;//for

    aRefresh.Execute;

  finally
    if BM <> nil then begin
      cdsMain.GotoBookmark(BM);
      cdsMain.FreeBookmark(BM);
    end;

    cdsMain.EnableControls;
    fProgress.Hide;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmContr.aRecalcAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.aRecalcAllExecute') else _udebug := nil;{$ENDIF}

  inherited;
  RecalcSaldo(-1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmContr.aRecalcExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.aRecalcExecute') else _udebug := nil;{$ENDIF}

  inherited;
  RecalcSaldo(1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmContr.colToDateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.colToDateGetText') else _udebug := nil;{$ENDIF}

  inherited;

  try
    AText := FormatDateTime(ReplaceStr('dd.mm.yyyy', '.', DateSeparator), ANode.Values[colToDate.Index]);

  except
    AText := '';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmContr.grdMainNeedAdjust(Sender: TObject);
  var
    i,j: integer;
    Need: boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.grdMainNeedAdjust') else _udebug := nil;{$ENDIF}

  inherited;

  for i := 0 to grdMain.Bands.Count-1 do begin
    Need := False;

    for j := 0 to grdMain.ColumnCount-1 do begin
      if (grdMain.Columns[j].BandIndex = grdMain.Bands[i].Index) and (grdMain.Columns[j].Visible)
        then Need := true;
    end;

    grdMain.Bands[i].Visible := Need;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmContr.mnuStatusPopup(Sender: TTBCustomItem; FromLink: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.mnuStatusPopup') else _udebug := nil;{$ENDIF}

  inherited;

  case cdsMain.FieldByName('CHECKED').AsInteger of
    0:begin
      aSet0.Checked := True;
      aSet0.Enabled := False;
      aSet1.Enabled := True;
      aSet2.Enabled := False;
      aSet3.Enabled := False;
    end;

    1:begin
      aSet0.Enabled := True;
      aSet1.Checked := True;
      aSet1.Enabled := False;
      aSet2.Enabled := True;
      aSet3.Enabled := True;
    end;

    2:begin
      aSet0.Enabled := False;
      aSet1.Enabled := True;
      aSet2.Checked := True;
      aSet2.Enabled := False;
      aSet3.Enabled := False;
    end;

    3:begin
      aSet0.Enabled := False;
      aSet1.Enabled := True;
      aSet2.Enabled := False;
      aSet3.Checked := True;
      aSet3.Enabled := False;
    end;
  end;//case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmContr.DoCheckPopup(X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.DoCheckPopup') else _udebug := nil;{$ENDIF}

  inherited;

  pmCheck.Popup(X, Y);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmContr.pmCheckPopup(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.pmCheckPopup') else _udebug := nil;{$ENDIF}

  inherited;

  Self.mnuStatusPopup(nil,false);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmContr.DoPrint(AParam: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.DoPrint') else _udebug := nil;{$ENDIF}

  inherited;

  case RefType of
    rtContrIn:  xRep.ShowRep(rtContr, cdsMain.FieldByName(_ID_).AsInteger,AParam);
    rtContrOut: xRep.ShowRep(rtContr, cdsMain.FieldByName(_ID_).AsInteger,AParam);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmContr.DoPrintPopup(X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.DoPrintPopup') else _udebug := nil;{$ENDIF}

  pmPrint.Popup(X, Y);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmContr.aPrintFRFExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.aPrintFRFExecute') else _udebug := nil;{$ENDIF}

  inherited;

  DoPrint(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmContr.aPrintFExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.aPrintFExecute') else _udebug := nil;{$ENDIF}

  inherited;

  DoPrint(1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmContr.aReportExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.aReportExecute') else _udebug := nil;{$ENDIF}

  with TfrmRep24.Create(nil) do
  try
    Caption := rs('fmContr', 'Rep24');
    RepID := 24;
    OnDate := Self.OnDate;

    case FunID of
      34: cbDocType.EditValue := 8;
      35: cbDocType.EditValue := -8;
    end;

    edContr.DocID := cdsMain.FieldByName('docid').AsInteger;
    UpdateActionList;
    ModalResult := mrOk;
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmContr.DoHelp;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmContr.DoHelp') else _udebug := nil;{$ENDIF}

  case RefType of
    prTypes.rtContrIn:  ShowHelpTopic('fmContrIn');
    prTypes.rtContrOut: ShowHelpTopic('fmContrOut');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmContr.cdsDetailFetchAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseWBDoc.cdsDetailFetchAfterOpen') else _udebug := nil;{$ENDIF}

  CopyDataSet(cdsDetail, cdsDetailFetch);

  with cdsDetail do begin
    DisableControls;
    First;

    while not Eof do begin
      UpdatePos;
      Next;
    end;

    First;
    EnableControls;
  end;
  
  GetSummAll;

  ShowTotalAmountNode;

  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fContr', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
