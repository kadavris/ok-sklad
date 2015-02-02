{$I ok_sklad.inc}
unit MetaPrice;

interface

uses
  MetaClass, MetaDiscount, MetaTax, XMLDoc, XMLIntf,
  Classes;

type

// !!! Some of this should go to the TMetaCurrency somehow

  TMetaPrice = class(TMetaClass)
    private
      FCalculateValue: Boolean; // enable .Value prop calculation form BasePrice and taxes/discount. if disabled(default now) then .Value=.BasePrice

    protected
      FTypeID: Integer;
      FBasePrice: Extended;

      FRate: Extended;
      FCurrencyID, FBaseCurrencyID: Integer;
      FCurrencyName: String;

      FDiscounts: TMetaDiscountList;
      FTaxes: TMetaTaxList;

      function LoadXMLNode(var topNode, Node: IXMLNode; paramIndex: Integer = -1): Boolean;

      function getValue: Extended;

      function getDiscounts: TMetaDiscountList;
      function getTaxes: TMetaTaxList;
      function getHasDiscounts: Boolean;
      function getHasTaxes: Boolean;

      procedure setBasePrice(const AVAlue: Extended);
      procedure setCalculateValue(const Value: Boolean);
      procedure setCurrencyID(const Value: Integer);
      procedure setCurrencyName(const Value: String);

    public
      constructor Create(const AParent: TMetaClass); overload;
      // temporary solution for MetaProduct class
      constructor Create(const AParent: TMetaClass; ATypeID: Integer; AValue, ADiscount: Extended; ACurrencyID: Integer; ACurrencyName: String); overload;
      destructor Destroy; override;
      procedure Clear;

      procedure loadCurrency(const AID: Integer; const AName: String); // loads currency data from DB

      property BaseCurrencyID: Integer read FBaseCurrencyID write FBaseCurrencyID;
      property BasePrice: Extended read FBasePrice write setBasePrice;
      property CurrencyID: Integer read FCurrencyID write setCurrencyID;
      property CurrencyName: String read FCurrencyName write setCurrencyName;
      property Discounts: TMetaDiscountList read getDiscounts;
      property EnableCalculateValue: Boolean read FCalculateValue write setCalculateValue;
      property hasDiscounts: Boolean read getHasDiscounts; // workaround to not create discounts object just to see there is nothing yet ;)
      property Rate: Extended read FRate write FRate;
      property Taxes: TMetaTaxList read getTaxes;
      property hasTaxes: Boolean read getHasTaxes; // workaround to not create taxes object just to see there is nothing yet ;)
      property TypeID: Integer read FTypeID write FTypeID;
      property Value: Extended read getValue;
  end;

  //-----------------------------------------------------------------------
  TMetaPricesList = class(TMetaClassList)
    public
      constructor Create(const AParent: TMetaClass);
      destructor Destroy; override;

      function Add(const Value: TMetaPrice): Integer;

      // property processing
      function getItem(const idx: Integer): TMetaPrice;
      procedure setItem(const idx: Integer; const Value: TMetaPrice);

      property Items[const idx: Integer]: TMetaPrice read getItem write setItem; default;
  end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  prFun, SysUtils, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

//==============================================================================================
constructor TMetaPricesList.Create(const AParent: TMetaClass);
begin
  inherited;
end;

//==============================================================================================
destructor TMetaPricesList.Destroy;
begin
  inherited;
end;

//==============================================================================================
function TMetaPricesList.Add(const Value: TMetaPrice): Integer;
begin
  Result := FItems.Add(Value);
end;

//==============================================================================================
function TMetaPricesList.getItem(const idx: Integer): TMetaPrice;
begin
  Result := TMetaPrice(FItems[idx]);
end;

//==============================================================================================
procedure TMetaPricesList.setItem(const idx: Integer; const Value: TMetaPrice);
begin
  FItems[idx] := Value;
end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
procedure TMetaPrice.Clear;
begin
  inherited;

  FTypeID := -1;
  FDiscounts := nil;
  FCurrencyID := -1;
  FCurrencyName := '';

  FBaseCurrencyID := -1;
  FRate:= 1.0;

  if FDiscounts <> nil then FDiscounts.Free;
  if FTaxes <> nil then FTaxes.Free;
  FDiscounts := nil;
  FTaxes := nil;

  FCalculateValue := False; // !!! default
end;

//==============================================================================================
constructor TMetaPrice.Create(const AParent: TMetaClass);
begin
  FDiscounts := nil;
  FTaxes := nil;

  inherited;
end;

//==============================================================================================
// temporary solution for MetaProduct class
constructor TMetaPrice.Create(const AParent: TMetaClass; ATypeID: Integer; AValue, ADiscount: Extended; ACurrencyID: Integer; ACurrencyName: String);
begin
  Create(AParent);

  FTypeID := ATypeID;
  FBasePrice := AValue;
  if ADiscount <> 0 then getDiscounts.Add(DiscMethodValue, ADiscount);
  FCurrencyID := ACurrencyID;
  FCurrencyName := ACurrencyName;
end;

//==============================================================================================
destructor TMetaPrice.Destroy;
begin
  if FDiscounts <> nil then FDiscounts.Free;
  if FTaxes <> nil then FTaxes.Free;

  inherited;
end;

//==============================================================================================
function TMetaPrice.getDiscounts: TMetaDiscountList;
begin
  if FDiscounts = nil then begin
    FDiscounts := TMetaDiscountList.Create(Self);
    isModified := True;
  end;

  Result := FDiscounts;
end;

//==============================================================================================
function TMetaPrice.getTaxes: TMetaTaxList;
begin
  if FTaxes = nil then begin
    FTaxes := TMetaTaxList.Create(Self);
    isModified := True;
  end;

  Result := FTaxes;
end;

//==============================================================================================
function TMetaPrice.getHasDiscounts: Boolean;
begin
  Result := (FDiscounts <> nil) and (FDiscounts.Count > 0); 
end;

//==============================================================================================
function TMetaPrice.getHasTaxes: Boolean;
begin
  Result := (FTaxes <> nil) and (FTaxes.Count > 0);
end;

//==============================================================================================
procedure TMetaPrice.setBasePrice(const AVAlue: Extended);
begin
  if FBasePrice = AValue then Exit;
  FBasePrice := AValue;
  isModified := True;
end;

//==============================================================================================
procedure TMetaPrice.setCurrencyID(const Value: Integer);
begin
  if FCurrencyID = Value then Exit;
  loadCurrency(Value, '');
  isModified := True;
end;

//==============================================================================================
procedure TMetaPrice.setCurrencyName(const Value: String);
begin
  if AnsiLowerCase(FCurrencyName) = AnsiLowerCase(Value) then Exit;
  loadCurrency(-1, Value);
  isModified := True;
end;

//==============================================================================================
procedure TMetaPrice.loadCurrency(const AID: Integer; const AName: String);
begin
//todo: !!!! these just a stub for now!!!! should load rate from db

  if (AID > 0) and (AName <> '') then begin // quick way to set up all at once ;)
    FCurrencyID := AID;
    FCurrencyName := AName;
    isModified := True;
    Exit;
  end;

  with newDataSet do try
    try
      FCurrencyID := -1;
      FCurrencyName := 'no such currency';

      if AID = -1 then begin
        ProviderName := 'pSQL';
        FetchMacros;
        Macros.ParamByName('sql').asString := 'select currid from currency where shortname=''' + AName + '''';
        Open;
        if not isEmpty then begin
          FCurrencyID := Fields[0].asInteger;
          FCurrencyName := AName;
        end;
        Close;
      end
      else begin
        ProviderName := 'pCurrency_Get';
        FetchParams;
        Params.ParamByName('currid').asInteger := AID;
        Open;
        if not isEmpty then begin
          FCurrencyID := AID;
          FCurrencyName := FieldByName('shortname').asString;
        end;
        Close;
      end;

    except;
    end;
    
  finally
    Free;
  end;

  FRate := 0.0;
  isModified := True;
end;

//==============================================================================================
procedure TMetaPrice.setCalculateValue(const Value: Boolean);
begin
  FCalculateValue := Value;
end;

//==============================================================================================
function TMetaPrice.getValue: Extended;
  var
    v: Extended;
    i: Integer;
begin
  if not FCalculateValue then begin
    Result := BasePrice;
    Exit;
  end;
  
  v := FBasePrice;

  if FTaxes <> nil then
    for i := 0 to FTaxes.Count - 1 do begin
      case FTaxes[i].Method of
        TaxMethodPercent: v := v + (v / 100.0 * FTaxes[i].Value);
        TaxMethodValue:   v := v + FTaxes[i].Value;
      end;
    end;

  if FDiscounts <> nil then
    for i := 0 to FDiscounts.Count - 1 do begin
      case FDiscounts[i].Method of
        DiscMethodPercent: v := v - (v / 100.0 * FDiscounts[i].Value);
        DiscMethodValue:   v := v - FDiscounts[i].Value;
      end;
    end;

  Result := v;
end;

//==============================================================================================
function TMetaPrice.LoadXMLNode(var topNode, Node: IXMLNode; paramIndex: Integer = -1): Boolean;
  var
    name, data: String;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaPrice.loadXMLNode') else _udebug := nil;{$ENDIF}

  Result := True;
  Ferror := 0;

  try // finally
    name := AnsiLowerCase(Node.NodeName);
    data := trim(Node.Text);

    try
      if name = 'typeid' then begin
        FTypeID := strToInt(data);
        Exit;
      end
      else if name = 'baseprice' then begin
        FBasePrice := strToFloat(data);
        Exit;
      end
      else if (name = 'rate') or (name = 'exchangerate') then begin
        FRate := strToFloat(data);
        Exit;
      end
      else if name = 'currencyid' then begin
        FCurrencyID := strToInt(data);
        Exit;
      end
      else if name = 'basecurrencyid' then begin
        FBaseCurrencyID := strToInt(data);
        Exit;
      end
      else if (name = 'currencyname') then begin
        FCurrencyName := data;
        Exit;
      end
      else if (name = 'taxes') then begin
        Result := Taxes.loadXML(node);
        Exit;
      end
      else if (name = 'discounts') then begin
        Result := Discounts.loadXML(node);
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
  DEBUG_unit_ID := debugRegisterUnit('MetaPrice', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.

