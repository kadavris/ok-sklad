{$I ok_sklad.inc}
unit EditWBReturnOut; // return to supplier

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ssBaseWBDocOut, FR_DSet, FR_DBSet, FR_Class, ssMemDS, TB2Item,
  Menus, DB, dxmdaset, ActnList, ssFormStorage, ImgList, xButton, ssPanel,
  ssGradientPanel, cxSpinEdit, cxTimeEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxCheckBox, cxContainer, cxEdit, cxTextEdit, dxDBTLCl6,
  dxGrClms6, dxTL6, dxDBCtrl6, dxDBGrid6, dxCntner6, ssDBGrid, ssBevel,
  StdCtrls, cxControls, cxGroupBox, ssGroupBox, ssSpeedButton, ExtCtrls,
  okSearchEdit, ssDBLookupCombo, DBClient, ssClientDataSet, prTypes,
  ssBaseConst, cxCalc, ssCalcEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, ssDBComboBox, ssLabel, cxPC, ssPageControl;

type
  TfrmEditWBReturnOut = class(TfrmBaseWBDocOut)
    aAddMat: TAction;
    aAddMatList: TAction;
    aOrdersInfo: TAction;
    btnOrdersInfo: TssSpeedButton;
    btnPersonName: TssSpeedButton;
    cbReceived: TcxComboBox;
    chbAtt: TcxCheckBox;
    dsPayType: TDataSource;
    edFindKA: TokKASearchEdit;
    itmAddMatList: TTBItem;
    lAttNum: TssBevel;
    lcbPersonName: TssDBLookupCombo;
    lPersonname: TLabel;
    lReceived: TLabel;
    mnuAdd: TTBSubmenuItem;
    pmMatSvc: TTBPopupMenu;
    TBItem19: TTBItem;
    TBItem1: TTBItem;
    TBItem6: TTBItem;

    procedure aAddMatExecute(Sender: TObject);
    procedure aAddMatListExecute(Sender: TObject);
    procedure aCInsExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aCurActionExecute(Sender: TObject);
    procedure aOrdersInfoExecute(Sender: TObject);
    procedure btnCashDesksClick(Sender: TObject);
    procedure btnFinPayClick(Sender: TObject);
    procedure btnPayMPersonClick(Sender: TObject);
    procedure btnPersonNameClick(Sender: TObject);
    procedure cbPayCurrPropertiesChange(Sender: TObject);
    procedure chbAttPropertiesChange(Sender: TObject);
    procedure chbPayPropertiesChange(Sender: TObject);
    procedure edFindKAChange(Sender: TObject);
    procedure edPaySummPropertiesChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure frDocGetValue(const ParName: String; var ParValue: Variant);

  private
    DocInfo: TokAddDocInfo;
    FPaySummChange:boolean;
    FCurrPayNum,FOldPayDocId, FPayDocId:integer;

    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    procedure WMDelete(var M: TMessage); message WM_DELETE;
    procedure FillMatsFromWMat(DS: TDataSet);

  protected
    procedure SetID(const Value: integer);override;

  public
    procedure SetCaptions; override;
  end;

var
  frmEditWBReturnOut: TfrmEditWBReturnOut;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  ssFun, prConst, ClientData, prFun, ssCallbackConst,
  fMessageDlg, EditAtt, ssBaseWBDocDlg, ssBaseWBDocDlgWithPayment, Udebug;

var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfrmEditWBReturnOut.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnOut.FormCreate') else _udebug := nil;{$ENDIF}

  FormStorage.IniFileName := MainRegKey;
  FormStorage.IniSection := Self.Name;
  FormStorage.Active := True;

  inherited;
  
  FDocType := dtReturnOut;
  lTotal.Caption := rs('fmWaybill','TotalIn') + ' ' + BaseCurrName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnOut.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
 var
   NewRecord: boolean;
   BM:TBookmark;
   tmpPosId:Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnOut.FormCloseQuery') else _udebug := nil;{$ENDIF}

  inherited;

  if ModalResult in [mrOK, mrYes] then begin
    CanClose := False;

    if CheckDatesIn then begin
      with newDataSet do begin
        try
          TrStart;

          try
            Screen.Cursor := crSQLWait;
            NewRecord := (ID = 0);

            if ID = 0 then FID := GetMaxID(dmData.SConnection, 'waybilllist','wbillid');

            if NewRecord
              then ProviderName := 'pWaybill_Ins'
              else ProviderName := 'pWaybill_Upd';

            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := FID;
            Params.ParamByName('NUM').AsString := edNum1.Text;

            if edNum1.Tag > 0
              then Params.ParamByName('DEFNUM').AsInteger := edNum1.Tag
              else Params.ParamByName('DEFNUM').AsInteger := GetNextDefNum(dmData.SConnection,-1);

            Params.ParamByName('ONDATE').AsDateTime := edDate.Date+edTime.Time;
            Params.ParamByName('KAID').AsInteger := FKAID;

            Params.ParamByName('CURRID').DataType := ftInteger;
            Params.ParamByName('CURRID').Clear;
            Params.ParamByName('ATTNUM').AsString := FAttNum;
            Params.ParamByName('ATTDATE').AsDate := FAttDate;

            if trim(edReason.Text)='' then begin
              Params.ParamByName('REASON').DataType := ftString;
              Params.ParamByName('REASON').Clear;
            end
            else Params.ParamByName('REASON').AsString := edReason.Text;

            Params.ParamByName('notes').AsString := edNotes.Text;
            if lcbPersonName.EditText='' then begin
              Params.ParamByName('PERSONID').DataType := ftInteger;
              Params.ParamByName('PERSONID').Clear;
            end
            else Params.ParamByName('PERSONID').AsInteger := lcbPersonName.KeyValue;

            Params.ParamByName('CHECKED').AsInteger := integer(chbPosting.Checked);
            Params.ParamByName('WTYPE').AsInteger := -6;//тип накладной -6 возврат поставщику
            Params.ParamByName('DELETED').AsInteger := 0;
            Params.ParamByName('SUMMALL').AsFloat := RoundToA(AllSumm,-2);
            Params.ParamByName('NDS').DataType := ftFloat;
            Params.ParamByName('NDS').Clear;
            Params.ParamByName('RECEIVED').AsString := cbReceived.Text;
            Params.ParamByName('TODATE').DataType := ftDateTime;
            Params.ParamByName('TODATE').Clear;
            Execute;//Записали в waybilllist

            // 1 )Удаляем из оборотов
            ProviderName := 'pWMatTurn_Del';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := ID;
            Execute;  //Удалили из wmatturn

            if FPosModified then begin // Запись позиций в накладную
               // 2 Удаляем позиции
               ProviderName := 'pWaybillDet_Del';
               FetchParams;
               Params.ParamByName('WBILLID').AsInteger := ID;
               Execute;
               // 3 Запись позиций из mdDet в waybilldet
               BM := mdDet.GetBookmark;
               mdDet.DisableControls;
               mdDet.First;
               while not mdDet.Eof do begin
                ProviderName := 'pWaybillDet_Ins';
                FetchParams;
                tmpPosId := GetMaxID(dmData.SConnection,'waybilldet','posid');

                if tmpPosID < 0 then raise Exception.Create(rs('fmWaybill','ErrorAddPos'));

                Params.ParamByName('POSID').AsInteger := tmpPosId;
                //3.1 Ставим реальные Sourceid для оборотов
                mdWMatTurn.First;
                while not mdWMatTurn.Eof do begin
                  if mdWMatTurn.FieldByName('sourceid').AsInteger=mdDet.fieldbyname('posid').AsInteger then begin
                    mdWMatTurn.Edit;
                    mdWMatTurn.FieldByName('sourceid').AsInteger := Params.ParamByName('POSID').AsInteger;
                    mdWMatTurn.Post;
                  end;//if
                  mdWMatTurn.Next;
                end;//while

                Params.ParamByName('WBILLID').AsInteger := FID;
                Params.ParamByName('MATID').AsInteger := mdDet.FieldByname('MATID').AsInteger;
                Params.ParamByName('WID').AsInteger := mdDet.FieldByname('WID').AsInteger;
                Params.ParamByName('AMOUNT').AsFloat := RoundToA(mdDet.fieldbyname('AMOUNT').AsFloat,MatDisplayDigits);

                if mdDet.fieldbyname('PRICE').IsNull then begin
                  Params.ParamByName('PRICE').DataType := ftFloat;
                  Params.ParamByName('PRICE').Clear;
                end
                else Params.ParamByName('PRICE').AsFloat := StrToFloat(mdDet.fieldbyname('PRICE').AsString);

                if mdDet.fieldbyname('DISCOUNT').IsNull then begin
                  Params.ParamByName('DISCOUNT').DataType := ftFloat;
                  Params.ParamByName('DISCOUNT').Clear;
                end
                else Params.ParamByName('DISCOUNT').AsFloat := StrToFloat(mdDet.fieldbyname('DISCOUNT').AsString);

                if mdDet.fieldbyname('NDS').IsNull then begin
                  Params.ParamByName('NDS').DataType := ftFloat;
                  Params.ParamByName('NDS').Clear;
                end
                else Params.ParamByName('NDS').AsFloat := StrToFloat(mdDet.fieldbyname('NDS').AsString);

                if mdDet.fieldbyname('CurrId').IsNull then begin
                  Params.ParamByName('CurrId').DataType := ftInteger;
                  Params.ParamByName('CurrId').Clear;
                end
                else Params.ParamByName('CurrId').AsInteger := mdDet.fieldbyname('CurrId').AsInteger;

                Params.ParamByName('onvalue').AsFloat := mdDet.fieldbyname('onvalue').AsFloat;

                if mdDet.fieldbyname('OnDate').IsNull then begin
                  Params.ParamByName('OnDate').DataType := ftDateTime;
                  Params.ParamByName('OnDate').Clear;
                end
                else Params.ParamByName('OnDate').AsDateTime := mdDet.fieldbyname('OnDate').AsDateTime;

                if mdDet.fieldbyname('PTypeID').IsNull then begin
                  Params.ParamByName('PTypeID').DataType := ftInteger;
                  Params.ParamByName('PTypeID').Clear;
                end
                else Params.ParamByName('PTypeID').AsInteger := mdDet.fieldbyname('PTypeID').AsInteger;

                Params.ParamByName('NUM').AsInteger := mdDet.RecNo;
                Execute;//Записываем очередную позицию
                SaveSerial(tmpPosID);

                if (mdDet.FieldByName('producer').AsString <> '') or
                   (mdDet.FieldByName('certnum').AsString <> '') or
                   (mdDet.FieldByName('gtd').AsString <> '') or
                   (mdDet.FieldByName('certdate').AsDateTime <> 0)
                then begin
                  ProviderName := 'pWaybillDetAP_Ins';
                  FetchParams;
                  Params.ParamByName('posid').AsInteger := tmpPosId;
                  if mdDet.FieldByName('producer').IsNull then begin
                    Params.ParamByName('producer').DataType := ftString;
                    Params.ParamByName('producer').Clear;
                  end
                  else Params.ParamByName('producer').AsString := mdDet.FieldByName('producer').AsString;

                  if mdDet.FieldByName('certnum').IsNull then begin
                    Params.ParamByName('certnum').DataType := ftString;
                    Params.ParamByName('certnum').Clear;
                  end
                  else Params.ParamByName('certnum').AsString := mdDet.FieldByName('certnum').AsString;

                  if mdDet.FieldByName('gtd').IsNull then begin
                    Params.ParamByName('gtd').DataType := ftString;
                    Params.ParamByName('gtd').Clear;
                  end
                  else Params.ParamByName('gtd').AsString := mdDet.FieldByName('gtd').AsString;

                  if mdDet.FieldByName('certdate').IsNull then begin
                    Params.ParamByName('certdate').DataType := ftDateTime;
                    Params.ParamByName('certdate').Clear;
                  end
                  else Params.ParamByName('certdate').AsDateTime := mdDet.FieldByName('certdate').AsDateTime;

                  Execute;
                end;

                mdDet.Next;
              end;//while not mdDet.Eof
               mdDet.GotoBookmark(BM);
               FreeBookmark(BM);
               mdDet.EnableControls;
               FPosModified := false;//Сбрасываем флаг изменения позиций
            end;//if FPosModified

            //2)Запись в обороты
            ProviderName := 'pWMatTurnOut_Ins';
            mdWMatTurn.First;
            while not mdWMatTurn.Eof do begin
              FetchParams;
              Params.ParamByName('PosID').AsInteger := mdWMatTurn.fieldbyname('posid').AsInteger;
              Params.ParamByName('MatID').AsInteger := mdWMatTurn.fieldbyname('matid').AsInteger;
              Params.ParamByName('WID').AsInteger := mdWMatTurn.fieldbyname('wid').AsInteger;
              Params.ParamByName('SOURCEID').AsInteger := mdWMatTurn.fieldbyname('SOURCEID').AsInteger;

              if chbPosting.Checked
                then Params.ParamByName('TurnType').AsInteger := -1
                else Params.ParamByName('TurnType').AsInteger := 2;

              Params.ParamByName('OnDate').AsDateTime := edDate.Date+edTime.Time;
              Params.ParamByName('Amount').AsFloat := RoundToA(strtofloat(mdWMatTurn.fieldbyname('amount').AsString),MatDisplayDigits);
              Execute;
              mdWMatTurn.Next;
            end;

            if FPayDocModified then begin//Если платёж изменён, то записываем его
              if OldPayDocId > 0 then begin
                FPayDocId := OldPayDocId;
                FPayDocDate := edDate.Date;
              end;

              if chbPay.Checked then begin //
                if FPayDocId > 0 then begin //если платёж существует, то обновляем
                  ProviderName := 'pWaybillPayDoc_Upd';
                  FetchParams;
                end//if PayDocId>0
                else begin // если платёж не существует
                  //Получить ID нового платежа
                  FPayDocId := GetMaxID(dmData.SConnection, 'paydoc', 'paydocid');
                  ProviderName := 'pPayDoc_Ins';
                  FetchParams;
                  Params.ParamByName('withnds').AsInteger := 1;
                  Params.ParamByName('doctype').AsInteger := 1;
                  Params.ParamByName('notes').AsString := '';
                  FPayDocDate := edDate.Date + Time;
                end;// если платёж не существует

                Params.ParamByName('reason').AsString := rs('fmWaybill','ReturnOutTitle')+amountPrefix+edNum1.Text;
                Params.ParamByName('ondate').AsDateTime := FPayDocDate;
                Params.ParamByName('kaid').AsInteger := edFindKA.KAID;
                Params.ParamByName('paydocid').AsInteger := FPayDocId;
                Params.ParamByName('docnum').AsString := edPayNum.Text;
                Params.ParamByName('ptypeid').AsInteger := lcbPayType.KeyValue;
                if lcbPayMPerson.Text = '' then begin
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
                if (lcbPayType.KeyValue = 2) and (lcbAccount.EditText <> '')
                  then Params.ParamByName('accid').AsInteger := lcbAccount.KeyValue
                  else begin
                    Params.ParamByName('accid').DataType := ftInteger;
                    Params.ParamByName('accid').Clear;
                  end;

                Params.ParamByName('currid').AsInteger := cbPayCurr.KeyValue;
                Params.ParamByName('onvalue').AsFloat :=
                  GetCurrencyRateEx(dmData.SConnection, cbPayCurr.KeyValue, edDate.Date);
                Params.ParamByName('total').AsFloat := RoundToA(StrToFloat(edPaySumm.EditingText), -2);
                Params.ParamByName('checked').AsInteger := Integer(chbPosting.Checked);
                Params.ParamByName('ctypeid').AsInteger := 1;
                Execute;// Записываем изменения в paydoc

                if ProviderName = 'pPayDoc_Ins' then begin // Если плётёж новый
                  ProviderName := 'pWaybillPay_Ins';       // то записываем его в WaybillPay
                  FetchParams;
                  Params.ParamByName('WBILLID').AsInteger := FID;
                  Params.ParamByName('paydocid').AsInteger := FPayDocId;
                  Execute;
                end;//if ProviderName='pPayDoc_Ins'
              end // if chbPay.Checked
              else begin                  //Удаление платежа
                if FPayDocId > 0 then begin // если он существует
                  ProviderName := 'pWayBillPay_Del';
                  FetchParams;
                  Params.ParamByName('WBillID').AsInteger := FID;
                  Execute; // Удаление из WaybillPay
                  ProviderName := 'pPayDoc_Del';
                  FetchParams;
                  Params.ParamByName('PayDocId').AsInteger := FPayDocId;
                  Execute; //Удаление из PayDoc
                  FPayDocId := 0;
                  OldPayDocId := 0;
                end;//if PayDocId>0
              end;//else chbPay.Checked
              FPayDocModified := False;
            end;//if FPayDocModified


           FModified := False;//флаг изменения документа false
           TrCommit;
           DoRecalcKASaldo(dmData.SConnection,FKAID,edDate.Date, rs('fmWaybill', 'RecalcBallance'));

            if ModalResult = mrYes then begin//Если применить
              if NewRecord then begin
                FPayDocId := 0;
                mdDet.Close;
                mdWMatTurn.Close;
                mdTmpIds.Close;
                FPayNum := '';
                dmData.SConnection.AppServer.Rsv_Delete(-1);
                edFindKA.Enabled := True;
                ID := 0;
              end//if NewRecord
              else begin
                  if chbPosting.Checked then CanClose := true
                  else begin
                    if PDInAutoNum and (FOldPayDocId=0) and chbPay.Checked then
                      FCurrPayNum := GetDocNum(dmData.SConnection, dtPDIn, 1);
                    FOldPayDocId := FPayDocID;
                    dmData.SConnection.AppServer.Rsv_Delete(-1);
                    mdDet.Close;
                    mdTmpIds.Close;
                    ID := ID;
                  end;
              end//else NewRecord
            end
            else CanClose := True;

            FGridRefresh := true;
            FPaySummChange := true;
            SendMessage(MainHandle, WM_REFRESH, ID, 0);
            if RefreshAllClients then begin
              dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WBOUT);
              dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
              dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_KAGENTS);
            end;

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
    end;
  end // modalresult in ok,yes
  else begin
    if GetDocNum(dmData.SConnection,FDocType,0)=FCurrNum
      then GetDocNum(dmData.SConnection,FDocType,-1);
    if GetDocNum(dmData.SConnection, dtPDIn,0) = FCurrPayNum
      then GetDocNum(dmData.SConnection, dtPDIn,-1);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnOut.SetID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditWBReturnOut.SetID') else _udebug := nil;{$ENDIF}

  {$IFDEF LIMITED}if Value = 0 then CheckDocumentsCountLimit(wbtReturnOut);{$ENDIF}

  edFindKA.KAID := 0;
  Screen.Cursor := crSQLWait;
  inherited;
  cbReceived.Clear;
  cbReceived.Properties.Items.Clear;
  cdsPayType.Open;

  with lcbPersonName do begin
    Tag := 1;
    cdsPayMPersons.Open;
    KeyValue := 0;
    Text := '';
    Tag := 0;
  end;

  with lcbPayMPerson do begin
    Tag := 1;
    KeyValue := 0;
    Text := '';
    Tag := 0;
  end;

  with cbPayCurr do begin
    Tag := 1;
    cdsCurr.Open;
    KeyValue := BaseCurrID;
    Tag := 0;
  end;


  if Value > 0 then begin
    Self.Caption := rs('fmWaybill','ReturnOutTitleEdit');
    edFindKA.KAID := FKAID;
    if FPersonId > 0 then lcbPersonName.KeyValue := FPersonId;
    chbAtt.Checked := (trim(FAttNum)<>'');
    cbReceived.Text := FReceived;

    mdDet.First;
    while not mdDet.Eof do begin
      UpdatePos;
      mdDet.Next;
    end;
    mdDet.First;
    SelectFocusedNode;
  end
  else Self.Caption := rs('fmWaybill', 'ReturnOutTitleAdd');

  //Чтение платежа
  with newDataSet do
  try
    ProviderName := 'pWayBillPay_Get';// Чтение платежа
    FetchParams;
    Params.ParamByName('WBILLID').AsInteger := FID;
    Open;
    if not IsEmpty then begin
      chbPay.Enabled := false;
      chbPay.Checked := true;
      chbPay.Enabled := true;
      PayDocChecked := fieldbyname('Checked').AsInteger=1;
      chbPay.Enabled := PayDocChecked;
      FPayDocId := FieldByName('PayDocId').AsInteger;
      OldPayDocId := FPayDocId;
      FPayDocDate := FieldByName('OnDate').AsDateTime;
      edPayNum.Text := FieldByName('DocNum').AsString;
      lcbPayType.KeyValue := FieldByName('PTypeId').AsInteger;
      edPaySumm.Tag := 1;
      edPaySumm.Value := FieldByName('Total').AsFloat;
      edPaySumm.Tag := 0;
      if not FieldByName('mpersonid').IsNull
        then lcbPayMPerson.KeyValue := FieldByName('mpersonid').AsInteger;

      if not FieldByName('accid').IsNull
        then lcbAccount.KeyValue := FieldByName('accid').AsInteger
        else lcbAccount.Clear;

      if not FieldByName('cashid').IsNull
        then lcbCashDesks.KeyValue := FieldByName('cashid').AsInteger
        else lcbCashDesks.Clear;

      if cdsPayType.Locate('PTypeId',fieldbyname('CurrId').AsInteger,[])
        then cbPayCurr.KeyValue := fieldbyname('CurrId').AsInteger;
    end;//if not IsEmpty

    Close;

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

  UpdateActions;
  FModified := False;
  FPosModified := False;
  Screen.Cursor := crDefault;

  if not GetUserAccessByClass(Self.ParentNameEx, uaPost) then begin
    chbPosting.Hint := rs('Common', 'noRights');
    chbPosting.Checked := False;
    chbPosting.Enabled := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnOut.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnOut.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    mnuAdd.Caption := GetRS('Common', 'Add');
    edFindKA.InitRes;
    edFindKA.SearchNames[0] := GetRS('fmWaybill','KANameIn') + ';name';
    aOrdersInfo.Caption := GetRS('fmOrders', 'OrderedOut');
    btnOrdersInfo.Hint := GetRS('fmOrders', 'OrderedOut');

    if edFindKA.CurrentSearchIndex = 0
      then edFindKA.Caption.Caption := GetRS('fmWaybill', 'KANameIn') + ':';

    lReceived.Caption := GetRS('fmWaybill','MPerson') + ':';
    chbAtt.Properties.Caption := GetRS('fmWaybill','AttNum');
    lPersonname.Caption := GetRS('fmWaybill','PersonnameOut') + ':';
    btnPersonName.Hint := GetRS('fmWaybill','aPersons');
    aAddMat.Caption := GetRS('fmWaybill', 'MatName');
    aAddMatList.Caption := GetRS('fmWaybill', 'AddMatList');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnOut.aCurActionExecute(Sender: TObject);
 var
   aid:Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnOut.aCurActionExecute') else _udebug := nil;{$ENDIF}


  inherited;
  if (FCurrCtrl = chbAtt) or (FCurrCtrl = chbPay)
    then (FCurrCtrl as TcxCheckBox).Checked := (not (FCurrCtrl as TcxCheckBox).Checked)
    else if FCurrCtrl = cbReceived then begin
      if not cbReceived.DroppedDown then cbReceived.DroppedDown := True;
    end
    else if edFindKA.Editor.Focused then begin
      edFindKA.ShowRef;
    end
    else if (FCurrCtrl=lcbPersonName)or(FCurrCtrl=lcbPayMPerson) then begin
      try aid := (FCurrCtrl as TssDBLookupCombo).KeyValue; except aid := 0; end;
      ShowModalRef(Self,rtPersons,vtKAgent,'TfmKAgent',Self.OnDate,aid);
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnOut.edFindKAChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnOut.edFindKAChange') else _udebug := nil;{$ENDIF}

  inherited;

  if edFind.Tag = 0 then begin
    FKAID := edFindKA.KAID;
    DataModified(Sender);
    GetKAPersons(FKAID,cbReceived);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnOut.chbAttPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnOut.chbAttPropertiesChange') else _udebug := nil;{$ENDIF}

  inherited;

  if chbAtt.Checked then begin
    if trim(FAttNum)='' then
      with TfrmEditAtt.Create(nil) do
      try
        Caption := rs('fmWaybill','Att');
        //lAttOndate.Caption := rs('fmWaybill','AttDate');
        edAttDate.Date := edDate.Date;
        if ShowModal in [mrOK, mrYes] then begin
          FAttNum := edAttNum.Text;
          FAttDate := edAttDate.Date;
        end//if ShowModal
        else chbAtt.Checked := False;

      finally
        Free;
      end;
  end//if chbAtt.Checked
  else begin
    FAttNum := '';
    FAttDate := MinDateTime;
  end;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnOut.btnPersonNameClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnOut.btnPersonNameClick') else _udebug := nil;{$ENDIF}

  inherited;
  lcbPersonName.SetFocus;
  aCurAction.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnOut.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnOut.WMRefresh') else _udebug := nil;{$ENDIF}

  inherited;

  if M.LParam = 9 then begin
    UpdatePos;
    GetSummAll;
    SelectFocusedNode;
    DataModified(Self);
  end
  else
  case TRefType(M.LParam) of
    rtFinances:
       if (M.WParam > 0) and (M.WParam < 1000000) then begin
         lcbPayType.KeyValue := 1;
         lcbCashDesks.KeyValue := M.WParam;
       end
       else begin
         lcbPayType.KeyValue := 2;
         lcbAccount.KeyValue := M.WParam - 1000000;
       end;

    rtWMat:
      begin
        FillMatsFromWMat(TDataSet(M.WParam));
      end;

    rtPersons:begin
      cdsPayMPersons.DisableControls;
      DSRefresh(cdsPayMPersons,'kaid',M.WParam);
      cdsPayMPersons.EnableControls;

      with lcbPersonName do begin
        Tag := KeyValue; ReloadData; KeyValue := Tag;
        if Tag=0 then Text := '' else Tag := 0;
      end;
      with lcbPayMPerson do begin
        Tag := KeyValue; ReloadData; KeyValue := Tag;
        if Tag=0 then Text := '' else Tag := 0;
      end;

      if (FCurrCtrl=lcbPersonName)or(FCurrCtrl=lcbPayMPerson)
      then
      with (FCurrCtrl as TssDBLookupCombo) do begin
        Tag := 1; KeyValue := M.WParam; Tag := 0;
      end;
    end;//rtPersons:begin

    rtCashDesks:begin
      cdsCashDesks.DisableControls;
      DSRefresh(cdsCashDesks,'cashid',M.WParam);
      cdsCashDesks.EnableControls;
      with lcbCashDesks do begin
        Tag := KeyValue; ReloadData; KeyValue := Tag;
        if Tag=0 then Text := '' else Tag := 0;
      end;

      if (FCurrCtrl=lcbCashDesks) then
        with (FCurrCtrl as TssDBLookupCombo) do begin
          Tag := 1; KeyValue := M.WParam; Tag := 0;
          SelStart := 0;
        end;
    end;

    rtKAgent:begin
     if FCurrCtrl=edFindKA then begin
       edFindKA.Tag := 1;
       edFindKA.KAID := M.WParam;
       edFindKA.Editor.SetFocus;
       edFindKA.Editor.SelStart := 0;
       edFindKA.Tag := 0;
       edFindKAChange(nil);
     end;
    end;

  end;//case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnOut.WMDelete(var M: TMessage);
  var
    FtmpCtrl:TControl;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnOut.WMDelete') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
    rtPersons,rtKAgent,rtCashDesks:begin
      FtmpCtrl := FCurrCtrl;
      FCurrCtrl := nil;
      SendMessage(Self.Handle,WM_REFRESH,0,integer(TRefType(M.LParam)));
      FCurrCtrl := FtmpCtrl;

      if FKAID = M.WParam then edFindKA.KAID := 0;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnOut.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  var
    FEnPay: Boolean;
    FPaySum: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnOut.ActionListUpdate') else _udebug := nil;{$ENDIF}

  if (chbPay.Checked)and chbPay.Enabled then begin
    try
      FPaySum := StrToFloat(edPaySumm.EditingText);
      FEnPay := (FPaySum > 0) and (Trim(edPayNum.Text) <> '')
    except
      FPaySum := 0;
      FEnPay := False;
    end;
    lPayCurr.Font.Color := clWindowText;
  end
  else begin
    lcbPayType.Enabled := false;
    FEnPay := True;
    lPaySumm.Enabled := false;
    lPayCurr.Enabled := false;
    lPayType.Enabled := false;
    edPaySumm.Enabled := false;
    edPayNum.Enabled := false;
    cbPayCurr.Enabled := false;
    lPayMPerson.Enabled := False;
    lcbPayMPerson.Enabled := False;
    btnPayMPerson.Enabled := False;
    lcbCashDesks.Enabled := False;
    lcbAccount.Enabled := False;
    lAcc.Enabled := False;
    lCashDesks.Enabled := False;
    btnCashDesks.Enabled := False;
    btnFinPay.Enabled := False;
  end;

  inherited;

  edFindKA.Enabled := mdDet.IsEmpty;
  aSelectAll.Enabled := not mdDet.IsEmpty;

  aOk.Enabled := (trim(edNum1.Text)<>'') and
   ((chbPosting.Checked and not FNotRsvPresent) or not chbPosting.Checked) and
   (edDate.Text<>'') and (FKAID>0)and (not mdDet.IsEmpty)and{ (not FPosError) and} FEnPay;

  aApply.Enabled := aOk.Enabled and (FModified or FPosModified or FPayDocModified);

  aCIns.Enabled := FKAID > 0;

  aCDel.Enabled := not mdDet.IsEmpty;
  aCUpd.Enabled := aCDel.Enabled and (dbgWaybillDet.SelectedCount = 1);
  mnuAdd.Enabled := aCIns.Enabled;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnOut.btnPayMPersonClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnOut.btnPayMPersonClick') else _udebug := nil;{$ENDIF}

  inherited;

  lcbPayMPerson.SetFocus;
  aCurAction.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnOut.chbPayPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnOut.chbPayPropertiesChange') else _udebug := nil;{$ENDIF}


  inherited;
  // Заполнение полей
  {if chbPay.Tag=0 then begin
    if (chbPay.Checked) then begin
      if PDInAutoNum and (FOldPayDocId = 0) then begin
        FCurrPayNum := GetDocNum(dmData.SConnection, dtPDIn, 1);
        edPayNum.Text := PDInPrefix + IntToStr(FCurrPayNum) + PDInSuffix;
      end
      else edPayNum.Text := FPayNum;
      edPaySumm.Tag := 1;
      edPaySumm.Value := roundtoa(AllSumm,-2);
      edPaySumm.Tag := 0;
      cbPayCurr.KeyValue := BaseCurrID;
    end//if (chbPay.Checked)
    else begin
      if PDInAutoNum and (FOldPayDocId = 0) then begin
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
  }

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnOut.edPaySummPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnOut.edPaySummPropertiesChange') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnOut.cbPayCurrPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnOut.cbPayCurrPropertiesChange') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnOut.frDocGetValue(const ParName: String; var ParValue: Variant);
  var
    FWONDS, FNDS: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnOut.frDocGetValue') else _udebug := nil;{$ENDIF}

  inherited;

  if 0 = AnsiCompareText(ParName, 'kafullname') then ParValue := edFindKA.Obj.FullName
  else if 0 = AnsiCompareText(ParName, 'received') then ParValue := cbReceived.Text
  else if 0 = AnsiCompareText(ParName, 'att') then ParValue := lAttNum.Caption
  else if 0 = AnsiCompareText(ParName, 'possumwonds') then begin
    NDSCalc(mdReport.FieldByName('amount').AsFloat,
      mdReport.FieldByName('price').AsFloat *
      mdReport.FieldByName('onvalue').AsFloat,
      mdReport.FieldByName('nds').AsFloat, 1, FWONDS, FNDS);
    ParValue := RoundToA(FWONDS + FNDS, -2);
    FNDS := RoundToA(FNDS, -2);
    ParValue := ParValue - FNDS;
  end
  else if 0 = AnsiCompareText(ParName, 'personname') then ParValue := lcbPersonName.Text;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnOut.btnCashDesksClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnOut.btnCashDesksClick') else _udebug := nil;{$ENDIF}

  inherited;

  lcbCashDesks.SetFocus;
  aCurAction.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnOut.btnFinPayClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnOut.btnFinPayClick') else _udebug := nil;{$ENDIF}

  ShowFinance(Self, Date, 1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnOut.aOrdersInfoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnOut.aOrdersInfoExecute') else _udebug := nil;{$ENDIF}

  ShowOrdersInfo(edFindKA.KAID, 16, OnDate);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnOut.aCInsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnOut.aCInsExecute') else _udebug := nil;{$ENDIF}

  case WBOutDefAction of
    aaMatList: aAddMatList.Execute;
    else inherited;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnOut.aAddMatListExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnOut.aAddMatListExecute') else _udebug := nil;{$ENDIF}

  DocInfo.CurrName := cbCurr.Text;
  DocInfo.CurrID := cbCurr.KeyValue;
  DocInfo.CurrRate := edRate.Value;
  DocInfo.KAID := edFindKA.KAID;
  DocInfo.OnDate := edDate.Date;
  DocInfo.NDSPayer := cdsEnts.FieldByName('ndspayer').AsInteger = 1;

  if CurrEnt.NDSPayer
    then DocInfo.NDS := NDS
    else DocInfo.NDS := 0;

  if (edFindKA.KAID <> 0) and (edFindKA.Obj.PTypeID > 0)
    then DocInfo.PTypeID := edFindKA.Obj.PTypeID
    else DocInfo.PTypeID := GetDefPriceType;

  ShowModalWH(Self, MaxDateTime, 0, 6, 0, Integer(@DocInfo));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnOut.FillMatsFromWMat(DS: TDataSet);
 var
   FPosID: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnOut.FillMatsFromWMat') else _udebug := nil;{$ENDIF}

  FShowRsvMsgs := False;
  try
    with mdDet do begin
      if not mdDet.Active then mdDet.Open;
      DS.DisableControls;
      //mdDet.DisableControls;
      DS.First;
      while not DS.Eof do begin
        FPosID := dsNextPosID(mdDet);
        Append;
        FieldByName('posid').AsInteger := FPosID;
        FieldByName('matid').AsInteger := DS.FieldByName('matid').AsInteger;
        FieldByName('postype').AsInteger := 0;
        FieldByName('status').AsInteger := 0;
        FieldByName('matname').AsString := DS.FieldByName('name').AsString;
        FieldByName('msrname').AsString := DS.FieldByName('msrname').AsString;
        FieldByName('artikul').AsString := DS.FieldByName('artikul').AsString;
        FieldByName('amount').AsFloat := DS.FieldByName('amount').AsFloat;
        FieldByName('price').AsFloat := DS.FieldByName('price').AsFloat;
        FieldByName('fullprice').AsFloat := DS.FieldByName('fullprice').AsFloat;
        FieldByName('discount').AsFloat := DS.FieldByName('discount').AsFloat;

        if CurrEnt.NDSPayer
          then FieldByName('nds').AsFloat := NDS
          else FieldByName('nds').AsFloat := 0;

        FieldByName('currid').AsInteger := cbCurr.KeyValue;
        FieldByName('wid').AsInteger := DS.FieldByName('wid').AsInteger;
        FieldByName('whname').AsString := DS.FieldByName('whname').AsString;
        FieldByName('currname').AsString := cbCurr.Text;
        FieldByName('onvalue').AsFloat := edRate.Value;
        FieldByName('producer').AsString := DS.FieldByName('producer').AsString;
        FieldByName('barcode').AsString := DS.FieldByName('barcode').AsString;

        if DS.FieldByName('ptypeid').AsInteger > 0
          then FieldByName('ptypeid').AsInteger := DS.FieldByName('ptypeid').AsInteger;

        Post;

        DoSetRsv(FieldByName('posid').AsInteger, FieldByName('matid').AsInteger,
          FieldByName('wid').AsInteger, FieldByName('amount').AsFloat);
        UpdatePos;
        DS.Next;
      end;
    end;

    DS.EnableControls;
    mdDet.EnableControls;
    dbgWaybillDet.Adjust(nil, [colPosType, colRecNo]);

    SelectFocusedNode;

  finally
    FShowRsvMsgs := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWBReturnOut.aAddMatExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWBReturnOut.aAddMatExecute') else _udebug := nil;{$ENDIF}

  inherited aCInsExecute(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditWBReturnOut', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
