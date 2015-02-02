{$I ok_sklad.inc}
unit fWaybillOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseWBDoc, dxExEdtr6, DB, ssDataSource, DBClient, prTypes,
  ssClientDataSet, TB2Item, Menus, ActnList, dxInspRw, dxInspct, dxCntner6,
  cxPC, cxDropDownEdit, ssDBLookupCombo, cxImageComboBox,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxCalendar,
  ssSpeedButton, StdCtrls, dxDBGrid6, dxTL6, dxDBCtrl6, dxDBTLCl6, dxGrClms6,
  ssBevel, ExtCtrls, ssDBGrid, ssBaseTypes, ssPeriod, okPeriod,
  ssMemDS, dxExEdtr, dxCntner;

type
  TfmWaybillOut = class(TfmBaseWBDoc)
    aAddTaxWB: TAction;
    aCreateInvoice: TAction;
    aDetCreateInvoice: TAction;
    aPrintDef: TAction;
    aPrintInvoice: TAction;
    aPrintOrder: TAction;
    aPrintTorg12: TAction;
    aPrintWarrantyDoc: TAction;
    aPrintWarrantyDocCustom: TAction;
    aPrintWork: TAction;
    cdsDetailcardnum: TStringField;
    cdsDetailCERTDATE: TDateTimeField;
    cdsDetailCERTNUM: TStringField;
    cdsDetailDISCOUNT: TFloatField;
    cdsDetailGRPID: TIntegerField;
    cdsDetailGTD: TStringField;
    cdsDetailholder: TStringField;
    cdsDetailNORM: TFloatField;
    cdsDetailNUM: TIntegerField;
    cdsDetailPOSTYPE: TIntegerField;
    cdsDetailproducer: TStringField;
    cdsDetailrsv: TIntegerField;
    cdsDetailSN: TStringField;
    cdsDetailTAX: TStringField;
    cdsDetailWPERIOD: TIntegerField;
    cdsDetailWPERIODTYPE: TIntegerField;
    cdsEnts_: TssClientDataSet;
    cdsFind: TssClientDataSet;
    cdsMainADDRESS: TStringField;
    cdsMainATTDATE: TDateTimeField;
    cdsMainATTNUM: TStringField;
    cdsMainCHECKED: TIntegerField;
    cdsMainCITY: TStringField;
    cdsMainCOUNTRY: TStringField;
    cdsMainCURRID: TIntegerField;
    cdsMainCURRNAME: TStringField;
    cdsMainCURRRATE: TFloatField;
    cdsMainDEFNUM: TIntegerField;
    cdsMainDISTRICT: TStringField;
    cdsMainDOCID: TIntegerField;
    cdsMaindocsaldo: TFloatField;
    cdsMainEMAIL: TStringField;
    cdsMainENTID: TIntegerField;
    cdsMainentname: TStringField;
    cdsMainFAX: TStringField;
    cdsMainKAFULLNAME: TStringField;
    cdsMainKAID: TIntegerField;
    cdsMainKANAME: TStringField;
    cdsMainKAPHONE: TStringField;
    cdsMainKATYPE: TIntegerField;
    cdsMainNDS: TFloatField;
    cdsMainNOTES: TStringField;
    cdsMainNUM: TStringField;
    cdsMainnumex: TIntegerField;
    cdsMainONDATE: TDateTimeField;
    cdsMainPERSONID: TIntegerField;
    cdsMainPERSONNAME: TStringField;
    cdsMainPOSTINDEX: TStringField;
    cdsMainREASON: TStringField;
    cdsMainRECEIVED: TStringField;
    cdsMainSUMMALL: TFloatField;
    cdsMainSUMMINCURR: TFloatField;
    cdsMainSUMMPAY: TFloatField;
    cdsMainTODATE: TDateTimeField;
    cdsMainWBILLID: TIntegerField;
    cdsMainWTYPE: TIntegerField;
    cdsMainWWW: TStringField;
    colDiscount: TdxDBGridColumn;
    colEnt: TdxDBGridColumn;
    colNumEx: TdxDBGridColumn;
    colPType: TdxDBGridImageColumn;
    colRsv: TdxDBGridImageColumn;
    colSN: TdxDBGridColumn;
    colWarrantyPeriod: TdxDBGridColumn;
    colWarrantyPeriodType: TdxDBGridColumn;
    colWarrantyStatus: TdxDBGridColumn;
    irAtt: TdxInspectorTextRow;
    irEnt: TdxInspectorTextRow;
    itmPrintWork: TTBItem;
    itmSvcInfo: TTBItem;
    itmWarrantyDoc: TTBItem;
    pmPrint: TTBPopupMenu;
    TBItem10: TTBItem;
    TBItem11: TTBItem;
    TBItemPrintInvoice: TTBItem;
    TBItem13: TTBItem;
    TBItem14: TTBItem;
    TBItem15: TTBItem;
    TBItem16: TTBItem;
    TBItem17: TTBItem;
    TBItemCreateInvoice: TTBItem;
    TBItemDetCreateInvoice: TTBItem;
    TBItem22: TTBItem;
    TBItem24: TTBItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    TBItemPrintTorg12: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBSeparatorItem5: TTBSeparatorItem;
    TBSeparatorItem8: TTBSeparatorItem;
    mnuPrint: TTBSubmenuItem;
    TBSubmenuItem2: TTBSubmenuItem;

    procedure aAddPayDocExecute(Sender: TObject);
    procedure aAddTaxWBExecute(Sender: TObject);
    procedure aCreateInvoiceExecute(Sender: TObject);
    procedure aPrintDefExecute(Sender: TObject);
    procedure aPrintInvoiceExecute(Sender: TObject);
    procedure aPrintOrderExecute(Sender: TObject);
    procedure aPrintTorg12Execute(Sender: TObject);
    procedure aPrintWarrantyDocCustomExecute(Sender: TObject);
    procedure aPrintWarrantyDocExecute(Sender: TObject);
    procedure aPrintWorkExecute(Sender: TObject);
    procedure cdsDetailCalcFields(DataSet: TDataSet);
    procedure cdsMainAfterOpen(DataSet: TDataSet);
    procedure cdsMainBeforeOpen(DataSet: TDataSet);
    procedure cdsMainCalcFields(DataSet: TDataSet);
    procedure colDiscountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPriceCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure colSNGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colSummInCurrGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colWarrantyPeriodGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colWarrantyStatusCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure colWarrantyStatusGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colWHouseNameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure FrameResize(Sender: TObject);
    procedure grdDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure grdDetNeedAdjust(Sender: TObject); override;
    procedure grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure pmDetPopup(Sender: TObject);
    procedure srcMainDelayedDataChange(Sender: TObject; Field: TField);

  private
    procedure GetTaxes;
    procedure colTaxGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colTaxRateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    function CheckOrdered(AID: Integer): Boolean;

  protected
    procedure GetSummAll; override;
    procedure UpdatePos; override;

  public
    procedure SetCaptions; override;
    procedure DoOpen(AParam: Variant); override;
    procedure DoDelete; override;
    procedure DoCheck(EditRequest: Boolean); override;
    procedure DoPrint(AParam: integer = 0); override;
    procedure DoPrintPopup(X, Y: Integer); override;
    procedure DoFind(const AFName, AStr: string; ALocateType: TLocateType; AFwd: Boolean = True); override;
    procedure NotifyChanged; override;
    procedure UpdateActionList; override;
  end;

var
  fmWaybillOut: TfmWaybillOut;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  ssDateUtils, prRep, EditWaybillOut, prConst, ClientData, fMessageDlg,
  ssCallbackConst, prFun, ssFun, ssBaseConst, EditTaxWB, StrUtils,
  BaseFrame, BaseRef, DocsList, EditServices, EditPayDoc, ssStrUtil,
  DateUtils, EditInvoice, Udebug, xLngDefs;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfmWaybillOut.DoOpen(AParam: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.DoOpen') else _udebug := nil;{$ENDIF}

  GetTaxes;
  _ID_ := 'wbillid';
  EditingClass := TfrmEditWaybillOut;
  RefType := prTypes.rtWBOut;

  case CountryRules.AR of
    accRul_UA: aAddTaxWB.Visible := True;

    accRul_RU: TBItemPrintTorg12.Visible := True;

    else begin
      aAddTaxWB.Visible := False; // UA only
      TBItemPrintTorg12.Visible := False; // RU only

      TBItemPrintInvoice.Visible := True;
      TBItemCreateInvoice.Visible := True;
      TBItemDetCreateInvoice.Visible := True;
    end;
  end;

  inherited;

  colRsv.Width := 25;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.SetCaptions') else _udebug := nil;{$ENDIF}

  FNoALUpdate := True;

  with LangMan do begin
    FindList.Clear;
    FindList.AddObject(GetRS('fmWaybill', 'FiltNum') + ';' + 'num', pointer(1));
    FindList.AddObject(GetRS('fmWaybill', 'FiltDate') + ';' + 'ondate', pointer(2));
    FindList.AddObject(GetRS('fmWaybill', 'FiltKAOut') + ';' + 'kaname', pointer(3));
    FindList.AddObject(GetRS('fmWaybill', 'FiltWarrantyDoc') + ';' + 'warrantydoc', pointer(4));
    FindList.AddObject(GetRS('fmWaybill', 'SerialD') + ';' + 'serialno', pointer(5));

    inherited;

    Self.Caption := GetRS('fmWaybill', 'TitleWaybillOuts');

    aAddTaxWB.Caption := GetRS('fmWaybill', 'AddFromOutToTaxWB');
    aCreateInvoice.Enabled := True;
    aCreateInvoice.Caption := GetRS('fmWaybill', 'CreateInvoice');
    aDetCreateInvoice.Caption := GetRS('fmWaybill', 'CreateInvoice');

    aPrint.Caption := GetRS('Common', 'Print');
    mnuPrint.Caption := GetRS('Common', 'Print');
    aPrintDef.Caption := GetRS('fmWaybill', 'DocWBOut');
    aPrintInvoice.Caption := GetRS('fmWaybill', 'DocInvoice');
    aPrintTorg12.Caption := GetRS('fmWaybill', 'Torg12');
    aPrintOrder.Caption := GetRS('fmWaybill', 'PrintOrder');
    aPrintWork.Caption := GetRS('fmWaybill', 'PrintWork');
    aPrintWarrantyDoc.Caption := GetRS('fmWaybill', 'WarrantyDocEx');
    aPrintWarrantyDocCustom.Caption := GetRS('fmWaybill', 'WarrantyDocEx');

    colPType.Caption := '';
    colName.Caption := GetRS('Common', 'Client');
    colMatName.Caption := GetRS('fmWaybill', 'MatSvc');
    colWHouseName.Caption := GetRS('fmWaybill', 'WHNorm');
    colDiscount.Caption := GetRS('fmWaybill', 'Discount');
    colSN.Caption := GetRS('fmWaybill', 'SN');
    colWarrantyPeriod.Caption := GetRS('fmWaybill', 'WarrantyPeriod');
    colWarrantyStatus.Caption := GetRS('fmWaybill', 'Warranty');
    colEnt.Caption := GetRS('fmWaybill', 'Ent');
    colRsv.Caption := GetRS('fmWMat', 'Reserved');

    irKAgent.Caption := GetRS('Common', 'Customer');
    irPerson.Caption := GetRS('fmWaybill', 'PersonnameOut');
    irAtt.Caption := GetRS('fmWaybill', 'Att');
    irEnt.Caption := GetRS('fmWaybill', 'Ent');
  end;

  FNoALUpdate := False;

  Application.ProcessMessages;
  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.cdsMainAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.cdsMainAfterOpen') else _udebug := nil;{$ENDIF}

  inherited;
  CanRefresh := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.cdsMainBeforeOpen(DataSet: TDataSet);
  var
    M: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.cdsMainBeforeOpen') else _udebug := nil;{$ENDIF}

  DSRefresh(cdsEnts_, 'kaid', 0);
  M := '';

  with cdsMain do begin
    if (lcbKAgent.KeyValue <> lcbKAgent.EmptyValue) and panFilter.Visible
      then Params.ParamByName('in_kaid').AsInteger := lcbKAgent.KeyValue
      else Params.ParamByName('in_kaid').AsInteger := 0;

    case cbChecked.EditValue of
      0: Params.ParamByName('in_checked').AsInteger := -1;
      1: Params.ParamByName('in_checked').AsInteger := 1;
      2: Params.ParamByName('in_checked').AsInteger := 0;
    end;

    Params.ParamByName('wh').AsString := AllowedWH;

    if MultiEntsViewType = 1
      then Params.ParamByName('in_entid').AsInteger := CurrEnt.KAID
      else Params.ParamByName('in_entid').AsInteger := 0;

    Params.ParamByName('shownullbalance').AsInteger := Integer(aShowNullBallance.Checked);
    Params.ParamByName('in_wtype').AsInteger := -1;

    if panFilter.Visible
      then Params.ParamByName('in_fromdate').AsDateTime := prdMain.FromDate
      else Params.ParamByName('in_fromdate').AsDateTime := 0;

    if panFilter.Visible
      then Params.ParamByName('in_todate').AsDateTime := LastSecondInDay(prdMain.ToDate)
      else Params.ParamByName('in_todate').AsDateTime := MaxDateTime;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.DoPrint(AParam: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.DoPrint') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.DoDelete;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.DoDelete') else _udebug := nil;{$ENDIF}

  try // finally
    if not GetUserAccessByClass(Self.ClassName, uaDelete) then begin
      ssMessageDlg(rs('Common', 'CantDelete'), ssmtError, [ssmbOK]);
      Exit;
    end;

    if mrYes <> ssMessageDlg(rs('fmWaybill', 'DelWayBillOut') + ' ' + cdsMain.fieldbyname('num').AsString + '?', ssmtWarning, [ssmbYes, ssmbNo])
    then Exit;

    with newDataSet do
     try
       Application.ProcessMessages;

       TrStart;
       try
         // если накладная по счёту - исправляем резерв для счёта
         if not cdsMain.FieldByName('todate').IsNull then begin
           ProviderName := 'pWaybill_UpdAccRsv';
           FetchParams;
           Params.ParamByName(_ID_).AsInteger := cdsMain.fieldbyname(_ID_).AsInteger;
           Execute;
         end;

         // 1 )Удаляем из оборотов
         ProviderName := 'pWMatTurn_Del';
         FetchParams;
         Params.ParamByName(_ID_).AsInteger := cdsMain.fieldbyname(_ID_).AsInteger;
         Execute;  //Удалили из wmatturn

         if not DeleteDataEx(dmData.SConnection, 'waybilllist', 'wbillid', cdsMain.fieldbyname(_ID_).AsInteger)
           then raise Exception.Create(rs('Common', 'DeleteError'));

         if not DelToRecycleBin
           then TrCommit
           else begin
             TrRollback;

             if not cdsMain.FieldByName('todate').IsNull
                and (ssMessageDlg(rs('fmWaybill', 'DelAccRel'), ssmtWarning, [ssmbYes, ssmbNo]) <> mrYes)
             then Exit;

             if not AddToRecycleBin(dmData.SConnection, Self.ClassName, cdsMain.fieldbyname(_ID_).AsInteger, GetDelStr(cdsMain.fieldbyname(_ID_).AsInteger), false, Self.FunID)
             then begin
               ssMessageDlg(rs('Common','DeleteError'), ssmtError, [ssmbOk]);
               Exit;
             end;
           end;

         LocateAfterDel;
         DoRefresh(0);
         SendMessage(ParentHandle, WM_REFRESHBIN, 0, 0);
         RefreshFun('TfmAccOut', 0);
         RefreshFun('TfmOrders', -16);
         RefreshFun('TfmWMat', 0);
         UpdateActionList;

         if RefreshAllClients then begin
           dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WBIN);
           dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
         end;

      except
        on e:exception do begin
          TrRollback;
          ssMessageDlg(rs('Common', 'NoDelete') + #10#13 + e.Message, ssmtError, [ssmbOk]);
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
procedure TfmWaybillOut.DoCheck(EditRequest: Boolean);
  var
    WBillID, OrderID: Integer;
    eStr: string;
    mtTmp: TssmdType;
    fCheckRsv: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.DoCheck') else _udebug := nil;{$ENDIF}

  if not GetUserAccessByClass(Self.ClassName, uaPost) then begin
    ssMessageDlg(rs('Common', 'CantPost'), ssmtError, [ssmbOK]);
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  fCheckRsv := False;

  with newDataSet do
  try
    WBillID := cdsMain.FieldByName('wbillid').AsInteger;

    try
      ProviderName := 'pDocsRel_WB_WB_Get';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := WBillID;
      Params.ParamByName('doctype').AsInteger := -16;
      Open;

      if not IsEmpty
        then OrderID := FieldByName('wbillid').AsInteger
        else OrderID := 0;

      Close;

      if grdMain.FocusedNode.Values[colChecked.Index] = 0 then
      begin
        ProviderName := 'pWayBillRsv_Check';
        FetchParams;
        Params.ParamByName('WBILLID').AsInteger := WBILLID;
        Open;
        fCheckRsv := IsEmpty;
        Close;

        if fCheckRsv then begin
          if ssMessageDlg(rs('Common','CheckConfirm'),ssmtWarning,[ssmbYes,ssmbNo]) = mrYes
          then begin
            Application.ProcessMessages;
            Screen.Cursor := crSQLWait;
            //1)wmatturn
            if not CheckOrdered(WBillID) then begin
              ssMessageDlg(rs('fmOrders', 'CantShipOrderedPos'), ssmtError, [ssmbOk]);
              {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
              Exit;
            end;

            TrStart;
            ProviderName := 'pWMatTurnType_Upd';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := WBILLID;
            Params.ParamByName('TurnType').AsInteger := -1;
            Execute;
            //2) CHECKED=1
            ProviderName := 'pWaybillCheck_Set1';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := WBILLID;
            Execute;

            // если накладная по счёту - правим остатки по позициям
            if not cdsMain.FieldByName('todate').IsNull then begin
              ProviderName := 'pWaybill_UpdAccPos';
              FetchParams;
              Params.ParamByName('wbillid').AsInteger := WBillID;
              Execute;
            end;

            if OrderID > 0 then begin
              ProviderName := 'pOrder_UpdStatus';
              FetchParams;
              Params.ParamByName('wbillid').AsInteger := OrderID;
              Params.ParamByName('checked').AsInteger := 1;
              Execute;
            end;

            TrCommit;

            if pcMain.ActivePage <> tsDocRel then DSRefresh(cdsRel, 'docid', 0);

            if cdsRel.Locate('doctype', -8, [])
              then DoRecalcContract(dmData.SConnection,cdsRel.FieldByName('docid').AsInteger);

            DoRecalcKASaldo(dmData.SConnection,
               cdsMain.FieldByName('kaid').AsInteger,
               cdsMain.FieldByName('ondate').AsDateTime,rs('fmWaybill','RecalcBallance'));

            DoRecalcDCByWB(dmData.SConnection, WBillID);
            DoRefresh(0);
            RefreshFun('TfmAccOut', 0);
            RefreshFun('TfmWMat', 0);
            RefreshFun('TfmDiscCards', 0);

            if OrderID > 0 then RefreshFun('TfmOrders', -16);

            UpdateActionList;
            {if RefreshAllClients then begin
              dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WBOUT);
              dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
              dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_KAGENTS);
            end;}
          end;
        end //if fCheckRsv then begin
        else begin
          if mrYes = ssMessageDlg(rs('fmWaybill','NotRsv'), ssmtError, [ssmbYes, ssmbNo])
          then begin
            Application.ProcessMessages;
            aProperties.Execute;
          end;
        end;
      end  //if grdMain.FocusedNode.Values[colChecked.Index] = 0 then
      else begin
        ProviderName := 'pRetOut_Check';
        FetchParams;
        Params.ParamByName('WBILLID').AsInteger := WBILLID;
        Open;

        if Fields[0].AsInteger > 0 then begin
          Screen.Cursor := crDefault;

          if mrYes = ssMessageDlg(rs('fmWaybill','CheckOut') + #13 + rs('fmWaybill','CheckOut2'), ssmtError, [ssmbYes, ssmbCancel])
          then begin
            Close;
            Screen.Cursor := crSQLWait;
            ProviderName := 'pRetCheck_Ret';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := WBILLID;
            Open;

            if not IsEmpty then begin
              with TfrmDocsList.Create(nil) do
              try
                mdDocsList.CopyFromDataSet(Fields[0].DataSet);
                GetCounts;
                mdDocsList.First;
                dbgListDet.FullExpand;
                Caption := rs(Name,'DocsList_Title') + ' "' + rs('fmWaybill','TitleWaybillOut') + ' ?'
                           + cdsMain.fieldbyname('num').AsString + rs('fmWaybill','AttDate',3)
                           + cdsMain.FieldByName('ondate').AsString + '"';
                Screen.Cursor := crDefault;
                ShowModal;
                
              finally
                Free;
              end;
            end;//if not IsEmpty then begin
          end;//if 'checkout'
        end //if Fields[0].AsInteger > 0
        //----------------------------------------------
        else begin
          Close;
          {if cdsMain.fieldbyname('todate').AsFloat > 0 then begin
            Close;
            ProviderName := 'pWaybill_Get';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := round(cdsMain.fieldbyname('todate').AsFloat);
            Open;
            estr := rs('fmWaybill','UnCheckWBOut1')+#13;
            eStr := eStr+'?'+FieldByName('num').AsString+' '+rs('fmWaybill','AttDate')+' '+FieldByName('ondate').AsString+'.'+#13;
            eStr := eStr+rs('fmWaybill','UnCheckWBOut2');
            Close;
            mtTmp := ssmtWarning;
          end
          else begin
          }
            eStr := rs('Common', ifThen(EditRequest, 'PostedEditConfirm', 'UncheckConfirm'));
            mtTmp := ssmtWarning;
          //end;

          if ssMessageDlg(eStr, mtTmp, [ssmbYes, ssmbNo]) = mrYes then begin
            Application.ProcessMessages;
            Screen.Cursor := crSQLWait;
            TrStart;

            ProviderName := 'pWMatTurnType_Upd';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := WBILLID;
            Params.ParamByName('TurnType').AsInteger := 2;
            Execute;
            {if cdsMain.fieldbyname('todate').AsFloat>0 then begin
              ProviderName := 'pWaybillCheck_Set0';
              FetchParams;
              Params.ParamByName('WBILLID').AsInteger := Round(cdsMain.fieldbyname('todate').AsFloat);
              Execute;
            end;
            if cdsMain.fieldbyname('todate').AsFloat>0 then
              ProviderName := 'pWaybillCheck_Set00'
            else }ProviderName := 'pWaybillCheck_Set0';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := WBILLID;
            Execute;

            // если накладная по счёту - правим остатки по позициям
            if not cdsMain.FieldByName('todate').IsNull then begin
              ProviderName := 'pWaybill_UpdAccPos';
              FetchParams;
              Params.ParamByName('wbillid').AsInteger := WBillID;
              Execute;
            end;

            if OrderID > 0 then begin
              ProviderName := 'pOrder_UpdStatus';
              FetchParams;
              Params.ParamByName('wbillid').AsInteger := OrderID;
              Params.ParamByName('checked').AsInteger := 2;
              Execute;
            end;

            TrCommit;

            DoRefresh(0);
            RefreshFun('TfmAccOut', 0);
            RefreshFun('TfmWMat', 0);
            RefreshFun('TfmDiscCards', 0);

            if OrderID > 0 then RefreshFun('TfmOrders', -16);

            if pcMain.ActivePage <> tsDocRel then DSRefresh(cdsRel, 'docid', 0);

            if cdsRel.Locate('doctype', -8, []) then DoRecalcContract(dmData.SConnection,cdsRel.FieldByName('docid').AsInteger);

            DoRecalcKASaldo(dmData.SConnection,
              cdsMain.FieldByName('kaid').AsInteger,
              cdsMain.FieldByName('ondate').AsDateTime, rs('fmWaybill','RecalcBallance'));

            DoRecalcDCByWB(dmData.SConnection, WBillID);
            UpdateActionList;

            {if RefreshAllClients then begin
              dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WBOUT);
              dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
              dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_KAGENTS);
            end;
            }
          end;
        //*********************************
        end;//if Fields[0].AsInteger>0
      end;

    //dmData.SConnection.AppServer.q_Add(CA_REFRESH,CA_WMAT);
    finally
      Screen.Cursor := crDefault;
      Free;
    end;
    
  except
    on e:exception do begin
      TrRollback;
      ssmessagedlg(e.Message, ssmtError, [ssmbOk]);
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.aAddTaxWBExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.aAddTaxWBExecute') else _udebug := nil;{$ENDIF}

 Screen.Cursor := crSQLWait;

 with TfrmEditTaxWB.Create(nil) do
 try
   MainHandle := Self.Handle;
   ID := 0;

   //chbCheckNDS.Checked := cdsMain.fieldbyname('nds').AsFloat > 0;
   edDate.Date := cdsMain.fieldbyname('ondate').AsDateTime;
   OnDate := edDate.Date;
   edCondition.Text := rs('fmWaybill','TitleWaybillOut')+' '+amountPrefix+cdsMain.fieldbyname('num').AsString;
   lcbPersonName.KeyValue := cdsMain.fieldbyname('personid').AsInteger;
   edKAgent.KAID := cdsMain.FieldByName('kaid').AsInteger;
   chbCheckNDS.Checked := CurrEnt.NDSPayer;
   //SendMessage(Handle,WM_REFRESH,cdsMain.fieldbyname('kaid').AsInteger,integer(rtkagent));

   SetCaptions;
   WBillID := cdsMain.FieldByName(_ID_).AsInteger;

   //*****************************
   // чтение позиций в mdDet
   with newDataSet do
   try
     ProviderName := 'pTaxWBDet_GetOut';
     FetchParams;
     Params.ParamByName('WBILLID').AsInteger := cdsMain.fieldbyname('WBILLID').AsInteger;
     Open;
     mdDet.CopyFromDataSet(Fields[0].DataSet);
     Close;

   finally
     Free;
   end;

   ShowModal;

 finally
   Screen.Cursor := crDefault;
   Free;
 end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.colNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.colNumGetText') else _udebug := nil;{$ENDIF}

  AText := ANode.Values[colNumEx.Index];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.cdsMainCalcFields(DataSet: TDataSet);
  var
    FNum: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.cdsMainCalcFields') else _udebug := nil;{$ENDIF}

  try
    FNum := DataSet.FieldByName('num').AsString;

    if Pos(WBOutPrefix, FNum) = 1
      then DataSet.FieldByName('numex').AsInteger :=
           StrToInt(Trim(Copy(FNum, Length(WBOutPrefix) + 1, Length(FNum) - Length(WBOutPrefix) - Length(WBOutSuffix))))
      else DataSet.FieldByName('numex').AsInteger := StrToInt(FNum);

  except
    DataSet.FieldByName('numex').AsInteger := 0;
  end;

  DataSet.FieldByName('docsaldo').AsCurrency := DataSet.FieldByName('summall').AsFloat - DataSet.FieldByName('summpay').AsFloat;

  if cdsEnts_.Locate('kaid', DataSet.FieldByName('entid').AsInteger, [])
    then DataSet.FieldByName('entname').AsString := cdsEnts_.FieldByName('name').AsString;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.aPrintDefExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.aPrintDefExecute') else _udebug := nil;{$ENDIF}

  xRep.ShowRep(prRep.rtWBOut, cdsMain.FieldByName(_ID_).AsInteger);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.aPrintInvoiceExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.aPrintInvoiceExecute') else _udebug := nil;{$ENDIF}

  xRep.ShowRep(prRep.rtWBOutInvoice, cdsMain.FieldByName(_ID_).AsInteger);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.DoPrintPopup(X, Y: Integer); 
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.DoPrintPopup') else _udebug := nil;{$ENDIF}

  pmPrint.Popup(X, Y);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.colWHouseNameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.colWHouseNameGetText') else _udebug := nil;{$ENDIF}

  if ANode.Values[colPType.Index] = 1
    then AText := VarToStr(ANode.Values[colNorm.Index]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.grdMainCustomDrawCell') else _udebug := nil;{$ENDIF}

  inherited;

  if (AColumn = colWHouseName) and (ANode.Values[colPType.Index] = 1) then begin
    if VarIsNull(ANode.Values[colNorm.Index]) or (ANode.Values[colNorm.Index] = 0) then begin
      AText := '-';
      AAlignment := taCenter;
    end
    else AAlignment := taRightJustify;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.pmDetPopup(Sender: TObject);
 var
   FPosType: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.pmDetPopup') else _udebug := nil;{$ENDIF}

  FPosType := cdsDetail.FieldByName('postype').AsInteger;
  itmMatInfo.Visible := (FPosType = 0);
  itmMatMove.Visible := (FPosType = 0);
  itmMatRsv.Visible := (FPosType = 0);
  itmFindAtMats.Visible := (FPosType = 0);
  itmFindAtSvc.Visible := (FPosType = 1);
  itmMC.Visible := (FPosType = 0);
  itmSvcInfo.Visible := (FPosType = 1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.aPrintTorg12Execute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.aPrintTorg12Execute') else _udebug := nil;{$ENDIF}

  xRep.ShowRep(prRep.rtWBTorg12, cdsMain.FieldByName(_ID_).AsInteger);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.aPrintOrderExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.aPrintOrderExecute') else _udebug := nil;{$ENDIF}

  xRep.ShowRep(prRep.rtWBOutOrder, cdsMain.FieldByName(_ID_).AsInteger);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.colDiscountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.colDiscountGetText') else _udebug := nil;{$ENDIF}

  AText := AText + ' %';

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.colPriceCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  var
    disc: Double;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.colPriceCustomDrawCell') else _udebug := nil;{$ENDIF}

  try
    disc := StrToFloat(trim(ReplaceStr(ANode.Values[colDiscount.Index], '%', '')));

    if (disc > 0) and not ASelected then AFont.Color := clBlue;

  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.grdDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.grdDetGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := rs('fmWaybill', 'DocWBOut');
  ImgList := dmData.Images;
  AIndex := II_WBOUT;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.grdMainGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := rs('frmOptions', 'WBOut');
  ImgList := dmData.Images;
  AIndex := II_WBOUT;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.aAddPayDocExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.aAddPayDocExecute') else _udebug := nil;{$ENDIF}

  if cdsMain.FieldByName('docsaldo').AsCurrency <= 0 then begin
    ssMessageDlg(rs('fmWaybill', 'CantAddPay'), ssmtError, [ssmbOK]);
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  with TfrmEditPayDoc.Create(nil) do
  try
    GrpID := 1;
    ParentNameEx := 'fmPayDoc';
    MainHandle := Self.Handle;
    WType := -1;
    ID := 0;
    edTotal.Value := cdsMain.FieldByName('docsaldo').AsCurrency;
    WBillID := Self.cdsMain.FieldByName(_ID_).AsInteger;
    edReason.Text := rs('fmWaybill', 'DocWBOut') + amountPrefix + Self.cdsMain.FieldByName('num').AsString;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.aPrintWorkExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.aPrintWorkExecute') else _udebug := nil;{$ENDIF}

  xRep.ShowRep(prRep.rtWBOutWork, cdsMain.FieldByName(_ID_).AsInteger);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.colSNGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.colSNGetText') else _udebug := nil;{$ENDIF}

  if (AText <> '') and then Delete(AText, Length(AText) - 1, 2);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmWaybillOut.GetTaxes;
  var
    ACol: TdxDBTreeListColumn;
    FField: TFloatField;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.GetTaxes') else _udebug := nil;{$ENDIF}

  with newDataSet do
  try
    ProviderName := 'pTaxes_List';
    Open;

    while not Eof do begin
      FField := TFloatField.Create(cdsDetail);
      FField.Name := 'fldTax' + FieldByName('taxid').AsString;
      FField.FieldKind := fkInternalCalc;
      FField.FieldName := 'Tax' + FieldByName('taxid').AsString;
      FField.DataSet := cdsDetail;

      ACol := grdDet.CreateColumnEx(TdxDBGridColumn, grdDet);
      ACol.Name := 'colTax' + FieldByName('taxid').AsString;
      ACol.FieldName := 'Tax' + FieldByName('taxid').AsString;
      ACol.Visible := False;
      ACol.Tag := 1;
      ACol.HeaderAlignment := taCenter;
      ACol.Caption := FieldByName('name').AsString + ', %';
      ACol.Width := 60;
      ACol.OnGetText := colTaxGetText;

      FField := TFloatField.Create(cdsDetail);
      FField.Name := 'fldTaxRate' + FieldByName('taxid').AsString;
      FField.FieldKind := fkInternalCalc;
      FField.FieldName := 'TaxRate' + FieldByName('taxid').AsString;
      FField.DataSet := cdsDetail;

      ACol := grdDet.CreateColumnEx(TdxDBGridColumn, grdDet);
      ACol.Name := 'colTaxRate' + FieldByName('taxid').AsString;
      ACol.FieldName := 'TaxRate' + FieldByName('taxid').AsString;
      ACol.Visible := False;
      ACol.Tag := 1;
      ACol.HeaderAlignment := taCenter;
      ACol.Caption := FieldByName('name').AsString;
      ACol.Width := 60;
      ACol.OnGetText := colTaxRateGetText;

      Next;
    end;

    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.colTaxGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.colTaxGetText') else _udebug := nil;{$ENDIF}

  if AText <> '' then AText := AText + '%';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.cdsDetailCalcFields(DataSet: TDataSet);
  var
    S, T, TaxID: string;
    i: Integer;
    TaxRate: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.cdsDetailCalcFields') else _udebug := nil;{$ENDIF}

  with DataSet do begin
    S := FieldByName('tax').AsString;

    if S <> '' then begin
      for i := 1 to WordCount(S, [';']) do begin
        T := ExtractWord(i, S, [';']);
        TaxID := Trim(ExtractWord(1, T, [',']));

        try
          TaxRate := StrToFloat(ReplaceStr(ExtractWord(2, T, [',']), '.', DecimalSeparator));
        except
          TaxRate := 0;
        end;

        if TaxRate > 0 then FieldByName('Tax' + TaxID).AsFloat := TaxRate;
      end;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.GetSummAll;
 var
   i, j: Integer;
   PriceCurrOutNDS, SummCurrOutNDS, SummCurrNDS, SummCurr, SummTax, PosSummTax,
   PriceDefOutNDS, SummDefOutNDS, SummDefNDS, SummDef: Extended;
   AllSummCurr, AllSummDefOutNDS, AllSummDefNDS, AllSummDef, FAmount :Extended;
   FNorm: Extended;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.GetSummAll') else _udebug := nil;{$ENDIF}

  with grdDet do begin
    AllSummCurr := 0;
    AllSummDefOutNDS := 0;
    AllSummDefNDS := 0;
    AllSummDef := 0;

    for i := 0 to Count - 1 do begin
      FAmount := ssStrToFloat(Items[i].Values[colAmount.Index], 0.0);

      if cdsDetail.FindField('onvalue') <> nil
        then FCurrRate := ssStrToFloat(Items[i].Values[colRate.Index], 1.0);

      FNorm := 0;

      if not VarIsNull(Items[i].Values[colNorm.Index])
        then FNorm := ssStrToFloat(Items[i].Values[colNorm.Index], 0.0)
        else FNorm := 1.0;

      if FNorm > 0.0 then FAmount := FNorm * FAmount;

      SummCurr := RoundToA(FAmount * ssStrToFloat(Items[i].Values[colPriceInCurr.Index], 0.0), -2);

      NDSCalc(FAmount, ssStrToFloat(Items[i].Values[colPriceInCurr.Index], 0.0),
              ssStrToFloat(Items[i].Values[colNDS.Index], 0.0), 1, SummDefOutNDS, SummDefNDS);

      SummDef := RoundToA(SummDefOutNDS + SummDefNDS, -2);
      SummDefOutNDS := SummDef - RoundToA(SummDefNDS, -2);
      PosSummTax := 0;

      for j := 0 to ColumnCount - 1 do begin
        if (Pos('colTax', Columns[j].Name) > 0)
           and (Pos('colTaxRate', Columns[j].Name) = 0)
           and (not VarIsNull(Items[i].Values[j]))
        then try
          SummTax := RoundToA(SummDefOutNDS * ssStrToFloat(Items[i].Values[j].asString, 0.0) / 100.0, -2);
          PosSummTax := PosSummTax + SummTax;

        except
        end;
      end;

      AllSummCurr := AllSummCurr + SummCurr + PosSummTax;

      try
        if FCurrRate > 0 then begin
          NDSCalc(FAmount, ssStrToFloat(Items[i].Values[colPriceInCurr.Index], 0.0) * FCurrRate,
                  ssStrToFloat(Items[i].Values[colNDS.Index], 0.0), 1, SummDefOutNDS, SummDefNDS);

          SummDef := RoundToA(SummDefOutNDS + SummDefNDS, -2);
          SummDefOutNDS := SummDef - RoundToA(SummDefNDS, -2);

          PosSummTax := 0;

          for j := 0 to ColumnCount - 1 do begin
            if (Pos('colTax', Columns[j].Name) > 0)
               and (Pos('colTaxRate', Columns[j].Name) = 0)
               and (not VarIsNull(Items[i].Values[j]))
            then try
              SummTax := RoundToA(SummDefOutNDS * ssStrToFloat(Items[i].Values[j].asString, 0.0) / 100, -2);
              Items[i].Values[ColumnByName('colTaxRate' + Copy(Columns[j].Name, 7, Length(Columns[j].Name) - 6)).Index] := SummTax;

              PosSummTax := PosSummTax + SummTax;
            except
            end;
          end;

          SummDef := SummDef + PosSummTax;

          AllSummDefOutNDS := AllSummDefOutNDS + SummDefOutNDS;
          AllSummDefNDS := AllSummDefNDS + RoundToA(SummDefNDS, -2);
          AllSummDef := AllSummDef + SummDef;

          NDSCalc(1, ssStrToFloat(Items[i].Values[colPriceInCurr.Index], 0.0) * FCurrRate,
                  ssStrToFloat(Items[i].Values[colNDS.Index], 0.0), 1, SummDefOutNDS, SummDefNDS);
        end
        else Items[i].Values[colSummDef.Index] := 0;

      except
      end;
    end;

    AllSummDef := RoundToA(AllSummDef, -2);
    stSummCurr.Caption := FormatFloat(MoneyDisplayFormat, AllSummCurr);
    stSummDefNoNDS.Caption := FormatFloat(MoneyDisplayFormat, AllSummDefOutNDS);
    stSummDefNDS.Caption := FormatFloat(MoneyDisplayFormat, AllSummDefNDS);
    stSummDef.Caption := FormatFloat(MoneyDisplayFormat, AllSummDef);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.colTaxRateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.colTaxRateGetText') else _udebug := nil;{$ENDIF}

  if AText <> ''
    then AText := FormatFloat(MoneyDisplayFormat, StrToFloat(AText));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.srcMainDelayedDataChange(Sender: TObject; Field: TField);
 var
   S: string;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.srcMainDelayedDataChange') else _udebug := nil;{$ENDIF}

  inherited;

  if not cdsMain.IsEmpty then begin
    if cdsMain.FieldByName('attnum').AsString <> ''
      then S := amountPrefix + cdsMain.FieldByName('attnum').AsString + ' ' +
                rs('fmWaybill', 'AttDate') + ' ' + cdsMain.FieldByName('attdate').AsString + ', '
      else S := '';

    if cdsMain.FieldByName('received').AsString <> ''
      then S := S + rs('fmWaybill', 'AttRcv') + ': ' + cdsMain.FieldByName('received').AsString;

    irAtt.Text := S;
    cdsEnts.Locate('kaid', cdsMain.FieldByName('entid').AsInteger, []);
    irEnt.Text := cdsEnts.FieldByName('name').AsString;
  end
  else begin
    irAtt.Text := '';
    irEnt.Text := '';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.colSummInCurrGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.colSummInCurrGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MoneyDisplayFormat, StrToFloat(DelChars(AText, [ThousandSeparator])))
             + ' ' + ANode.Values[colCurrName.Index];
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.colWarrantyPeriodGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
 var
   D1, D2: Char;
   FText: string;
   FType: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.colWarrantyPeriodGetText') else _udebug := nil;{$ENDIF}

  if AText = '' then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;
  FText := AText;

  D1 := FText[Length(FText)];
  FType := ANode.Values[colWarrantyPeriodType.Index];

  if Length(FText) > 1
    then D2 := FText[Length(FText) - 1]
    else D2 := #0;

  if D1 = '1' then begin
    case FType of
      0: AText := AText + ' ' + AnsiLowerCase(rs('Period', 'Year'));
      1: AText := AText + ' ' + AnsiLowerCase(rs('Period', 'Month'));
    end;
  end
  else if (D1 in ['2'..'4']) and (D2 <> '1') then begin
    case FType of
      0: AText := AText + ' ' + AnsiLowerCase(rs('Period', 'Year_R'));
      1: AText := AText + ' ' + AnsiLowerCase(rs('Period', 'Month_R'));
    end;
  end
  else begin
    case FType of
      0: AText := AText + ' ' + AnsiLowerCase(rs('Period', 'Year_RM'));
      1: AText := AText + ' ' + AnsiLowerCase(rs('Period', 'Month_RM'));
    end;  
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.aPrintWarrantyDocExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.aPrintWarrantyDocExecute') else _udebug := nil;{$ENDIF}

  xRep.ShowRep(prRep.rtWarrantyDoc, cdsMain.FieldByName(_ID_).AsInteger);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.DoFind(const AFName, AStr: string; ALocateType: TLocateType; AFwd: Boolean = True);
 var
   FNode: TdxTreeListNode;
   FChar, s, ss: string;
   BySN: Boolean;
   FFromDate, FToDate: TDateTime;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.DoFind') else _udebug := nil;{$ENDIF}

  if (AFName <> 'warrantydoc') and (AFName <> 'serialno') then begin
    inherited;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  BySN := AFName = 'serialno';
  SearchInfo.Failed := False;

  if FindStr <> AStr then begin

    cdsFind.Close;

    case ALocateType of
      ltBegin:  ss := ' like ''' + QuotedStrEx(AnsiUpperCaseEx(AStr), '''') + '%''';
      ltFull:   ss := '=''' + QuotedStrEx(AnsiUpperCaseEx(AStr), '''') + '''';
      ltSubstr: ss := ' like ''%' + QuotedStrEx(AnsiUpperCaseEx(AStr), '''') + '%''';
    end;

    if not BySN
      then s := 'select wbl.wbillid, upper(wd.num), wbl.kaid, wbl.ondate, wbl.checked'
        + ' from warrantydocs wd, waybilllist wbl where wd.wbillid = wbl.wbillid'
        + ' and upper(wd.num)' + ss
      else s := 'select wbl.wbillid, wbl.num, wbl.ondate, wbl.kaid, wbl.checked, wbd.posid ' +
        ' from waybilldet wbd, waybilllist wbl, wmatturn wmt, serials s ' +
        '  where wbl.wtype=-1 and wbd.wbillid=wbl.wbillid and wmt.sourceid=wbd.posid ' +
        '  and s.posid=wmt.posid and upper(s.serialno)' + ss +
        ' union ' +
        ' select wbl.wbillid, wbl.num, wbl.ondate, wbl.kaid, wbl.checked, wbd.posid' +
        ' from waybilldet wbd, waybilllist wbl, serials s ' +
        '  where wbl.wtype=-1 and wbd.wbillid=wbl.wbillid and wbl.deleted<>1' +
        '  and s.posid=wbd.posid and upper(s.serialno)' + ss;

    s := s + ' order by 2';
    cdsFind.Macros.ParamByName('sql').AsString := s;
    cdsFind.Open;
  end;

  FindStr := AStr;
  if AStr = '' then begin
    if FilterOnSearch then cdsMain.Filtered := False;
    SearchInfo.PrevFindStr := '';
    DoRefreshFindParams;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  if not cdsFind.Eof then begin
    srcMain.OnDelayedDataChange := nil;

    if not cdsMain.Locate('wbillid', cdsFind.FieldByName('wbillid').AsInteger, []) then
      try
        CanRefresh := False;
        FFromDate := prdMain.FromDate;

        if prdMain.ToDate = 0
          then FToDate := MaxDateTime
          else FToDate := prdMain.ToDate;

        if FFromDate > cdsFind.FieldByName('ondate').AsDateTime then begin
          prdMain.PeriodType := ptCustom;
          prdMain.FromDate := cdsFind.FieldByName('ondate').AsDateTime;
        end;

        if FToDate < cdsFind.FieldByName('ondate').AsDateTime then begin
          prdMain.PeriodType := ptCustom;
          prdMain.ToDate := cdsFind.FieldByName('ondate').AsDateTime;
        end;

        if (lcbKAgent.KeyValue <> lcbKAgent.EmptyValue) and
           (lcbKAgent.KeyValue <> cdsFind.FieldByName('kaid').AsInteger)
        then lcbKAgent.KeyValue := cdsFind.FieldByName('kaid').AsInteger;

        if (cbChecked.EditValue > 0) and (cbChecked.EditValue - 1 <> cdsFind.FieldByName('checked').AsInteger)
          then cbChecked.EditValue := 0;

        DSRefresh(cdsMain, 'wbillid', cdsFind.fieldbyname('wbillid').AsInteger);

      finally
        CanRefresh := True;
      end;

    if pcMain.ActivePage <> tsPositions then pcMain.ActivePage := tsPositions;

    srcMainDelayedDataChange(srcMain, nil);

    if BySN then cdsDetail.Locate('posid', cdsFind.FieldByName('posid').AsInteger, []);

    srcMain.OnDelayedDataChange := srcMainDelayedDataChange;

    FNode := grdMain.FocusedNode;

    if FNode <> nil then begin
      grdMain.ClearSelection;
      grdMain.TopIndex := FNode.AbsoluteIndex;

      if grdMain.FocusedNode <> nil then grdMain.FocusedNode.Selected := True;
    end;

    SearchInfo.PrevFindStr := FindStr;
    cdsFind.Next;
  end
  else begin
    SearchInfo.Failed := True;
    if FilterOnSearch then cdsMain.Filtered := False;
    SendMessage(ParentHandle, WM_SEARCHFAILED, 0, 0);
  end;
  DoRefreshFindParams;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.colWarrantyStatusGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  var
    FDocDate, FExpireDate: TDateTime;
    FWPeriod, FWPeriodType: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.colWarrantyStatusGetText') else _udebug := nil;{$ENDIF}

  if not VarIsNull(ANode.Values[colWarrantyPeriod.Index]) then begin
    FDocDate := cdsMain.FieldByName('ondate').AsDateTime;
    FWPeriod := ANode.Values[colWarrantyPeriod.Index];
    FWPeriodType := ANode.Values[colWarrantyPeriodType.Index];

    case FWPeriodType of
      0: FExpireDate := IncYear(FDocDate, FWPeriod);
      1: FExpireDate := IncMonth(FDocDate, FWPeriod);
      else FExpireDate := IncYear(FDocDate, 99); // default
    end;

    if FExpireDate < Date
      then AText := AnsiLowerCase(rs('fmWaybill', 'Expired'))
      else AText := rs('fmWaybill', 'Till') + ' ' + DateToStr(FExpireDate);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.colWarrantyStatusCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  var
    FDocDate, FExpireDate: TDateTime;
    FWPeriod, FWPeriodType: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.colWarrantyStatusCustomDrawCell') else _udebug := nil;{$ENDIF}

  if not VarIsNull(ANode.Values[colWarrantyPeriod.Index]) then begin
    FDocDate := cdsMain.FieldByName('ondate').AsDateTime;
    FWPeriod := ANode.Values[colWarrantyPeriod.Index];
    FWPeriodType := ANode.Values[colWarrantyPeriodType.Index];

    case FWPeriodType of
      0: FExpireDate := IncYear(FDocDate, FWPeriod);
      1: FExpireDate := IncMonth(FDocDate, FWPeriod);
      else FExpireDate := IncYear(FDocDate, 99); // default
    end;

    if FExpireDate < Date
      then AFont.Color := clRed;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.NotifyChanged;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.NotifyChanged') else _udebug := nil;{$ENDIF}

  if not JumpFromBuffer
    then frmMainForm.AddToBuffer(vtDocs, FunID, Self.Caption, ClassName, Tag, FCurrentID, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.aCreateInvoiceExecute(Sender: TObject);
  var
    FPos, FSvc: string;
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.aCreateInvoiceExecute') else _udebug := nil;{$ENDIF}

  FPos := '';
  FSvc := '';
  if (Sender as TComponent).Tag = 1 then begin
    for i := 0 to grdDet.SelectedCount - 1 do
      if grdDet.SelectedNodes[i].Values[colPType.Index] = 0
        then FPos := FPos + VarToStr(grdDet.SelectedNodes[i].Values[colPosID.Index]) + ','
        else FSvc := FSvc + IntToStr(-VarToInt(grdDet.SelectedNodes[i].Values[colPosID.Index])) + ',';

    if FPos <> ''
      then Delete(FPos, Length(FPos), 1)
      else FPos := '-1';

    if FSvc <> ''
      then Delete(FSvc, Length(FSvc), 1)
      else FSvc := '-1';
  end;

  with TfrmEditInvoice.Create(nil) do
  try
    MainHandle := Self.Handle;
    ParentNameEx := 'fmWaybill';
    OnDate := Self.OnDate;
    ID := 0;
    CreateFromWBOut(cdsMain.FieldByName('wbillid').AsInteger, FPos, FSvc);
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  if FNoALUpdate then Exit;
  
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.UpdateActionList') else _udebug := nil;{$ENDIF}

  aCreateInvoice.Enabled := (grdMain.Count > 0);

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.grdDetNeedAdjust(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.grdDetNeedAdjust') else _udebug := nil;{$ENDIF}

  grdDet.Adjust(nil, [colPType, colRsv, colRecNo]);
  GetSummAll;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.FrameResize(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.FrameResize') else _udebug := nil;{$ENDIF}

  inherited;
  grdDetNeedAdjust(grdDet);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmWaybillOut.CheckOrdered(AID: Integer): Boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.CheckOrdered') else _udebug := nil;{$ENDIF}

  Result := True;

  with newDataSet do
  try
    ProviderName := 'pWaybill_CheckPosStatus';
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := AID;
    Open;
    if Fields[0].AsInteger = 1 then Result := False;
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.aPrintWarrantyDocCustomExecute(Sender: TObject);
  var
    i: Integer;
    FIDs: string;
    unselect: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.aPrintWarrantyDocCustomExecute') else _udebug := nil;{$ENDIF}

  FIDs := '';
  if TTBItem(Sender).Tag = 1 then begin
    grdDet.SelectAll;
    unselect := True;
  end
  else unselect := False;

  for i := 0 to grdDet.SelectedCount - 1 do
    FIDs := FIDs + VarToStr(grdDet.SelectedNodes[i].Values[colPosID.Index]) + ',';

  if FIDs <> '' then System.Delete(FIDs, Length(FIDs), 1);

  xRep.ShowRep(prRep.rtWarrantyDoc, cdsMain.FieldByName(_ID_).AsInteger, 0, 0, FIDs);

  if unselect then grdDet.ClearSelection;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWaybillOut.UpdatePos;
  var
    FAmount, FNorm, FSummCurr, FPriceCurr, FNDS, FCurrRate: Extended;
    FPriceWithNDS, FPriceWONDS, FSummWONDS, FSummNDS, FSummWithNDS: Extended;
    FSummTax, FPosSummTax: Extended;
    j: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWaybillOut.UpdatePos') else _udebug := nil;{$ENDIF}

  with cdsDetail do begin

    if IsEmpty then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

    FAmount := FieldByName('amount').AsFloat;
    FNorm := FieldByName('norm').AsFloat;
    if FNorm > 0 then FAmount := FAmount * FNorm;
    FPriceCurr := FieldByName('price').AsFloat;
    FNDS := FieldByName('nds').AsFloat;
    FCurrRate := FieldByName('onvalue').AsFloat;

    NDSCalc(FAmount, FPriceCurr, FNDS, 1, FSummWONDS, FSummNDS);
    FSummWithNDS := RoundToA(FSummWONDS + FSummNDS, -2);
    FSummWONDS := FSummWithNDS - RoundToA(FSummNDS, -2);
    FPosSummTax := 0;

    for j := 0 to FieldCount - 1 do begin
      if (Pos('fldTax', Fields[j].Name) > 0) and
         (Pos('fldTaxRate', Fields[j].Name) = 0) then
      begin
        FSummTax := RoundToA(FSummWONDS * Fields[j].AsFloat / 100, -2);
        FPosSummTax := FPosSummTax + FSummTax;
      end;
    end;

    FSummCurr := RoundToA(FAmount * FPriceCurr, -2) + FPosSummTax;

    NDSCalc(1, FPriceCurr * FCurrRate, FNDS, 1, FSummWONDS, FSummNDS);
    FPriceWithNDS := RoundToA(FSummWONDS + FSummNDS, -2);
    FPriceWONDS := RoundToA(FSummWONDS + FSummNDS, -2) - RoundToA(FSummNDS, -2);

    NDSCalc(FAmount, FPriceCurr * FCurrRate, FNDS, 1, FSummWONDS, FSummNDS);
    FSummWithNDS := RoundToA(FSummWONDS + FSummNDS, -2);
    FSummNDS := RoundToA(FSummNDS, -2);
    FSummWONDS := FSummWithNDS - FSummNDS;

    FPosSummTax := 0;

    for j := 0 to FieldCount - 1 do begin
      if (Pos('fldTax', Fields[j].Name) > 0) and
         (Pos('fldTaxRate', Fields[j].Name) = 0)
      then begin
        FSummTax := RoundToA(FSummWONDS * Fields[j].AsFloat / 100, -2);
        FPosSummTax := FPosSummTax + FSummTax;
      end;
    end;

    FSummWithNDS := FSummWithNDS + FPosSummTax;

    Edit;
    FieldByName('sumcurr').AsFloat := FSummCurr;
    FieldByName('pricewithnds').AsFloat := FPriceWithNDS;
    FieldByName('pricewonds').AsFloat := FPriceWONDS;
    FieldByName('sumwithnds').AsFloat := FSummWithNDS;
    FieldByName('sumnds').AsFloat := FSummNDS;
    FieldByName('sumwonds').AsFloat := FSummWONDS;
    Post;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fWaybillOut', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
