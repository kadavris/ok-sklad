{$I ok_sklad.inc}
unit WaybillClass;

interface

uses
  ssClientDataSet,
  MetaClass, MetaBusinessPartner, MetaDoc, WBMetaItem, MetaTax,
  XMLDoc, XMLIntf;

type
  TWayBillItem = class(TWBMetaItem)
    protected
      // addons taken from SP_WBD_GET_IN()
      // FName=matname varchar(255),
      FMsrName: String;     // msrname varchar(10),     read-only
      FWHName: String;      // whname varchar(128),     read-only
      FModel: String;       // artikul varchar(255),    read-only
      FProducer: String;    // producer varchar(128),   read-only
      FGTD: String;         // gtd varchar(64),         read-only
      FCertNum: String;     // certnum varchar(64),     read-only
      FCertDate: TDateTime; // certdate timestamp,      read-only
      FBarcode: String;     // barcode varchar(64),     read-only
      FGrpID: Integer;      // grpid integer,           read-only
      Fcountry: String;     // country varchar(128),    read-only
      Farchived: Boolean;   // archived integer,        read-only

      function LoadXMLNode(var topNode, Node: IXMLNode; paramIndex: Integer = -1): Boolean;

    public
      function Load(Ads: TssClientDataSet; const doException: Boolean = False): Boolean; override;
      function Save(const doException: Boolean = False): Boolean; override;
      //function SaveXML(out AOutStr: String): Integer;
  end; // TWayBillItem

  //---------------------------------------------------------------------
  TWayBillItemList = class(TWBMetaItemList)
    protected
      function getItem(const idx: Integer): TWayBillItem;

    public
      //constructor Create(const AParent: TMetaClass); override;
      //destructor Free; override;
      //procedure Clear;
      function Load(ADocID: Integer; const doException: Boolean = False): boolean; override;
      function Save(const doException: Boolean = False): Boolean; override;
      //function SaveXML(out AOutStr: String): Integer;

      property Items[const idx: Integer]: TWayBillItem read getItem; default;
  end; // TWayBillItemList

  //---------------------------------------------------------------------
  TWaybillClass = class(TMetaDoc)
    protected
      FItems: TWayBillItemList;

      // taken from WayBillList table

      // these are in TMetaClass
      //FID=WBILLID   INTEGER NOT NULL,
      //FNumber=NUM   VARCHAR(20) NOT NULL,
      //FDate=ONDATE  TIMESTAMP NOT NULL,

      // these are in TMetaDoc
      //FPosted=CHECKED   INTEGER NOT NULL,
      //Fdeleted=DELETED  INTEGER NOT NULL,
      //FDocType=WTYPE    INTEGER NOT NULL,
      //FNotes=NOTES      VARCHAR(255),
      //FReason=REASON    VARCHAR(255),
      //FPersonID=PERSONID    INTEGER,

      FBusinessPartner: TMetaBusinessPartner; //KAID INTEGER,
      FTaxes: TMetaTaxList;

      FCurrencyID: Integer;  //CURRID      INTEGER,
      FCurrencyRate: Extended; // exchange rate
      FSummAll: Extended;    //SUMMALL     NUMERIC(15,8),
      FVAT: Extended;        //NDS         NUMERIC(15,8),
      FSummPay: Extended;    //SUMMPAY     NUMERIC(15,8),
      FSummInCurr: Extended; //SUMMINCURR  NUMERIC(15,8),
      FAmount: Extended;     //ONVALUE     NUMERIC(15,8)

      // some unknown shit
      FATTDATE: TDateTime; //ATTDATE  TIMESTAMP, (various data gets in here, depending on doc type)
      FATTNUM: String;     //ATTNUM   VARCHAR(15),
      FWBSeqNumber: Integer; //DEFNUM  INTEGER NOT NULL, (seemengly it's the sequence number in docs list. some archaic shit, maybe un-needed)
      FDOCID: Integer;     //DOCID    INTEGER,
      FENTID: Integer;     //ENTID    INTEGER,
      FReceived: String;   //RECEIVED VARCHAR(64),
      FTODATE: TDateTime;  //TODATE   TIMESTAMP,

      function LoadXMLNode(var topNode, Node: IXMLNode; paramIndex: Integer = -1): Boolean;

    public
      constructor Create(const AParent: TMetaClass);
      destructor Free;
      procedure Clear;

      //function SaveXML(out AOutStr: String): Integer;

      property Positions: TWayBillItemList read FItems;
      property BPartner: TMetaBusinessPartner read FBusinessPartner write FBusinessPartner;

      property CurrencyID: Integer read FCurrencyID write FCurrencyID;
      property SummAll: Extended read FSummAll;
      property VAT: Extended read FVAT write FVAT;
      property SummPay: Extended read FSummPay write FSummPay;
      property SummInCurr: Extended read FSummInCurr;
      property Amount: Extended read FAmount;

      property ATTDATE: TDateTime read FATTDATE write FATTDATE;
      property ATTNUM: String read FATTNUM write FATTNUM;
      property WBSeqNumber: Integer read FWBSeqNumber write FWBSeqNumber;
      property DOCID: Integer read FDOCID write FDOCID;
      property ENTID: Integer read FENTID write FENTID;
      property Received: String read FReceived write FReceived;
      property TODATE: TDateTime read FTODATE write FTODATE;
  end; // TWayBillClass

//==================================================================================
//==================================================================================
//==================================================================================
//==================================================================================
implementation

uses
  SysUtils, prFun, {prConst, ClientData, ssFun, ShellAPI, StdConvs,
  ssRegUtils, ssStrUtil, okMoneyFun,
  }
  MetaPrice, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

//==============================================================================================
//= TWayBillItem ================================================================================
//==============================================================================================
function TWayBillItem.Load(Ads: TssClientDataSet; const doException: Boolean = False): Boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TWayBillItem.Load') else _udebug := nil;{$ENDIF}

  Result := False;

  Clear;

  with Ads do try
    // standard data from WayBillDet table
    FProdID := FieldByName('matid').asInteger;
    FID     := FieldByName('posid').asInteger; //FID=POSID      INTEGER NOT NULL,

    FOwnerID := FieldByName('wbillid').asInteger; //WBILLID    INTEGER NOT NULL,
    FWarehouseID := FieldByName('wid').asInteger; //WID        INTEGER,

    if FPrice <> nil then FPrice.Free;
    FPrice := TMetaPrice.Create(Self, FieldByName('pTypeID').asInteger, FieldByName('price').asFloat, FieldByName('Discount').asFloat,
                  FieldByName('CurrID').asInteger, FieldByName('CurrName').asString);
    FPrice.Taxes.Add(TaxMethodPercent, FieldByName('nds').asFloat);
        //PRICE      NUMERIC(15,8), = base price w/o discounts and taxes
        //PTYPEID    INTEGER, price type ID
        //CURRID     INTEGER, currency ID
        //currname   varchar(10),
        //fullprice  numeric(15,8), price with discounts, etc. applied
        //svctoprice integer)
        //nds        numeric(15,8),
        //DISCOUNT   NUMERIC(15,8),

    //Exchange rate=       //ONVALUE    NUMERIC(15,8),

    FAmount := FieldByName('amount').asFloat; //AMOUNT  NUMERIC(15,8) NOT NULL,

                           //TOTAL      NUMERIC(15,8),
                           //BASEPRICE  NUMERIC(15,8)

    FReserved := (FieldByName('checked').asInteger = 1); //CHECKED  INTEGER,

    if FieldByName('postype').asInteger = 0 //0-tangible, 1-service
      then FPosType := WBMetaItemTangible
      else FPosType := WBMetaItemService;

    //FPersonID: Integer;

    FNum := FieldByName('num').asInteger; //NUM  INTEGER NOT NULL, it's just internal numerator.

    // addons taken from SP_WBD_GET_IN()
    FArchived := (1 = FieldByName('archived').asInteger); //archived integer,
    FBarcode := FieldByName('barcode').asString; //barcode varchar(64),
    FCertDate := FieldByName('certdate').asDateTime; //certdate timestamp,
    FCertNum := FieldByName('certnum').asString; //certnum varchar(64),
    FCountry := FieldByName('country').asString; //country varchar(128),
    FGrpID := FieldByName('grpid').asInteger; //grpid integer,
    FGTD := FieldByName('gtd').asString; //gtd varchar(64),
    FModel := FieldByName('artikul').asString; //artikul varchar(255),
    FMsrNAme := FieldByName('msrname').asString; // msrname varchar(10),
    FNormedRate := FieldByName('norm').asFloat; //norm numeric(15,8),
    FName := FieldByName('matname').asString; // matname varchar(255),
    FProducer := FieldByName('producer').asString; //producer varchar(128),
    FWHName := FieldByName('whname').asString; // whname varchar(128),

    FModified := False;
    FNew := False;
    Result := True;

  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TWayBillItem.Save(const doException: Boolean = False): Boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TWayBillItem.Save') else _udebug := nil;{$ENDIF}

  Result := False;

  with newDataSet do try
    if FPosType = WBMetaItemTangible then begin
      if Fnew
        then ProviderName := 'pWaybillDet_Ins'
        else ProviderName := 'pWaybillDet_UpdExIn';
      FetchParams;

    end //WBMetaItemTangible
    else begin
      if Fnew
        then ProviderName := 'pWaybillSvc_Ins'
        else ProviderName := 'pWaybillSvc_Upd';
      FetchParams;
    end; // service
(*
      if mdDet.FieldByName('postype').AsInteger = 0 then begin
        ProviderName := 'pWaybillDet_Ins';
        FetchParams;
        FPosID := GetMaxID(dmData.SConnection, 'waybilldet', 'posid');
        Params.ParamByName('POSID').AsInteger := FPosID;
        //3.1 Ставим реальные Sourceid для оборотов
        mdWMatTurn.First;
        while not mdWMatTurn.Eof do begin
          if mdWMatTurn.FieldByName('sourceid').AsInteger = mdDet.fieldbyname('posid').AsInteger then begin
            mdWMatTurn.Edit;
            mdWMatTurn.FieldByName('sourceid').AsInteger := Params.ParamByName('POSID').AsInteger;
            mdWMatTurn.Post;
          end;
          mdWMatTurn.Next;
        end;
        mdDet.Edit;
        mdDet.FieldByName('realposid').AsInteger := FPosID;
        mdDet.Post;
        //**************************

        if Params.ParamByName('POSID').AsInteger < 0
          then raise Exception.Create(rs('fmWaybill','ErrorAddPos'));

        Params.ParamByName('WBILLID').AsInteger := FID;
        Params.ParamByName('MATID').AsInteger := mdDet.fieldbyname('MATID').AsInteger;
        Params.ParamByName('WID').AsInteger := mdDet.fieldbyname('WID').AsInteger;
        Params.ParamByName('AMOUNT').AsFloat := RoundToA(StrToFloat(mdDet.fieldbyname('AMOUNT').AsString), MatDisplayDigits);
        Params.ParamByName('PRICE').AsFloat := StrToFloat(mdDet.fieldbyname('PRICE').AsString);
        Params.ParamByName('onvalue').AsFloat := StrToFloat(mdDet.fieldbyname('onvalue').AsString);
        Params.ParamByName('DISCOUNT').AsFloat := StrToFloat(mdDet.fieldbyname('DISCOUNT').AsString);
        Params.ParamByName('NDS').AsFloat := StrToFloat(mdDet.fieldbyname('NDS').AsString);
        Params.ParamByName('CurrId').AsInteger := cbCurr.KeyValue;
        Params.ParamByName('OnDate').AsDateTime := edDate.Date+edTime.Time;

        if mdDet.fieldbyname('PTypeID').IsNull then begin
          Params.ParamByName('PTypeID').DataType := ftInteger;
          Params.ParamByName('PTypeID').Clear;
        end else Params.ParamByName('PTypeID').AsInteger := mdDet.fieldbyname('PTypeID').AsInteger;

        Params.ParamByName('NUM').AsInteger := mdDet.RecNo;
        Params.ParamByName('total').AsFloat := mdDet.fieldbyname('total').AsFloat;
        Execute; //Записываем очередную позицию

        SaveAddProps(FPosID);
        SaveTaxes(FPosID);
        SaveSerial(FPosID);
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

        mdDet.Edit;
        mdDet.FieldByName('realposid').AsInteger := FPosID;
        mdDet.Post;
      end;
*)
    // standard data from WayBillDet table
    FProdID := FieldByName('matid').asInteger;
    FID     := FieldByName('posid').asInteger; //FID=POSID      INTEGER NOT NULL,

    FOwnerID := FieldByName('wbillid').asInteger; //WBILLID    INTEGER NOT NULL,
    FWarehouseID := FieldByName('wid').asInteger; //WID        INTEGER,

    if FPrice <> nil then FPrice.Free;
    FPrice := TMetaPrice.Create(Self, FieldByName('pTypeID').asInteger, FieldByName('price').asFloat, FieldByName('Discount').asFloat,
                  FieldByName('CurrID').asInteger, FieldByName('CurrName').asString);
    //FPrice.vat := FieldByName('nds').asFloat;
        //PRICE      NUMERIC(15,8), = base price w/o discounts and taxes
        //PTYPEID    INTEGER, price type ID
        //CURRID     INTEGER, currency ID
        //currname   varchar(10),
        //fullprice  numeric(15,8), price with discounts, etc. applied
        //svctoprice integer)
        //nds        numeric(15,8),
        //DISCOUNT   NUMERIC(15,8),

    //Exchange rate=       //ONVALUE    NUMERIC(15,8),

    FAmount := FieldByName('amount').asFloat; //AMOUNT  NUMERIC(15,8) NOT NULL,

                           //TOTAL      NUMERIC(15,8),
                           //BASEPRICE  NUMERIC(15,8)

    FReserved := (FieldByName('checked').asInteger = 1); //CHECKED  INTEGER,
    case FieldByName('postype').asInteger of //0-tangible, 1-service
      0: FPosType := WBMetaItemTangible;
      1: FPosType := WBMetaItemService;
    end;
    //FPersonID: Integer;

    FNum := FieldByName('num').asInteger; //NUM  INTEGER NOT NULL, it's just internal numerator.

    // addons taken from SP_WBD_GET_IN()
    FArchived := (1 = FieldByName('archived').asInteger); //archived integer,
    FBarcode := FieldByName('barcode').asString; //barcode varchar(64),
    FCertDate := FieldByName('certdate').asDateTime; //certdate timestamp,
    FCertNum := FieldByName('certnum').asString; //certnum varchar(64),
    FCountry := FieldByName('country').asString; //country varchar(128),
    FGrpID := FieldByName('grpid').asInteger; //grpid integer,
    FGTD := FieldByName('gtd').asString; //gtd varchar(64),
    FModel := FieldByName('artikul').asString; //artikul varchar(255),
    FMsrNAme := FieldByName('msrname').asString; // msrname varchar(10),
    FNormedRate := FieldByName('norm').asFloat; //norm numeric(15,8),
    FName := FieldByName('matname').asString; // matname varchar(255),
    FProducer := FieldByName('producer').asString; //producer varchar(128),
    FWHName := FieldByName('whname').asString; // whname varchar(128),


    // 2 Удаляем позиции
    ProviderName := 'pWaybillDet_Del';
    FetchParams;
    Params.ParamByName('WBILLID').AsInteger := FID;
    Execute;

    ProviderName := 'pWaybillSvc_Del';
    FetchParams;
    Params.ParamByName('wbillid').AsInteger := FID;
    Execute;

    {
    if mdDet.FieldByName('postype').AsInteger = 0 then begin
      ProviderName := 'pWaybillDet_Ins';
      FetchParams;
      Params.ParamByName('POSID').AsInteger := GetMaxID(dmData.SConnection, 'waybilldet', 'posid');

      if Params.ParamByName('POSID').AsInteger < 0
        then raise Exception.Create(rs('fmWaybill','ErrorAddPos'));

      Params.ParamByName('WBILLID').AsInteger := FID;
      Params.ParamByName('MATID').AsInteger := mdDet.fieldbyname('MATID').AsInteger;
      Params.ParamByName('WID').AsInteger := mdDet.fieldbyname('WID').AsInteger;
      Params.ParamByName('AMOUNT').AsFloat := RoundToA(StrToFloat(mdDet.fieldbyname('AMOUNT').AsString), MatDisplayDigits);
      Params.ParamByName('PRICE').AsFloat := StrToFloat(mdDet.fieldbyname('PRICE').AsString);
      Params.ParamByName('onvalue').AsFloat := StrToFloat(mdDet.fieldbyname('onvalue').AsString);
      Params.ParamByName('DISCOUNT').AsFloat := StrToFloat(mdDet.fieldbyname('DISCOUNT').AsString);
      Params.ParamByName('NDS').AsFloat := StrToFloat(mdDet.fieldbyname('NDS').AsString);
      Params.ParamByName('CurrId').AsInteger := cbCurr.KeyValue;
      Params.ParamByName('OnDate').AsDateTime := edDate.Date+edTime.Time;

      if mdDet.fieldbyname('PTypeID').IsNull then begin
        Params.ParamByName('PTypeID').DataType := ftInteger;
        Params.ParamByName('PTypeID').Clear;
      end
      else Params.ParamByName('PTypeID').AsInteger := mdDet.fieldbyname('PTypeID').AsInteger;

      Params.ParamByName('NUM').AsInteger := mdDet.RecNo;
      Params.ParamByName('total').AsFloat := mdDet.fieldbyname('total').AsFloat;
      Execute; //Записываем очередную позицию

      SaveAddProps(FPosID);
      SaveTaxes(FPosID);
      SaveSerial(FPosID);
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

      mdDet.Edit;
      mdDet.FieldByName('realposid').AsInteger := FPosID;
      mdDet.Post;
    end;

    //2)Запись в обороты
    mdWMatTurn.First;
    while not mdWMatTurn.Eof do begin
      ProviderName := 'pWMatTurnOut_Ins';
      FetchParams;
      Params.ParamByName('PosID').AsInteger := mdWMatTurn.fieldbyname('posid').AsInteger;
      Params.ParamByName('MatID').AsInteger := mdWMatTurn.fieldbyname('matid').AsInteger;
      Params.ParamByName('WID').AsInteger := mdWMatTurn.fieldbyname('wid').AsInteger;
      Params.ParamByName('SOURCEID').AsInteger := mdWMatTurn.fieldbyname('SOURCEID').AsInteger;

      if chbPosting.Checked
        then Params.ParamByName('TurnType').AsInteger := -1
        else Params.ParamByName('TurnType').AsInteger := 2;

      Params.ParamByName('OnDate').AsDateTime := edDate.Date+edTime.Time;
      Params.ParamByName('Amount').AsFloat := RoundToA(strtofloat(mdWMatTurn.fieldbyname('amount').AsString), MatDisplayDigits);
      Execute;

      if ((FInAccOut > 0) or (FOrderID > 0)) and NewRecord then begin
        if mdDet.Locate('realposid', mdWMatTurn.FieldByName('sourceid').AsInteger, [])
            and mdWMatTurnOld.Locate('posid;sourceid',
                VarArrayOf([mdWMatTurn.FieldByName('posid').AsInteger, mdDet.FieldByName('posid').AsInteger]), [])
        then begin
          ProviderName := 'pWMatTurn_UpdRsv';
          FetchParams;
          Params.ParamByName('posid').AsInteger := mdWMatTurnOld.FieldByName('posid').AsInteger;
          Params.ParamByName('sourceid').AsInteger := mdWMatTurnOld.FieldByName('sourceid').AsInteger;
          Params.ParamByName('amount').AsFloat := -mdWMatTurn.FieldByName('amount').AsFloat;
          Execute;
        end;
      end;

      mdWMatTurn.Next;
    end;
    }
    FModified := False;
    FNew := False;

  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TWayBillItem.LoadXMLNode(var topNode, Node: IXMLNode; paramIndex: Integer = -1): Boolean;
  var
    name: String;
    datefmt: TFormatSettings;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TWayBillItem.loadXMLNode') else _udebug := nil;{$ENDIF}

  Result := True;
  Ferror := 0;

  //GetLocaleFormatSettings(..., datefmt);
  datefmt.DateSeparator := '-';
  datefmt.TimeSeparator := ':';
  datefmt.ShortDateFormat := 'yyyy-mm-dd';

  try // finally
    name := AnsiLowerCase(Node.NodeName);

    if name = 'certdate' then begin
      try
        FCertDate := strToDateTime(Node.Text, datefmt);

      except
        Ferror := ap_err_XML_badDate;
      end;

      Exit;
    end
    else if name = 'msrname' then begin
      FMsrName := Node.Text;
      Exit;
    end
    else if name = 'whname' then begin
      FWHName := Node.Text;
      Exit;
    end
    else if name = 'model' then begin
      FModel := Node.Text;
      Exit;
    end
    else if name = 'producer' then begin
      FProducer := Node.Text;
      Exit;
    end
    else if name = 'gtd' then begin
      FGTD := Node.Text;
      Exit;
    end
    else if name = 'certnum' then begin
      FCertNum := Node.Text;
      Exit;
    end
    else if name = 'barcode' then begin
      FBarcode := Node.Text;
      Exit;
    end
    else if name = 'grpid' then begin
      try
        FGrpId := StrToInt(Node.Text);

      except
        Ferror := ap_err_XML_badData;
      end;

      Exit;
    end
    else if name = 'country' then begin
      FCountry := Node.Text;
      Exit;
    end
    else if name = 'archived' then begin
      FArchived := StrToBool(Node.Text);
      Exit;
    end;

    Result := loadXMLNode(topNode, Node); // maybe some base-class stuff

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
(*
procedure TWayBillItem.SaveAddProps(APosID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TWayBillItem.SaveAddProps') else _udebug := nil;{$ENDIF}

  if (mdDet.FieldByName('producer').AsString <> '')
     or (mdDet.FieldByName('certnum').AsString <> '')
     or (mdDet.FieldByName('gtd').AsString <> '')
     or (mdDet.FieldByName('certdate').AsDateTime <> 0)
     or (mdDet.FieldByName('cardid').AsInteger > 0)
     or (not mdDet.FieldByName('warrantyperiod').IsNull)
  then begin
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

      if not mdDet.FieldByName('warrantyperiod').IsNull then begin
        Params.ParamByName('warrantyperiod').AsInteger := mdDet.FieldByName('warrantyperiod').AsInteger;
        Params.ParamByName('warrantyperiodtype').AsInteger := mdDet.FieldByName('warrantyperiodtype').AsInteger;
      end
      else begin
        Params.ParamByName('warrantyperiod').DataType := ftInteger;
        Params.ParamByName('warrantyperiod').Clear;
        Params.ParamByName('warrantyperiodtype').DataType := ftInteger;
        Params.ParamByName('warrantyperiodtype').Clear;
      end;

      if mdDet.FieldByName('cardid').IsNull then begin
        Params.ParamByName('cardid').DataType := ftInteger;
        Params.ParamByName('cardid').Clear;
      end
      else Params.ParamByName('cardid').AsInteger := mdDet.FieldByName('cardid').AsInteger;

      Execute;

    finally
      Free;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TWayBillItem.SaveTaxes(APosID: Integer);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TWayBillItem.SaveTaxes') else _udebug := nil;{$ENDIF}

  with newDataSet do
  try
    ProviderName := 'pWaybillDetTaxes_Ins';
    FetchParams;
    Params.ParamByName('posid').AsInteger := APosID;

    for i := 0 to mdDet.FieldCount - 1 do begin
      if (Pos('Tax', mdDet.Fields[i].FieldName) = 1)
         and (Pos('TaxRate', mdDet.Fields[i].FieldName) = 0)
         and (mdDet.Fields[i].AsFloat > 0)
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

//==============================================================================================
procedure TWayBillItem.SaveSerial(APosID: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TWayBillItem.SaveSerial') else _udebug := nil;{$ENDIF}

  if mdDet.FieldByName('sn').AsString = '' then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with newDataSet do
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
*)

//==============================================================================================
//= TWayBillItemList ============================================================================
//==============================================================================================
function TWayBillItemList.getItem(const idx: Integer): TWayBillItem;
begin
  Result := TWayBillItem(FItems[idx]);
end;

//==============================================================================================
function TWayBillItemList.Load(ADocID: Integer; const doException: Boolean = False): boolean;
  var
    pos: TWayBillItem;
    ds: TssClientDataset;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TWayBillItemList.Load') else _udebug := nil;{$ENDIF}

  Clear;
  Result := False;

  try
    ds := newDataSet;

    with ds do try
      ProviderName := 'pWaybillDet_GetIn'; // select * from sp_wbd_get_in(:wbillid) (1.4.9)
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := ADocID;
      Open;

      while not eof do begin
        pos := TWayBillItem.Create(Self);

        if not pos.Load(ds) or (-1 = FItems.Add(pos)) then Exit;
        Next;
      end; // while not eof

      Close;
      Result := True;

    finally
      Free;
    end;

  except
    if doException then raise;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TWayBillItemList.Save(const doException: Boolean = False): Boolean; 
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TWayBillItemList.Save') else _udebug := nil;{$ENDIF}

  Result := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
//==============================================================================================
// TWayBillClass
//==============================================================================================
//==============================================================================================
procedure TWayBillClass.Clear;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TWayBillClass.Clear') else _udebug := nil;{$ENDIF}

  inherited;

  if FBusinessPartner = nil 
    then FBusinessPartner := TMetaBusinessPartner.Create(Self)
    else FBusinessPartner.Clear;

  if FItems = nil
    then FItems := TWayBillItemList.Create(Self)
    else FItems.Clear;

  if FTaxes = nil
    then FTaxes := TMetaTaxList.Create(Self)
    else FTaxes.Clear;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
constructor TWayBillClass.Create(const AParent: TMetaClass);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TWayBillClass.Create') else _udebug := nil;{$ENDIF}

  inherited;

  FBusinessPartner := nil;
  FItems := nil;
  FTaxes := nil;

  Clear;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
destructor TWayBillClass.Free;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TWayBillClass.Clear') else _udebug := nil;{$ENDIF}

  if FBusinessPartner <> nil then FBusinessPartner.Free;
  if FItems <> nil then FItems.Free;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

(*
//Функция подсчёта суммы с НДС
//==============================================================================================
function TWayBillClass.GetSummWithNDS(PriceNDS, Amount, aNDS: Extended): Extended;
  var
    pricenonds, summcurnonds, summnds: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TWayBillClass.GetSummWithNDS') else _udebug := nil;{$ENDIF}

  pricenonds := roundtoa(PriceNDS - NDSOut(PriceNDS, aNDS), -6);
  summcurnonds := roundtoa(amount * pricenonds, -2);
  summnds := roundtoa(GetNDS(summcurnonds, CurrentNDS), -2);
  result := summcurnonds + summnds;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
*)

//==============================================================================================
function TWayBillClass.LoadXMLNode(var topNode, Node: IXMLNode; paramIndex: Integer = -1): Boolean;
  var
    name, data: String;
    datefmt: TFormatSettings;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TWaybillClass.loadXMLNode') else _udebug := nil;{$ENDIF}

  Result := True;
  Ferror := 0;

  //GetLocaleFormatSettings(..., datefmt);
  datefmt.DateSeparator := '-';
  datefmt.TimeSeparator := ':';
  datefmt.ShortDateFormat := 'yyyy-mm-dd';

  try // finally
    name := AnsiLowerCase(Node.NodeName);
    data := Trim(Node.Text);

    if name = 'businesspartner' then begin
      FBusinessPartner.LoadXML(Node);
      Exit;
    end;

    try
      if name = 'currencyid' then begin
        FCurrencyId := StrToInt(data);
        Exit;
      end
      else if name = 'currencyrate' then begin
        FCurrencyRate := StrToFloat(data);
        Exit;
      end
      else if name = 'total' then begin
        FSummAll := StrToFloat(data);
        Exit;
      end
      else if name = 'vat' then begin
        FVAT := StrToFloat(data);
        Exit;
      end
      else if name = 'amount' then begin
        FAmount := StrToFloat(data);
        Exit;
      end;

    except
      Ferror := ap_err_XML_badData;
    end;

    Result := inherited loadXMLNode(topNode, Node); // maybe some base-class stuff

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('WaybillClass', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
