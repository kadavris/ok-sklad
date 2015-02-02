{$I ok_sklad.inc}
unit MetaTax;

interface

uses
  MetaClass, XMLDoc, XMLIntf, 
  Classes;

type
  TTaxMethod = (TaxMethodPercent, TaxMethodValue);

  TMetaTax = class(TMetaClass)
    protected
      FMethod: TTaxMethod;
      FValue: Extended;

      function LoadXMLNode(var topNode, Node: IXMLNode; paramIndex: Integer = -1): Boolean; override;

    public
      constructor Create(const AParent: TMetaClass); overload; override;
      constructor Create(const AParent: TMetaClass; const AMethod: TTaxMethod; const AValue: Extended); overload;
      //destructor Destroy; override;
      procedure Clear; override;

      property Method: TTaxMethod read FMethod write FMethod;
      property Value: Extended read FValue write FValue;
  end;

  //-----------------------------------------------------------------------
  TMetaTaxList = class(TMetaClassList)
    protected
      function LoadXMLNode(var topNode, Node: IXMLNode; paramIndex: Integer = -1): Boolean; override;

    public
      constructor Create(const AParent: TMetaClass); override;
      //destructor Destroy; override;
      //procedure Clear; override;

      function Add(const Value: TMetaTax): Integer; reintroduce; overload;
      function Add(const AMethod: TTaxMethod; const AValue: Extended): Integer; reintroduce; overload;

      // property processing
      function  getItem(const idx: Integer): TMetaTax; reintroduce;
      procedure setItem(const idx: Integer; const Value: TMetaTax); reintroduce;

      property Items[const idx: Integer]: TMetaTax read getItem write setItem; default;
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
constructor TMetaTax.Create(const AParent: TMetaClass);
begin
  inherited;
end;

//==============================================================================================
procedure TMetaTax.Clear;
begin
  FMethod := TaxMethodPercent;
  FValue := 0.0;
end;

//==============================================================================================
constructor TMetaTax.Create(const AParent: TMetaClass; const AMethod: TTaxMethod; const AValue: Extended);
begin
  Create(AParent);

  FMethod := AMethod;
  FValue := AValue;
end;

//==============================================================================================
function TMetaTax.LoadXMLNode(var topNode, Node: IXMLNode; paramIndex: Integer = -1): Boolean;
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
    end;

  except
    Ferror := ap_err_XML_badData;
    Exit;
  end;

  if name = 'method' then begin
    data := AnsiLowerCase(data);
    if data = 'percent'
      then FMethod := TaxMethodPercent
      else FMethod := TaxMethodValue;

    Exit;
  end
  else Result := inherited loadXMLNode(Node, Node);
end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
constructor TMetaTaxList.Create(const AParent: TMetaClass);
begin
  inherited;
end;

{//==============================================================================================
destructor TMetaTaxList.Destroy;
begin
  Clear;

  inherited;
end;
}

//==============================================================================================
function TMetaTaxList.Add(const Value: TMetaTax): Integer;
begin
  Result := FItems.Add(Value);
  Value.MetaParent := Self;
end;

//==============================================================================================
function TMetaTaxList.Add(const AMethod: TTaxMethod; const AValue: Extended): Integer;
begin
  Result := FItems.Add(TMetaTax.Create(Self, AMethod, AValue));
end;

//==============================================================================================
function TMetaTaxList.getItem(const idx: Integer): TMetaTax;
begin
  Result := TMetaTax(FItems[idx]);
end;

//==============================================================================================
procedure TMetaTaxList.setItem(const idx: Integer; const Value: TMetaTax);
begin
  FItems[idx] := Value;
end;

//==============================================================================================
function TMetaTaxList.LoadXMLNode(var topNode, Node: IXMLNode; paramIndex: Integer = -1): Boolean;
  var
    name, data: string;
    t: TMetaTax;
begin
  Result := True;

  name := AnsiLowerCase(Node.NodeName);
  data := trim(Node.Text);

  try
    if name = 'tax' then begin
      t := TMetaTax.Create(Self);
      FItems.Add(t);
      Result := t.loadXML(node);
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
  DEBUG_unit_ID := debugRegisterUnit('MetaTax', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.

