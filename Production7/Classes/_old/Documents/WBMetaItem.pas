{$I ok_sklad.inc}
unit WBMetaItem;

interface

uses
  ssClientDataSet, XMLDoc, XMLIntf,
  MetaClass, MetaDoc, MetaPrice, Classes;

type
  TWBMetaItemType = (WBMetaItemUnTyped = -1, WBMetaItemTangible = 0, WBMetaItemService = 1);

  // a single position in waybills, etc
  TWBMetaItem = class(TMetaClass)
    protected
      // taken from WAYBILLDET
      FProdID: Integer; //MATID      INTEGER NOT NULL,
                        //FID=POSID      INTEGER NOT NULL,

      FOwnerID: Integer;   //WBILLID    INTEGER NOT NULL,
      FWarehouseID: Integer;//WID        INTEGER,

      FPrice: TMetaPrice;  //PRICE      NUMERIC(15,8),
                           //PTYPEID    INTEGER,
                           //CURRID     INTEGER,
                           //DISCOUNT   NUMERIC(15,8),
                           //NDS        NUMERIC(15,8),

      FAmount: Extended; //AMOUNT     NUMERIC(15,8) NOT NULL,
                       //ONVALUE    NUMERIC(15,8),
                       //TOTAL      NUMERIC(15,8),
                       //BASEPRICE  NUMERIC(15,8)

      FReserved: Boolean; //CHECKED    INTEGER,
      FPosType: TWBMetaItemType;

      // for services:
      FNormedRate: Extended;
      FPersonID: Integer;

      FNum: Integer; //NUM INTEGER NOT NULL, it's just internal numerator.

      //FDate=ondate timestamp,

      FSerialNumbers: TStringList;

      function LoadXMLNode(var topNode, Node: IXMLNode; paramIndex: Integer = -1): Boolean;

      function getPrice: TMetaPrice;
      function getisTangible: Boolean;
      function getisService: Boolean;

      procedure setAmount(const Value: Extended);
      procedure setNormedRate(const Value: Extended);
      procedure setNum(const Value: Integer);
      procedure setOwnerID(const Value: Integer);
      procedure setPersonID(const Value: Integer);
      procedure setPosType(const Value: TWBMetaItemType);
      procedure setProdID(const Value: Integer);
      procedure setReserved(const Value: Boolean);
      procedure setWarehouseID(const Value: Integer);

    public
      constructor Create(const AParent: TMetaClass);
      destructor Free;

      procedure Clear;

      function Load(Ads: TssClientDataSet; const doException: Boolean = False): Boolean; virtual;
      function Save(const doException: Boolean = False): Boolean; virtual;

      property Amount: Extended read FAmount write setAmount;
      property isTangible: Boolean read getisTangible;
      property isService: Boolean read getisService;
      property NormedRate: Extended read FnormedRate write setNormedRate;
      property Num: Integer read FNum write SetNum;
      property OwnerID: Integer read FOwnerID write setOwnerID;
      property PersonID: Integer read FPersonID write setPersonID;
      property PosType: TWBMetaItemType read FPosType write setPosType;
      property Price: TMetaPrice read getPrice;
      property ProdID: Integer read FProdID write SetProdID;
      property Reserved: Boolean read Freserved write setReserved;
      property WarehouseID: Integer read FWarehouseID write setWarehouseID;
  end;

  //**********************************************************************
  // list of positions
  TWBMetaItemList = class(TMetaClassList)
    protected
      // property processing
      function getItem(const idx: Integer): TWBMetaItem;
      procedure setItem(const idx: Integer; const Value: TWBMetaItem);

      function getTotal: Extended;
      function getTotalDefCurr: Extended; // in default currency. here = getTotal

    public
      constructor Create(const AParent: TMetaClass);
      destructor Free;
      procedure Clear;

      function Load(ADocID: Integer; const doException: Boolean = False): boolean; virtual;
      function Save(const doException: Boolean = False): Boolean; virtual;

      function Add(const Value: TWBMetaItem): Integer;

      property Items[const idx: Integer]: TWBMetaItem read getItem write setItem; default;
      property Total: Extended read getTotal;
      property TotalInDefCurr: Extended read getTotalDefCurr;
  end; // TWBMetaItemList

//========================================================================
//========================================================================
//========================================================================
//========================================================================
implementation

uses
  udebug, SysUtils, StrUtils;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

//==============================================================================================
//==============================================================================================
//==============================================================================================
constructor TWBMetaItemList.Create(const AParent: TMetaClass);
begin
  inherited;
end;

//==============================================================================================
destructor TWBMetaItemList.Free;
begin
  inherited;
end;

//==============================================================================================
function TWBMetaItemList.Add(const Value: TWBMetaItem): Integer;
begin
  Result := FItems.Add(Value);
  isModified := True;
end;

//==============================================================================================
function TWBMetaItemList.getItem(const idx: Integer): TWBMetaItem;
begin
  Result := TWBMetaItem(FItems[idx]);
end;

//==============================================================================================
procedure TWBMetaItemList.setItem(const idx: Integer; const Value: TWBMetaItem);
begin
  FItems[idx] := Value;
  isModified := True;
end;

//==============================================================================================
procedure TWBMetaItemList.Clear;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TWBMetaItemList.Clear') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TWBMetaItemList.Load(ADocID: Integer; const doException: Boolean = False): boolean;
begin
  Result := False;
end;

//==============================================================================================
function TWBMetaItemList.Save(const doException: Boolean = False): Boolean;
begin
  Result := False;
end;

//==============================================================================================
function TWBMetaItemList.getTotal: Extended;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TWBMetaItemList.getTotal') else _udebug := nil;{$ENDIF}

  Result := 0.0;

  for i := 0 to FItems.Count - 1 do Result := Result + Self[i].Price.Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TWBMetaItemList.getTotalDefCurr: Extended;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TWBMetaItemList.getTotalDefCurr') else _udebug := nil;{$ENDIF}

  Result := getTotal;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
//==============================================================================================
procedure TWBMetaItem.Clear;
begin
  inherited;

  if FPrice <> nil then FPrice.Clear;
  if FSerialNumbers <> nil then FSerialNumbers.Clear;

  FAmount := 0.0;
  FNormedRate := 0.0;
  FNum := -1;
  FOwnerID := -1;
  FPersonID := -1;
  FProdID := -1;
  FReserved := False;

  FWarehouseID := -1;
  FPosType := WBMetaItemUnTyped;
end;

//==============================================================================================
constructor TWBMetaItem.Create(const AParent: TMetaClass);
begin
  inherited;

  FSerialNumbers := TStringList.Create;

  Clear;
end;

//==============================================================================================
destructor TWBMetaItem.Free;
begin
  if FPrice <> nil then FPrice.Free;
  if FSerialNumbers <> nil then FSerialNumbers.Destroy;

  inherited;
end;

//==============================================================================================
function TWBMetaItem.getisTangible: Boolean;
begin
  Result := (FPosType = WBMetaItemTangible);
end;

//==============================================================================================
function TWBMetaItem.getisService: Boolean;
begin
  Result := (FPosType = WBMetaItemService);
end;

//==============================================================================================
function TWBMetaItem.getPrice: TMetaPrice;
begin
  if FPrice = nil then FPrice := TMetaPrice.Create(Self);
  Result := FPrice;
end;

//==============================================================================================
procedure TWBMetaItem.setAmount(const Value: Extended);
begin
  if FAmount = Value then Exit;
  FAmount := Value;
  isModified := True;
end;

//==============================================================================================
procedure TWBMetaItem.setNormedRate(const Value: Extended);
begin
  if FNormedRate = Value then Exit;
  FnormedRate := Value;
  isModified := True;
end;

//==============================================================================================
procedure TWBMetaItem.setNum(const Value: Integer);
begin
  if FNum = Value then Exit;
  FNum := Value;
  isModified := True;
end;

//==============================================================================================
procedure TWBMetaItem.setOwnerID(const Value: Integer);
begin
  if FOwnerID = Value then Exit;
  FOwnerID := Value;
  isModified := True;
end;

//==============================================================================================
procedure TWBMetaItem.setPersonID(const Value: Integer);
begin
  if FPersonID = Value then Exit;
  FPersonID := Value;
  isModified := True;
end;

//==============================================================================================
procedure TWBMetaItem.setPosType(const Value: TWBMetaItemType);
begin
  if FPosType = Value then Exit;
  FPosType := Value;
  isModified := True;
end;

//==============================================================================================
procedure TWBMetaItem.setProdID(const Value: Integer);
begin
  if FProdID = Value then Exit;
  FProdID := Value;
  isModified := True;
end;

//==============================================================================================
procedure TWBMetaItem.setReserved(const Value: Boolean);
begin
  if FReserved = Value then Exit;
  FReserved := Value;
  isModified := True;
end;

//==============================================================================================
procedure TWBMetaItem.setWarehouseID(const Value: Integer);
begin
  if FWarehouseID = Value then Exit;
  FWarehouseID := Value;
  isModified := True;
end;

//==============================================================================================
function TWBMetaItem.Load(Ads: TssClientDataSet; const doException: Boolean = False): Boolean;
begin
  Result := False;
end;

//==============================================================================================
function TWBMetaItem.Save(const doException: Boolean = False): Boolean;
begin
  Result := False;
end;

//==============================================================================================
function TWBMetaItem.LoadXMLNode(var topNode, Node: IXMLNode; paramIndex: Integer = -1): Boolean;
  var
    name, data: String;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TWBMetaItem.loadXMLNode') else _udebug := nil;{$ENDIF}

  Result := True;
  Ferror := 0;

  try // finally
    name := AnsiLowerCase(Node.NodeName);
    data := trim(Node.Text);

    try
      if (name = 'id') or (name = 'posid') or (name = 'itemid')then begin
        FID := strToInt(data);
        Exit;
      end
      else if (name = 'prodid') or (name = 'serviceid') then begin
        FProdID := strToInt(data);
        Exit;
      end
      else if (name = 'ownerid') or (name = 'docid') or (name = 'documentid') then begin
        FOwnerID := strToInt(data);
        Exit;
      end
      else if (name = 'whid') or (name = 'warehouse') or (name = 'warehouseid') then begin
        FWarehouseID := strToInt(data);
        Exit;
      end
      else if (name = 'amount') or (name = 'quantity') then begin
        FAmount := strToFloat(data);
        Exit;
      end
      else if (name = 'reserved') then begin
        FReserved := strToBool(data);
        Exit;
      end
      else if (name = 'normedrate') then begin
        FNormedRate := strToFloat(data);
        Exit;
      end
      else if (name = 'personid') then begin
        FPersonID := strToInt(data);
        Exit;
      end
      else if (name = 'number') then begin
        FNum := strToInt(data);
        Exit;
      end
      else if (name = 'serialnumber') or (name = 'serialnumbers') then begin
        FSerialNumbers.Text := data;
        Exit;
      end
      else if (name = 'type') or (name = 'postype') or (name = 'itemtype') then begin
        if data = 'service'
          then FPosType := WBMetaItemService
          else FPosType := WBMetaItemTangible;
          
        Exit;
      end
      else if (name = 'price') then begin
        Result := Price.loadXML(node);
        Exit;
      end;

    except
      Ferror := ap_err_XML_badData;
      Exit;
    end;

    Result := loadXMLNode(topNode, Node); // maybe some base-class stuff

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('WBMetaItem', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.

