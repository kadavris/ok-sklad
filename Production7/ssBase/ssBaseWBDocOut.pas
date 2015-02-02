{$I ok_sklad.inc}
unit ssBaseWBDocOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ssBaseWBDocDlg, DB, dxmdaset, ActnList, ssFormStorage, ImgList,
  xButton, ssPanel, ssGradientPanel, dxDBGrid6, dxTL6, dxDBCtrl6, dxDBTLCl6,
  dxGrClms6, dxCntner6, ssDBGrid, ssBevel, StdCtrls, cxControls, cxGroupBox,
  ssGroupBox, ssSpeedButton, ExtCtrls, cxSpinEdit, cxTimeEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxTextEdit, cxContainer, cxEdit, cxCheckBox,
  TB2Item, Menus, prTypes, Grids, DBGrids, ssMemDS, ssBaseConst, FR_DSet,
  FR_DBSet, FR_Class, DBClient, ssClientDataSet, ssBaseWBDocDlgWithPayment,
  cxPC, ssPageControl, ssDBLookupCombo, cxCalc, ssCalcEdit, ssLabel,
  okSearchEdit, xLngDefs;

type
  TfrmBaseWBDocOut = class(TfrmBaseWBDocDlgWithPayment)
    aActivateFind: TAction;
    aCDel: TAction;
    aCIns: TAction;
    aCUpd: TAction;
    aCurAction: TAction;
    aRemoveRsv: TAction;
    aRemoveRsvAll: TAction;
    aSelectAll: TAction;
    aSetRsv: TAction;
    aSetRsvAll: TAction;
    aShowSN: TAction;
    btnDel: TssSpeedButton;
    btnNew: TssSpeedButton;
    btnProps: TssSpeedButton;
    cdsPersonName: TssClientDataSet;
    cdsRsv_Temp: TssClientDataSet;
    chbPosting: TcxCheckBox;
    edFind: TokGridSearchEdit;
    edNotes: TcxTextEdit;
    edNum1: TcxTextEdit;
    edReason: TcxTextEdit;
    frDBDataSet1: TfrDBDataSet;
    frDoc: TfrReport;
    itmColOptions: TTBItem;
    lNotes: TLabel;
    lNum: TLabel;
    lReason: TLabel;
    mdDetPriceCurrTXT: TStringField;
    mdDetpricedef: TFloatField;
    mdDetpricedefwonds: TFloatField;
    mdDetstatus: TIntegerField;
    mdDetsummcurr: TFloatField;
    mdDetSummCurrTXT: TStringField;
    mdDetsummdef: TFloatField;
    mdDetsummnds: TFloatField;
    mdDetsummwonds: TFloatField;
    mdPosition: TssMemoryData;
    mdPositionamount: TFloatField;
    mdPositioncertdate: TDateTimeField;
    mdPositioncertnum: TStringField;
    mdPositioncurrid: TIntegerField;
    mdPositioncurrname: TStringField;
    mdPositionDiscount: TFloatField;
    mdPositiondocdate: TDateTimeField;
    mdPositiondocnum: TStringField;
    mdPositiondocnumtxt: TStringField;
    mdPositiongtd: TStringField;
    mdPositionmatid: TIntegerField;
    mdPositionNDS: TFloatField;
    mdPositionondate: TDateTimeField;
    mdPositiononvalue: TFloatField;
    mdPositionposid: TIntegerField;
    mdPositionpostype: TIntegerField;
    mdPositionprice: TFloatField;
    mdPositionpricetxt: TStringField;
    mdPositionproducer: TStringField;
    mdPositionSN: TStringField;
    mdPositionwbillid: TIntegerField;
    mdPositionwhname: TStringField;
    mdPositionwid: TIntegerField;
    mdPositionwtype: TIntegerField;
    mdReport: TdxMemData;
    mdTmpIds: TdxMemData;
    mdTmpIdsamount: TFloatField;
    mdTmpIdsforall: TIntegerField;
    mdTmpIdsfree: TIntegerField;
    mdTmpIdsposid: TIntegerField;
    mdTmpIdsSourceID: TIntegerField;
    mdTmpIdsTmpId: TIntegerField;
    mdWMatTurn: TdxMemData;
    mdWMatTurnamount: TFloatField;
    mdWMatTurnflag: TIntegerField;
    mdWMatTurnmatid: TIntegerField;
    mdWMatTurnOld: TdxMemData;
    mdWMatTurnondate: TDateTimeField;
    mdWMatTurnposid: TIntegerField;
    mdWMatTurnSN: TStringField;
    mdWMatTurnsourceid: TIntegerField;
    mdWMatTurnturntype: TIntegerField;
    mdWMatTurnwid: TIntegerField;
    pmMain: TTBPopupMenu;
    srcPersonName: TDataSource;
    TBItem14: TTBItem;
    TBItem15: TTBItem;
    TBItem16: TTBItem;
    TBItem17: TTBItem;
    TBItem18: TTBItem;
    TBItem22: TTBItem;
    TBItem23: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBItem9: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBSeparatorItem7: TTBSeparatorItem;
    TBSeparatorItem8: TTBSeparatorItem;
    TBSeparatorItem9: TTBSeparatorItem;

    procedure aActivateFindExecute(Sender: TObject);
    procedure aBallanceExecute(Sender: TObject);
    procedure aCDelExecute(Sender: TObject);
    procedure aCInsExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aCUpdExecute(Sender: TObject);
    procedure aCurActionExecute(Sender: TObject);
    procedure aMatInfoExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure aRemoveRsvAllExecute(Sender: TObject);
    procedure aRemoveRsvExecute(Sender: TObject);
    procedure aSelectAllExecute(Sender: TObject);
    procedure aSetRsvAllExecute(Sender: TObject);
    procedure aSetRsvExecute(Sender: TObject);
    procedure aSetTimeExecute(Sender: TObject);
    procedure aShowRealPriceExecute(Sender: TObject);
    procedure aShowSNExecute(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cbCurrPropertiesChange(Sender: TObject);
    procedure chbPayPropertiesChange(Sender: TObject);
    procedure chbPostingPropertiesChange(Sender: TObject);
    procedure colAmountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colStatusGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure CtrlEnter(Sender: TObject);
    procedure CtrlExit(Sender: TObject);
    procedure DataModified(Sender: TObject);
    procedure dbgWaybillDetCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure dbgWaybillDetDblClick(Sender: TObject);
    procedure dbgWaybillDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure frDocEndDoc;
    procedure frDocGetValue(const ParName: String; var ParValue: Variant);
    procedure mdDetCalcFields(DataSet: TDataSet);

  private
    PAttNum:String;
    PAttDate:TDate;

    procedure DelRsv(ASourceId:Integer; AWithDel:Boolean);
    procedure WMLayoutChanged(var M: TMessage); message WM_LAYOUTCHANGED;

  protected
    CloseMode: boolean;
    defCurrID: integer;
    FCurrNum,FWID,FKAID,FPersonId: Integer;
    FCurrPayNum,OldPayDocId: integer;
    FDefNum: Integer;
    FDocType: TDocType;
    FModified: boolean;
    FPayDocDate: TDateTime;
    FPaySummChange,FNotRsvPresent: Boolean;
    FReceived: String;
    FToDate: TDateTime;
    PayDocChecked: boolean;
    WHMode: Boolean;

    function  CheckDatesIn: Boolean;
    function  DoSetRsv(APosID, AMatID, AWID: Integer; AAmount: Extended; AResetToExisting: Boolean = False): Boolean; virtual;
    procedure GetSummAll; override;
    procedure SaveSerial(APosID: Integer); virtual;
    procedure SetAttDate(const Value: TDate);
    procedure SetAttNum(const Value: string);
    procedure SetID(const Value: integer);override;

    property FAttNum: string read PAttNum write SetAttNum;
    property FAttDate: TDate read PAttDate write SetAttDate;

  public
    procedure SetCaptions; override;
    procedure AddMats(const IDs: string); virtual;
  end;

var
  frmBaseWBDocOut: TfrmBaseWBDocOut;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  Serials, prConst, ClientData, fMessageDlg,
  ssFun, EditPositionMov, ssBaseDlg, prFun, ssBaseIntfDlg,
  KATurnover, EditMaterials, ssBaseTypes, ssRegUtils, ssStrUtil,
  okMoneyFun, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfrmBaseWBDocOut.DelRsv(ASourceId:Integer; AWithDel:Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.DelRsv') else _udebug := nil;{$ENDIF}

  while mdWMatTurn.Locate('sourceid',ASourceId,[] ) do mdWMatTurn.Delete;

  //Удаление из mdTmpIds и освобождение резерва для текущего sourceid
  with mdTmpIds do begin
    First;
    while not Eof do begin
      if (FieldByName('sourceid').AsInteger=ASourceId) then begin
        dmData.SConnection.AppServer.Rsv_Delete(FieldByName('tmpid').AsInteger);
        Delete;
      end
      else Next;
    end;//while not eof
  end;//with mdTmpIds

  //Освобождение редактируемых позиций (старых)
  mdWMatTurnOld.First;
  while not mdWMatTurnOld.Eof do begin
    if mdWMatTurnOld.FieldByName('sourceid').AsInteger=ASourceId then begin
      with newDataSet do
      try
        ProviderName := 'pWayBill_GetMatID_WID';
        FetchParams;
        Params.ParamByName('posId').AsInteger := mdWMatTurnOld.FieldByName('posid').AsInteger;
        Open;
        if not IsEmpty then begin
          mdTmpIds.Append;
          mdTmpIds.FieldByName('sourceid').AsInteger := mdWMatTurnOld.FieldByName('sourceid').AsInteger;
          mdTmpIds.FieldByName('amount').AsFloat := RoundToA(-strtofloat(mdWMatTurnOld.fieldbyname('amount').AsString), -3);
          mdTmpIds.FieldByName('posid').AsInteger := mdWMatTurnOld.FieldByName('posid').AsInteger;
          mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdWMatTurnOld.FieldByName('posid').AsInteger,Fields[0].AsInteger,Fields[1].AsInteger,0,RoundToA(-mdWMatTurnOld.FieldByName('amount').AsFloat, MatDisplayDigits));
          mdTmpIds.FieldByName('free').AsInteger := 0;
          mdTmpIds.FieldByName('forall').AsInteger := 0;
          mdTmpIds.Post;
        end;//if not IsEmpty
        Close;

      finally
        Free;
      end;
    end;//if

    mdWMatTurnOld.Next;
  end;//while not mdWMatTurnOld.Eof

  //Затирание в mdDet
  with mdDet do
  if Locate('posid', ASourceId,[]) then begin
    if AWithDel
    then Delete
    else begin
      Edit;

      if Self.ClassName <> 'TfrmEditOrderOut' then begin
        FieldByName('status').Clear;
        FieldByName('norm').Clear;
        FieldByName('currid').Clear;
        FieldByName('currname').Clear;
        FieldByName('ptypeid').Clear;
        FieldByName('price').Clear;
        FieldByName('discount').Clear;
        FieldByName('onvalue').Clear;
        FieldByName('ondate').Clear;
        FieldByName('nds').Clear;
        FieldByName('num').Clear;
        FieldByName('personid').Clear;
        FieldByName('SN').Clear;
        FieldByName('producer').Clear;
        FieldByName('gtd').Clear;
        FieldByName('certnum').Clear;
        FieldByName('certdate').Clear;
      end
      else begin
        FieldByName('status').AsInteger := 0;
      end;

      Post;
    end;
  end;//if

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.DataModified') else _udebug := nil;{$ENDIF}

  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.aSetTimeExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.aSetTimeExecute') else _udebug := nil;{$ENDIF}

  edTime.Time := Time;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    gbHeader.Caption := ' ' + GetRS('fmWaybill','MainInfo') + ' ';
    chbPosting.Properties.Caption := GetRS('fmWaybill','Posting');
    lNum.Caption := GetRS('fmWaybill','Num') + ':';
    lOndate.Caption := GetRS('fmWaybill','OnDate') + ':';
    lReason.Caption := GetRS('fmWaybill','Reason') + ':';

    aCIns.Caption := GetRS('Common','Add');
    aCIns.Hint := GetRS('fmWaybill','NewPos');
    aCUpd.Caption := GetRS('Common','Properties');
    aCUpd.Hint := GetRS('fmWaybill','EditPos');
    aCDel.Caption := GetRS('Common','Del');
    aCDel.Hint := GetRS('fmWaybill','PosDel');
    aSelectAll.Caption := GetRS('Common','SelectAll');
    aShowSN.Caption := GetRS('fmWaybill','SNs');
    aSetRsv.Caption := GetRS('fmWaybill','SetRsv');
    aSetRsvAll.Caption := GetRS('fmWaybill','SetRsvAll');
    aRemoveRsv.Caption := GetRS('fmWaybill','DelRsv');
    aRemoveRsvAll.Caption := GetRS('fmWaybill','RemoveRsvAll');

    colRecNo.Caption := GetRS('fmWaybill','NumEx');
    colStatus.Caption := '';
    colPosType.Caption := '';
    colMatName.Caption := GetRS('fmWaybill','MatName');
    colMeasureName.Caption := GetRS('fmWaybill','Measure');
    colAmount.Caption := GetRS('fmWaybill','Amount');
    colWHouseName.Caption := GetRS('fmWaybill','WHouse');
    colNorm.Caption := GetRS('fmWaybill', 'Norm');
    colPriceInCurr.Caption := GetRS('fmWaybill','Price');
    colSummCurr.Caption := GetRS('fmWaybill','SummCurr');

    edFind.InitRes;
    lNotes.Caption := GetRS('fmWaybill', 'Notes') + ':';
    lTotal.Caption := GetRS('fmWaybill', 'TotalIn') + ' ' + BaseCurrName;
    lTot.Caption := GetRS('fmWaybill', 'withNDS') + ':';
    lTotNDSOut.Caption := GetRS('fmWaybill', 'outNDS') + ':';
    lTotNDS.Caption := GetRS('fmWaybill', 'NDS') + ':';
  end;//with

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.aCInsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.aCInsExecute') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;

  with TfrmEditPositionMov.Create(nil) do
  try
    ParentNameEx := Self.ParentNameEx;
    ParentHandle := Self.Handle;
    Tag := integer(mdDet);
    OnDate := Self.OnDate;
    panMain.Tag := integer(mdWMatTurn);
    stMeasureName.Tag := integer(mdWMatTurnOld);
    stRemain.Tag := integer(mdTmpIds);
    FWID := Self.FWID;
    FKAID := Self.FKAID;
    FDocType := Self.FDocType;
    ID := 0;
    Screen.Cursor := crDefault;

  finally
    if not mdDet.IsEmpty then begin
      dbgWaybillDet.Enabled := true;
      dbgWaybillDet.SetFocus;
    end;
    Free;
    Screen.Cursor := crDefault;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.aCUpdExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.aCUpdExecute') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;

  with TfrmEditPositionMov.Create(nil) do
  try
    ParentNameEx := Self.ParentNameEx;
    ParentHandle := Self.Handle;
    Tag := integer(mdDet);
    OnDate := Self.OnDate;
    panMain.Tag := integer(mdWMatTurn);
    stMeasureName.Tag := integer(mdWMatTurnOld);
    stRemain.Tag := integer(mdTmpIds);
    FWID := mdDet.FieldByName('wid').AsInteger;
    FKAID := Self.FKAID;
    FDocType := Self.FDocType;

    ID := mdDet.FieldByName('posid').AsInteger;
    Screen.Cursor := crDefault;

  finally
    if not mdDet.IsEmpty then begin
      dbgWaybillDet.Enabled := true;
      dbgWaybillDet.SetFocus;
    end;
    Free;
    Screen.Cursor := crDefault;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.aCDelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.aCDelExecute') else _udebug := nil;{$ENDIF}

  aRemoveRsv.Tag := 1;
  aRemoveRsv.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.aSelectAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.aSelectAllExecute') else _udebug := nil;{$ENDIF}

  dbgWaybillDet.SelectAll;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.aShowSNExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.aShowSNExecute') else _udebug := nil;{$ENDIF}

  with TfrmSerials.Create(nil) do
  try
    colSN.DisableEditor := true;
    mdSN.Open;
    with mdWMatTurn do begin
      First;
      while not Eof do begin
        if (mdWMatTurn.FieldByName('sourceid').AsInteger = mdDet.FieldByName('posid').AsInteger)
          and not mdWMatTurn.FieldByName('SN').IsNull
        then begin
          mdSN.Append;
          mdSN.FieldByName('num').AsInteger := mdSN.RecNo;
          mdSN.FieldByName('sn').AsString := mdWMatTurn.FieldByName('SN').AsString;
          mdSN.Post;
        end;

        Next;
      end;//while
    end;//with

    if not mdSN.IsEmpty then begin
      mdSN.First;
      ShowModal;
    end;//if

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.aSetRsvExecute(Sender: TObject);
  var
    BM:TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.aSetRsvExecute') else _udebug := nil;{$ENDIF}

  inherited;

  if VarToInt(dbgWaybillDet.FocusedNode.Values[colPosType.Index]) = 1 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  if not FShowRsvMsgs or (ssMessageDlg(rs('fmWaybill','SetRsvConfirm'), ssmtWarning,[ssmbYes,ssmbNo]) = mrYes)
  then begin
    Application.ProcessMessages;

    if dbgWaybillDet.SelectedCount>1 then fProgress.Show;

    fProgress.Caption := rs('fmWaybill','SetRsvPr');
    fProgress.pbMain.Max := dbgWaybillDet.SelectedCount;
    mdDet.DisableControls;
    BM := mdDet.GetBookmark;
    mdDet.First;

    try
      while not mdDet.Eof do begin
        if (mdDet.FieldByName('status').AsInteger = 0) and (mdDet.FieldByName('postype').AsInteger <> 1)
           and(dbgWaybillDet.FindNodeByKeyValue(mdDet.FieldByName('posid').AsInteger).Selected)
        then begin
          fProgress.lText.Caption := mdDet.FieldByName('matname').AsString;
          fProgress.lText.Refresh;
          Application.ProcessMessages;

          DoSetRsv(mdDet.FieldByName('posid').AsInteger, mdDet.FieldByName('matid').AsInteger,
                   mdDet.FieldByName('wid').AsInteger, mdDet.FieldByName('amount').AsFloat);

          fProgress.pbMain.StepIt;
          Application.ProcessMessages;
        end;//if

        mdDet.Next;
      end;

    finally
      mdDet.GotoBookmark(BM);
      mdDet.FreeBookmark(BM);
      mdDet.EnableControls;
      fProgress.Hide;
      FGridRefresh := True;
      Application.ProcessMessages;
    end;
  end;//if ssMessageDlg...

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.aRemoveRsvExecute(Sender: TObject);
  var
    i:integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.aRemoveRsvExecute') else _udebug := nil;{$ENDIF}

  if VarToInt(dbgWaybillDet.FocusedNode.Values[colPosType.Index]) = 1 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  if (not Self.Visible)
     or
     (
      (
       (aRemoveRsv.Tag = 0) and (ssMessageDlg(rs('fmWaybill', 'DelRsvConfirm'), ssmtWarning,[ssmbYes,ssmbNo]) = mrYes)
      )
      or
      (
       (aRemoveRsv.Tag = 1)
       and
       (
        (
         (dbgWaybillDet.SelectedCount = 1)
         and
         (ssMessageDlg(rs('Common','DelConfirm'),ssmtWarning,[ssmbYes,ssmbNo]) = mrYes)
        )
        or
        (
         (dbgWaybillDet.SelectedCount > 1)
         and
         (mrYes = ssMessageDlg(Format(rs('Common', 'DelConfirmEx'),[dbgWaybillDet.SelectedCount]),ssmtWarning,[ssmbYes,ssmbNo]))
        )
       )
      )
     )
  then begin
    Application.ProcessMessages;
    Screen.Cursor := crSQLWait;

    if (dbgWaybillDet.SelectedCount > 1) and (Self.Visible) then fProgress.Show;

    if aRemoveRsv.Tag = 1
      then fProgress.Caption := rs('Common','Deleting')
      else fProgress.Caption := rs('fmWaybill','DelRsvPr');

    fProgress.Refresh;
    fProgress.pbMain.Max := dbgWaybillDet.SelectedCount;
    mdDet.DisableControls;

    try
      for i := 0 to dbgWaybillDet.SelectedCount - 1 do begin
        if (dbgWaybillDet.SelectedNodes[i].Values[colStatus.Index] <> 0) then begin
          fProgress.lText.Caption := dbgWaybillDet.SelectedNodes[i].Values[colMatName.Index];
          fProgress.lText.Refresh;
          Application.ProcessMessages;
          DelRsv(dbgWaybillDet.SelectedNodes[i].Values[colPosId.Index],aRemoveRsv.Tag = 1);
          Application.ProcessMessages;
        end;

        fProgress.pbMain.StepIt;
      end;//for

    finally
      mdDet.EnableControls;
      SelectFocusedNode;
      fProgress.Hide;
      FGridRefresh := True;
      Screen.Cursor := crDefault;
    end;
  end;//if  ssMessageDlg...
  aRemoveRsv.Tag := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.aSetRsvAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.aSetRsvAllExecute') else _udebug := nil;{$ENDIF}

  aSelectAll.Execute;
  aSetRsv.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.aRemoveRsvAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.aRemoveRsvAllExecute') else _udebug := nil;{$ENDIF}

  aSelectAll.Execute;
  aRemoveRsv.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.dbgWaybillDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.dbgWaybillDetGetOptionsTitle') else _udebug := nil;{$ENDIF}

  ImgList := dmData.Images;

  case FDocType of
    dtWBMove:begin
      AText := rs('fmWaybill','DocWBMove');
      AIndex := II_WBMove;
    end;

    dtWriteOff:begin
      AText := rs('fmWaybill','DocWriteOff');
      AIndex := II_WRITEOFF;
    end;

    dtReturnOut:begin
      AText := rs('fmWaybill','DocWBRetOut');
      AIndex := II_WBRETOUT;
    end;
  end;//case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.GetSummAll;
  var
    BM:TBookmark;
    SummDefOutNDS,SummDefNDS,AllSummDefOutNDS,AllSummDef,AllSummDefNDS:Extended;
    btmp:Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.GetSummAll') else _udebug := nil;{$ENDIF}

  btmp := FPosModified;
  mdDet.DisableControls;
  BM := mdDet.GetBookmark;

  if not mdDet.Active then mdDet.Open;

  mdDet.First;
  AllSummDefOutNDS := 0;
  AllSummDefNDS := 0;
  AllSummDef := 0;
  FNotRsvPresent := False;

  with mdDet do
  try
    while not Eof do begin
      Edit;
      try
        if mdWMatTurn.Locate('sourceid',FieldByName('posid').AsInteger,[]) then begin
          FieldByName('status').AsInteger := 1;
          //if mdWMatTurn.FieldByName('sn').IsNull then FieldByName('sn').Clear
          //  else FieldByName('sn').AsString := mdWMatTurn.FieldByName('sn').AsString;
        end
        else begin
          FieldByName('status').Clear;
          //FieldByName('sn').Clear;
          FNotRsvPresent := True;
        end;

        try
          if not FieldByName('price').IsNull
            then FieldByName('summcurr').AsFloat := RoundToA(FieldByName('amount').AsFloat * FieldByName('price').AsFloat, -2)
            else FieldByName('summcurr').Clear;
        except
          FieldByName('summcurr').Clear;
        end;

        if not FieldByName('price').IsNull then begin
          NDSCalc(1, FieldByName('price').AsFloat*FieldByName('onvalue').AsFloat,
                    FieldByName('nds').AsFloat,1, SummDefOutNDS, SummDefNDS);

          FieldByName('PriceDef').AsFloat := RoundToA(SummDefOutNDS + SummDefNDS, -2);
          FieldByName('PriceDefWONDS').AsFloat := RoundToA(SummDefOutNDS+SummDefNDS,-2) - RoundToA(SummDefNDS,-2);

          NDSCalc(FieldByName('amount').AsFloat,FieldByName('price').AsFloat*FieldByName('onvalue').AsFloat,
                    FieldByName('nds').AsFloat,1,SummDefOutNDS, SummDefNDS);

          AllSummDefOutNDS := AllSummDefOutNDS+SummDefOutNDS;
          AllSummDefNDS := AllSummDefNDS+RoundToA(SummDefNDS,-2);
          //Сумма в нац. валюте с НДС;
          AllSummDef := AllSummDef+RoundToA(SummDefOutNDS+SummDefNDS,-2);
          FieldByName('summdef').AsFloat := RoundToA(SummDefOutNDS + SummDefNDS,-2);
          FieldByName('summnds').AsFloat := RoundToA(SummDefNDS,-2);
          FieldByName('summWONDS').AsFloat := FieldByName('summdef').AsFloat-RoundToA(SummDefNDS,-2);
        end
        else begin
          FieldByName('PriceDef').Clear;
          FieldByName('PriceDefWONDS').Clear;
          FieldByName('summdef').Clear;
          FieldByName('summnds').Clear;
          FieldByName('summWONDS').Clear;
        end;
        Post;

      except
        Cancel;
      end;
      Next;
    end;//while

    AllSummDef := RoundToA(AllSummDef, -2);
    AllSummDefOutNDS := AllSummDef - AllSummDefNDS;
    lSummDefNoNDS.Caption := FormatFloat(MoneyDisplayFormat, AllSummDefOutNDS);
    lSummDefNoNDS.Hint := lSummDefNoNDS.Caption;
    lSummDefNDS.Caption := FormatFloat(MoneyDisplayFormat, AllSummDefNDS);
    lSummDefNDS.Hint := lSummDefNDS.Caption;
    lSummDef.Caption := FormatFloat(MoneyDisplayFormat, AllSummDef);
    lSummDef.Hint := lSummDef.Caption;
    AllSumm := AllSummDef;

  finally
    GotoBookmark(BM);
    FreeBookmark(BM);
    EnableControls;
    FPosModified := btmp;
  end;

  FGridRefresh := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.ActionListUpdate') else _udebug := nil;{$ENDIF}

  inherited;
  chbPay.Enabled := not PayDocChecked;
  aSetRsv.Enabled := not mdDet.IsEmpty;
  aSetRsvAll.Enabled := not mdDet.IsEmpty;
  aRemoveRsv.Enabled := not mdDet.IsEmpty;
  aRemoveRsvAll.Enabled := not mdDet.IsEmpty;

  if FGridRefresh then begin
    GetSummAll;

    if (not PayDocChecked) and (chbPay.Checked) and (not FPaySummChange) and (dbgWaybillDet.Tag <> 0)
    then begin
      edPaySumm.Tag := 1;
      edPaySumm.Value := roundtoa(ALLSUMM,-2);
      edPaySumm.Tag := 0;
    end;

    dbgWaybillDet.Tag := dbgWaybillDet.Tag+1;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.SetID(const Value: integer);
  var
    FNeedCheck, FAutoNum:Boolean;
    FPrefix, FSuffix:String;
    BM:TBookmark;
    tmpId:Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmBaseWBDocOut.SetID') else _udebug := nil;{$ENDIF}

  inherited;

  FKAID := 0;
  FPersonId := 0;
  FAttNum := '';
  FAttDate := MinDateTime;

  mdTmpIds.Close;
  mdTmpIds.Open;

  Fid := Value;

  FNeedCheck := False;
  FAutoNum := False;
  FPrefix := '';
  FSuffix := '';

  with newDataSet do
  try
    mdWMatTurn.Close;
    mdWMatTurn.Open;
    mdWMatTurnOld.CopyFromDataSet(mdWMatTurn);
    mdDet.Close;
    mdDet.Open;

    case FDocType of
      dtWBMove:
        begin
          FNeedCheck := WBMoveChecked;
          FAutoNum := WBMoveAutoNum;
          FPrefix := WBMovePrefix;
          FSuffix := WBMoveSuffix;
        end;

      dtWriteOff:
        begin
          FNeedCheck := WriteOffChecked;
          FAutoNum := WriteOffAutoNum;
          FPrefix := WriteOffPrefix;
          FSuffix := WriteOffSuffix;
        end;

      dtReturnOut:
        begin
          FNeedCheck := ReturnOutChecked;
          FAutoNum := ReturnOutAutoNum;
          FPrefix := ReturnOutPrefix;
          FSuffix := ReturnOutSuffix;
        end;

      dtOrderOut:
        begin
          FNeedCheck := False;
          FAutoNum := OrdersOutAutoNum;
          FPrefix := OrdersOutPrefix;
          FSuffix := OrdersOutSuffix;
        end;
    end;//case

    chbPosting.Checked := FNeedCheck;

    if (Value = 0) or IsPattern then begin
      if FAutoNum then begin
        FCurrNum := GetDocNum(dmData.SConnection, FDocType, 1);
        edNum1.Text := FPrefix + IntToStr(FCurrNum) + FSuffix;
      end
      else edNum1.Text := '';
    end;

    edDate.Date := OnDate;
    edTime.Time := Time;
    edReason.Text := '';

    if Value > 0 then begin
      // Чтение оборотов
      ProviderName := 'pWMatTurnOut_Get';
      FetchParams;

      if IsPattern
        then Params.ParamByName('wbillid').AsInteger := -1
        else Params.ParamByName('wbillid').AsInteger := FID;

      Open;
      mdWMatTurn.CopyFromDataSet(Fields[0].DataSet);
      Close;

      mdWMatTurnOld.CopyFromDataSet(mdWMatTurn.Fields[0].DataSet);

      if IsPattern then begin
        mdWMatTurn.Close;
        mdWMatTurnOld.Close;
      end;

      // Чтение header
      ProviderName := 'pWaybill_Get';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := Value;
      Open;

      if not IsEmpty then begin
        if not IsPattern then begin
          edNum1.Text := fieldbyname('num').AsString;
          edDate.Date := fieldbyname('ondate').AsDateTime;
          edTime.Time := fieldbyname('ondate').AsDateTime;
        end;

        if not FieldByName('kaid').IsNull then FKAID := FieldByName('kaid').AsInteger;
        if not FieldByName('personid').IsNull then FPersonId := FieldByName('personid').AsInteger;
        if not FieldByName('received').IsNull then FReceived := FieldByName('received').AsString;

        FAttNum := FieldByName('attnum').AsString;
        FAttDate := FieldByName('attdate').AsDateTime;
        FDefNum := FieldByName('defnum').AsInteger;
        edReason.Text := FieldByName('reason').AsString;
        edNotes.Text := FieldByName('notes').AsString;

        if not FieldByName('currid').IsNull then begin
          cbCurr.KeyValue := FieldByName('currid').AsInteger;
          edRate.Value := FieldByName('onvalue').AsFloat;
        end;

        FToDate := FieldByName('todate').AsDateTime;

        if not IsPattern
          then chbPosting.Checked := FieldByName('CHECKED').AsInteger = 1
          else chbPosting.Checked := False;
      end;//if
      Close;

      // Чтение detail
      ProviderName := 'pWaybillDet_GetNull';
      FetchParams;
      Params.ParamByName('WBILLID').AsInteger := FID;
      Open;
      mdDet.LoadFromDataSet(Fields[0].DataSet);

      if not mdDet.IsEmpty then mdDet.First;

      if dbgWaybillDet.FocusedNode <> nil then dbgWaybillDet.FocusedNode.Selected := True;

      Close;

      if IsPattern then begin
        mdDet.First;
        while not mdDet.Eof do begin
          tmpId := dsNextPosID(mdDet.Fields[0].DataSet);
          mdDet.Edit;
          mdDet.FieldByName('posid').AsInteger := tmpId;
          mdDet.Post;
          mdDet.Next;
        end;//while  not mdDet.Eof

        //aRemoveRsvAll.Execute;
        mdDet.First;
        dbgWaybillDet.FocusedNode.Selected := True;
      end;//if IsPattern then begin
    end;

  finally
    Free;
    FGridRefresh := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.CtrlEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.CtrlEnter') else _udebug := nil;{$ENDIF}

  FCurrCtrl := Sender as TControl;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.CtrlExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.CtrlExit') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.aCurActionExecute(Sender: TObject);
  var
    aid:Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.aCurActionExecute') else _udebug := nil;{$ENDIF}

  if FCurrCtrl = chbPosting
  then chbPosting.Checked := (not chbPosting.Checked)
  else if FCurrCtrl=edDate then begin
    if edDate.DroppedDown
      then edDate.Date := Date
      else edDate.DroppedDown := True;
  end
  else if FCurrCtrl = lcbCashDesks then begin
    try aid := lcbCashDesks.KeyValue; except aid := 0; end;

    lcbCashDesks.SetFocus;
    ShowModalRef(Self, rtCashDesks, vtCashDesks, 'TfmCashDesks', Self.OnDate, aid);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.colStatusGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.colStatusGetText') else _udebug := nil;{$ENDIF}

  if AText = '' then AText := '-1';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.FormDestroy(Sender: TObject);
  var
    Temp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.FormDestroy') else _udebug := nil;{$ENDIF}

  inherited;

  dmData.SConnection.AppServer.Rsv_Delete(-1);
  edFind.SaveToRegistry(MainRegKey + '\' + Self.ClassName + '\PosFind');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.dbgWaybillDetDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.dbgWaybillDetDblClick') else _udebug := nil;{$ENDIF}

  inherited;

  if aCUpd.Enabled then aCUpd.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.Button1Click(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.Button1Click') else _udebug := nil;{$ENDIF}

   with newDataSet do
   try
     ProviderName := 'pSysRsv_List';
     Open;
     Button1.Caption := IntToStr(Fields[0].DataSet.RecordCount);
     mdTMPRSV.CopyFromDataSet(Fields[0].DataSet);
     Close;

   finally
     Free;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.mdDetCalcFields(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.mdDetCalcFields') else _udebug := nil;{$ENDIF}

  inherited;

  with DataSet do
  if not FieldByName('price').IsNull then begin
    if not aShowRealPrice.Checked then begin
      FieldByName('pricecurrtxt').AsString := FormatFloat(MoneyDisplayFormat,FieldByName('price').AsFloat);
      FieldByName('summcurrtxt').AsString := FormatFloat(MoneyDisplayFormat,FieldByName('summcurr').AsFloat);
    end
    else begin
      FieldByName('pricecurrtxt').AsString := FloatToStr(FieldByName('price').AsFloat);
      FieldByName('summcurrtxt').AsString := FloatToStr(FieldByName('summcurr').AsFloat);
    end;

    FieldByName('pricecurrtxt').AsString := FieldByName('pricecurrtxt').AsString + ' ' + FieldByName('currname').AsString;
    FieldByName('summcurrtxt').AsString := FieldByName('summcurrtxt').AsString + ' ' + FieldByName('currname').AsString;
  end
  else begin
    FieldByName('pricecurrtxt').Clear;
    FieldByName('summcurrtxt').Clear;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.aShowRealPriceExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.aShowRealPriceExecute') else _udebug := nil;{$ENDIF}

  inherited;

  FGridRefresh := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.aBallanceExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.aBallanceExecute') else _udebug := nil;{$ENDIF}

  inherited;

  if not ShowBallance then begin
    AccessDenied;
      begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  end;

  if FKAID > 0 then
  with TfrmKATurnover.Create(nil) do
  try
    ParentNameEx := 'fmKAgent';
    OnDate := Self.OnDate;
    ID := FKAID;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.aMatInfoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.aMatInfoExecute') else _udebug := nil;{$ENDIF}

  inherited;

  if (dbgWaybillDet.SelectedCount <> 1)
      or (dbgWaybillDet.SelectedNodes[0].Values[colPType.Index] <> 0)
  then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmEditMaterials.Create(nil) do
    try
      ParentNameEx := 'fmMaterials';
      OnDate := Self.OnDate;
      ID := dbgWaybillDet.SelectedNodes[0].Values[colMatID.Index];
      CanModify := False;
      ShowModal;
    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.aPrintExecute(Sender: TObject);
  var
    FSumWONDS, FNDS, FSumWithNDS, FAmount: Extended;
    frfName:String;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.aPrintExecute') else _udebug := nil;{$ENDIF}

  if mdDet.IsEmpty then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  mdDet.DisableControls;
  try
    mdReport.CopyFromDataSet(mdDet);

    mdReport.First;
    while not mdReport.Eof do begin
      mdReport.Edit;
      FAmount := mdReport.FieldByName('amount').AsFloat;

      if (mdReport.FieldByName('postype').AsInteger = 1) and (mdReport.FieldByName('norm').AsFloat > 1)
        then FAmount := FAmount * mdReport.FieldByName('norm').AsFloat;

      mdReport.FieldByName('amount').AsFloat := FAmount;
      mdReport.Post;
      mdReport.Next;
    end;

    if PrintType=0 then begin
      mdReport.Close;
      with TFloatField.Create(mdReport) do  begin
        FieldName := 'price2';
        FieldKind := fkData;
        Required := false;
        DataSet := mdReport;
        mdReport.FieldDefs.Add(FieldName,ftFloat,0,false);
      end;//with
      mdReport.LoadFromDataSet(mdDet);

      mdReport.First;
      while not mdReport.Eof do begin
        mdReport.Edit;
        mdReport.FieldByName('price2').AsFloat := mdReport.FieldByName('price').AsFloat;
        FAmount := mdReport.FieldByName('amount').AsFloat;

        if (mdReport.FieldByName('postype').AsInteger = 1) and (mdReport.FieldByName('norm').AsFloat > 1)
          then FAmount := FAmount * mdReport.FieldByName('norm').AsFloat;

        mdReport.FieldByName('amount').AsFloat := FAmount;
        NDSCalc(1, mdReport.FieldByName('price').AsFloat,
          mdReport.FieldByName('nds').AsFloat, 1, FSumWONDS, FNDS);
        FSumWithNDS := RoundToA(FSumWONDS + FNDS, -2);
        FSumWONDS := RoundToA(FSumWithNDS - FNDS, -2);
        mdReport.FieldByName('price').AsFloat := FSumWONDS;//NDSOut(mdReport.FieldByName('price').AsFloat,mdReport.FieldByName('nds').AsFloat);
        mdReport.Post;
        mdReport.Next;
      end;//while
    end;//if PrintType=0

    FGridRefresh := True;
    with frDoc do begin
      case FDocType of
        dtWBMove:    frfName := 'Waybill_Mov.frf';
        dtWriteOff:  frfName := 'WriteOff.frf';
        dtReturnOut: frfName := 'Return_Out.frf';
      end;//case

      SmartShowRep(frDoc, frfName);
    end;

  finally
    mdDet.EnableControls;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.WMLayoutChanged(var M: TMessage);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.WMLayoutChanged') else _udebug := nil;{$ENDIF}

  edFind.SetLng;

  for i := 0 to gbHeader.ControlCount - 1 do
    if gbHeader.Controls[i] is TokSearchEdit
      then TokKASearchEdit(gbHeader.Controls[i]).SetLng;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.FormCreate(Sender: TObject);
  var
    Temp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  FShowRsvMsgs := True;
  lSummCurr.Caption := '';
  lSummDef.Caption := '';
  lSummDefNDS.Caption := '';
  lSummDefNoNDS.Caption := '';

  edFind.SetLng;
  edFind.LoadFromRegistry(MainRegKey + '\' + Self.ClassName + '\PosFind');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmBaseWBDocOut.CheckDatesIn: Boolean;
  var
    eStr, eStr2,m :String;
    i:integer; tmpMaxDate:TDateTime;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.CheckDatesIn') else _udebug := nil;{$ENDIF}

  try
    m := '';
    eStr := '';
    eStr2 := '';

    if not mdWMatTurn.IsEmpty then begin
      with mdWMatTurn do begin
        First;
        while not Eof do begin
          if m = ''
            then m := m + IntToStr(fieldbyname('posid').AsInteger)
            else m := m + ',' + IntToStr(fieldbyname('posid').AsInteger);
          Next;
        end;
      end;

      with newDataSet do
      try
        ProviderName := 'pWaybill_TurnDateMin';
        FetchMacros;
        Macros.ParamByName('m').AsString := m;
        FetchParams;
        Params.ParamByName('ondate').AsDateTime := edDate.Date+edTime.Time;
        Open;
        if not IsEmpty then begin
          tmpMaxDate := MinDateTime;

        //Формирование сообщения
          for i := 0 to dbgWaybillDet.Count-1  do begin
            eStr2 := '';
            mdWMatTurn.First;

            while not mdWMatTurn.Eof do begin
              if mdWMatTurn.FieldByName('sourceid').AsInteger=dbgWaybillDet.Items[i].Values[colPosid.Index]
                 and Locate('posid',mdWMatTurn.fieldbyname('posid').AsInteger,[])
              then begin
                if eStr2 = ''
                  then eStr2 := eStr2 + Fields[1].AsString
                  else eStr2 := eStr2 + ', ' + Fields[1].AsString;
                if tmpMaxDate < Fields[1].AsDateTime then  tmpMaxDate := Fields[1].AsDateTime;
              end;//if
              mdWMatTurn.Next;
            end;

            if eStr2 <> '' then
               eStr := eStr + amountPrefix + inttostr(dbgWaybillDet.Items[i].Values[colRecNo.Index]) + ' '
                       + rs('fmWaybill','AccErr1') + eStr2 + #13;

          end;//for

          eStr := Format(rs('fmWaybill', 'AccErr2'),[DateTimeToStr(edDate.Date + edTime.Time),
          #13,eStr,#13,DateTimeToStr(tmpMaxDate)]);

          if ssMessageDlg(eStr,ssmtWarning,[ssmbYes,ssmbNo])=mrYes
          then begin
            edDate.Date := tmpMaxDate;
            edTime.Time := tmpMaxDate;
 //sbEditTime.Caption := FormatDateTime('hh:mm',frac(tmpMaxDate));
            Result := true;
          end
          else Result := false;
        end//if not IsEmpty
        else Result := true;

         Close;

       finally
         Free;
      end;
    end//if not mdWMatTurn.IsEmpty then begin
    else Result := true;

  except
    Result := false;
    raise;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.dbgWaybillDetCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.dbgWaybillDetCustomDrawCell') else _udebug := nil;{$ENDIF}

  //  inherited;

  if Odd(ANode.Index) and not ASelected then AColor := GridOddLinesColor;

  if {(not CloseMode) and }(ANode.Values[colPType.Index] = 0) and chbPosting.Checked and ANode.Values[colStatus.Index] = null
    then AFont.Color := clRed;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.chbPostingPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.chbPostingPropertiesChange') else _udebug := nil;{$ENDIF}

  inherited;
  DataModified(Self);
  dbgWaybillDet.Repaint;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.frDocEndDoc;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.frDocEndDoc') else _udebug := nil;{$ENDIF}

  GetSummAll;
  dbgWaybillDet.Invalidate;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.frDocGetValue(const ParName: String; var ParValue: Variant);
  var
    FSumm, FNDS, FWONDS, FAmount: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.frDocGetValue') else _udebug := nil;{$ENDIF}

  if 0 = AnsiCompareText(ParName, 'docnum') then ParValue := edNum1.Text
  else if 0 = AnsiCompareText(ParName, 'docdate') then ParValue := edDate.Text
  else if 0 = AnsiCompareText(ParName, 'entname') then ParValue := EntName
  //else if 0 = AnsiCompareText(ParName, 'kafullname') then ParValue := edKAgent.Text
  else if 0 = AnsiCompareText(ParName, 'PriceDisplayFormatEx') then ParValue := PriceDisplayFormatEx
  else if 0 = AnsiCompareText(ParName, 'reason') then ParValue := edReason.Text
  else if 0 = AnsiCompareText(ParName, 'curnds') then ParValue := NDS
  else if 0 = AnsiCompareText(ParName, 'printtype') then ParValue := PrintType
  else if 0 = AnsiCompareText(ParName, 'possum') then begin
    FAmount := mdReport.FieldByName('amount').AsFloat;
    {if (mdReport.FieldByName('postype').AsInteger = 1) and
         (mdReport.FieldByName('norm').AsFloat > 1)
       then FAmount := FAmount * mdReport.FieldByName('norm').AsFloat;
    }
    if PrintType = 0 then begin
      NDSCalc(FAmount, mdReport.FieldByName('price2').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
              mdReport.FieldByName('nds').AsFloat, 1, FWONDS, FNDS);

      FSumm := RoundToA(FWONDS+FNDS, -2);
      //FWONDS := RoundToA(FSumm - FNDS, -2);
      FWONDS := FSumm - FNDS;
      ParValue := RoundToA(FWONDS, -2);
    end
    else begin
      NDSCalc(FAmount, mdReport.FieldByName('price').AsFloat * mdReport.FieldByName('onvalue').AsFloat,
              mdReport.FieldByName('nds').AsFloat, 1, FWONDS, FNDS);

      ParValue := RoundToA(FWONDS + FNDS, -2);
    end;
  end

  else if 0 = AnsiCompareText(ParName, 'propis') then begin
    FSumm := StrToFloat(DelChars(lSummDef.Caption, [ThousandSeparator]));
    ParValue := MoneyToStr(FSumm);
  end
  //else if 0 = AnsiCompareText(ParName, 'personname') then ParValue := lcbPersonName.Text
  //else if 0 = AnsiCompareText(ParName, 'received') then ParValue := cbReceived.Text
  //else if 0 = AnsiCompareText(ParName, 'att') then ParValue := lAttNum.Caption
  else if 0 = AnsiCompareText(ParName, 'sumnds') then ParValue := lSummDefNDS.Caption
  else if 0 = AnsiCompareText(ParName, 'sumall') then ParValue := lSummDef.Caption;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.SetAttDate(const Value: TDate);
  var
    AStr:String;
    tmpCtrl:TControl;
    i:integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.SetAttDate') else _udebug := nil;{$ENDIF}

  if PAttDate <> Value then begin
    PAttDate := Value;
    try
      if trim(FAttNum) <> ''
        then AStr := amountPrefix + rs('fmWaybill','AttNum')+' ' + FAttNum + rs('fmWaybill', 'AttDate', 3) + DateToStr(FAttDate)
        else AStr := '';
    except
      AStr := '';
    end;
    FModified := true;

    tmpCtrl := nil;

    for i := 0 to gbHeader.ControlCount-1 do
      if gbHeader.Controls[i].Name = 'lAttNum' then tmpCtrl := gbHeader.Controls[i];

    //tmpCtrl := gbHeader.FindComponent('lattnum');
    if tmpCtrl <> nil
    then with tmpCtrl as TssBevel do begin
      Caption := AStr;
      Hint := AStr;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.SetAttNum(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.SetAttNum') else _udebug := nil;{$ENDIF}

  if PAttNum<>Value then begin
    PAttNum := Value;
    FModified := true;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.chbPayPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.chbPayPropertiesChange') else _udebug := nil;{$ENDIF}

  // Заполнение полей
  if chbPay.Enabled then begin
    if (chbPay.Checked) then begin
      if PDInAutoNum and (OldPayDocID = 0) then begin
        FCurrPayNum := GetDocNum(dmData.SConnection, dtPDIn, 1);
        edPayNum.Text := PDInPrefix + IntToStr(FCurrPayNum) + PDInSuffix;
      end
      else edPayNum.Text := FPayNum;

      edPaySumm.Tag := 1;
      edPaySumm.Value := roundtoa(ALLSUMM,-2);
      edPaySumm.Tag := 0;
      cbPayCurr.KeyValue := BaseCurrID;
    end//if (chbPay.Checked)
    else begin
      if PDInAutoNum and (OldPayDocID = 0) then begin
        if GetDocNum(dmData.SConnection, dtPDIn, 0) = FCurrPayNum
          then GetDocNum(dmData.SConnection, dtPDIn, -1);
      end;

      edPayNum.Text := '';
      edPaySumm.Tag := 1;
      edPaySumm.Value := 0;
      edPaySumm.EditText := '';
      edPaySumm.Tag := 0;
      cbPayCurr.KeyValue := BaseCurrID;
      FPaySummChange := false;
    end;//else

    FPayDocModified := true;
  end;//if chbPay.Enabled

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.AddMats(const IDs: string);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.AddMats') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.colAmountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.colAmountGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MatDisplayFormat, StrToFloat(AText));
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.FormActivate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.FormActivate') else _udebug := nil;{$ENDIF}

  inherited;

  if IsPattern and (aSetRsvAll.Tag<>1) then begin
    aSetRsvAll.Tag := 1;
    aSetRsvAll.Execute;
    dbgWaybillDet.ClearSelection;
    dbgWaybillDet.FocusedNode.Selected := True;
    FPosModified := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.cbCurrPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.cbCurrPropertiesChange') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmBaseWBDocOut.DoSetRsv(APosID, AMatID, AWID: Integer; AAmount: Extended; AResetToExisting: Boolean): Boolean;
 var
   PAmount,curAmount,idsAmount,oldAmount:Extended;
   PMatID,PWID,PID:Integer;
   PArtikul,PWHName,PMsrName,PMatName,eStr:String;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.DoSetRsv') else _udebug := nil;{$ENDIF}

  Result := True;
  
  PAmount := RoundToA(mdDet.FieldByName('amount').AsFloat,MatDisplayDigits);
  PMatID := mdDet.FieldByName('matid').AsInteger;
  PWID := mdDet.FieldByName('wid').AsInteger;
  PWHName := mdDet.FieldByName('whname').AsString;
  PMsrName := mdDet.FieldByName('msrname').AsString;
  PMatName := mdDet.FieldByName('matname').AsString;
  PArtikul := mdDet.FieldByName('artikul').AsString;


  //Удаляем резерв sourceid ????????????
  DelRsv(mdDet.FieldByName('posid').AsInteger,False);

  GetMatRestsByKAorWID(dmData.SConnection,PMatID,FKAID,PWID,MaxDateTime,Integer(mdPosition),ChargeType);

  if (mdPosition.IsEmpty or (RoundToA(GetDSSumm(mdPosition,'amount'),MatDisplayDigits)<PAmount)) then begin
    if dbgWaybillDet.SelectedCount > 1 then begin
      eStr := rs('fmWaybill', 'RsvErrorPr1') + '.' + ' ' + IntToStr(mdDet.RecNo) + '. ' + mdDet.FieldByName('matname').AsString + #13
              + rs('fmWaybill','RsvErrorPr2');

      if (Self.Visible) and (not FShowRsvMsgs or (ssMessageDlg(eStr, ssmtError,[ssmbYes,ssmbNo])<>mrYes)) then begin
        fProgress.Hide;
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
        //Break;
      end;
    end
    else if Self.Visible and FShowRsvMsgs
         then ssMessageDlg(rs('fmWaybill','RsvErrorPr1')+' '+mdDet.FieldByName('matname').AsString+'. ',ssmtError,[ssmbOK]);

    mdPosition.Close;
  end//if mdPos.IsEmpty
  else begin
    //Резервирование
    mdPosition.First;
    while PAmount>0 do begin
      //Запись в mdDet
      with mdDet do begin
        if mdPosition.RecNo=1 then begin
          PID := FieldByName('posid').AsInteger;
          Edit;
        end
        else begin
          PID := dsNextPosID(Fields[0].DataSet);
          Insert;
        end;
        FieldByName('posid').AsInteger := PID;
        FieldByName('status').AsInteger := 1;
        FieldByName('postype').AsInteger := 0;
        FieldByName('status').AsInteger := 1;
        FieldByName('matid').AsInteger := PMatID;
        FieldByName('matname').AsString := PMatName;
        FieldByName('artikul').AsString := PArtikul;
        FieldByName('wid').AsInteger := PWID;
        FieldByName('whname').AsString := PWHName;

        if PAmount <= RoundToA(mdPosition.FieldByName('amount').AsFloat,MatDisplayDigits)
          then curAmount := PAmount
          else curAmount := RoundToA(mdPosition.FieldByName('amount').AsFloat,MatDisplayDigits);

        FieldByName('amount').AsFloat := curAmount;

        FieldByName('msrname').AsString := PMsrName;
        if Self.ClassName <> 'TfrmEditOrderOut' then begin
          FieldByName('price').AsFloat := mdPosition.FieldByName('price').AsFloat;
          FieldByName('currid').AsInteger := mdPosition.FieldByName('currid').AsInteger;
          FieldByName('discount').AsFloat := mdPosition.FieldByName('discount').AsFloat;
          FieldByName('NDS').AsFloat := mdPosition.FieldByName('NDS').AsFloat;
          FieldByName('ondate').AsDateTime := mdPosition.FieldByName('ondate').AsDateTime;
          FieldByName('onvalue').AsFloat := mdPosition.FieldByName('onvalue').AsFloat;
          FieldByName('currname').AsString := mdPosition.FieldByName('currname').AsString;
        end;

        if not mdPosition.FieldByName('sn').IsNull
          then FieldByName('sn').AsString := mdPosition.FieldByName('sn').AsString
          else FieldByName('sn').Clear;

        if not mdPosition.FieldByName('producer').IsNull
          then FieldByName('producer').AsString := mdPosition.FieldByName('producer').AsString
          else FieldByName('producer').Clear;

        if not mdPosition.FieldByName('gtd').IsNull
          then FieldByName('gtd').AsString := mdPosition.FieldByName('gtd').AsString
          else FieldByName('gtd').Clear;

        if not mdPosition.FieldByName('certnum').IsNull
          then FieldByName('certnum').AsString := mdPosition.FieldByName('certnum').AsString
          else FieldByName('certnum').Clear;

        if not mdPosition.FieldByName('certdate').IsNull
          then FieldByName('certdate').AsDateTime := mdPosition.FieldByName('certdate').AsDateTime
          else FieldByName('certdate').Clear;

        Post;
      end;//with TdxMemData(pointer(Tag))
       //??????????
      //Удаление из mdTmpIds и освобождение резерва для текущего sourceid
      with mdTmpIds do begin
        First;
        while not Eof do begin
          if (FieldByName('sourceid').AsInteger = PID)
              and (FieldByName('posid').AsInteger = mdPosition.FieldByName('posid').AsInteger)
          then begin
            dmData.SConnection.AppServer.Rsv_Delete(FieldByName('tmpid').AsInteger);
            Delete;
          end else Next;
        end;//while not eof
      end;//with mdTmpIds

      //3)Запись в dmWMT
      with mdWMatTurn do begin
        Append;
        FieldByName('posid').AsInteger := mdPosition.FieldByName('posid').AsInteger;
        FieldByName('matid').AsInteger := mdPosition.FieldByName('matid').AsInteger;
        FieldByName('wid').AsInteger := mdPosition.FieldByName('wid').AsInteger;
        FieldByName('sourceid').AsInteger := PID;
        FieldByName('amount').AsFloat := curAmount;
        FieldByName('ondate').Clear;

        if not mdPosition.FieldByName('sn').IsNull
          then FieldByName('sn').AsString := mdPosition.FieldByName('sn').AsString
          else FieldByName('sn').Clear;
        Post;
      end;// with mdWMT do begin
      idsAmount := 0;
      oldAmount := 0;
      //5)Получаем сумму из "старого резерва"
      if mdWMatTurnOld.Locate('posid;sourceid',VarArrayOf([mdPosition.fieldbyname('posid').AsInteger, PID]),[])
        then oldAmount := RoundToA(mdWMatTurnOld.FieldByName('amount').AsFloat, MatDisplayDigits);

      //6)Получаем сумму для текущего posid в mdTmpIds
      with mdTmpIds do begin
        First;
        while not Eof do begin
          if FieldByName('posid').AsInteger=mdPosition.FieldByName('posid').AsInteger
            then idsAmount := RoundToA(idsAmount+FieldByName('amount').AsFloat,MatDisplayDigits);

          Next;
        end;//while
      end;//with mdTmpIds

      if oldAmount>0 then begin
        if curAmount>oldAmount then begin
          if idsAmount<0 then begin
            if -idsAmount>(curAmount-oldAmount) then begin
              with mdTmpIds do begin
                Append;
                FieldByName('sourceid').AsInteger := PID;
                FieldByName('posid').AsInteger := mdPosition.FieldByName('posid').AsInteger;
                //Разница для себя
                FieldByName('amount').AsFloat := curAmount - OldAmount;

                FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(FieldByName('posid').AsInteger, PMatID, PWID, 0,
                                                                                       FieldByName('amount').AsFloat);

                FieldByName('free').AsInteger := 0;
                FieldByName('forall').AsInteger := 0;
                Post;
              end;
            end
            else begin
              with mdTmpIds do begin
                Append;
                FieldByName('sourceid').AsInteger := PID;
                FieldByName('posid').AsInteger := mdPosition.FieldByName('posid').AsInteger;
                //Доступное кол-во для себя TmpAmount*-1
                FieldByName('amount').AsFloat := -idsAmount;

                FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(FieldByName('posid').AsInteger, PMatID, PWID, 0,
                                                                                       FieldByName('amount').AsFloat);

                FieldByName('free').AsInteger := 0;
                FieldByName('forall').AsInteger := 0;
                Post;
                if (curAmount - OldAmount + idsAmount) <> 0 then begin
                  Append;
                  FieldByName('sourceid').AsInteger := PID;
                  FieldByName('posid').AsInteger := mdPosition.FieldByName('posid').AsInteger;
                  //Разницу для всех
                  FieldByName('amount').AsFloat := curAmount - OldAmount + idsAmount;

                  FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(FieldByName('posid').AsInteger, PMatID, PWID, 1,
                                                                                         FieldByName('amount').AsFloat);

                  FieldByName('free').AsInteger := 0;
                  Post;
                end;//if RoundToA...
              end;//with mdTmpIds do begin
            end;//else
          end
          else begin
            with mdTmpIds do begin
              Append;
              FieldByName('sourceid').AsInteger := PID;
              FieldByName('posid').AsInteger := mdPosition.FieldByName('posid').AsInteger;
              //Разница для всех
              FieldByName('amount').AsFloat := curAmount - oldAmount;

              FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(FieldByName('posid').AsInteger, PMatID, PWID, 1,
                                                                                     FieldByName('amount').AsFloat);

              FieldByName('free').AsInteger := 0;
              FieldByName('forall').AsInteger := 1;
              Post;
            end;//with mdTmpIds
          end;//else
        end
        else begin
          if (curAmount-oldAmount)<>0 then begin
            with mdTmpIds do begin
              Append;
              FieldByName('sourceid').AsInteger := PID;
              FieldByName('posid').AsInteger := mdPosition.FieldByName('posid').AsInteger;
              //Разница для себя
              FieldByName('amount').AsFloat := curAmount - oldAmount;

              FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(FieldByName('posid').AsInteger, PMatID, PWID, 0,
                                                                                     FieldByName('amount').AsFloat);

              FieldByName('free').AsInteger := 0;
              FieldByName('forall').AsInteger := 0;
              Post;
            end;//with
          end;//if
        end;//else
      end//if OldAmount>0
      else begin
        if idsAmount < 0 then begin
          if -idsAmount > curAmount then begin
            with mdTmpIds do begin
              Append;
              FieldByName('sourceid').AsInteger := PID;
              FieldByName('posid').AsInteger := mdPosition.FieldByName('posid').AsInteger;
              //Всё кол-во для себя
              FieldByName('amount').AsFloat := curAmount;

              FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(FieldByName('posid').AsInteger, PMatID, PWID, 0,
                                                                                     FieldByName('amount').AsFloat);

              FieldByName('free').AsInteger := 0;
              FieldByName('forall').AsInteger := 0;
              Post;
            end;//with
          end//if
          else begin
            with mdTmpIds do begin
              Append;
              FieldByName('sourceid').AsInteger := PID;
              FieldByName('posid').AsInteger := mdPosition.FieldByName('posid').AsInteger;
              //Доступное кол-во для себя
              FieldByName('amount').AsFloat := -idsAmount;
              FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(FieldByName('posid').AsInteger,PMatID,PWID,0,FieldByName('amount').AsFloat);
              FieldByName('free').AsInteger := 0;
              FieldByName('forall').AsInteger := 0;
              Post;
              if (curAmount - (idsAmount * -1) <> 0) then begin
                Append;
                FieldByName('sourceid').AsInteger := PID;
                FieldByName('posid').AsInteger := mdPosition.FieldByName('posid').AsInteger;
                //Разницу для всех
                FieldByName('amount').AsFloat := curAmount + idsAmount;

                FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(FieldByName('posid').AsInteger, PMatID, PWID, 1,
                                                                                       FieldByName('amount').AsFloat);

                FieldByName('free').AsInteger := 0;
                FieldByName('forall').AsInteger := 1;
                Post;
              end;//if
            end;//with
          end;//else
        end//if
        else begin
          with mdTmpIds do begin
            Append;
            FieldByName('sourceid').AsInteger := PID;
            FieldByName('posid').AsInteger := mdPosition.FieldByName('posid').AsInteger;
            //Всё кол-во для всех
            FieldByName('amount').AsFloat := curAmount;

            FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(FieldByName('posid').AsInteger, PMatID, PWID, 1,
                                                                                   FieldByName('amount').AsFloat);

            FieldByName('free').AsInteger := 0;
            FieldByName('forall').AsInteger := 1;
            Post;
          end;//with
        end;//else
      end;//else if OldAmount>0
      PAmount := RoundToA(PAmount-curAmount,MatDisplayDigits);
      if PAmount>0 then mdPosition.Next;
    end;//while PAmount>0 do begin
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.aActivateFindExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.aActivateFindExecute') else _udebug := nil;{$ENDIF}

  edFind.Editor.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.SaveSerial(APosID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.SaveSerial') else _udebug := nil;{$ENDIF}

  if mdDet.FieldByName('sn').AsString = '' then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with newDataSet.Create(nil) do
  try
    ProviderName := 'rSN_Ins';
    FetchParams;
    Params.ParamByName('sid').AsInteger := GetMaxID(dmData.SConnection, 'serials', 'sid');
    Params.ParamByName('posid').AsInteger := APosID;
    Params.ParamByName('serialno').AsString := mdDet.fieldbyname('sn').AsString;
    Execute;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseWBDocOut.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseWBDocOut.FormCloseQuery') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('ssBaseWBDocOut', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
