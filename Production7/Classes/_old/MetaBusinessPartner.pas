{$I ok_sklad.inc}
unit MetaBusinessPartner;

interface

uses
  MetaClass, MetaAddress,
  XMLDoc, XMLIntf, Classes;

type
  MetaBPTypes = (MetaBPTypeCompany = 0, MetaBPTypePerson = 1, MetaBPTypeEmployee = 2, MetaBPTypeOwned = 3);
  MetaBPKinds = (MetaBPKindSupplier = 0, MetaBPKindClient = 1, MetaBPKindBarter = 3);
  MetaPersonPosTypes = (MetaPersonPosTypeChief = 0, MetaPersonPosTypeAccountant = 1, MetaPersonPosTypeOther = 2);

  TMetaBusinessPartner = class;

  TMetaPerson = class(TMetaClass)
    protected
      FSurname, FLastName: String; // FName is in TMetaClass
      FPhones: TStringList;
      FBirthday: TDateTime;
      FPosType: MetaPersonPosTypes;
      FCompanyID, FAddressID: Integer; // it's in DB

      // these are loaded on demand
      FCompany: TMetaBusinessPartner;
      FAddress: TMetaAddress;

    public
      constructor Create(const AParent: TMetaClass);
      destructor Destroy; override;

      procedure Clear;

      function LoadXMLNode(var topNode, Node: IXMLNode; paramIndex: Integer = -1): Boolean;

      property AddressID: Integer read FAddressID write FAddressID;
      property CompanyID: Integer read FCompanyID write FCompanyID;
      property Birthday: TDateTime read FBirthday write FBirthday;
      property Lastname: String read FLastname write FLastname;
      property Phones: TStringList read FPhones;
      property PosType: MetaPersonPosTypes read FPosType write FPosType;
      property Surname: String read FSurname write FSurname;
  end;

  //--------------------------------------------------------------
  TMetaPersonList = class(TMetaClassList)
    protected
      // property processing
      function getItem(const idx: Integer): TMetaPerson;
      procedure setItem(const idx: Integer; const Value: TMetaPerson);

    public
      constructor Create(const AParent: TMetaClass);
      destructor Destroy; override;

      function Add(const Value: TMetaPerson): Integer;

      property Items[const idx: Integer]: TMetaPerson read getItem write setItem; default;
  end; // TMetaPersonList

  //----------------------------------------------------------------
  //----------------------------------------------------------------
  //----------------------------------------------------------------
  TMetaBusinessPartner = class(TMetaClass)
    protected
      FType: Integer; // 0-Юридические лица, 1-Физические лица, 2-Служащие, 3-Наши предприятия
      FKind: Integer; // 0-Поставщик, 1-клиент, 2-микс
      FINN, FOKPO, FKPP, FCertNum: String;
      FPhones, FEMail, FWWW, FFax: String;
      FNotes: String;

      FPriceCategoryID: Integer;
      FVATPayer: Boolean;

      // personID data for physical person
      FPersonIDNum, FPersonIDSeries, FPersonIDName, FPersonIDIssuer: String;
      FPersonIDDate: TDateTime;
      FBirthDate: TDateTime;
      FPositionType: Integer; // 0-chief, 1-Partner, 2-Other (FPosition)
      FPosition: String;
      FUserID: Integer; // ID польз для сотрудника
      FFullName: String;

      FAddress, FjurAddress: TMetaAddress;
      FContactPerson: TMetaPersonList;

      FStartSaldo: Double;
      FStartSaldoDate: TDateTime;

      function LoadXMLNode(var topNode, Node: IXMLNode; paramIndex: Integer = -1): Boolean;

      procedure setType(const Value: Integer);
      procedure setKind(const Value: Integer);
      procedure setINN(const Value: String);
      procedure setOKPO(const Value: String);
      procedure setKPP(const Value: String);
      procedure setCertNum(const Value: String);
      procedure setPhones(const Value: String);
      procedure setEMail(const Value: String);
      procedure setWWW(const Value: String);
      procedure setFax(const Value: String);
      procedure setNotes(const Value: String);
      procedure setPriceCategoryID(const Value: Integer);
      procedure setVATPayer(const Value: Boolean);

      procedure setPersonIDNum(const Value: String);
      procedure setPersonIDSeries(const Value: String);
      procedure setPersonIDName(const Value: String);
      procedure setPersonIDIssuer(const Value: String);
      procedure setPersonIDDate(const Value: TDateTime);
      procedure setBirthDate(const Value: TDateTime);
      procedure setPositionType(const Value: Integer);
      procedure setPosition(const Value: String);
      procedure setUserID(const Value: Integer);
      procedure setFullName(const Value: String);

      procedure setStartSaldo(const Value: Double);
      procedure setStartSaldoDate(const Value: TDateTime);

    public
      constructor Create(const AParent: TMetaClass);
      destructor Destroy; override;

      procedure Clear;

      procedure loadXMLcallback(const topNode, cbNode: IXMLNode);

      // !!!!!!!! INCOMPLETE !!!!!!!!
      function loadData(const AID: Integer): Boolean;

      function saveData: boolean;

      property bpType: Integer read FType write setType;
      property Kind: Integer read FKind write setKind;
      property INN: String read FINN write setINN;
      property OKPO: String read FOKPO write setOKPO;
      property KPP: String read FKPP write setKPP;
      property CertNum: String read FCertNum write setCertNum;
      property Phones: String read FPhones write setPhones;
      property EMail: String read FEMail write setEMail;
      property WWW: String read FWWW write setWWW;
      property Fax: String read FFax write setFax;
      property Notes: String read FNotes write setNotes;
      property PriceCategoryID: Integer read FPriceCategoryID write setPriceCategoryID;
      property VATPayer: Boolean read FVATPayer write setVATPayer;

      property PersonIDNum: String read FPersonIDNum write setPersonIDNum;
      property PersonIDSeries: String read FPersonIDSeries write setPersonIDSeries;
      property PersonIDName: String read FPersonIDName write setPersonIDName;
      property PersonIDIssuer: String read FPersonIDIssuer write setPersonIDIssuer;
      property PersonIDDate: TDateTime read FPersonIDDate write setPersonIDDate;
      property BirthDate: TDateTime read FBirthDate write setBirthDate;
      property PositionType: Integer read FPositionType write setPositionType;
      property Position: String read FPosition write setPosition;
      property UserID: Integer read FUserID write setUserID;
      property FullName: String read FFullName write setFullName; // for companies
      property SurName: String read FFullName write setFullName; // for persons
      property FirstName: String read FName write setName; // for persons

      property Address: TMetaAddress read FAddress;
      property jurAddress: TMetaAddress read FjurAddress;
      property ContactPerson: TMetaPersonList read FContactPerson;

      property StartSaldo: Double read FStartSaldo write setStartSaldo;
      property StartSaldoDate: TDateTime read FStartSaldoDate write setStartSaldoDate;
  end;

  //--------------------------------------------------------------
  TMetaBusinessPartnerList = class(TMetaClassList)
    protected
      // property processing
      function getItem(const idx: Integer): TMetaBusinessPartner;
      procedure setItem(const idx: Integer; const Value: TMetaBusinessPartner);

    public
      constructor Create(const AParent: TMetaClass);
      destructor Destroy; override;

      function Add(const Value: TMetaBusinessPartner): Integer;

      property Items[const idx: Integer]: TMetaBusinessPartner read getItem write setItem; default;
  end; // TMetaBusinessPartnerList

//==============================================================================================
//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  DB, Dialogs, sysUtils, ClientData, prFun, prConst, ssCallbackConst, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

//==============================================================================================
constructor TMetaPersonList.Create(const AParent: TMetaClass);
begin
  inherited;
end;

//==============================================================================================
destructor TMetaPersonList.Destroy;
begin
  inherited;
end;

//==============================================================================================
function TMetaPersonList.Add(const Value: TMetaPerson): Integer;
begin
  Result := FItems.Add(Value);
  setModified(True);
end;

//==============================================================================================
function TMetaPersonList.getItem(const idx: Integer): TMetaPerson;
begin
  Result := TMetaPerson(FItems[idx]);
end;

//==============================================================================================
procedure TMetaPersonList.setItem(const idx: Integer; const Value: TMetaPerson);
begin
  FItems[idx] := Value;
  setModified(True);
end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
//==============================================================================================
constructor TMetaPerson.Create(const AParent: TMetaClass);
begin
  inherited;
  FPhones := TStringList.Create;
  FCompany := nil;
  FAddress := nil;

  Clear;
end;

//==============================================================================================
procedure TMetaPerson.Clear;
begin
  inherited;
  FSurname := '';
  FLastName := '';
  FPhones.Clear;
  FCompanyID := -1;
  FAddressID := -1;

  if FCompany <> nil then FCompany.Destroy;
  if FAddress <> nil then FAddress.Destroy;
end;

//==============================================================================================
destructor TMetaPerson.Destroy;
begin
  FPhones.Free;
  Clear;
  inherited;
end;

//==============================================================================================
function TMetaPerson.LoadXMLNode(var topNode, Node: IXMLNode; paramIndex: Integer = -1): Boolean;
  var
    name, data: string;
    datefmt: TFormatSettings;
begin
  Result := True;

  name := AnsiLowerCase(Node.NodeName);
  data := trim(Node.Text);

  //GetLocaleFormatSettings(..., datefmt);
  datefmt.DateSeparator := '-';
  datefmt.TimeSeparator := ':';
  datefmt.ShortDateFormat := 'yyyy-mm-dd';

  try
    if name = 'birthday' then begin
      Birthday := strToDateTime(data, datefmt);
      Exit;
    end;

  except
    Ferror := ap_err_XML_badDate;
    Exit;
  end;

  try
    if name = 'companyid' then begin
      FCompanyID := StrToint(data);
      Exit;
    end
    else if name = 'addressid' then begin
      FAddressID := StrToint(data);
      Exit
    end;

  except
    Ferror := ap_err_XML_badData;
    Exit;
  end;

  if name = 'surname' then begin
    FSurname := data;
  end
  else if name = 'lastname' then begin
    FLastName := data;
  end
  else if name = 'phones' then begin
    FPhones.Text := data;
  end
  else if name = 'postype' then begin // MetaPersonPosTypeChief = 0, MetaPersonPosTypeAccountant = 1, MetaPersonPosTypeOther = 2
    if data = 'chief' then FPosType := MetaPersonPosTypeChief
    else if data = 'accountant' then FPosType := MetaPersonPosTypeAccountant
    else if (data = 'other') or (data = 'employee') then FPosType := MetaPersonPosTypeOther;
  end
  else if name = 'address' then begin
    if FAddress = nil then FAddress.Create(Self);
    FAddress.loadXML(Node);
  end
  else Result := inherited loadXMLNode(Node, Node);
end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
//==============================================================================================
//==============================================================================================
constructor TMetaBusinessPartnerList.Create(const AParent: TMetaClass);
begin
  inherited;
end;

//==============================================================================================
destructor TMetaBusinessPartnerList.Destroy;
begin
  inherited;
end;

//==============================================================================================
function TMetaBusinessPartnerList.getItem(const idx: Integer): TMetaBusinessPartner;
begin
  Result := TMetaBusinessPartner(FItems[idx]);
end;

//==============================================================================================
procedure TMetaBusinessPartnerList.setItem(const idx: Integer; const Value: TMetaBusinessPartner);
begin
  FItems[idx] := Value;
end;

//==============================================================================================
function TMetaBusinessPartnerList.Add(const Value: TMetaBusinessPartner): Integer;
begin
  Result := FItems.Add(Value);
  setModified(True);
end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
//==============================================================================================
constructor TMetaBusinessPartner.Create(const AParent: TMetaClass);
begin
  inherited;

  FAddress := TMetaAddress.Create(Self);
  FjurAddress := TMetaAddress.Create(Self);
  FContactPerson := TMetaPersonList.Create(Self);

  Clear;
end;

//==============================================================================================
procedure TMetaBusinessPartner.Clear;
begin
  inherited;

  FType := -1;
  FKind := -1;
  FINN := '';
  FOKPO := '';
  FKPP := '';
  FCertNum := '';
  FPhones := '';
  FEMail := '';
  FWWW := '';
  FFax := '';
  FNotes := '';
  FPriceCategoryID := -1;
  FVATPayer := False;

  FPersonIDNum := '';
  FPersonIDSeries := '';
  FPersonIDName := '';
  FPersonIDIssuer := '';
  FPersonIDDate := 0.0;
  FBirthDate := 0.0;
  FPositionType := -1;
  FPosition := '';
  FUserID := -1;
  FFullName := '';
  FPersonIDDate := 0.0;

  FAddress.Clear;
  FjurAddress.Clear;
  FContactPerson.Clear;

  FStartSaldo := 0.0;
  FStartSaldoDate := 0.0;
end;

//==============================================================================================
destructor TMetaBusinessPartner.Destroy;
begin
  FAddress.Destroy;
  FjurAddress.Destroy;
  FContactPerson.Destroy;
  inherited;
end;

//==============================================================================================
procedure TMetaBusinessPartner.setType(const Value: Integer);
begin
  if FType = Value then Exit;
  FType := Value;
  setModified(True);
end;

//==============================================================================================
procedure TMetaBusinessPartner.setKind(const Value: Integer);
begin
  if FKind = Value then Exit;
  FKind := Value;
  setModified(True);
end;

//==============================================================================================
procedure TMetaBusinessPartner.setINN(const Value: String);
begin
  if FINN = Value then Exit;
  FINN := Value;
  setModified(True);
end;

//==============================================================================================
procedure TMetaBusinessPartner.setOKPO(const Value: String);
begin
  if FOKPO = Value then Exit;
  FOKPO := Value;
  setModified(True);
end;

//==============================================================================================
procedure TMetaBusinessPartner.setKPP(const Value: String);
begin
  if FKPP = Value then Exit;
  FKPP := Value;
  setModified(True);
end;

//==============================================================================================
procedure TMetaBusinessPartner.setCertNum(const Value: String);
begin
  if FCertNum = Value then Exit;
  FCertNum := Value;
  setModified(True);
end;

//==============================================================================================
procedure TMetaBusinessPartner.setPhones(const Value: String);
begin
  if FPhones = Value then Exit;
  FPhones := Value;
  setModified(True);
end;

//==============================================================================================
procedure TMetaBusinessPartner.setEMail(const Value: String);
begin
  if FEMail = Value then Exit;
  FEMail := Value;
  setModified(True);
end;

//==============================================================================================
procedure TMetaBusinessPartner.setWWW(const Value: String);
begin
  if FWWW = Value then Exit;
  FWWW := Value;
  setModified(True);
end;

//==============================================================================================
procedure TMetaBusinessPartner.setFax(const Value: String);
begin
  if FFax = Value then Exit;
  FFax := Value;
  setModified(True);
end;

//==============================================================================================
procedure TMetaBusinessPartner.setNotes(const Value: String);
begin
  if FNotes = Value then Exit;
  FNotes := Value;
  setModified(True);
end;

//==============================================================================================
procedure TMetaBusinessPartner.setPriceCategoryID(const Value: Integer);
begin
  if FPriceCategoryID = Value then Exit;
  FPriceCategoryID := Value;
  setModified(True);
end;

//==============================================================================================
procedure TMetaBusinessPartner.setVATPayer(const Value: Boolean);
begin
  if FVATPayer = Value then Exit;
  FVATPayer := Value;
  setModified(True);
end;

//==============================================================================================
procedure TMetaBusinessPartner.setPersonIDNum(const Value: String);
begin
  if FPersonIDNum = Value then Exit;
  FPersonIDNum := Value;
  setModified(True);
end;

//==============================================================================================
procedure TMetaBusinessPartner.setPersonIDSeries(const Value: String);
begin
  if FPersonIDSeries = Value then Exit;
  FPersonIDSeries := Value;
  setModified(True);
end;

//==============================================================================================
procedure TMetaBusinessPartner.setPersonIDName(const Value: String);
begin
  if FPersonIDName = Value then Exit;
  FPersonIDName := Value;
  setModified(True);
end;

//==============================================================================================
procedure TMetaBusinessPartner.setPersonIDIssuer(const Value: String);
begin
  if FPersonIDIssuer = Value then Exit;
  FPersonIDIssuer := Value;
  setModified(True);
end;

//==============================================================================================
procedure TMetaBusinessPartner.setPersonIDDate(const Value: TDateTime);
begin
  if FPersonIDDate = Value then Exit;
  FPersonIDDate := Value;
  setModified(True);
end;

//==============================================================================================
procedure TMetaBusinessPartner.setBirthDate(const Value: TDateTime);
begin
  if FBirthDate = Value then Exit;
  FBirthDate := Value;
  setModified(True);
end;

//==============================================================================================
procedure TMetaBusinessPartner.setPositionType(const Value: Integer);
begin
  if FPositionType = Value then Exit;
  FPositionType := Value;
  setModified(True);
end;

//==============================================================================================
procedure TMetaBusinessPartner.setPosition(const Value: String);
begin
  if FPosition = Value then Exit;
  FPosition := Value;
  setModified(True);
end;

//==============================================================================================
procedure TMetaBusinessPartner.setUserID(const Value: Integer);
begin
  if FUserID = Value then Exit;
  FUserID := Value;
  setModified(True);
end;

//==============================================================================================
procedure TMetaBusinessPartner.setFullName(const Value: String);
begin
  if FFullName = Value then Exit;
  FFullName := Value;
  setModified(True);
end;

//==============================================================================================
procedure TMetaBusinessPartner.setStartSaldo(const Value: Double);
begin
  if FStartSaldo = Value then Exit;
  FStartSaldo := Value;
  setModified(True);
end;

//==============================================================================================
procedure TMetaBusinessPartner.setStartSaldoDate(const Value: TDateTime);
begin
  if FStartSaldoDate = Value then Exit;
  FStartSaldoDate := Value;
  setModified(True);
end;

//==============================================================================================
function TMetaBusinessPartner.loadData(const AID: Integer): Boolean;
begin
  Result := True;

// !!!!!!!! INCOMPLETE !!!!!!!!

  with newDataSet do
  try
    try
      ProviderName := 'pKAgent_Get';
      FetchParams;
      Params.ParamByName('KAID').AsInteger := AID;
      Open;

      if not IsEmpty then begin
        Self.Name := Fieldbyname('Name').asstring;
        bpType := fieldbyname('ktype').AsInteger;
        Kind := fieldbyname('kakind').AsInteger;

        if fieldbyname('birthdate').AsDateTime <> 0.0
          then BirthDate := fieldbyname('birthdate').AsDateTime;

        FullName := fieldbyname('FullName').AsString;
        INN := fieldbyname('INN').AsString;
        OKPO := fieldbyname('OKPO').AsString;
        KPP := fieldbyname('kpp').AsString;
        CertNum := fieldbyname('CertNum').AsString;
        Phones := fieldbyname('Phone').AsString;
        Email := fieldbyname('Email').AsString;
        WWW := fieldbyname('WWW').AsString;
        Fax := fieldbyname('Fax').AsString;

        Notes := fieldbyname('Notes').AsString;
        VATPayer := (fieldbyname('ndspayer').AsInteger = 1);
        Position := FieldByName('job').AsString;

        if FieldByName('jobtype').IsNull
          then PositionType := 0
          else PositionType := FieldByName('jobtype').AsInteger;

        if not FieldByName('ptypeid').IsNull
          then PriceCategoryID := FieldByName('ptypeid').AsInteger;

        if not FieldByName('startsaldo').IsNull then begin
          StartSaldoDate := FieldByName('startsaldodate').AsDateTime;
          StartSaldo := FieldByName('startsaldo').AsCurrency;
        end;

        if not FieldByName('userid').IsNull
          then UserID := FieldByName('userid').AsInteger;

        ID := AID;
        FNew := False;
        isModified := False;

      end; //if not IsEmpty

      Close;

    except
      Result := False;
    end;

  finally
    Free;
  end;

// !!!!!!!! INCOMPLETE !!!!!!!!

end;

//==============================================================================================
function TMetaBusinessPartner.saveData: Boolean;
  var
    NewRecord, FSetDef: Boolean;
    FLegalAddrID, FRealAddrID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TMetaBusinessPartner.SaveData') else _udebug := nil;{$ENDIF}

  Result := False;
  clearError;

  if not isNew and not isModified then begin
    Exit;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;

  with newDataSet do
    try
      TrStart;

      try
        NewRecord := (ID <= 0);

        if NewRecord then FID := GetMaxID(dmData.SConnection, 'kagent', 'kaid');

        FSetDef := False;
        if NewRecord and (FType = bpTypeOurCompany) then begin
          ProviderName := 'pKAgent_GetFirmsCount';
          Open;
          FSetDef := Fields[0].AsInteger = 0;
          Close;
        end;

        if (FType = bpTypeEmployee) and (FUserID <> -1) then begin
          ProviderName := 'pKAgent_UpdUser';
          FetchParams;
          Params.ParamByName('userid').AsInteger := FUserID;
          Execute;
        end;

        if NewRecord
          then ProviderName := 'pKAgent_Ins'
          else ProviderName := 'pKAgent_Upd';

        FetchParams;
        Params.ParamByName('KAID').AsInteger := ID;
        Params.ParamByName('ktype').AsInteger := FType;
        Params.ParamByName('kakind').AsInteger := FKind;
        Params.ParamByName('Name').AsString := FName;

        if FBirthDate > 0.0
          then Params.ParamByName('birthdate').AsDateTime := FBirthDate
          else begin
            Params.ParamByName('birthdate').DataType := ftDateTime;
            Params.ParamByName('birthdate').Clear;
          end;

        Params.ParamByName('FullName').AsString := FFullName;
        Params.ParamByName('INN').AsString := FINN;
        Params.ParamByName('OKPO').AsString := FOKPO;
        Params.ParamByName('kpp').AsString := FKPP;
        Params.ParamByName('CertNum').AsString := FCertNum;
        Params.ParamByName('Phone').AsString := Trim(FPhones);
        Params.ParamByName('EMail').AsString := Trim(FEMail);
        Params.ParamByName('WWW').AsString := Trim(FWWW);
        Params.ParamByName('Fax').AsString := Trim(FFax);
        Params.ParamByName('Address').AsString := Trim(FAddress.Street);
        Params.ParamByName('Country').AsString := Trim(FAddress.Country.Name);
        Params.ParamByName('District').AsString := Trim(FAddress.District);
        Params.ParamByName('City').AsString := Trim(FAddress.City);
        Params.ParamByName('PostIndex').AsString := Trim(Faddress.PostCode);
        Params.ParamByName('Notes').AsString := Trim(FNotes);

        if FUserID = -1 then begin
          Params.ParamByName('userid').DataType := ftInteger;
          Params.ParamByName('userid').Clear;
        end
        else Params.ParamByName('userid').AsInteger := FUserID;

        Params.ParamByName('deleted').AsInteger := 0;
        Params.ParamByName('ndspayer').AsInteger := BoolToInt(FVATPayer);

        if FPriceCategoryID = -1 then begin
          Params.ParamByName('ptypeid').DataType := ftInteger;
          Params.ParamByName('ptypeid').Clear;
        end
        else Params.ParamByName('ptypeid').AsInteger := FPriceCategoryID;

        Params.ParamByName('job').DataType := ftString;
        Params.ParamByName('job').Clear;
        Params.ParamByName('jobtype').DataType := ftInteger;
        Params.ParamByName('jobtype').Clear;

        if FType = bpTypeEmployee then begin
          if FPositionType = bpPosTypeOther
            then Params.ParamByName('job').AsString := FPosition
            else Params.ParamByName('jobtype').AsInteger := FPositionType;
        end;
        Execute;

        FLegalAddrID := 0;
        FRealAddrID := 0;

        if not NewRecord then begin
          ProviderName := 'pKAAddr_Get';
          FetchParams;
          Params.ParamByName('kaid').AsInteger := FID;
          Open;

          if Locate('addrtype', 0, [])
            then FLegalAddrID := FieldByName('addrid').AsInteger;

          if Locate('addrtype', 1, [])
            then FRealAddrID := FieldByName('addrid').AsInteger;

          Close;
        end;

        if FLegalAddrID = 0 then begin
          ProviderName := 'pKAAddr_Ins';
          FLegalAddrID := GetMaxID(dmData.SConnection, 'kaaddr', 'addrid');
        end
        else ProviderName := 'pKAAddr_Upd';

        FetchParams;
        Params.ParamByName('kaid').AsInteger := FID;
        Params.ParamByName('addrid').AsInteger := FLegalAddrID;

        Params.ParamByName('addrtype').AsInteger := 0;
        Params.ParamByName('Address').AsString := Trim(FjurAddress.Street);
        Params.ParamByName('Country').AsString := Trim(FjurAddress.Country.Name);
        Params.ParamByName('District').AsString := Trim(FjurAddress.District);
        Params.ParamByName('City').AsString := Trim(FjurAddress.City);
        Params.ParamByName('PostIndex').AsString := Trim(FjurAddress.PostCode);
        Execute;

        if FRealAddrID = 0 then begin
          ProviderName := 'pKAAddr_Ins';
          FRealAddrID := GetMaxID(dmData.SConnection, 'kaaddr', 'addrid');
        end
        else ProviderName := 'pKAAddr_Upd';

        Params.ParamByName('addrid').AsInteger := FRealAddrID;
        Params.ParamByName('addrtype').AsInteger := 1;
        Params.ParamByName('Address').AsString := Trim(FAddress.Street);
        Params.ParamByName('Country').AsString := Trim(FAddress.Country.Name);
        Params.ParamByName('District').AsString := Trim(FAddress.District);
        Params.ParamByName('City').AsString := Trim(FAddress.City);
        Params.ParamByName('PostIndex').AsString := Trim(FAddress.PostCode);
        Execute;

        ProviderName := 'pKA_StartSaldoUpd';
        FetchParams;
        Params.ParamByName('kaid').AsInteger := FID;

        if FStartSaldo <> 0.0 then begin
          Params.ParamByName('startsaldo').AsCurrency := FStartSaldo;
          Params.ParamByName('startsaldodate').AsDateTime := FStartSaldoDate;
        end
        else begin
          Params.ParamByName('startsaldo').DataType := ftCurrency;
          Params.ParamByName('startsaldo').Clear;
          Params.ParamByName('startsaldodate').DataType := ftDateTime;
          Params.ParamByName('startsaldodate').Clear;
        end;
        Execute;

        // Person ID data for Physical person type
        if not NewRecord then begin
          ProviderName := 'pAgentDoc_Del';
          FetchParams;
          Params.ParamByName('kaid').AsInteger := FID;
          Execute;
        end;

        if FType in [bpTypePerson, bpTypeEmployee] then begin
          ProviderName := 'pAgentDoc_Ins';
          FetchParams;
          Params.ParamByName('kaid').AsInteger := FID;
          Params.ParamByName('docnum').AsString := FPersonIDNum;
          Params.ParamByName('docseries').AsString := FPersonIDSeries;
          Params.ParamByName('docname').AsString := FPersonIDName;
          Params.ParamByName('docwhoproduce').AsString := FPersonIDIssuer;

          if FPersonIDDate > 0.0
            then Params.ParamByName('docdate').AsDateTime := FPersonIDDate
            else begin
              Params.ParamByName('docdate').DataType := ftDateTime;
              Params.ParamByName('docdate').Clear;
            end;

          Execute;
        end;

        (*
        if PersonsModified and DelAgentPersons(FID) // Запись всех AgentPersons
          then AddPersons(FID);

        if AccountModified then begin
          mdAccount.Filtered := False;
          mdAccount.First;
          while not mdAccount.Eof do begin
            if mdAccount.FieldByName('deleted').AsInteger = 1 then begin
              ProviderName := 'pAgentAccount_DelByID';
              FetchParams;
              Params.ParamByName('accid').AsInteger := mdAccount.FieldByName('accid').AsInteger;
              Execute;
            end
            else begin
              if mdAccount.FieldByName('accid').AsInteger < 0
                then ProviderName := 'pAgentAccount_Ins'
                else ProviderName := 'pAgentAccount_Upd';

              FetchParams;

              if mdAccount.FieldByName('accid').AsInteger < 0
                then Params.ParamByName('accid').AsInteger :=
                         GetMaxID(dmData.SConnection, 'agentaccount', 'accid')
                else Params.ParamByName('accid').AsInteger := mdAccount.FieldByName('accid').AsInteger;

              Params.ParamByName('kaid').AsInteger := FID;
              Params.ParamByName('bankid').AsInteger := mdAccount.FieldByName('bankid').AsInteger;
              Params.ParamByName('typeid').AsInteger := mdAccount.FieldByName('typeid').AsInteger;
              Params.ParamByName('accnum').AsString := mdAccount.FieldByName('accnum').AsString;
              Params.ParamByName('def').AsInteger := mdAccount.FieldByName('def').AsInteger;
              Execute;
            end;
            mdAccount.Next;
          end;
        end;

        if not NewRecord then begin
          ProviderName := 'pKADiscount_Del';
          FetchParams;
          Params.ParamByName('kaid').AsInteger := FID;
          Execute;

          ProviderName := 'pKAMatDiscount_Del';
          FetchParams;
          Params.ParamByName('kaid').AsInteger := FID;
          Execute;

          ProviderName := 'pKAMatGroupDiscount_Del';
          FetchParams;
          Params.ParamByName('kaid').AsInteger := FID;
          Execute;
        end;

        if chbUseDiscount.Checked then begin
          ProviderName := 'pKADiscount_Ins';
          FetchParams;
          Params.ParamByName('kaid').AsInteger := FID;
          Params.ParamByName('discforall').AsInteger := Integer(chbDiscAll.Checked);
          Params.ParamByName('disccustom').AsInteger := Integer(chbDiscCustom.Checked);
          Params.ParamByName('onvalue').AsFloat := edDiscAll.Value;
          Execute;

          mdDisc.First;
          while not mdDisc.Eof do begin
            if mdDisc.FieldByName('mtype').AsInteger = 0
              then ProviderName := 'pKAMatDiscount_Ins'
              else ProviderName := 'pKAMatGroupDiscount_Ins';
            FetchParams;
            Params.ParamByName('kaid').AsInteger := FID;
            if mdDisc.FieldByName('mtype').AsInteger = 0
              then Params.ParamByName('matid').AsInteger := mdDisc.FieldByName('id').AsInteger
              else Params.ParamByName('grpid').AsInteger := -mdDisc.FieldByName('id').AsInteger;
            Params.ParamByName('onvalue').AsFloat := mdDisc.FieldByName('onvalue').AsFloat;
            Execute;
            mdDisc.Next;
          end;
        end;

        if NewRecord and (FType = bpTypeOurCompany) and FSetDef then begin
          ProviderName := 'pKAgent_SetDef';
          FetchParams;
          Params.ParamByName('kaid').AsInteger := FID;
          Params.ParamByName('def').AsInteger := 1;
          Execute;
          CurrEnt.KAID := FID;
        end;

        if FType = bpTypeOurCompany then begin
          ProviderName := 'pSQL';
          FetchMacros;
          Params.Clear;

          Macros.ParamByName('sql').AsString := 'select * from rdb$generators where rdb$generator_name=''' +
            'GEN_ENT_WBOUT' + IntToStr(FID) + '''';
          Open;
          if IsEmpty then begin
            Close;
            Macros.ParamByName('sql').AsString := 'create generator gen_ent_wbout' + IntToStr(FID);
            Execute;
          end
          else Close;

          Macros.ParamByName('sql').AsString := 'select * from rdb$generators where rdb$generator_name=''' +
            'GEN_ENT_ACCOUT' + IntToStr(FID) + '''';
          Open;
          if IsEmpty then begin
            Close;
            Macros.ParamByName('sql').AsString := 'create generator gen_ent_accout' + IntToStr(FID);
            Execute;
          end
          else Close;

          Macros.ParamByName('sql').AsString := 'select * from rdb$generators where rdb$generator_name=''' +
            'GEN_ENT_INV' + IntToStr(FID) + '''';
          Open;
          if IsEmpty then begin
            Close;
            Macros.ParamByName('sql').AsString := 'create generator gen_ent_inv' + IntToStr(FID);
            Execute;
          end
          else Close;

          Macros.ParamByName('sql').AsString := 'select * from rdb$generators where rdb$generator_name=''' +
            'GEN_ENT_ORDOUT' + IntToStr(FID) + '''';
          Open;
          if IsEmpty then begin
            Close;
            Macros.ParamByName('sql').AsString := 'create generator gen_ent_ordout' + IntToStr(FID);
            Execute;
          end
          else Close;

          Macros.ParamByName('sql').AsString := 'set generator gen_ent_wbout' +
            IntToStr(FID) + ' to ' + IntToStr(edWBOutCurrNum.Value);
          Execute;

          Macros.ParamByName('sql').AsString := 'set generator gen_ent_accout' +
            IntToStr(FID) + ' to ' + IntToStr(edAOCurrNum.Value);
          Execute;

          Macros.ParamByName('sql').AsString := 'set generator gen_ent_inv' +
            IntToStr(FID) + ' to ' + IntToStr(edInvCurrNum.Value);
          Execute;

          Macros.ParamByName('sql').AsString := 'set generator gen_ent_ordout' +
            IntToStr(FID) + ' to ' + IntToStr(edOrdCurrNum.Value);
          Execute;

          if not NewRecord then begin
            ProviderName := 'pEntExParams_Del';
            Macros.Clear;
            FetchParams;
            Params.ParamByName('kaid').AsInteger := FID;
            Execute;
          end;
            
          ProviderName := 'pEntExParams_Ins';
          FetchParams;
          Params.ParamByName('kaid').AsInteger := FID;
          Params.ParamByName('wtype').AsInteger := -1;
          Params.ParamByName('autonum').AsInteger := Integer(chbWBOutAutoNum.Checked);
          Params.ParamByName('preffix').AsString := edWBOutPrefix.Text;
          Params.ParamByName('suffix').AsString := edWBOutSuffix.Text;
          Params.ParamByName('gen').AsString := 'gen_ent_wbout' + IntToStr(FID);
          Execute;

          Params.ParamByName('wtype').AsInteger := 2;
          Params.ParamByName('autonum').AsInteger := Integer(chbAOAutoNum.Checked);
          Params.ParamByName('preffix').AsString := edAOPrefix.Text;
          Params.ParamByName('suffix').AsString := edAOSuffix.Text;
          Params.ParamByName('gen').AsString := 'gen_ent_accout' + IntToStr(FID);
          Execute;

          Params.ParamByName('wtype').AsInteger := -9;
          Params.ParamByName('autonum').AsInteger := Integer(chbInvAutoNum.Checked);
          Params.ParamByName('preffix').AsString := edInvPrefix.Text;
          Params.ParamByName('suffix').AsString := edInvSuffix.Text;
          Params.ParamByName('gen').AsString := 'gen_ent_inv' + IntToStr(FID);
          Execute;

          Params.ParamByName('wtype').AsInteger := -16;
          Params.ParamByName('autonum').AsInteger := Integer(chbOrdAutoNum.Checked);
          Params.ParamByName('preffix').AsString := edOrdPrefix.Text;
          Params.ParamByName('suffix').AsString := edOrdSuffix.Text;
          Params.ParamByName('gen').AsString := 'gen_ent_ordout' + IntToStr(FID);
          Execute;
        end;
        *)

        TrCommit;

        {
        if not NewRecord and (FType = bpTypeOurCompany) and FDef then begin
          CurrEnt.KAID := FID;
        end;

        if FType = bpTypeEmployee then begin
          if FPositionType = bp then begin
            EntDir := edFIO.Text;
            EntDirID := FID;
          end
          else if rbtBuh.Checked then begin
            EntBuh := edFIO.Text;
            EntBuhID := FID;
          end;
        end;
        }

        if FStartSaldo > 0.0
          then DoRecalcKASaldo(dmData.SConnection, FID, FStartSaldoDate, rs('fmKAgent', 'RecalcBallance'), False);

        if RefreshAllClients
          then dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_KAGENTS);

      finally
        Free;
      end;

    except
      on e:exception do begin
        TrRollback;
        MessageDlg(e.Message, mtError, [mbOk], 0);
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;
    end; // with newdataset try

  isModified := False;
  FNew := False;
  Result := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TMetaBusinessPartner.LoadXMLNode(var topNode, Node: IXMLNode; paramIndex: Integer = -1): Boolean;
  var
    name, data: String;
    datefmt: TFormatSettings;
begin
  Result := True;
  Ferror := 0;

  //GetLocaleFormatSettings(..., datefmt);
  datefmt.DateSeparator := '-';
  datefmt.TimeSeparator := ':';
  datefmt.ShortDateFormat := 'yyyy-mm-dd';

  name := AnsiLowerCase(Node.NodeName);
  data := trim(Node.Text);


  if name = 'address' then begin
    if FAddress = nil then FAddress := TMetaAddress.Create(Self);
    FAddress.loadXML(Node);
    Exit;
  end
  else if name = 'registrationaddress' then begin
    if FjurAddress = nil then FjurAddress := TMetaAddress.Create(Self);
    FjurAddress.loadXML(Node);
    Exit;
  end
  else if name = 'contactpersons' then begin
    if FContactPerson = nil then FContactPerson := TMetaPersonList.Create(Self);
    FContactPerson.loadXML(Node);
    Exit;
  end;

  //.........................................................
  try
    if name = 'personiddate' then begin
      FPersonIDDate := strToDateTime(data, datefmt);
      Exit;
    end
    else if name = 'birthdate' then begin
      FBirthDate := strToDateTime(data, datefmt);
      Exit;
    end
    else if name = 'startsaldodate' then begin
      FStartSaldoDate := strToDateTime(data, datefmt);
      Exit;
    end;

  except
    Ferror := ap_err_XML_badDate;
    Exit;
  end;

  //..................................................
  try
    if name = 'type' then begin // 0-Юридические лица, 1-Физические лица, 2-Служащие, 3-Наши предприятия
      FType := StrToInt(data);
      Exit;
    end
    else if name = 'kind' then begin // 0-Поставщик, 1-клиент, 2-микс
      FKind := StrToInt(data);
      Exit;
    end
    else if name = 'pricecategoryid' then begin
      FPriceCategoryID := StrToInt(data);
      Exit;
    end
    else if name = 'positiontype' then begin  // 0-chief, 1-Partner, 2-Other (FPosition)
      FPositionType := StrToInt(data);
      Exit;
    end
    else if name = 'userid' then begin // ID польз для сотрудника
      FUserID := StrToInt(data);
      Exit;
    end
    else if name = 'startsaldo' then begin
      FStartSaldo := StrToFloat(data);
      Exit;
    end;

  except
    Ferror := ap_err_XML_badData;
    Exit;
  end;

  //..................................................
  if name = 'vatpayer' then begin
    FVATPayer := strToBool(data);
    Exit;
  end
  else if name = 'inn' then begin
    FINN := data;
    Exit;
  end
  else if name = 'okpo' then begin
    FOKPO := data;
    Exit;
  end
  else if name = 'kpp' then begin
    FKPP := data;
    Exit;
  end
  else if name = 'certnum' then begin
    FCertNum := data;
    Exit;
  end
  else if name = 'phones' then begin
    FPhones := data;
    Exit;
  end
  else if name = 'email' then begin
    FEMail := data;
    Exit;
  end
  else if name = 'www' then begin
    FWWW := data;
    Exit;
  end
  else if name = 'fax' then begin
    FFax := data;
    Exit;
  end
  else if name = 'notes' then begin
    FNotes := data;
    Exit;
  end
  else if name = 'personidnum' then begin
    FPersonIDNum := data;
    Exit;
  end
  else if name = 'personidseries' then begin
    FPersonIDSeries := data;
    Exit;
  end
  else if name = 'personidname' then begin
    FPersonIDName := data;
    Exit;
  end
  else if name = 'personidissuer' then begin
    FPersonIDIssuer := data;
    Exit;
  end
  else if name = 'position' then begin
    FPosition := data;
    Exit;
  end
  else if name = 'fullname' then begin
    FFullName := data;
    Exit;
  end;

  Result := inherited loadXMLNode(topNode, Node);
end;

//==============================================================================================
procedure TMetaBusinessPartner.loadXMLcallback(const topNode, cbNode: IXMLNode);
begin
  if AnsiLowerCase(topNode.NodeName) = 'address' then begin
    if AnsiLowerCase(cbNode.NodeName) = 'phone' then begin
      Phones := Phones + ' ' + trim(cbNode.Text);
    end
    //..................................................
    else if AnsiLowerCase(cbNode.NodeName) = 'fax' then begin
      Fax := trim(cbNode.Text);
    end;
  end; // <Address> processing
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('MetaBusinessPartner', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.

