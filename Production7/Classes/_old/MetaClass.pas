{$I ok_sklad.inc}
unit MetaClass;
{------------------------------------------------------------------------------
 First approach by AP.
 Base class for client/server interconnected classes

 todo: should implement .props['propname'].as... and .propstream['propname'] interfaces
------------------------------------------------------------------------------}

interface

uses
  Classes, Types, XMLDoc, XMLIntf, Serializator, xLngManager;

const
  mcProtoVer = 1; // !!!! don't forget to change it when serialization proto is modified!

  // all codes here should be accompanied by text in errorTexts array below
  // error codes < 100 reserved for MetaClass. descendants should use anything above this
  ap_err_NotModified = 1;
  ap_err_XML_badDate = 2;
  ap_err_XML_badCustomerID = 3;
  ap_err_XML_badTaxes = 4;
  ap_err_XML_badDiscount = 5;
  ap_err_XML_badCurrency = 6;
  ap_err_XML_badTotal = 7;
  ap_err_XML_badID = 8;
  ap_err_XML_emptyDoc = 9;
  ap_err_XML_noPositions = 10;
  ap_err_XML_badProductID = 11;
  ap_err_XML_badProductQuantity = 12;
  ap_err_XML_badProductPrice = 13;
  ap_err_XML_badProductCurrency = 14;
  ap_err_XML_badProductDiscount = 15;
  ap_err_XML_badProductTax = 16;
  ap_err_XML_noPositionInfo = 17;
  ap_err_XML_badCustomer = 18;
  ap_err_XML_badCustomerEmail = 19;
  ap_err_XML_noAddresses = 20;
  ap_err_XML_badAddress = 21;
  ap_err_XML_noData = 22;
  ap_err_XML_unknownTag = 23;
  ap_err_XML_badData = 24;

var
  MetaLangManager: TxLngManager = nil; // global lang manager for Meta-classes to report something in user's native tongue

type
  TMetaClass = class
    private
      FMCChangeCount: Cardinal; // changecount

    protected
      FSaveState: TStringList; // saved state Id for restoring of status quo after the DB rollback on saves, etc
      FID: Integer;
      FName: String;
      FDate, FDateAdded, FDateModified: TDateTime;
      Fnew, Fmodified, FDeleted: Boolean;
      FCorrupted: Boolean; // should be used in child classes to indicate that data is invalid because of load errors resulting in some data to be missing, etc.
      Ferror: Integer;
      FErrorText: String; // we keep FErrorText to be able to retain error description that happened in children processes but affected our behavior
      FMetaParent: TMetaClass;
      FOnChange: TNotifyEvent;

      {try to load only current node and if it is known to this class. returns True if loaded ok.
      used to be called from ancestor classes to parse base-class data
      need not to be public as it should be called via inherited from the ancestor class only
      paramIndex used to check one of node's params as in <Node param1=""... />
      }
      function  loadXMLNode(var topNode, Node: IXMLNode; paramIndex: Integer = -1): Boolean;

      function  getErrorText(const Index: Integer): String; virtual; // this should be overriden by descendant classes to get their own error descriptions

      procedure setModified(const Value: Boolean);
      procedure setID(const Value: Integer); // ID > 0 sets FNew = False
      procedure setName(const Value: String);
      procedure setDate(const Value: TDateTime);

      function  getProp(const Index: String): Variant;
      procedure setProp(const Index: String; const Value: Variant);
      function  getStreamProp(const Index: String): TMemoryStream;
      procedure setStreamProp(const Index: String; const Value: TMemoryStream);

    public
      constructor Create(const AParent: TMetaClass);
      destructor  Destroy; override;
      procedure Clear;

      procedure clearError;
      // FErrorText := AText. if AText is missing then FErrorText := ErrorTexts[ACode]... Adetails appended to FErrorText afterwards
      procedure setError(ACode: Integer; AText: String = ''; ADetails: String = ''; Append: Boolean = False);
      function lastErrorText: String;

      // it collects error messages from all of it's sub-classes, mainly for debugging and human awareness
      function reportProblems(clearErrors: Boolean = True): String;
      function classTechDetails: String; virtual; // internal details for exception/debug reporting

      // freezes/restores as much data to be able to recover from import failure, etc.
      procedure MCSaveState; virtual;
      procedure MCRestoreState; virtual;
      procedure MCClearState; virtual;

      function Serialize(const SO: TSerializator): Boolean; // when called from descendant class
      function deSerialize(const SO: TSerializator; const AMetaParent: TMetaClass): Boolean;
      function LoadXML(var Node: IXMLNode): Boolean; //overload;
      // for use in child's loadXML when there is unknown prop encountered and the parent might be able to process it
      procedure loadXMLCallBack(topNode, cbNode: IXMLNode);

      // mainly used for serializator callbacks
      {function propExists(const Name: String): Boolean;
      function FirstProp: String; // = findfirst
      function NextProp: String;  // = findnext. emptystr if no more props
      }

      property Date: TDateTime read FDate write setDate;
      property DateAdded: TDateTime read FDateAdded;
      property DateModified: TDateTime read FDateModified;
      property Error: Integer read FError;
      property ErrorText: String read FErrorText;
      property ErrorTexts[const Index: Integer]: String read getErrorText;
      property ID: Integer read FID write setID;
      property isCorrupted: Boolean read FCorrupted write FCorrupted;
      property isModified: Boolean read FModified write setModified;
      property isNew: Boolean read FNew;
      property lastError: Integer read Ferror;
      property MetaParent: TMetaClass read FMetaParent write FMetaParent;
      property Name: String read Fname write setName;

      property MCChangeCount: Cardinal read FMCChangeCount;

      property onChange: TNotifyEvent read FOnChange write FOnChange;

      property Prop[const Index: String]: Variant read getProp write setProp;
      property StreamProp[const Index: String]: TMemoryStream read getStreamProp write setStreamProp;
  end;

  //-----------------------------------------------------------------------------------
  TMetaClassList = class(TMetaClass)
    protected
      FItems: TList;

      function  Add(const Value: TMetaClass): Integer;
      procedure loadXMLcallback(const topNode, cbNode: IXMLNode);
      function  LoadXMLNode(var topNode, Node: IXMLNode; paramIndex: Integer = -1): Boolean;

      // property processing
      function  getItem(const idx: Integer): TMetaClass;
      procedure setItem(const idx: Integer; const Value: TMetaClass);
      function  getCount: Integer;
      function  getItemsModified: Boolean;

    public
      constructor Create(const AParent: TMetaClass);
      destructor  Destroy; override;

      procedure Clear;

      function Serialize(const SO: TSerializator): Boolean; // when called from desendant class
      function deSerialize(const SO: TSerializator; const AMetaParent: TMetaClass): Integer;

      property Items[const idx: Integer]: TMetaClass read getItem write setItem; default;
      property Count: Integer read getCount;

      property isItemsModified: Boolean read getItemsModified;
  end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  Variants, SysUtils, strUtils, udebug;

const
  mc_errorTexts: array[0..24] of string = (
    'no error(s)',
    'Save: not saving as document was not modified',  //ap_err_NotModified = 1;
    'XML import: Document date invalid', //ap_err_XML_badDate = 2;
    'XML import: Document Customer ID invalid', //ap_err_XML_badCustomerID = 3;
    'XML import: Document taxes invalid', //ap_err_XML_badTaxes = 4;
    'XML import: Document discount invalid', //ap_err_XML_badDiscount = 5;
    'XML import: Document currency invalid', //ap_err_XML_badCurrency = 6;
    'XML import: Document total invalid', //ap_err_XML_badTotal = 7;
    'error generating ID', //ap_err_XML_badID = 8;
    'XML import: Empty Document', //ap_err_XML_emptyDoc = 9;
    'XML import: no positions', //ap_err_XML_noPositions = 10;
    'XML import: bad Product ID', //ap_err_XML_badProductID = 11;
    'XML import: bad Product Quantity', //ap_err_XML_badProductQuantity = 12;
    'XML import: bad Product Price',    //ap_err_XML_badProductPrice = 13;
    'XML import: bad Product Currency', //ap_err_XML_badProductCurrency = 14;
    'XML import: bad Product Discount', //ap_err_XML_badProductDiscount = 15;
    'XML import: bad Product Tax', //ap_err_XML_badProductTax = 16;
    'XML import: no position Info', //ap_err_XML_noPositionInfo = 17;
    'XML import: no customer info', //ap_err_XML_badCustomer = 18;
    'XML import: bad customer email or error finding local customer', //ap_err_XML_badCustomerEmail = 19;
    'XML import: no addresses supplied', //ap_err_XML_noAddresses = 20;
    'XML import: bad address specified', //ap_err_XML_badAddress = 21;
    'XML import: no data supplied', //ap_err_XML_noData = 22;
    'XML import: unknown tag or element', //ap_err_XML_unknownTag = 23;
    'XML import: bad data format' //ap_err_XML_badData = 24;
  );

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

//==============================================================================================
constructor TMetaClass.Create(const AParent: TMetaClass);
begin
  inherited Create;
  FSaveState := nil;

  Clear;

  FMetaParent := AParent;
end;

//==============================================================================================
destructor TMetaClass.Destroy;
begin
  MCClearState;

  inherited;
end;

//==============================================================================================
procedure TMetaClass.Clear;
begin
  FID := -1;
  FName := '';
  FDate := 0.0;
  FDateAdded := 0.0;
  FDateModified := 0.0;
  FMCChangeCount := 0;
  Fnew := True;
  Fmodified := False;
  Fdeleted := False;
  FCorrupted := False;
  
  clearError;
end;

//==============================================================================================
procedure TMetaClass.clearError;
begin
  setError(0);
end;

//==============================================================================================
procedure TMetaClass.setError(ACode: Integer; AText: String = ''; ADetails: String = ''; Append: Boolean = False);
  var s: String;
begin
  FError := ACode;
  if Append and (FErrorText <> '')
    then s := FErrorText + '; '
    else s := trim(AText);

  if AText = ''
    then try
      if (MetaLangManager <> nil) and (MetaLangManager.GetRS(Self.ClassName, 'err_' + IntTostr(FError), True) <> '')
        then s := s + MetaLangManager.GetRS(Self.ClassName, 'err_' + IntTostr(FError))
        else s := s + ErrorTexts[ACode];

    except
      s := s + ErrorTexts[ACode];
    end;

  if trim(Adetails) <> '' then s := s + '. ' + trim(ADetails);
  FErrorText := s;
end;

//==============================================================================================
function TMetaClass.getErrorText(const Index: Integer): String;
begin
  // error codes < 100 reserved for MetaClass. descendants should use anything above this
  if (Index < 0) or (Index > High(mc_errorTexts))
    then Result := '' // inherited getErrorText(Index)
    else Result := mc_errorTexts[Index];
end;

//==============================================================================================
function TMetaClass.lastErrorText: String;
begin
  Result := FErrorText + '; ' + classTechDetails;
end;

//==============================================================================================
function TMetaClass.reportProblems(clearErrors: Boolean = True): String;
begin
  Result := lastErrorText;
  if clearErrors then clearError;
end;

//==============================================================================================
function TMetaClass.classTechDetails: String; // internal details for exception/debug reporting
begin
  Result := 'Class ' + Self.className + ':';
  if FID <> -1
    then Result := Result + ' ID: ' + IntToStr(FID)
    else Result := Result + ' no ID';

  if FName <> '' then Result := ', Name: "' + FName + '"';
  if FDate <> 0.0 then Result := ', Date: ' + DateToStr(FDate);
  Result := Result + ', Status: (' + ifThen(Fnew, '', 'NOT ') + 'New,' + ifThen(Fmodified, '', ' NOT') + ' modified,' + ifThen(FDeleted, '', ' NOT') + ' deleted)';
end;

//==============================================================================================
procedure TMetaClass.MCSaveState;
begin
  if FSaveState = nil
    then FSaveState := TStringList.Create
    else FSaveState.Clear;

  FSaveState.Add('FNew=' + ifThen(FNew, '1', '0'));
  FSaveState.Add('FModified=' + ifThen(Fmodified, '1', '0'));
  FSaveState.Add('FDeleted=' + ifThen(FDeleted, '1', '0'));
  FSaveState.Add('FID=' + IntToStr(FID));
  FSaveState.Add('FMCChangeCount=' + IntToStr(FMCChangeCount));
  FSaveState.Add('FName=' + FName);
  FSaveState.Add('FDate=' + DateToStr(FDate));
  FSaveState.Add('FDateAdded=' + DateToStr(FDateAdded));
  FSaveState.Add('FDateModified=' + DateToStr(FDateModified));
end;

//==============================================================================================
procedure TMetaClass.MCRestoreState;
begin
  if FSaveState = nil then Exit;

  try
    FNew := StrToBool(FsaveState.Values['FNew']);
    Fmodified := StrToBool(FsaveState.Values['FModified']);
    FDeleted := StrToBool(FsaveState.Values['FDeleted']);
    FID := StrToInt(FsaveState.Values['FID']);
    FMCChangeCount := StrToInt(FsaveState.Values['FMCChangeCount']);
    FName := FsaveState.Values['FName'];
    FDate := StrToDate(FsaveState.Values['FDate']);
    FDateAdded := StrToDate(FsaveState.Values['FDateAdded']);
    FDateModified := StrToDate(FsaveState.Values['FDateModified']);

  except
  end;
end;

//==============================================================================================
procedure TMetaClass.MCClearState;
begin
  if FSaveState <> nil then FSaveState.Free;
  FSaveState := nil;
end;

//==============================================================================================
procedure TMetaClass.setModified(const Value: Boolean);
begin
  FModified := True;
  FDateModified := now;
  inc(FMCChangeCount);

  if Assigned(FonChange) then FonChange(Self);
end;

//==============================================================================================
procedure TMetaClass.setID(const Value: Integer);
begin
  if Value = FID then Exit;

  FID := Value;
  setModified(True);
  FNew := (FID <= 0);
end;

//==============================================================================================
procedure TMetaClass.setName(const Value: String);
begin
  if Value = FName then Exit;

  FName := Value;
  setModified(True);
end;

//==============================================================================================
procedure TMetaClass.setDate(const Value: TDateTime);
begin
  if Value = FDate then Exit;

  FDate := Value;
  setModified(True);
end;

//==============================================================================================
function  TMetaClass.getProp(const Index: String): Variant;
begin
  Result := Null;
end;

//==============================================================================================
procedure TMetaClass.setProp(const Index: String; const Value: Variant);
begin
end;

//==============================================================================================
function  TMetaClass.getStreamProp(const Index: String): TMemoryStream;
begin
  Result := nil;
end;

//==============================================================================================
procedure TMetaClass.setStreamProp(const Index: String; const Value: TMemoryStream);
begin
end;

//==============================================================================================
function TMetaClass.LoadXML(var Node: IXMLNode): Boolean;
  var
    propNode: IXMLNode;
    i: Integer;
begin
  Result := False;

  if (Node = nil) or ((Node.ChildNodes.Count = 0) and (Node.AttributeNodes.Count = 0)) then begin
    setError(ap_err_XML_emptyDoc);
    Exit;
  end;

  if Node.AttributeNodes.Count > 0 then begin
    for i := 0 to Node.AttributeNodes.Count - 1 do
      if not loadXMLNode(Node, Node, i) then begin
        if FError = 0 then Result := True; // for the case when ID was supplied and data was read from DB, so subsequent processing is not needed
        Exit;
      end;
  end;

  propNode := Node.ChildNodes.First;

  repeat // for each prop
    if not loadXMLNode(Node, propNode) then begin
      if FError = 0 then Result := True;
      Exit;
    end;

    if propNode.AttributeNodes.Count > 0 then begin
      for i := 0 to propNode.AttributeNodes.Count - 1 do
        if not loadXMLNode(Node, propNode, i) then begin
          if FError = 0 then Result := True;
          Exit;
        end;
    end;

    try
      propNode := propNode.NextSibling;
    except
      Break;
    end;
  until propNode = nil;

  Result := True;
  setModified(True);
end;

//==============================================================================================
procedure TMetaClass.loadXMLcallback(topNode, cbNode: IXMLNode);
begin
  // just a stub for ignorant descendant classes ;)
  // by default reroute requests to the parent
  if FMetaParent <> nil then FMetaParent.loadXMLcallback(topNode, cbNode);
end;

//==============================================================================================
function TMetaClass.loadXMLNode(var topNode, Node: IXMLNode; paramIndex: Integer = -1): Boolean;
  var
    name, data: String;
    datefmt: TFormatSettings;
begin
  Result := True;
  setError(0);

  //GetLocaleFormatSettings(..., datefmt);
  datefmt.DateSeparator := '-';
  datefmt.TimeSeparator := ':';
  datefmt.ShortDateFormat := 'yyyy-mm-dd';

  name := AnsiLowerCase(Node.NodeName);
  data := Trim(Node.Text);

  try
    if name = 'date' then begin
      Date := strToDateTime(data, datefmt);
      Exit;
    end
    else if name = 'dateadded' then begin
      FDateAdded := strToDateTime(data, datefmt);
      Exit;
    end
    else if name = 'datemodified' then begin
      FDateModified := strToDateTime(data, datefmt);
      Exit;
    end;

  except
    setError(ap_err_XML_badDate, '', '<' + name + '>: ' + data);
    Exit;
  end;

  //..................................................
  if name = 'name' then begin
    Name := data;
    Exit;
  end

  //..................................................
  else if name = 'id' then begin
    try
      ID := StrToInt(data); // ! it can run child SetID() from here
      FNew := False;
      FDeleted := False;
      FModified := True;
      FMCChangeCount := 0;
      Exit;

    except
      setError(ap_err_XML_badID, '', 'ID: ' + data);
      Exit;
    end;
  end;

  Result := False;
  setError(ap_err_XML_unknownTag, '', '<' + name + '> ' + data);
end;

//==============================================================================================
function TMetaClass.Serialize(const SO: TSerializator): Boolean; // when called from descendant class
begin
  Result := False;

  //SO.BeginSection('MC');
  SO.Int := mcProtoVer; // !!! note the proto version constant above: mcsProtoVer !!!
  SO.Int := FID;
  SO.Str := FName;
  SO.DateTime := FDate;
  SO.DateTime := FDateAdded;
  SO.DateTime := FDateModified;
  //SO.EndSection;

  Result := True;
end;

//==============================================================================================
function TMetaClass.deSerialize(const SO: TSerializator; const AMetaParent: TMetaClass): Boolean; // when called from descendant class
  var
    p: Integer;
begin
  Result := False;

  //SO.BeginSection('MC');
  p := SO.Int; if SO.Error > 0 then Exit;
  if p <> mcProtoVer then Exit; // !!! note the proto version constant above: mcsProtoVer !!!

  FID := SO.Int; if SO.Error > 0 then Exit;
  FName := SO.Str; if SO.Error > 0 then Exit;
  FDate := SO.DateTime; if SO.Error > 0 then Exit;
  FDateAdded := SO.DateTime; if SO.Error > 0 then Exit;
  FDateModified := SO.DateTime; if SO.Error > 0 then Exit;
  FmetaParent := AMetaParent;
  //SO.EndSection;

  FNew := False; // maybe should include these also???
  FModified := False;
  FDeleted := False;

  Result := True;
end;

(*
//==============================================================================================
function TMetaClass.Serialize(var Stream: TStream): Boolean;
  var
    ser: TSerializator;
begin
  ser := Tserializator.Create(Stream);
  Result := Serialize(ser);
  ser.Free;
end;

//==============================================================================================
function TMetaClass.deSerialize(const Stream: TStream; const AMetaParent: TMetaClass): Boolean;
  var
    ser: TSerializator;
begin
  ser := Tserializator.Create(Stream);
  Result := deSerialize(ser, AMetaParent);
  ser.Free;
end;
*)

//==============================================================================================
//==============================================================================================
//==============================================================================================
// TMetaClassList
//==============================================================================================
//==============================================================================================
//==============================================================================================
constructor TMetaClassList.Create(const AParent: TMetaClass);
begin
  inherited;
  FItems := TList.Create;
end;

//==============================================================================================
destructor TMetaClassList.Destroy;
begin
  Clear;
  FItems.Free;
  inherited;
end;

//==============================================================================================
procedure TMetaClassList.Clear;
  var
    i: Integer;
begin
  if FItems.Count > 0 then begin
    for i := 0 to FItems.Count - 1 do
      if FItems[i] <> nil then TMetaClass(FItems[i]).Free;

    FItems.Clear;
    isModified := True;
  end;

  inherited;
end;

//==============================================================================================
function TMetaClassList.Add(const Value: TMetaClass): Integer;
begin
  Result := FItems.Add(Value);
  isModified := True;
end;

//==============================================================================================
function TMetaClassList.getItem(const idx: Integer): TMetaClass;
begin
  Result := TMetaClass(FItems[idx]);
end;

//==============================================================================================
procedure TMetaClassList.setItem(const idx: Integer; const Value: TMetaClass);
begin
  FItems[idx] := Value;
end;

//==============================================================================================
function TMetaClassList.getCount: Integer;
begin
  Result := FItems.Count;
end;

//==============================================================================================
function TMetaClassList.getItemsModified: Boolean;
  var
    i: Integer;
begin
  Result := False;

  for i := 0 to FItems.Count - 1 do
    Result := TMetaClass(FItems[i]).isModified or Result;
end;

//==============================================================================================
function TMetaClassList.LoadXMLNode(var topNode, Node: IXMLNode; paramIndex: Integer = -1): Boolean;
begin
  Result := False;
  setError(ap_err_XML_badData, '', 'TMetaClassList stub was called');
end;

//==============================================================================================
procedure TMetaClassList.loadXMLcallback(const topNode, cbNode: IXMLNode);
begin
  // by default reroute requests to parent of list
  if FMetaParent <> nil then FMetaParent.loadXMLcallback(topNode, cbNode);
end;

//----------------------------------------------------------------------------------------------
const
  mclProtoVer = 1; // !!!! don't forget to change it when serialization proto is modified!

//==============================================================================================
function TMetaClassList.Serialize(const SO: TSerializator): Boolean; // when called from desendant class
begin
  Result := False;

  //SO.BeginSection('MC');
  if not inherited Serialize(SO) then Exit;

  SO.Int := mclProtoVer; // !!! note the proto version constant above: mcsProtoVer !!!
  SO.Int := FItems.Count;
  //SO.EndSection;

  Result := True;
end;

//==============================================================================================
// when called from desendant class. Returns count of new arrived FItems or -1 if error
function TMetaClassList.deSerialize(const SO: TSerializator; const AMetaParent: TMetaClass): Integer;
  var
    p: Integer;
begin
  Result := -1;

  //SO.BeginSection('MC');
  if not inherited deSerialize(SO, AMetaParent) then Exit;

  p := SO.Int; if SO.Error > 0 then Exit;
  if p <> mclProtoVer then Exit; // !!! note the proto version constant above: mcsProtoVer !!!

  p := SO.Int; if SO.Error > 0 then Exit;
  if p < 0 then Exit;

  // as this is a virtual class then probably it is a bad idea to make nil positions. additions should be resolved at the higher level
  //FItems.Count := FItems.Count + p;
  //SO.EndSection;

  Result := p;
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('MetaClass', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.

