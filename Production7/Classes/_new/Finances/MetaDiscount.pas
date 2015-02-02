{$I ok_sklad.inc}
unit MetaDiscount;

interface

uses
  MetaClass, XMLDoc, XMLIntf,
  Classes;

type
  TDiscountSourceType = (
     DiscSrcCard,
     DiscSrcManual,
     DiscSrcWholeSaler,
     DiscSrcVIP
  );

  TDiscountMethod = (
     DiscMethodPercent,
     DiscMethodValue
  );

  //-----------------------------------------------------------------------
  TMetaDiscount = class(TMetaClass)
    protected
      FSourceType: TDiscountSourceType;
      FSourceID: Integer;
      FMethod: TDiscountMethod;
      FValue: Extended;
      FnonAdditive: Boolean; // when this discount can be only one

      // properties handling
      procedure setSourceType(const Value: TDiscountSourceType);
      procedure setSourceID(const Value: Integer);
      procedure setMethod(const Value: TDiscountMethod);
      procedure setValue(const Value: Extended);

      function LoadXMLNode(var topNode, Node: IXMLNode; paramIndex: Integer = -1): Boolean; override;

    public
      constructor Create(const AParent: TMetaClass); overload; override;
      constructor Create(const AParent: TMetaClass; const AMethod: TDiscountMethod; const AValue: Extended); reintroduce; overload;

      procedure Clear; override;

      property SourceType: TDiscountSourceType read FSourceType write setSourceType;
      property SourceID: Integer read FSourceID write setSourceID;
      property Method: TDiscountMethod read FMethod write setMethod;
      property Value: Extended read FValue write setValue;
  end;

  //-----------------------------------------------------------------------
  TMetaDiscountList = class(TMetaClassList)
    protected
      function LoadXMLNode(var topNode, Node: IXMLNode; paramIndex: Integer = -1): Boolean; override;

    public
      constructor Create(const AParent: TMetaClass); override;
      destructor Destroy; override;

      function Add(const Value: TMetaDiscount): Integer; reintroduce; overload;
      function Add(const AMethod: TDiscountMethod; const AValue: Extended): Integer; reintroduce; overload;

      // property processing
      function getItem(const idx: Integer): TMetaDiscount; reintroduce;
      procedure setItem(const idx: Integer; const Value: TMetaDiscount); reintroduce;

      property Items[const idx: Integer]: TMetaDiscount read getItem write setItem; default;
  end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  udebug, SysUtils, StrUtils;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

//==============================================================================================
constructor TMetaDiscount.Create(const AParent: TMetaClass);
begin
  inherited;
end;

//==============================================================================================
constructor TMetaDiscount.Create(const AParent: TMetaClass; const AMethod: TDiscountMethod; const AValue: Extended);
begin
  Create(AParent);
  FMethod := AMethod;
  FValue := AValue;
end;

//==============================================================================================
procedure TMetaDiscount.Clear;
begin
  inherited;

  FSourceType := DiscSrcManual;
  FSourceID := -1;
  FMethod := DiscMethodValue;
  FValue := 0;
  setModified(False);
end;

//==============================================================================================
procedure TMetaDiscount.setSourceType(const Value: TDiscountSourceType);
begin
  if FSourceType = Value then Exit;
  FsourceType := Value;
  setModified(True);
end;

//==============================================================================================
procedure TMetaDiscount.setSourceID(const Value: Integer);
begin
  if FSourceID = Value then Exit;
  FSourceID := Value;
  setModified(True);
end;

//==============================================================================================
procedure TMetaDiscount.setMethod(const Value: TDiscountMethod);
begin
  if FMethod = Value then Exit;
  FMethod := Value;
  setModified(True);
end;

//==============================================================================================
procedure TMetaDiscount.setValue(const Value: Extended);
begin
  if FValue = Value then Exit;
  FValue := Value;
  setModified(True);
end;

//==============================================================================================
function TMetaDiscount.LoadXMLNode(var topNode, Node: IXMLNode; paramIndex: Integer = -1): Boolean;
  var
    name, data: string;
begin
  Result := True;

  name := AnsiLowerCase(Node.NodeName);
  data := trim(Node.Text);

  try
    if name = 'value' then begin
      FValue := StrToFloat(data);
      Exit;
    end
    else if name = 'sourceid' then begin
      FSourceID := StrToInt(data);
      Exit;
    end;

  except
    Ferror := ap_err_XML_badData;
    Exit;
  end;

  if name = 'nonadditive' then begin
    FnonAdditive := StrToBool(data);
    Exit;
  end
  else if name = 'method' then begin
    data := AnsiLowerCase(data);
    if data = 'percent'
      then FMethod := DiscMethodPercent
      else FMethod := DiscMethodValue;

    Exit;
  end
  else if name = 'sourcetype' then begin
    data := AnsiLowerCase(data);
    if data = 'card'
      then FSourceType := DiscSrcCard
    else if data = 'manual'
      then FSourceType := DiscSrcManual
    else if data = 'wholesaler'
      then FSourceType := DiscSrcWholeSaler
    else if data = 'vip'
      then FSourceType := DiscSrcVIP;

    Exit;
  end
  else Result := inherited loadXMLNode(Node, Node);
end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
constructor TMetaDiscountList.Create(const AParent: TMetaClass);
begin
  inherited;
end;

//==============================================================================================
destructor TMetaDiscountList.Destroy;
begin
  inherited;
end;

//==============================================================================================
function TMetaDiscountList.Add(const Value: TMetaDiscount): Integer;
begin
  Result := FItems.Add(Value);
end;

//==============================================================================================
function TMetaDiscountList.Add(const AMethod: TDiscountMethod; const AValue: Extended): Integer;
begin
  Result := FItems.Add(TMetaDiscount.Create(Self, AMethod, AValue));
end;

//==============================================================================================
function TMetaDiscountList.getItem(const idx: Integer): TMetaDiscount;
begin
  Result := TMetaDiscount(FItems[idx]);
end;

//==============================================================================================
procedure TMetaDiscountList.setItem(const idx: Integer; const Value: TMetaDiscount);
begin
  FItems[idx] := Value;
end;

//==============================================================================================
function TMetaDiscountList.LoadXMLNode(var topNode, Node: IXMLNode; paramIndex: Integer = -1): Boolean;
  var
    name, data: string;
    d: TMetaDiscount;
begin
  Result := True;

  name := AnsiLowerCase(Node.NodeName);
  data := trim(Node.Text);

  try
    if name = 'discount' then begin
      d := TMetaDiscount.Create(Self);
      FItems.Add(d);
      Result := d.loadXML(node);
      Exit;
    end;

  except
    Ferror := ap_err_XML_badData;
    Exit;
  end;

  Result := inherited loadXMLNode(Node, Node);
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('MetaDiscount', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.

