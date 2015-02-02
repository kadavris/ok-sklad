{$I ok_sklad.inc}
unit fInventory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseWBDoc, dxExEdtr6, DB, ssDataSource, DBClient,
  ssClientDataSet, TB2Item, Menus, ActnList, dxInspRw, dxInspct, dxCntner6,
  cxPC, cxDropDownEdit, ssDBLookupCombo, cxImageComboBox,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxCalendar,
  ssSpeedButton, StdCtrls, ssDBGrid, dxTL6, dxDBCtrl6, dxDBTLCl6, dxGrClms6,
  ssBevel, ExtCtrls, dxDBGrid6, Grids, DBGrids, ssPeriod,
  prTypes, okPeriod, ssMemDS, dxExEdtr, dxCntner;

type
  TfmInventory = class(TfmBaseWBDoc)
    aMakeWBRest: TAction;
    aMakeWriteOff: TAction;
    cdsDetailDISCOUNT: TFloatField;
    cdsDetailGRPID: TIntegerField;
    cdsMainATTDATE: TDateTimeField;
    cdsMainATTNUM: TStringField;
    cdsMainCHECKED: TIntegerField;
    cdsMainCURRID: TIntegerField;
    cdsMainDEFNUM: TIntegerField;
    cdsMainDELETED: TIntegerField;
    cdsMainDOCID: TIntegerField;
    cdsMainKAID: TIntegerField;
    cdsMainNDS: TFloatField;
    cdsMainNOTES: TStringField;
    cdsMainNUM: TStringField;
    cdsMainnumex: TIntegerField;
    cdsMainONDATE: TDateTimeField;
    cdsMainPERSONID: TIntegerField;
    cdsMainREASON: TStringField;
    cdsMainRECEIVED: TStringField;
    cdsMainSUMMALL: TFloatField;
    cdsMainTODATE: TDateTimeField;
    cdsMainWBILLID: TIntegerField;
    cdsMainWHNAME: TStringField;
    cdsMainWID: TIntegerField;
    cdsMainWTYPE: TIntegerField;
    colDiff: TdxDBGridColumn;
    colDiffSum: TdxDBGridColumn;
    colNumEx: TdxDBGridColumn;
    colRealAmount: TdxDBGridColumn;
    colRealPrice: TdxDBGridColumn;
    colWBRest: TdxDBGridImageColumn;
    colWriteOff: TdxDBGridImageColumn;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    TBItem7: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBSeparatorItem5: TTBSeparatorItem;

    procedure aMakeWBRestExecute(Sender: TObject);
    procedure aMakeWriteOffExecute(Sender: TObject);
    procedure btnKagentClick(Sender: TObject);
    procedure cdsDetailFetchAfterOpen(DataSet: TDataSet);
    procedure cdsKAgentBeforeOpen(DataSet: TDataSet);
    procedure cdsMainBeforeOpen(DataSet: TDataSet);
    procedure cdsMainCalcFields(DataSet: TDataSet);
    procedure colAmountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colDiffGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colDiffSumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colRealAmountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colWBRestGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colWriteOffGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure grdDetCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure grdDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure srcMainDelayedDataChange(Sender: TObject; Field: TField);

  private
    procedure GetCommission;
    procedure GetSummAll; override;

  protected
    procedure RealignControls; override;

  public
    procedure DoRefresh(const AID: integer; AParam: integer = 0); override;
    procedure DoOpen(AParam: Variant); override;
    procedure DoCheck(EditRequest: Boolean); override;
    procedure DoPrint(AParam: integer = 0); override;
    procedure UpdateActionList; override;
    procedure SetCaptions; override;
    procedure NotifyChanged; override;
  end;

var
  fmInventory: TfmInventory;

implementation

uses
  ClientData, fMessageDlg, prFun, prConst, StrUtils,
  ssCallbackConst, DocsList, BaseFrame, prRep, ssBaseConst,
  xLngManager, ssFun, ssDateUtils, EditInventory, EditWBRest, BaseRef,
  ssStrUtil, EditWriteOff, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfmInventory.cdsMainBeforeOpen(DataSet: TDataSet);
  var
    M: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInventory.cdsMainBeforeOpen') else _udebug := nil;{$ENDIF}

  inherited;

  M := '';

  with cdsMain do begin
    if cbChecked.EditValue = 1 then M := M + ' and wbl.checked=1'
    else if cbChecked.EditValue = 2 then M := M + ' and wbl.checked=0';

    if (lcbKAgent.KeyValue <> lcbKAgent.EmptyValue) and panFilter.Visible
      then m := m + ' and wbm.sourcewid=' + IntToStr(lcbKAgent.KeyValue);

    m := m + WHAccessMacro('wbm.sourcewid');
    Macros.ParamByName('m').AsString := M;

    //Params.ParamByName('wtype').AsInteger := 1;

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
procedure TfmInventory.DoCheck(EditRequest: Boolean);
  var
    WBillID: Integer;
    eStr: string;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInventory.DoCheck') else _udebug := nil;{$ENDIF}

  if cdsDocRel.Locate('pid', cdsMain.fieldbyname(_ID_).AsInteger, []) then begin
    ssMessageDlg(rs(Self.Name, 'DocRelExist'), ssmtError, [ssmbOK]);
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  with newDataSet do
    try
      eStr := '';
      WBillID := cdsMain.fieldbyname(_ID_).AsInteger;

      if grdMain.FocusedNode.Values[colChecked.Index] = 0 then begin
        if mrYes = ssMessageDlg(rs('Common','CheckConfirm'), ssmtWarning, [ssmbYes, ssmbNo])
        then begin
          Application.ProcessMessages;

          TrStart;

          try
            ProviderName := 'pWaybillCheck_Set1';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := WBILLID;
            Execute;

            TrCommit;

            DoRefresh(0);

            UpdateActionList;
            if RefreshAllClients then begin
              //dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WBIN);
              //dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
              //dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_KAGENTS);
            end;

          except
            on E: Exception do begin
              TrRollback;
              ssMessageDlg(E.Message, ssmtError, [ssmbOK]);
            end;
          end;
        end;
      end
      else begin
        //проверка расхода
        Close;
        Screen.Cursor := crDefault;

        if mrYes = ssMessageDlg(rs('Common', ifThen(EditRequest, 'PostedEditConfirm', 'UncheckConfirm')), ssmtWarning, [ssmbYes, ssmbNo])
        then begin
          Screen.Cursor := crSQLWait;
          Application.ProcessMessages;

          TrStart;

          try
            ProviderName := 'pWaybillCheck_Set0';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := WBILLID;
            Execute;

            TrCommit;

            DoRefresh(0);
            UpdateActionList;
            if RefreshAllClients then begin
              //dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WBIN);
              //dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
              //dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_KAGENTS);
            end;

          except
            on E: Exception do begin
              TrRollback;
              ssMessageDlg(E.Message, ssmtError, [ssmbOk]);
            end;
          end;
        end;
      end;

    finally
      Free;
      Screen.Cursor := crDefault;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInventory.DoOpen(AParam: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInventory.DoOpen') else _udebug := nil;{$ENDIF}

  _ID_ := 'wbillid';
  EditingClass := TfrmEditInventory;
  irKAgent.Buttons[0].Visible := False;
  RefType := prTypes.rtInv;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInventory.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInventory.UpdateActionList') else _udebug := nil;{$ENDIF}

  aPatternInsert.Enabled := False;

  inherited;

  aMakeWBRest.Enabled := (grdMain.SelectedCount = 1) and (cdsMain.FieldByName('checked').AsInteger = 1);
  aMakeWriteOff.Enabled := aMakeWBRest.Enabled;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInventory.DoPrint(AParam: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInventory.DoPrint') else _udebug := nil;{$ENDIF}

  xRep.ShowRep(rtInv, cdsMain.FieldByName(_ID_).AsInteger);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInventory.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInventory.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    FindList.Clear;
    FindList.AddObject(GetRS('fmWaybill', 'FiltNum') + ';' + 'num', pointer(1));
    FindList.AddObject(GetRS('fmWaybill', 'FiltDate') + ';' + 'ondate', pointer(2));
    FindList.AddObject(GetRS('fmWaybill', 'FiltKAIn') + ';' + 'kaname', pointer(3));

    inherited;

    Self.Caption := GetRS('fmWaybill' ,'TitleInv');

    tsInfo.Caption := GetRS('fmWaybill', 'ActInfo');
    lKAgent.Caption := GetRS('fmWaybill', 'WHouse');
    btnKagent.Hint := GetRS('fmWaybill', 'WHouseRef');
    colName.Caption := GetRS('fmWaybill', 'WHouse');

    colDiff.Caption := GetRS(Self.Name, 'Diff');
    colRealAmount.Caption := GetRS(Self.Name, 'RealAmount');
    colAmount.Caption := GetRS(Self.Name, 'Amount');
    colWriteOff.Caption := GetRS(Self.Name, 'WriteOffDoc');
    colWBRest.Caption := GetRS(Self.Name, 'WBRestDoc');
    colRealPrice.Caption := GetRS(Self.Name, 'RealPrice');
    colPrice.Caption := GetRS(Self.Name, 'CalcPrice') + ' (' + GetRS(Self.Name, 'AvgPrice') + ')';
    colDiffSum.Caption := GetRS(Self.Name, 'DiffSum');
    colRecNo.Caption := amountPrefix;

    irPerson.Caption := GetRS('fmWaybill','WHouse');
    irKAgent.Caption := GetRS('fmWriteOff', 'Comission');
    irKAFullName.Caption := GetRS('fmWriteOff', 'Chairman');
    irKAAdress.Caption := GetRS('fmWriteOff', 'Person1');
    irKAPhone.Caption := GetRS('fmWriteOff', 'Person2');
    irFax.Caption := GetRS('fmWriteOff', 'Person3');

    lTot.Caption := GetRS(Self.Name, 'RealSum') + ' (' + BaseCurrName + '):';
    lTotNDS.Caption := GetRS(Self.Name, 'Sum') + ' (' + BaseCurrName + '):';

    aMakeWBRest.Caption := GetRS(Self.Name, 'MakeWBRest');
    aMakeWriteOff.Caption := GetRS(Self.Name, 'MakeWriteOff');

  end;
  RealignControls;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInventory.cdsMainCalcFields(DataSet: TDataSet);
  var
    FNum: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInventory.cdsMainCalcFields') else _udebug := nil;{$ENDIF}

  try
    FNum := DataSet.FieldByName('num').AsString;

    if Pos(InvPrefix, FNum) = 1
      then DataSet.FieldByName('numex').AsInteger :=
           StrToInt(Trim(Copy(FNum, Length(InvPrefix) + 1, Length(FNum) - Length(InvPrefix) - Length(InvSuffix))))
      else DataSet.FieldByName('numex').AsInteger := StrToInt(FNum);

  except
    DataSet.FieldByName('numex').AsInteger := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInventory.colNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInventory.colNumGetText') else _udebug := nil;{$ENDIF}

  AText := ANode.Values[colNumEx.Index];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInventory.RealignControls;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInventory.RealignControls') else _udebug := nil;{$ENDIF}

  inherited;

  stCount.Left := panFooter.Width - stCount.Width - 6;
  lDocsCount.Left := stCount.Left - lDocsCount.Width - 4;

  stSummDef.Left := PanDetFooter.Width - stSummDef.Width - 6;
  lTot.Left := stSummDef.Left - lTot.Width - 4;
  stSummDefNDS.Left := lTot.Left - stSummDefNDS.Width - 6;
  lTotNDS.Left := stSummDefNDS.Left - lTotNDS.Width - 4;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInventory.srcMainDelayedDataChange(Sender: TObject; Field: TField);
  var
   i: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInventory.srcMainDelayedDataChange') else _udebug := nil;{$ENDIF}

  for i := 0 to pcMain.PageCount - 1 do pcMain.Pages[i].Tag := 1;
  RefreshDetail;
  GetCommission;

  with cdsMain do
    if not IsEmpty then begin
      irNum.Text := FieldByName('num').AsString + RS('fmWaybill', 'From', 3) +
          ssDateToStr(FieldByName('ondate').AsDateTime) + ' ' + TimeToStr(FieldByName('ondate').AsDateTime);

      irPerson.Text := FieldByName('whname').AsString;
      irReason.Text := FieldByName('reason').AsString;

      if FieldByName('checked').AsInteger = 1
        then irStatus.Text := rs('fmWaybill', 'DocChecked')
        else irStatus.Text := rs('fmWaybill', 'DocUnChecked');
    end
    else begin
      irPerson.Text := '';
      irReason.Text := '';
      irNum.Text := '';
      irStatus.Text := '';
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInventory.btnKagentClick(Sender: TObject);
  var
    intID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInventory.btnKagentClick') else _udebug := nil;{$ENDIF}

  try intID := lcbKAgent.KeyValue; except  intID := 0; end;
  ShowModalRef(Self, rtWHouse, vtWHouse, 'TfmWHouse', Self.OnDate, intID);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInventory.DoRefresh(const AID: integer; AParam: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInventory.DoRefresh') else _udebug := nil;{$ENDIF}

  case AParam of
    0:begin
        DSRefresh(cdsMain, _ID_, AID);
      end;

    Integer(rtWHouse):
      begin
        DSRefresh(cdsKAgent, 'wid', AID);
        lcbKAgent.KeyValue := AID;
        lcbKAgent.SelStart := 0;
        lcbKAgent.SelLength := 0;
      end;
  end;
  SelectFocusedNode;
  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInventory.cdsDetailFetchAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInventory.cdsDetailFetchAfterOpen') else _udebug := nil;{$ENDIF}

  CopyDataSet(cdsDetail, cdsDetailFetch);
  GetSummAll;
  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInventory.colRealAmountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInventory.colRealAmountGetText') else _udebug := nil;{$ENDIF}

  if AText = '' then AText := '0';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInventory.colAmountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInventory.colAmountGetText') else _udebug := nil;{$ENDIF}

  if AText = '' then AText := '0';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInventory.colDiffGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInventory.colDiffGetText') else _udebug := nil;{$ENDIF}
      
  try
    AText := FormatFloat(MatDisplayFormat, ANode.Values[colRealAmount.Index] -
      ANode.Values[colAmount.Index]);
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInventory.GetCommission;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInventory.GetCommission') else _udebug := nil;{$ENDIF}

  // Чтение комиссии
  with newDataSet do
  try
    ProviderName:='pWOCom_Get';
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := cdsMain.FieldByName('wbillid').AsInteger;
    Open;

    if not IsEmpty then begin
      if Locate('num', 0 ,[]) then irKAFullName.Text := fieldbyname('name').AsString;
      if Locate('num', 1, []) then irKAAdress.Text := fieldbyname('name').AsString;
      if Locate('num', 2, []) then irKAPhone.Text := fieldbyname('name').AsString;
      if Locate('num', 3, []) then irFax.Text := fieldbyname('name').AsString;
    end;//if not IsEmpty

    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInventory.GetSummAll;
  var
    i: Integer;
    FSum, FRealSum: Extended;
    FRealAmount: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInventory.GetSummAll') else _udebug := nil;{$ENDIF}

  with grdDet do begin
    FSum := 0;
    FRealSum := 0;

    for i := 0 to Count - 1 do begin
      FSum := FSum + RoundToA(ssStrToFloat(Items[i].Values[colAmount.Index]) *
              ssStrToFloat(Items[i].Values[colPrice.Index]), -2);

      if VarIsNull(Items[i].Values[colRealAmount.Index])
        then FRealAmount := 0
        else FRealAmount := ssStrToFloat(Items[i].Values[colRealAmount.Index]);

      FRealSum := FRealSum + RoundToA(FRealAmount * ssStrToFloat(Items[i].Values[colRealPrice.Index]), -2);
    end;

    stSummDefNDS.Caption := FormatFloat(MoneyDisplayFormat, FSum);
    stSummDef.Caption := FormatFloat(MoneyDisplayFormat, FRealSum);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInventory.aMakeWriteOffExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInventory.aMakeWriteOffExecute') else _udebug := nil;{$ENDIF}

  (*
  {$IFDEF LITE}
  showNotAvailable;
  {$ELSE}
  *)

  if cdsDocRel.Locate('pid;wtype', VarArrayOf([cdsMain.FieldByName('wbillid').AsInteger, -5]), [])
  then begin
    ssMessageDlg(rs(Self.Name, 'WriteOffExist'), ssmtError, [ssmbOK]);
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end
  else
    with TfrmEditWriteOff.Create(nil) do
    try
      ParentNameEx := 'fmWriteOff';
      OnDate := Self.OnDate;
      ID := 0;
      lcbWHouseOut.KeyValue := cdsMain.FieldByName('wid').AsInteger;
      GetFromInv(cdsMain.FieldByName('wbillid').AsInteger, cdsMain.FieldByName('num').AsString);

      if ShowModal = mrOk then begin
        aRefresh.Execute;
        RefreshFun('TfmWriteOff', 0);
      end;

    finally
      Free;
    end;
  //{$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInventory.aMakeWBRestExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInventory.aMakeWBRestExecute') else _udebug := nil;{$ENDIF}

  if cdsDocRel.Locate('pid;wtype', VarArrayOf([cdsMain.FieldByName('wbillid').AsInteger, 5]), [])
  then begin
    ssMessageDlg(rs(Self.Name, 'WBRestExist'), ssmtError, [ssmbOK]);
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end
  else
    with TfrmEditWBRest.Create(nil) do
    try
      ParentNameEx := 'fmWBRest';
      OnDate := Self.OnDate;
      ID := 0;
      GetFromInventory(cdsMain.FieldByName('wbillid').AsInteger, cdsMain.FieldByName('num').AsString);

      if ShowModal = mrOk then begin
        aRefresh.Execute;
        RefreshFun('TfmWBRest', 0);
      end;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInventory.colWBRestGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInventory.colWBRestGetText') else _udebug := nil;{$ENDIF}


  if cdsDocRel.Locate('pid;wtype', VarArrayOf([ANode.Values[colID.Index], 5]), [])
    then AText := '5'
    else AText := '0';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInventory.grdDetCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInventory.grdDetCustomDrawCell') else _udebug := nil;{$ENDIF}

  if UseGridOddColor and not ASelected and Odd(ANode.AbsoluteIndex)
    then AColor := GridOddLinesColor;

  if not ASelected then
    if ANode.Values[colDiff.Index] < 0 then AFont.Color := clRed else
    if ANode.Values[colDiff.Index] > 0 then AFont.Color := clBlue;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInventory.colWriteOffGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInventory.colWriteOffGetText') else _udebug := nil;{$ENDIF}

  if cdsDocRel.Locate('pid;wtype', VarArrayOf([ANode.Values[colID.Index], -5]), [])
    then AText := '-5'
    else AText := '0';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInventory.colDiffSumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  var
    FRealPrice, FPrice, FAmount, FRealAmount: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInventory.colDiffSumGetText') else _udebug := nil;{$ENDIF}

  try FRealPrice := ANode.Values[colRealPrice.Index]; except FRealPrice := 0; end;
  try FPrice := ANode.Values[colPrice.Index]; except FPrice := 0; end;
  try FAmount := ANode.Values[colAmount.Index]; except FAmount := 0; end;
  try FRealAmount := ANode.Values[colRealAmount.Index]; except FRealAmount := 0; end;

  AText := FormatFloat(MoneyDisplayFormat, RoundToA(FRealAmount * FRealPrice, -2) - RoundToA(FAmount * FPrice, -2));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInventory.colPriceGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInventory.colPriceGetText') else _udebug := nil;{$ENDIF}

  AText := FormatFloat(',0.######', StrToFloat(AText));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInventory.grdDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInventory.grdDetGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := rs('fmWaybill', 'DocInv');
  ImgList := dmData.Images;
  AIndex := II_INVENTORY;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInventory.NotifyChanged;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInventory.NotifyChanged') else _udebug := nil;{$ENDIF}

  if not JumpFromBuffer
    then frmMainForm.AddToBuffer(vtWMat, FunID, Self.Caption, ClassName, Tag, FCurrentID, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInventory.grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInventory.grdMainGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := rs('frmOptions', 'Inv');
  ImgList := dmData.Images;
  AIndex := II_INVENTORY;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmInventory.cdsKAgentBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmInventory.cdsKAgentBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsKAgent.Macros.ParamByName('m').AsString := WHAccessMacro;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fInventory', @Debugging, DEBUG_group_ID);
  {$ENDIF}

finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
