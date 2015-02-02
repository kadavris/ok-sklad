{$I ok_sklad.inc}
unit fPayDoc;

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
  prTypes, okPeriod, ssDataSource, okMoneyFun, dxExEdtr, dxCntner;

type
  TfmPayDoc = class(TssBaseFrame)
    aDRPrint: TAction;
    aGotoDoc: TAction;
    aPrintInOrder: TAction;
    aPrintPayOrder: TAction;
    btnChargeType: TssSpeedButton;
    btnKagent: TssSpeedButton;
    bvlRight: TssBevel;
    bvlTop: TssBevel;
    cdsChargeType: TssClientDataSet;
    cdsFind: TssClientDataSet;
    cdsKAgent: TssClientDataSet;
    cdsPayOrder: TssClientDataSet;
    cdsPayType: TssClientDataSet;
    cdsRel: TssClientDataSet;
    cdsView: TssClientDataSet;
    cdsViewACCID: TIntegerField;
    cdsViewACCNUM: TStringField;
    cdsViewADDRESS: TStringField;
    cdsViewBANKNAME: TStringField;
    cdsViewCASHID: TIntegerField;
    cdsViewCASHNAME: TStringField;
    cdsViewCHARGENAME: TStringField;
    cdsViewCHECKED: TIntegerField;
    cdsViewCITY: TStringField;
    cdsViewCOUNTRY: TStringField;
    cdsViewCTYPEID: TIntegerField;
    cdsViewCURRID: TIntegerField;
    cdsViewDELETED: TIntegerField;
    cdsViewDISTRICT: TStringField;
    cdsViewDOCID: TIntegerField;
    cdsViewDOCNUM: TStringField;
    cdsViewDOCTYPE: TIntegerField;
    cdsViewEMAIL: TStringField;
    cdsViewFAX: TStringField;
    cdsViewFULLNAME: TStringField;
    cdsViewKAID: TIntegerField;
    cdsViewMPERSONID: TIntegerField;
    cdsViewNAME: TStringField;
    cdsViewNOTES: TStringField;
    cdsViewnumex: TIntegerField;
    cdsViewONDATE: TDateTimeField;
    cdsViewONVALUE: TFloatField;
    cdsViewOPERID: TIntegerField;
    cdsViewPAYDOCID: TIntegerField;
    cdsViewPHONE: TStringField;
    cdsViewPOSTINDEX: TStringField;
    cdsViewPTYPEID: TIntegerField;
    cdsViewPTYPENAME: TStringField;
    cdsViewREASON: TStringField;
    cdsViewSHORTNAME: TStringField;
    cdsViewTOTAL: TFloatField;
    cdsViewWITHNDS: TIntegerField;
    cdsViewWWW: TStringField;
    colAcc: TdxDBGridColumn;
    colBankName: TdxDBGridColumn;
    colCashName: TdxDBGridColumn;
    colChargeType: TdxDBGridColumn;
    colChecked: TdxDBGridImageColumn;
    colDocType: TdxDBGridImageColumn;
    colDRID: TdxDBGridColumn;
    colDRNum: TdxDBGridColumn;
    colDROnDate: TdxDBGridColumn;
    colDRSummAll: TdxDBGridCurrencyColumn;
    colDRType: TdxDBGridImageColumn;
    colDRTypeName: TdxDBGridColumn;
    colID: TdxDBGridColumn;
    colKAID: TdxDBGridColumn;
    colName: TdxDBGridColumn;
    colNum: TdxDBGridColumn;
    colNumEx: TdxDBGridColumn;
    colOnDate: TdxDBGridColumn;
    colOperID: TdxDBGridColumn;
    colPayOrder: TdxDBGridImageColumn;
    colPayType: TdxDBGridColumn;
    colRate: TdxDBGridColumn;
    colShortName: TdxDBGridColumn;
    colTotal: TdxDBGridColumn;
    colTotalDef: TdxDBGridColumn;
    frDoc: TfrReport;
    grdDocRel: TssDBGrid;
    grdMain: TssDBGrid;
    inspMain: TdxInspector;
    irChargeType: TdxInspectorTextRow;
    irCurr: TdxInspectorTextRow;
    irEmail: TdxInspectorTextHyperLinkRow;
    irFax: TdxInspectorTextRow;
    irKAAdress: TdxInspectorTextMemoRow;
    irKAFullName: TdxInspectorTextMemoRow;
    irKAgent: TdxInspectorTextButtonRow;
    irKAPhone: TdxInspectorTextRow;
    irNum: TdxInspectorTextRow;
    irPayMPerson: TdxInspectorTextRow;
    irPayType: TdxInspectorTextRow;
    irReason: TdxInspectorTextRow;
    irStatus: TdxInspectorTextRow;
    irWWW: TdxInspectorTextHyperLinkRow;
    lcbChargeType: TssDBLookupCombo;
    lcbKAgent: TssDBLookupCombo;
    lcbPayType: TssDBLookupCombo;
    lChargeType: TLabel;
    lCount: TLabel;
    lKAgent: TLabel;
    lPayType: TLabel;
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
    splMain: TSplitter;
    srcChargeType: TDataSource;
    srcKAgent: TDataSource;
    srcPayType: TDataSource;
    srcRel: TDataSource;
    srcView: TssDataSource;
    ssBevel10: TssBevel;
    ssBevel12: TssBevel;
    ssBevel19: TssBevel;
    bvlTotals: TssBevel;
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

    procedure FrameResize(Sender: TObject);
    procedure aColParamsExecute(Sender: TObject);
    procedure aDRPrintExecute(Sender: TObject);
    procedure aGotoDocExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aPrintInOrderExecute(Sender: TObject);
    procedure aPrintPayOrderExecute(Sender: TObject);
    procedure aPropertiesExecute(Sender: TObject);
    procedure aSelectAllExecute(Sender: TObject);
    procedure btnChargeTypeClick(Sender: TObject);
    procedure btnKagentClick(Sender: TObject);
    procedure cdsRelAfterOpen(DataSet: TDataSet);
    procedure cdsRelBeforeOpen(DataSet: TDataSet);
    procedure cdsViewAfterOpen(DataSet: TDataSet);
    procedure cdsViewBeforeOpen(DataSet: TDataSet);
    procedure cdsViewCalcFields(DataSet: TDataSet);
    procedure colAccGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colCheckedGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colDROnDateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colDRTypeNameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colOnDateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPayOrderCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure colPayOrderGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colTotalDefGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colTotalGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure edFromDatePropertiesChange(Sender: TObject);
    procedure frDocGetValue(const ParName: String; var ParValue: Variant);
    procedure grdDocRelDblClick(Sender: TObject);
    procedure grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure grdMainDblClick(Sender: TObject);
    procedure grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure grdMainKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grdMainNeedAdjust(Sender: TObject);
    procedure grdMainSelectedCountChange(Sender: TObject);
    procedure inspMainDrawCaption(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
    procedure inspMainDrawValue(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
    procedure irKAgentEditButtonClick(Sender: TObject);
    procedure lcbChargeTypePropertiesChange(Sender: TObject);
    procedure lcbKAgentPropertiesChange(Sender: TObject);
    procedure lcbKAgentPropertiesEditValueChanged(Sender: TObject);
    procedure lcbKAgentPropertiesInitPopup(Sender: TObject);
    procedure lcbPayTypePropertiesChange(Sender: TObject);
    procedure prdMainChange(Sender: TObject);
    procedure srcViewDelayedDataChange(Sender: TObject; Field: TField);
    procedure tsNotesShow(Sender: TObject);

  private
    CanRefresh: boolean;
    disableDateEvent: boolean;

    function CheckDate(const AValue: string): boolean;
    procedure RealignFilter;

  protected
    function  GetIDForUpdate: integer; override;
    function  GetByDocID(ADocID: Integer): Integer;
    procedure SetParam(const Value: Integer); override;
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
    procedure DoSetFocus; override;
    procedure NotifyChanged; override;
  end;

var
  fmPayDoc: TfmPayDoc;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  ClientData, prFun, prConst, ssFun, DateUtils, Export,
  EditPayDoc, EditPayOrder_UKR, EditPayOrder_RUS, EditCashOrder_RUS,
  EditCashOrder_UKR, ssCallbackConst, ssRegUtils, fMessageDlg,
  ssDateUtils, ssStrUtil, strUtils, prRep, KATurnover, udebug, xLngDefs;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

const
     _ID_ = 'PayDocID';

//==============================================================================================
procedure TfmPayDoc.DoClose;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.DoClose') else _udebug := nil;{$ENDIF}

  cdsView.Close;
  prdMain.SaveToRegistry;

  //WriteToRegDate(MainRegKey + '\' + Self.ClassName, 'FromDate', edFromDate.Date);

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.DoDelete;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}

  function GetCurrPayStr(AIndex: Integer): string;
  begin
    case GrpID of
       1: Result := rs('fmWaybill', 'PDIn');
      -1: Result := rs('fmWaybill', 'PDOut');
      -2: Result := rs('fmWaybill', 'PDCharge');
    end;

    Result := Result + amountPrefix + VarToStr(grdMain.SelectedNodes[AIndex].Values[colNum.Index])
      + rs('fmWaybill', 'From' , 3) + DateToStr(grdMain.SelectedNodes[AIndex].Values[colOnDate.Index])
      + AnsiLowerCase(rs('fmWaybill', 'DocsSumm', 3))
      + FormatFloat(MoneyDisplayFormat, ssStrToFloat(grdMain.SelectedNodes[AIndex].Values[colTotal.Index]))
      + grdMain.SelectedNodes[AIndex].Values[colShortName.Index] + ' (' + grdMain.SelectedNodes[AIndex].Values[colName.Index] + ')';
  end;

  //----------------------------------------------------------------------
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.DoDelete') else _udebug := nil;{$ENDIF}

  try //finally
    if not GetUserAccessByClass(Self.ClassName, uaDelete) then begin
      ssMessageDlg(rs('Common', 'CantDelete'), ssmtError, [ssmbOK]);
      Exit;
    end;

    if ((grdMain.SelectedCount = 1) and (mrYes = ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo])))
       or
       ((grdMain.SelectedCount > 1) and ( mrYes = ssMessageDlg(Format(rs('Common', 'DelConfirmEx'), [grdMain.SelectedCount]), ssmtWarning, [ssmbYes, ssmbNo])))
    then begin
      fProgress.Show;

      with newDataSet do
      try
        Application.ProcessMessages;
        fProgress.Caption := rs('Common', 'Deleting');
        fProgress.UpDate;
        fProgress.pbMain.Max := grdMain.SelectedCount;

        for i := 0 to grdMain.SelectedCount - 1 do begin

          if (grdMain.SelectedNodes[i].Values[colChecked.Index] = 1)
             or (not VarIsNull(grdMain.SelectedNodes[i].Values[colOperID.Index]))
          then Continue;

          try
            if DelToRecycleBin then begin
              if not AddToRecycleBin(dmData.SConnection, Self.ClassName, grdMain.SelectedNodes[i].Values[colID.Index],
                                     GetCurrPayStr(i), False, Self.FunID)
              then begin
                ssMessageDlg(rs('Common', 'ErrorInsToRecycleBin'), ssmtError, [ssmbOk]);
                Exit;
              end;
            end
            else begin
              TrStart;
              if not DeleteData(dmData.SConnection, 'paydoc', grdMain.SelectedNodes[i].Values[colID.Index])
                 or not TrCommit
              then raise Exception.Create(lastServerError);
            end;

          except
            on E: Exception do begin
              TrRollback;

              if grdMain.SelectedCount = 1 then begin
                ssMessageDlg(rs('Common', 'NoDelete') + #10#13 + e.Message, ssmtError, [ssmbOk]);
                Exit;
              end
              else if mrYes <> ssMessageDlg(Format(rs('Common', 'NoDeleteEx'), [grdMain.SelectedNodes[i].Values[colNum.Index]]), ssmtError, [ssmbYes, ssmbNo])
                   then Break;
            end;
          end;

          fProgress.lText.Caption := '[' + VarToStr(grdMain.SelectedNodes[i].Values[colNum.Index]) + '] ' +
               grdMain.SelectedNodes[i].Values[colName.Index];

          fProgress.pbMain.StepIt;
          Application.ProcessMessages;
        end;

        with grdMain do
          if SelectedCount > 1 then cdsView.First
          else if (FocusedNode.Index = grdMain.Count - 1) and (FocusedNode.Index > 0)
               then cdsView.Locate(_ID_, FocusedNode.GetPrev.Values[colID.Index], [])
               else cdsView.Locate(_ID_, FocusedNode.GetNext.Values[colID.Index], []);

        aRefresh.Execute;
        RefreshFun('TfmWaybill', 0);
        RefreshFun('TfmWaybillOut', 0);
        RefreshFun('TfmAccOut', 0);
        UpdateActionList;

        if RefreshAllClients then dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_PAYDOCIN);

      finally
        fProgress.Hide;
        Free;
      end;
    end;

    inherited;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure TfmPayDoc.DoOpen(AParam: Variant);
  var
    i: integer;
    Temp: TDateTime;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.DoOpen') else _udebug := nil;{$ENDIF}

  prdMain.RegistryPath := MainRegKey + '\' + Self.ClassName;
  EditingClass := TfrmEditPayDoc;
  CanRefresh := False;
  dmData.Images.GetBitmap(66, colPayOrder.HeaderGlyph);
  dmData.i14.GetBitmap(0, irKAgent.Buttons[0].Glyph);
  pcMain.ActivePageIndex := 0;

  {if ReadFromRegDate(MainRegKey + '\' + Self.ClassName, 'FromDate', Temp)
    then begin
      if Temp = 0
        then edFromDate.Text := ''
        else edFromDate.Date := Temp;
    end
    else edFromDate.Date := IncDay(Date, -DefFilterPeriod);
  edToDate.Date := Self.OnDate;
  }

  //  cdsKAgent.Open;
  cdsPayType.Open;
  cdsChargeType.Open;

  case Tag of
   utv_gType_PayDocIn :
     begin
       GrpID := 1;
       RefType := rtPDIn;
     end;

   utv_gType_PayDocOut:
     begin
       GrpID := -1;
       RefType := rtPDOut;
     end;

   utv_gType_PayDocOutEx:
     begin
       GrpID := -2;
       RefType := rtPDOutEx;
       tsDocRel.TabVisible := False;
     end;
  end;
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
procedure TfmPayDoc.SetCaptions;
  var
    FTitle: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    case Self.Tag of
      utv_gType_PayDocIn:
       begin
         colName.Caption := GetRS(Self.Name, 'Sender');
         Self.Caption := GetRS(Self.Name, 'TitleIn');
       end;

      utv_gType_PayDocOut:
       begin
         colName.Caption := GetRS(Self.Name, 'Receiver');
         Self.Caption := GetRS(Self.Name, 'TitleOut');
       end;

      utv_gType_PayDocOutEx:
       begin
         colName.Caption := GetRS(Self.Name, 'Receiver');
         Self.Caption := GetRS(Self.Name, 'TitleChargesOut');
       end;
    end;

    prdMain.InitRes;
    prdMain.CapFrom := GetRS('fmPayDoc', 'FromDate') + ':';

    FTitle := Self.Caption;
    aGotoDoc.Caption := GetRS('Common', 'Jump');
    colOnDate.Caption := GetRS(Self.Name, 'Date');
    colPayType.Caption := GetRS(Self.Name, 'PayType');
    colTotal.Caption := GetRS(Self.Name, 'Total');
    colTotalDef.Caption := GetRS(Self.Name, 'Summ') + ', ' + BaseCurrName;
    colDocType.Caption := '';
    colChecked.Caption := '';
    colCashName.Caption := GetRS(Self.Name, 'CashDesk');
    colAcc.Caption := GetRS(Self.Name, 'Account');
    colNum.Caption := GetRS(Self.Name, 'DocNum');
    colChargeType.Caption := GetRS(Self.Name, 'ChargeTypeOut');
    colRate.Caption := GetRS(Self.Name, 'Rate');
    colShortName.Caption := GetRS(Self.Name, 'Currency');
    //lFromDate.Caption := GetRS(Self.Name, 'FromDate');
    //lToDate.Caption := GetRS(Self.Name, 'ToDate');
    lKAgent.Caption := GetRS(Self.Name, 'KAgent');
    lCount.Caption := GetRS(Self.Name, 'TotalCount') + ':';
    lTotal.Caption := GetRS(Self.Name, 'OnSum') + ':';
    lPayType.Caption := GetRS(Self.Name, 'PayType');

    colDRType.Caption := '';
    colDRTypeName.Caption := GetRS('fmWaybill', 'DocType');
    colDRNum.Caption := GetRS('fmWaybill', 'Num');
    colDROnDate.Caption := GetRS('fmWaybill', 'OnDate');
    colDRSummAll.Caption := GetRS('fmWaybill', 'Summ') + ', ' + BaseCurrName;
    tsDocRel.Caption := GetRS('fmWaybill', 'DocRel');

    irNum.Caption := GetRS('fmWaybill', 'Num');
    irKAgent.Caption := GetRS('fmWaybill', 'KAgent');
    irKAFullName.Caption := GetRS('fmWaybill', 'KAFullName');
    irKAAdress.Caption := GetRS('fmWaybill', 'KAadress');
    irKAPhone.Caption := GetRS('fmWaybill', 'KAPhone');
    irFax.Caption := GetRS('fmWaybill', 'KAFax');
    irCurr.Caption := GetRS('fmWaybill', 'Summ');
    irReason.Caption := GetRS('fmWaybill', 'Reason');
    irStatus.Caption := GetRS('fmWaybill', 'DocStatus');
    irPayMPerson.Caption := GetRS('fmWaybill', 'MPerson');
    irPayType.Caption := GetRS('fmWaybill', 'PayType');
    irChargeType.Caption := GetRS(Self.Name, 'ChargeType');

    lChargeType.Caption := GetRS(Self.Name, 'ChargeTypeOut');

    PageInfo.Caption := GetRS(Self.Name, 'PayInfo');
    tsNotes.Caption := GetRS(Self.Name, 'Notes');

    btnKagent.Hint := GetRS(Self.Name, 'KAgentRef');
    btnChargeType.Hint := GetRS(Self.Name, 'ChargeTypeRef');

    aPrintPayOrder.Caption := GetRS(Self.Name, 'PayOrder');
    aPrintInOrder.Caption := GetRS(Self.Name, 'InCashOrder');
    aPrint.Caption := GetRS('Common', 'Print');
    aDRPrint.Caption := GetRS('Common', 'Print');
    aCheck.Caption := GetRS('Common', 'Check');

    lcbKAgent.DisplayEmpty := GetRS('Common', 'All');
    lcbKAgent.ReloadData;
    lcbPayType.DisplayEmpty := GetRS('Common', 'All');
    lcbPayType.ReloadData;
    lcbChargeType.DisplayEmpty := GetRS('Common', 'All');
    lcbChargeType.ReloadData;

    SendMessage(ParentHandle, WM_SETPARENTCAPTION, integer(@FTitle), 0);

    FindList.Clear;
    FindList.AddObject(GetRS(Self.Name, 'DocNumD') + ';docnum', pointer(1));
    FindList.AddObject(GetRS(Self.Name, 'DateD')   + ';ondate', pointer(2));
    FindList.AddObject(GetRS(Self.Name, 'KAgentD') + ';name', pointer(3));
  end;

  // why the fuck it is moved to right silently???
  stTotal.Left := bvlTotals.Width - stTotal.Width - 5;
  lTotal.Left := stTotal.Left - 5 - lTotal.Width;
  stCount.Left := lTotal.Left - 20 - stCount.Width;
  lCount.Left := stCount.Left - 5 - lCount.Width;

  RealignFilter;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.grdMainDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.grdMainDblClick') else _udebug := nil;{$ENDIF}

  if (grdMain.Count > 0) and (cdsView.FieldByName('operid').IsNull) then begin
    if ModalView then begin
      FCurrentID := cdsView.FieldByName('paydocid').AsInteger;
      SendMessage(ParentHandle, WM_SELECTITEM, 0, 0);
    end
    else begin
      if (cdsView.FieldByName('checked').AsInteger = 1) then begin

        if not GetUserAccessByClass(Self.ClassName, uaPost) then begin
          ssMessageDlg(rs('Common', 'CantPost'), ssmtError, [ssmbOK]);
          {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
          Exit;
        end;

        if mrYes <> ssMessageDlg(rs('Common', 'PostedEditConfirm'), ssmtWarning, [ssmbYes, ssmbNo])
        then begin
          {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
          Exit;
        end;

        Application.ProcessMessages;
        with newDataSet do
        try
          ProviderName := 'pPayDoc_SetChecked';
          FetchParams;
          Params.ParamByName('paydocid').AsInteger := cdsView.fieldbyname('paydocid').AsInteger;
          Params.ParamByName('checked').AsInteger := 0;
          Execute;
          DoRefresh(0);

        finally
          Free;
        end;
      end;

      DoProperties;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.UpdateActionList') else _udebug := nil;{$ENDIF}

  inherited;

  aNew.Enabled := True;

  aProperties.Enabled := not cdsView.IsEmpty and (grdMain.SelectedCount = 1)
     and cdsView.FieldByName('operid').IsNull and (cdsView.FieldByName('checked').AsInteger = 0);

  aDel.Enabled := not cdsView.IsEmpty and (cdsView.FieldByName('checked').AsInteger = 0) and cdsView.FieldByName('operid').IsNull;

  aCheck.Enabled := not cdsView.IsEmpty and cdsView.FieldByName('operid').IsNull;

  aPrintInOrder.Visible := (CountryRules.AR in [accRul_RU, accRul_UA]) and (grdMain.SelectedCount = 1) and (Tag = utv_gType_PayDocIn)
       and not cdsView.IsEmpty and (cdsView.FieldByName('ptypeid').AsInteger = 1);

  aPrintPayOrder.Visible := (CountryRules.AR in [accRul_RU, accRul_UA]) and (grdMain.SelectedCount = 1) and (Tag = utv_gType_PayDocOut)
       and not cdsView.IsEmpty and (cdsView.FieldByName('ptypeid').AsInteger = 2);

  aPrint.Visible := aPrintInOrder.Visible or aPrintPayOrder.Visible;
  aPrint.Enabled := aPrint.Visible;
  aPatternInsert.Enabled := False;
  aGotoDoc.Enabled := not cdsRel.IsEmpty;

  stTotal.Left := bvlTotals.Width - stTotal.Width - 5;
  lTotal.Left  := stTotal.Left - lTotal.Width - 5;
  stCount.Left := lTotal.Left - stCount.Width - 25;
  lCount.Left  := stCount.Left - lcount.Width - 5;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.DoRefresh(const AID: integer; AParam: integer = 0);
  var
    FLastIndex: Integer;
    FFirst: Boolean;
    i: integer;
    c: extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.DoRefresh') else _udebug := nil;{$ENDIF}

  FLastIndex := grdMain.TopIndex;
  cdsView.DisableControls;
  FFirst := not cdsView.Active;

  case AParam of
    0: DSRefresh(cdsView, _ID_, AID);

    Integer(rtKAgent):
      begin
        if not cdsKAgent.Active then cdsKAgent.Open;
        lcbKAgent.KeyValue := AID;
      end;

    Integer(rtChargeType):
      begin
        CanRefresh := False;
        DSRefresh(cdsChargeType, 'ctypeid', 0);
        CanRefresh := True;
        lcbChargeType.KeyValue := AID;
      end;
  end;

  cdsView.EnableControls;

  c := 0;
  for i := 0 to grdMain.Count - 1 do begin
    c := c + RoundToA(ssStrToFloat(grdMain.Items[i].Values[colTotal.Index]) * grdMain.Items[i].Values[colRate.Index], -2)
  end;

  stTotal.Caption := FormatFloat(MoneyDisplayFormat, c) + ' ' + BaseCurrName;

  if FFirst then begin
    try
      if grdMain.Count > 0
        then cdsView.Locate(_ID_, grdMain.Items[0].Values[colID.Index], []);
    except
    end;
  end
  else grdMain.TopIndex := FLastIndex;

  UpdateActionList;
  with grdMain do begin
    ClearSelection;
    if FocusedNode <> nil then FocusedNode.Selected := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmPayDoc.GetIDForUpdate: integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.GetIDForUpdate') else _udebug := nil;{$ENDIF}

  Result := cdsView.fieldbyname(_ID_).AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.grdMainCustomDrawCell') else _udebug := nil;{$ENDIF}

  //if (ANode.Values[1]=1) and not ASelected then AFont.Color := DefaultColor;

  if UseGridOddColor and not ASelected and Odd(ANode.AbsoluteIndex) then AColor := GridOddLinesColor;

  if not ANode.HasChildren and not VarIsNull(ANode.Values[colOperID.Index]) and not ASelected then AFont.Color := clBtnShadow;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.DoFind(const AFName, AStr: string; ALocateType: TLocateType; AFwd: Boolean = True);
  var
    FNode: TdxTreeListNode;
    s: string;
    FName: string;
    FFromDate, FToDate: TDateTime;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.DoFind') else _udebug := nil;{$ENDIF}

  inherited;

  if FindStr<>AStr then begin
    cdsFind.Close;

    if AFName = 'name'
      then FName := 'ka.' + AFName
      else FName := 'pd.' + AFName;

    s := 'select pd.paydocid, ka.kaid, pd.ondate, pd.checked from paydoc pd, kagent ka where ka.kaid=pd.kaid'
         + ' and pd.doctype=' + IntToStr(GrpID) + ' and upper(' + FName + ')';

    case ALocateType of
      ltBegin:  s := s + ' like ''' + AnsiUpperCaseEx(AStr) + '%''';
      ltFull:   s := s + '=''' + AnsiUpperCaseEx(AStr) + '''';
      ltSubstr: s := s + ' like ''%' + AnsiUpperCaseEx(AStr) + '%''';
    end;

    cdsFind.Macros.ParamByName('sql').AsString := s;
    cdsFind.Open;
  end;

  FindStr := AStr;

  if AStr = '' then begin
    cdsView.Filter := '';
    if FilterOnSearch then cdsView.Filtered := True;
    SearchInfo.PrevFindStr := '';
    DoRefreshFindParams;
    stCount.Caption := IntToStr(cdsView.RecordCount);

    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  if not cdsFind.Eof then begin
    if not cdsView.Locate(_ID_, cdsFind.FieldByName(_ID_).AsInteger, []) then
      try
        CanRefresh := False;

        if (lcbKAgent.KeyValue <> lcbKAgent.EmptyValue)
           and (lcbKAgent.KeyValue <> cdsFind.FieldByName('kaid').AsInteger)
        then lcbKAgent.KeyValue := cdsFind.FieldByName('kaid').AsInteger;

        DSRefresh(cdsView, _ID_, cdsFind.fieldbyname(_ID_).AsInteger);

      finally
        CanRefresh := True;
      end;

    grdMain.ClearSelection;

    if grdMain.FocusedNode <> nil then grdMain.FocusedNode.Selected := True;

    cdsFind.Next;
    SearchInfo.PrevFindStr := FindStr;
  end
  else begin
    SearchInfo.Failed := True;
    if FilterOnSearch then cdsView.Filtered := False;
    SendMessage(ParentHandle, WM_SEARCHFAILED, 0, 0);
  end;
  DoRefreshFindParams;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.DoExcel(Grid: TdxDBGrid);
 var
   FShowExcel: Boolean;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.DoExcel') else _udebug := nil;{$ENDIF}

  inherited;

  with TfrmExport.Create(nil) do
    try
      if cdsFunc.Locate('classname', Self.ClassName, [])
        then FunID := cdsFunc.fieldbyname('funid').AsInteger
        else FunID := 0;

      grdExp := grdMain;
      lName.Caption := Self.Caption;
      FList := ExportList;

      if ShowModal <> mrOk then begin
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;

      FShowExcel := chbShowExcel.Checked;

    finally
      Free;
    end;

    ExportToExcel(grdMain, ExportList, FShowExcel);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.cdsViewBeforeOpen(DataSet: TDataSet);
  var
    m: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.cdsViewBeforeOpen') else _udebug := nil;{$ENDIF}

  if not panFilter.Visible
    then cdsView.Params.ParamByName('fromdate').AsDateTime := MinDateTime
    else cdsView.Params.ParamByName('fromdate').AsDateTime := prdMain.FromDate;//edFromDate.Date;;

  if not panFilter.Visible
    then cdsView.Params.ParamByName('todate').AsDateTime := MaxDateTime
    else cdsView.Params.ParamByName('todate').AsDateTime := LastSecondInDay(prdMain.ToDate{edToDate.Date});

  case Tag of
    utv_gType_PayDocIn   : cdsView.Params.ParamByName('doctype').AsInteger := 1;
    utv_gType_PayDocOut  : cdsView.Params.ParamByName('doctype').AsInteger := -1;
    utv_gType_PayDocOutEx: cdsView.Params.ParamByName('doctype').AsInteger := -2;
  end;

  m := '';
  if panFilter.Visible then begin
    if lcbPayType.KeyValue <> lcbPayType.EmptyValue then m := m + ' and pt.ptypeid=' + IntToStr(lcbPayType.KeyValue);

    if lcbKAgent.KeyValue <> lcbKAgent.EmptyValue then m := m + ' and ka.kaid=' + IntToStr(lcbKAgent.KeyValue);

    if (GrpID = -2) and (lcbChargeType.KeyValue <> lcbChargeType.EmptyValue)
      then m := m + ' and pd.ctypeid=' + IntToStr(lcbChargeType.KeyValue);
  end;
  cdsView.Macros.ParamByName('m').AsString := m;

  if cdsPayOrder.Active then cdsPayOrder.Close;

  if Self.Tag = utv_gType_PayDocIn
    then cdsPayOrder.ProviderName := 'pPayDoc_Cash'
    else cdsPayOrder.ProviderName := 'pPayDoc_Order';

  cdsPayOrder.FetchParams;
  cdsPayOrder.Macros.ParamByName('m').AsString := m;
  cdsPayOrder.Params.ParamByName('fromdate').AsDateTime := cdsView.Params.ParamByName('fromdate').AsDateTime;
  cdsPayOrder.Params.ParamByName('todate').AsDateTime := cdsView.Params.ParamByName('todate').AsDateTime;
  cdsPayOrder.Params.ParamByName('doctype').AsInteger := cdsView.Params.ParamByName('doctype').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.colTotalGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.colTotalGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MoneyDisplayFormat, ssStrToFloat(Atext)) + ' ' + ANode.Values[colShortName.Index];
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.colTotalDefGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.colTotalDefGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MoneyDisplayFormat, ssStrToFloat(ANode.Values[colTotal.Index]) * ANode.Values[colRate.Index]);
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.DoShow;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.DoShow') else _udebug := nil;{$ENDIF}

  inherited;

  colName.Visible := GrpID <> -2;
  colChargeType.Visible := not colName.Visible;
  FrameResize(Self);
  RealignFilter;

  if ModalView then begin
    pcMain.Visible := False;
    splMain.Visible := False;
  end;

  disableDateEvent := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.lcbKAgentPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.lcbKAgentPropertiesChange') else _udebug := nil;{$ENDIF}

  if lcbKAgent.Text = '' then lcbKAgent.ItemIndex := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.lcbPayTypePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.lcbPayTypePropertiesChange') else _udebug := nil;{$ENDIF}

  if lcbPayType.Text = '' then lcbPayType.ItemIndex := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.lcbKAgentPropertiesEditValueChanged(Sender: TObject);
  var
    i: integer;
    c: extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.lcbKAgentPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if CanRefresh then DoRefresh(0);

  {c := 0;

  for i := 0 to grdMain.Count - 1 do begin
    c := c + RoundToA(ssStrToFloat(grdMain.Items[i].Values[colTotal.Index]) * grdMain.Items[i].Values[colRate.Index], -2)
  end;

  stTotal.Caption := FormatFloat(MoneyDisplayFormat, c)+' '+BaseCurrName;
  }

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmPayDoc.CheckDate(const AValue: string): boolean;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.CheckDate') else _udebug := nil;{$ENDIF}

  Result := True;
  try
    StrToDate(AValue);
  except
    Result := False;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.edFromDatePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.edFromDatePropertiesChange') else _udebug := nil;{$ENDIF}

  if not disableDateEvent then begin
     disableDateEvent := True;
     if (TcxDateEdit(Sender).Text = '') then begin
       TcxDateEdit(Sender).EditValue := 0;
       TcxDateEdit(Sender).EditText := '';
     end;
     disableDateEvent := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.cdsViewAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.cdsViewAfterOpen') else _udebug := nil;{$ENDIF}

  stCount.Caption := IntToStr(cdsView.RecordCount);

  DSRefresh(cdsPayOrder, 'paydocid', 0);
  FrameResize(Self);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.FrameResize(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.FrameResize') else _udebug := nil;{$ENDIF}

  inherited;
  if colName.Visible
    then AdjustGrid(grdMain, colName)
    else AdjustGrid(grdMain, colChargeType);

  AdjustGrid(grdDocRel, colDRTypeName);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.aPrintExecute(Sender: TObject);
 //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.aPrintExecute(') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmPayDoc.aPrintInOrderExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.aPrintInOrderExecute') else _udebug := nil;{$ENDIF}

  case CountryRules.AR of
    accRul_RU:
      begin
        with TfrmEditCashOrder_RUS.Create(nil) do
          try
            ParentHandle := Self.Handle;
            ID := cdsView.fieldbyname('paydocid').AsInteger;
            ShowModal;

          finally
            Free;
          end;
       end;

    accRul_UA:
      begin
        with TfrmEditCashOrder_UKR.Create(nil) do
          try
            ParentHandle := Self.Handle;
            ID := cdsView.fieldbyname('paydocid').AsInteger;
            ShowModal;

          finally
            Free;
          end;
       end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.DoPrint(AParam: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.DoPrint') else _udebug := nil;{$ENDIF}

  case AParam of
    0: aPrintInOrder.Execute;
    1: aPrintPayOrder.Execute;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.frDocGetValue(const ParName: String; var ParValue: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.frDocGetValue') else _udebug := nil;{$ENDIF}

   case frDoc.Tag of
    0:
      begin
        if 0 = AnsiCompareText(ParName, 'entname') then ParValue := EntName
        else if 0 = AnsiCompareText(ParName, 'total') then ParValue := FormatFloat(MoneyDisplayFormat, RoundToA(cdsView.fieldbyname('total').AsCurrency*cdsView.fieldbyname('onvalue').AsCurrency, -2))
        else if 0 = AnsiCompareText(ParName, 'docnum') then ParValue := cdsView.fieldbyname('docnum').AsString
        else if 0 = AnsiCompareText(ParName, 'docdate') then ParValue := cdsView.fieldbyname('ondate').AsString
        else if 0 = AnsiCompareText(ParName, 'kagent') then ParValue := cdsView.fieldbyname('name').AsString
        else if 0 = AnsiCompareText(ParName, 'totalstr') then ParValue := MoneyToStr(RoundToA(cdsView.fieldbyname('total').AsCurrency*cdsView.fieldbyname('onvalue').AsCurrency, -2));
      end;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.DoCheck(EditRequest: Boolean);
  var
    i: Integer;
    unPosted: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.DoCheck') else _udebug := nil;{$ENDIF}

  try // finally
    if not GetUserAccessByClass(Self.ClassName, uaPost) then begin
      ssMessageDlg(rs('Common', 'CantPost'), ssmtError, [ssmbOK]);
      Exit;
    end;

    inherited;

    unPosted := (cdsView.FieldByName('checked').AsInteger = 0);

    if unPosted then begin
      if not (((grdMain.SelectedCount = 1) and (mrYes = ssMessageDlg(rs('Common', 'CheckConfirm'), ssmtWarning, [ssmbYes, ssmbNo])))
              or ((grdMain.SelectedCount > 1) and (mrYes = ssMessageDlg(Format(rs('Common', 'CheckConfirmEx'), [grdMain.SelectedCount]), ssmtWarning, [ssmbYes, ssmbNo]))))
      then Exit;
    end
    else begin
      if not (((grdMain.SelectedCount = 1)
               and (mrYes = ssMessageDlg(rs('Common', ifThen(EditRequest, 'PostedEditConfirm', 'UncheckConfirm')), ssmtWarning, [ssmbYes, ssmbNo])))
              or ((grdMain.SelectedCount > 1)
                  and (mrYes = ssMessageDlg(Format(rs('Common', 'UncheckConfirmEx'), [grdMain.SelectedCount]), ssmtWarning, [ssmbYes, ssmbNo]))))
       then Exit;
    end;

    Application.ProcessMessages;

    if not ((GrpID = -2) and (grdMain.SelectedCount = 1))
      then fProgress.Show;

    with newDataSet do
    try
      ProviderName := 'pPayDoc_SetChecked';
      FetchParams;
      Params.ParamByName('checked').AsInteger := Integer(unPosted);
      fProgress.Caption := rs('Common', 'Processing') + '...';
      fProgress.UpDate;
      fProgress.pbMain.Max := grdMain.SelectedCount;

      for i := 0 to grdMain.SelectedCount - 1 do begin
        if ((grdMain.SelectedNodes[i].Values[colChecked.Index] = 1) and unPosted)
             or
           ((grdMain.SelectedNodes[i].Values[colChecked.Index] = 0) and not unPosted)
             or
           (not VarIsNull(grdMain.SelectedNodes[i].Values[colOperID.Index]))
        then Continue;

        Params.ParamByName('paydocid').AsInteger := grdMain.SelectedNodes[i].Values[colID.Index];

        try
          Execute;

          if GrpID <> -2
          then DoRecalcKASaldo(dmData.SConnection, grdMain.SelectedNodes[i].Values[colKAID.Index],
               grdMain.SelectedNodes[i].Values[colOnDate.Index], rs(Self.Name, 'RecalcBallance'), False);

        except
          on E:Exception do begin
            if (grdMain.SelectedCount = 1) then begin
              ssMessageDlg(e.Message, ssmtError, [ssmbOk]);
              Exit;
            end
            else if mrYes <> ssMessageDlg(e.Message + '. ' + rs('Common', 'Continue') + '?', ssmtError, [ssmbYes, ssmbNo])
                 then Break;
          end;
        end;

        fProgress.lText.Caption := '[' + VarToStr(grdMain.SelectedNodes[i].Values[colNum.Index]) + '] ' + grdMain.SelectedNodes[i].Values[colName.Index];

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
     RefreshFun('TfmWaybill', 0);
     RefreshFun('TfmOrders', 16);
     RefreshFun('TfmOrders', -16);
     RefreshFun('TfmWaybillOut', 0);
     RefreshFun('TfmAccOut', 0);
     RefreshFun('TfmFinance', 0);

     {if RefreshAllClients then begin
       dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_PAYDOCIN);
       dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_KAGENTS);
     end;
     }

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure TfmPayDoc.aPrintPayOrderExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.aPrintPayOrderExecute') else _udebug := nil;{$ENDIF}

  case CountryRules.AR of
    accRul_RU:
      begin
        with TfrmEditPayOrder_RUS.Create(nil) do
        try
          ParentHandle := Self.Handle;
          ID := cdsView.fieldbyname('paydocid').AsInteger;
          ShowModal;

        finally
          Free;
        end;
      end;

    accRul_UA:
      begin
        with TfrmEditPayOrder_UKR.Create(nil) do
        try
          ParentHandle := Self.Handle;
          ID := cdsView.fieldbyname('paydocid').AsInteger;
          ShowModal;

        finally
          Free;
        end;
      end;
  end; // case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.colPayOrderGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.colPayOrderGetText') else _udebug := nil;{$ENDIF}

  if cdsPayOrder.Locate('paydocid', ANode.Values[0], [])
    then AText := '1'
    else AText := '10000';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.colPayOrderCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.colPayOrderCustomDrawCell') else _udebug := nil;{$ENDIF}

  if (AText = '1') and ASelected then AText := '-1';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.DoShowFilter;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.DoShowFilter') else _udebug := nil;{$ENDIF}

  inherited;

  panFilter.Visible := aShowFilter.Checked;
  Application.ProcessMessages;
  DoRefresh(0);
  FrameResize(Self);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.btnKagentClick(Sender: TObject);
  var
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
    AID: Integer;
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.btnKagentClick') else _udebug := nil;{$ENDIF}

  try aid := lcbKAgent.KeyValue; except AID := 0; end;
  ShowModalRef(Self, rtKAgent, vtKAgent, 'TfmKAgent', Self.OnDate, AID);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.lcbKAgentPropertiesInitPopup(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.lcbKAgentPropertiesInitPopup') else _udebug := nil;{$ENDIF}

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
procedure TfmPayDoc.aPropertiesExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.aPropertiesExecute') else _udebug := nil;{$ENDIF}

  grdMainDblClick(grdMain);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.tsNotesShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.tsNotesShow') else _udebug := nil;{$ENDIF}

  tsNotes.Color := clWindow;
  memNotes.Width := tsNotes.Width - 20;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.inspMainDrawCaption(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.inspMainDrawCaption') else _udebug := nil;{$ENDIF}

  if UseGridOddColor and Odd(Sender.Node.AbsoluteIndex)
    then AColor := GridOddLinesColor
    else AColor := clWindow;

  AFont.Color := clWindowText;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.inspMainDrawValue(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.inspMainDrawValue') else _udebug := nil;{$ENDIF}

  if UseGridOddColor and Odd(Sender.Node.AbsoluteIndex)
    then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.colOnDateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.colOnDateGetText') else _udebug := nil;{$ENDIF}

  AText := DateToStr(ANode.Values[colOnDate.Index]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.grdMainSelectedCountChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.grdMainSelectedCountChange') else _udebug := nil;{$ENDIF}

  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.aSelectAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.aSelectAllExecute') else _udebug := nil;{$ENDIF}

  grdMain.SelectAll;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.RealignFilter;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.RealignFilter') else _udebug := nil;{$ENDIF}

  lKAgent.Visible := GrpID <> -2;
  lcbKAgent.Visible := lKAgent.Visible;
  btnKagent.Visible := lKAgent.Visible;

  lChargeType.Visible := not lKAgent.Visible;
  lcbChargeType.Visible := not lKAgent.Visible;
  btnChargeType.Visible := not lKAgent.Visible;

  bvlRight.Left := panFilter.width - 1;
  bvlRight.Anchors := [akRight, akTop];
  lcbPayType.Left := panFilter.Width-lcbPayType.Width-5;
  lcbPayType.Anchors := [akRight, akTop];
  lPayType.Left := lcbPayType.Left-lPayType.Width-5;
  lPayType.Anchors := [akRight, akTop];

  lKAgent.Left := prdMain.Left + prdMain.Width + 5;
  lChargeType.Left := lKAgent.Left;

  btnKAgent.Left := lPayType.Left-btnKAgent.Width-8;
  lcbKAgent.Left := lKAgent.Left + lKAgent.Width + 3;
  lcbKAgent.Width := btnKAgent.Left-lcbKAgent.Left-2;
  lcbKAgent.Anchors := [akRight, akTop, akLeft];

  btnChargeType.Left := lPayType.Left-btnChargeType.Width-4;
  lcbChargeType.Left := lChargeType.Left + lChargeType.Width + 3;
  lcbChargeType.Width := btnChargeType.Left - lcbChargeType.Left - 2;
  lcbChargeType.Anchors := [akRight, akTop, akLeft];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.btnChargeTypeClick(Sender: TObject);
  var
    aid: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.btnChargeTypeClick') else _udebug := nil;{$ENDIF}

  try aid := lcbChargeType.KeyValue; except aid := 0; end;
  ShowModalRef(Self, rtChargeType, vtChargeType, 'TfmChargeType', Self.OnDate, aid);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.colNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.colNumGetText') else _udebug := nil;{$ENDIF}

  AText := ANode.Values[colNumEx.Index];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.cdsViewCalcFields(DataSet: TDataSet);
 var
   FNum: string;
   FP, FS: string;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.cdsViewCalcFields') else _udebug := nil;{$ENDIF}

  case Tag of
    utv_gType_PayDocIn:
      begin
        FS := PDInSuffix;
        FP := PDInPrefix;
      end;

    utv_gType_PayDocOut:
      begin
        FS := PDOutSuffix;
        FP := PDOutPrefix;
      end;

    utv_gType_PayDocOutEx:
      begin
        FS := PDChargeSuffix;
        FP := PDChargePrefix;
      end;
  end;

  try
    FNum := DataSet.FieldByName('docnum').AsString;
    if Pos(FP, FNum) = 1
      then DataSet.FieldByName('numex').AsInteger := StrToInt(Trim(Copy(FNum, Length(FP) + 1, Length(FNum) - Length(FP) - Length(FS))))
      else DataSet.FieldByName('numex').AsInteger := StrToInt(FNum);

  except
    DataSet.FieldByName('numex').AsInteger := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.DoHelp;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.DoHelp') else _udebug := nil;{$ENDIF}

  case Tag of
    utv_gType_PayDocIn:    ShowHelpTopic('fmPDIn');
    utv_gType_PayDocOut:   ShowHelpTopic('fmPDOut');
    utv_gType_PayDocOutEx: ShowHelpTopic('fmPDCharge');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.lcbChargeTypePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.lcbChargeTypePropertiesChange') else _udebug := nil;{$ENDIF}

  if lcbChargeType.Text='' then lcbChargeType.ItemIndex := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.DoLocate(const AID: Integer; ASubID: Integer = 0);
  var
    FFrom, FTo, FDocDate: TDateTime;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.DoLocate') else _udebug := nil;{$ENDIF}

  if JumpFromBuffer then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  grdMain.ClearSelection;

  if cdsView.Locate('docid', AID, []) then begin
    if grdMain.FocusedNode <> nil
      then grdMain.FocusedNode.Selected := True;
  end
  else with newDataSet do
  try
    ProviderName := 'pPayDoc_GetEx';
    FetchParams;
    Params.ParamByName(_ID_).AsInteger := AID;
    Open;

    if IsEmpty
      then ssMessageDlg(rs(Self.Name, 'PDNotFound'), ssmtError, [ssmbOK])
      else begin
        CanRefresh := False;

        {if edFromDate.EditText = '' then FFrom := MinDateTime
          else FFrom := edFromDate.Date;
        if edToDate.EditText = '' then FTo := MaxDateTime
          else FTo := LastSecondInDay(edToDate.Date);
        FDocDate := FieldByName('ondate').AsDateTime;
        if (FDocDate < FFrom) or (FDocDate > FTo) then begin
          edFromDate.Date := Int(FDocDate);
          edToDate.Date := Int(FDocDate);
        end;}

        if (lcbKAgent.KeyValue <> lcbKAgent.EmptyValue)
          then lcbKAgent.KeyValue := FieldByName('kaid').AsInteger;

        if lcbPayType.KeyValue <> lcbPayType.EmptyValue
          then lcbPayType.KeyValue := FieldByName('ptypeid').AsInteger;

        CanRefresh := True;
        DSRefresh(cdsView, 'docid', AID);
      end;
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.colDRTypeNameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.colDRTypeNameGetText') else _udebug := nil;{$ENDIF}

  case ANode.Values[colDRType.Index] of
      1: AText := rs('fmWaybill', 'DocWBIn');
     -1: AText := rs('fmWaybill', 'DocWBOut');
      2: AText := rs('fmWaybill', 'DocAccOut');
     -6: AText := rs('fmWaybill', 'DocWBRetOut');
      6: AText := rs('fmWaybill', 'DocWBRetIn');
      8: AText := rs('fmWaybill', 'ContrIn');
     -8: AText := rs('fmWaybill', 'ContrOut');
     -9: AText := rs('fmWaybill', 'DocInvoice');
    -16: AText := rs('fmWaybill', 'DocOrderOut');
     16: AText := rs('fmWaybill', 'DocOrderIn');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.colDROnDateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.colDROnDateGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatDateTime('dd.mm.yyyy', ANode.Values[colDROnDate.Index]);
  except
    AText := '';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.cdsRelAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.cdsRelAfterOpen') else _udebug := nil;{$ENDIF}

  AdjustGrid(grdDocRel, colDRTypeName);
  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.cdsRelBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.cdsRelBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsRel.Params.ParamByName('docid').AsInteger := cdsView.FieldByName('docid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.aGotoDocExecute(Sender: TObject);
  var
    FID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.aGotoDocExecute') else _udebug := nil;{$ENDIF}

  FID := cdsRel.FieldByName('docid').AsInteger;
  case cdsRel.FieldByName('doctype').AsInteger of
      1: frmMainForm.ExecLocate(vtDocs, 'TfmWaybill', FID);
      2: frmMainForm.ExecLocate(vtDocs, 'TfmAccOut', FID);
     -1: frmMainForm.ExecLocate(vtDocs, 'TfmWaybillOut', FID);
     -6: frmMainForm.ExecLocate(vtDocs, 'TfmWBReturnOut', FID);
      6: frmMainForm.ExecLocate(vtDocs, 'TfmWBReturnIn', FID);
      8: frmMainForm.ExecLocate(vtDocs, 'TfmContr', FID, 20);
     -8: frmMainForm.ExecLocate(vtDocs, 'TfmContr', FID, -20);
     -9: frmMainForm.ExecLocate(vtDocs, 'TfmInvoices', FID);
     16: frmMainForm.ExecLocate(vtDocs, 'TfmOrders', FID, 16);
    -16: frmMainForm.ExecLocate(vtDocs, 'TfmOrders', FID, -16);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.grdDocRelDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.grdDocRelDblClick') else _udebug := nil;{$ENDIF}

  aGotoDoc.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.aDRPrintExecute(Sender: TObject);
  var
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
    FID: Integer;
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.aDRPrintExecute') else _udebug := nil;{$ENDIF}

  FID := GetByDocID(cdsRel.FieldByName('docid').AsInteger);
  case cdsRel.FieldByName('doctype').AsInteger of
      1: xRep.ShowRep(rtWBIn, FID);
     -1: xRep.ShowRep(rtWBOut, FID);
      2: xRep.ShowRep(rtAccOut, FID);
     -6: xRep.ShowRep(rtReturnOut, FID);
      6: xRep.ShowRep(rtReturnIn, FID);
     -9: xRep.ShowRep(rtWBOutInvoice, FID);
     16: xRep.ShowRep(rtOrderIn, FID);
    -16: xRep.ShowRep(rtOrderOut, FID);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.grdMainGetOptionsTitle') else _udebug := nil;{$ENDIF}

  case GrpID of
    1: begin
         AText := rs('frmOptions', 'PDIn');
         AIndex := II_PDIN;
       end;

   -1: begin
         AText := rs('frmOptions', 'PDOut');
         AIndex := II_PDOUT;
       end;

   -2: begin
         AText := rs('frmOptions', 'PDCharge');
         AIndex := II_PDCHARGE;
       end;
  end;
  ImgList := dmData.Images;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.grdMainNeedAdjust(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.grdMainNeedAdjust') else _udebug := nil;{$ENDIF}

  AdjustGrid(grdMain, colName);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.aColParamsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.aColParamsExecute') else _udebug := nil;{$ENDIF}

  grdMain.ShowColOptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.colAccGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.colAccGetText') else _udebug := nil;{$ENDIF}

  if AText <> '' then AText := AText + ' ' + rs('fmPayDoc', 'In') + ' ' + ANode.Values[colBankName.Index];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmPayDoc.GetByDocID(ADocID: Integer): Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.GetByDocID') else _udebug := nil;{$ENDIF}

  Result := 0;
  with newDataSet do
  try
    ProviderName := 'pWaybill_GetByDocID';
    FetchParams;
    Params.ParamByName('docid').AsInteger := ADocID;
    Open;
    Result := FieldByName('wbillid').AsInteger;
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.NotifyChanged;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.NotifyChanged') else _udebug := nil;{$ENDIF}

  if not JumpFromBuffer
    then frmMainForm.AddToBuffer(vtDocs, FunID, Self.Caption, ClassName, Tag, FCurrentID, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.DoSetFocus;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.DoSetFocus') else _udebug := nil;{$ENDIF}

  if grdMain.Visible
    then grdMain.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.grdMainKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.grdMainKeyDown') else _udebug := nil;{$ENDIF}

  if Key = 13 then begin
    Key := 0;
    grdMainDblClick(grdMain);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.SetParam(const Value: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.SetParam') else _udebug := nil;{$ENDIF}

  if Value > 0 then begin
    if not cdsKAgent.Active then cdsKAgent.Open;
    lcbKAgent.KeyValue := Value;
    lcbKAgent.Enabled := False;
    btnKagent.Enabled := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.colCheckedGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.colCheckedGetText') else _udebug := nil;{$ENDIF}

  try
    if AText = '0' then AText := '-1';
  except
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.prdMainChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.prdMainChange') else _udebug := nil;{$ENDIF}

  Application.ProcessMessages;
  lcbKAgentPropertiesEditValueChanged(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.SetOnDate(const Value: TDateTime);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.SetOnDate') else _udebug := nil;{$ENDIF}

  inherited;

  prdMain.BaseDate := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmPayDoc.irKAgentEditButtonClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.irKAgentEditButtonClick') else _udebug := nil;{$ENDIF}

  try // finally
    if cdsView.FieldByName('kaid').AsInteger = 0 then Exit;

    if not ShowBallance then begin
      AccessDenied;
      Exit;
    end;

    if cdsView.IsEmpty then Exit;

    with TfrmKATurnover.Create(nil) do
      try
        ParentNameEx := 'fmKAgent';
        OnDate := Self.OnDate;
        ID := Self.cdsView.FieldByName('kaid').AsInteger;
        ShowModal;

      finally
        Free;
      end;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure TfmPayDoc.srcViewDelayedDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmPayDoc.srcViewDelayedDataChange') else _udebug := nil;{$ENDIF}

  FCurrentID := cdsView.FieldByName('paydocid').AsInteger;
  UpdateActionList;

  if not cdsView.IsEmpty then
    if cdsView.FieldByName('checked').AsInteger = 0
      then aCheck.Caption := rs('Common', 'Check')
      else aCheck.Caption := rs('Common', 'UnCheck');

  if not cdsView.IsEmpty then begin
    memNotes.Text := cdsView.FieldByName('notes').AsString;

    irNum.Text := cdsView.FieldByName('docnum').AsString + rs('fmWaybill', 'From',3) +
        ssDateToStr(cdsView.FieldByName('ondate').AsDateTime) + ' ' +
        TimeToStr(cdsView.FieldByName('ondate').AsDateTime);

    irKAgent.Text := cdsView.FieldByName('name').AsString;
    irPayType.Text := cdsView.FieldByName('ptypename').AsString;

    case cdsView.FieldByName('ptypeid').AsInteger of
      1: irPayType.Text := irPayType.Text + ' (' + cdsView.FieldByName('cashname').AsString + ')';
      2: irPayType.Text := irPayType.Text + ' (' + cdsView.FieldByName('accnum').AsString + ' ' +
           rs('fmPayDoc', 'In') + ' ' + cdsView.FieldByName('bankname').AsString + ')';
    end;

    irChargeType.Text := cdsView.FieldByName('chargename').AsString;
    irKAFullName.Text := cdsView.FieldByName('fullname').AsString;
    irKAPhone.Text := cdsView.FieldByName('phone').AsString;
    irFax.Text := cdsView.FieldByName('fax').AsString;

    if Trim(cdsView.FieldByName('email').AsString) <> ''
      then irEmail.Text := 'mailto:' + cdsView.FieldByName('email').AsString
      else irEmail.Text := '';

    irWWW.Text := cdsView.FieldByName('www').AsString;
    //«апись адреса контрагента одной строкой
    irKAAdress.Text := cdsView.FieldByName('postindex').AsString;
    if ( trim(irKAAdress.Text) <> '') and ( trim(cdsView.FieldByName('country').AsString) <> '')
      then irKAAdress.Text := cdsView.FieldByName('country').AsString + ', ' + irKAAdress.Text
      else irKAAdress.Text := cdsView.FieldByName('country').AsString + irKAAdress.Text;

    if ( trim(irKAAdress.Text) <> '') and ( trim(cdsView.FieldByName('district').AsString) <> '')
      then irKAAdress.Text := cdsView.FieldByName('district').AsString + ', ' + irKAAdress.Text
      else irKAAdress.Text := cdsView.FieldByName('district').AsString + irKAAdress.Text;

    if (trim(irKAAdress.Text) <> '') and (trim(cdsView.FieldByName('city').AsString) <> '')
      then irKAAdress.Text := cdsView.FieldByName('city').AsString + ', ' + irKAAdress.Text
      else irKAAdress.Text := cdsView.FieldByName('city').AsString + irKAAdress.Text;

    if (trim(irKAAdress.Text) <> '') and (trim(cdsView.FieldByName('address').AsString) <> '')
      then irKAAdress.Text := cdsView.FieldByName('address').AsString + ', ' + irKAAdress.Text
      else irKAAdress.Text := cdsView.FieldByName('address').AsString + irKAAdress.Text;

    irReason.Text := cdsView.FieldByName('reason').AsString;
    if cdsView.FieldByName('checked').AsInteger = 1
      then irStatus.Text := rs('fmWaybill', 'DocChecked')
      else irStatus.Text := rs('fmWaybill', 'DocUnChecked');

    if cdsView.FieldByName('currid').AsInteger = BaseCurrID
      then irCurr.Text := FormatFloat(MoneyDisplayFormat, cdsView.FieldByName('total').AsCurrency) + ' ' + BaseCurrName
      else begin
        irCurr.Text := cdsView.FieldByName('total').AsString + ' ' +
          cdsView.FieldByName('shortname').AsString + ' = ' +
          FormatFloat(MoneyDisplayFormat, RoundToA(cdsView.FieldByName('total').AsCurrency *
          cdsView.FieldByName('onvalue').AsFloat, -2)) + ' ' + BaseCurrName + ' (' +
          rs('fmWaybill', 'Kurs') + ': ' + FloatToStr(cdsView.FieldByName('onvalue').AsFloat) + ' ' +
          BaseCurrName + ')';
      end;
  end //if not cdsView.IsEmpty
  else begin
    memNotes.Text := '';
    irNum.Text := '';
    irKAgent.Text := '';
    irPayType.Text := '';
    irChargeType.Text := '';
    irKAFullName.Text := '';
    irKAPhone.Text := '';
    irFax.Text := '';
    irEmail.Text := '';
    irWWW.Text := '';
    irKAAdress.Text := '';
    irReason.Text := '';
    irStatus.Text := '';
    irCurr.Text := '';
  end;
  DSRefresh(cdsRel, 'docid', 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fPayDoc', @Debugging, DEBUG_group_ID);
  {$ENDIF}

finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
