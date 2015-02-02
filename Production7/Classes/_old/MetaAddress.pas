{$I ok_sklad.inc}
unit MetaAddress;

interface

uses
  MetaClass, ExtCtrls,
  XMLDoc, XMLIntf, Classes;

type
  TMetaCountry = class(TMetaClass)
    protected
      F2, F3: String; // 2&3 letter ids
      FFlag: TImage;

    public
      constructor Create(const AParent: TMetaClass);
      destructor Destroy; override;

      procedure set2(const Value: String);
      procedure set3(const Value: String);

      property Name3: String read F3 write set3;
      property Name2: String read F2 write set2;
  end;

  //----------------------------------------------------------------------
  //----------------------------------------------------------------------
  //----------------------------------------------------------------------
  TMetaAddress = class(TMetaClass)
    protected
      FCountry: TMetaCountry;
      FPostCode, FDistrict, FCity, FStreet: String;
      FBuilding, FFloor, FRoom: String;
      FPhones, FFaxes, FNotes: String;

      procedure setBuilding(const Value: String);
      procedure setCity(const Value: String);
      procedure setDistrict(const Value: String);
      procedure setFloor(const Value: String);
      procedure setRoom(const Value: String);
      procedure setPostCode(const Value: String);
      procedure setStreet(const Value: String);
      procedure setNotes(const Value: String);
      procedure setPhones(const Value: String);
      procedure setFaxes(const Value: String);

      function LoadXMLNode(var topNode, node: IXMLNode; paramIndex: Integer = -1): Boolean;

    public
      constructor Create(const AParent: TMetaClass);
      destructor Destroy; override;

      property Building: String read FBuilding write setBuilding;
      property City: String read FCity write setCity;
      property Country: TMetaCountry read FCountry;
      property District: String read FDistrict write setDistrict;
      property Floor: String read FFloor write setFloor;
      property postCode: String read FpostCode write setpostCode;
      property Room: String read FRoom write setRoom;
      property Street: String read FStreet write setStreet;
      property Notes: String read FNotes write setNotes;
      property Phones: String read FPhones write setPhones;
      property Faxes: String read FFaxes write setFaxes;
  end;

//========================================================================
//========================================================================
//========================================================================
//========================================================================
implementation

uses
  udebug, SysUtils;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = 'Meta';

//==============================================================================================
//==============================================================================================
//==============================================================================================
constructor TMetaCountry.Create(const AParent: TMetaClass);
begin
  inherited;
  FFlag := nil;
end;

//==============================================================================================
destructor TMetaCountry.Destroy;
begin
  if FFlag <> nil then FFlag.Free;
  inherited;
end;

//==============================================================================================
procedure TMetaCountry.set2(const Value: String);
begin
  if (F2 = Value) or (length(Value) <> 2) then Exit;
  F2 := Value;
  isModified := True;
end;

//==============================================================================================
procedure TMetaCountry.set3(const Value: String);
begin
  if (F3 = Value) or (length(Value) <> 3) then Exit;
  F3 := Value;
  setModified(True);
end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
constructor TMetaAddress.Create(const AParent: TMetaClass);
begin
  inherited;
  Fcountry := TMetaCountry.Create(Self);
end;

//==============================================================================================
destructor TMetaAddress.Destroy;
begin
  inherited;
  Fcountry.Destroy;
end;

//==============================================================================================
procedure TMetaAddress.setCity(const Value: String);
begin
  if FCity = trim(Value) then Exit;
  FCity := trim(Value);
  setModified(True);
end;

//==============================================================================================
procedure TMetaAddress.setDistrict(const Value: String);
begin
  if FDistrict = trim(Value) then Exit;
  FDistrict := trim(Value);
  setModified(True);
end;

//==============================================================================================
procedure TMetaAddress.setStreet(const Value: String);
begin
  if FStreet = trim(Value) then Exit;
  FStreet := trim(Value);
  setModified(True);
end;

//==============================================================================================
procedure TMetaAddress.setBuilding(const Value: String);
begin
  if FBuilding = Value then Exit;
  FBuilding := Value;
  setModified(True);
end;

//==============================================================================================
procedure TMetaAddress.setFloor(const Value: String);
begin
  if FFloor = Value then Exit;
  FFloor := Value;
  setModified(True);
end;

//==============================================================================================
procedure TMetaAddress.setpostCode(const Value: String);
begin
  if FpostCode = trim(Value) then Exit;
  FpostCode := trim(Value);
  setModified(True);
end;

//==============================================================================================
procedure TMetaAddress.setRoom(const Value: String);
begin
  if FRoom = Value then Exit;
  FRoom := Value;
  setModified(True);
end;

//==============================================================================================
procedure TMetaAddress.setNotes(const Value: String);
begin
  if FNotes = trim(Value) then Exit;
  FNotes := trim(Value);
  setModified(True);
end;

//==============================================================================================
procedure TMetaAddress.setPhones(const Value: String);
begin
  if FPhones = trim(Value) then Exit;
  FPhones := trim(Value);
  setModified(True);
end;

//==============================================================================================
procedure TMetaAddress.setFaxes(const Value: String);
begin
  if FFaxes = trim(Value) then Exit;
  FFaxes := trim(Value);
  setModified(True);
end;

//==============================================================================================
function TMetaAddress.LoadXMLNode(var topNode, Node: IXMLNode; paramIndex: Integer = -1): Boolean;
  var
    name, data: string;
begin
  Result := True;

  name := AnsiLowerCase(Node.NodeName);
  data := trim(Node.Text);

  try
    if name = 'countrycode' then begin
      FCountry.Name2 := data; //try all. it will select proper itself
      FCountry.Name3 := data;
      Exit;
    end
    else if name = 'country' then begin
      FCountry.Name := data; // full name
      Exit;
    end
    else if name = 'statecode' then begin
      FDistrict := data;
      Exit;
    end
    else if name = 'city' then begin
      FCity := data;
      Exit;
    end
    else if name = 'postcode' then begin
      FPostCode := data;
      Exit;
    end
    else if name = 'district' then begin
      FDistrict := data;
      Exit;
    end
    else if name = 'street' then begin
      FStreet := data;
      Exit;
    end
    else if name = 'building' then begin
      FBuilding := data;
      Exit;
    end
    else if name = 'floor' then begin
      FFloor := data;
      Exit;
    end
    else if name = 'room' then begin
      FRoom := data;
      Exit;
    end
    else if name = 'phones' then begin
      FPhones := data;
      Exit;
    end
    else if name = 'faxes' then begin
      FFaxes := data;
      Exit;
    end
    else if name = 'notes' then begin
      FNotes := data;
      Exit;
    end
    else begin
      Result := inherited loadXMLnode(topNode, Node);
      Exit;
    end;

  finally
  end;
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('MetaAddress', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.

