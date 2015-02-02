{$I ok_sklad.inc}
unit WaybillInClass;

interface

uses
  WayBillClass, WBMetaItem, MetaClass;

type
  TWaybillInClass = class(TWayBillClass)
    private
      FWarehouseID: Integer; // common WH if all positions are from/to the same place

    public
      constructor Create(const AParent: TMetaClass); overload;
      constructor Create(AID: Integer); overload;
      //destructor Destroy;

      procedure Clear; 

      function Load(const AID: integer): Boolean;
      function Save: Boolean;
  end; // TWaybillInClass

//==============================================================================================
//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  sysUtils, Forms, Controls, 
  prFun, {prConst, ClientData, ssFun, ShellAPI, StdConvs,
  ssRegUtils, ssStrUtil, okMoneyFun,
  }
  udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

//==============================================================================================
procedure TWayBillInClass.Clear;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TWayBillInClass.Clear') else _udebug := nil;{$ENDIF}

  inherited;

  FWarehouseID := -1;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
constructor TWayBillInClass.Create(const AParent: TMetaClass);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TWayBillInClass.Create') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
constructor TWayBillInClass.Create(AID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TWayBillInClass.Create(' + IntToStr(AID) + ')') else _udebug := nil;{$ENDIF}

  Create(nil);

  Load(AID);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TWayBillInClass.Load(const AID: integer): Boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TWayBillInClass.Load') else _udebug := nil;{$ENDIF}

  Result := False;

  (*
  Screen.Cursor := crSQLWait;

  Clear;

  Fid := AID;

  with newDataSet do
  try
    ProviderName := 'pWaybill_Get';
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := AID;
    Open;

    if IsEmpty then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

    FNumber := fieldbyname('num').AsString;
    FDEFNUM := fieldbyname('defnum').AsInteger;

    FDate := fieldbyname('ondate').AsDateTime;

    FBusinessPartner.Clear;
    FBusinessPartner.loadData(fieldbyname('kaid').AsInteger);

    if not fieldbyname('personid').IsNull
      then FPersonID := fieldbyname('personid').AsInteger;

    FReason := fieldbyname('REASON').asstring;
    FNotes  := FieldByName('notes').AsString;

    FCurrencyID := fieldbyname('CURRID').AsInteger;

    FCurrencyRate := FieldByName('onvalue').AsFloat;
    FPosted := (fieldbyname('CHECKED').AsInteger = 1);
    FVAT := fieldbyname('NDS').AsFloat;

    if FieldByName('attnum').AsString = ''
      then FWarehouseID := 0
      else
        try
          FWarehouseID := StrToInt(FieldByName('attnum').AsString);

        except
        end;

    Close; // pWaybill_Get

    {
    ProviderName := 'pDocsRel_WB_WB_Get';
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := FID;
    Params.ParamByName('doctype').AsInteger := 16;
    Open;

    if not IsEmpty
      then FOrderID := FieldByName('wbillid').AsInteger
      else FOrderID := 0;

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
    }

    ProviderName := prvDet;
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := FID;
    Open;

    while not Eof do begin
      if mdDet.FieldByName('fullprice').IsNull
        then mdDet.FieldByName('fullprice').AsFloat := mdDet.FieldByName('price').AsFloat;

      UpdatePos;
    end;
    Close;

    ProviderName := 'pWayBillPay_Get';// Чтение платежа
    FetchParams;
    Params.ParamByName('WBILLID').AsInteger := FID;
    Open;
    if not IsEmpty then begin
      PayDocChecked := (FieldByName('Checked').AsInteger = 1);

      if not FieldByName('mpersonid').IsNull
        then lcbPayMPerson.KeyValue := FieldByName('mpersonid').AsInteger;

      PayDocId := FieldByName('PayDocId').AsInteger;
      OldPayDocID := PayDocID;

      PayDocDate := fieldbyname('OnDate').AsDateTime;

      edPayNum.Text := fieldbyname('DocNum').AsString;
      lcbPayType.KeyValue := fieldbyname('PTypeId').AsInteger;
      cbPayCurr.KeyValue := FieldByName('CurrId').AsInteger;

      edPaySumm.Value := FieldByName('Total').AsFloat;

      if cdsPayType.Locate('PTypeId',fieldbyname('CurrId').AsInteger,[]) then

      if not FieldByName('accid').IsNull
        then lcbAccount.KeyValue := FieldByName('accid').AsInteger
        else lcbAccount.Clear;

      if not FieldByName('cashid').IsNull
        then lcbCashDesks.KeyValue := FieldByName('cashid').AsInteger
        else lcbCashDesks.Clear;

    end //if not IsEmpty
    else begin
      PayDocChecked := False;
      PayDocId := 0;
      chbPay.Enabled := False;
      chbPay.Checked := False;
      chbPay.Enabled := True;
      edPayNum.Text := '';
      edPaySumm.Value := 0;
    end;
    Close;

    FModified := false;

  finally
    Free;
  end;
*)
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TWayBillInClass.Save: Boolean;
  var
     NewRecord: boolean;
     tmpid:integer;
     FPosID, intTmp: Integer;
     {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TWayBillInClass.Save') else _udebug := nil;{$ENDIF}

  Result := False;

  (*
  if not CheckDocDate(edDate.Date) then begin // in future?
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  with newDataSet do begin
    try
      Screen.Cursor := crSQLWait;
      NewRecord := (ID = 0);

      if NewRecord then FID := GetMaxID(dmData.SConnection, 'waybilllist', 'wbillid');

      TrStart;

      try
        if NewRecord
          then ProviderName := 'pWaybill_InsEx'
          else ProviderName := 'pWaybill_UpdEx';

        FetchParams;
        Params.ParamByName('WBILLID').AsInteger := FID;
        Params.ParamByName('NUM').AsString := FNumber;

        if FDefNum > 0
          then Params.ParamByName('DEFNUM').AsInteger := FDefNum
          else Params.ParamByName('DEFNUM').AsInteger := GetNextDefNum(dmData.SConnection,1);

        Params.ParamByName('ONDATE').AsDateTime := FDate;
        Params.ParamByName('KAID').AsInteger := FBusinessPartner.ID;
        Params.ParamByName('CURRID').AsInteger := FCurrencyID;
        Params.ParamByName('ONVALUE').AsFloat := FCurrencyRate;

        Params.ParamByName('ATTNUM').AsString := ''; // warehouse for entire doc
        Params.ParamByName('ATTDATE').AsDate := 0;

        Params.ParamByName('REASON').AsString := FReason;
        Params.ParamByName('notes').AsString := FNotes;

        Params.ParamByName('PERSONID').AsInteger := FPersonID;

        Params.ParamByName('CHECKED').AsInteger := integer(FPosted);
        Params.ParamByName('WTYPE').AsInteger := 1; //тип накладной 1-приходная; -1-расходная;
        Params.ParamByName('DELETED').AsInteger := 0;
        Params.ParamByName('SUMMALL').AsFloat := RoundToA(FPositions.Total, -2);
        Params.ParamByName('SUMMINCURR').AsFloat := FPositions.TotalInDefCurr;
        Params.ParamByName('NDS').AsFloat := roundtoa(FVAT, -2);
        Params.ParamByName('RECEIVED').AsString := '';

        Params.ParamByName('TODATE').DataType := ftDateTime;
        Params.ParamByName('TODATE').Clear;
        Params.ParamByName('entid').DataType := ftInteger;
        Params.ParamByName('entid').Clear;

        Execute;//Записали в waybilllist

        if not FPositions.Save then raise Exception.Create('Positions saving problem');
         then begin // Запись позиций в накладную
          ProviderName := 'pWaybillDet_Del';
          FetchParams;
          Params.ParamByName('WBILLID').AsInteger := ID;
          Execute;  //Удалили позиции

          ProviderName := 'pWaybillSvc_Del';
          FetchParams;
          Params.ParamByName('wbillid').AsInteger := FID;
          Execute;

          BM := mdDet.GetBookmark;
          mdDet.DisableControls;
          mdDet.First; // Запись позиций из mdDet в waybilldet

          while not mdDet.Eof do begin
            if mdDet.FieldByName('postype').AsInteger = 0 then begin
              if (FOrderID > 0) and NewRecord then begin
                FPosID := GetMaxID(dmData.SConnection, 'waybilldet', 'posid');
                ProviderName := 'pWaybillDet_CopyPos';
                FetchParams;
                Params.ParamByName('posid').AsInteger := FPosID;
                Params.ParamByName('oldposid').AsInteger := mdDet.FieldByName('posid').AsInteger;
                Execute;

                ProviderName := 'pPosRel_Ins';
                FetchParams;
                Params.ParamByName('posid').AsInteger := FPosID;
                Params.ParamByName('cposid').AsInteger := mdDet.FieldByName('posid').AsInteger;
                Execute;

                ProviderName := 'pWaybillDet_UpdExIn';
              end
              else ProviderName := 'pWaybillDet_InsIn';

              FetchParams;
              if (FOrderID > 0) and NewRecord
                then FPosID := mdDet.FieldByName('posid').AsInteger
                else FPosID := GetMaxID(dmData.SConnection, 'waybilldet', 'posid');

              Params.ParamByName('posid').AsInteger := FPosID;

              if FPosID < 0 then raise Exception.Create(rs('fmWaybill', 'ErrorAddPos'));

              tmpid := Params.ParamByName('POSID').AsInteger;

              Params.ParamByName('wbillid').AsInteger := FID;
              Params.ParamByName('MATID').AsInteger := mdDet.fieldbyname('MATID').AsInteger;
              Params.ParamByName('WID').AsInteger := mdDet.fieldbyname('WID').AsInteger;
              Params.ParamByName('AMOUNT').AsFloat := RoundToA(strtofloat(mdDet.fieldbyname('AMOUNT').AsString), MatDisplayDigits);
              Params.ParamByName('onvalue').AsFloat := StrToFloat(mdDet.fieldbyname('onvalue').AsString);
              Params.ParamByName('PRICE').AsFloat := RoundToA(strtofloat(mdDet.fieldbyname('PRICE').AsString), -6);
              Params.ParamByName('baseprice').AsFloat := RoundToA(strtofloat(mdDet.fieldbyname('fullprice').AsString), -6);
              Params.ParamByName('DISCOUNT').DataType := ftFloat;
              Params.ParamByName('DISCOUNT').Clear;
              Params.ParamByName('NDS').AsFloat := StrToFloat(mdDet.FieldByName('nds').AsString);
              Params.ParamByName('CurrId').AsInteger := cbCurr.KeyValue;
              Params.ParamByName('OnDate').AsDateTime := edDate.Date + edTime.Time;
              Params.ParamByName('PTypeID').DataType := ftInteger;
              Params.ParamByName('PTypeID').Clear;
              Params.ParamByName('NUM').AsInteger := mdDet.RecNo;
              Params.ParamByName('total').AsFloat := 0;
              Execute;//Записываем очередную позицию

              //write s/n
              if not mdDet.fieldbyname('sn').IsNull then begin
                ProviderName := 'rSN_Ins';
                FetchParams;
                Params.ParamByName('sid').AsInteger := GetMaxID(dmData.SConnection, 'serials', 'sid');
                Params.ParamByName('posid').AsInteger := FPosID;
                Params.ParamByName('serialno').AsString := mdDet.fieldbyname('sn').AsString;
                Execute;
              end;//if

              ProviderName := 'pWaybillDetAP_Del'; // clear old positions in waybilldetaddprops
              FetchParams;
              Params.ParamByName('posid').AsInteger := FPosID;
              Execute;

              if (mdDet.FieldByName('producer').AsString <> '') or (mdDet.FieldByName('certnum').AsString <> '')
                 or (mdDet.FieldByName('gtd').AsString <> '') or (mdDet.FieldByName('certdate').AsDateTime <> 0)
              then begin
                ProviderName := 'pWaybillDetAP_Ins';
                FetchParams;
                Params.ParamByName('posid').AsInteger := FPosID;
                Params.ParamByName('producer').AsString := mdDet.FieldByName('producer').AsString;
                Params.ParamByName('certnum').AsString := mdDet.FieldByName('certnum').AsString;
                Params.ParamByName('gtd').AsString := mdDet.FieldByName('gtd').AsString;

                if mdDet.FieldByName('certdate').AsDateTime = 0 then begin
                  Params.ParamByName('certdate').DataType := ftDateTime;
                  Params.ParamByName('certdate').Clear;
                end
                else Params.ParamByName('certdate').AsDateTime := mdDet.FieldByName('certdate').AsDateTime;

                Params.ParamByName('cardid').DataType := ftInteger;
                Params.ParamByName('cardid').Clear;
                Execute;
              end;
            end // if mdDet.FieldByName('postype').AsInteger = 0

            else begin
              ProviderName := 'pWaybillSvc_InsIn';
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
              Params.ParamByName('svctoprice').AsInteger := mdDet.FieldByName('svctoprice').AsInteger;

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

          FPosModified := False;
        end; //if FPosModified

        if (FOrderID > 0) and NewRecord then begin
          ProviderName := 'pDocsRel_WB_Acc_Ins';
          FetchParams;
          Params.ParamByName('wbillid').AsInteger := FID;
          Params.ParamByName('accid').AsInteger := FOrderID;
          Execute;

          ProviderName := 'pOrder_UpdStatus';
          FetchParams;
          Params.ParamByName('wbillid').AsInteger := FOrderID;

          if chbPosting.Checked
            then Params.ParamByName('checked').AsInteger := 1
            else Params.ParamByName('checked').AsInteger := 2;

          Execute;
        end;

        if FOrderID = 0 then begin
          if chbPosting.Checked then begin  //Если документ проведён то
            //1)Удаление из оборотов        //записываем позиции на склад
            ProviderName := 'pWMatTurn_Del';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := FID;
            Execute;

            //4)Запись в обороты
            ProviderName := 'pWMatTurn_Ins';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := FID;
            Execute;
          end // if chbPosting.Checked
          else begin //Если документ не проведён, то удаляем позиции со склада
            //1)Удаление из оборотов
            ProviderName := 'pWMatTurn_Del';
            FetchParams;
            Params.ParamByName('WBILLID').AsInteger := FID;
            Execute;
          end;//else if chbPosting.Checked
        end // if FOrderID = 0 (no related order)

        else begin  // have related order
          ProviderName := 'pWMatTurn_Upd';
          FetchParams;
          Params.ParamByName('wbillid').AsInteger := FID;

          if chbPosting.Checked
            then Params.ParamByName('turntype').AsInteger := matTurnIn
            else Params.ParamByName('turntype').AsInteger := matTurnOrdered;

          Execute;
        end;

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

      except
        on e:exception do begin
          TrRollback;
          raise;
        end;
      end;

      if chbPosting.Checked and (edContr.DocID > 0)
          then DoRecalcContract(dmData.SConnection, edContr.DocID);

      DoRecalcKASaldo(dmData.SConnection, edKAgent.KAID, edDate.Date, rs('fmWaybill', 'RecalcBallance'));

      if (FOrderID > 0) and NewRecord then begin
        SendMessage(MainHandle, WM_REFRESH, FOrderID, 0);
        RefreshFun('TfmWaybill', 0);
      end
      else SendMessage(MainHandle, WM_REFRESH, ID, 0);

      RefreshFun('TfmWMat', 0);
      RefreshFun('TfmPayDoc', 0);
      RefreshFun('TfmFinance', 0);

      {if RefreshAllClients then begin
        dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WBIN);
        dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
        dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_KAGENTS);
      end;
      }

    finally
      Free;
      Screen.Cursor := crDefault;
    end;
  end;// with TClientDataSet.Create(nil)
*)
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;//FormCloseQuery

//==============================================================================================
(*
procedure TWayBillInClass.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  var
    FPaySum: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TWayBillInClass.ActionListUpdate') else _udebug := nil;{$ENDIF}

  if (chbPay.Checked)and(not PayDocChecked) then begin
    try
      FPaySum := StrToFloat(edPaySumm.EditingText);
    except
      FPaySum := 0;
    end;
  end
  else begin
    FPaySum := 1;
  end;

  if edContr.Obj.DocID>0 then cbPayCurr.Enabled := false;

  if FGridRefresh then begin
     dbgWaybillDet.BeginUpdate;
     try
       GetSummAll;
       if (not PayDocChecked)and(chbPay.Checked)and(not FPaySummChange)and(dbgWaybillDet.Tag<>0) then
       begin
         edPaySumm.Tag := 1;
         edPaySumm.Value := roundtoa(ALLSUMM,-2);
         edPaySumm.Tag := 0;
       end;
       dbgWaybillDet.Tag := dbgWaybillDet.Tag+1;
     finally
       dbgWaybillDet.EndUpdate;
     end;

   end;

   //********************
   //ssBevel10.Visible := colSummDef.Visible;
   lSummCurr.Visible := cbCurr.KeyValue <> BaseCurrID;
   //bvlCurrency.Visible := colSummDef.Visible;
   lTotalCurr.Visible := cbCurr.KeyValue <> BaseCurrID;

   //********************


  aOk.Enabled := (Trim(edNum1.Text) <> '')
    and (edDate.Text <> '')
    and (edKAgent.KAID > 0)
    and (cbCurr.KeyValue > 0)
    and (not mdDet.IsEmpty)
    and ((chbPay.Checked and (FPaySum > 0)
      and (Trim(edPayNum.Editor.EditingText) <> '')) or not chbPay.Checked);

  aSelectAll.Enabled := not mdDet.IsEmpty;
  aApply.Enabled := aOk.Enabled and (FModified or FPosModified or FPayDocModified)
    and (FOrderID = 0);

  aCIns.Enabled := FOrderID = 0;
  itmAdd.Enabled := FOrderID = 0;
  aCDel.Enabled := not mdDet.IsEmpty and (FOrderID = 0);
  aCUpd.Enabled := not mdDet.IsEmpty and (dbgWaybillDet.SelectedCount = 1);
  //dbgWaybillDet.Enabled := not mdDet.IsEmpty;
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
*)

//==============================================================================================
(*
procedure TWayBillInClass.aCDelExecute(Sender: TObject);
var
  FItem: TListItem;
  i: Integer;
  {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TWayBillInClass.aCDelExecute') else _udebug := nil;{$ENDIF}

  //dbgWaybillDet.SetFocus;
  if ((dbgWaybillDet.SelectedCount = 1) and (mrYes <> ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo])))
      or
     ((dbgWaybillDet.SelectedCount > 1) and
     (mrYes <> ssMessageDlg(Format(rs('Common', 'DelConfirmEx'), [dbgWaybillDet.SelectedCount]), ssmtWarning, [ssmbYes, ssmbNo])))
  then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  Screen.Cursor := crSQLWait;
  mdDet.DisableControls;
  try
    for i := 0 to dbgWaybillDet.SelectedCount - 1 do begin
      if mdDet.Locate('posid', dbgWaybillDet.SelectedNodes[i].Values[colPosID.Index], []) then
        if ((mdDet.FindField('locked') <> nil) and (mdDet.FieldByName('locked').AsInteger <> 1))
            or (mdDet.FindField('locked') = nil)
        then mdDet.Delete;
    end;
    LocateAfterDel;
    RecalcSvc;
    FGridRefresh := True;
  finally
    Screen.Cursor := crDefault;
    mdDet.EnableControls;
    SelectFocusedNode;
    RealignGrid;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
*)

//==============================================================================================
(*
procedure TWayBillInClass.aCUpdExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TWayBillInClass.aCUpdExecute') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;
  case mdDet.FieldByName('postype').AsInteger of
    0: with TfrmEditPosition.Create(frmEditPosition) do
    try
      ParentNameEx := Self.ParentNameEx;
      OnDate := Self.OnDate;
      WID := lcbWH.WID;
      dbgWaybillDet.SetFocus;
      PosNDS := FVAT;
      NDSPayer := CurrEnt.NDSPayer;
      ParentHandle := Self.Handle;
      CurrID := cbCurr.KeyValue;
      Kurs := CurKurs;
      parentMdDet := mdDet; //Tag := integer(mdDet);
      CurrName := cdsCurr.fieldbyname('shortname').AsString;
      CurrDefName := BaseCurrName;
      CurrShortName := defCurrShortName;
      {if trim(stCurrShortName.Caption)='' then begin
        stCurrShortName.Caption := cdsCurr.fieldbyname('shortname').AsString;
        stCurrShortNameOutNds.Caption := cdsCurr.fieldbyname('shortname').AsString;
      end;}
      ByOrder := FOrderID > 0;
      id := mdDet.FieldByName('posid').AsInteger;
      Screen.Cursor := crDefault;
      ShowModal;
    finally
      Free;
      Screen.Cursor := crDefault;
    end;//try

    1: with TfrmEditPositionSvc.Create(nil) do
    try
      ParentHandle := Self.Handle;
      ParentNameEx := Self.ParentNameEx;
      OnDate := Int(edDate.Date) + Frac(edTime.Time);
      FRateValue := Self.edRate.Value;
      CurrID := Self.cbCurr.KeyValue;
      mdDet := Self.mdDet;
      chbSvcToPrice.Enabled := True;
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
*)

//Запись в mdDet NDS и Currid
//==============================================================================================
(*
function TWayBillInClass.ChangeMats: boolean;
  var
    BM:TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TWayBillInClass.ChangeMats') else _udebug := nil;{$ENDIF}

  Result := True;
  with mdDet do begin
    BM := GetBookmark;
    DisableControls;
    try
      try
        First;
        while not Eof do begin
          Edit;
          FieldByName('NDS').AsFloat := FVAT;
          FieldByName('CurrId').AsFloat := cbCurr.KeyValue;
          Post;
          Next;
        end;//while
      except
        Result := False;
      end;
    finally
      GotoBookmark(BM);
      FreeBookmark(BM);
      EnableControls;
    end;
  end;//while

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
*)

//==============================================================================================
(*
procedure TWayBillInClass.aAddKAExecute(Sender: TObject);
  var
    aid: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TWayBillInClass.aAddKAExecute') else _udebug := nil;{$ENDIF}

  if edContr.Editor.Focused
    then edContr.ShowRef
    else if lcbWH.Combo.Focused
      then lcbWH.ShowRef
      else if FCurrCtrl = lcbPersonName then begin
        try aid := lcbPersonName.KeyValue; except aid := 0; end;
        lcbPersonName.SetFocus;
        lcbPersonName.Tag := 1;
        ShowModalRef(Self, rtPersons, vtKAgent, 'TfmKAgent', Self.OnDate, aid);
        lcbPersonName.Tag := 0;
      end
      else if FCurrCtrl = lcbPayType then begin
        ShowFinance(Self, Date, 1);
      end
      else if FCurrCtrl = lcbCashDesks then begin
        try aid := lcbCashDesks.KeyValue; except aid := 0; end;
        lcbCashDesks.SetFocus;
        ShowModalRef(Self, rtCashDesks, vtCashDesks, 'TfmCashDesks', Self.OnDate, aid);
      end
      else if FCurrCtrl = lcbPayMPerson then begin
        try aid := lcbPayMPerson.KeyValue; except aid := 0; end;
        lcbPayMPerson.SetFocus;
        lcbPayMPerson.Tag := 1;
        ShowModalRef(Self, rtPersons, vtKAgent, 'TfmKAgent', Self.OnDate, aid);
        lcbPayMPerson.Tag := 0;
      end
      else if edKAgent.Editor.Focused then edKAgent.ShowRef;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
*)

//==============================================================================================
(*
procedure TWayBillInClass.chbPayPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TWayBillInClass.chbPayPropertiesChange') else _udebug := nil;{$ENDIF}

  // Заполнение полей
  if chbPay.Enabled then begin
    if (chbPay.Checked)then begin
      if PDOutAutoNum and (OldPayDocID = 0) then begin
        FCurrPayNum := GetDocNum(dmData.SConnection,dtPDOut,1);
        edPayNum.Text := PDOutPrefix+IntToStr(FCurrPayNum)+PDOutSuffix;
      end
      else edPayNum.Text := FPayNum;
      edPaySumm.Tag := 1;
      edPaySumm.Value := roundtoa(AllSummCurr, -2);
      edPaySumm.Tag := 0;
  //cbPayCurr.KeyValue := BaseCurrID;
    end//if (chbPay.Checked)
    else begin
      if PDOutAutoNum and (OldPayDocID = 0) then begin
        if GetDocNum(dmData.SConnection, dtPDOut, 0) = FCurrPayNum
          then GetDocNum(dmData.SConnection, dtPDOut, -1);
      end;
      edPayNum.Text := '';
      edPaySumm.Tag := 1;
      edPaySumm.Value := 0;
      edPaySumm.EditText := '';
      edPaySumm.Tag := 0;
  //cbPayCurr.KeyValue := BaseCurrID;
      FPaySummChange := false;
    end;//else
   FPayDocModified := true;
  end;//if chbPay.Enabled

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
*)

//==============================================================================================
(*
procedure TWayBillInClass.aAddMatExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TWayBillInClass.aAddMatExecute') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;
  with TfrmEditPosition.Create(frmEditPosition) do
  try
    ParentNameEx := Self.ParentNameEx;
    OnDate := edDate.Date + edTime.Time;
    WID := lcbWH.WID;
    PosNDS := FVAT;
    NDSPayer := CurrEnt.NDSPayer;
    ParentHandle := Self.Handle;
    CurrID := Self.cbCurr.KeyValue;
    Kurs := CurKurs;
    parentMdDet := mdDet; //Tag := integer(mdDet);
    ByOrder := FOrderID > 0;
    id := 0;
    CurrDefName := BaseCurrName;
    CurrShortName := defCurrShortName;
    CurrName := cdsCurr.fieldbyname('shortname').AsString;
    {if trim(stCurrShortName.Caption)='' then begin
      stCurrShortName.Caption := cdsCurr.fieldbyname('shortname').AsString;
      stCurrShortNameOutNds.Caption := cdsCurr.fieldbyname('shortname').AsString;
    end;//if
    }
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
*)

//==============================================================================================
(*
procedure TWayBillInClass.aAddSvcExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TWayBillInClass.aAddSvcExecute') else _udebug := nil;{$ENDIF}

  with TfrmEditPositionSvc.Create(nil) do
  try
    ParentHandle := Self.Handle;
    ParentNameEx := Self.ParentNameEx;
    OnDate := Int(edDate.Date) + Frac(edTime.Time);
    FRateValue := Self.edRate.Value;
    CurrID := Self.cbCurr.KeyValue;
    mdDet := Self.mdDet;
    PosNDS := NDS;
    chbSvcToPrice.Enabled := True;
    ShowModal;
    dbgWaybillDet.SetFocus;
  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
*)

//==============================================================================================
(*
procedure TWayBillInClass.aAddMatListExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TWayBillInClass.aAddMatListExecute') else _udebug := nil;{$ENDIF}

  DocInfo.CurrName := cbCurr.Text;
  DocInfo.CurrID := cbCurr.KeyValue;
  DocInfo.CurrRate := edRate.Value;
  //DocInfo.WID :=
  DocInfo.OnDate := edDate.Date;
  if CurrEnt.NDSPayer
    then DocInfo.NDS := FVAT
    else DocInfo.NDS := 0;

  if (edKAgent.KAID <> 0) and (edKAgent.Obj.PTypeID > 0)
    then DocInfo.PTypeID := edKAgent.Obj.PTypeID
    else DocInfo.PTypeID := GetDefPriceType;

  ShowModalRef(Self, rtMat, vtMat, 'TfmMaterials', Self.OnDate, 0, Integer(@DocInfo));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
*)

//==============================================================================================
(*
procedure TWayBillInClass.FillMatsFromRef(DS: TssMemoryData);
  var
    FPosID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TWayBillInClass.FillMatsFromRef') else _udebug := nil;{$ENDIF}

  with mdDet do begin
    if not mdDet.Active then mdDet.Open;

    DS.First;
    mdDet.DisableControls;

    while not DS.Eof do begin
      FPosID := dsNextPosID(mdDet);
      Append;
      FieldByName('posid').AsInteger := FPosID;
      FieldByName('matid').AsInteger := DS.FieldByName('matid').AsInteger;
      FieldByName('postype').AsInteger := DS.Tag;

      if DS.Tag = 1 then FieldByName('norm').AsFloat := 1;

      FieldByName('discount').AsFloat := 0;
      FieldByName('matname').AsString := DS.FieldByName('name').AsString;
      FieldByName('msrname').AsString := DS.FieldByName('msrname').AsString;
      FieldByName('artikul').AsString := DS.FieldByName('artikul').AsString;
      FieldByName('amount').AsFloat := DS.FieldByName('amount').AsFloat;
      FieldByName('price').AsFloat := DS.FieldByName('price').AsFloat;
      FieldByName('fullprice').AsFloat := DS.FieldByName('price').AsFloat;

      if CurrEnt.NDSPayer
        then FieldByName('nds').AsFloat := FVAT
        else FieldByName('nds').AsFloat := 0;

      FieldByName('currid').AsInteger := cbCurr.KeyValue;
      FieldByName('wid').AsInteger := lcbWH.WID;
      FieldByName('whname').AsString := lcbWH.Combo.Text;
      FieldByName('currname').AsString := cbCurr.Text;
      FieldByName('onvalue').AsFloat := edRate.Value;
      FieldByName('producer').AsString := DS.FieldByName('producer').AsString;
      FieldByName('barcode').AsString := DS.FieldByName('barcode').AsString;
      Post;
      UpdatePos;
      DS.Next;
    end;
  end;
  RecalcSvc;
  mdDet.EnableControls;
  FGridRefresh := True;
  dbgWaybillDet.Adjust(nil, [colPosType, colRecNo]);

  dbgWaybillDet.ClearSelection;
  if dbgWaybillDet.FocusedNode <> nil
    then dbgWaybillDet.FocusedNode.Selected := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
*)

//==============================================================================================
(*
function TWayBillInClass.CreateByOrder(AID: Integer): Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TWayBillInClass.CreateByOrder') else _udebug := nil;{$ENDIF}

  Result := 0;

  with newDataSet do
  try
    mdDet.Close;
    mdDet.Open;

    FOrderID := AID;

    ProviderName := 'pWaybill_Get';
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := AID;
    Open;
    edKAgent.OnChange := nil;
    edKAgent.KAID := FieldByName('kaid').AsInteger;
    edKAgent.OnChange := edKAgentChange;
    edKAgent.Enabled := False;
    edContr.Enabled := False;
    edReason.Text := rs('fmWaybill', 'ByOrder',1) + amountPrefix + FieldByName('num').AsString;
    edDate.Date := Self.OnDate;
    cbCurr.KeyValue := FieldByName('currid').AsInteger;
    if FieldByName('attnum').AsString <> '' then lcbWH.WID := FieldByName('attnum').AsInteger;
    edRate.Value := FieldByName('onvalue').AsFloat;
    Close;

    ProviderName := 'pDocsRel_WB_Contr_Get';
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := AID;
    Params.ParamByName('doctype').AsInteger := 8;
    Open;
    if not IsEmpty then begin
      edContr.DocID := FieldByName('rdocid').AsInteger;
    end;
    Close;

    ProviderName := prvDet;
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := AID;
    Open;
    mdDet.LoadFromDataSet(Fields[0].DataSet);
    mdDet.First;
    while not mdDet.Eof do begin
      mdDet.Edit;
      mdDet.FieldByName('fullprice').AsFloat := mdDet.FieldByName('price').AsFloat;
      mdDet.Post;
      UpdatePos;
      mdDet.Next;
    end;
    mdDet.First;
    if not mdDet.IsEmpty then begin
      if dbgWaybillDet.FocusedNode = nil
        then dbgWaybillDet.FocusedAbsoluteIndex := 0;
      dbgWaybillDet.FocusedNode.Selected := True;
    end;
    Close;
  finally
    Free;
  end;
  cbCurr.Enabled := False;
  FRateChanged := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
*)

//==============================================================================================
(*
procedure TWayBillInClass.aAddSvcListExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TWayBillInClass.aAddSvcListExecute') else _udebug := nil;{$ENDIF}

  DocInfo.CurrName := cbCurr.Text;
  DocInfo.CurrID := cbCurr.KeyValue;
  DocInfo.CurrRate := edRate.Value;
  DocInfo.OnDate := edDate.Date;
  if CurrEnt.NDSPayer
    then DocInfo.NDS := FVAT
    else DocInfo.NDS := 0;

  if (edKAgent.KAID <> 0) and (edKAgent.Obj.PTypeID > 0)
    then DocInfo.PTypeID := edKAgent.Obj.PTypeID
    else DocInfo.PTypeID := GetDefPriceType;

  ShowModalRef(Self, rtServices, vtServices, 'TfmServices', Self.OnDate, 0, Integer(@DocInfo));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
*)

//==============================================================================================
(*
procedure TWayBillInClass.UpdatePos;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TWayBillInClass.UpdatePos') else _udebug := nil;{$ENDIF}

  inherited;

  with mdDet do begin
    if FieldByName('postype').AsInteger = 1 then begin
      if mdSvc.Locate('posid', FieldByName('posid').AsInteger, [])
        then mdSvc.Edit
        else mdSvc.Append;

      mdSvc.FieldByName('posid').AsInteger := FieldByName('posid').AsInteger;
      mdSvc.FieldByName('amount').AsFloat := FieldByName('amount').AsFloat;
      mdSvc.FieldByName('norm').AsFloat := FieldByName('norm').AsFloat;
      mdSvc.FieldByName('svctoprice').AsInteger := FieldByName('svctoprice').AsInteger;
      mdSvc.FieldByName('price').AsFloat := FieldByName('price').AsFloat;
      mdSvc.FieldByName('total').AsFloat := FieldByName('sumcurr').AsFloat;
      mdSvc.FieldByName('totalwithnds').AsFloat := FieldByName('sumwithnds').AsFloat;
      mdSvc.Post;
      RecalcSvc;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
*)

//==============================================================================================
(*
procedure TWayBillInClass.RecalcSvc;
  var
    FTotAmount, FSvcSum: Extended;
    BM: TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TWayBillInClass.RecalcSvc') else _udebug := nil;{$ENDIF}

  FTotAmount := 0;
  with mdDet do
  try
    DisableControls;
    BM := mdDet.GetBookmark;

    First;
    while not Eof do begin
      if FieldByName('postype').AsInteger = 0
      then FTotAmount := FTotAmount + FieldByName('amount').AsFloat * FieldByName('fullprice').AsFloat;
      Next;
    end;

    if FTotAmount = 0 then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

    FSvcSum := GetDSSummCurr(mdSvc, 'total', 'svctoprice', 1);

    First;
    while not Eof do begin
      if FieldByName('postype').AsInteger = 0 then begin
        Edit;
        FieldByName('price').AsFloat := FieldByName('fullprice').AsFloat
          + FSvcSum
          {* FieldByName('amount').AsFloat}
          * FieldByName('fullprice').AsFloat / FTotAmount;
        Post;
        UpdatePos;
      end;
      Next;
    end;
  finally
    GotoBookmark(BM);
    FreeBookmark(BM);
    EnableControls;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
*)

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('WaybillInClass', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
