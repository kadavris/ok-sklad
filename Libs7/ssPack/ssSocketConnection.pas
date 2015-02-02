unit ssSocketConnection;

interface

uses
  SysUtils, Classes, DB, DBClient, MConnect, SConnect, ExtCtrls, Messages, dialogs;

type
  TssErrConnEvent = procedure(Sender: TObject; ACode: Integer) of object;

  TssSocketConnection = class(TSocketConnection)
    private
      FDBID: integer;
      FDBConnected: boolean;
      FDBConnectAtOnce: boolean;
      FErrCode: Integer;
      FLastTrError: String;
      FOnAfterDBConnect: TNotifyEvent;
      FOnConnErr: TssErrConnEvent;
      FOnLossConnect: TNotifyEvent;
      FServerAddr: Integer;
      FSelfName: string;
      FSelfIP: string;
      FTimer: TTimer;
      FTransactionsCount: Integer;

      function  GetHost: string;
      procedure SetDBID(const Value: integer);
      procedure SetDBConnected(const Value: boolean);
      procedure SetDBConnectAtOnce(const Value: boolean);
      procedure Check(Sender: TObject);
      procedure SetHost(Value: string); // it is a good idea on host change to disconnect old connection automatically

    protected
      procedure DoConnect; override;
      procedure DoDBConnect; virtual;
      procedure DoDBDisconnect; virtual;
      procedure DoDisconnect; override;

    public
      constructor Create(AOwner: TComponent); override;
      destructor  Destroy; override;

      function  inTransaction: Boolean;
      function  Login(AUser, APass: WideString; DBID, SMode: Integer): Integer; //mimick app server checklogin func.
      function  TrCommit: Boolean;
      procedure TrStart;
      procedure TrRollBack;

      property ServerAddr: Integer read FServerAddr;
      property ErrCode: Integer read FErrCode write FErrCode;
      property LastTrError: String read FLastTrError;

    published
      property DBID: integer read FDBID write SetDBID;
      property DBConnected: boolean read FDBConnected write SetDBConnected;
      property DBConnectAtOnce: boolean read FDBConnectAtOnce write SetDBConnectAtOnce;
      property Host: string read GetHost write SetHost;
      property SelfIP: string read FSelfIP;
      property SelfName: string read FSelfName;

      property OnConnectionError: TssErrConnEvent read FOnConnErr write FOnConnErr;
      property OnLossConnect: TNotifyEvent read FOnLossConnect write FOnLossConnect;
      property OnAfterDBConnect: TNotifyEvent read FOnAfterDBConnect write FOnAfterDBConnect;
  end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  Winsock;

const
  CheckInterval = 5000; //ms

//==============================================================================================
procedure TssSocketConnection.Check(Sender: TObject);
begin
  if Connected then
    try
      AppServer.Clnt_Check;

    except
      FTimer.Enabled := False;
      Connected := False;
      if Assigned(FOnLossConnect) then FOnLossConnect(Self)
    end;
end;

//==============================================================================================
constructor TssSocketConnection.Create(AOwner: TComponent);
  var
    WSAData: TWSAData;
    p: PHostEnt;
    Name: array[0..$ff] of AnsiChar;
begin
  inherited;

  FDBID := -1;
  FDBConnected := False;
  inherited Host := 'localhost';
  FTransactionsCount := 0;
  FDBConnectAtOnce := True;

  FTimer := TTimer.Create(Self);
  FTimer.Interval := CheckInterval;
  FTimer.OnTimer := Check;
  FTimer.Enabled := False;

  if WSAStartup($0101, WSAData) = 0 then begin
    GetHostName(PAnsiChar(@Name), $FF);
    p := GetHostByName(PAnsiChar(@Name));
    FSelfName := p.h_name;
    FSelfIP := inet_ntoa(PInAddr(p.h_addr_list^)^);
    WSACleanup;
  end;
end;

//==============================================================================================
destructor TssSocketConnection.Destroy;
begin
  FTimer.Free;
  
  inherited;
end;

//==============================================================================================
procedure TssSocketConnection.DoConnect;
  {var
    FIntf: IDispatch;
    FAppServer: IssSrvDisp;
  }
begin
  if Connected then Exit;

  inherited;

  FTimer.Enabled := True;
  //FAppServer:=Self.GetServer as IssSrvDisp;
  //FServerAddr:=FAppServer.SetClientInfo(ip, h, FIntf);
  if FDBConnectAtOnce then DBConnected := True;
end;

//==============================================================================================
procedure TssSocketConnection.DoDisconnect;
begin
  DBConnected := False;
  ErrCode := 0;
  FTimer.Enabled := False;

  inherited;
end;

//==============================================================================================
procedure TssSocketConnection.DoDBConnect;
  var
    oldCAO: boolean;
    errMsg: String;
begin
  if FDBConnected then Exit;

  try
    errMsg := '';
    oldCAO := FDBConnectAtOnce;
    FDBConnectAtOnce := False;
    DoConnect;
    FDBConnectAtOnce := oldCAO;

    FErrCode := AppServer.Connect(FDBID);

  except
    on e: Exception do begin
      FErrCode := -99;
      errMsg := e.Message;
    end;
  end;

  FDBConnected := (FErrCode = 0);

  if not FDBConnected then begin
    if Assigned(FOnConnErr)
      then FOnConnErr(Self, FErrCode)
      else begin
        if FErrCode = -10
          then raise Exception.Create('Too many users connected!')
          else raise Exception.Create('Database connection error: ' + errMsg + '. code ' + IntToStr(FErrCode));
      end;
  end
  else if Assigned(FOnAfterDBConnect) then FOnAfterDBConnect(Self);
end;

//==============================================================================================
procedure TssSocketConnection.DoDBDisconnect;
begin
  try
    if FDBConnected then AppServer.Disconnect;

  except
  end;

  FDBConnected := False;
end;

//==============================================================================================
procedure TssSocketConnection.SetDBConnected(const Value: boolean);
begin
  if FDBConnected = Value then Exit;

  if Value
    then DoDBConnect
    else DoDBDisconnect;
end;

//==============================================================================================
procedure TssSocketConnection.SetDBConnectAtOnce(const Value: boolean);
begin
  FDBConnectAtOnce := Value;
end;

//==============================================================================================
procedure TssSocketConnection.SetDBID(const Value: integer);
begin
  if FDBID = Value then Exit;

  if FDBConnected then DoDBDisconnect;

  FDBID := Value;
end;

//==============================================================================================
procedure TssSocketConnection.SetHost(Value: string);
begin
  if 0 = AnsiCompareText(inherited Host, Value) then Exit;

  DoDisconnect;
  sleep(1000);

  inherited Host := Value;
end;

//==============================================================================================
function TssSocketConnection.GetHost: string;
begin
  Result := inherited Host;
end;

//==============================================================================================
function TssSocketConnection.Login(AUser, APass: WideString; DBID, SMode: Integer): Integer; //mimick app server checklogin func.
begin
  try
    if not Connected then Exception.Create('not connected on TssSocketConnection.login');

    Result := Self.AppServer.CheckLogin(AUser, APass, DBID, SMode);

    if Result = 0 then begin
      FDBconnected := True;
      FDBID := DBID;
    end;

  except
    Result := -89;
    FErrCode := -89;
    setDBID(0);
  end;

end;

//==============================================================================================
// Transactions helpers.
// for now we compress multiple transactions into one
function  TssSocketConnection.inTransaction: Boolean;
begin
  Result := (FTransactionsCount > 0);
end;

//==============================================================================================
procedure TssSocketConnection.TrStart;
begin
  inc(FTransactionsCount);
  if FTransactionsCount > 1 then Exit;

  Self.AppServer.Start;
  FLastTrError := '';
end;

//==============================================================================================
procedure TssSocketConnection.TrRollBack;
begin
  if FTransactionsCount = 0 then Exit;

  FTransactionsCount := 0;
  Self.AppServer.Rollback;
end;

//==============================================================================================
function TssSocketConnection.TrCommit: Boolean;
begin
  if FTransactionsCount = 0 then begin
    FLastTrError := Self.Name + ': TrCommit W/O transaction';
    Result := False;
    Exit;
  end;

  dec(FTransactionsCount);

  if FTransactionsCount > 1 then begin
    Result := True;
    Exit;
  end;

  Self.AppServer.Commit;
  FLastTrError := Self.AppServer.stat_lastTrErrors;
  Result := (FLastTrError = '');
end;

end.
