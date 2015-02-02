{$I ok_sklad.inc}
unit fAccOut; // invoice/Memorandum/client order

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseWBDoc, ExtCtrls, DB, DBClient, TB2Item, Menus, ActnList, StdCtrls, 

  dxExEdtr6, dxInspRw, dxInspct, dxCntner6, dxDBGrid6, dxTL6, dxDBCtrl6, dxDBTLCl6, dxGrClms6,

  cxPC, cxDropDownEdit, cxImageComboBox, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxCalendar,

  ssDataSource, ssClientDataSet, ssDBLookupCombo, ssSpeedButton,
  prTypes, ssBevel, ssDBGrid, ssPeriod, okPeriod, ssMemDS, dxExEdtr, dxCntner;

type
  TfmAccOut = class(TfmBaseWBDoc)
    aAddTaxWB: TAction;
    aFreePos: TAction;
    aShipPos: TAction;
    cdsDetailCERTDATE: TDateTimeField;
    cdsDetailCERTNUM: TStringField;
    cdsDetailGRPID: TIntegerField;
    cdsDetailGTD: TStringField;
    cdsDetailNORM: TFloatField;
    cdsDetailPOSTYPE: TIntegerField;
    cdsDetailPRODUCER: TStringField;
    cdsDetailrsv: TIntegerField;
    cdsDetailRSVAMOUNT: TFloatField;
    cdsDetailSHIPPEDAMOUNT: TFloatField;
    cdsDetailSN: TStringField;
    cdsDetailTAX: TStringField;
    cdsDetailtoship: TFloatField;
    cdsEnts_: TssClientDataSet;
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
    cdsMainstatus: TIntegerField;
    cdsMainSUMMALL: TFloatField;
    cdsMainSUMMINCURR: TFloatField;
    cdsMainSUMMPAY: TFloatField;
    cdsMainTODATE: TDateTimeField;
    cdsMainWBILLID: TIntegerField;
    cdsMainWTYPE: TIntegerField;
    cdsMainWWW: TStringField;
    cdsPrintMenu: TssClientDataSet;
    cdsPrintMenuACCID: TIntegerField;
    cdsPrintMenuACCNUM: TStringField;
    cdsPrintMenuBANKID: TIntegerField;
    cdsPrintMenuDEF: TIntegerField;
    cdsPrintMenuMFO: TStringField;
    cdsPrintMenuNAME: TStringField;
    cdsPrintMenuPPItemName: TStringField;
    cdsPrintMenuTYPEID: TIntegerField;
    cdsPrintMenuTYPENAME: TStringField;
    colEnt: TdxDBGridColumn;
    colNumEx: TdxDBGridColumn;
    colPersonName: TdxDBGridColumn;
    colPType: TdxDBGridImageColumn;
    colReserved: TdxDBGridImageColumn;
    colRsv: TdxDBGridColumn;
    colShipped: TdxDBGridColumn;
    colStatus: TdxDBGridColumn;
    colToShip: TdxDBGridColumn;
    colUrgent: TdxDBGridColumn;
    irBilled: TdxInspectorTextRow;
    irEnt: TdxInspectorTextRow;
    irToDate1: TdxInspectorTextRow;
    itmShipPos: TTBItem;
    itmSvcInfo: TTBItem;
    sepParams: TTBSeparatorItem;
    sepShip: TTBSeparatorItem;
    TBItem11: TTBItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    tbPrint: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;

    procedure cdsMainBeforeOpen(DataSet: TDataSet);
    procedure aAddTaxWBExecute(Sender: TObject);
    procedure srcMainDelayedDataChange(Sender: TObject; Field: TField); procedure colUrgentCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure cdsMainCalcFields(DataSet: TDataSet);
    procedure colNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colWHouseNameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure pmDetPopup(Sender: TObject);
    procedure grdDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure aAddPayDocExecute(Sender: TObject);
    procedure srcMainExDataChange(Sender: TObject; Field: TField);
    procedure aShipPosExecute(Sender: TObject); virtual;
    procedure colRsvCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure cdsDetailCalcFields(DataSet: TDataSet);
    procedure colToShipGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colToShipCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure cdsPrintMenuCalcFields(DataSet: TDataSet);
    procedure cdsPrintMenuAfterOpen(DataSet: TDataSet);
    procedure aPrintExecute(Sender: TObject);
    procedure colSummInCurrGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure aShowNullBallanceExecute(Sender: TObject);
    procedure cbCheckedPropertiesChange(Sender: TObject);
    procedure colUrgentGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure grdDetNeedAdjust(Sender: TObject); override;
    procedure FrameResize(Sender: TObject);
    procedure aFreePosExecute(Sender: TObject);

  private
    function CopyPos(posid,WBILLID:integer;OnDate:TDateTime; PosType: Integer = 0):boolean;
    procedure GetTaxes;
    procedure colTaxGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colTaxRateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);

  protected
    procedure GetSummAll; override;

  public
    procedure UpdateActionList; override;
    procedure SetCaptions; override;
    procedure DoOpen(AParam: Variant); override;
    procedure DoDelete; override;
    procedure DoCheck(EditRequest: Boolean); override;
    procedure DoPrint(AParam: integer = 0); override;
    procedure DoPrintPopup(X, Y: Integer); override;
    procedure NotifyChanged; override;

  end;

var
  fmAccOut: TfmAccOut;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  ssDateUtils, prRep, EditAccOut, prConst, ClientData, fMessageDlg,
  ssCallbackConst, prFun, ssFun, ssBaseConst, EditTaxWB, BaseRef, EditWaybillOut,
  EditPayDoc, BaseFrame, IniFiles, ssStrUtil, udebug, xLngDefs;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfmAccOut.DoOpen(AParam: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.DoOpen') else _udebug := nil;{$ENDIF}

  GetTaxes;
  _ID_ := 'wbillid';
  RefType := prTypes.rtAccOut;
  EditingClass := TfrmEditAccOut;

  if CountryRules.AR = accRul_RU then aAddTaxWB.Visible := False;

  inherited;
  cdsPrintMenu.Open;
  colReserved.Width := 25;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    FindList.Clear;
    FindList.AddObject(GetRS('fmWaybill', 'FiltNum') + ';' + 'num', pointer(1));
    FindList.AddObject(GetRS('fmWaybill', 'FiltDate') + ';' + 'ondate', pointer(2));
    FindList.AddObject(GetRS('fmWaybill', 'FiltKAOut') + ';' + 'name', pointer(3));

    inherited;
    
    Self.Caption := GetRS('fmWaybill', 'TitleAccOuts');
    aAddTaxWB.Caption := GetRS('fmWaybill', 'AddFromOutToTaxWB');
    aCheck.Caption := GetRS('fmWaybill', 'CreateWBOut') + '...';
    aAddPayDoc.Caption := GetRS('fmWaybill', 'AddPaymentByAcc') + '...';
    aShipPos.Caption := GetRS('fmWaybill', 'ShipPos') + '...';
    irToDate1.Caption := GetRS('fmWaybill','AccToDate');
    irKAgent.Caption := GetRS('fmWaybill','KANameOut');
    irBilled.Caption := GetRS('fmWaybill', 'Billed');
    colUrgent.Caption := GetRS('fmWaybill','UrgentStatus');
    irEnt.Caption := GetRS('fmWaybill', 'Ent');
    aShowNullBallance.Caption := GetRS('fmWaybill', 'ShowExecutedOrders');
    aFreePos.Caption := GetRS('fmWaybill', 'FreeRsv');

    cbChecked.Properties.Items[0].Description := GetRS('Common', 'All');
    cbChecked.Properties.Items[1].Description := GetRS('fmWaybill', 'Actual');
    cbChecked.Properties.Items[2].Description := GetRS('fmWaybill', 'PartialyExecuted');
    cbChecked.Properties.Items[3].Description := GetRS('fmWaybill', 'Executed');

    colPType.Caption := '';
    colMatName.Caption := GetRS('fmWaybill', 'MatSvc');
    colWHouseName.Caption := GetRS('fmWaybill', 'WHNorm');
    colShipped.Caption := GetRS('fmWaybill', 'Shipped');
    colToShip.Caption := GetRS('fmWaybill', 'ToShip');
    colRsv.Caption := GetRS('fmWaybill', 'RsvByWB');
    colReserved.Caption := GetRS('fmWMat', 'Reserved');
    colPersonName.Caption := GetRS('fmWaybill', 'Billed');
    tsInfo.Caption := GetRS('fmWaybill', 'BillInfo');
    colEnt.Caption := GetRS('fmWaybill', 'Ent');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.cdsMainBeforeOpen(DataSet: TDataSet);
  var
    M: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.cdsMainBeforeOpen') else _udebug := nil;{$ENDIF}

  DSRefresh(cdsEnts_, 'kaid', 0);

  M := '';
  with cdsMain do begin
    if (lcbKAgent.KeyValue <> lcbKAgent.EmptyValue) and panFilter.Visible
      then Params.ParamByName('in_kaid').AsInteger := lcbKAgent.KeyValue
      else Params.ParamByName('in_kaid').AsInteger := 0;

    case cbChecked.EditValue of
      0: Params.ParamByName('in_checked').AsInteger := -1;
      1: Params.ParamByName('in_checked').AsInteger := 0;
      2: Params.ParamByName('in_checked').AsInteger := 1;
      3: Params.ParamByName('in_checked').AsInteger := 2;
    end;

    Params.ParamByName('wh').AsString := AllowedWH;

    if MultiEntsViewType = 1
      then Params.ParamByName('in_entid').AsInteger := CurrEnt.KAID
      else Params.ParamByName('in_entid').AsInteger := 0;

    Params.ParamByName('shownullbalance').AsInteger := Integer(aShowNullBallance.Checked);
    Params.ParamByName('in_wtype').AsInteger := 2;

    if panFilter.Visible
      then Params.ParamByName('in_fromdate').AsDateTime := prdMain.FromDate
      else Params.ParamByName('in_fromdate').AsDateTime := MinDateTime;

    if panFilter.Visible
      then Params.ParamByName('in_todate').AsDateTime := LastSecondInDay(prdMain.ToDate)
      else Params.ParamByName('in_todate').AsDateTime := MaxDateTime;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.DoPrint(AParam: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.DoPrint') else _udebug := nil;{$ENDIF}

  xRep.ShowRep(prRep.rtAccOut, cdsMain.FieldByName(_ID_).AsInteger, AParam);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.DoDelete;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.DoDelete') else _udebug := nil;{$ENDIF}

  if mrYes <> ssMessageDlg(rs('fmWaybill', 'DelAccOut') + ' ' + cdsMain.fieldbyname('num').AsString + '?', ssmtWarning, [ssmbYes,ssmbNo])
  then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  with newDataSet do
  try // finally
    Application.ProcessMessages;

    TrStart;

    try // except
      // 1 )Удаляем из оборотов
      ProviderName := 'pWMatTurn_Del';
      FetchParams;
      Params.ParamByName(_ID_).AsInteger := cdsMain.fieldbyname(_ID_).AsInteger;
      Execute;  //Удалили из wmatturn

      if not DeleteDataEx(dmData.SConnection, 'waybilllist', 'wbillid', cdsMain.fieldbyname(_ID_).AsInteger)
        then raise Exception.Create(rs('Common','DeleteError'));

      if not DelToRecycleBin
        then begin
          if not TrCommit then raise Exception.Create('');
        end
        else begin
          TrRollback;
          if not AddToRecycleBin(dmData.SConnection, Self.ClassName, cdsMain.fieldbyname(_ID_).AsInteger,
                                 GetDelStr(cdsMain.fieldbyname(_ID_).AsInteger), false, Self.FunID)
          then begin
            ssMessageDlg(rs('Common','DeleteError'), ssmtError, [ssmbOk]);
            {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
            Exit;
          end;
        end;

      LocateAfterDel;
      DoRefresh(0);
      RefreshFun('TfmWMat', 0);
      SendMessage(ParentHandle, WM_REFRESHBIN, 0, 0);
      UpdateActionList;

      {if RefreshAllClients then begin
        dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WBIN);
        dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
      end;
      }

    except
      on e:exception do begin
        TrRollback;
        ssMessageDlg(rs('Common','NoDelete') + #10#13 + e.Message, ssmtError, [ssmbOk]);
      end;
    end;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.DoCheck(EditRequest: Boolean);
  var
    WBILLID, WBILLID1, tmpDefNum: integer;
    eStr, tmpNum, tmpReason, SNs: String;
    tmpOnDate, tmpToDate: TDateTime;
    tmpremain,FRemain: Extended;
    FPos, FSvc: string;
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.DoCheck') else _udebug := nil;{$ENDIF}

  if 0 = grdMain.FocusedNode.Values[colChecked.Index] then begin //posting
    if mrYes = ssMessageDlg(rs('fmWaybill', 'AccOutCheckConfirm'), ssmtConfirmation, [ssmbYes, ssmbNo])
    then begin
      try
        WBILLID1 := Self.cdsMain.fieldbyname('wbillid').AsInteger;
        Application.ProcessMessages;
        tmpNum := Self.cdsMain.fieldbyname('num').AsString;
        tmpOnDate := Self.cdsMain.fieldbyname('ondate').AsDateTime;
        tmpReason := Self.cdsMain.fieldbyname('reason').AsString;

        if not Self.cdsMain.fieldbyname('todate').IsNull
          then tmpToDate := Self.cdsMain.fieldbyname('todate').AsDateTime
          else tmpToDate := 0;

        tmpDefNum := Self.cdsMain.fieldbyname('defnum').AsInteger;

        aShipPosExecute(aCheck);

        {with TfrmEditWaybillOut.Create(nil) do
        try
          FInAccOut := WBILLID1;
          dbgWaybillDet.HideSelection := True;
          ID := WBILLID1;
          SetCaptions;
          OnDate := Self.OnDate;
          edKAgent.Enabled := false;
          aAddKA.Enabled := false;
          aCIns.Enabled := False;
          aCUpd.Enabled := False;
          aCDel.Enabled := False;
          sbAddKAgent.Enabled := False;
          btnKAFind.Enabled := False;
          btnKAFindParams.Enabled := False;
          edReason.Enabled := False;
          chbPay.Enabled := False;
          cbCurr.Enabled := False;
          edReason.Text := rs('fmWaybill','TitleAccOut') + amountPrefix +
            Self.cdsMain.fieldbyname('num').AsString;
          chbPosting.Checked := true;
          edDate.Date := Date;
          edTime.Time := Time;
          //Попытка зарезервировать товар для позиций без резерва
          mdDet.First;
          while not mdDet.Eof do begin
            if not mdWMatTurn.Locate('sourceid',mdDet.fieldbyname('posid').AsInteger,[]) then begin
              SNs := '';
              GetMatRestsOnWHouse(dmData.SConnection,mdDet.fieldbyname('matid').AsInteger,mdDet.fieldbyname('wid').AsInteger,MaxDateTime,integer(mdPosition));
              FRemain := 0;
              with mdPosition do begin
                if not IsEmpty then begin
                  case ChargeType of
                    ctFIFO: SortOnFields('ondate');
                    ctLIFO: SortOnFields('ondate',true,true);
                  end;//case
                  First;
                  while not Eof do begin
                    Edit;
                    fieldbyname('amount').AsFloat := RoundToA(fieldbyname('amount').AsFloat, MatDisplayDigits);
                    Post;
                    FRemain := FRemain+strtofloat(fieldbyname('amount').AsString);
                    Next;
                  end;//while not Eof
                end//if not IsEmpty
                else begin
                  Close;
                end;
                FRemain := RoundToA(FRemain, MatDisplayDigits);
              end;//  with mdPosition
              if FRemain>=RoundToA(strtofloat(mdDet.fieldbyname('amount').AsString), MatDisplayDigits) then begin
                tmpremain := RoundToA(strtofloat(mdDet.fieldbyname('amount').AsString), MatDisplayDigits);
                with mdPosition do begin
                  First;
                  while not Eof and (tmpremain>0) do begin
                    if (tmpremain<=strtofloat(fieldbyname('amount').AsString))
                       and (strtofloat(fieldbyname('amount').AsString)>0) then begin
                      mdWMatTurn.Append;
                      mdWMatTurn.FieldByName('posid').AsInteger := FieldByName('posid').AsInteger;
                      mdWMatTurn.FieldByName('matid').AsInteger := mdDet.FieldByName('matid').AsInteger;
                      mdWMatTurn.FieldByName('wid').AsInteger := mdDet.FieldByName('wid').AsInteger;
                      mdWMatTurn.FieldByName('amount').AsFloat := tmpremain;
                      mdWMatTurn.FieldByName('sourceid').AsInteger := mdDet.FieldByName('posid').AsInteger;
                      if not FieldByName('SN').IsNull then begin
                        mdWMatTurn.FieldByName('SN').AsString := FieldByName('SN').AsString;
                        SNs := SNs+mdWMatTurn.FieldByName('SN').AsString+'; ';
                      end;
                      mdWMatTurn.Post;
                    end//if
                    else begin
                      if strtofloat(fieldbyname('amount').AsString)>0 then begin
                        mdWMatTurn.Append;
                        mdWMatTurn.FieldByName('posid').AsInteger := FieldByName('posid').AsInteger;
                        mdWMatTurn.FieldByName('matid').AsInteger := mdDet.FieldByName('matid').AsInteger;
                        mdWMatTurn.FieldByName('wid').AsInteger := mdDet.FieldByName('wid').AsInteger;
                        mdWMatTurn.FieldByName('amount').AsFloat := strtofloat(FieldByName('amount').AsString);
                        mdWMatTurn.FieldByName('sourceid').AsInteger := mdDet.FieldByName('posid').AsInteger;
                        if not FieldByName('SN').IsNull then begin
                          mdWMatTurn.FieldByName('SN').AsString := FieldByName('SN').AsString;
                          SNs := SNs+mdWMatTurn.FieldByName('SN').AsString+'; ';
                        end;//if
                        mdWMatTurn.Post;
                      end;//if
                    end;//else
                    tmpremain := tmpremain-fieldbyname('amount').AsFloat;
                    Next;
                  end;//while not Eof and (tmpremain>0) do begin
                end;//with mdPosition do begin
              end;//if FRemain>=mdDet.fieldbyname('amount').AsFloat then begin

              //Запись в SN для WMat
              if SNs<>'' then begin
                SNs := System.Copy(SNs,1,Length(SNs)-2);
                with mdDet do begin
                  Edit;
                  FieldByName('sn').AsString := SNs;
                  Post;
                end;//with mdDet do begin
              end;//if SNs<>'' then begin
            end;//if
            mdDet.Next;
          end;//while not mdDet.Eof do begin

          if ShowModal in [mrOK, mrYes] then begin
            Application.ProcessMessages;
            Screen.Cursor := crSQLWait;
            with newDataSet do
            try
              WBILLID := GetMaxID(dmData.SConnection, 'waybilllist', 'wbillid');
              Close;
              ProviderName := 'pAccOut_Ins';
              FetchParams;
              Params.ParamByName('WBILLID').AsInteger := WBILLID;
              Params.ParamByName('num').AsString := tmpNum;
              Params.ParamByName('ondate').AsDateTime := tmpOnDate;
              Params.ParamByName('reason').AsString := tmpReason;
              if tmpToDate<>0 then
                Params.ParamByName('todate').AsDateTime := tmpToDate
              else begin
                Params.ParamByName('todate').DataType := ftDateTime;
                Params.ParamByName('todate').Clear;
              end;
              Params.ParamByName('defnum').AsInteger := tmpDefNum;
              FetchMacros;
              Macros.ParamByName('m').AsString := ' where wblist.wbillid='+inttostr(WBILLID1);
              Execute;//добавили в waybillist

              if AccPayDocID > 0 then begin
                ProviderName := 'pWaybillPay_Upd';
                FetchParams;
                Params.ParamByName('wbillid').AsInteger := WBILLID;
                Params.ParamByName('paydocid').AsInteger := AccPayDocID;
                Execute;
              end;
              //Обновляем поле todate для расходной накладной
              ProviderName := 'pWaybillToDate_Set';
              FetchParams;
              Params.ParamByName('WBILLID').AsInteger := WBILLID1;
              Params.ParamByName('todate').AsDate := WBILLID;
              Execute;
              //Копируем позиции
              ProviderName := 'pWaybillDet_GetWithSvc';
              FetchParams;
              Params.ParamByName('WBILLID').AsInteger := WBILLID1;
              Open;
              First;
              while not Eof do begin
                if FieldByName('postype').AsInteger = 0
                  then CopyPos(fieldbyname('posid').AsInteger,WBILLID,tmpOnDate)
                  else CopyPos(fieldbyname('posid').AsInteger,WBILLID,tmpOnDate, 1);
                Next;
              end;//while
              Close;

            finally
              Free;
              UpdateActionList;
              Screen.Cursor := crDefault;
            end;

            TrCommit;

            DoRefresh(WBILLID);
            RefreshFun('TfmWaybillOut', 0);
            dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
            dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WBOUT);
            dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_KAGENTS);
          end;//if ShowModal=wrOk

        finally
          Free;
        end;
        }
      except
        on e:exception do begin
          TrRollback;
          ssMessageDlg(rs('fmWaybill','CheckError') + #13#10 + e.Message, ssmtError, [ssmbOk]);
        end;
      end;
    end; //if MessageDlg(rs_AccOutCheckConfirm, mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
  end //if  not checked
  else begin //unposting
    with newDataSet do
    try
      ProviderName := 'pWaybill_CheckAccOut';
      FetchParams;
      Params.ParamByName('todate').AsDate := Self.cdsMain.fieldbyname('wbillid').AsInteger;
      Open;
      if not IsEmpty then begin
        First;
        while not Eof do begin
          eStr := eStr + '  ' + inttostr(RecNo) + '. ';

          case FieldByName('wtype').AsInteger of
            -1: eStr := eStr + rs('fmWaybill','TitleWaybillOut') + amountPrefix;
             1: eStr := eStr + rs('fmWaybill','TitleWaybill') + amountPrefix;
             2: eStr := eStr + rs('fmWaybill','TitleAccOut') + amountPrefix;
          end;//case

          eStr := eStr + FieldByName('num').AsString + ' ' + rs('fmWaybill','AttDate') + ' ' + FieldByName('ondate').AsString + #13#10;
          Next;
        end;//while not Eof

        Close;
        ssMessageDlg(rs('fmWaybill','CheckOut') + #13#10 + eStr, ssmtError, [ssmbOK]);
      end
      else begin
        Close;
        ProviderName := 'pWaybill_Check';
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := Self.cdsMain.fieldbyname('wbillid').AsInteger;
        Params.ParamByName('checked').AsInteger := 0;
        Execute;
        DoRefresh(0);
      end;

    finally
      Free;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.aAddTaxWBExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.aAddTaxWBExecute') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;

  with TfrmEditTaxWB.Create(nil) do
  try
    ID := 0;
    //chbCheckNDS.Checked := cdsMain.fieldbyname('nds').AsFloat > 0;
    edDate.Date := cdsMain.fieldbyname('ondate').AsDateTime;
    edCondition.Text := rs('fmWaybill','TitleAccOut')+' '+amountPrefix+cdsMain.fieldbyname('num').AsString;
    lcbPersonName.KeyValue := cdsMain.fieldbyname('personid').AsInteger;
    SendMessage(Handle,WM_REFRESH,cdsMain.fieldbyname('kaid').AsInteger,integer(rtkagent));
    SetCaptions;
    //CurrentNDS := NDS;
    WBillID := Self.cdsMain.fieldbyname('WBILLID').AsInteger;

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

    //*****************************
    if ShowModal in [mrOK, mrYes] then begin
      ARefresh.Execute;
    end;

  finally
    Screen.Cursor := crDefault;
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


//==============================================================================================
function TfmAccOut.CopyPos(posid, WBILLID:integer;OnDate:TDateTime; PosType: Integer = 0):boolean;
  var
    NextID, tmpMATID, tmpWID, tmpCurrId, tmpPTypeID, tmpNum:integer;
    tmpAMOUNT, tmpPRICE, tmpDiscount, tmpNDS, tmpNorm:Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.CopyPos') else _udebug := nil;{$ENDIF}

  NextID := 0;
  tmpMATID := 0;
  tmpWID := 0;
  tmpCurrId := 0;
  tmpPTypeID := 0;
  tmpNum := 0;
  tmpAMOUNT := 0.0;
  tmpPRICE := 0.0;
  tmpDiscount := 0.0;
  tmpNDS := 0.0;
  tmpNorm := 0.0;

  try
    with newDataSet do
    try

      if PosType = 0 then begin
        NextID := GetMaxID(dmData.SConnection, 'waybilldet', 'posid');
        ProviderName := 'pAccOutDet_Get';
      end
      else begin
        NextID := GetMaxID(dmData.SConnection, 'waybillsvc', 'posid');
        ProviderName := 'pAccOutSvc_Get';
      end;

      FetchParams;
      Params.ParamByName('posid1').AsInteger := Abs(PosID);
      Open;

      if PosType = 0 then begin
        if not IsEmpty then begin
          //POSID, WBILLID, MATID, WID, AMOUNT, PRICE, DISCOUNT, NDS, CurrId, OnDate, PTypeID
          tmpMATID := fieldbyname('matid').AsInteger;
          tmpWID := fieldbyname('wid').AsInteger;
          tmpAMOUNT := strtofloat(fieldbyname('AMOUNT').AsString);
          tmpPRICE := strtofloat(fieldbyname('price').AsString);
          tmpDiscount := strtofloat(fieldbyname('discount').AsString);
          tmpNDS := strtofloat(fieldbyname('NDS').AsString);
          tmpCurrId := fieldbyname('CurrId').AsInteger;
          //tmpOnDate := fieldbyname('OnDate').AsDateTime;
          tmpPTypeID := fieldbyname('PTypeID').AsInteger;
          tmpNum := fieldbyname('num').AsInteger;
        end;//if not IsEmpty
        Close;

        ProviderName := 'pWaybillDet_Ins';
        FetchParams;
        Params.ParamByName('POSID').AsInteger := nextid;
        Params.ParamByName('WBILLID').AsInteger := WBILLID;
        Params.ParamByName('MATID').AsInteger := tmpMATID;
        Params.ParamByName('WID').AsInteger := tmpWID;
        Params.ParamByName('AMOUNT').AsFloat := tmpAMOUNT;
        Params.ParamByName('PRICE').AsFloat := tmpPRICE;
        Params.ParamByName('DISCOUNT').AsFloat := tmpDiscount;
        Params.ParamByName('NDS').AsFloat := tmpNDS;
        Params.ParamByName('CurrId').AsInteger := tmpCurrId;
        Params.ParamByName('OnDate').AsDateTime := OnDate;

        if tmpPTypeID = 0 then begin
          Params.ParamByName('PTypeID').DataType := ftInteger;
          Params.ParamByName('PTypeID').Clear;
        end
        else Params.ParamByName('PTypeID').AsInteger := tmpPTypeID;

        Params.ParamByName('Num').AsInteger := tmpNum;
        Execute;//добавили в waybillist
      end
      else begin
        if not IsEmpty then begin
          //POSID, WBILLID, MATID, WID, AMOUNT, PRICE, DISCOUNT, NDS, CurrId, OnDate, PTypeID
          tmpMATID := fieldbyname('svcid').AsInteger;
          tmpWID := fieldbyname('personid').AsInteger;
          tmpAMOUNT := strtofloat(fieldbyname('AMOUNT').AsString);
          tmpPRICE := strtofloat(fieldbyname('price').AsString);
          tmpDiscount := strtofloat(fieldbyname('discount').AsString);
          tmpNDS := strtofloat(fieldbyname('NDS').AsString);
          tmpNorm := strtofloat(fieldbyname('norm').AsString);
          tmpCurrId := fieldbyname('CurrId').AsInteger;
          //tmpOnDate := fieldbyname('OnDate').AsDateTime;
          //tmpPTypeID := fieldbyname('PTypeID').AsInteger;
          tmpNum := fieldbyname('num').AsInteger;
        end;//if not IsEmpty
        Close;

        ProviderName := 'pWaybillSvc_Ins';
        FetchParams;
        Params.ParamByName('POSID').AsInteger := NextID;
        Params.ParamByName('WBILLID').AsInteger := WBILLID;
        Params.ParamByName('svcid').AsInteger := tmpMATID;

        if tmpWID > 0
          then Params.ParamByName('personid').AsInteger := tmpWID
          else begin
            Params.ParamByName('personid').DataType := ftInteger;
            Params.ParamByName('personid').Clear;
          end;

        Params.ParamByName('AMOUNT').AsFloat := tmpAMOUNT;
        Params.ParamByName('PRICE').AsFloat := tmpPRICE;
        Params.ParamByName('DISCOUNT').AsFloat := tmpDiscount;
        Params.ParamByName('NDS').AsFloat := tmpNDS;
        Params.ParamByName('norm').AsFloat := tmpNorm;
        Params.ParamByName('CurrId').AsInteger := tmpCurrId;
        //Params.ParamByName('OnDate').AsDateTime := OnDate;
        //Params.ParamByName('PTypeID').AsInteger := tmpPTypeID;
        Params.ParamByName('Num').AsInteger := tmpNum;
        Execute;//добавили в waybillist
      end;
      Result := true;

    finally
      Free;
    end;

  except
    Result := false;
    raise;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.srcMainDelayedDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.srcMainDelayedDataChange') else _udebug := nil;{$ENDIF}

  inherited;

  if not cdsMain.FieldByName('TODATE').IsNull
    then irToDate1.Text := ssDateToStr(cdsMain.FieldByName('TODATE').AsDateTime) + ' ' +
                             TimeToStr(cdsMain.FieldByName('TODATE').AsDateTime)
    else irToDate1.Text := '';

  if not cdsMain.IsEmpty then begin
    cdsEnts.Locate('kaid', cdsMain.FieldByName('entid').AsInteger, []);
    irEnt.Text := cdsEnts.FieldByName('name').AsString;
    irBilled.Text := cdsMain.FieldByName('personname').AsString;
  end
  else begin
    irEnt.Text := '';
    irBilled.Text := '';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.colUrgentCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.colUrgentCustomDrawCell') else _udebug := nil;{$ENDIF}

  if not ASelected then
    case VarToInt(ANode.Values[colStatus.Index]) of
      0: AFont.Color := clWindowText;
      1: AFont.Color := clBlue;
      2: AFont.Color := clGreen;
      3: AFont.Color := clRed;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.cdsMainCalcFields(DataSet: TDataSet);
  var
    FNum: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.cdsMainCalcFields') else _udebug := nil;{$ENDIF}

  try
    FNum := DataSet.FieldByName('num').AsString;

    if Pos(AOPrefix, FNum) = 1
      then DataSet.FieldByName('numex').AsInteger :=
           StrToInt(Trim(Copy(FNum, Length(AOPrefix) + 1, Length(FNum) - Length(AOPrefix) - Length(AOSuffix))))
      else DataSet.FieldByName('numex').AsInteger := StrToInt(FNum);

  except
    DataSet.FieldByName('numex').AsInteger := 0;
  end;

  DataSet.FieldByName('docsaldo').AsCurrency := DataSet.FieldByName('summall').AsFloat - DataSet.FieldByName('summpay').AsFloat;

  if cdsEnts_.Locate('kaid', DataSet.FieldByName('entid').AsInteger, [])
    then DataSet.FieldByName('entname').AsString := cdsEnts_.FieldByName('name').AsString;

  case DataSet.FieldByName('checked').AsInteger of
    0: if DataSet.FieldByName('todate').IsNull or (DataSet.FieldByName('todate').AsDateTime > OnDate)
         then DataSet.FieldByName('status').AsInteger := 0
         else if (DataSet.FieldByName('docsaldo').AsCurrency > 0)
              then DataSet.FieldByName('status').AsInteger := 3;

    else DataSet.FieldByName('status').AsInteger := DataSet.FieldByName('checked').AsInteger;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.colNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.colNumGetText') else _udebug := nil;{$ENDIF}

  AText := ANode.Values[colNumEx.Index];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.colWHouseNameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.colWHouseNameGetText') else _udebug := nil;{$ENDIF}

  if ANode.Values[colPType.Index] = 1
    then AText := VarToStr(ANode.Values[colNorm.Index]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.grdMainCustomDrawCell') else _udebug := nil;{$ENDIF}

  inherited;

  if AOSelectNP and not ASelected  and (VarToFloat(ANode.Values[colDocSaldo.Index]) > 0)
    then AColor := CL_OK_AO_NOT_PAID;

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
procedure TfmAccOut.pmDetPopup(Sender: TObject);
  var
    FPosType: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.pmDetPopup') else _udebug := nil;{$ENDIF}

  FPosType := cdsDetail.FieldByName('postype').AsInteger;
  itmMatInfo.Visible := FPosType = 0;
  itmMatMove.Visible := FPosType = 0;
  itmMatRsv.Visible := FPosType = 0;
  itmMC.Visible := FPosType = 0;
  itmSvcInfo.Visible := FPosType = 1;
  itmFindAtMats.Visible := FPosType = 0;
  itmFindAtSvc.Visible := FPosType = 1;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.grdDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.grdDetGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := rs('fmWaybill', 'DocAccOut');
  ImgList := dmData.Images;
  AIndex := II_ACCOUT;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.grdMainGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := rs('frmOptions', 'AccOut');
  ImgList := dmData.Images;
  AIndex := II_ACCOUT;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.aAddPayDocExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.aAddPayDocExecute') else _udebug := nil;{$ENDIF}

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
    WType := 2;
    ID := 0;
    edTotal.Value := cdsMain.FieldByName('docsaldo').AsCurrency;
    WBillID := Self.cdsMain.FieldByName(_ID_).AsInteger;
    edReason.Text := rs('fmWaybill', 'DocAccOut') + amountPrefix + Self.cdsMain.FieldByName('num').AsString;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.UpdateActionList') else _udebug := nil;{$ENDIF}

  aCheck.Enabled := (not cdsMain.IsEmpty) and (cdsMain.FieldByName('checked').AsInteger = 0);

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.srcMainExDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.srcMainExDataChange') else _udebug := nil;{$ENDIF}

  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.aShipPosExecute(Sender: TObject);
 var
   FPos, FSvc: string;
   i: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.aShipPosExecute') else _udebug := nil;{$ENDIF}

  FPos := '';
  FSvc := '';

  if (Sender as TComponent).Tag = 1 then begin // processing whole list
    DSRefresh(cdsDetail, 'posid', 0);

    for i := 0 to grdDet.Count - 1 do
      if grdDet.Items[i].Values[colPType.Index] = 0
        then FPos := FPos + IntToStr(grdDet.Items[i].Values[colPosID.Index]) + ','
        else FSvc := FSvc + IntToStr(-grdDet.Items[i].Values[colPosID.Index]) + ',';
  end
  else begin
    for i := 0 to grdDet.SelectedCount - 1 do
      if grdDet.SelectedNodes[i].Values[colPType.Index] = 0
        then FPos := FPos + IntToStr(grdDet.SelectedNodes[i].Values[colPosID.Index]) + ','
        else FSvc := FSvc + IntToStr(-grdDet.SelectedNodes[i].Values[colPosID.Index]) + ',';
  end;

  if FPos <> '' then System.Delete(FPos, Length(FPos), 1);
  if FSvc <> '' then System.Delete(FSvc, Length(FSvc), 1);

  if (FPos = '') and (FSvc = '') then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmEditWaybillOut.Create(nil) do
  try
    WBType := wbtWaybillOut;
    MainHandle := Self.Handle;
    ParentNameEx := 'fmWaybill';
    OnDate := Self.OnDate;
    ID := 0;
    CreateByAccOut(cdsMain.FieldByName('wbillid').AsInteger, FPos, FSvc);
    ShowModal;

  finally
    Free;
    Screen.Cursor := crDefault;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.colRsvCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String;  var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.colRsvCustomDrawCell') else _udebug := nil;{$ENDIF}

  if AText <> '0' then AFont.Color := clRed;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.cdsDetailCalcFields(DataSet: TDataSet);
  var
    S, T, TaxID: string;
    i: Integer;
    TaxRate: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.cdsDetailCalcFields') else _udebug := nil;{$ENDIF}

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

    FieldByName('toship').AsFloat := RoundToA(FieldByName('amount').AsFloat -
         FieldByName('shippedamount').AsFloat - FieldByName('rsvamount').AsFloat, MatDisplayDigits);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.colToShipGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.colToShipGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MatDisplayFormat, StrToFloat(AText));
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.colToShipCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.colToShipCustomDrawCell') else _udebug := nil;{$ENDIF}

  if AText = '0' then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  AFont.Style := [fsBold];
  AFont.Color := clRed;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.DoPrintPopup(X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.DoPrintPopup') else _udebug := nil;{$ENDIF}

  DoPrint(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.cdsPrintMenuCalcFields(DataSet: TDataSet);
  var
    MFOName:String;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.cdsPrintMenuCalcFields') else _udebug := nil;{$ENDIF}

  with DataSet do begin
    case CountryRules.AR of
      accRul_RU: MFOName := rs('fmKAgent', 'BIC');
      accRul_UA: MFOName := rs('fmKAgent', 'MFO');
      else MFOName := rs('fmKAgent', 'ABA');
    end;

    FieldByName('ppitemname').AsString := rs('fmPayDoc','Account') + ' ' + FieldByName('accnum').AsString + ' ' + rs('fmPayDoc','In')
                                          + ' <' + FieldByName('name').AsString + '> ' + MFOName + ' ' + FieldByName('mfo').AsString;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.cdsPrintMenuAfterOpen(DataSet: TDataSet);
  (*var
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.cdsPrintMenuAfterOpen') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmAccOut.aPrintExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.aPrintExecute') else _udebug := nil;{$ENDIF}

  if (Sender is TTBCustomItem)
    then DoPrint((Sender as TTBCustomItem).Tag)
    else DoPrint(tbPrint.Tag);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.GetTaxes;
 var
   ACol: TdxDBTreeListColumn;
   FField: TFloatField;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.GetTaxes') else _udebug := nil;{$ENDIF}

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
procedure TfmAccOut.colTaxGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.colTaxGetText') else _udebug := nil;{$ENDIF}

  if AText <> '' then AText := AText + '%';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.colTaxRateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.colTaxRateGetText') else _udebug := nil;{$ENDIF}

  try
    if AText <> '' then AText := FormatFloat(MoneyDisplayFormat, StrToFloat(AText));
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.GetSummAll;
 var
   i, j: Integer;
   PriceCurrOutNDS, SummCurrOutNDS, SummCurrNDS, SummCurr, SummTax, PosSummTax,
   PriceDefOutNDS, SummDefOutNDS, SummDefNDS, SummDef: Extended;
   AllSummCurr, AllSummDefOutNDS, AllSummDefNDS, AllSummDef, FAmount :Extended;
   FNorm: Extended;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.GetSummAll') else _udebug := nil;{$ENDIF}

  with grdDet do begin
    AllSummCurr := 0;
    AllSummDefOutNDS := 0;
    AllSummDefNDS := 0;
    AllSummDef := 0;
    FAmount := 0;

    for i := 0 to Count - 1 do begin
      try
        FAmount := ssStrToFloat(Items[i].Values[colAmount.Index]);

        if cdsDetail.FindField('onvalue') <> nil
          then FCurrRate := Items[i].Values[colRate.Index];

        FNorm := 0;

        try
          if not VarIsNull(Items[i].Values[colNorm.Index])
            then FNorm := ssStrToFloat(Items[i].Values[colNorm.Index])
            else FNorm := 1;
            
        except
          FNorm := 0;
        end;

        if FNorm > 0 then FAmount := FNorm * FAmount;

        SummCurr := RoundToA(FAmount * ssStrToFloat(Items[i].Values[colPriceInCurr.Index]), -2);

        NDSCalc(FAmount, ssStrToFloat(Items[i].Values[colPriceInCurr.Index]),
                ssStrToFloat(Items[i].Values[colNDS.Index]), 1, SummDefOutNDS, SummDefNDS);

        SummDef := RoundToA(SummDefOutNDS + SummDefNDS, -2);
        SummDefOutNDS := SummDef - RoundToA(SummDefNDS, -2);
        PosSummTax := 0;

        for j := 0 to ColumnCount - 1 do begin
          if (Pos('colTax', Columns[j].Name) > 0) and
             (Pos('colTaxRate', Columns[j].Name) = 0) and
             (not VarIsNull(Items[i].Values[j]))
          then begin
            SummTax := RoundToA(SummDefOutNDS * ssStrToFloat(Items[i].Values[j]) / 100, -2);
            PosSummTax := PosSummTax + SummTax;
          end;
        end;

        Items[i].Values[colSummCurr.Index] := SummCurr + PosSummTax;
        AllSummCurr := AllSummCurr + SummCurr + PosSummTax;

      except
        Items[i].Values[colSummCurr.Index] := 0;
      end;

      try
        if FCurrRate > 0 then begin
          NDSCalc(FAmount, ssStrToFloat(Items[i].Values[colPriceInCurr.Index]) * FCurrRate,
                  ssStrToFloat(Items[i].Values[colNDS.Index]), 1, SummDefOutNDS, SummDefNDS);

          SummDef := RoundToA(SummDefOutNDS + SummDefNDS, -2);
          SummDefOutNDS := SummDef - RoundToA(SummDefNDS, -2);

          PosSummTax := 0;
          for j := 0 to ColumnCount - 1 do begin
            if (Pos('colTax', Columns[j].Name) > 0) and (Pos('colTaxRate', Columns[j].Name) = 0) and (not VarIsNull(Items[i].Values[j]))
            then begin
              SummTax := RoundToA(SummDefOutNDS * ssStrToFloat(Items[i].Values[j]) / 100, -2);
              Items[i].Values[ColumnByName('colTaxRate' + Copy(Columns[j].Name, 7, Length(Columns[j].Name) - 6)).Index] := SummTax;
              PosSummTax := PosSummTax + SummTax;
            end;
          end;

          SummDef := SummDef + PosSummTax;

          AllSummDefOutNDS := AllSummDefOutNDS + SummDefOutNDS;
          AllSummDefNDS := AllSummDefNDS + RoundToA(SummDefNDS, -2);
          AllSummDef := AllSummDef + SummDef;
          Items[i].Values[colSummDef.Index] := SummDef;
          Items[i].Values[colSummDefWONDS.Index] := SummDefOutNDS;
          Items[i].Values[colDetNDS.Index] := RoundToA(SummDefNDS, -2);

          NDSCalc(1, ssStrToFloat(Items[i].Values[colPriceInCurr.Index]) * FCurrRate,
                  ssStrToFloat(Items[i].Values[colNDS.Index]), 1, SummDefOutNDS, SummDefNDS);

          Items[i].Values[colPrice.Index] := RoundToA(SummDefOutNDS + SummDefNDS, -2);
          Items[i].Values[colPriceWONDS.Index] := RoundToA(SummDefOutNDS + SummDefNDS, -2) - RoundToA(SummDefNDS, -2);
         end
         else Items[i].Values[colSummDef.Index] := 0;

      except
        Items[i].Values[colSummDef.Index] := 0;
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
procedure TfmAccOut.colSummInCurrGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.colSummInCurrGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MoneyDisplayFormat, StrToFloat(DelChars(AText, [ThousandSeparator]))) + ' ' + ANode.Values[colCurrName.Index];
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.NotifyChanged;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.NotifyChanged') else _udebug := nil;{$ENDIF}

  if not JumpFromBuffer
    then frmMainForm.AddToBuffer(vtDocs, FunID, Self.Caption, ClassName, Tag, FCurrentID, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.aShowNullBallanceExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.aShowNullBallanceExecute') else _udebug := nil;{$ENDIF}

  if not aShowNullBallance.Checked
    then FShowNullBallanceStr := ' and (formatfloat(wblist.summall - coalesce(wblist.summpay, 0), -2)<>0 or wblist.checked<>2)'
    else FShowNullBallanceStr := '';

  DoRefresh(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.cbCheckedPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.cbCheckedPropertiesChange') else _udebug := nil;{$ENDIF}

  if CanRefresh then DoRefresh(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.colUrgentGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.colUrgentGetText') else _udebug := nil;{$ENDIF}

  case VarToInt(ANode.Values[colStatus.Index]) of
    0: AText := rs('fmWaybill', 'IsUrgent');
    1: AText := rs('fmWaybill', 'IsPartialyExecuted');
    2: AText := rs('fmWaybill', 'IsExecuted');
    3: AText := rs('fmWaybill', 'IsNotUrgent');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.grdDetNeedAdjust(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.grdDetNeedAdjust') else _udebug := nil;{$ENDIF}

  grdDet.Adjust(nil, [colPType, colReserved, colRecNo]);
  GetSummAll;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.FrameResize(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.FrameResize') else _udebug := nil;{$ENDIF}

  inherited;
  grdDetNeedAdjust(grdDet);
  //grdMain.Adjust(colName, [colImg, colChecked]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAccOut.aFreePosExecute(Sender: TObject);
 var
  i: Integer;
  {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAccOut.aFreePosExecute') else _udebug := nil;{$ENDIF}

  if ssMessageDlg(rs('fmWaybill', 'OkToFreeRsv'), ssmtWarning, [ssmbOk]) = mrOk
  then begin
    Application.ProcessMessages;
    TrStart;

    with newDataSet do
    try
      try
        for i := 0 to grdDet.SelectedCount - 1 do begin
          ProviderName := 'pPos_GetRsv';
          FetchParams;
          Params.ParamByName('posid').AsInteger := grdDet.SelectedNodes[i].Values[colPosID.Index];
          Open;
          if Fields[0].AsFloat = VarToFloat(grdDet.SelectedNodes[i].Values[colAmount.Index]) then begin
            Close;
            ProviderName := 'pPos_DelRsv';
            FetchParams;
            Params.ParamByName('posid').AsInteger := grdDet.SelectedNodes[i].Values[colPosID.Index];
            Execute;
          end
          else begin
            Close;
            ProviderName := 'pPos_UpdRsv';
            FetchParams;
            Params.ParamByName('posid').AsInteger := grdDet.SelectedNodes[i].Values[colPosID.Index];
            Execute;
          end;
        end;

        TrCommit;

      except
        TrRollback;
      end;
      aRefresh.Execute;
      RefreshFun('TfmWMat', 0);

    finally
      Free;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fAccOut', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
