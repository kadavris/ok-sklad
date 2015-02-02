{$I ok_sklad.inc}
unit fMoneyMove;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrame, Menus, ActnList, dxTL6, dxDBCtrl6, dxDBGrid6, dxCntner6,
  DB, DBClient, ssBaseConst, ssBaseTypes, ssDBGrid,
  ssClientDataSet, ExtCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, StdCtrls, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, ssDBComboBox, ssBevel,
  ssDBLookupCombo, FR_Class, dxDBTLCl6, dxGrClms6, ssSpeedButton, TB2Item,
  dxExEdtr6, dxInspRw, dxInspct, cxPC, cxMemo, ssPeriod,
  okPeriod, okMoneyFun, dxExEdtr, dxCntner;

type
  TfmMoneyMove = class(TssBaseFrame)
    aDRPrint: TAction;
    aGotoDoc: TAction;
    aPrintInOrder: TAction;
    aPrintPayOrder: TAction;
    btnChargeType: TssSpeedButton;
    bvlRight: TssBevel;
    bvlTop: TssBevel;
    cbOperType: TcxComboBox;
    cdsChargeType: TssClientDataSet;
    cdsFind: TssClientDataSet;
    cdsKAgent: TssClientDataSet;
    cdsPayType: TssClientDataSet;
    cdsRel: TssClientDataSet;
    cdsView: TssClientDataSet;
    colAcc: TdxDBGridColumn;
    colAccDest: TdxDBGridColumn;
    colBankDest: TdxDBGridColumn;
    colBankSrc: TdxDBGridColumn;
    colCashName: TdxDBGridColumn;
    colCashNameDest: TdxDBGridColumn;
    colCharge: TdxDBGridColumn;
    colChecked: TdxDBGridImageColumn;
    colDocType: TdxDBGridImageColumn;
    colDRID: TdxDBGridColumn;
    colDRNum: TdxDBGridColumn;
    colDROnDate: TdxDBGridColumn;
    colDRSummAll: TdxDBGridCurrencyColumn;
    colDRType: TdxDBGridImageColumn;
    colDRTypeName: TdxDBGridColumn;
    colFrom: TdxDBGridColumn;
    colID: TdxDBGridColumn;
    colNum: TdxDBGridColumn;
    colOnDate: TdxDBGridColumn;
    colOperType: TdxDBGridColumn;
    colRate: TdxDBGridColumn;
    colShortName: TdxDBGridColumn;
    colShortNameDest: TdxDBGridColumn;
    colTo: TdxDBGridColumn;
    colTotal: TdxDBGridColumn;
    colTotalDest: TdxDBGridColumn;
    frDoc: TfrReport;
    grdDocRel: TssDBGrid;
    grdMain: TssDBGrid;
    inspMain: TdxInspector;
    irCharge: TdxInspectorTextRow;
    irFrom: TdxInspectorTextRow;
    irFromSumm: TdxInspectorTextRow;
    irNum: TdxInspectorTextRow;
    irReason: TdxInspectorTextRow;
    irStatus: TdxInspectorTextRow;
    irTo: TdxInspectorTextRow;
    irToSumm: TdxInspectorTextRow;
    irType: TdxInspectorTextRow;
    lcbChargeType: TssDBLookupCombo;
    lChargeType: TLabel;
    lCount: TLabel;
    lOperType: TLabel;
    lTotal: TLabel;
    memNotes: TcxMemo;
    mnuGotoDoc: TTBItem;
    PageInfo: TcxTabSheet;
    panFilter: TPanel;
    panFooter: TPanel;
    panGrid: TPanel;
    panMain: TPanel;
    pcMain: TcxPageControl;
    pmDocRel: TTBPopupMenu;
    prdMain: TokPeriod;
    Splitter1: TSplitter;
    srcChargeType: TDataSource;
    srcKAgent: TDataSource;
    srcPayType: TDataSource;
    srcRel: TDataSource;
    srcView: TDataSource;
    ssBevel10: TssBevel;
    ssBevel12: TssBevel;
    ssBevel19: TssBevel;
    ssBevel1: TssBevel;
    ssBevel21: TssBevel;
    ssBevel22: TssBevel;
    ssBevel2: TssBevel;
    ssBevel3: TssBevel;
    ssBevel4: TssBevel;
    ssBevel5: TssBevel;
    ssBevel6: TssBevel;
    ssBevel7: TssBevel;
    ssBevel8: TssBevel;
    ssBevel9: TssBevel;
    stCount: TssBevel;
    stTotal: TssBevel;
    TBItem10: TTBItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBSeparatorItem5: TTBSeparatorItem;
    TBSubmenuItem1: TTBSubmenuItem;
    tsDocRel: TcxTabSheet;
    tsNotes: TcxTabSheet;

    procedure aColParamsExecute(Sender: TObject);
    procedure aDRPrintExecute(Sender: TObject);
    procedure aGotoDocExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aPropertiesExecute(Sender: TObject);
    procedure aSelectAllExecute(Sender: TObject);
    procedure btnChargeTypeClick(Sender: TObject);
    procedure cbOperTypePropertiesEditValueChanged(Sender: TObject);
    procedure cdsRelAfterOpen(DataSet: TDataSet);
    procedure cdsRelBeforeOpen(DataSet: TDataSet);
    procedure cdsViewAfterOpen(DataSet: TDataSet);
    procedure cdsViewBeforeOpen(DataSet: TDataSet);
    procedure cdsViewCalcFields(DataSet: TDataSet);
    procedure colAccGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colCheckedGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colDocTypeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colDROnDateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colDRTypeNameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colFromGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colOnDateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colOperTypeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPayOrderCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;var ADone: Boolean);
    procedure colToGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colTotalDefGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colTotalDestGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colTotalGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure edFromDateExit(Sender: TObject);
    procedure edFromDateKeyPress(Sender: TObject; var Key: Char);
    procedure edFromDatePropertiesChange(Sender: TObject);
    procedure FrameResize(Sender: TObject);
    procedure frDocGetValue(const ParName: String; var ParValue: Variant);
    procedure grdDocRelDblClick(Sender: TObject);
    procedure grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure grdMainDblClick(Sender: TObject);
    procedure grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure grdMainNeedAdjust(Sender: TObject);
    procedure grdMainSelectedCountChange(Sender: TObject);
    procedure inspMainDrawCaption(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
    procedure inspMainDrawValue(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
    procedure lcbChargeTypePropertiesChange(Sender: TObject);
    procedure lcbKAgentPropertiesEditValueChanged(Sender: TObject);
    procedure srcViewDataChange(Sender: TObject; Field: TField);
    procedure tsNotesShow(Sender: TObject);

  private
    CanRefresh: boolean;
    edFromDatePropertiesChangeIsActive: boolean;
    function CheckDate(const AValue: string): boolean;
    procedure RealignFilter;

  protected
    function GetIDForUpdate: integer; override;
    procedure SetOnDate(const Value: TDateTime); override;

  public
    procedure UpdateActionList; override;
    procedure DoOpen(AParam: Variant); override;
    procedure DoShow; override;
    procedure DoClose; override;
    procedure DoDelete; override;
    procedure DoHelp; override;
    procedure DoCheck(EditRequest: Boolean); override;
    procedure DoRefresh(const AID: integer; AParam: integer = 0); override;
    procedure SetCaptions; override;
    procedure DoFind(const AFName, AStr: string; ALocateType: TLocateType; AFwd: Boolean = True); override;
    procedure DoExcel(Grid: TdxDBGrid); override;
    procedure DoPrint(AParam: Integer); override;
    procedure DoShowFilter; override;
    procedure DoLocate(const AID: Integer; ASubID: Integer = 0); override;
    procedure NotifyChanged; override;
  end;

var
  fmMoneyMove: TfmMoneyMove;

implementation

uses
  ClientData, prFun, prConst, ssFun, DateUtils, Export, prTypes,
  ssCallbackConst, ssRegUtils, fMessageDlg, ssDateUtils, ssStrUtil, prRep,
  StrUtils, EditMoneyMove, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}


const
  _ID_ = 'OperID';

//==============================================================================================
procedure TfmMoneyMove.DoClose;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.DoClose') else _udebug := nil;{$ENDIF}

  cdsView.Close;

  //WriteToRegDate(MainRegKey + '\' + Self.ClassName, 'FromDate', edFromDate.Date);
  prdMain.SaveToRegistry;

  WriteToRegInt(MainRegKey + '\' + Self.ClassName, 'pcMain.Height', pcMain.Height);

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.DoDelete;
  var
     i: Integer;
     {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}

  function GetCurrPayStr(AIndex: Integer): string;
  begin
    {case GrpID of
      1: Result := rs('fmWaybill', 'PDIn');
     -1: Result := rs('fmWaybill', 'PDOut');
     -2: Result := rs('fmWaybill', 'PDCharge');
    end;
    Result := Result + amountPrefix + VarToStr(grdMain.SelectedNodes[AIndex].Values[colNum.Index]) +
      ' ' + rs('fmWaybill', 'From') + ' ' +
      DateToStr(grdMain.SelectedNodes[AIndex].Values[colOnDate.Index]) + ' ' +
      AnsiLowerCase(rs('fmWaybill', 'DocsSumm')) + ' ' +
      FormatFloat(MoneyDisplayFormat, grdMain.SelectedNodes[AIndex].Values[colTotal.Index]) +
      grdMain.SelectedNodes[AIndex].Values[colShortName.Index] + ' (' +
      grdMain.SelectedNodes[AIndex].Values[colName.Index] + ')';
    }
  end;

begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.DoDelete') else _udebug := nil;{$ENDIF}

  if ((grdMain.SelectedCount = 1) and (ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes))
     or
     ((grdMain.SelectedCount > 1) and
     (ssMessageDlg(Format(rs('Common', 'DelConfirmEx'), [grdMain.SelectedCount]), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes))
  then begin
   fProgress.Show;

   with newDataSet do
    try
     Application.ProcessMessages;
     fProgress.Caption := rs('Common', 'Deleting');
     fProgress.UpDate;
     fProgress.pbMain.Max := grdMain.SelectedCount;

     for i := 0 to grdMain.SelectedCount - 1 do begin
       if grdMain.SelectedNodes[i].Values[colChecked.Index] = 1 then Continue;
       TrStart;
       try
         if not DeleteDataEx(dmData.SConnection, 'paydoc', 'operid', grdMain.SelectedNodes[i].Values[colID.Index])
           then raise Exception.Create('Error!');

         TrCommit;

       except
         on E:Exception do begin
           TrRollback;
           if (grdMain.SelectedCount = 1)
             then begin
               ssMessageDlg(rs('Common', 'NoDelete') + #10#13 + e.Message, ssmtError, [ssmbOk]);
               {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
               Exit;
             end
             else if mrYes <> ssMessageDlg(Format(rs('Common', 'NoDeleteEx'),
                     [grdMain.SelectedNodes[i].Values[colNum.Index]]), ssmtError, [ssmbYes, ssmbNo])
             then begin
               TrRollback;
               Break;
             end;
         end;
       end;

       fProgress.lText.Caption := '[' + VarToStr(grdMain.SelectedNodes[i].Values[colNum.Index]) + '] ' +
         grdMain.SelectedNodes[i].Values[colFrom.Index] + ' -> ' + grdMain.SelectedNodes[i].Values[colTo.Index];

       fProgress.pbMain.StepIt;
       Application.ProcessMessages;
     end;

     with grdMain do
       if SelectedCount > 1 then begin
         cdsView.First;
       end
       else if (FocusedNode.Index = grdMain.Count - 1) and (FocusedNode.Index > 0)
         then cdsView.Locate(_ID_, FocusedNode.GetPrev.Values[colID.Index], [])
         else cdsView.Locate(_ID_, FocusedNode.GetNext.Values[colID.Index], []);

     aRefresh.Execute;
     UpdateActionList;

    finally
      fProgress.Hide;
      Free;
    end;
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.DoOpen(AParam: Variant);
  var
    i: integer;
    Temp: TDateTime;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.DoOpen') else _udebug := nil;{$ENDIF}

  EditingClass := TfrmEditMoneyMove;
  prdMain.RegistryPath := MainRegKey + '\' + Self.ClassName;
  CanRefresh := False;
  //dmData.Images.GetBitmap(66, colPayOrder.HeaderGlyph);
  pcMain.ActivePageIndex := 0;

  if ReadFromRegInt(MainRegKey + '\' + Self.ClassName, 'pcMain.Height', i)
    then pcMain.Height := i;

  //cdsKAgent.Open;
  cdsPayType.Open;
  cdsChargeType.Open;

  RefType := rtMoneyMove;
  CheckSrvLocked := True;

  inherited;

  if not LoadExpParams
    then with ExportList do
      for i := 0 to grdMain.ColumnCount - 1 do
        if grdMain.Columns[i].Tag = 1
          then AddObject(grdMain.Columns[i].Name, pointer(1));

  prdMain.LoadFromRegistry;
  DoShowFilter;
  //cdsView.Open;
  CanRefresh := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.SetCaptions;
  var
    FTitle: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    Self.Caption := GetRS('fmMoneyMove', 'Title');
    FTitle := Self.Caption;

    colOnDate.Caption := GetRS('fmPayDoc', 'Date');
    colChecked.Caption := '';
    colDocType.Caption := '';
    colTotal.Caption := GetRS('fmMoneyMove', 'Summ');
    colTotalDest.Caption := GetRS('fmMoneyMove', 'Summ');
    colFrom.Caption := GetRS('fmMoneyMove', 'FromCashAcc');
    colTo.Caption := GetRS('fmMoneyMove', 'ToCashAcc');
    colNum.Caption := GetRS('fmPayDoc', 'DocNum');
    colOpertype.Caption := GetRS('fmMoneyMove', 'OperType');

    prdMain.InitRes;
    prdMain.CapFrom := GetRS('fmPayDoc', 'FromDate') + ':';
    lOperType.Caption := GetRS('fmMoneyMove', 'OperType');

    tsNotes.Caption := GetRS('fmPayDoc', 'Notes');
    PageInfo.Caption := GetRS('fmMoneyMove', 'OperInfo');

    grdMain.Bands.Items[0].Caption := GetRS('fmMoneyMove', 'Doc');
    grdMain.Bands.Items[1].Caption := GetRS('fmMoneyMove', 'From');
    grdMain.Bands.Items[2].Caption := GetRS('fmMoneyMove', 'To');

    irNum.Caption := GetRS('fmMoneyMove', 'Doc');
    irType.Caption := GetRS('fmMoneyMove', 'OperType');
    irFrom.Caption := GetRS('fmMoneyMove', 'From');
    irTo.Caption := GetRS('fmMoneyMove', 'To');
    irFromSumm.Caption := GetRS('fmMoneyMove', 'SummFrom');
    irToSumm.Caption := GetRS('fmMoneyMove', 'SummTo');
    irReason.Caption := GetRS('fmWaybill', 'Reason');
    irStatus.Caption := GetRS('fmWaybill', 'DocStatus');
    irCharge.Caption := GetRS('fmMoneyMove', 'Charges');

    with cbOperType do begin
      Properties.Items.Add(GetRS('Common', 'All'));
      Properties.Items.AddObject(GetRS('fmPayDoc', 'OperMove'), Pointer(3));
      Properties.Items.AddObject(GetRS('fmPayDoc', 'OperConvert'), Pointer(4));
      Properties.Items.AddObject(GetRS('fmMoneyMove', 'CashWithCharge'), Pointer(5));
      ItemIndex := 0;
    end;

    aCheck.Caption := GetRS('Common', 'Check');

    SendMessage(ParentHandle, WM_SETPARENTCAPTION, integer(@FTitle), 0);

    FindList.Clear;
    FindList.AddObject(GetRS('fmPayDoc', 'DocNumD')+';'+'docnum', pointer(1));
    FindList.AddObject(GetRS('fmPayDoc', 'DateD')+';'+'ondate', pointer(2));
  end;

  RealignFilter;
  
  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.grdMainDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.grdMainDblClick') else _udebug := nil;{$ENDIF}

  if grdMain.Count > 0 then begin
    if (cdsView.FieldByName('checked').AsInteger = 1) and GetUserAccessByClass(Self.ClassName, uaPost) then begin
      if mrYes <> ssMessageDlg(rs('Common', 'PostedEditConfirm'), ssmtWarning, [ssmbYes, ssmbNo])
      then begin
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;

      Application.ProcessMessages;
      with newDataSet do
       try
         ProviderName := 'pMoneyMove_SetChecked';
         FetchParams;
         Params.ParamByName('operid').AsInteger := cdsView.fieldbyname('operid').AsInteger;
         Params.ParamByName('checked').AsInteger := 0;
         Execute;
         DoRefresh(0);

       finally
         Free;
       end;
    end;

    DoProperties;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.UpdateActionList') else _udebug := nil;{$ENDIF}

  {$IFDEF LIMITED}
    limited := cdsView.Active and (cdsView.recordCount >= limitDocumentsCount);
  {$ELSE}
    limited := False;
  {$ENDIF}

  aNew.Enabled := not limited;
  aPaste.Enabled := not limited;

  aProperties.Enabled := not cdsView.IsEmpty and (grdMain.SelectedCount = 1)
     and (cdsView.FieldByName('checked').AsInteger = 0);

  aDel.Enabled := not cdsView.IsEmpty and (cdsView.FieldByName('checked').AsInteger = 0);
  aCheck.Enabled := not cdsView.IsEmpty;

  aPrintInOrder.Visible := (grdMain.SelectedCount = 1) and (Tag = utv_gType_PayDocIn)
    and not cdsView.IsEmpty and (cdsView.FieldByName('ptypeid').AsInteger = 1);

  aPrintPayOrder.Visible := (grdMain.SelectedCount = 1) and (Tag = utv_gType_PayDocOut)
    and not cdsView.IsEmpty and (cdsView.FieldByName('ptypeid').AsInteger = 2);

  aPrint.Visible := aPrintInOrder.Visible or aPrintPayOrder.Visible;
  aPrint.Enabled := aPrint.Visible;
  aPatternInsert.Enabled := False;
  aGotoDoc.Enabled := not cdsRel.IsEmpty;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.DoRefresh(const AID: integer; AParam: integer = 0);
  var
    FLastIndex: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.DoRefresh') else _udebug := nil;{$ENDIF}

  FLastIndex := grdMain.TopIndex;
  cdsView.DisableControls;
  case AParam of
   0: begin
       DSRefresh(cdsView, _ID_, AID);
      end;

   Integer(rtChargeType):
      begin
        CanRefresh := False;
        DSRefresh(cdsChargeType, 'ctypeid', 0);
        CanRefresh := True;
        lcbChargeType.KeyValue := AID;
      end;
  end;
  grdMain.TopIndex := FLastIndex;
  cdsView.EnableControls;

  UpdateActionList;

  with grdMain do begin
    ClearSelection;
    if FocusedNode <> nil then FocusedNode.Selected := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmMoneyMove.GetIDForUpdate: integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.GetIDForUpdate') else _udebug := nil;{$ENDIF}

  Result := cdsView.fieldbyname(_ID_).AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.grdMainCustomDrawCell') else _udebug := nil;{$ENDIF}

  //if (ANode.Values[1]=1) and not ASelected then AFont.Color := DefaultColor;
  if UseGridOddColor and not ASelected and Odd(ANode.AbsoluteIndex) then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.DoFind(const AFName, AStr: string; ALocateType: TLocateType; AFwd: Boolean = True);
  var
    FNode: TdxTreeListNode;
    s: string;
    FName: string;
    FFromDate, FToDate: TDateTime;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.DoFind') else _udebug := nil;{$ENDIF}

  inherited;

  if FindStr <> AStr then begin
    cdsFind.Close;
    FName := 'pd.' + AFName;
    s := 'select pd.operid, pd.ondate, pd.checked from paydoc pd where pd.operid is not null' + ' and upper(' + FName + ')';
    case ALocateType of
     ltBegin:  s := s + ' like ''' + AnsiUpperCaseEx(AStr) + '%''';
     ltFull:   s := s + '=''' + AnsiUpperCaseEx(AStr) + '''';
     ltSubstr: s := s + ' like ''%' + AnsiUpperCaseEx(AStr) + '%''';
    end;
    cdsFind.Macros.ParamByName('sql').AsString := s;
    cdsFind.Open;
  end;

  FindStr := AStr;
  if AStr = '' then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  if not cdsFind.Eof then begin
    if not cdsView.Locate('operid', cdsFind.FieldByName('operid').AsInteger, []) then
    try
      CanRefresh := False;
      FFromDate := prdMain.FromDate;

      if FFromDate > cdsFind.FieldByName('ondate').AsDateTime
        then begin
          prdMain.PeriodType := ptCustom;
          prdMain.FromDate := cdsFind.FieldByName('ondate').AsDateTime;
        end;

      if prdMain.ToDate = 0
        then FToDate := MaxDateTime
        else FToDate := prdMain.ToDate;

      if FToDate < cdsFind.FieldByName('ondate').AsDateTime
        then begin
          prdMain.PeriodType := ptCustom;
          prdMain.ToDate := cdsFind.FieldByName('ondate').AsDateTime;
        end;

      DSRefresh(cdsView, 'operid', cdsFind.fieldbyname('operid').AsInteger);

    finally
      CanRefresh := True;
    end;

    grdMain.ClearSelection;

    if grdMain.FocusedNode <> nil
      then grdMain.FocusedNode.Selected := True;
  end
  else ssMessageDlg(rs('Common', 'FindError') + ', ' + rs('Common', 'DSEnd'), ssmtInformation, [ssmbOk]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.DoExcel(Grid: TdxDBGrid);
  var
    FShowExcel: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.DoExcel') else _udebug := nil;{$ENDIF}

  inherited;

  with TfrmExport.Create(nil) do
    try
      if cdsFunc.Locate('classname', Self.ClassName, [])
        then FunID := cdsFunc.fieldbyname('funid').AsInteger
        else FunID := 0;

      grdExp := grdMain;
      lName.Caption := Self.Caption;
      FList := ExportList;

      if ShowModal <> mrOk
        then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end
        else FShowExcel := chbShowExcel.Checked;

    finally
      Free;
    end;

  ExportToExcel(grdMain, ExportList, FShowExcel);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.cdsViewBeforeOpen(DataSet: TDataSet);
  var
    m: string;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.cdsViewBeforeOpen') else _udebug := nil;{$ENDIF}

  if not panFilter.Visible
    then cdsView.Params.ParamByName('fromdate').AsDateTime := MinDateTime
    else cdsView.Params.ParamByName('fromdate').AsDateTime := prdMain.FromDate;

  if not panFilter.Visible
    then cdsView.Params.ParamByName('todate').AsDateTime := MaxDateTime
    else cdsView.Params.ParamByName('todate').AsDateTime := LastSecondInDay(prdMain.ToDate);

  m := '';
  if panFilter.Visible then begin
    if cbOperType.ItemIndex > 0
      then m := m + ' and pdd.doctype=' + IntToStr(cbOperType.ItemIndex + 2);
  end;

  cdsView.Macros.ParamByName('m').AsString := m;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.colTotalGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.colTotalGetText') else _udebug := nil;{$ENDIF}

  if (ANode.Values[colDocType.Index] = 6) and (ANode.Values[colTotal.Index] > 0)
    then AText := ''
    else
      try
        AText := FormatFloat(MoneyDisplayFormat, Abs(ANode.Values[colTotal.Index]) +
        VarToInt(ANode.Values[colCharge.Index])) + ' ' + ANode.Values[colShortName.Index];
      except
         AText := '';
      end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.colTotalDefGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.colTotalDefGetText') else _udebug := nil;{$ENDIF}

  AText := FormatFloat(MoneyDisplayFormat, ANode.Values[colTotal.Index]*ANode.Values[colRate.Index]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmMoneyMove.DoShow;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.DoShow') else _udebug := nil;{$ENDIF}

  inherited;
  FrameResize(Self);
  RealignFilter;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.lcbKAgentPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.lcbKAgentPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if CanRefresh then DoRefresh(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.edFromDateExit(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.edFromDateExit') else _udebug := nil;{$ENDIF}

  if not CheckDate(TcxDateEdit(Sender).Text) then begin
     MessageDlg('Invalid Date', mtError, [mbOk], 0);
     TcxDateEdit(Sender).SetFocus;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
function TfmMoneyMove.CheckDate(const AValue: string): boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.CheckDate') else _udebug := nil;{$ENDIF}

  Result := True;
  try
    StrToDate(AValue);
  except
    Result := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.edFromDateKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.edFromDateKeyPress') else _udebug := nil;{$ENDIF}

  if (Key = #13) and (TcxDateEdit(Sender).Text <> '') then begin
    TcxDateEdit(Sender).Date := StrToDate(TcxDateEdit(Sender).Text);
    TcxDateEdit(Sender).EditValue := TcxDateEdit(Sender).Date;
    lcbKAgentPropertiesEditValueChanged(Sender);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.edFromDatePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.edFromDatePropertiesChange') else _udebug := nil;{$ENDIF}

  if not edFromDatePropertiesChangeIsActive then begin
    edFromDatePropertiesChangeIsActive := True;
    if (TcxDateEdit(Sender).Text = '') then begin
      TcxDateEdit(Sender).EditValue := 0;
      TcxDateEdit(Sender).EditText := '';
    end;
    edFromDatePropertiesChangeIsActive := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.cdsViewAfterOpen(DataSet: TDataSet);
  {var
    i: integer;
    c: extended;
   }
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.cdsViewAfterOpen') else _udebug := nil;{$ENDIF}

  {c := 0;
  for i := 0 to grdMain.Count-1 do begin
    c := c+RoundToA(grdMain.Items[i].Values[colTotal.Index]*grdMain.Items[i].Values[colRate.Index], -2)
  end;

  stCount.Caption := IntToStr(cdsView.RecordCount);
  stTotal.Caption := FormatFloat(MoneyDisplayFormat, c)+' '+BaseCurrName;
  }

  FrameResize(Self);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.FrameResize(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.FrameResize') else _udebug := nil;{$ENDIF}

  inherited;
  if colOperType.Visible
    then AdjustGrid(grdMain, colOperType)
    else AdjustGrid(grdMain, colNum);
  AdjustGrid(grdDocRel, colDRTypeName);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.aPrintExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.aPrintExecute') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmMoneyMove.DoPrint(AParam: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.DoPrint') else _udebug := nil;{$ENDIF}

  case AParam of
    0: begin
         aPrintInOrder.Execute;
       end;
    1: begin
         aPrintPayOrder.Execute;
       end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.frDocGetValue(const ParName: String; var ParValue: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.frDocGetValue') else _udebug := nil;{$ENDIF}

  case frDoc.Tag of
   0: begin
       if 0 = AnsiCompareText(ParName, 'entname') then ParValue := EntName;
       if 0 = AnsiCompareText(ParName, 'total') then ParValue := FormatFloat(MoneyDisplayFormat, RoundToA(cdsView.fieldbyname('total').AsCurrency*cdsView.fieldbyname('onvalue').AsCurrency, -2));
       if 0 = AnsiCompareText(ParName, 'docnum') then ParValue := cdsView.fieldbyname('docnum').AsString;
       if 0 = AnsiCompareText(ParName, 'docdate') then ParValue := cdsView.fieldbyname('ondate').AsString;
       if 0 = AnsiCompareText(ParName, 'kagent') then ParValue := cdsView.fieldbyname('name').AsString;
       if 0 = AnsiCompareText(ParName, 'totalstr') then ParValue := MoneyToStr(RoundToA(cdsView.fieldbyname('total').AsCurrency*cdsView.fieldbyname('onvalue').AsCurrency, -2));
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.srcViewDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.srcViewDataChange') else _udebug := nil;{$ENDIF}

  UpdateActionList;

  if not cdsView.IsEmpty then
    if cdsView.FieldByName('checked').AsInteger=0
      then aCheck.Caption := rs('Common', 'Check')
      else aCheck.Caption := rs('Common', 'UnCheck');

  if not cdsView.IsEmpty then begin
    memNotes.Text := cdsView.FieldByName('notes').AsString;

    irNum.Text := amountPrefix + cdsView.FieldByName('docnum').AsString
                  + RS('fmWaybill', 'From',3)
                  + ssDateToStr(cdsView.FieldByName('ondate').AsDateTime) + ' '
                  + TimeToStr(cdsView.FieldByName('ondate').AsDateTime);

    case Integer(Abs(cdsView.FieldByName('doctype').AsInteger)) of
      3: irType.Text := rs('fmPayDoc', 'OperMove');
      4: irType.Text := rs('fmPayDoc', 'OperConvert');
      5: irType.Text := rs('fmMoneyMove', 'CashWithCharge');
      6: if (cdsView.FieldByName('total').AsCurrency > 0)
           then irType.Text := rs('fmMoneyMove', 'OperAdjustIn')
           else irType.Text := rs('fmMoneyMove', 'OperAdjustOut');
    end;

    if Integer(Abs(cdsView.FieldByName('doctype').AsInteger)) = 5 then begin
      irCharge.Visible := True;
      irCharge.Node.MoveTo(irFrom.Node, inaAddChild);

      irCharge.Text := FormatFloat(MoneyDisplayFormat, cdsView.FieldByName('totalcharge').AsCurrency) +
        ' ' + cdsView.FieldByName('shortname').AsString + ' (' +
        FloatToStr(RoundToA(cdsView.FieldByName('totalcharge').AsCurrency /
        (cdsView.FieldByName('totalcharge').AsCurrency + cdsView.FieldByName('total').AsCurrency) * 100, -3)) + '%) ' +
        AnsiLowerCase(rs('fmMoneyMove', 'Charge')) + ': ' +
        cdsView.FieldByName('chargename').AsString;

    end
    else irCharge.Visible := False;

    if (cdsView.FieldByName('doctype').AsInteger = 6) and (cdsView.FieldByName('total').AsCurrency > 0)
    then irFrom.Text := ''
    else if cdsView.FieldByName('accnumsrc').AsString <> ''
         then irFrom.Text := rs('fmMoneyMove', 'FromAcc') + ':  ' +
            cdsView.FieldByName('accnumsrc').AsString + ' ' + rs('fmPayDoc', 'In') + ' ' + cdsView.FieldByName('banksrc').AsString
         else irFrom.Text := rs('fmMoneyMove', 'FromCash') + ':  ' + cdsView.FieldByName('cashnamesrc').AsString;

    if (cdsView.FieldByName('doctype').AsInteger = 6) and (cdsView.FieldByName('total').AsCurrency < 0)
    then irTo.Text := ''
    else if cdsView.FieldByName('accnumdest').AsString <> ''
         then irTo.Text := rs('fmMoneyMove', 'ToAcc') + ':  ' +
            cdsView.FieldByName('accnumdest').AsString + ' ' + rs('fmPayDoc', 'In') + ' ' + cdsView.FieldByName('bankdest').AsString
         else irTo.Text := rs('fmMoneyMove', 'ToCash') + ':  ' + cdsView.FieldByName('cashnamedest').AsString;

    irReason.Text := cdsView.FieldByName('reason').AsString;

    if cdsView.FieldByName('checked').AsInteger = 1
      then irStatus.Text := rs('fmWaybill', 'DocChecked')
      else irStatus.Text := rs('fmWaybill', 'DocUnChecked');

    if (cdsView.FieldByName('doctype').AsInteger = 6) and (cdsView.FieldByName('total').AsCurrency > 0)
      then irFromSumm.Text := ''
      else irFromSumm.Text := FormatFloat(MoneyDisplayFormat,
        Abs(cdsView.FieldByName('total').AsCurrency) + cdsView.FieldByName('totalcharge').AsCurrency) + ' ' +
        cdsView.FieldByName('shortname').AsString;

    if (cdsView.FieldByName('doctype').AsInteger = 6) and (cdsView.FieldByName('total').AsCurrency < 0)
      then irToSumm.Text := ''
      else irToSumm.Text := FormatFloat(MoneyDisplayFormat,
        cdsView.FieldByName('totaldest').AsCurrency) + ' ' +
        cdsView.FieldByName('shortnamedest').AsString;
  end
  else begin
    memNotes.Text := '';
    irNum.Text := '';
    irType.Text := '';
    irReason.Text := '';
    irStatus.Text := '';
    irToSumm.Text := '';
    irFromSumm.Text := '';
    irTo.Text := '';
    irFrom.Text := '';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.DoCheck(EditRequest: Boolean);
  var
    i: Integer;
    IsCheck: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.DoCheck') else _udebug := nil;{$ENDIF}

  inherited;
  IsCheck := (cdsView.FieldByName('checked').AsInteger = 0);

  if IsCheck then begin
    if not (((grdMain.SelectedCount = 1) and (ssMessageDlg(rs('Common', 'CheckConfirm'), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes))
     or
      ((grdMain.SelectedCount > 1)
      and
      (ssMessageDlg(Format(rs('Common', 'CheckConfirmEx'), [grdMain.SelectedCount]), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes)))
   then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  end
  else begin
    if not (((grdMain.SelectedCount = 1) and (mrYes = ssMessageDlg(rs('Common', ifThen(EditRequest, 'PostedEditConfirm', 'UncheckConfirm')), ssmtWarning, [ssmbYes, ssmbNo])))
     or
      ((grdMain.SelectedCount > 1)
      and
      (mrYes = ssMessageDlg(Format(rs('Common', 'UncheckConfirmEx'), [grdMain.SelectedCount]), ssmtWarning, [ssmbYes, ssmbNo]))))
    then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;
  end;

  Application.ProcessMessages;

  if not (grdMain.SelectedCount = 1) then fProgress.Show;

  with newDataSet do
   try
    ProviderName := 'pMoneyMove_SetChecked';
    FetchParams;
    Params.ParamByName('checked').AsInteger := Integer(IsCheck);
    fProgress.Caption := rs('Common', 'Processing') + '...';
    fProgress.UpDate;
    fProgress.pbMain.Max := grdMain.SelectedCount;

    for i := 0 to grdMain.SelectedCount - 1 do begin
      if ((grdMain.SelectedNodes[i].Values[colChecked.Index] = 1) and IsCheck)
         or ((grdMain.SelectedNodes[i].Values[colChecked.Index] = 0) and not IsCheck)
      then Continue;

      Params.ParamByName('operid').AsInteger := grdMain.SelectedNodes[i].Values[colID.Index];

      try
        Execute;

      except
        on E:Exception do begin
           if (grdMain.SelectedCount = 1)
             then begin
               ssMessageDlg(e.Message, ssmtError, [ssmbOk]);
               {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
               Exit;
             end
             else if ssMessageDlg(e.Message, ssmtError, [ssmbYes, ssmbNo]) <> mrYes
                  then Break;
        end;
      end;

      fProgress.pbMain.StepIt;
      Application.ProcessMessages;
    end;

   finally
     Free;
     fProgress.Hide;
   end;

   Application.ProcessMessages;
   DoRefresh(0);
   RefreshFun('TfmKAgent', 0);
   frmMainForm.ExecRefresh('TfmFinance', 0);

   //if RefreshAllClients then begin
   //  dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_PAYDOCIN);
   //  dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_KAGENTS);
   //end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.colPayOrderCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.colPayOrderCustomDrawCell') else _udebug := nil;{$ENDIF}

  if (AText = '1') and ASelected then AText := '-1';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.DoShowFilter;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.DoShowFilter') else _udebug := nil;{$ENDIF}

  inherited;

  panFilter.Visible := aShowFilter.Checked;
  Application.ProcessMessages;
  DoRefresh(0);
  FrameResize(Self);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.aPropertiesExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.aPropertiesExecute') else _udebug := nil;{$ENDIF}

  grdMainDblClick(grdMain);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.tsNotesShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.tsNotesShow') else _udebug := nil;{$ENDIF}

  tsNotes.Color := clWindow;
  memNotes.Width := tsNotes.Width - 20;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.inspMainDrawCaption(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.inspMainDrawCaption') else _udebug := nil;{$ENDIF}

  if UseGridOddColor and Odd(Sender.Node.AbsoluteIndex)
    then AColor := GridOddLinesColor
    else AColor := clWindow;
  AFont.Color := clWindowText;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.inspMainDrawValue(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.inspMainDrawValue') else _udebug := nil;{$ENDIF}

  if UseGridOddColor and Odd(Sender.Node.AbsoluteIndex)
    then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.colOnDateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.colOnDateGetText') else _udebug := nil;{$ENDIF}

  AText := DateToStr(ANode.Values[colOnDate.Index]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.grdMainSelectedCountChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.grdMainSelectedCountChange') else _udebug := nil;{$ENDIF}

  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.aSelectAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.aSelectAllExecute') else _udebug := nil;{$ENDIF}

  grdMain.SelectAll;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.RealignFilter;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.RealignFilter') else _udebug := nil;{$ENDIF}

  bvlRight.Left := panFilter.width - 1;
  bvlRight.Anchors := [akRight, akTop];
  cbOperType.Left := panFilter.Width-cbOperType.Width-5;
  cbOperType.Anchors := [akRight, akTop];
  lOperType.Left := cbOperType.Left-lOperType.Width-5;
  lOperType.Anchors := [akRight, akTop];
  btnChargeType.Left := lOperType.Left-btnChargeType.Width-4;
  lcbChargeType.Width := btnChargeType.Left - lcbChargeType.Left - 2;
  lcbChargeType.Anchors := [akRight, akTop, akLeft];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.btnChargeTypeClick(Sender: TObject);
  var
    aid: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.btnChargeTypeClick') else _udebug := nil;{$ENDIF}

  try aid := lcbChargeType.KeyValue; except aid := 0; end;
  ShowModalRef(Self, rtChargeType, vtChargeType, 'TfmChargeType', Self.OnDate, aid);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.colNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.colNumGetText') else _udebug := nil;{$ENDIF}

  AText := ANode.Values[colNumEx.Index];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmMoneyMove.cdsViewCalcFields(DataSet: TDataSet);
  (*var
    FNum: string;
    FP, FS: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
    *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.cdsViewCalcFields') else _udebug := nil;{$ENDIF}

  case Tag of
   gPayDocIn:
     begin
       FS := PDInSuffix;
       FP := PDInPrefix;
     end;
   gPayDocOut:
     begin
       FS := PDOutSuffix;
       FP := PDOutPrefix;
     end;
   gPayDocOutEx:
     begin
       FS := PDChargeSuffix;
       FP := PDChargePrefix;
     end;
  end;
  try
    FNum := DataSet.FieldByName('docnum').AsString;
    if Pos(FP, FNum) = 1
      then DataSet.FieldByName('numex').AsInteger :=
        StrToInt(Trim(Copy(FNum, Length(FP) + 1, Length(FNum) -
        Length(FP) - Length(FS))))
      else DataSet.FieldByName('numex').AsInteger := StrToInt(FNum);
  except
    DataSet.FieldByName('numex').AsInteger := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmMoneyMove.DoHelp;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.DoHelp') else _udebug := nil;{$ENDIF}

  ShowHelpTopic('fmMoneyMove');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.lcbChargeTypePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.lcbChargeTypePropertiesChange') else _udebug := nil;{$ENDIF}

  if lcbChargeType.Text='' then lcbChargeType.ItemIndex := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.DoLocate(const AID: Integer; ASubID: Integer = 0);
  var
    FFrom, FTo, FDocDate: TDateTime;
    FType: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.DoLocate') else _udebug := nil;{$ENDIF}

  if JumpFromBuffer then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  grdMain.ClearSelection;
  if cdsView.Locate(_ID_, AID, []) then begin
    if grdMain.FocusedNode <> nil
      then grdMain.FocusedNode.Selected := True;
  end
  else with newDataSet do
    try
      ProviderName := 'pPayDoc_GetEx';
      FetchParams;
      Params.ParamByName('paydocid').AsInteger := AID;
      Open;
      if IsEmpty
        then ssMessageDlg(rs(Self.Name, 'PDNotFound'), ssmtError, [ssmbOK])
        else begin
          CanRefresh := False;

          if prdMain.FromDate <= 0
            then FFrom := MinDateTime
            else FFrom := prdMain.FromDate;

          if prdMain.ToDate = 0
            then FTo := MaxDateTime
            else FTo := LastSecondInDay(prdMain.ToDate);

          FDocDate := FieldByName('ondate').AsDateTime;

          if (FDocDate < FFrom) or (FDocDate > FTo) then begin
            prdMain.PeriodType := ptCustom;
            prdMain.FromDate := Int(FDocDate);
            prdMain.ToDate := Int(FDocDate);
          end;

          if (cbOperType.ItemIndex > 0) and
             (Integer(cbOperType.Properties.Items.Objects[cbOperType.ItemIndex]) <> Trunc(Abs(FieldByName('doctype').AsInteger)))
            then cbOperType.ItemIndex := 0;

          CanRefresh := True;
          DoRefresh(FieldByName('operid').AsInteger);
        end;
      Close;
    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.colDRTypeNameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.colDRTypeNameGetText') else _udebug := nil;{$ENDIF}

  case ANode.Values[colDRType.Index] of
     1: AText := rs('fmWaybill', 'DocWBIn');
    -1: AText := rs('fmWaybill', 'DocWBOut');
     2: AText := rs('fmWaybill', 'DocAccOut');
    -6: AText := rs('fmWaybill', 'DocWBRetOut');
     6: AText := rs('fmWaybill', 'DocWBRetIn');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.colDROnDateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.colDROnDateGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatDateTime(ReplaceStr('dd.mm.yyyy', '.', DateSeparator),
      ANode.Values[colDROnDate.Index]);
  except
    AText := '';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.cdsRelAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.cdsRelAfterOpen') else _udebug := nil;{$ENDIF}

  AdjustGrid(grdDocRel, colDRTypeName);
  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.cdsRelBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.cdsRelBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsRel.Params.ParamByName(_ID_).AsInteger := cdsView.FieldByName(_ID_).AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.aGotoDocExecute(Sender: TObject);
 var
   FID: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.aGotoDocExecute') else _udebug := nil;{$ENDIF}

  FID := cdsRel.FieldByName('wbillid').AsInteger;
  case cdsRel.FieldByName('wtype').AsInteger of
     1: frmMainForm.ExecLocate(vtDocs, 'TfmWaybill', FID);
     2: frmMainForm.ExecLocate(vtDocs, 'TfmAccOut', FID);
    -1: frmMainForm.ExecLocate(vtDocs, 'TfmWaybillOut', FID);
    -6: frmMainForm.ExecLocate(vtDocs, 'TfmWBReturnOut', FID);
     6: frmMainForm.ExecLocate(vtDocs, 'TfmWBReturnIn', FID);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.grdDocRelDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.grdDocRelDblClick') else _udebug := nil;{$ENDIF}

  aGotoDoc.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.aDRPrintExecute(Sender: TObject);
  var
    FID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.aDRPrintExecute') else _udebug := nil;{$ENDIF}

  FID := cdsRel.FieldByName('wbillid').AsInteger;
  case cdsRel.FieldByName('wtype').AsInteger of
     1: xRep.ShowRep(rtWBIn, FID);
    -1: xRep.ShowRep(rtWBOut, FID);
     2: xRep.ShowRep(rtAccOut, FID);
    -6: xRep.ShowRep(rtReturnOut, FID);
     6: xRep.ShowRep(rtReturnIn, FID);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.grdMainGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := rs('fmMoneyMove', 'Title');
  AIndex := II_PDIN;
  ImgList := dmData.Images;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.grdMainNeedAdjust(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.grdMainNeedAdjust') else _udebug := nil;{$ENDIF}

  AdjustGrid(grdMain, colName);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmMoneyMove.aColParamsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.aColParamsExecute') else _udebug := nil;{$ENDIF}

  grdMain.ShowColOptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.colAccGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.colAccGetText') else _udebug := nil;{$ENDIF}

  if AText <> ''
    then AText := AText + ' ' + rs('fmPayDoc', 'In') + ' ' +
      ANode.Values[colBankName.Index];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmMoneyMove.colOperTypeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.colOperTypeGetText') else _udebug := nil;{$ENDIF}

  case Integer(Abs(StrToInt(AText))) of
    3: AText := rs('fmPayDoc', 'OperMove');
    4: AText := rs('fmPayDoc', 'OperConvert');
    5: AText := rs('fmMoneyMove', 'CashWithCharge');
    6: begin
         if VarToFloat(ANode.Values[colTotal.Index]) < 0
           then AText := rs('fmMoneyMove', 'OperAdjustOut')
           else AText := rs('fmMoneyMove', 'OperAdjustIn');
       end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.colFromGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.colFromGetText') else _udebug := nil;{$ENDIF}

  if (ANode.Values[colDocType.Index] = 6) and (ANode.Values[colTotal.Index] > 0)
    then AText := ''
    else if VarToStr(ANode.Values[colAcc.Index]) <> ''
      then AText := VarToStr(ANode.Values[colAcc.Index]) + rs('fmPayDoc', 'In',3) + VarToStr(ANode.Values[colBankSrc.Index])
      else AText := ANode.Values[colCashName.Index];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.colToGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.colToGetText') else _udebug := nil;{$ENDIF}

  if (ANode.Values[colDocType.Index] = 6) and (ANode.Values[colTotalDest.Index] < 0)
    then AText := ''
    else if VarToStr(ANode.Values[colAccDest.Index]) <> ''
      then AText := VarToStr(ANode.Values[colAccDest.Index]) + rs('fmPayDoc', 'In',3) + VarToStr(ANode.Values[colBankDest.Index])
      else AText := ANode.Values[colCashNameDest.Index];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.colTotalDestGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.colTotalDestGetText') else _udebug := nil;{$ENDIF}

  if (ANode.Values[colDocType.Index] = 6) and (ANode.Values[colTotalDest.Index] < 0)
    then AText := ''
    else AText := FormatFloat(MoneyDisplayFormat, ANode.Values[colTotalDest.Index]) + ' ' + ANode.Values[colShortNameDest.Index];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.cbOperTypePropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.cbOperTypePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if CanRefresh then DoRefresh(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.NotifyChanged;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.NotifyChanged') else _udebug := nil;{$ENDIF}

  if not JumpFromBuffer
    then frmMainForm.AddToBuffer(vtFinances, FunID, Self.Caption, ClassName, Tag, FCurrentID, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.colCheckedGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.colCheckedGetText') else _udebug := nil;{$ENDIF}
                                                                                      
  if AText = '0' then AText := '-1';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.colDocTypeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.colDocTypeGetText') else _udebug := nil;{$ENDIF}

  if (VarToInt(ANode.Values[colDocType.Index]) = 6) and (VarToFloat(ANode.Values[colTotal.Index]) < 0)
    then AText := '-6';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmMoneyMove.SetOnDate(const Value: TDateTime);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmMoneyMove.SetOnDate') else _udebug := nil;{$ENDIF}

  inherited;

  prdMain.BaseDate := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fMoneyMove', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
