unit okClasses;

interface

uses
  Classes, Types, Messages, ssClientDataSet, SConnect, Contnrs{$IFNDEF PKG}, prTypes{$ENDIF};

type
  TokKAgent = class;
  TokContract = class;

  TokFunctionBuffer = class;

  //--------------------------------------------------------------
  TokObject = class(TComponent)
    private
      FOnChange: TNotifyEvent;

    protected
      FRemoteServer: TSocketConnection;
      procedure SetRemoteServer(const Value: TSocketConnection); virtual;
      function GetID: Integer; virtual;
      procedure SetID(const Value: Integer); virtual;

    public
      property ID: Integer read GetID write SetID;

    published
      property RemoteServer: TSocketConnection read FRemoteServer write SetRemoteServer;
      property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

  //--------------------------------------------------------------
  TokDiscType = (dtSimple, dtAccum);

  TokDiscCard = class(TokObject)
    private
      FCardID: Integer;
      FHolder: string;
      FNum: string;
      FNotes: string;
      FDiscount: Extended;
      FKAID: Integer;
      FExpireDate: TDateTime;
      FDiscType: TokDiscType;
      FTresholds: TssClientDataSet;
      FTotal: Extended;
      FPosCount: Integer;
      procedure SetCardID(const Value: Integer);

    protected
      procedure SetRemoteServer(const Value: TSocketConnection); override;
      function GetID: Integer; override;
      procedure SetID(const Value: Integer); override;

    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;

      property CardID: Integer read FCardID write SetCardID;
      property Num: string read FNum;
      property Holder: string read FHolder;
      property Notes: string read FNotes;
      property Discount: Extended read FDiscount;
      property DiscType: TokDiscType read FDiscType;
      property ExpireDate: TDateTime read FExpireDate;
      property KAID: Integer read FKAID;
      property PosCount: Integer read FPosCount;
      property Total: Extended read FTotal;

      property Tresholds: TssClientDataSet read FTresholds;
  end;

  //--------------------------------------------------------------
  TokWarehouse = class(TokObject)
    private
      FWID: Integer;
      FName: string;
      FAddr: string;
      FDef: Integer;
      FNotes: string;
      procedure SetWID(const Value: Integer);

    protected
      procedure SetRemoteServer(const Value: TSocketConnection); override;
      function GetID: Integer; override;
      procedure SetID(const Value: Integer); override;

    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;

      property WID: Integer read FWID write SetWID;
      property Name_: string read FName;
      property Notes: string read FNotes;
      property Addr: string read FAddr;
      property Def: Integer read FDef;
  end;

  //--------------------------------------------------------------
  TokKAgent = class(TokObject)
    private
      FKAID: Integer;
      FFullName: string;
      FKPP: string;
      FJob: string;
      FName: string;
      FINN: string;
      FCertNum: string;
      FOKPO: string;
      FNDSPayer: Boolean;
      FPhone: string;
      FNotes: string;
      FFax: string;
      FKAKind: Integer;
      FKType: Integer;
      FBirthDate: TDateTime;
      FStartSaldo: Extended;
      FStartSaldoDate: TDateTime;
      FAddr: TssClientDataSet;
      FAccounts: TssClientDataSet;
      FWWW: string;
      FEmail: string;
      FAddrID: Integer;
      FAccID: Integer;
      FOnAccountChange: TNotifyEvent;
      FOnAddrChange: TNotifyEvent;
      FPersons: TssClientDataSet;
      FContracts: TssClientDataSet;
      FDirector: string;
      FBuh: string;
      FLoadAccounts: Boolean;
      FLoadAddress: Boolean;
      FLoadContracts: Boolean;
      FLoadPersons: Boolean;
      FPTypeID: Integer;
      FDocSeries: string;
      FDocNum: string;

      procedure SetKAID(const Value: Integer);
      procedure SetAccID(const Value: Integer);
      procedure SetAddrID(const Value: Integer);
      procedure SetLoadAccounts(const Value: Boolean);
      procedure SetLoadAddress(const Value: Boolean);
      procedure SetLoadContracts(const Value: Boolean);
      procedure SetLoadPersons(const Value: Boolean);
      function GetNameEx: string;

    protected
      procedure SetRemoteServer(const Value: TSocketConnection); override;
      function GetID: Integer; override;
      procedure SetID(const Value: Integer); override;

    public
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;

      procedure NextAddr;
      procedure NextAccount;
      procedure PrevAccount;
      function GetAddr: string;
      function GetAcc: string;
      function GetAccShort: string;

      property KAID: Integer read FKAID write SetKAID;
      property Name_: string read FName;
      property NameEx: string read GetNameEx;
      property FullName: string read FFullName;
      property INN: string read FINN;
      property KPP: string read FKPP;
      property OKPO: string read FOKPO;
      property CertNum: string read FCertNum;
      property NDSPayer: Boolean read FNDSPayer;
      property PTypeID: Integer read FPTypeID;

      property DocNum: string read FDocNum;
      property DocSeries: string read FDocSeries;

      property Job: string read FJob;
      property BirthDate: TDateTime read FBirthDate;

      property Fax: string read FFax;
      property Phone: string read FPhone;
      property EMail: string read FEmail;
      property WWW: string read FWWW;

      property Notes: string read FNotes;

      property KType: Integer read FKType;
      property KAKind: Integer read FKAKind;

      property StartSaldo: Extended read FStartSaldo;
      property StartSaldoDate: TDateTime read FStartSaldoDate;

      property Addr: TssClientDataSet read FAddr;
      property Accounts: TssClientDataSet read FAccounts;
      property Persons: TssClientDataSet read FPersons;
      property Contracts: TssClientDataSet read FContracts;
      property AddrID: Integer read FAddrID write SetAddrID;
      property AccID: Integer read FAccID write SetAccID;

      property Director: string read FDirector;
      property Buh: string read FBuh;

    published
      property LoadAccounts: Boolean read FLoadAccounts write SetLoadAccounts default True;
      property LoadAddress: Boolean read FLoadAddress write SetLoadAddress default True;
      property LoadContracts: Boolean read FLoadContracts write SetLoadContracts default True;
      property LoadPersons: Boolean read FLoadPersons write SetLoadPersons default True;

      property OnAccountChange: TNotifyEvent read FOnAccountChange write FOnAccountChange;
      property OnAddrChange: TNotifyEvent read FOnAddrChange write FOnAddrChange;
  end;

  //--------------------------------------------------------------
  TokContract = class(TokObject)
  private
    FDocID: Integer;
    FNum: string;
    FDocDate: TDateTime;
    FAmount: Extended;
    FSumm: Extended;
    FToDate: TDateTime;
    FIsExternal: Boolean;
    FCurrID: Integer;
    FFilePath: string;
    FKAID: Integer;
    FShippedAmount: Extended;
    FShippedSumm: Extended;
    FPaidSumm: Extended;
    FcdsDetail: TssClientDataSet;
    FRestSumm: Extended;
    FRestAmount: Extended;
    FCurrName: string;
    procedure SetDocID(const Value: Integer);

  protected
    procedure SetRemoteServer(const Value: TSocketConnection); override;
    function GetID: Integer; override;
    procedure SetID(const Value: Integer); override;

  public
    property DocID: Integer read FDocID write SetDocID;

    property Amount: Extended read FAmount;
    property CurrID: Integer read FCurrID;
    property CurrName: string read FCurrName;
    property DocDate: TDateTime read FDocDate;
    property FilePath: string read FFilePath;
    property IsExternal: Boolean read FIsExternal;
    property KAID: Integer read FKAID;
    property Num: string read FNum;
    property PaidSumm: Extended read FPaidSumm;
    property RestSumm: Extended read FRestSumm;
    property RestAmount: Extended read FRestAmount;
    property ShippedAmount: Extended read FShippedAmount;
    property ShippedSumm: Extended read FShippedSumm;
    property Summ: Extended read FSumm;
    property ToDate: TDateTime read FToDate;

    property Detail: TssClientDataSet read FcdsDetail;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  //--------------------------------------------------------------
  TokPayDocType = (pdtIn, pdtOut, pdtCharge);

  TokPayDoc = class(TokObject)
  private
    FPayDocID: Integer;
    FNum: string;
    FDocDate: TDateTime;
    FDocType: TokPayDocType;
    FSummAll: Extended;
    FKAID: Integer;
    FKAName: string;
    FChecked: Boolean;
    FWithNDS: Boolean;
    FPTypeID: Integer;
    FCurrID: Integer;
    FReason: string;
    FNotes: string;
    FMPersonID: Integer;
    FCashID: Integer;
    FAccID: Integer;
    FDocID: Integer;
    FCTypeID: Integer;
    FOperID: Integer;
    procedure SetPayDocID(const Value: Integer);

  protected
    function GetID: Integer; override;
    procedure SetID(const Value: Integer); override;

  public
    property PayDocID: Integer read FPayDocID write SetPayDocID;

    property AccID: Integer read FAccID;
    property CashID: Integer read FCashID;
    property Checked: Boolean read FChecked;
    property CTypeID: Integer read FCTypeID;
    property CurrID: Integer read FCurrID;
    property DocID: Integer read FDocID;
    property DocDate: TDateTime read FDocDate;
    property DocType: TokPayDocType read FDocType;
    property KAID: Integer read FKAID;
    property KAName: string read FKAName;
    property MPersonID: Integer read FMPersonID;
    property Notes: string read FNotes;
    property Num: string read FNum;
    property OperID: Integer read FOperID;
    property PTypeID: Integer read FPTypeID;
    property Reason: string read FReason;
    property SummAll: Extended read FSummAll;
    property WithNDS: Boolean read FWithNDS;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  //--------------------------------------------------------------
  TokOrder = class(TokObject)
  private
    FWBillID: Integer;
    FNum: string;
    FDocDate: TDateTime;
    FDocType: Integer;
    FSummAll: Extended;
    FKAID: Integer;
    FKAName: string;
    FChecked: Boolean;
    FCurrID: Integer;
    FNotes: string;
    FDocID: Integer;
    FToDate: TDateTime;
    FSummInCurr: Extended;
    procedure SetWBillID(const Value: Integer);

  protected
    function GetID: Integer; override;
    procedure SetID(const Value: Integer); override;

  public
    property WBillID: Integer read FWBillID write SetWBillID;

    property Checked: Boolean read FChecked;
    property CurrID: Integer read FCurrID;
    property DocID: Integer read FDocID;
    property DocDate: TDateTime read FDocDate;
    property DocType: Integer read FDocType;
    property KAID: Integer read FKAID;
    property KAName: string read FKAName;
    property Notes: string read FNotes;
    property Num: string read FNum;
    property SummAll: Extended read FSummAll;
    property SummInCurr: Extended read FSummInCurr;
    property ToDate: TDateTime read FToDate;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

  //--------------------------------------------------------------
  TokFunctionItem = class
  private
    FBuffer: TokFunctionBuffer;
    FID: Integer;
    FFunID: Integer;
    FGType: Integer;
    FSubID: Integer;
    FClassName_: string;
    {$IFNDEF PKG}FViewType: TCCViewType;{$ENDIF}
    FFunName: string;
    function GetIndex: Integer;
    procedure SetID(const Value: Integer);
    procedure SetSubID(const Value: Integer);

  public
    constructor Create(ABuffer: TokFunctionBuffer;{$IFNDEF PKG} AViewType: TCCViewType;{$ENDIF}
      AFunID: Integer; const AFunName, AClassName: string; AGType: Integer;
      AID, ASubID: Integer); virtual;

    property FunID: Integer read FFunID;
    property FunName: string read FFunName;
    property GType: Integer read FGType;
    property ID: Integer read FID write SetID;
    property SubID: Integer read FSubID write SetSubID;
    property ClassName_: string read FClassName_;
    {$IFNDEF PKG}
    property ViewType: TCCViewType read FViewType;
    {$ENDIF}

    property Index: Integer read GetIndex;
  end;

  //--------------------------------------------------------------
  TokFunctionBuffer = class(TComponent)
  private
    FList: TObjectList;
    FItemIndex: Integer;
    FBufferSize: Integer;
    FOnChange: TNotifyEvent;
    function GetItem(Index: Integer): TokFunctionItem;
    procedure SetItemIndex(const Value: Integer);
    procedure SetBufferSize(const Value: Integer);
    function GetItemsCount: Integer;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Add({$IFNDEF PKG}AViewType: TCCViewType; {$ENDIF}
      AFunID: Integer; const AFunName, AClassName: string;
      AGType, AID, ASubID: Integer): TokFunctionItem;

    function Current: TokFunctionItem;
    function BOF: Boolean;
    function EOF: Boolean;
    procedure Next;
    procedure Prior;
    procedure MoveTo(AIndex: Integer);

    property BufferSize: Integer read FBufferSize write SetBufferSize;
    property Items[Index: Integer]: TokFunctionItem read GetItem;
    property ItemsCount: Integer read GetItemsCount;
    property ItemIndex: Integer read FItemIndex write SetItemIndex;

  published
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;


implementation

uses
  DB, xLngDefs;

{ TokKAgent }
//==============================================================================================
constructor TokKAgent.Create(AOwner: TComponent);
begin
  inherited;

  FAddr := TssClientDataSet.Create(nil);
  FAddr.ProviderName := 'pKAAddr_Get';

  FPersons := TssClientDataSet.Create(nil);
  FPersons.ProviderName := 'pAgentPersons_Get';

  FContracts := TssClientDataSet.Create(nil);
  FContracts.ProviderName := 'pKAgent_GetContr';

  FAccounts := TssClientDataSet.Create(nil);
  FAccounts.ProviderName := 'pAgentAccount_GetWithBank';

  FLoadAddress := True;
  FLoadContracts := True;
  FLoadAccounts := True;
  FLoadPersons := True;
end;

//==============================================================================================
destructor TokKAgent.Destroy;
begin
  FAccounts.Free;
  FAddr.Free;
  FPersons.Free;
  FContracts.Free;

  inherited;
end;

//==============================================================================================
function TokKAgent.GetAcc: string;
begin
  Result := '';
  with FAccounts do begin
    if not Active then Exit;

    case RepLangID of
      lidRUS, lidUKR:
        Result := 'ð/ñ ' + FieldByName('accnum').AsString + ' â ' + FieldByName('name').AsString
                  + ', ê/ñ ' + FieldByName('coracc').AsString
                  + ' ÁÈÊ ' + FieldByName('mfo').AsString;

      lidENG: // assuming we're only in USA for english
        Result := 'Account # ' + FieldByName('accnum').AsString + ' in ' + FieldByName('name').AsString
                  //+ ', ê/ñ ' + FieldByName('coracc').AsString
                  + ' ABA ' + FieldByName('mfo').AsString;
    end; // case
  end;
end;

//==============================================================================================
function TokKAgent.GetAccShort: string;
begin
  Result := '';
  with FAccounts do begin
    if not Active then Exit;

    case RepLangID of
      lidRUS, lidUKR: Result := 'ð/ñ ' + FieldByName('accnum').AsString + ' â ' + FieldByName('name').AsString;

      // now US only
      lidENG: Result := 'Account # ' + FieldByName('accnum').AsString + ' in ' + FieldByName('name').AsString;
    end;
  end;
end;

//==============================================================================================
function TokKAgent.GetAddr: string;
begin
  with FAddr do begin
    Result := '';

    if not Active then Exit;

    if FieldByName('postindex').AsString <> '' then Result := FieldByName('postindex').AsString + ', ';

    if FieldByName('country').AsString <> '' then Result := Result + FieldByName('country').AsString + ', ';

    if FieldByName('district').AsString <> '' then Result := Result + FieldByName('district').AsString + ', ';

    if FieldByName('city').AsString <> '' then Result := Result + FieldByName('city').AsString + ', ';

    Result := Result + FieldByName('address').AsString + ' ';
  end;
end;

//==============================================================================================
function TokKAgent.GetID: Integer;
begin
  Result := KAID;
end;

//==============================================================================================
function TokKAgent.GetNameEx: string;
begin
  if FullName = ''
    then Result := Name_
    else Result := FullName;
end;

//==============================================================================================
procedure TokKAgent.NextAccount;
begin
  FAccounts.Next;
  if FAccounts.Eof then FAccounts.First;
  AccID := FAccounts.FieldByName('accid').AsInteger;
end;

//==============================================================================================
procedure TokKAgent.NextAddr;
begin
  if not FAddr.Active then Exit;
  FAddr.Next;
  if FAddr.Eof then FAddr.First;
  AddrID := FAddr.FieldByName('addrid').AsInteger;
end;

//==============================================================================================
procedure TokKAgent.PrevAccount;
begin
  FAccounts.Prior;
  if FAccounts.Bof then FAccounts.Last;
  AccID := FAccounts.FieldByName('accid').AsInteger;
end;

//==============================================================================================
procedure TokKAgent.SetAccID(const Value: Integer);
begin
  if (not FAccounts.Active) or FAccounts.IsEmpty then Exit;

  if FAccounts.Locate('accid', Value, []) then begin
    if FAccID <> Value then begin
      FAccID := Value;
      if Assigned(FOnAccountChange) then FOnAccountChange(Self);
    end;
  end;
end;

//==============================================================================================
procedure TokKAgent.SetAddrID(const Value: Integer);
begin
  if not FAddr.Active then Exit;
  if FAddr.Locate('addrid', Value, []) then begin
    if FAddrID <> Value then begin
      FAddrID := Value;
      if Assigned(FOnAddrChange) then FOnAddrChange(Self);
    end;
  end;
end;

//==============================================================================================
procedure TokKAgent.SetID(const Value: Integer);
begin
  KAID := Value;
end;

//==============================================================================================
procedure TokKAgent.SetKAID(const Value: Integer);
begin
  if not Assigned(Self.RemoteServer) then Exit;
  FKAID := Value;

  with TssClientDataSet.Create(nil) do
  try
    RemoteServer := Self.RemoteServer;
    ProviderName := 'pKAgent_Get';
    FetchParams;
    Params.ParamByName('kaid').AsInteger := Value;
    Open;
    FName := FieldByName('name').AsString;
    FFullName := FieldByName('fullname').AsString;
    FOKPO := FieldByName('okpo').AsString;
    FKPP := FieldByName('kpp').AsString;
    FINN := FieldByName('inn').AsString;
    FCertNum := FieldByName('certnum').AsString;
    FNDSPayer := FieldByName('ndspayer').AsInteger = 1;
    FKType := FieldByName('ktype').AsInteger;
    FKAKind := FieldByName('kakind').AsInteger;
    FFax := FieldByName('fax').AsString;
    FWWW := FieldByName('www').AsString;
    FPhone := FieldByName('phone').AsString;
    FNotes := FieldByName('notes').AsString;
    FJob := FieldByName('job').AsString;
    FPTypeID := FieldByName('ptypeid').AsInteger;
    FBirthDate := FieldByName('birthdate').AsDateTime;
    FStartSaldo := FieldByName('startsaldo').AsCurrency;
    FStartSaldoDate := FieldByName('startsaldodate').AsDateTime;
    Close;

    if FKType in [1, 2] then begin
      ProviderName := 'pAgentDoc_Get';
      FetchParams;
      Params.ParamByName('kaid').AsInteger := Value;
      Open;
      if not IsEmpty then begin
        FDocNum := FieldByName('docnum').AsString;
        FDocSeries := FieldByName('docseries').AsString;
      end
      else begin
        FDocNum := '';
        FDocSeries := '';
      end;
      Close;
    end;

  finally
    Free;
  end;

  if FLoadAddress then begin
    FAddr.Close;
    FAddr.FetchParams;
    FAddr.Params.ParamByName('kaid').AsInteger := Value;
    FAddr.Open;
    FAddr.Locate('addrtype', 0, []);
    FAddrID := FAddr.FieldByName('addrid').AsInteger;
  end;

  if FLoadPersons then begin
    FPersons.Close;
    FPersons.FetchParams;
    FPersons.Params.ParamByName('kaid').AsInteger := Value;
    FPersons.Open;
    if FPersons.Locate('jobtype', 0, [])
      then FDirector := FPersons.FieldByName('name').AsString
      else FDirector := '';
    if FPersons.Locate('jobtype', 1, [])
      then FBuh := FPersons.FieldByName('name').AsString
      else FBuh := '';
  end;

  if FLoadAccounts then begin
    FAccounts.Close;
    FAccounts.FetchParams;
    FAccounts.Params.ParamByName('kaid').AsInteger := Value;
    FAccounts.Open;
    FAccounts.Locate('def', 1, []);
    FAccID := FAccounts.FieldByName('accid').AsInteger;
  end;

  if FLoadContracts then
    with FContracts do begin
      if Active then Close;
      FetchParams;
      Params.ParamByName('kaid').AsInteger := Value;
      Open;
    end;

  if Assigned(FOnChange) then FOnChange(Self);
end;

//==============================================================================================
procedure TokKAgent.SetLoadAccounts(const Value: Boolean);
begin
  FLoadAccounts := Value;
end;

//==============================================================================================
procedure TokKAgent.SetLoadAddress(const Value: Boolean);
begin
  FLoadAddress := Value;
end;

//==============================================================================================
procedure TokKAgent.SetLoadContracts(const Value: Boolean);
begin
  FLoadContracts := Value;
end;

//==============================================================================================
procedure TokKAgent.SetLoadPersons(const Value: Boolean);
begin
  FLoadPersons := Value;
end;

//==============================================================================================
procedure TokKAgent.SetRemoteServer(const Value: TSocketConnection);
begin
  inherited;

  if Assigned(Value) then begin
    FAddr.RemoteServer := Value;
    FPersons.RemoteServer := Value;
    FAccounts.RemoteServer := Value;
    FContracts.RemoteServer := Value;
  end
  else begin
    FAddr.RemoteServer := nil;
    FAccounts.RemoteServer := nil;
    FPersons.RemoteServer := nil;
    FContracts.RemoteServer := nil;
  end;
end;

{ TokObject }

//==============================================================================================
function TokObject.GetID: Integer;
begin
  Result := 0;
end;

//==============================================================================================
procedure TokObject.SetID(const Value: Integer);
begin
{}
end;

//==============================================================================================
procedure TokObject.SetRemoteServer(const Value: TSocketConnection);
begin
  if Value = FRemoteServer then Exit;
  FRemoteServer := Value;
  if Assigned(Value) then Value.FreeNotification(Self);
end;

{ TokContract }

//==============================================================================================
//==============================================================================================
//==============================================================================================
//==============================================================================================
constructor TokContract.Create(AOwner: TComponent);
begin
  inherited;

  FcdsDetail := TssClientDataSet.Create(nil);
  FcdsDetail.ProviderName := 'pContrDet_GetEx';
end;

//==============================================================================================
destructor TokContract.Destroy;
begin
  FcdsDetail.Free;

  inherited;
end;

//==============================================================================================
function TokContract.GetID: Integer;
begin
  Result := DocID;
end;

//==============================================================================================
procedure TokContract.SetDocID(const Value: Integer);
begin
  if not Assigned(RemoteServer) then Exit;
  FDocID := Value;

  if Value > 0 then begin
    with TssClientDataSet.Create(nil) do
    try
      RemoteServer := Self.RemoteServer;
      ProviderName := 'pContr_Get';
      FetchParams;
      Params.ParamByName('docid').AsInteger := Value;
      Open;
      FNum := FieldByName('num').AsString;
      FDocDate := FieldByName('ondate').AsDateTime;
      FFilePath := FieldByName('fpath').AsString;
      FToDate := FieldByName('todate').AsDateTime;
      FCurrID := FieldByName('currid').AsInteger;
      FCurrName := FieldByName('currname').AsString;
      FAmount := FieldByName('amount').AsFloat;
      FSumm := FieldByName('summ').AsCurrency;
      FShippedSumm := FieldByName('shippedsumm').AsCurrency;
      FShippedAmount := FieldByName('shippedamount').AsFloat;
      FPaidSumm := FieldByName('paidsumm').AsCurrency;
      FKAID := FieldByName('kaid').AsInteger;
      FIsExternal := FieldByName('isexternal').AsInteger = 1;

      FRestSumm := FSumm - FShippedSumm;
      FRestAmount := FAmount - FShippedAmount;
      Close;

    finally
      Free;
    end;
  end
  else begin
    FNum := '';
    FDocDate := 0;
    FFilePath := '';
    FToDate := 0;
    FCurrID := 0;
    FCurrName := '';
    FAmount := 0;
    FSumm := 0;
    FShippedSumm := 0;
    FShippedAmount := 0;
    FPaidSumm := 0;
    FKAID := 0;
    FIsExternal := False;

    FRestSumm := 0;
    FRestAmount := 0;
  end;

  FcdsDetail.Close;
  FcdsDetail.FetchParams;
  FcdsDetail.Params.ParamByName('docid').AsInteger := Value;
  FcdsDetail.Open;

  if Assigned(OnChange) then OnChange(Self);
end;

//==============================================================================================
procedure TokContract.SetID(const Value: Integer);
begin
  DocID := Value;
end;

//==============================================================================================
procedure TokContract.SetRemoteServer(const Value: TSocketConnection);
begin
  inherited;

  if Assigned(Value) then begin
    FcdsDetail.RemoteServer := Value;
  end
  else begin
    FcdsDetail.RemoteServer := nil;
  end;
end;

{ TokFunctionItem }

//==============================================================================================
constructor TokFunctionItem.Create(ABuffer: TokFunctionBuffer; {$IFNDEF PKG}AViewType: TCCViewType;{$ENDIF}
  AFunID: Integer; const AFunName, AClassName: string; AGType: Integer; AID, ASubID: Integer);
begin
  FFunName := AFunName;
  {$IFNDEF PKG}FViewType := AViewType;{$ENDIF}
  FBuffer := ABuffer;
  FFunID := AFunID;
  FClassName_ := AClassName;
  FGType := AGType;
  FID := AID;
  FSubID := ASubID;
end;

//==============================================================================================
function TokFunctionItem.GetIndex: Integer;
begin
  Result := FBuffer.FList.IndexOf(Self);
end;

//==============================================================================================
procedure TokFunctionItem.SetID(const Value: Integer);
begin
  FID := Value;
end;

//==============================================================================================
procedure TokFunctionItem.SetSubID(const Value: Integer);
begin
  FSubID := Value;
end;

{ TokFunctionBuffer }

//==============================================================================================
function TokFunctionBuffer.Add({$IFNDEF PKG}AViewType: TCCViewType; {$ENDIF}AFunID: Integer;
  const AFunName, AClassName: string; AGType, AID, ASubID: Integer): TokFunctionItem;
begin
  if (FItemIndex <> FList.Count - 1) then FList.Exchange(FItemIndex, FList.Count - 1);

  Result := TokFunctionItem.Create(Self{$IFNDEF PKG}, AViewType{$ENDIF}, AFunID, AFunName, AClassName, AGType, AID, ASubID);
  FItemIndex := FList.Add(Result);

  if (FBufferSize > 0) and (FList.Count > FBufferSize) then begin
    FList.Delete(0);
    Dec(FItemIndex);
  end;
end;

//==============================================================================================
function TokFunctionBuffer.BOF: Boolean;
begin
  Result := FItemIndex <= 0;
end;

//==============================================================================================
constructor TokFunctionBuffer.Create(AOwner: TComponent);
begin
  inherited;
  
  FList := TObjectList.Create(True);
  FBufferSize := 10;
  FItemIndex := -1;
end;

//==============================================================================================
function TokFunctionBuffer.Current: TokFunctionItem;
begin
  if FList.Count <> 0
    then Result := Items[FItemIndex]
    else Result := nil;
end;

//==============================================================================================
destructor TokFunctionBuffer.Destroy;
begin
  FList.Free;

  inherited;
end;

//==============================================================================================
function TokFunctionBuffer.EOF: Boolean;
begin
  Result := (FItemIndex = -1) or (FItemIndex = FList.Count - 1)
end;

//==============================================================================================
function TokFunctionBuffer.GetItem(Index: Integer): TokFunctionItem;
begin
  Result := TokFunctionItem(FList[Index]);
end;

//==============================================================================================
function TokFunctionBuffer.GetItemsCount: Integer;
begin
  Result := FList.Count;
end;

//==============================================================================================
procedure TokFunctionBuffer.MoveTo(AIndex: Integer);
begin
  ItemIndex := AIndex;
  if Assigned(FOnChange) then FOnChange(Self);
end;

//==============================================================================================
procedure TokFunctionBuffer.Next;
begin
  ItemIndex := ItemIndex + 1;
  if Assigned(FOnChange) then FOnChange(Self);
end;

//==============================================================================================
procedure TokFunctionBuffer.Prior;
begin
  ItemIndex := ItemIndex - 1;
  if Assigned(FOnChange) then FOnChange(Self);
end;

//==============================================================================================
procedure TokFunctionBuffer.SetBufferSize(const Value: Integer);
begin
  FBufferSize := Value;
end;

//==============================================================================================
procedure TokFunctionBuffer.SetItemIndex(const Value: Integer);
begin
  if (Value < 0) then FItemIndex := 0 else
  if (Value > FList.Count - 1) then FItemIndex := FList.Count - 1
    else FItemIndex := Value;
end;

{ TokPayDoc }

//==============================================================================================
constructor TokPayDoc.Create(AOwner: TComponent);
begin
  inherited;

end;

//==============================================================================================
destructor TokPayDoc.Destroy;
begin

  inherited;
end;

//==============================================================================================
function TokPayDoc.GetID: Integer;
begin
  Result := PayDocID;
end;

//==============================================================================================
procedure TokPayDoc.SetID(const Value: Integer);
begin
  PayDocID := Value;
end;

//==============================================================================================
procedure TokPayDoc.SetPayDocID(const Value: Integer);
begin
  if not Assigned(RemoteServer) then Exit;
  FPayDocID := Value;

  if Value > 0 then begin
    with TssClientDataSet.Create(nil) do
    try
      RemoteServer := Self.RemoteServer;
      ProviderName := 'pPayDoc_Get';
      FetchParams;
      Params.ParamByName('paydocid').AsInteger := Value;
      Open;
      FNum := FieldByName('docnum').AsString;
      FDocDate := FieldByName('ondate').AsDateTime;

      case FieldByName('doctype').AsInteger of
         1: FDocType := pdtIn;
        -1: FDocType := pdtOut;
        -2: FDocType := pdtCharge;
      end;

      FCurrID := FieldByName('currid').AsInteger;
      FSummAll := FieldByName('total').AsCurrency;
      FKAID := FieldByName('kaid').AsInteger;
      FKAName := FieldByName('name').AsString;
      FPTypeID := FieldByName('ptypeid').AsInteger;
      FCashID := FieldByName('cashid').AsInteger;
      FAccID := FieldByName('accid').AsInteger;
      FCTypeID := FieldByName('ctypeid').AsInteger;
      FPTypeID := FieldByName('ptypeid').AsInteger;
      FChecked := FieldByName('checked').AsInteger = 1;
      FWithNDS := FieldByName('withnds').AsInteger = 1;
      FNotes := FieldByName('notes').AsString;
      FReason := FieldByName('reason').AsString;
      FMPersonID := FieldByName('mpersonid').AsInteger;
      FOperID := FieldByName('operid').AsInteger;
      Close;

    finally
      Free;
    end;
  end
  else begin
    FNum := '';
    FDocDate := 0;
    FCurrID := 0;
    FSummAll := 0;
    FKAID := 0;
    FKAName := '';
    FPTypeID := 0;
    FCashID := 0;
    FAccID := 0;
    FCTypeID := 0;
    FPTypeID := 0;
    FChecked := False;
    FWithNDS := False;
    FNotes := '';
    FReason := '';
    FMPersonID := 0;
    FOperID := 0;
  end;

  if Assigned(OnChange) then OnChange(Self);
end;

{ TokWarehouse }

//==============================================================================================
constructor TokWarehouse.Create(AOwner: TComponent);
begin
  inherited;
end;

//==============================================================================================
destructor TokWarehouse.Destroy;
begin
  inherited;
end;

//==============================================================================================
function TokWarehouse.GetID: Integer;
begin
  Result := FWID;
end;

//==============================================================================================
procedure TokWarehouse.SetID(const Value: Integer);
begin
  WID := Value;
end;

//==============================================================================================
procedure TokWarehouse.SetRemoteServer(const Value: TSocketConnection);
begin
  inherited;

end;

//==============================================================================================
procedure TokWarehouse.SetWID(const Value: Integer);
begin
  if not Assigned(Self.RemoteServer) then Exit;
  FWID := Value;

  with TssClientDataSet.Create(nil) do
  try
    RemoteServer := Self.RemoteServer;
    ProviderName := 'pWHouse_Get';
    FetchParams;
    Params.ParamByName('wid').AsInteger := Value;
    Open;
    FName := FieldByName('name').AsString;
    FNotes := FieldByName('notes').AsString;
    FAddr := FieldByName('addr').AsString;
    FDef := FieldByName('def').AsInteger;
    Close;

  finally
    Free;
  end;
end;

{ TokDiscCard }

//==============================================================================================
constructor TokDiscCard.Create(AOwner: TComponent);
begin
  inherited;

  FTresholds := TssClientDataSet.Create(nil);
  FTresholds.ProviderName := 'pDiscCards_AccumGet';
end;

//==============================================================================================
destructor TokDiscCard.Destroy;
begin
  FTresholds.Free;

  inherited;
end;

//==============================================================================================
function TokDiscCard.GetID: Integer;
begin
  Result := FCardID;
end;

//==============================================================================================
procedure TokDiscCard.SetCardID(const Value: Integer);
begin
  if not Assigned(Self.RemoteServer) then Exit;
  FCardID := Value;

  with TssClientDataSet.Create(nil) do
  try
    RemoteServer := Self.RemoteServer;
    ProviderName := 'pDiscCards_GetEx';
    FetchParams;
    Params.ParamByName('cardid').AsInteger := Value;
    Open;
    FNum := FieldByName('num').AsString;
    FNotes := FieldByName('notes').AsString;
    FHolder := FieldByName('name').AsString;
    FDiscount := FieldByName('onvalue').AsFloat;
    FDiscType := TokDiscType(FieldByName('disctype').AsInteger);
    FKAID := FieldByName('kaid').AsInteger;
    FPosCount := FieldByName('poscount').AsInteger;
    FExpireDate := FieldByName('expiredate').AsDateTime;
    FTotal := FieldByName('total').AsFloat;
    Close;

  finally
    Free;
  end;

  with FTresholds do begin
    Close;
    FetchParams;
    Params.ParamByName('cardid').AsInteger := Value;
    Open;
  end;  
end;

//==============================================================================================
procedure TokDiscCard.SetID(const Value: Integer);
begin
  CardID := Value;
end;

//==============================================================================================
procedure TokDiscCard.SetRemoteServer(const Value: TSocketConnection);
begin
  inherited;

  if Assigned(Value) then begin
    FTresholds.RemoteServer := Value;
  end
  else begin
    FTresholds.RemoteServer := nil;
  end;
end;

{ TokOrder }

//==============================================================================================
constructor TokOrder.Create(AOwner: TComponent);
begin
  inherited;

end;

//==============================================================================================
destructor TokOrder.Destroy;
begin

  inherited;
end;

//==============================================================================================
function TokOrder.GetID: Integer;
begin
  Result := FWBillID;
end;

//==============================================================================================
procedure TokOrder.SetID(const Value: Integer);
begin
  WBillID := Value;
end;

//==============================================================================================
procedure TokOrder.SetWBillID(const Value: Integer);
begin
  if not Assigned(RemoteServer) then Exit;
  FWBillID := Value;

  if Value > 0 then begin
    with TssClientDataSet.Create(nil) do
    try
      RemoteServer := Self.RemoteServer;
      ProviderName := 'pWaybill_GetEx';
      FetchParams;
      Params.ParamByName('wbillid').AsInteger := Value;
      Open;
      FNum := FieldByName('num').AsString;
      FDocDate := FieldByName('ondate').AsDateTime;
      FToDate := FieldByName('todate').AsDateTime;
      FDocType := FieldByName('wtype').AsInteger;
      FCurrID := FieldByName('currid').AsInteger;
      FSummAll := FieldByName('summall').AsCurrency;
      FSummInCurr := FieldByName('summincurr').AsCurrency;
      FKAID := FieldByName('kaid').AsInteger;
      FKAName := FieldByName('kaname').AsString;
      FChecked := FieldByName('checked').AsInteger = 1;
      FNotes := FieldByName('notes').AsString;
      Close;
    finally
      Free;
    end;
  end
  else begin
    FNum := '';
    FDocDate := 0;
    FToDate := 0;
    FCurrID := 0;
    FSummAll := 0;
    FSummInCurr := 0;
    FKAID := 0;
    FKAName := '';
    FChecked := False;
    FNotes := '';
  end;

  if Assigned(OnChange) then OnChange(Self);
end;

end.
