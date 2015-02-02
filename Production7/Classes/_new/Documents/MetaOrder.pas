{$I ok_sklad.inc}
unit MetaOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ExtCtrls, StdCtrls, ActnList, ssBaseTypes,
  DB, ssMemDS, DBClient,
  prTypes, okClasses, xLngDefs,
  //FR_DSet, FR_DBSet, FR_Class, FR_Desgn,
  DBCtrls, dxmdaset, XMLDoc, XMLIntf,
  MetaDoc, MetaClass, WBMetaItem, MetaPrice, MetaTax, MetaDiscount, MetaBusinessPartner;

type
  TWMatTurn = class(TMetaClass)
    protected
      Fposid: Integer;
      FSOURCEID: Integer;
      FMATID: Integer;
      FWID: Integer;
      Famount: Double;
      FTurnType: TWmatTurnType;
  end;

  {TWMatTurnList = class(TMetaClassList)
  end;
  }

  //---------------------------------------------------------------------------
  TMetaOrder = class(TMetaClass) // should be metadoc, but it is still defunct
    private
      //function CheckDatesIn:Boolean;

    protected
      FItems: TWBMetaItemList;

      // main fields of WaybillList table
      FNum: String; //NUM (document number)
      FBusPar: TMetaBusinessPartner; // KAID

      FPrice: TMetaPrice; // CURRID, SUMMINCURR, ONVALUE
      FTaxes: TMetaTaxList; // NDS

      FReason: String; // REASON
      FEmployee: Integer; //TMetaPerson; // PERSONID
      FPosted: Boolean; // CHECKED
      FDeleted: Boolean; // DELETED

      FTotal: Double; // SUMMALL
      FType: Integer; // WTYPE
      FReceived: String; // RECEIVED (person name ???)
      FValidTill: TDateTime; // TODATE
      FNotes: String; // NOTES
      FCompany: Integer; // TMetaBusinessPartner; // ENTID

      FReservePositions: Boolean;

      // DEFNUM
      // ATTNUM
      // ATTDATE

      procedure loadXMLcallback(topNode, cbNode: IXMLNode); override;

      {procedure GetSummAll; override;
      function DoSetRsv(APosID, AMatID, AWID: Integer; AAmount: Extended): Boolean;
      function DoRemoveRsv(APosID: Integer): Boolean;
      }

    public
      constructor Create(const AParent: TMetaClass); override;
      destructor Destroy; override;
      procedure Clear; override;

      function SaveData: Boolean;
      function LoadXML(var AXMLif: IXMLDocument; var Order: IXMLNode): Boolean; reintroduce;

      function GetTotal: Double; // computes total amount for all positions
      function getErrorText(const Index: Integer): String; override;

      property Positions: TWBMetaItemList read FItems write FItems;
      property Num: String read FNum write FNum;
      property BusPar: TMetaBusinessPartner read FBusPar write FBusPar;
      property Price: TMetaPrice read FPrice write FPrice;
      property Taxes: TMetaTaxList read FTaxes write FTaxes;
      property Reason: String read FReason write FReason;
      property Employee: Integer read FEmployee write FEmployee;
      property Posted: Boolean read FPosted write FPosted;
      property Deleted: Boolean read FDeleted write FDeleted;
      property Total: Double read getTotal;
      property wbType: Integer read FType write FType;
      property Received: String read FReceived write FReceived;
      property ReservePositions: Boolean read FReservePositions write FReservePositions;
      property ValidTill: TDateTime read FValidTill write FValidTill;
      property Notes: String read FNotes write FNotes;
      property Company: Integer read FCompany write FCompany;
  end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  prConst, ClientData, Login, prFun, fKAgent, ssFun, ShellAPI, Math,
  StdConvs, ssCallbackConst, Webreq,
  ssDateUtils, fMessageDlg, KATurnover,
  ssRegUtils, ssStrUtil, Serials,
  SetDiscount, okMoneyFun,
  ssBaseConst, DateUtils,
  Udebug;

const
  errNotModified = 1;
  errXMLbadDate = 2;
  errXMLbadCustomerID = 3;
  errXMLbadTaxes = 4;
  errXMLbadDiscount = 5;
  errXMLbadCurrency = 6;
  errXMLbadTotal = 7;
  errXMLbadID = 8;
  errXMLemptyOrder = 9;
  errXMLnoPositions = 10;
  errXMLbadProductID = 11;
  errXMLbadProductQuantity = 12;
  errXMLbadProductPrice = 13;
  errXMLbadProductCurrency = 14;
  errXMLbadProductDiscount = 15;
  errXMLbadProductTax = 16;
  errXMLnoPositionInfo = 17;
  errXMLbadCustomer = 18;
  errXMLbadCustomerEmail = 19;
  errXMLnoAddresses = 20;
  errXMLbadAddress = 21;

  orderErrorTexts: array[0..21] of string = (
    'no error(s)',
    'not saving as order is not modified',
    'Order date invalid',
    'Order Customer ID invalid',
    'Order taxes invalid',
    'Order discount invalid',
    'Order currency invalid',
    'Order total invalid',
    'error generating ID',
    'Empty order',
    'no positions',
    'bad Product ID',
    'bad Product Quantity',
    'bad Product Price',
    'bad Product Currency',
    'bad Product Discount',
    'bad Product Tax',
    'no position Info',
    'no customer info',
    'bad customer email or error finding local customer',
    'no addresses supplied',
    'bad address specified'
  );

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

//==============================================================================================
(*
procedure TMetaOrder.LoadData(const Value: integer);
 var
   FItem: TcxTreeListNode;
   FTaxSumm, FPosNDS, FSumWONDS, FNDS, FPrice: Extended;
   APrefix, ASuffix: string;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TMetaOrder.setid') else _udebug := nil;{$ENDIF}

  Fid := Value;

  //********** Чтение оборотов ***********************
{
procedure SP_GET_DOC_WMT (
    wbillid integer)
returns (
    posid integer,
    wid integer,
    matid integer,
    ondate timestamp,
    turntype integer,
    amount numeric(15,8),
    sourceid integer,
    flag integer,
    sn varchar(64)
)
}
  if Value > 0 then begin
    with newDataSet do
      try
        ProviderName := 'pWMatTurnOut_Get';
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := FID;
        Open;
        mdWMatTurn.CopyFromDataSet(Fields[0].DataSet);
        Close;
        mdWMatTurnOld.CopyFromDataSet(mdWMatTurn);
      finally
        Free;
      end;
  end;// if Value > 0

  //-------------------------------------------------
  with newDataSet do
    try
      //Установка номера по умолчанию
      if ((Value = 0) or IsPattern) and OrdersOutAutoNum then begin
        APrefix := OrdersOutPrefix;
        ASuffix := OrdersOutSuffix;
        FLastGen := '';

        FCurrNum := GetDocNumEx(dmData.SConnection, dtOrderOut, 1, APrefix, ASuffix,
                    FLastGen, cdsEnts.FieldByName('kaid').AsInteger);

        edNum1.Text := APrefix + IntToStr(FCurrNum) + ASuffix;
      end
      else edNum1.Text := '';

      if Value <> 0 then begin
        ProviderName := 'pWaybill_Get';
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := Value;
        Open;
        if not IsEmpty then begin
          if not IsPattern then begin
            edNum1.Text := fieldbyname('num').AsString;
            edNum1.Tag  := fieldbyname('defnum').AsInteger;
            eddate.Date := fieldbyname('ondate').AsDateTime;
            edTime.Time := fieldbyname('ondate').AsDateTime;
          end;

          if fieldbyname('todate').IsNull then begin
            chbToDate.Checked := false;
            edToDate.EditText := '';
          end
          else begin
            chbToDate.Checked := True;
            edToDate.Date := fieldbyname('todate').AsDateTime;
          end;

          cdsPayType.Locate('PTYPEID', lcbPayType.KeyValue, []);
          edKAgent.KAID := fieldbyname('kaid').AsInteger;

          if not FieldByName('personid').IsNull
            then lcbPersonName.KeyValue := FieldByName('personid').AsInteger
            else lcbPersonName.Text := '';

          oldkaid := fieldbyname('kaid').AsInteger;
          edReason.Text := fieldbyname('REASON').asstring;
          edNotes.Text := fieldbyname('notes').asstring;

          if not FieldByName('entid').IsNull
            then cdsEnts.Locate('kaid', FieldByName('entid').AsInteger, []);

          kaEnt.AccID := FieldByName('defnum').AsInteger;

          if cdsCurr.Locate('CURRID',fieldbyname('CURRID').AsInteger,[])
            then cbCurr.KeyValue := fieldbyname('CURRID').AsInteger;

          edRate.Value := FieldByName('onvalue').AsFloat;
        end;
        Close;

        ProviderName := 'pWaybillDet_GetOut'; // чтение позиций в mdDet
        FetchParams;
        Params.ParamByName('WBILLID').AsInteger := fid;
        Open;
        mdDet.LoadFromDataSet(Fields[0].DataSet);
        Close;

        ProviderName := 'pWaybillSvc_Get';
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := FID;
        Open;
        mdDet.LoadFromDataSet(Fields[0].DataSet);

        if not mdDet.IsEmpty then begin
          mdDet.First;
          while not mdDet.Eof do begin
            if (mdDet.FieldByName('bySN').AsInteger = 1)
                and mdWMatTurn.Locate('sourceid',mdDet.FieldByName('posid').AsInteger,[])
            then begin
              mdDet.Edit;
              mdWMatTurn.First;
              while not mdWMatTurn.Eof do begin
                if (mdWMatTurn.FieldByName('sourceid').AsInteger = mdDet.FieldByName('posid').AsInteger)
                   and (not mdWMatTurn.FieldByName('SN').IsNull)
                then begin
                  mdDet.FieldByName('SN').AsString := mdDet.FieldByName('SN').AsString+mdWMatTurn.FieldByName('SN').AsString+'; ';
                end;
                mdWMatTurn.Next;
              end;

              if mdDet.FieldByName('SN').IsNull then mdDet.Cancel
              else begin
                mdDet.FieldByName('SN').AsString := System.Copy(mdDet.FieldByName('SN').AsString,1,Length(mdDet.FieldByName('SN').AsString)-2);
                mdDet.Post;
              end;
            end; //if
            mdDet.Next;
          end; //while
        end; //if

        Close;

        ProviderName := 'pDocsRel_WB_Contr_Get';
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := FID;
        Params.ParamByName('doctype').AsInteger := -8;
        Open;

        if not IsEmpty then begin
          edContr.DocID := FieldByName('rdocid').AsInteger;
          FContrDocID := edContr.DocID;
        end
        else edContr.DocID := 0;

        Close;

        ProviderName := 'pWaybillDet_GetTaxes';
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := Value;
        Open;
        while not Eof do begin
          if mdDet.Locate('posid', FieldByName('posid').AsInteger, []) then begin
            FPrice := mdDet.FieldByName('price').AsFloat * mdDet.FieldByName('onvalue').AsFloat;
            FPosNDS := mdDet.FieldByName('nds').AsFloat;
            NDSCalc(mdDet.FieldByName('amount').AsFloat, FPrice, FPosNDS, 1, FSumWONDS, FNDS);
            FSumWONDS := RoundToA(RoundToA(FSumWONDS + FNDS, -2) - RoundToA(FNDS, -2), -2);
            FTaxSumm := RoundToA(FSumWONDS * FieldByName('onvalue').AsFloat / 100, -2);

            mdDet.Edit;
            mdDet.FieldByName('Tax' + FieldByName('taxid').AsString).AsFloat := FieldByName('onvalue').AsFloat;
            mdDet.FieldByName('TaxRate' + FieldByName('taxid').AsString).AsFloat := FTaxSumm;
            mdDet.Post;
          end;
          Next;
        end;
        Close;

        with dbgWaybillDet do
          if FocusedNode <> nil then FocusedNode.Selected := True;

        if not IsPattern then begin
          ProviderName := 'pWayBillPay_Get';// Чтение платежа
          FetchParams;
          Params.ParamByName('WBILLID').AsInteger := fid;
          Open;
          if not IsEmpty then begin
            chbPay.Enabled := false;
            chbPay.Checked := true;
            chbPay.Enabled := true;
            PayDocChecked := fieldbyname('Checked').AsInteger = 1;
            chbPay.Enabled := not PayDocChecked;

            if not chbPay.Enabled then begin
              lcbPayType.Enabled := False;
              lPaySumm.Enabled := False;
              lPayCurr.Enabled := False;
              lPayType.Enabled := False;
              edPaySumm.Enabled := False;
              edPayNum.Enabled := False;
              cbPayCurr.Enabled := False;
              lPayMPerson.Enabled := false;
              lcbPayMPerson.Enabled := False;
              btnPayMPerson.Enabled := False;
              lcbCashDesks.Enabled := False;
              lcbAccount.Enabled := False;
              lAcc.Enabled := False;
              lCashDesks.Enabled := False;
              btnCashDesks.Enabled := False;
              btnFinPay.Enabled := False;
            end;

            PayDocId := fieldbyname('PayDocId').AsInteger;
            OldPayDocID := PayDocID;
            PayDocDate := FieldByName('OnDate').AsDateTime;
            edPayNum.Text := fieldbyname('DocNum').AsString;
            lcbPayType.KeyValue := fieldbyname('PTypeId').AsInteger;

            if cdsPayType.Locate('PTypeId', fieldbyname('CurrId').AsInteger, [])
              then cbPayCurr.KeyValue := fieldbyname('CurrId').AsInteger;

            edPaySumm.Tag := 1;
            edPaySumm.Value := fieldbyname('Total').AsFloat;
            edPaySumm.Tag := 0;

            if not FieldByName('mpersonid').IsNull
              then lcbPayMPerson.KeyValue := FieldByName('mpersonid').AsInteger
              else lcbPayMPerson.Text := '';

            if not FieldByName('accid').IsNull
              then lcbAccount.KeyValue := FieldByName('accid').AsInteger
              else lcbAccount.Clear;

            if not FieldByName('cashid').IsNull
              then lcbCashDesks.KeyValue := FieldByName('cashid').AsInteger
              else lcbCashDesks.Clear;

          end//if not IsEmpty
          else begin
            PayDocChecked := false;
            PayDocId := 0;
            chbPay.Enabled := false;
            chbPay.Checked := false;
            chbPay.Enabled := true;
            edPayNum.Text := '';
            edPaySumm.Tag := 1;
            edPaySumm.Value := 0;
            edPaySumm.Tag := 0;
          end;//else
          Close;
        end; // if not isPattern
      end // if Value <> 0
      else begin
        mdDet.Open;
        mdWMatTurn.Open;
        mdWMatTurnOld.CopyFromDataSet(mdWMatTurn);
        PayDocChecked := False;
        PayDocId := 0;
        chbPay.Enabled := False;
        chbPay.Checked := False;
        chbPay.Enabled := True;
        edPayNum.Text := '';
        edPaySumm.Tag := 1;
        edPaySumm.Value := 0;
        edPaySumm.Tag := 0;
        with cdsPayMPersons do begin
          if Locate('userid', UserID, []) then lcbPersonName.KeyValue := FieldByName('kaid').AsInteger;
        end;
      end;

      FModified := False;

      FPosModified := False;

      if Value > 0 then begin
        FGridRefresh := True;
        mdDet.First;
        while not mdDet.Eof do begin
          if mdWMatTurn.Locate('sourceid', mdDet.FieldByName('posid').AsInteger, [])
          then begin
            mdDet.Edit;
            mdDet.FieldByName('fullprice').AsFloat := mdDet.FieldByName('price').AsFloat / (100 - mdDet.FieldByName('discount').AsFloat) * 100;
            mdDet.FieldByName('status').AsInteger := 1;
            mdDet.Post;
          end;
          UpdatePos;
          mdDet.Next;
        end;

        mdDet.First;
      end;

      FPayDocModified := false;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end; // LoadData
*)

//==============================================================================================
(*
function TMetaOrder.CheckDatesIn: boolean;
  var
    eStr, eStr2, m, tmpstr: String;
    i: integer;
    tmpMaxDate: TDateTime;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaOrder.CheckDatesIn') else _udebug := nil;{$ENDIF}

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
        Params.ParamByName('ondate').AsDateTime := edDate.Date + edTime.Time;
        Open;
        if not IsEmpty then begin
          tmpMaxDate := MinDateTime;

          //Формирование сообщения
          for i := 0 to dbgWaybillDet.Count-1  do begin
            eStr2 := '';
            mdWMatTurn.First;
            while not mdWMatTurn.Eof do begin
              if mdWMatTurn.FieldByName('sourceid').AsInteger = dbgWaybillDet.Items[i].Values[colPosid.Index]
                   and Locate('posid',mdWMatTurn.fieldbyname('posid').AsInteger,[])
              then begin
                if eStr2 = ''
                  then eStr2 := Fields[1].AsString
                  else eStr2 := eStr2 + ', ' + Fields[1].AsString;

                if tmpMaxDate < Fields[1].AsDateTime then tmpMaxDate := Fields[1].AsDateTime;
              end;

              mdWMatTurn.Next;
            end;

            if eStr2 <> '' then
               eStr := eStr + amountPrefix + inttostr(dbgWaybillDet.Items[i].Values[colRecNo.Index]) + ' '
                       + dbgWaybillDet.Items[i].Values[colMatName.Index]
                       + rs('fmWaybill','AccErr1') + eStr2 + #13;

          end;//for

          eStr := Format(rs('fmWaybill', 'AccErr2'),[DateTimeToStr(edDate.Date+edTime.Time),
                  #13,eStr,#13,DateTimeToStr(tmpMaxDate)]);

          if ssMessageDlg(eStr, ssmtWarning, [ssmbYes, ssmbCancel]) = mrYes then begin
            edDate.Date := tmpMaxDate;
            edTime.Time := frac(tmpMaxDate);
            Result := true;
          end
          else Result := false;
        end //if not IsEmpty
        else Result := true;

        Close;

      finally
         Free;
      end;
    end //if not mdWMatTurn.IsEmpty then begin
    else Result := true;
    
  except
    Result := false;
    raise;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
*)

(*
//Функция подсчёта итоговых сумм
//==============================================================================================
procedure TMetaOrder.GetSummAll;
 var
   i, j: Integer;
   BM: TBookmark;
   PriceCurrOutNDS, SummCurrOutNDS, SummCurrNDS, SummCurr, FAmount, FNorm,
   PriceDefOutNDS, SummDefOutNDS, SummDefNDS, SummDef, SummTax, PosSummTax,
   AllSummDefOutNDS, AllSummDefNDS, AllSummDef, FNDS: Extended;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaOrder.GetSummAll') else _udebug := nil;{$ENDIF}

  with dbgWaybillDet do begin
    AllSummCurr := 0;
    AllSummDefOutNDS := 0;
    AllSummDefNDS := 0;
    AllSummDef := 0;

    for i := 0 to Count - 1 do begin
      try
        if not VarIsNull(Items[i].Values[colNorm.Index])
          then FNorm := Items[i].Values[colNorm.Index]
          else FNorm := 0;

        FAmount := Items[i].Values[colAmount.Index];

        if (Items[i].Values[colPType.Index] = 1) and (FNorm > 0)
          then FAmount := FAmount * FNorm;

        SummCurr := RoundToA(FAmount * Items[i].Values[colPriceInCurr.Index], -2);

        NDSCalc(FAmount, Items[i].Values[colPriceInCurr.Index],
                VarToFloat(Items[i].Values[colNDSRate.Index]), 1, SummDefOutNDS, SummDefNDS);

        SummDef := RoundToA(SummDefOutNDS + SummDefNDS, -2);
        SummDefOutNDS := SummDef - RoundToA(SummDefNDS, -2);
        PosSummTax := 0;

        for j := 0 to ColumnCount - 1 do begin
          if (Pos('colTax', Columns[j].Name) > 0)
             and (Pos('colTaxRate', Columns[j].Name) = 0)
             and (not VarIsNull(Items[i].Values[j]))
          then begin
            SummTax := RoundToA(SummDefOutNDS * VarToFloat(Items[i].Values[j]) / 100, -2);
            PosSummTax := PosSummTax + SummTax;
          end;
        end;

        AllSummCurr := AllSummCurr + SummCurr + PosSummTax;

      except
      end;

      try
        try
          FNDS := Items[i].Values[colNDSRate.Index];
        except
          FNDS := NDS;
        end;

        {Цены с НДС и без НДС}
        NDSCalc(1, Items[i].Values[colPriceInCurr.Index] * CurKurs, FNDS, 1, SummDefOutNDS, SummDefNDS);

        NDSCalc(FAmount, Items[i].Values[colPriceInCurr.Index] * CurKurs, FNDS, 1, SummDefOutNDS, SummDefNDS);
        SummDef := RoundToA(SummDefOutNDS + SummDefNDS, -2);
        SummDefOutNDS := SummDef - RoundToA(SummDefNDS, -2);

        PosSummTax := 0;
        for j := 0 to ColumnCount - 1 do begin
          if (Pos('colTax', Columns[j].Name) > 0)
             and (Pos('colTaxRate', Columns[j].Name) = 0)
             and (not VarIsNull(Items[i].Values[j]))
          then begin
            SummTax := RoundToA(SummDefOutNDS * VarToFloat(Items[i].Values[j]) / 100, -2);
            PosSummTax := PosSummTax + SummTax;
          end;
        end;

        SummDef := SummDef + PosSummTax;
        AllSummDefOutNDS := AllSummDefOutNDS + SummDefOutNDS;
        AllSummDefNDS := AllSummDefNDS + RoundToA(SummDefNDS, -2);

        //Сумма в нац. валюте с НДС;
        AllSummDef := AllSummDef + SummDef;
      except
      end;
    end;

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

  with dbgWaybillDet do begin
    NotRsvPresent := False;
    for i := 0 to Count - 1 do begin
      try
        if (Items[i].Values[colPType.Index] = 0) then
          if not mdWMatTurn.Locate('sourceid', Items[i].Values[colPosId.Index],[]) then begin
            NotRsvPresent := True;
            Break;
          end;
      except
      end;
    end;
  end;
  CheckSvc;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
*)

(*
//==============================================================================================
procedure TMetaOrder.aCDelExecute(Sender: TObject);
 var
   FItem: TListItem;
   i: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaOrder.aCDelExecute') else _udebug := nil;{$ENDIF}


  if ((dbgWaybillDet.SelectedCount = 1) and
     (ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo]) <> mrYes))
     or
     ((dbgWaybillDet.SelectedCount > 1) and
     (mrYes <> ssMessageDlg(Format(rs('Common', 'DelConfirmEx'), [dbgWaybillDet.SelectedCount]), ssmtWarning, [ssmbYes, ssmbNo])))
  then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  Screen.Cursor := crSQLWait;
  fProgress.Caption := rs('Common', 'Deleting');
  fProgress.Show;
  fProgress.pbMain.Max := dbgWaybillDet.SelectedCount;
  CanSelect := False;
  try
    mdDet.DisableControls;
    for i := 0 to dbgWaybillDet.SelectedCount - 1 do begin
      Application.ProcessMessages;

      if mdDet.Locate('posid', dbgWaybillDet.SelectedNodes[i].Values[colPosId.Index], [])
      then DelPos;

      fProgress.pbMain.StepIt;
      Application.ProcessMessages;
    end;
    LocateAfterDel;
    FGridRefresh := True;

  finally
    fProgress.Hide;
    Screen.Cursor := crDefault;
    mdDet.EnableControls;
    CanSelect := True;
    SelectFocusedNode;
    RealignGrid;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
*)

(*
//==============================================================================================
procedure TMetaOrder.aCUpdExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaOrder.aCUpdExecute') else _udebug := nil;{$ENDIF}


  try
    Screen.Cursor := crSQLWait;
    case mdDet.FieldByName('postype').AsInteger of
      0:
        with TfrmEditPositionAcc.Create(nil) do
        try
          ParentNameEx := Self.ParentNameEx;
          dbgWaybillDet.SetFocus;
          Application.ProcessMessages;

          WBType := wbtOrderOut;
          FAccOutID := FOrdID;
          edDiscount.Tag := edKAgent.KAID;
          OnDate := Self.OnDate;
          ParentHandle := Self.Handle;
          ParentHandle2 := Self.Handle;
          PTypeID := Self.edKAgent.Obj.PTypeID;
          NDSPayer := cdsEnts.FieldByName('ndspayer').AsInteger = 1;
          KAType := Self.edKAgent.Obj.KType;
          CurrID := Self.cbCurr.KeyValue;
          OnDate := StrToDate(edDate.Text);
          FRateDate := Self.FRateDate;
          FRateID := Self.FRateID;
          Kurs := CurKurs;
          aSetKurs.Caption := FloatToStr(Kurs);

          parentMDDet := mdDet;
          parentmdWMatTurn := mdWMatTurn;
          parentMDWMatTurnOld := mdWMatTurnOld;
          parentMDTmpIDs := mdTmpIds;

          CurrName := cdsCurr.fieldbyname('shortname').AsString;
          aShowPriceIn.Hint := rs('fmWaybill', 'ShowPriceIn');
          chbRsv.Tag := VarToInt(dbgWaybillDet.FocusedNode.Values[colStatus.Index]);
          chbRsv.Checked := VarToInt(dbgWaybillDet.FocusedNode.Values[colStatus.Index]) = 1;
          AOMode := False;

          ID := mdDet.FieldByName('posid').AsInteger;
          Self.FOrdID := FAccOutID;
          Screen.Cursor := crDefault;
        finally
          Free;
        end;

      1:
        with TfrmEditPositionSvc.Create(nil) do
        try
          ParentHandle := Self.Handle;
          ParentNameEx := Self.ParentNameEx;
          OnDate := Int(edDate.Date) + Frac(edTime.Time);
          FRateValue := Self.edRate.Value;
          CurrID := Self.cbCurr.KeyValue;
          mdDet := Self.mdDet;
          PosNDS := XMLStrToFloat(mdDet.FieldByName('nds').AsString);
          ID := Self.mdDet.FieldByName('posid').AsInteger;
          ShowModal;
        finally
          Free;
        end;
    end;//case
  finally
    Screen.Cursor := crDefault;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
*)

(*
//==============================================================================================
procedure TMetaOrder.aAddKAExecute(Sender: TObject);
 var
   aid: integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaOrder.aAddKAExecute') else _udebug := nil;{$ENDIF}


  if edKAgent.Editor.Focused then edKAgent.ShowRef
  else if edContr.Editor.Focused then edContr.ShowRef
  else if FCurrCtrl = lcbPayType then ShowFinance(Self, Date, 1)
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
  else if FCurrCtrl = lcbPersonName then begin
    try aid := lcbPersonName.KeyValue; except aid := 0; end;
    lcbPersonName.SetFocus;
    lcbPersonName.Tag := 1;
    ShowModalRef(Self, rtPersons, vtKAgent, 'TfmKAgent', Self.OnDate, aid);
    lcbPersonName.Tag := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
*)

(*
//==============================================================================================
function TMetaOrder.KAName(kaid:integer):string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaOrder.KAName') else _udebug := nil;{$ENDIF}

  with newDataSet do
  try
    ProviderName := 'pKAgentName_Get';
    FetchParams;
    Params.ParamByName('KAID').AsInteger := kaid;
    Open;

    if not IsEmpty
      then Result := Fields[0].AsString
      else Result := '';

    Close;
  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
*)

(*
//==============================================================================================
procedure TMetaOrder.aRemoveRsvExecute(Sender: TObject);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaOrder.aRemoveRsvExecute') else _udebug := nil;{$ENDIF}


  if mrYes =  ssMessageDlg(rs('fmWaybill', 'DelRsvConfirm'), ssmtWarning,[ssmbYes,ssmbNo]) then begin
    Application.ProcessMessages;

    if dbgWaybillDet.SelectedCount > 1 then fProgress.Show;

    fProgress.Caption := rs('fmWaybill','DelRsvPr');
    fProgress.Refresh;
    fProgress.pbMain.Max := dbgWaybillDet.SelectedCount;
    mdDet.DisableControls;

    try
      for i := 0 to dbgWaybillDet.SelectedCount - 1 do begin
        if dbgWaybillDet.SelectedNodes[i].Values[colStatus.Index] <> 0 then begin
          fProgress.lText.Caption := dbgWaybillDet.SelectedNodes[i].Values[colMatName.Index];
          Application.ProcessMessages;
          DoRemoveRsv(dbgWaybillDet.SelectedNodes[i].Values[colPosID.Index]);
          fProgress.pbMain.StepIt;
          Application.ProcessMessages;
        end;
      end;
    finally
      fProgress.Hide;
      mdDet.EnableControls;
    end;
  end; // if ssMessageDlg...

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
*)

(*
//==============================================================================================
procedure TMetaOrder.DelPos;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaOrder.DelPos') else _udebug := nil;{$ENDIF}


    //Удаление из mdWMatTurn
    while mdWMatTurn.Locate('sourceid', mdDet.fieldbyname('posid').AsInteger, [] )
    do mdWMatTurn.Delete;

    //Удаление из mdTmpIds и освобождение резерва для текущего sourceid
    with mdTmpIds  do begin
      First;
      while not Eof do begin
        if FieldByName('sourceid').AsInteger <> mdDet.fieldbyname('posid').AsInteger
        then Next;

        dmData.SConnection.AppServer.Rsv_Delete(FieldByName('tmpid').AsInteger);
        Delete;
      end;//while not eof
    end;//with mdTmpIds

    //Освобождение редактируемых позиций (старых)
    mdWMatTurnOld.First;
    while not mdWMatTurnOld.Eof do begin
      if mdWMatTurnOld.FieldByName('sourceid').AsInteger = mdDet.fieldbyname('posid').AsInteger then begin
        with newDataSet do
        try
          ProviderName := 'pWayBill_GetMatID_WID';
          FetchParams;
          Params.ParamByName('posId').AsInteger := mdWMatTurnOld.FieldByName('posid').AsInteger;
          Open;
          if not IsEmpty then begin
            mdTmpIds.Append;
            mdTmpIds.FieldByName('sourceid').AsInteger := mdWMatTurnOld.FieldByName('sourceid').AsInteger;
            mdTmpIds.FieldByName('amount').AsFloat := RoundToA(XMLStrToFloat(mdWMatTurnOld.fieldbyname('amount').AsString)*-1, MatDisplayDigits);
            mdTmpIds.FieldByName('posid').AsInteger := mdWMatTurnOld.FieldByName('posid').AsInteger;
            mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdWMatTurnOld.FieldByName('posid').AsInteger,Fields[0].AsInteger,Fields[1].AsInteger,0,RoundToA(XMLStrToFloat(mdWMatTurnOld.fieldbyname('amount').AsString)*-1, MatDisplayDigits));
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

   mdDet.Delete;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
*)

(*
//==============================================================================================
procedure TMetaOrder.FormCreate(Sender: TObject);
  var
    Temp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaOrder.FormCreate') else _udebug := nil;{$ENDIF}


  GetTaxes;

  inherited;

  cdsEnts.Locate('kaid', CurrEnt.KAID, []);
  FCurrPayNum := -1;
  lcbPayMPerson.KeyValue := 0;
  lcbPayMPerson.Text := '';

  if cdsPayMPersons.Locate('userid', UserID, [])
    then lcbPersonName.KeyValue := cdsPayMPersons.FieldByName('kaid').AsInteger
    else lcbPersonName.Clear;

  lcbPayType.KeyValue := 1;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
*)

(*
//==============================================================================================
procedure TMetaOrder.aSetRsvExecute(Sender: TObject);
 var
   ASourceId,APosId,ATmpId, i:integer;
   AAmount,FRemain, tmpremain, tmpsumm, summamount, TmpAmount:Extended;
   eStr, SNs: string;
   BM:TBookmark;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaOrder.aSetRsvExecute') else _udebug := nil;{$ENDIF}


  if not FShowRsvMsgs or NoRsvConfirm
     or (mrYes = ssMessageDlg(rs('fmWaybill', 'SetRsvConfirm'), ssmtWarning,[ssmbYes,ssmbNo]))
  then begin
    Application.ProcessMessages;

    if dbgWaybillDet.SelectedCount > 1 then fProgress.Show;

    fProgress.Caption := rs('fmWaybill','SetRsvPr');
    fProgress.pbMain.Max := dbgWaybillDet.SelectedCount;
    mdDet.DisableControls;

    try
      for i := 0 to dbgWaybillDet.SelectedCount - 1 do begin
        if (dbgWaybillDet.SelectedNodes[i].Values[colPType.Index] = 0)
           and
           (dbgWaybillDet.SelectedNodes[i].Values[colStatus.Index] <> 1)
        then begin
          fProgress.lText.Caption := dbgWaybillDet.SelectedNodes[i].Values[colMatName.Index];
          Application.ProcessMessages;

          if not DoSetRsv(dbgWaybillDet.SelectedNodes[i].Values[colPosId.Index],
                dbgWaybillDet.SelectedNodes[i].Values[colMatId.Index],
                dbgWaybillDet.SelectedNodes[i].Values[colWId.Index],
                dbgWaybillDet.SelectedNodes[i].Values[colAmount.Index])
          then begin
            if dbgWaybillDet.SelectedCount > 1 then begin
              eStr := rs('fmWaybill', 'RsvErrorPr1') + ': <' +
                //IntToStr(dbgWaybillDet.Items[i].Values[colRecNo.Index])+'.'+
                dbgWaybillDet.SelectedNodes[i].Values[colMatName.Index]+ '>. ' +
                rs('fmWaybill','RsvErrorPr2');

              if FShowRsvMsgs and (ssMessageDlg(eStr, ssmtError,[ssmbYes,ssmbNo]) <> mrYes) then begin
                mdPosition.Close;
                fProgress.Hide;
                Break;
              end;
            end
            else if FShowRsvMsgs
              then ssMessageDlg(rs('fmWaybill', 'RsvErrorPr1') +
                ' <' + dbgWaybillDet.SelectedNodes[i].Values[colMatName.Index] + '>. ', ssmtError, [ssmbOK]);
          end;
          fProgress.pbMain.StepIt;
          Application.ProcessMessages;
        end;//if dbgWaybillDet...
      end;//for
    finally
      fProgress.Hide;
      mdDet.EnableControls;
    end;
  end;//if  ssMessageDlg...

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
*)

(*
//==============================================================================================
procedure TMetaOrder.aBallanceExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaOrder.aBallanceExecute') else _udebug := nil;{$ENDIF}


  if not ShowBallance then begin
    AccessDenied;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  if edKAgent.KAID <= 0 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmKATurnover.Create(nil) do
    try
      ParentNameEx := 'fmKAgent';
      OnDate := Self.OnDate;
      ID := edKAgent.KAID;
      ShowModal;
    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
*)

(*
//==============================================================================================
procedure TMetaOrder.aAddSvcExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaOrder.aAddSvcExecute') else _udebug := nil;{$ENDIF}

  with TfrmEditPositionSvc.Create(nil) do
  try
    ParentHandle := Self.Handle;
    ParentNameEx := Self.ParentNameEx;
    OnDate := Int(edDate.Date) + Frac(edTime.Time);
    FRateValue := Self.edRate.Value;
    CurrID := Self.cbCurr.KeyValue;
    mdDet := Self.mdDet;
    PosNDS := NDS;
    ShowModal;
  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
*)

(*
//==============================================================================================
procedure TMetaOrder.aAddMatExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaOrder.aAddMatExecute') else _udebug := nil;{$ENDIF}


  Screen.Cursor := crSQLWait;
  with TfrmEditPositionAcc.Create(nil) do
  try
    WBType := wbtOrderOut;
    ParentNameEx := Self.ParentNameEx;
    OnDate := Self.OnDate;
    FKAID := edKAgent.KAID;
    FAccOutID := FOrdID;
    ParentHandle := Self.Handle;
    ParentHandle2 := Self.Handle;
    PTypeID := Self.edKAgent.Obj.PTypeID;
    NDSPayer := cdsEnts.FieldByName('ndspayer').AsInteger = 1;
    KAType := Self.edKAgent.Obj.KType;
    CurrID := Self.cbCurr.KeyValue;
    OnDate := StrToDate(edDate.Text);
    FRateDate := Self.FRateDate;
    FRateID := Self.FRateID;
    Kurs := CurKurs;
    aSetKurs.Caption := FloatToStr(Kurs);

    parentMDDet := mdDet;
    parentmdWMatTurn := mdWMatTurn;
    parentMDWMatTurnOld := mdWMatTurnOld;
    parentMDTmpIDs := mdTmpIds;

    CurrName := cdsCurr.fieldbyname('shortname').AsString;

    aShowPriceIn.Hint := rs('fmWaybill','ShowPriceIn');
    AOMode := False;

    if kaEnt.NDSPayer
      then FPosNDS := NDS
      else FPosNDS := 0;

    ID := 0; // see TfrmEditPositionAcc.setid()

    Self.FOrdID := FAccOutID;
    Screen.Cursor := crDefault;
  finally
    if not mdDet.IsEmpty then begin
      dbgWaybillDet.Enabled := True;
      dbgWaybillDet.SetFocus;
    end;
    Free;
    Screen.Cursor := crDefault;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
*)

(*
//==============================================================================================
procedure TMetaOrder.aSetRsvAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaOrder.aSetRsvAllExecute') else _udebug := nil;{$ENDIF}

  dbgWaybillDet.SelectAll;
  aSetRsv.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
*)

(*
//==============================================================================================
procedure TMetaOrder.AddMats(var IDs: string);
  var
    FRsv, FMinPrice, FMaxPrice, FAvgPrice, FLastInPrice, FRemain, FRsv2, FPrice: Extended;
    i, FPTypeID: Integer;
    FWithNDS: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaOrder.AddMats') else _udebug := nil;{$ENDIF}

  WHMode := True;
  with newDataSet do
  try
    cdsRsv_Temp.Close;
    cdsRsv_Temp.Open;
    mdDet.Close;
    mdDet.Open;

    ProviderName := 'pWaybillDet_GetPosEx';
    FetchParams;
    FetchMacros;
    Params.ParamByName('ondate').AsDateTime := MaxDateTime;
    Macros.ParamByName('ids').AsString := IDs;
    Open;
    while not Eof do begin
      FRsv := FieldByName('rsv').AsFloat;

      if cdsRsv_Temp.Locate('posid', FieldByName('posid').AsInteger, [])
        then FRsv := FRsv + cdsRsv_Temp.FieldByName('amount').AsFloat;

      Edit;
      FieldByName('posid').AsInteger := -FieldByName('posid').AsInteger;

      if FieldByName('remain').IsNull
        then FieldByName('amount').AsFloat := RoundToA(FieldByName('amount').AsFloat - FRsv, MatDisplayDigits)
        else FieldByName('amount').AsFloat := RoundToA(FieldByName('remain').AsFloat - FRsv, MatDisplayDigits);

      FieldByName('discount').AsFloat := 0;
      Post;
      Next;
    end;

    mdDet.LoadFromDataSet(Fields[0].DataSet);
    Close;

    ProviderName := 'pSQL';
    FetchMacros;
    Params.Clear;
    Macros.ParamByName('sql').AsString := 'select ptypeid from pricetypes where def=1';
    Open;
    FPTypeID := Fields[0].AsInteger;
    Close;

    mdDet.First;
    for i := 0 to mdDet.RecordCount - 1 do begin
      GetMatPrices(dmData.SConnection, mdDet.fieldbyname('matid').AsInteger,
        FMinPrice, FMaxPrice, FAvgPrice, FLastInPrice, FRemain, FRsv2);

      if POType = poAvg
        then FPrice := FAvgPrice
        else FPrice := FLastInPrice;

      FPrice := GetDefPriceOut(dmData.SConnection, mdDet.fieldbyname('matid').AsInteger,
                FPTypeID, FPrice, OnDate, CurKurs, FWithNDS);

      case WBOutPriceType of
        0: if not FWithNDS then FPrice := NDSIn(FPrice, mdDet.fieldbyname('nds').AsFloat);
        1: if FWithNDS then FPrice := NDSOut(FPrice, mdDet.fieldbyname('nds').AsFloat);
      end;

      FPrice := RoundToA(FPrice{ / CurKurs}, -6);

      mdRsv.Open;
      mdRsv.Append;
      mdRsv.FieldByName('posid').AsInteger := -mdDet.FieldByName('posid').AsInteger;
      mdRsv.FieldByName('pricein').AsFloat := XMLStrToFloat(mdDet.FieldByName('price').AsString);
      mdRsv.FieldByName('amount').AsFloat := XMLStrToFloat(mdDet.FieldByName('amount').AsString);
      mdRsv.Post;

      mdWMatTurn.Open;
      mdWMatTurn.Append;
      mdWMatTurn.FieldByName('posid').AsInteger := -mdDet.fieldbyname('posid').AsInteger;
      mdWMatTurn.FieldByName('matid').AsInteger := mdDet.fieldbyname('matid').AsInteger;
      mdWMatTurn.FieldByName('wid').AsInteger := mdDet.fieldbyname('wid').AsInteger;
      mdWMatTurn.FieldByName('sourceid').AsInteger := mdDet.fieldbyname('posid').AsInteger;
      mdWMatTurn.FieldByName('amount').AsFloat := RoundToA(XMLStrToFloat(mdDet.FieldByName('amount').AsString), MatDisplayDigits);
      mdWMatTurn.FieldByName('ondate').AsDateTime := 0;
      mdWMatTurn.Post;

      mdTmpIds.Open;
      mdTmpIds.Append;
      mdTmpIds.FieldByName('sourceid').AsInteger := mdDet.FieldByName('posid').AsInteger;
      mdTmpIds.FieldByName('posid').AsInteger := -mdDet.FieldByName('posid').AsInteger;
      mdTmpIds.FieldByName('amount').AsFloat := RoundToA(XMLStrToFloat(mdDet.FieldByName('amount').AsString), MatDisplayDigits);

      mdTmpIds.FieldByName('tmpid').AsInteger :=
          dmData.SConnection.AppServer.Rsv_Add(-mdDet.FieldByName('posid').AsInteger,
          mdDet.FieldByName('matid').AsInteger,
          mdDet.FieldByName('wid').AsInteger, 0,
          XMLStrToFloat(mdTmpIds.FieldByName('amount').AsString));

      mdTmpIds.FieldByName('free').AsInteger := 0;
      mdTmpIds.FieldByName('forall').AsInteger := 0;
      mdTmpIds.Post;

      mdDet.Edit;
      mdDet.FieldByName('price').AsFloat := FPrice;
      mdDet.FieldByName('fullprice').AsFloat := FPrice;
      mdDet.FieldByName('ptypeid').AsInteger := FPTypeID;
      mdDet.FieldByName('status').AsInteger := 1;
      mdDet.Post;
      UpdatePos;

      mdDet.Next;
    end;
    SelectFocusedNode;

    NoRsvConfirm := True;

  finally
    NoRsvConfirm := False;
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

*)

(*//==============================================================================================
procedure TMetaOrder.SaveAddProps(APosID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaOrder.SaveAddProps') else _udebug := nil;{$ENDIF}


  if (mdDet.FieldByName('producer').AsString <> '') or
     (mdDet.FieldByName('certnum').AsString <> '') or
     (mdDet.FieldByName('gtd').AsString <> '') or
     (mdDet.FieldByName('certdate').AsDateTime <> 0) or
     (mdDet.FieldByName('cardid').AsInteger > 0)
  then
    with newDataSet do
    try
      ProviderName := 'pWaybillDetAP_Ins';
      FetchParams;
      Params.ParamByName('posid').AsInteger := APosID;
      Params.ParamByName('producer').AsString := mdDet.FieldByName('producer').AsString;
      Params.ParamByName('certnum').AsString := mdDet.FieldByName('certnum').AsString;
      Params.ParamByName('gtd').AsString := mdDet.FieldByName('gtd').AsString;

      if mdDet.FieldByName('certdate').AsDateTime = 0 then begin
        Params.ParamByName('certdate').DataType := ftDateTime;
        Params.ParamByName('certdate').Clear;
      end
      else Params.ParamByName('certdate').AsDateTime := mdDet.FieldByName('certdate').AsDateTime;

      if mdDet.FieldByName('cardid').IsNull then begin
        Params.ParamByName('cardid').DataType := ftInteger;
        Params.ParamByName('cardid').Clear;
      end
      else Params.ParamByName('cardid').AsInteger := mdDet.FieldByName('cardid').AsInteger;

      Execute;
    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

*)

(*//==============================================================================================
procedure TMetaOrder.GetTaxes;
  var
    ACol: TdxDBTreeListColumn;
    FField: TFloatField;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaOrder.GetTaxes') else _udebug := nil;{$ENDIF}

  with newDataSet do
  try
    ProviderName := 'pTaxes_List';
    Open;
    while not Eof do begin
      FField := TFloatField.Create(mdDet);
      FField.Name := 'fldTax' + FieldByName('taxid').AsString;
      FField.FieldKind := fkData;
      FField.FieldName := 'Tax' + FieldByName('taxid').AsString;
      FField.DataSet := mdDet;

      ACol := dbgWaybillDet.CreateColumnEx(TdxDBGridColumn, dbgWaybillDet);
      ACol.Name := 'colTax' + FieldByName('taxid').AsString;
      ACol.FieldName := 'Tax' + FieldByName('taxid').AsString;
      ACol.Visible := False;
      ACol.Tag := 1;
      ACol.HeaderAlignment := taCenter;
      ACol.Caption := FieldByName('name').AsString + ', %';
      ACol.Width := 60;
      ACol.OnGetText := colTaxGetText;

      FField := TFloatField.Create(mdDet);
      FField.Name := 'fldTaxRate' + FieldByName('taxid').AsString;
      FField.FieldKind := fkData;
      FField.FieldName := 'TaxRate' + FieldByName('taxid').AsString;
      FField.DataSet := mdDet;

      ACol := dbgWaybillDet.CreateColumnEx(TdxDBGridColumn, dbgWaybillDet);
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

*)

(*//==============================================================================================
procedure TMetaOrder.SaveTaxes(APosID: Integer);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaOrder.SaveTaxes') else _udebug := nil;{$ENDIF}

  with newDataSet do
  try
    ProviderName := 'pWaybillDetTaxes_Ins';
    FetchParams;
    Params.ParamByName('posid').AsInteger := APosID;

    for i := 0 to mdDet.FieldCount - 1 do begin
      if (Pos('Tax', mdDet.Fields[i].FieldName) = 1) and
         (Pos('TaxRate', mdDet.Fields[i].FieldName) = 0) and
         (mdDet.Fields[i].AsFloat > 0)
      then begin
        Params.ParamByName('taxid').AsInteger := StrToInt(Copy(mdDet.Fields[i].FieldName, 4, Length(mdDet.Fields[i].FieldName) - 3));
        Params.ParamByName('onvalue').AsFloat := mdDet.Fields[i].AsFloat;
        Execute;
      end;
    end;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
*)

(*//==============================================================================================
procedure TMetaOrder.srcEntDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaOrder.srcEntDataChange') else _udebug := nil;{$ENDIF}


  if kaEnt.RemoteServer = nil then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  if kaEnt.KAID <> cdsEnts.FieldByName('kaid').AsInteger then begin
    DSRefresh(cdsEntAcc, 'accid', 0);
    Self.kaEnt.KAID := cdsEnts.FieldByName('kaid').AsInteger;

    if kaEnt.Accounts.IsEmpty then lcbAccount.Clear;

  end;    

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

*)

(*//==============================================================================================
procedure TMetaOrder.edKAgentChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaOrder.edKAgentChange') else _udebug := nil;{$ENDIF}


  DataModified(Self);

  if (PayDocId > 0) and (edKAgent.KAID <> oldkaid) and chbPay.Checked then
    if ssMessageDlg(rs('fmWaybill', 'KAChangeError') +
                    edPayNum.Text + '?', ssmtWarning, [ssmbYes, ssmbNo]) = mrYes
    then begin
      PayDocChecked := False;
      chbPay.Enabled := True;
      chbPay.Checked := False;
      OldPayDocId := PayDocId;
      PayDocId := 0;
      oldkaid := edKAgent.KAID;
      FModified := True;
    end
    else begin
      edKAgent.KAID := oldkaid;
      //edKAgent.Text := KANameEx(dmData.SConnection,edKAgent.Tag, FPTypeID, KType);
    end;

  if not edContr.Editor.Focused and not edContr.Locked then begin
    FCurrCtrl := edKAgent;

    if not edKAgent.Obj.Contracts.IsEmpty and edKAgent.Obj.Contracts.Locate('doctype', -8, [])
      then edContr.DocID := edKAgent.Obj.Contracts.FieldByName('docid').AsInteger
      else edContr.DocID := 0;

    //edContr.KAID := edKAgent.KAID;
    FCurrCtrl := nil;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

*)

(*//==============================================================================================
procedure TMetaOrder.cdsEntAccBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaOrder.cdsEntAccBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsEntAcc.Params.ParamByName('kaid').AsInteger := cdsEnts.FieldByName('kaid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

*)

(*//==============================================================================================
function TMetaOrder.DoSetRsv(APosID, AMatID, AWID: Integer; AAmount: Extended): Boolean;
 var
   ASourceId,FPosId,ATmpId, i: integer;
   FAmount,FRemain, tmpremain, tmpsumm, summamount, TmpAmount: Extended;
   SNs: string;
   BM: TBookmark;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaOrder.DoSetRsv') else _udebug := nil;{$ENDIF}

  SNs := '';

  //1. Освобождение редактируемых позиций (старых)
  mdWMatTurnOld.First;
  while not mdWMatTurnOld.Eof do begin
    if mdWMatTurnOld.FieldByName('sourceid').AsInteger=APosID then begin
      with newDataSet do
      try
        ProviderName := 'pWayBill_GetMatID_WID';
        FetchParams;
        Params.ParamByName('posId').AsInteger := mdWMatTurnOld.FieldByName('posid').AsInteger;
        Open;
        if not IsEmpty then begin
          mdTmpIds.Append;
          mdTmpIds.FieldByName('sourceid').AsInteger := mdWMatTurnOld.FieldByName('sourceid').AsInteger;
          mdTmpIds.FieldByName('amount').AsFloat := RoundToA(XMLStrToFloat(mdWMatTurnOld.fieldbyname('amount').AsString)*-1,MatDisplayDigits);
          mdTmpIds.FieldByName('posid').AsInteger := mdWMatTurnOld.FieldByName('posid').AsInteger;
          mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdWMatTurnOld.FieldByName('posid').AsInteger,Fields[0].AsInteger,Fields[1].AsInteger,0,XMLStrToFloat(mdWMatTurnOld.fieldbyname('amount').AsString)*-1);
          mdTmpIds.FieldByName('free').AsInteger := 1;
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

  //Освобождение редактируемых позиций (новых)
  mdTmpIds.First;
  while not mdTmpIds.Eof do begin
    if (mdTmpIds.FieldByName('sourceid').AsInteger = APosID) and (mdTmpIds.FieldByName('free').AsInteger <> 1)
    then begin
      with newDataSet do
      try
        ProviderName := 'pWayBill_GetMatID_WID';
        FetchParams;
        Params.ParamByName('posId').AsInteger := mdTmpIds.FieldByName('posid').AsInteger;
        Open;

        if not IsEmpty then begin
          BM := mdTmpIds.GetBookmark;  //Сохранение текщей позиции
          ASourceId := mdTmpIds.FieldByName('sourceid').AsInteger;
          FAmount := mdTmpIds.FieldByName('amount').AsFloat;
          FPosId := mdTmpIds.FieldByName('posid').AsInteger;
          ATmpId := mdTmpIds.FieldByName('tmpid').AsInteger;
          try
            mdTmpIds.Append;
            mdTmpIds.FieldByName('sourceid').AsInteger := ASourceId;
            mdTmpIds.FieldByName('amount').AsFloat := FAmount*-1;
            mdTmpIds.FieldByName('posid').AsInteger := FPosId;
            mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(FPosId,Fields[0].AsInteger,Fields[1].AsInteger,0,FAmount*-1);
            mdTmpIds.FieldByName('free').AsInteger := 1;
            mdTmpIds.FieldByName('forall').AsInteger := 0;
            mdTmpIds.Post;
          finally
            mdTmpIds.GotoBookmark(BM);
            mdTmpIds.FreeBookmark(BM);
          end;
        end;//if not IsEmpty
        Close;
      finally
        Free;
      end;
    end;//if
    mdTmpIds.Next;
  end;//while not mdTmpIds.Eof

  //2.
  //*******************************************************************
  //*******************************************************************
  //Получение остатков на складе
  //GetMatRestsOnWHouse(dmData.SConnection, AMatID, AWID, MaxDateTime, Integer(mdPosition));
  GetMatRestsByKAorWID(dmData.SConnection, AMatID, 0, AWID, MaxDateTime, Integer(mdPosition));

  mdPosition.First;
  FRemain := 0;

  while not mdPosition.Eof do begin
    mdPosition.Edit;
    mdPosition.fieldbyname('amount').AsFloat := RoundToA(mdPosition.fieldbyname('amount').AsFloat, MatDisplayDigits);
    mdPosition.Post;
    FRemain := FRemain + XMLStrToFloat(mdPosition.fieldbyname('amount').AsString);
    mdPosition.Next;
  end;//while not Eof

  //3.
  //*******************************************************************
  //*******************************************************************
  //    Резерв позиций
  try
    tmpremain := AAmount;
    mdRsv.Close;
    mdRsv.Open;

    with mdPosition do begin
      First;
      while not Eof and (tmpremain > 0) do begin
        if (tmpremain <= XMLStrToFloat(fieldbyname('amount').AsString))
           and (XMLStrToFloat(fieldbyname('amount').AsString) > 0)
        then begin
          mdRsv.Append;
          mdRsv.FieldByName('posid').AsInteger := FieldByName('posid').AsInteger;
          mdRsv.FieldByName('pricein').AsFloat := XMLStrToFloat(FieldByName('price').AsString);
          mdRsv.FieldByName('amount').AsFloat := tmpremain;
          summamount := summamount+tmpremain;
          tmpsumm := tmpsumm + (tmpremain * XMLStrToFloat(FieldByName('price').AsString));
          if not FieldByName('SN').IsNull then begin
            mdRsv.FieldByName('SN').AsString := FieldByName('SN').AsString;
            //ShowMessage(mdRsv.FieldByName('SN').AsString);
          end;
          mdRsv.Post;
        end //if
        else
          if XMLStrToFloat(fieldbyname('amount').AsString) > 0 then begin
            mdRsv.Append;
            mdRsv.FieldByName('posid').AsInteger := FieldByName('posid').AsInteger;
            mdRsv.FieldByName('pricein').AsFloat := XMLStrToFloat(FieldByName('price').AsString);
            mdRsv.FieldByName('amount').AsFloat := XMLStrToFloat(FieldByName('amount').AsString);
            summamount := summamount+XMLStrToFloat(FieldByName('amount').AsString);
            tmpsumm := tmpsumm+(XMLStrToFloat(FieldByName('amount').AsString)*XMLStrToFloat(FieldByName('price').AsString));
            if not FieldByName('SN').IsNull then begin
              mdRsv.FieldByName('SN').AsString := FieldByName('SN').AsString;
              //ShowMessage(mdRsv.FieldByName('SN').AsString);
            end;

            mdRsv.Post;
          end;
        tmpremain := tmpremain - fieldbyname('amount').AsFloat;
        Next;
      end;//while
    end;//with
  Except
    mdRsv.Close;
  end;


  //4.
  //*******************************************************************
  //*******************************************************************
  //Удаление освобождённых позиций
  with mdTmpIds do begin
    First;
    while not Eof do begin
      if (FieldByName('sourceid').AsInteger = APosID) and (FieldByName('free').AsInteger = 1)
      then begin
        dmData.SConnection.AppServer.Rsv_Delete(FieldByName('tmpid').AsInteger);
        Delete;
      end//if
      else Next;
    end;//while not eof
  end;//with

  //4.
  //*******************************************************************
  //*******************************************************************
  //Проверка наличия
  if FRemain >= AAmount then begin

    //Удаление всего резерва для текущего sourceid
    with mdTmpIds do begin
      First;
      while not Eof do begin
        if (FieldByName('sourceid').AsInteger = APosID) then begin
          dmData.SConnection.AppServer.Rsv_Delete(FieldByName('tmpid').AsInteger);
          Delete;
        end//if
        else Next;
      end;//while not eof
    end;//with TdxMemData(pointer(stRemain.Tag))

    //Удаление всех записей из mdWMatTurn для текущего sourceid
    with mdWMatTurn do begin
      First;
      while not Eof do begin
        if (fieldbyname('sourceid').AsInteger = APosID)
          then Delete
          else Next;
      end;//while
    end;//with TdxMemData(pointer(panMain.Tag))

    //************* Запись в mdWMatturn новых позиций
    mdRsv.First;
    while not mdRsv.Eof do begin
      //ShowMessage(mdRsv.FieldByName('SN').AsString);
      //Запись в mdWMatTurn
      mdWMatTurn.Append;
      mdWMatTurn.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
      mdWMatTurn.FieldByName('matid').AsInteger := AMatID;
      mdWMatTurn.FieldByName('wid').AsInteger := AWID;
      mdWMatTurn.FieldByName('sourceid').AsInteger := APosID;
      mdWMatTurn.FieldByName('amount').AsFloat := RoundToA(XMLStrToFloat(mdRsv.fieldbyname('amount').AsString), MatDisplayDigits);
      mdWMatTurn.FieldByName('ondate').AsDateTime := 0;

      if not mdRsv.fieldbyname('SN').IsNull then begin
        mdWMatTurn.FieldByName('SN').AsString := mdRsv.fieldbyname('SN').AsString;
        SNs := SNs + mdWMatTurn.FieldByName('SN').AsString+'; ';
      end;

      mdWMatTurn.Post;

      if mdWMatTurnOld.Locate('posid;sourceid', VarArrayOf([mdRsv.fieldbyname('posid').AsInteger, APosID]),[])
      then begin
        mdWMatTurnOld.Edit;
        mdWMatTurnOld.FieldByName('flag').AsInteger := 1;
        mdWMatTurnOld.Post;

        if RoundToA(XMLStrToFloat(mdRsv.fieldbyname('amount').AsString), MatDisplayDigits)
            > RoundToA(XMLStrToFloat(mdWMatTurnOld.fieldbyname('amount').AsString), MatDisplayDigits)
        then begin
          {Получить сумму для текущего posid в mdTmpIds}
          with mdTmpIds do begin
            First;
            TmpAmount := 0;
              while not Eof do begin
                if (FieldByName('posid').AsInteger=mdRsv.fieldbyname('posid').AsInteger)
                  then TmpAmount :=
                    RoundToA(TmpAmount +
                       RoundToA(XMLStrToFloat(FieldByName('amount').AsString), MatDisplayDigits), MatDisplayDigits);

                Next;
              end;//while not Eof
          end;//with TdxMemData(pointer(stRemain.Tag))

          if TmpAmount < 0 then begin
            if RoundToA(TmpAmount * -1, MatDisplayDigits)
               > RoundToA(XMLStrToFloat(mdRsv.fieldbyname('amount').AsString)
                 - XMLStrToFloat(mdWMatTurnOld.fieldbyname('amount').AsString), MatDisplayDigits)
            then begin
              mdTmpIds.Append;
              mdTmpIds.FieldByName('sourceid').AsInteger := APosID;
              mdTmpIds.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
              //Разница для себя
              mdTmpIds.FieldByName('amount').AsFloat := RoundToA(XMLStrToFloat(mdRsv.fieldbyname('amount').AsString)-XMLStrToFloat(mdWMatTurnOld.fieldbyname('amount').AsString), MatDisplayDigits);
              mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger, AMatID, AWID, 0,XMLStrToFloat(mdTmpIds.FieldByName('amount').AsString));
              mdTmpIds.FieldByName('free').AsInteger := 0;
              mdTmpIds.FieldByName('forall').AsInteger := 0;
              mdTmpIds.Post;
            end
            else begin
              mdTmpIds.Append;
              mdTmpIds.FieldByName('sourceid').AsInteger := APosID;
              mdTmpIds.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
              //Доступное кол-во для себя TmpAmount*-1
              mdTmpIds.FieldByName('amount').AsFloat := RoundToA(TmpAmount * -1, MatDisplayDigits);
              mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger, AMatID, AWID, 0,XMLStrToFloat(mdTmpIds.FieldByName('amount').AsString));
              mdTmpIds.FieldByName('free').AsInteger := 0;
              mdTmpIds.FieldByName('forall').AsInteger := 0;
              mdTmpIds.Post;

              if RoundToA(XMLStrToFloat(mdRsv.fieldbyname('amount').AsString)-XMLStrToFloat(mdWMatTurnOld.fieldbyname('amount').AsString)-(TmpAmount*-1), MatDisplayDigits)<>0 then begin
                mdTmpIds.Append;
                mdTmpIds.FieldByName('sourceid').AsInteger := APosID;
                mdTmpIds.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
                //Разницу для всех XMLStrToFloat(mdRsv.fieldbyname('amount').AsString)-TmpAmount*-1
                mdTmpIds.FieldByName('amount').AsFloat := RoundToA(XMLStrToFloat(mdRsv.fieldbyname('amount').AsString)-XMLStrToFloat(mdWMatTurnOld.fieldbyname('amount').AsString)-(TmpAmount*-1), MatDisplayDigits);
                mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger, AMatID, AWID, 1, XMLStrToFloat(mdTmpIds.FieldByName('amount').AsString));
                mdTmpIds.FieldByName('free').AsInteger := 0;
                mdTmpIds.Post;
              end;//if RoundToA...
            end;//else
          end//if TmpAmount<0
          else begin
            mdTmpIds.Append;
            mdTmpIds.FieldByName('sourceid').AsInteger := APosID;
            mdTmpIds.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
            //Разница для всех
            mdTmpIds.FieldByName('amount').AsFloat := RoundToA(XMLStrToFloat(mdRsv.fieldbyname('amount').AsString)-XMLStrToFloat(mdWMatTurnOld.fieldbyname('amount').AsString), MatDisplayDigits);
            mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger, AMatID, AWID, 1,XMLStrToFloat(mdTmpIds.FieldByName('amount').AsString));
            mdTmpIds.FieldByName('free').AsInteger := 0;
            mdTmpIds.FieldByName('forall').AsInteger := 1;
            mdTmpIds.Post;
          end;//else
        end//if
        else begin
          if RoundToA(XMLStrToFloat(mdRsv.fieldbyname('amount').AsString)
              - XMLStrToFloat(mdWMatTurnOld.fieldbyname('amount').AsString), MatDisplayDigits) <> 0
          then begin
            mdTmpIds.Append;
            mdTmpIds.FieldByName('sourceid').AsInteger := APosID;
            mdTmpIds.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
            //Разница для себя
            mdTmpIds.FieldByName('amount').AsFloat := RoundToA(XMLStrToFloat(mdRsv.fieldbyname('amount').AsString) - XMLStrToFloat(mdWMatTurnOld.fieldbyname('amount').AsString), MatDisplayDigits);
            mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger, AMatID, AWID, 0, XMLStrToFloat(mdTmpIds.FieldByName('amount').AsString));
            mdTmpIds.FieldByName('free').AsInteger := 0;
            mdTmpIds.FieldByName('forall').AsInteger := 0;
            mdTmpIds.Post;
          end;//if
        end;//else
      end//if mdWMatTurnOld.Locate
      else begin
        //Проверка
        //Получить сумму для текущего posid в mdTmpIds
        with mdTmpIds do begin
          First;
          TmpAmount := 0;
          while not Eof do begin

            if (FieldByName('posid').AsInteger = mdRsv.fieldbyname('posid').AsInteger)
            then TmpAmount := RoundToA(TmpAmount + FieldByName('amount').AsFloat, MatDisplayDigits);

            Next;
          end;//while
        end;//with TdxMemData(pointer(stRemain.Tag))

        if TmpAmount < 0 then begin
          if RoundToA(TmpAmount * -1, MatDisplayDigits) > RoundToA(XMLStrToFloat(mdRsv.fieldbyname('amount').AsString), MatDisplayDigits)
          then begin
            mdTmpIds.Append;
            mdTmpIds.FieldByName('sourceid').AsInteger := APosID;
            mdTmpIds.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
            //Всё кол-во для себя
            mdTmpIds.FieldByName('amount').AsFloat := RoundToA(XMLStrToFloat(mdRsv.fieldbyname('amount').AsString), MatDisplayDigits);
            mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger,AMatID, AWID,0,XMLStrToFloat(mdTmpIds.FieldByName('amount').AsString));
            mdTmpIds.FieldByName('free').AsInteger := 0;
            mdTmpIds.FieldByName('forall').AsInteger := 0;
            mdTmpIds.Post;
          end//if
          else begin
            mdTmpIds.Append;
            mdTmpIds.FieldByName('sourceid').AsInteger := APosID;
            mdTmpIds.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
            //Доступное кол-во для себя TmpAmount*-1
            mdTmpIds.FieldByName('amount').AsFloat := RoundToA(TmpAmount * -1, MatDisplayDigits);
            mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger, AMatID, AWID, 0,XMLStrToFloat(mdTmpIds.FieldByName('amount').AsString));
            mdTmpIds.FieldByName('free').AsInteger := 0;
            mdTmpIds.FieldByName('forall').AsInteger := 0;
            mdTmpIds.Post;

            if RoundToA(XMLStrToFloat(mdRsv.fieldbyname('amount').AsString) - (TmpAmount * -1), MatDisplayDigits) <> 0
            then begin
              mdTmpIds.Append;
              mdTmpIds.FieldByName('sourceid').AsInteger := APosID;
              mdTmpIds.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
              //Разницу для всех XMLStrToFloat(mdRsv.fieldbyname('amount').AsString)-TmpAmount*-1
              mdTmpIds.FieldByName('amount').AsFloat := RoundToA(XMLStrToFloat(mdRsv.fieldbyname('amount').AsString)-(TmpAmount*-1), MatDisplayDigits);
              mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger, AMatID, AWID, 1,XMLStrToFloat(mdTmpIds.FieldByName('amount').AsString));
              mdTmpIds.FieldByName('free').AsInteger := 0;
              mdTmpIds.FieldByName('forall').AsInteger := 1;
              mdTmpIds.Post;
            end;//if
          end;//else
        end//if TmpAmount<0 then begin
        else begin
          mdTmpIds.Append;
          mdTmpIds.FieldByName('sourceid').AsInteger := APosID;
          mdTmpIds.FieldByName('posid').AsInteger := mdRsv.fieldbyname('posid').AsInteger;
          //Всё кол-во для всех
          mdTmpIds.FieldByName('amount').AsFloat := RoundToA(XMLStrToFloat(mdRsv.fieldbyname('amount').AsString), MatDisplayDigits);
          mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger, AMatID, AWID, 1, XMLStrToFloat(mdTmpIds.FieldByName('amount').AsString));
          mdTmpIds.FieldByName('free').AsInteger := 0;
          mdTmpIds.FieldByName('forall').AsInteger := 1;
          mdTmpIds.Post;
        end;//else
      end;//else
      mdRsv.Next;
    end;//while not mdRsv.Eof

    //Освобождение оставшихся позиций, старых
    with mdWMatTurnOld do begin
      First;
      while not Eof do begin
        if (FieldByName('sourceid').AsInteger = APosID) and (FieldByName('flag').AsInteger <> 1) then begin
          Edit;
          FieldByName('flag').AsInteger := 1;
          Post;
          //Освобождение для себя
          mdTmpIds.Append;
          mdTmpIds.FieldByName('sourceid').AsInteger := FieldByName('sourceid').AsInteger;
          mdTmpIds.FieldByName('posid').AsInteger := fieldbyname('posid').AsInteger;
          mdTmpIds.FieldByName('amount').AsFloat := RoundToA(XMLStrToFloat(fieldbyname('amount').AsString), MatDisplayDigits)*-1;
          mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(fieldbyname('posid').AsInteger, AMatID, AWID, 0, RoundToA(XMLStrToFloat(fieldbyname('amount').AsString), MatDisplayDigits)*-1);
          mdTmpIds.FieldByName('free').AsInteger := 0;
          mdTmpIds.FieldByName('forall').AsInteger := 0;
          mdTmpIds.Post;
        end;//if
        Next;
      end;//while not Eof

      First;

      while not Eof do begin
        Edit;
        FieldByName('flag').AsInteger := 0;
        Post;
        Next;
      end; // while not eof
    end; //with TdxMemData(pointer(stMeasureName.Tag))
  end //if FRemain>=dbgWaybillDet.SelectedNodes[i].Values[colAmount.Index] then begin
  else begin
    Result := False;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  //Запись в SN для WMat
  SNs := System.Copy(SNs, 1, Length(SNs) - 2);
  with mdDet do begin
    BM := GetBookmark;
    try
      if Locate('posid', APosID, []) then begin
        Edit;
        FieldByName('status').AsInteger := 1;

        if SNs <> '' then FieldByName('sn').AsString := SNs;

        Post;
      end;
    finally
      GotoBookmark(BM);
      FreeBookmark(BM);
    end;
  end;

  Result := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

*)

(*//==============================================================================================
function TMetaOrder.DoRemoveRsv(APosID: Integer): Boolean;
 var
   BM: TBookmark;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaOrder.DoRemoveRsv') else _udebug := nil;{$ENDIF}


  while mdWMatTurn.Locate('sourceid', APosID, [] ) do mdWMatTurn.Delete;

  //Удаление из mdTmpIds и освобождение резерва для текущего sourceid
  with mdTmpIds do begin
    First;
    while not Eof do begin
      if FieldByName('sourceid').AsInteger = APosID then begin
        dmData.SConnection.AppServer.Rsv_Delete(FieldByName('tmpid').AsInteger);
        Delete;
      end
      else Next;
     end;
  end;

  //Освобождение редактируемых позиций (старых)
  mdWMatTurnOld.First;
  while not mdWMatTurnOld.Eof do begin
    if mdWMatTurnOld.FieldByName('sourceid').AsInteger = APosID then begin
      with newDataSet do
      try
        RemoteServer := dmData.SConnection;
        ProviderName := 'pWayBill_GetMatID_WID';
        FetchParams;
        Params.ParamByName('posId').AsInteger := mdWMatTurnOld.FieldByName('posid').AsInteger;
        Open;
        if not IsEmpty then begin
          mdTmpIds.Append;
          mdTmpIds.FieldByName('sourceid').AsInteger := mdWMatTurnOld.FieldByName('sourceid').AsInteger;
          mdTmpIds.FieldByName('amount').AsFloat := RoundToA(XMLStrToFloat(mdWMatTurnOld.FieldByName('amount').AsString) * -1, MatDisplayDigits);
          mdTmpIds.FieldByName('posid').AsInteger := mdWMatTurnOld.FieldByName('posid').AsInteger;
          mdTmpIds.FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdWMatTurnOld.FieldByName('posid').AsInteger, Fields[0].AsInteger, Fields[1].AsInteger, 0, RoundToA(XMLStrToFloat(mdWMatTurnOld.FieldByName('amount').AsString) * -1, MatDisplayDigits));
          mdTmpIds.FieldByName('free').AsInteger := 0;
          mdTmpIds.FieldByName('forall').AsInteger := 0;
          mdTmpIds.Post;
        end;
        Close;
      finally
        Free;
      end;
    end;
    mdWMatTurnOld.Next;
  end;

  //Затирание в mdDet SN
  with mdDet do begin
    BM := GetBookmark;
    try
      if Locate('posid', APosID, []) then begin
        Edit;
        FieldByName('SN').Clear;
        FieldByName('status').AsInteger := 0;
        Post;
      end;
    finally
      GotoBookmark(BM);
      FreeBookmark(BM);
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

*)

(*//==============================================================================================
procedure TMetaOrder.FillMatsFromWMat(DS: TDataSet);
  var
    FPosID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaOrder.FillMatsFromWMat') else _udebug := nil;{$ENDIF}


  fProgress.Caption := rs('Common', 'Reserving');
  fProgress.pbMain.Max := DS.RecordCount;
  fProgress.Show;
  FShowRsvMsgs := False;
  try
    with mdDet do begin
      if not mdDet.Active then mdDet.Open;

      DS.DisableControls;
      mdDet.DisableControls;
      mdDet.AfterPost := nil;
      DS.First;

      while not DS.Eof do begin
        fProgress.lText.Caption := DS.FieldByName('name').AsString;
        fProgress.Update;
        FPosID := dsNextPosID(mdDet);
        Append;
        FieldByName('posid').AsInteger := FPosID;
        FieldByName('matid').AsInteger := DS.FieldByName('matid').AsInteger;
        FieldByName('postype').AsInteger := DS.Tag;

        if DS.Tag = 0 then FieldByName('status').AsInteger := 0;

        FieldByName('matname').AsString := DS.FieldByName('name').AsString;
        FieldByName('msrname').AsString := DS.FieldByName('msrname').AsString;
        FieldByName('artikul').AsString := DS.FieldByName('artikul').AsString;
        FieldByName('amount').AsFloat := DS.FieldByName('amount').AsFloat;
        FieldByName('price').AsFloat := DS.FieldByName('price').AsFloat;

        if DS.Tag = 0 then begin
          FieldByName('fullprice').AsFloat := DS.FieldByName('fullprice').AsFloat;
          FieldByName('discount').AsFloat := DS.FieldByName('discount').AsFloat;
          FieldByName('wid').AsInteger := DS.FieldByName('wid').AsInteger;
          FieldByName('whname').AsString := DS.FieldByName('whname').AsString;
          FieldByName('currid').AsInteger := cbCurr.KeyValue;
          FieldByName('currname').AsString := cbCurr.Text;
        end
        else begin
          FieldByName('discount').AsFloat := 0;
          FieldByName('norm').AsFloat := 0;
        end;

        if CurrEnt.NDSPayer
          then FieldByName('nds').AsFloat := NDS
          else FieldByName('nds').AsFloat := 0;

        FieldByName('onvalue').AsFloat := edRate.Value;
        FieldByName('producer').AsString := DS.FieldByName('producer').AsString;
        FieldByName('barcode').AsString := DS.FieldByName('barcode').AsString;

        if (DS.FindField('ptypeid') <> nil) and (DS.FieldByName('ptypeid').AsInteger > 0)
        then FieldByName('ptypeid').AsInteger := DS.FieldByName('ptypeid').AsInteger;

        Post;
        UpdatePos;

        if DS.Tag = 0
          then DoSetRsv(FieldByName('posid').AsInteger, FieldByName('matid').AsInteger,
                        FieldByName('wid').AsInteger, FieldByName('amount').AsFloat);

        DS.Next;
        fProgress.pbMain.StepIt;
        fProgress.Update;
      end;
    end;

    DS.EnableControls;
    FPosModified := True;
    mdDet.EnableControls;
    mdDet.AfterPost := mdDetAfterPost;
    dbgWaybillDet.Adjust(nil, [colPosType, colRecNo, colStatus]);
    FGridRefresh := True;

    SelectFocusedNode;
  finally
    FShowRsvMsgs := True;
    fProgress.Hide;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

*)

(*//==============================================================================================
procedure TMetaOrder.aSetDiscountExecute(Sender: TObject);
 var
   BM: TBookmark;
   i: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaOrder.aSetDiscountExecute') else _udebug := nil;{$ENDIF}


  with TfrmSetDiscount.Create(nil) do
  try
    if ShowModal in [mrOk] then begin
      mdDet.DisableControls;
      BM := mdDet.GetBookmark;
      try
        for i := 0 to dbgWaybillDet.SelectedCount - 1 do begin
          if mdDet.Locate('posid', dbgWaybillDet.SelectedNodes[i].Values[colPosId.Index], [])
          then begin
            mdDet.Edit;
            mdDet.FieldByName('price').AsFloat := mdDet.FieldByName('fullprice').AsFloat * (100 - edDisc.Value) / 100;
            mdDet.FieldByName('discount').AsFloat := edDisc.Value;
            mdDet.Post;
            UpdatePos;
          end;
        end;
      finally
        mdDet.GotoBookmark(BM);
        mdDet.FreeBookmark(BM);
        mdDet.EnableControls;
      end;
      //UpdateActionList;
    end;
  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

*)

(*//==============================================================================================
procedure TMetaOrder.UpdatePos;
 var
   FAmount, FNorm, FSummCurr, FPriceCurr, FNDS, FCurrRate: Extended;
   FPriceWithNDS, FPriceWONDS, FSummWONDS, FSummNDS, FSummWithNDS: Extended;
   FSummTax, FPosSummTax: Extended;
   j: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaOrder.UpdatePos') else _udebug := nil;{$ENDIF}


  with mdDet do begin
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
         (Pos('fldTaxRate', Fields[j].Name) = 0)
      then begin
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

*)


//==============================================================================================
constructor TMetaOrder.Create(const AParent: TMetaClass);
begin
  FItems := TWBMetaItemList.Create(Self);
  FBusPar := TMetaBusinessPartner.Create(Self);
  FPrice := TMetaPrice.Create(Self);
  FTaxes := TMetaTaxList.Create(Self);

  inherited;
end;

//==============================================================================================
procedure TMetaOrder.Clear;
begin
  inherited;

  FType := wbtOrderOut;

  FItems.Clear;
  FBusPar.Clear;
  FPrice.Clear;
  FTaxes.Clear;

  FNum := '';
  FReason := '';
  FEmployee := -1; //TMetaPerson.Create;
  FPosted := False;
  FDeleted := False;

  FTotal := 0.0;
  FReceived := '';
  FValidTill := incMonth(now);
  FNotes := '';
  FCompany := -1; // TMetaBusinessPartner.Create;

  FReservePositions := False; // no warehouse reserves by default. useful for web-side orders where customer may freely change or drop orders
end;

//==============================================================================================
destructor TMetaOrder.Destroy;
begin
  FItems.Destroy;
  FBusPar.Destroy;
  FPrice.Destroy;
  FTaxes.Destroy;
  //FEmployee.Destroy;
  //FCompany.Destroy;

  inherited;
end;

//==============================================================================================
function TMetaOrder.getErrorText(const Index: Integer): String;
begin
  if (Index < 0) or (Index > High(orderErrorTexts))
    then Result := ''
    else Result := orderErrorTexts[Ferror];
end;

//==============================================================================================
function TMetaOrder.SaveData: Boolean;
 var
   i, ii: Integer;
   FPosID: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaOrder.SaveData') else _udebug := nil;{$ENDIF}

  clearError;
  Result := False;

  if not Fmodified and not FItems.isItemsModified then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Ferror := errNotModified;
    Exit;
  end;

  with newDataSet do begin
    try
      TrStart; 

      try
        Screen.Cursor := crSQLWait;

        if isNew then FID := GetMaxID(dmData.SConnection, 'waybilllist', 'wbillid');

        if isNew
          then ProviderName := 'pWaybill_InsEx'
          else ProviderName := 'pWaybill_UpdEx';

        {
        insert into WaybillList
        (WBILLID, NUM, ONDATE, KAID, CURRID, ATTNUM, ATTDATE, REASON, PERSONID, CHECKED,
        DELETED, SUMMALL, WTYPE, NDS, RECEIVED, TODATE, DEFNUM, NOTES, ENTID, SUMMINCURR, ONVALUE)
        values
        (:WBILLID, :NUM, :ONDATE, :KAID, :CURRID, :ATTNUM, :ATTDATE, :REASON, :PERSONID, :CHECKED,
        :DELETED, :SUMMALL, :WTYPE, :NDS, :RECEIVED, :TODATE, :DEFNUM, :NOTES, :ENTID, :SUMMINCURR, :ONVALUE)
        }

        FetchParams;
        Params.ParamByName('WBILLID').AsInteger := FID;
        Params.ParamByName('NUM').AsString := FNum;
        Params.ParamByName('DEFNUM').AsInteger := -1;//kaEnt.AccID;
        Params.ParamByName('ONDATE').AsDateTime := FDate;
        Params.ParamByName('KAID').AsInteger := FBusPar.ID;
        Params.ParamByName('CURRID').AsInteger := FPrice.CurrencyID;
        Params.ParamByName('ONVALUE').AsFloat := FPrice.Rate;
        Params.ParamByName('ATTNUM').AsString := ''; //AttNum;  ???
        Params.ParamByName('ATTDATE').AsDate := now; //AttDate; ???
        Params.ParamByName('REASON').AsString := FReason;
        Params.ParamByName('notes').AsString := FNotes;

        Params.ParamByName('personid').DataType := ftInteger;
        Params.ParamByName('personid').Clear;

        Params.ParamByName('CHECKED').AsInteger := integer(false);
        Params.ParamByName('WTYPE').AsInteger := wbtOrderOut;
        Params.ParamByName('DELETED').AsInteger := 0;
        Params.ParamByName('SUMMALL').AsFloat := RoundToA(GetTotal, -2); // ALLSUMM
        Params.ParamByName('SUMMINCURR').AsFloat := GetTotal; //AllSummCurr;
        Params.ParamByName('NDS').DataType := ftFloat;
        Params.ParamByName('NDS').Clear;
        Params.ParamByName('RECEIVED').AsString := '';

        Params.ParamByName('TODATE').asDateTime := FValidTill;

        Params.ParamByName('entid').DataType := ftInteger;
        Params.ParamByName('entid').Clear;

        Execute; //Записали в waybilllist

        //---------------------------------------------------------------------------------
        // 1 )Удаляем из оборотов
        ProviderName := 'pWMatTurn_Del'; // execute procedure sp_wmat_del_by_wb(:wbillid)
        FetchParams;
        Params.ParamByName('WBILLID').AsInteger := ID;
        Execute;  //Удалили из wmatturn

        ProviderName := 'pAccOutDet_DelEx'; {delete from accoutdet where posid in (select posid from waybilldet where wbillid=:wbillid)}
        FetchParams;
        Params.ParamByName('WBILLID').AsInteger := ID;
        Execute;  //Удалили из accoutdet

        if FItems.isItemsModified then begin // Запись позиций в накладную

          // 2 Удаляем позиции
          //delete from WAYBILLDET where WBILLID=:WBILLID
          ProviderName := 'pWaybillDet_Del';
          FetchParams;
          Params.ParamByName('wbillid').AsInteger := ID;
          Execute;

          //delete from waybillsvc where wbillid=:wbillid
          ProviderName := 'pWaybillSvc_Del';
          FetchParams;
          Params.ParamByName('wbillid').AsInteger := FID;
          Execute;

          // 3 Запись позиций из mdDet в waybilldet
          for i := 0 to FItems.Count - 1 do begin

            if FItems[i].PosType = WBMetaItemTangible then begin // product
              {
              insert into WAYBILLDET (POSID, WBILLID, MATID, WID, AMOUNT, PRICE, DISCOUNT, NDS,
                CurrId, OnDate, PTypeID, NUM, onvalue, total)
              values (:POSID, :WBILLID, :MATID, :WID, :AMOUNT, :PRICE, :DISCOUNT, :NDS,
                :CurrId, :OnDate, :PTypeID, :NUM, :onvalue, :total)
              }
              ProviderName := 'pWaybillDet_Ins';
              FetchParams;
              FPosID := GetMaxID(dmData.SConnection, 'waybilldet', 'posid');
              Params.ParamByName('POSID').AsInteger := FPosID;
              
              //3.1 Ставим новые Sourceid для оборотов
              {
              for ii := 0 to FWMatTurn.Count - 1 do
                if FWMatTurn[ii].Fsourceid = FItems[i].ID
                  then begin
                    FWMatTurn[ii].Fsourceid := FPosID;
                    break;
                  end;
              }
              //**************************

              if FPosID < 0 then raise Exception.Create(rs('fmWaybill','ErrorAddPos'));

              Params.ParamByName('WBILLID').AsInteger := FID;
              Params.ParamByName('MATID').AsInteger := FItems[i].ID;
              Params.ParamByName('WID').AsInteger := FItems[i].WarehouseID;
              Params.ParamByName('AMOUNT').AsFloat := RoundToA(FItems[i].Amount, MatDisplayDigits);
              Params.ParamByName('PRICE').AsFloat := FItems[i].Price.Value;
              Params.ParamByName('DISCOUNT').AsFloat := ifThen(FItems[i].Price.hasDiscounts, FItems[i].Price.Discounts[0].Value, 0.0);
              Params.ParamByName('NDS').AsFloat := ifThen(FItems[i].Price.hasTaxes, FItems[i].Price.Taxes[0].Value, 0.0);
              Params.ParamByName('CurrId').AsInteger := FItems[i].Price.CurrencyID;
              Params.ParamByName('onvalue').AsFloat := FItems[i].Amount;
              Params.ParamByName('OnDate').AsDateTime := FDate;

              if FItems[i].Price.TypeID = -1 then begin
                Params.ParamByName('PTypeID').DataType := ftInteger;
                Params.ParamByName('PTypeID').Clear;
              end
              else Params.ParamByName('PTypeID').AsInteger := FItems[i].Price.TypeID;

              Params.ParamByName('NUM').AsInteger := i;
              Execute; //Записываем очередную позицию

              {
              SaveAddProps(FPosID);
              SaveTaxes(FPosID);
              }

            end //if mdDet.FieldByName('postype').AsInteger = 0 (product)

            else begin // service
              {insert into waybillsvc
                (posid, wbillid, currid, svcid, num, price, norm, amount, nds, discount, personid)
                values
                (:posid, :wbillid, :currid, :svcid, :num, :price, :norm, :amount, :nds, :discount, :personid)
              }

              ProviderName := 'pWaybillSvc_Ins';
              FetchParams;
              Params.ParamByName('posid').AsInteger := GetMaxID(dmData.SConnection, 'waybillsvc', 'posid');
              Params.ParamByName('wbillid').AsInteger := FID;
              Params.ParamByName('svcid').AsInteger := FItems[i].id;
              Params.ParamByName('amount').AsFloat := RoundToA(FItems[i].amount, MatDisplayDigits);
              Params.ParamByName('price').AsFloat := FItems[i].Price.Value;
              Params.ParamByName('norm').AsFloat := FItems[i].normedRate;
              Params.ParamByName('discount').AsFloat := ifThen(FItems[i].Price.hasDiscounts, FItems[i].Price.Discounts[0].Value, 0.0);
              Params.ParamByName('nds').AsFloat := ifThen(FItems[i].Price.hasTaxes, FItems[i].Price.Taxes[0].Value, 0.0);
              Params.ParamByName('currid').AsInteger := FItems[i].Price.CurrencyID;
              Params.ParamByName('num').AsInteger := i;

              if not FItems[i].PersonID = -1
                then Params.ParamByName('personid').AsInteger := FItems[i].PersonID
                else begin
                  Params.ParamByName('personid').DataType := ftInteger;
                  Params.ParamByName('personid').Clear;
                end;

              Execute;
            end;
          end; //for i := 0 to FItems.Count - 1

          // insert into accoutsvc select posid, 0 from waybillsvc where wbillid=:wbillid
          ProviderName := 'pAccOutSvc_InsEx';
          FetchParams;
          Params.ParamByName('wbillid').AsInteger := FID;
          Execute;

          //FPosModified := False; // Сбрасываем флаг изменения позиций
        end; //if FPosModified


        //2)Запись в обороты
        {
        insert into WMatTurn(PosID, SOURCEID, TurnType, OnDate, Amount, matid, wid)
          values (:PosID, :SOURCEID, :TurnType, :OnDate, :Amount, :matid, :wid)
        }
        {
        ProviderName := 'pWMatTurnOut_Ins';
        for i := 0 to FWMatTurn.Count - 1 do begin
          FetchParams;
          Params.ParamByName('PosID').AsInteger := FWMatTurn[i].Fposid;
          Params.ParamByName('SOURCEID').AsInteger := FWMatTurn[i].FSOURCEID;
          Params.ParamByName('MATID').AsInteger := FWMatTurn[i].FMATID;
          Params.ParamByName('WID').AsInteger := FWMatTurn[i].FWID;
          Params.ParamByName('TurnType').AsInteger := 2;
          Params.ParamByName('OnDate').AsDateTime := FDate;
          Params.ParamByName('Amount').AsFloat := RoundToA(FWMatTurn[i].Famount, MatDisplayDigits);
          Execute;
          mdWMatTurn.Next;
        end;
        }

        // insert into accoutdet select posid, 0, 0 from waybilldet where wbillid=:wbillid
        ProviderName := 'pAccOutDet_InsEx';
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := FID;
        Execute;

        FModified := False;

        Result := TrCommit(False); // do not pop-up error msgbox

        dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);

      finally
        Free;
        Screen.Cursor := crDefault;
      end;

    except
      on e:exception do begin
        TrRollback;
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        raise;
      end;
    end;
  end; // with newDataSet

  FNew := Result;
  isModified := not FNew;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end; // SaveData

//==============================================================================================
function TMetaOrder.GetTotal: Double; // computes total amount for all positions
  var
    i: Integer;
begin
  Result := 0.0;

  for i := 0 to FItems.Count - 1 do begin
    Result := Result + FItems[i].Price.Value * FItems[i].Amount;
  end;
end;

//==============================================================================================
function TMetaOrder.LoadXML(var AXMLif: IXMLDocument; var Order: IXMLNode): Boolean;
  var
    topNode, listNode, Node: IXMLNode;
    pos: TWBMetaItem;
    name, data, FLastGen, docPrefix, docSuffix: String;
    i, defWarehouse, FnewNum: Integer;
    datefmt: TFormatSettings;
begin
  Result := False;
  Ferror := 0;

  //GetLocaleFormatSettings(..., datefmt);
  datefmt.DateSeparator := '-';
  datefmt.TimeSeparator := ':';
  datefmt.ShortDateFormat := 'yyyy-mm-dd';

  with newDataSet do begin
    ProviderName := 'pWHouse_GetDef';
    Open;
    defWarehouse := Fields[0].asInteger;
    Close;
    Free;
  end;

  if Order.ChildNodes.Count = 0 then begin
    Ferror := errXMLemptyOrder;
    Exit;
  end;

  topNode := Order.ChildNodes[0];

  repeat
    name := AnsiLowerCase(topNode.NodeName);
    data := Trim(topNode.Text);

    if name = 'id' then begin
      try
        // getting new local ID for this order
        docPrefix := OrdersOutPrefix;
        docSuffix := OrdersOutSuffix;
        FLastGen := '';

        FnewNum := GetDocNumEx(dmData.SConnection, dtOrderOut, 1, docPrefix, docSuffix, FLastGen, currEnt.kaid);

        Num := docPrefix + IntToStr(FnewNum) + docSuffix;

      except
        Ferror := errXMLbadID;
        Exit;
      end;
    end

    //..................................................
    else if name = 'date' then begin
      try
        FDate := strToDateTime(data, datefmt);

      except
        Ferror := errXMLbadDate;
        Exit;
      end;
    end

    //..................................................
    else if name = 'notes' then begin
      FNotes := data;
    end

    //..................................................
    else if name = 'totaltaxes' then begin
      try
        FTaxes.Add(TaxMethodValue, XMLStrToFloat(data));

      except
        Ferror := errXMLbadTaxes;
        Exit;
      end;
    end

    //..................................................
    else if name = 'total' then begin
      try
        FTotal := XMLStrToFloat(data);

      except
        Ferror := errXMLbadTotal;
        Exit;
      end;
    end
    //..................................................
    else if name = 'customer' then begin
      if topNode.ChildNodes.Count = 0 then begin
        Ferror := errXMLbadCustomer;
        Exit;
      end;

      Node := topNode.ChildNodes[0];

      repeat // for each position
        name := AnsiLowerCase(Node.NodeName);
        data := Trim(Node.Text);

        if name = 'email' then begin
          try
            FbusPar.bpType := bpTypePerson;
            FbusPar.Kind := bpKindClient;
            FBusPar.EMail := data;

            with newDataSet do begin // trying to find our ID
              ProviderName := 'pSQL';
              FetchMacros;
              Macros.ParamByName('sql').asString := 'select kaid from KAgent where EMail=''' + String(node.text) + '''';
              Open;
              if not isEmpty then begin
                FBusPar.loadData(Fields[0].asInteger);
              end;
              Close;
              Free;
            end;

          except
            Ferror := errXMLbadCustomerEmail;
            Exit;
          end;
        end
        //. . . . . . . . . . . . . . . . . . . . . . . . .
        else if name = 'fname' then begin
          FbusPar.Name := data;
        end
        //. . . . . . . . . . . . . . . . . . . . . . . . .
        else if name = 'sname' then begin
          FbusPar.SurName := data;
        end
        //. . . . . . . . . . . . . . . . . . . . . . . . .
        else if name = 'company' then begin
          FbusPar.Notes := FbusPar.Notes + 'Company: ' + data + crlf;
        end
        //. . . . . . . . . . . . . . . . . . . . . . . . .
        else if name = 'addresses' then begin
          if Node.ChildNodes.Count = 0 then begin
            Ferror := errXMLnoAddresses;
            Exit;
          end;

           if not FBusPar.Address.loadXML(Node) then Exit;
        end;

        try
          Node := Node.NextSibling;

        except
          Break;
        end;
      until Node = nil;
    end

    //..................................................
    else if name = 'items' then begin

      if topNode.ChildNodes.Count = 0 then begin
        Ferror := errXMLnoPositions;
        Exit;
      end;

      listNode := topNode.ChildNodes[0]; // <Items>

      repeat // for each <Item>
        if listNode.ChildNodes.Count = 0 then begin // checking if next <Item> is not empty
          Ferror := errXMLnoPositionInfo;
          Exit;
        end;

        Node := listNode.ChildNodes[0]; // get 1st Item's tag

        pos := TWBMetaItem.Create(Self);
        pos.WarehouseID := defWarehouse;

        repeat // for each pos tags
          name := AnsiLowerCase(Node.NodeName);
          data := Trim(Node.Text);

          if name = 'currencyid' then begin
            try
              Fprice.CurrencyID := StrToInt(data);
              if Fprice.CurrencyID = -1 then raise Exception.Create('');

            except
              Ferror := errXMLbadProductCurrency;
              pos.Destroy;
              Exit;
            end
          end
          //. . . . . . . . . . . . . . . . . . . . . . . . .
          {else if name = 'currency' then begin
            try
              pos.Price.CurrencyName := Node.Text;
              Fprice.CurrencyID := pos.Price.CurrencyID; // setting to something usable
              if Fprice.CurrencyID = -1 then raise Exception.Create('');
            except
              Ferror := errXMLbadProductCurrency;
              pos.Destroy;
              Exit;
            end
          end
          }
          //. . . . . . . . . . . . . . . . . . . . . . . . .
          else if name = 'discount' then begin
            try
              pos.Price.Discounts.Add(TMetaDiscount.Create(Self, DiscMethodValue, XMLStrToFloat(Node.Text)));

            except
              Ferror := errXMLbadProductDiscount;
              pos.Destroy;
              Exit;
            end
          end
          //. . . . . . . . . . . . . . . . . . . . . . . . .
          else if name = 'productid' then begin
            try
              pos.id := StrToInt('0' + data);
            except
              Ferror := errXMLbadProductID;
              pos.Destroy;
              Exit;
            end
          end
          //. . . . . . . . . . . . . . . . . . . . . . . . .
          else if name = 'price' then begin
            try
              pos.Price.BasePrice := XMLStrToFloat(Node.Text);
            except
              Ferror := errXMLbadProductPrice;
              pos.Destroy;
              Exit;
            end
          end
          //. . . . . . . . . . . . . . . . . . . . . . . . .
          else if name = 'quantity' then begin
            try
              pos.Amount := XMLStrToFloat(Node.Text);
            except
              Ferror := errXMLbadProductQuantity;
              pos.Destroy;
              Exit;
            end
          end
          //. . . . . . . . . . . . . . . . . . . . . . . . .
          else if name = 'totaltaxes' then begin
            try
              pos.Price.Taxes.Add(TaxMethodValue, XMLStrToFloat(Node.Text));

            except
              Ferror := errXMLbadProductTax;
              pos.Destroy;
              Exit;
            end
          end;

          try
            Node := Node.NextSibling;
            
          except
            Break;
          end;
        until Node = nil;

        FItems.Add(pos);

        try
          listNode := listNode.NextSibling; // just testing
        except
          Break;
        end;
      until listNode = nil; // (for <Item>)
    end; // items

    try
      topNode := topNode.NextSibling;
    except
      topNode := nil;
    end;
  until topNode = nil;

  Result := True;
end;

//==============================================================================================
procedure TMetaOrder.loadXMLcallback(topNode, cbNode: IXMLNode);
begin
  if AnsiLowerCase(topNode.NodeName) = 'address' then begin
    if AnsiLowerCase(cbNode.NodeName) = 'phone' then begin
      //FPhone := trim(propNode.Text);
    end
    //..................................................
    else if AnsiLowerCase(cbNode.NodeName) = 'fax' then begin
      //FFax := trim(propNode.Text);
    end
    //..................................................
  end;
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('MetaOrder', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
