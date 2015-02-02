{$I ok_sklad.inc}
unit EditOrderIn; // Order to supplier

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EditWaybill, FR_DSet, FR_DBSet, FR_Class, TB2Item, Menus,
  DBClient, ssClientDataSet, DB, dxmdaset, ActnList, ssFormStorage,
  ImgList, xButton, ssPanel, ssGradientPanel, okSearchEdit, cxPC,
  ssPageControl, cxCalc, ssCalcEdit, cxSpinEdit, cxTimeEdit, xLngDefs,
  cxDropDownEdit, ssDBLookupCombo, cxMaskEdit, cxCalendar, cxCheckBox,
  cxContainer, cxEdit, cxTextEdit, ssLabel, dxDBGrid6, dxTL6, dxDBCtrl6,
  dxDBTLCl6, dxGrClms6, dxCntner6, ssDBGrid, ssBevel, StdCtrls, cxControls,
  cxGroupBox, ssGroupBox, ssSpeedButton, ExtCtrls, Grids, DBGrids;

type
  TfrmEditOrderIn = class(TfrmEditWaybill)
    chbToDate: TcxCheckBox;
    colLocked: TdxDBGridColumn;
    edToDate: TcxDateEdit;
    mdDetdeleted: TIntegerField;
    mdDetlocked: TIntegerField;

    procedure aAddMatExecute(Sender: TObject);
    procedure aCDelExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aCUpdExecute(Sender: TObject);
    procedure aPrintExecute(Sender: TObject);
    procedure chbToDatePropertiesChange(Sender: TObject);
    procedure dbgWaybillDetCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure dbgWaybillDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mdDetFilterRecord(DataSet: TDataSet; var Accept: Boolean);

  protected
    procedure setid(const Value: integer); override;
    procedure GetSummAll; override;

  public
    procedure SetCaptions; override;
    procedure AddTmpPos(const APos: string);
    procedure DoHelp; override;
  end;

var
  frmEditOrderIn: TfrmEditOrderIn;

implementation

uses
  prConst, prFun, prTypes, ClientData, ssDateUtils, fMessageDlg,
  ssBaseConst, ssRegUtils, ssFun, ssBaseWBDocDlg, EditPosition,
  EditPositionSvc, ssStrUtil, xLngManager, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfrmEditOrderIn.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderIn.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderIn.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderIn.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    lTotal.Caption := rs('fmWaybill', 'TotalIn') + ' ' + BaseCurrName;
    lTotalCurr.Caption := rs('fmWaybill', 'TotalIn') + ' ' + cbCurr.EditingText + ':';

    chbToDate.Properties.Caption := GetRS('fmOrders', 'ReceiveTill') + ':';
    btnPrint.Hint := GetRS('fmOrders', 'PreviewOrder');
    lPersonName.Caption := GetRS('fmOrders', 'Resp') + ':';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderIn.setid(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditOrderIn.setid') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;
  CurrentNDS := NDS;

  if not cdsCurr.Active then begin
    cdsCurr.Open;
    cbCurr.KeyValue := BaseCurrID;
    colSummDef.Visible := False;
  end;

  cdsPayType.Open;
  cdsPersonName.Open;
  lcbPersonName.KeyValue := 0;
  lcbPersonName.Text := '';
  edDate.Date := OnDate;
  edTime.Time := Time;
  edToDate.Enabled := False;
  edToDate.Date := edDate.Date + DefOrderShipPeriod;
  chbToDate.Checked := False;
  mdDet.Open;
  SetRate;
  FID := Value;
  edKAgent.KAID := 0;

  with newDataSet do
  try
    if ((Value = 0) or IsPattern) and OrdersInAutoNum then begin
      FCurrNum := GetDocNum(dmData.SConnection, dtOrderIn, 1);
      edNum1.Text := OrdersInPrefix + IntToStr(FCurrNum) + OrdersInSuffix;
    end
    else edNum1.Text := EmptyStr;

    if Value > 0 then begin
      Self.Caption := rs('fmOrders', 'TitleEditIn');
      ProviderName := 'pWaybill_Get';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := Value;
      Open;
      if not IsEmpty then begin
        if not IsPattern then begin
          edNum1.Text := FieldByName('num').AsString;
          edNum1.Tag := FieldByName('defnum').AsInteger;
          edDate.Date := FieldByName('ondate').AsDateTime;
          edTime.Time := FieldByName('ondate').AsDateTime;
        end;

        cdsPayType.Locate('ptypeid', lcbPayType.KeyValue,[]);
        edKAgent.KAID := FieldByName('kaid').AsInteger;

        if not FieldByName('personid').IsNull
          then lcbPersonName.KeyValue := FieldByName('personid').AsInteger;

        edReason.Text := FieldByName('reason').asstring;
        edNotes.Text := FieldByName('notes').AsString;

        if not FieldByName('todate').IsNull then begin
          chbToDate.Checked := True;
          edToDate.Date := FieldByName('todate').AsDateTime;
        end
        else chbToDate.Checked := False;

        cbCurr.KeyValue := FieldByName('currid').AsInteger;
        SetRate;
        chbPosting.Checked := FieldByName('checked').AsInteger = 1;
        CurrentNDS := FieldByName('nds').AsFloat;
        chbCheckNDS.Tag := 1;

        if FieldByName('attnum').AsString = ''
          then lcbWH.WID := 0
          else
            try
              lcbWH.WID := StrToInt(FieldByName('attnum').AsString);
            except
            end;
      end;
      Close;

      ProviderName := 'pDocsRel_WB_Contr_Get';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := FID;
      Params.ParamByName('doctype').AsInteger := 8;
      Open;
      if not IsEmpty then begin
        edContr.DocID := FieldByName('rdocid').AsInteger;
        FContrDocID := edContr.DocID;
      end
      else edContr.DocID := 0;
      Close;

      ProviderName := prvDet;
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := FID;
      Open;
      mdDet.LoadFromDataSet(Fields[0].DataSet);
      mdDet.First;
      while not mdDet.Eof do begin
        mdDet.Edit;

        if IsPattern
          then mdDet.FieldByName('posid').AsInteger := -mdDet.FieldByName('posid').AsInteger;

        if mdDet.FieldByName('fullprice').IsNull
          then mdDet.FieldByName('fullprice').AsFloat := mdDet.FieldByName('price').AsFloat;

        mdDet.Post;
        UpdatePos;
        mdDet.Next;
      end;
      Close;
      SelectFocusedNode;

      if not IsPattern then begin
        ProviderName := 'pWMatTurn_GetRsvWBIn';
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := Value;
        Open;
        while not Eof do begin
          if mdDet.Locate('posid', FieldByName('posid').AsInteger, []) then begin
            mdDet.Edit;
            mdDet.FieldByName('locked').AsInteger := 1;
            mdDet.Post;
          end;
          Next;
        end;
        mdDet.First;
        Close;
      end;

      if not IsPattern then begin
        ProviderName := 'pWayBillPay_Get';// Чтение платежа
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := FID;
        Open;
        if not IsEmpty then begin
          chbPay.Enabled := False;
          chbPay.Checked := True;
          chbPay.Enabled := True;
          PayDocChecked := FieldByName('Checked').AsInteger = 1;

          if not FieldByName('mpersonid').IsNull
            then lcbPayMPerson.KeyValue := FieldByName('mpersonid').AsInteger;

          chbPay.Enabled := not PayDocChecked;

          if not chbPay.Enabled then begin
            lcbPayType.Enabled := False;
            lPayMPerson.Enabled := False;
            lcbPayMPerson.Enabled := False;
            aPayMPersons.Enabled := False;
            lPaySumm.Enabled := False;
            lPayCurr.Enabled := False;
            lPayType.Enabled := False;
            btnPayMPerson.Enabled := False;
            edPaySumm.Enabled := False;
            edPayNum.Enabled := False;
            lcbCashDesks.Enabled := False;
            lcbAccount.Enabled := False;
            lAcc.Enabled := False;
            lCashDesks.Enabled := False;
            btnCashDesks.Enabled := False;
            cbPayCurr.Enabled := False;
            btnFinPay.Enabled := False;
          end;
          PayDocId := FieldByName('paydocid').AsInteger;
          OldPayDocID := PayDocID;
          PayDocDate := FieldByName('ondate').AsDateTime;
          edPayNum.Text := FieldByName('docnum').AsString;
          lcbPayType.KeyValue := FieldByName('ptypeid').AsInteger;
          edPaySumm.Tag := 1;
          edPaySumm.Value := FieldByName('total').AsFloat;
          edPaySumm.Tag := 0;

          if cdsPayType.Locate('ptypeid', FieldByName('currid').AsInteger, [])
            then if not FieldByName('accid').IsNull
              then lcbAccount.KeyValue := FieldByName('accid').AsInteger
              else lcbAccount.Clear;

          if not FieldByName('cashid').IsNull
            then lcbCashDesks.KeyValue := FieldByName('cashid').AsInteger
            else lcbCashDesks.Clear;

          cbPayCurr.KeyValue := FieldByName('currid').AsInteger;
        end
        else begin //if not IsEmpty
          PayDocChecked := False;
          PayDocId := 0;
          chbPay.Enabled := False;
          chbPay.Checked := False;
          chbPay.Enabled := True;
          edPayNum.Text := EmptyStr;
          edPaySumm.Tag := 1;
          edPaySumm.Value := 0;
          edPaySumm.Tag := 0;
        end;//else
        Close;
      end;

      if IsPattern then FID := 0;
    end//if Value<>0
    else Self.Caption := rs('fmOrders', 'TitleAddIn');

    FModified := False;
    FPosModified := isPattern;
    FGridRefresh := True;
    FPayDocModified := False;

  finally
    Free;
  end;

  if Value = 0 then begin
    with cdsPayMPersons do begin
      if Locate('userid', UserID, []) then lcbPersonName.KeyValue := FieldByName('kaid').AsInteger;
    end;
  end;

  if UserID <> 0 then begin
    lcbPersonName.Enabled := False;
    btnPersonName.Enabled := False;
    if Value <> 0 then  // editing enabled only for document owner or admin
      with cdsPayMPersons do
        if Locate('userid', UserID, []) and (lcbPersonName.KeyValue <> FieldByName('kaid').AsInteger)
        then EditingDisabled := True;
  end;

  if not GetUserAccessByClass(Self.ParentNameEx, uaPost) then begin
    chbPosting.Hint := rs('Common', 'noRights');
    chbPosting.Checked := False;
    chbPosting.Enabled := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderIn.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    NewRecord: boolean;
    BM:TBookmark;
    tmpid:integer;
    FPosID, intTmp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderIn.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult in [mrOK, mrYes] then begin
    CanClose := False;

    if not CheckDocDate(edDate.Date) then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

    if chbPay.Checked and chbPay.Enabled and FPayDocModified and chbPosting.Checked then begin
      if mrYes = ssMessageDlg(rs('fmPayDoc', 'CheckMoneyMode'), ssmtWarning, [ssmbYes, ssmbNo], 'CheckMoneyMode', True)
      then begin
        if not ReadFromRegInt(MainRegKey, 'CheckMoneyModeEx', intTmp) then begin
          SavePrgParam(dmData.SConnection, 'CheckMoney', 1);
          CheckMoney := True;
          if ReadFromRegInt(MainRegKey, 'CheckMoneyMode', intTmp)
            then WriteToRegInt(MainRegKey, 'CheckMoneyModeEx', 1);
        end
      end
      else begin
        if not ReadFromRegInt(MainRegKey, 'CheckMoneyModeEx', intTmp) then begin
          SavePrgParam(dmData.SConnection, 'CheckMoney', 0);
          CheckMoney := False;
          if ReadFromRegInt(MainRegKey, 'CheckMoneyMode', intTmp)
            then WriteToRegInt(MainRegKey, 'CheckMoneyModeEx', 1);
        end;
      end;
    end;

    if chbPay.Checked and chbPay.Enabled and chbPosting.Checked
      and not CheckMoneyDlg(dmData.SConnection, edDate.Date, lcbPayType.KeyValue - 1,
        lcbAccount.KeyValue, lcbCashDesks.KeyValue, cbPayCurr.KeyValue,
        edPaySumm.EditValue)
    then begin
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    with newDataSet do begin
      try
        TrStart;

        try
          Screen.Cursor := crSQLWait;
          NewRecord := (ID = 0);

          if NewRecord then begin
            FID := GetMaxID(dmData.SConnection, 'waybilllist', 'wbillid');
            ProviderName := 'pWaybill_InsEx'
          end
          else ProviderName := 'pWaybill_UpdEx';

          FetchParams;
          Params.ParamByName('wbillid').AsInteger := FID;
          Params.ParamByName('num').AsString := edNum1.Text;
          Params.ParamByName('defnum').AsInteger := 0;
          Params.ParamByName('ondate').AsDateTime := Int(edDate.Date) + Frac(edTime.Time);
          Params.ParamByName('kaid').AsInteger := edKAgent.KAID;
          Params.ParamByName('currid').AsInteger := cbCurr.KeyValue;

          if lcbWH.Combo.EditingText = ''
            then Params.ParamByName('ATTNUM').AsString := EmptyStr
            else Params.ParamByName('ATTNUM').AsString := IntToStr(lcbWH.WID);

          Params.ParamByName('attdate').DataType := ftDateTime;
          Params.ParamByName('attdate').Clear;
          Params.ParamByName('reason').AsString := edReason.EditingText;
          Params.ParamByName('notes').AsString := edNotes.EditingText;

          if (lcbPersonName.EditText = '') or (lcbPersonName.KeyValue = 0) then begin
            Params.ParamByName('personid').DataType := ftInteger;
            Params.ParamByName('personid').Clear;
          end
          else Params.ParamByName('personid').AsInteger := lcbPersonName.KeyValue;

          Params.ParamByName('checked').AsInteger := 0;
          Params.ParamByName('wtype').AsInteger := 16;//тип накладной 16-заказ поставщику;
          Params.ParamByName('deleted').AsInteger := 0;
          Params.ParamByName('summall').AsFloat := RoundToA(AllSumm, -2);
          Params.ParamByName('onvalue').AsFloat := edRate.Value;
          Params.ParamByName('summincurr').AsFloat := AllSummCurr;
          Params.ParamByName('nds').AsFloat := RoundToA(CurrentNDS, -2);
          Params.ParamByName('received').AsString := EmptyStr;

          if chbToDate.Checked
            then Params.ParamByName('todate').AsDateTime := edToDate.Date
            else begin
              Params.ParamByName('todate').DataType := ftDateTime;
              Params.ParamByName('todate').Clear;
            end;

          Params.ParamByName('entid').DataType := ftInteger;
          Params.ParamByName('entid').Clear;
          Execute;

          if FPosModified then begin // Запись позиций в накладную
            ProviderName := 'pWaybillSvc_Del';
            FetchParams;
            Params.ParamByName('wbillid').AsInteger := FID;
            Execute;

            BM := mdDet.GetBookmark;
            mdDet.DisableControls;
            mdDet.Filtered := False;
            mdDet.First;

            while not mdDet.Eof do begin
              if mdDet.FieldByName('postype').AsInteger = 0 then begin
                if mdDet.FieldByName('deleted').AsInteger = 1 then begin
                  ProviderName := 'pWaybillDet_DelByPos';
                  FetchParams;
                  Params.ParamByName('posid').AsInteger := mdDet.FieldByName('posid').AsInteger;
                  Execute;
                end
                else begin
                  if mdDet.FieldByName('posid').AsInteger < 0 then begin
                    ProviderName := 'pWaybillDet_Ins';
                    FPosID := GetMaxID(dmData.SConnection, 'waybilldet', 'posid');
                  end
                  else begin
                    ProviderName := 'pWaybillDet_UpdEx2';
                    FPosID := mdDet.FieldByName('posid').AsInteger;
                  end;

                  FetchParams;
                  Params.ParamByName('posid').AsInteger := FPosID;
                  Params.ParamByName('wbillid').AsInteger := FID;
                  Params.ParamByName('matid').AsInteger := mdDet.fieldbyname('matid').AsInteger;
                  Params.ParamByName('wid').AsInteger := mdDet.fieldbyname('wid').AsInteger;
                  Params.ParamByName('amount').AsFloat := RoundToA(StrToFloat(mdDet.FieldByName('amount').AsString), MatDisplayDigits);

                  if mdDet.FieldByName('price').IsNull then begin
                    Params.ParamByName('price').DataType := ftFloat;
                    Params.ParamByName('price').Clear;
                  end
                  else Params.ParamByName('price').AsFloat := RoundToA(StrToFloat(mdDet.FieldByName('price').AsString), PriceDisplayDigits);

                  Params.ParamByName('discount').DataType := ftFloat;
                  Params.ParamByName('discount').Clear;
                  Params.ParamByName('nds').AsFloat := mdDet.FieldByName('nds').AsFloat;
                  Params.ParamByName('currid').AsInteger := cbCurr.KeyValue;
                  Params.ParamByName('onvalue').AsFloat := mdDet.FieldByName('onvalue').AsFloat;
                  Params.ParamByName('ondate').AsDateTime := edDate.Date + edTime.Time;
                  Params.ParamByName('ptypeid').DataType := ftInteger;
                  Params.ParamByName('ptypeid').Clear;
                  Params.ParamByName('num').AsInteger := mdDet.RecNo;
                  Params.ParamByName('total').AsFloat := 0;
                  Execute;
                end;
              end
              else begin
                ProviderName := 'pWaybillSvc_Ins';
                FetchParams;
                FPosID := GetMaxID(dmData.SConnection, 'waybillsvc', 'posid');
                Params.ParamByName('posid').AsInteger := FPosID;
                Params.ParamByName('wbillid').AsInteger := FID;
                Params.ParamByName('svcid').AsInteger := mdDet.fieldbyname('matid').AsInteger;
                Params.ParamByName('amount').AsFloat := RoundToA(StrToFloat(mdDet.fieldbyname('amount').AsString), MatDisplayDigits);
                Params.ParamByName('price').AsFloat := StrToFloat(mdDet.fieldbyname('price').AsString);
                Params.ParamByName('norm').AsFloat := StrToFloat(mdDet.fieldbyname('norm').AsString);
                Params.ParamByName('discount').AsFloat := StrToFloat(mdDet.fieldbyname('discount').AsString);
                Params.ParamByName('nds').AsFloat := StrToFloat(mdDet.fieldbyname('NDS').AsString);
                Params.ParamByName('currid').AsInteger := cbCurr.KeyValue;
                Params.ParamByName('num').AsInteger := mdDet.RecNo;

                if not mdDet.FieldByName('personid').IsNull
                  then Params.ParamByName('personid').AsInteger := mdDet.FieldByName('personid').AsInteger
                  else begin
                    Params.ParamByName('personid').DataType := ftInteger;
                    Params.ParamByName('personid').Clear;
                  end;

                Execute;
              end;

              mdDet.Next;
            end;//while not mdDet.Eof

            mdDet.GotoBookmark(BM);
            FreeBookmark(BM);
            mdDet.EnableControls;

            ProviderName := 'pWMatTurn_Del';
            FetchParams;
            Params.ParamByName('wbillid').AsInteger := FID;
            Execute;
            ProviderName := 'pWMTOrder_Ins';
            FetchParams;
            Params.ParamByName('wbillid').AsInteger := FID;
            Execute;

            FPosModified := False;
          end;

          if FPayDocModified then begin
            if OldPayDocId > 0 then begin
              PayDocId := OldPayDocId;
              PayDocDate := edDate.Date;
            end;

            if chbPay.Checked then begin
              if PayDocId > 0 then begin //если платёж существует, то обновляем
                ProviderName := 'pWaybillPayDoc_Upd';
                FetchParams;
              end
              else begin
                //Получить ID нового платежа
                PayDocId := GetMaxID(dmData.SConnection, 'paydoc', 'paydocid');
                ProviderName := 'pPayDoc_Ins';
                FetchParams;
                Params.ParamByName('withnds').AsInteger := 1;
                Params.ParamByName('doctype').AsInteger := -1;
                Params.ParamByName('notes').AsString := '';
                PayDocDate := edDate.Date + Time;
              end;// если платёж не существует

              Params.ParamByName('reason').AsString := '';//RS('fmWaybill', 'TitleWaybill') + amountPrefix + edNum1.Text;

              if lcbPayMPerson.Text = EmptyStr then begin
                Params.ParamByName('mpersonid').DataType := ftInteger;
                Params.ParamByName('mpersonid').Clear;
              end
              else Params.ParamByName('mpersonid').AsInteger := lcbPayMPerson.KeyValue;

              if lcbPayType.KeyValue = 1
                then Params.ParamByName('cashid').AsInteger := lcbCashDesks.KeyValue
                else begin
                  Params.ParamByName('cashid').DataType := ftInteger;
                  Params.ParamByName('cashid').Clear;
                end;

              if (lcbPayType.KeyValue = 2) and (lcbAccount.EditText <> EmptyStr)
                then Params.ParamByName('accid').AsInteger := lcbAccount.KeyValue
                else begin
                  Params.ParamByName('accid').DataType := ftInteger;
                  Params.ParamByName('accid').Clear;
                end;

              Params.ParamByName('ondate').AsDateTime := PayDocDate;
              Params.ParamByName('kaid').AsInteger := edKAgent.KAID;
              Params.ParamByName('paydocid').AsInteger := PayDocId;
              Params.ParamByName('docnum').AsString := edPayNum.Text;
              Params.ParamByName('ptypeid').AsInteger := lcbPayType.KeyValue;
              Params.ParamByName('currid').AsInteger := cbPayCurr.KeyValue;

              if cbCurr.KeyValue = cbPayCurr.KeyValue
                then Params.ParamByName('onvalue').AsFloat := StrToFloat(edRate.EditingText)
                else Params.ParamByName('onvalue').AsFloat := GetCurrencyRateEx(dmData.SConnection, cbPayCurr.KeyValue, edDate.Date);

              Params.ParamByName('total').AsFloat := edPaySumm.Value;
              Params.ParamByName('checked').AsInteger := Integer(chbPosting.Checked);
              Params.ParamByName('ctypeid').AsInteger := 1;
              Execute;

              if ProviderName = 'pPayDoc_Ins' then begin // Если плётёж новый
                ProviderName := 'pWaybillPay_Ins';       // то записываем его в WaybillPay
                FetchParams;
                Params.ParamByName('WBILLID').AsInteger := FID;
                Params.ParamByName('paydocid').AsInteger := PayDocId;
                Execute;
              end;//if ProviderName='pPayDoc_Ins'
            end // if chbPay.Checked
            else begin                  //Удаление платежа
              if PayDocId > 0 then begin // если он существует
{ProviderName := 'pWayBillPay_Del';
                FetchParams;
                Params.ParamByName('WBillID').AsInteger := FID;
                Execute; // Удаление из WaybillPay}
                ProviderName := 'pPayDoc_Del';
                FetchParams;
                Params.ParamByName('PayDocId').AsInteger := PayDocId;
                Execute; //Удаление из PayDoc
                PayDocId := 0;
                OldPayDocId := 0;
              end;//if PayDocId>0
            end;//else chbPay.Checked
            FPayDocModified := false;
          end;//if FPayDocModified

          if not NewRecord and (FContrDocID > 0) then begin
            ProviderName := 'pDocsRel_WB_Contr_Del';
            FetchParams;
            Params.ParamByName('docid').AsInteger := FContrDocID;
            Params.ParamByName('wbillid').AsInteger := FID;
            Execute;
          end;

          if edContr.DocID > 0 then begin
            ProviderName := 'pDocsRel_WB_Contr_Ins';
            FetchParams;
            Params.ParamByName('docid').AsInteger := edContr.DocID;
            Params.ParamByName('wbillid').AsInteger := FID;
            Execute;
          end;

          FModified := False;

          TrCommit;

          DoRecalcKASaldo(dmData.SConnection, edKAgent.KAID, edDate.Date, rs('fmWaybill', 'RecalcBallance'));

          if (ModalResult = mrYes) then begin
            if NewRecord then begin
              edDate.Date := Date;
              edKAgent.KAID := 0;
              edReason.Text := EmptyStr;
              chbPosting.Checked := false;
              mdDet.Close;
  //  {???}       SendMessage(MainHandle, WM_REFRESH, ID, 0);

              ID := 0;

              if OrdersInAutoNum
                then edKAgent.Editor.SetFocus
                else edNum1.SetFocus;
            end//if NewRecord
            else begin
              if chbPosting.Checked
                then CanClose := true
                else begin
                  if PDOutAutoNum and (OldPayDocID = 0) and chbPay.Checked
                    then FCurrPayNum := GetDocNum(dmData.SConnection, dtPDOut, 1);

                  OldPayDocId := PayDocID;
                end;
            end//else NewRecord
          end
          else CanClose := True;

          FGridRefresh := true;

          FPaySummChange := true;
          SendMessage(MainHandle, WM_REFRESH, ID, 0);
          RefreshFun('TfmPayDoc', 0);
          RefreshFun('TfmFinance', 0);
          RefreshFun('TfmWMat', 0);

        finally
          Free;
          Screen.Cursor := crDefault;
        end;

      except
        on e:exception do begin
          TrRollback;
          raise;
        end;
      end;
    end;// with TClientDataSet.Create(nil)
  end// if ModalResult in [mrOK, mrYes]

  else begin
    if GetDocNum(dmData.SConnection, dtOrderIn, 0) = FCurrNum
      then GetDocNum(dmData.SConnection, dtOrderIn, -1);

     if GetDocNum(dmData.SConnection, dtPDOut, 0) = FCurrPayNum
      then GetDocNum(dmData.SConnection, dtPDOut, -1);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;//FormCloseQuery

//==============================================================================================
procedure TfrmEditOrderIn.chbToDatePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderIn.chbToDatePropertiesChange') else _udebug := nil;{$ENDIF}

  edToDate.Enabled := chbToDate.Checked;
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderIn.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderIn.FormShow') else _udebug := nil;{$ENDIF}

  inherited;
  lcbWH.AdjustCtrls;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderIn.dbgWaybillDetGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderIn.dbgWaybillDetGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := rs('fmWaybill', 'DocOrderIn');
  ImgList := dmData.Images;
  AIndex := II_ORDERIN;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderIn.aCUpdExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderIn.aCUpdExecute') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;
  case mdDet.FieldByName('postype').AsInteger of
    0:
      with TfrmEditPosition.Create(frmEditPosition) do
      try
        ParentNameEx := Self.ParentNameEx;
        OnDate := Self.OnDate;
        DocType := dtOrderIn;
        WID := lcbWH.WID;
        dbgWaybillDet.SetFocus;
        PosNDS := CurrentNDS;
        NDSPayer := CurrEnt.NDSPayer;

        panSN.Hide;
        panSN.Tag := 1;
        PanAddProps.Hide;
        PanAddProps.Tag := 1;

        ParentHandle := Self.Handle;
        CurrID := cbCurr.KeyValue;
        Kurs := CurKurs;
        parentMdDet := mdDet; //Tag := integer(mdDet);
        CurrName := cdsCurr.fieldbyname('shortname').AsString;
        CurrDefName := BaseCurrName;
        CurrShortName := defCurrShortName;
        Locked := mdDet.FieldByName('locked').AsInteger = 1;
        id := mdDet.FieldByName('posid').AsInteger;
        Caption := rs('fmWaybill', 'PosEdit');
        Screen.Cursor := crDefault;
        ShowModal;

      finally
        Free;
        Screen.Cursor := crDefault;
      end;//try

    1:
      with TfrmEditPositionSvc.Create(nil) do
      try
        ParentHandle := Self.Handle;
        ParentNameEx := Self.ParentNameEx;
        OnDate := Int(edDate.Date) + Frac(edTime.Time);
        FRateValue := Self.edRate.Value;
        CurrID := Self.cbCurr.KeyValue;
        mdDet := Self.mdDet;
        PosNDS := StrToFloat(mdDet.fieldbyname('NDS').AsString);
        ID := Self.mdDet.FieldByName('posid').AsInteger;
        ShowModal;
      finally
        Free;
        Screen.Cursor := crDefault;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderIn.aAddMatExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderIn.aAddMatExecute') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;

  with TfrmEditPosition.Create(frmEditPosition) do
  try
    ParentNameEx := Self.ParentNameEx;
    OnDate := edDate.Date + edTime.Time;
    DocType := dtOrderIn;
    WID := lcbWH.WID;
    PosNDS := CurrentNDS;
    NDSPayer := CurrEnt.NDSPayer;

    panSN.Hide;
    panSN.Tag := 1;
    PanAddProps.Hide;
    PanAddProps.Tag := 1;

    ParentHandle := Self.Handle;
    CurrID := Self.cbCurr.KeyValue;
    Kurs := CurKurs;
    parentMdDet := mdDet; //Tag := integer(mdDet);
    id := 0;
    CurrDefName := BaseCurrName;
    CurrShortName := defCurrShortName;
    CurrName := cdsCurr.fieldbyname('shortname').AsString;
    Caption := rs('fmWaybill', 'PosAdd');
    Screen.Cursor := crDefault;
    ShowModal;

  finally
    if not mdDet.IsEmpty then begin
      //dbgWaybillDet.Enabled := true;
      dbgWaybillDet.SetFocus;
    end;
    Free;
    Screen.Cursor := crDefault;
  end;//try

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderIn.GetSummAll;
  var
    i: Integer;
    PriceCurrOutNDS, SummCurrOutNDS, SummCurrNDS, SummCurr, FAmount, FNorm,
    PriceDefOutNDS, SummDefOutNDS, SummDefNDS, SummDef,
    AllSummDefOutNDS, AllSummDefNDS, AllSummDef, FNDS :Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderIn.GetSummAll') else _udebug := nil;{$ENDIF}

  with dbgWaybillDet do begin
    AllSummCurr := 0;
    AllSummDefOutNDS := 0;
    AllSummDefNDS := 0;
    AllSummDef := 0;
    FAmount := 0;

    for i := 0 to Count - 1 do begin
      try
        if not VarIsNull(Items[i].Values[colNorm.Index])
          then FNorm := ssStrToFloat(Items[i].Values[colNorm.Index])
          else FNorm := 0;

        FAmount := ssStrToFloat(Items[i].Values[colAmount.Index]);

        if (Items[i].Values[colPType.Index] = 1) and (FNorm > 0)
          then FAmount := FAmount * FNorm;

        SummCurr := RoundToA(FAmount * ssStrToFloat(Items[i].Values[colPriceInCurr.Index]), -2);
        AllSummCurr := AllSummCurr + SummCurr;

      except
      end;

      try
        try
          FNDS := ssStrToFloat(Items[i].Values[colNDSRate.Index]);
        except
          FNDS := NDS;
        end;

        {Цены с НДС и без НДС}
        NDSCalc(1, ssStrToFloat(Items[i].Values[colPriceInCurr.Index]) * CurKurs, FNDS, 1, SummDefOutNDS, SummDefNDS);

        NDSCalc(FAmount, ssStrToFloat(Items[i].Values[colPriceInCurr.Index]) * CurKurs, FNDS, 1, SummDefOutNDS, SummDefNDS);

        SummDef := RoundToA(SummDefOutNDS + SummDefNDS, -2);
        AllSummDefOutNDS := AllSummDefOutNDS + SummDefOutNDS;
        AllSummDefNDS := AllSummDefNDS + RoundToA(SummDefNDS, -2);
        //Сумма в нац. валюте с НДС;
        AllSummDef := AllSummDef + SummDef;

      except
      end;
    end;

    AllSummDef := RoundToA(AllSummDef, -2);
    AllSummDefOutNDS := AllSummDef - AllSummDefNDS;

    lSummCurr.Caption := FormatFloat(MoneyDisplayFormat, AllSummCurr);
    lSummCurr.Hint := lSummCurr.Caption;
    lSummDefNoNDS.Caption := FormatFloat(MoneyDisplayFormat, AllSummDefOutNDS);
    lSummDefNoNDS.Hint := lSummDefNoNDS.Caption;
    lSummDefNDS.Caption := FormatFloat(MoneyDisplayFormat, AllSummDefNDS);
    lSummDefNDS.Hint := lSummDefNDS.Caption;
    lSummDef.Caption := FormatFloat(MoneyDisplayFormat, AllSummDef);
    lSummDef.Hint := lSummDef.Caption;
    AllSumm := AllSummDef;
  end;

  FGridRefresh := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderIn.dbgWaybillDetCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderIn.dbgWaybillDetCustomDrawCell') else _udebug := nil;{$ENDIF}

  inherited;

  if VarToInt(ANode.Values[colLocked.Index]) = 1 then AFont.Color := clBtnShadow;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderIn.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  var
    FPaySum: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderIn.ActionListUpdate') else _udebug := nil;{$ENDIF}

  chbPay.Enabled := not PayDocChecked;

  if (chbPay.Checked) and (not PayDocChecked)
    then try
      FPaySum := StrToFloat(edPaySumm.EditingText);
    except
      FPaySum := 0;
    end
    else FPaySum := 1;

  if edContr.Obj.DocID > 0 then cbPayCurr.Enabled := False;

  if FGridRefresh then begin
    dbgWaybillDet.BeginUpdate;
    try
      GetSummAll;
      if not PayDocChecked and chbPay.Checked and not FPaySummChange and (dbgWaybillDet.Tag <> 0)
      then begin
        edPaySumm.Tag := 1;
        edPaySumm.Value := RoundToA(AllSumm, -2);
        edPaySumm.Tag := 0;
      end;

      dbgWaybillDet.Tag := dbgWaybillDet.Tag + 1;

    finally
      dbgWaybillDet.EndUpdate;
    end;
  end;

  lSummCurr.Visible := cbCurr.KeyValue <> BaseCurrID;
  lTotalCurr.Visible := cbCurr.KeyValue <> BaseCurrID;

  aOk.Enabled := (Trim(edNum1.Text) <> EmptyStr)
    and (edDate.Text <> EmptyStr)
    and (edKAgent.KAID > 0)
    and (cbCurr.KeyValue > 0)
    and (not mdDet.IsEmpty)
    and ((chbPay.Checked and (FPaySum > 0)
    and (Trim(edPayNum.Editor.EditingText) <> '')) or not chbPay.Checked);

  aSelectAll.Enabled := not mdDet.IsEmpty;
  aApply.Enabled := aOk.Enabled and (FModified or FPosModified or FPayDocModified) and (FOrderID = 0) and (FID = 0);

  aCIns.Enabled := True;
  itmAdd.Enabled := True;
  aCDel.Enabled := not mdDet.IsEmpty and (mdDet.FieldByName('locked').AsInteger <> 1);
  aCUpd.Enabled := not mdDet.IsEmpty and (dbgWaybillDet.SelectedCount = 1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderIn.mdDetFilterRecord(DataSet: TDataSet; var Accept: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderIn.mdDetFilterRecord') else _udebug := nil;{$ENDIF}

  Accept := DataSet.FieldByName('deleted').AsInteger <> 1;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderIn.aCDelExecute(Sender: TObject);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderIn.aCDelExecute') else _udebug := nil;{$ENDIF}

  if ((dbgWaybillDet.SelectedCount = 1)
      and (ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo]) <> mrYes
     ))
     or
     ((dbgWaybillDet.SelectedCount > 1)
      and (mrYes <> ssMessageDlg(Format(rs('Common', 'DelConfirmEx'), [dbgWaybillDet.SelectedCount]), ssmtWarning, [ssmbYes, ssmbNo])))
  then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  Screen.Cursor := crSQLWait;
  mdDet.DisableControls;
  try
    for i := 0 to dbgWaybillDet.SelectedCount - 1 do begin
      if mdDet.Locate('posid', dbgWaybillDet.SelectedNodes[i].Values[colPosID.Index], [])
      then if ((mdDet.FindField('locked') <> nil) and (mdDet.FieldByName('locked').AsInteger <> 1)) or (mdDet.FindField('locked') = nil)
           then
             if mdDet.FieldByName('posid').AsInteger < 0
               then mdDet.Delete
               else begin
                 mdDet.Edit;
                 mdDet.FieldByName('deleted').AsInteger := 1;
                 mdDet.Post;
                 mdDet.Filtered := True;
               end;
    end;
    LocateAfterDel;
    FGridRefresh := True;

  finally
    Screen.Cursor := crDefault;
    mdDet.EnableControls;
    SelectFocusedNode;
    dbgWaybillDet.Adjust(nil, [colPosType, colRecNo]);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderIn.AddTmpPos(const APos: string);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderIn.AddTmpPos') else _udebug := nil;{$ENDIF}

  with newDataSet do
  try
    ProviderName := 'pWaybillDet_GetIn';
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := -16;
    Open;
    mdDet.Close;
    mdDet.Open;

    while not Eof do begin
      if WordPositionEx(IntToStr(FieldByName('posid').AsInteger), APos, [',']) <> -1 then begin
        mdDet.Append;

        for i := 0 to FieldCount - 1 do
          if mdDet.FindField(Fields[i].FieldName) <> nil
            then mdDet.FieldByName(Fields[i].FieldName).AsVariant := FieldByName(Fields[i].FieldName).AsVariant;

        mdDet.FieldByName('currid').AsInteger := cbCurr.KeyValue;
        mdDet.FieldByName('onvalue').AsFloat := edRate.Value;
        mdDet.Post;
        UpdatePos;
      end;
      Next;
    end;

    Close;
    mdDet.First;
    lcbWH.OnChange := nil;

    if mdDet.FieldByName('wid').AsInteger > 0
      then lcbWH.WID := mdDet.FieldByName('wid').AsInteger;

    lcbWH.OnChange := lcbWHChange;

    if dbgWaybillDet.FocusedNode <> nil
      then dbgWaybillDet.FocusedNode.Selected := True;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderIn.aPrintExecute(Sender: TObject);
  var
    FSumWONDS, FNDS, FSumWithNDS: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderIn.aPrintExecute') else _udebug := nil;{$ENDIF}

  if mdDet.IsEmpty then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  mdReport.CopyFromDataSet(mdDet);

  mdReport.Close;
  with TFloatField.Create(mdReport) do begin
    FieldName := 'price2';
    FieldKind := fkData;
    Required := False;
    DataSet := mdReport;
    mdReport.FieldDefs.Add(FieldName, ftFloat, 0, False);
  end;//with
  mdReport.LoadFromDataSet(mdDet);

  mdReport.First;
  while not mdReport.Eof do begin
    mdReport.Edit;
    mdReport.FieldByName('price2').AsFloat := mdReport.FieldByName('price').AsFloat;

    if PrintType = 0 then begin
      NDSCalc(1, mdReport.FieldByName('price').AsFloat, mdReport.FieldByName('nds').AsFloat, 1, FSumWONDS, FNDS);
      FSumWithNDS := RoundToA(FSumWONDS + FNDS, -2);
      FSumWONDS := FSumWithNDS - FNDS;
      mdReport.FieldByName('price').AsFloat := FSumWONDS;//NDSOut(mdReport.FieldByName('price').AsFloat,mdReport.FieldByName('nds').AsFloat);
    end;

    mdReport.Post;
    mdReport.Next;
  end;

  FGridRefresh := True;

  SmartShowRep(frDoc, 'Order_In.frf');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderIn.DoHelp;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderIn.DoHelp') else _udebug := nil;{$ENDIF}

  ShowHelpTopic('fmOrdersIn');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditOrderIn', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
