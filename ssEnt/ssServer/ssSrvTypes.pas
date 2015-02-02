{$I ok_server.inc}
//UDEBUG code already inserted. Please do not remove this line.
unit ssSrvTypes;

interface

uses
  {$IFDEF ZEOS}ZConnection, ZDbcInterbase6, ZSQLProcessor,ZSQLMonitor,{$ENDIF}
  {$IFDEF IBO}IB_Components,{$ENDIF}
  {$IFDEF IBX}IBDataBase,{$ENDIF}
  xIBQuery, DB, Classes, Provider, Midas;

var
  IID_IDispatch : TGUID = '{00020400-0000-0000-C000-000000000046}';

type
  {$IF defined(IBX) or defined(IBO)}
    TxTransaction =
      {$IFDEF IBO}TIB_Transaction{$ENDIF}
      {$IFDEF IBX}TIBTransaction{$ENDIF}
    ;
  {$IFEND}

  //---------------------------------------------------------------
  {$IFDEF ZEOS}
    TxSQLProcessor = TZSQLProcessor;

    TxConnection = class(TZConnection)
      private
        Fmon: TZSQLMonitor;

      public
        constructor Create(Owner: TComponent); override;
        destructor Destroy; override;

        property Monitor: TZSQLMonitor read Fmon;
    end;
  {$ENDIF}

  //---------------------------------------------------------------
  {$IFDEF IBO}TxConnection = TIB_Connection;{$ENDIF}

  //---------------------------------------------------------------
  {$IFDEF IBX}
    TxConnection = class(TIBDataBase)
      private
        function GetDBName: String;
        procedure SetDBName(AName: String);

      public
        Transaction: TxTransaction;

        constructor Create(Owner: TObject);
        destructor Destroy;

        procedure Connect;
        procedure Disconnect;
        function InTransaction: Boolean;
        procedure StartTransaction;
        procedure Commit;
        procedure Rollback;

      published
        property DataBase: String read GetDBName write SetDBName;
    end;
  {$ENDIF}

  //---------------------------------------------------------------
  TxQuery = class(TxIBQuery)
    private
      {$IFDEF IBX}
        function GetConnection: TxConnection;
        procedure SetConnection(const Value: TxConnection);
      {$ENDIF}

    public
      constructor Create(AConn: TxConnection; ASQL: String = '');

    published
      {$IFDEF IBX}
        property Connection: TxConnection read GetConnection write SetConnection;
      {$ENDIF}
  end; // TxQuery

  //---------------------------------------------------------------
  TxSrvResult = (srNone, srAbandoned, srTimedOut, srUnknown);

  //---------------------------------------------------------------
  TClientInfo = record
    IP: string[15];
  end;

  //---------------------------------------------------------------
  TProvInfo = class
    private
      FProvider: TDataSetProvider;
      FQuery: TxQuery;
      FIndex: integer;

    public
      property Provider: TDataSetProvider read FProvider;
      constructor Create(AConn: TxConnection; const APrvName, AText: WideString);
      destructor Destroy; override;

      property Index: integer read FIndex write FIndex;
  end;

  //---------------------------------------------------------------
  TProvCache = class
    private
      FConnection: TxConnection;
      FCache: TList;

    public
      constructor Create(AConn: TxConnection);
      destructor Destroy; override;
      function AddProvider(const APrvName: WideString; AProv, AText: TDataSet): TProvInfo;
      function GetProvider(const APrvName: WideString): TProvInfo;
      function DropProvider(APrv: TProvInfo): boolean;
  end;

  function InitConnection(const APath: String; const doOpen: Boolean): TxConnection;
  function ExecScript(const ADBName, ASQL: string; AConn: TxConnection; doTransaction: Boolean; var Err: String): Boolean;
  function ExecStatement(const ADBName, ASQL: string; AConn: TxConnection; var Err: String): Boolean;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  {$IFDEF UDEBUG}udebug,{$ENDIF}
  {$IFDEF ZEOS}ZdbcIntfs,{$ENDIF}
  StrUtils, xStrUtils, SysUtils, ssFun, Main, ssSrvConst, ssSrvDB;

{$IFDEF UDEBUG}
var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';
{$ENDIF}

//==============================================================================================
//==============================================================================================
//==============================================================================================
// TxConnection
//==============================================================================================
//==============================================================================================
//==============================================================================================
{$IFDEF ZEOS}
constructor TxConnection.Create(Owner: TComponent);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxConnection.Create') else _udebug := nil;{$ENDIF}

  inherited Create(Owner);
  Fmon := TZSQLMonitor.Create(nil);
  Fmon.Active := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
destructor TxConnection.Destroy;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxConnection.Free') else _udebug := nil;{$ENDIF}

  Fmon.Destroy;
  inherited Destroy;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
{$ENDIF}

//#############################################################################################
//#############################################################################################
//#############################################################################################
{$IFDEF IBX}
constructor TxConnection.Create(Owner: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxConnection.Create') else _udebug := nil;{$ENDIF}

  inherited Create(Owner);
  Transaction := TxTransaction.Create(nil);
  DefaultTransaction := Conn.Transaction;
  SQLDialect := 3;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
destructor TxConnection.Free;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxConnection.Free') else _udebug := nil;{$ENDIF}

  if Transaction <> nil then Transaction.destroy;
  inherited Destroy;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TxConnection.InTransaction: Boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxConnection.InTransaction') else _udebug := nil;{$ENDIF}

  if Transaction <> nil
    then Result := Transaction.InTransaction
    else Result := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxConnection.Connect;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxConnection.Connect') else _udebug := nil;{$ENDIF}

  Open;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxConnection.Disconnect;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxConnection.Disconnect') else _udebug := nil;{$ENDIF}

  Close;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxConnection.StartTransaction;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxConnection.StartTransaction') else _udebug := nil;{$ENDIF}

  if Transaction <> nil then Transaction.StartTransaction;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxConnection.Commit;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxConnection.Commit') else _udebug := nil;{$ENDIF}

  if Transaction <> nil then Transaction.Commit;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxConnection.Rollback;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxConnection.Rollback') else _udebug := nil;{$ENDIF}

  if Transaction <> nil then Transaction.RollBack;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TxConnection.GetDBName: String;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxConnection.GetDBName') else _udebug := nil;{$ENDIF}

  Result := DataBaseName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxConnection.SetDBName(AName: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  if AName = DataBaseName then Exit;
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxConnection.SetDBName') else _udebug := nil;{$ENDIF}

  DataBaseName := AName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
{$ENDIF} //TxConnection IBX section

//==============================================================================================
//==============================================================================================
//==============================================================================================
// TxQuery
//==============================================================================================
//==============================================================================================
//==============================================================================================
constructor TxQuery.Create(AConn: TxConnection; ASQL: String = '');
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxQuery.Create; SQL: ' + ASQL) else _udebug := nil;{$ENDIF}

  //LogEvent('---trace--- TxQuery.Create; SQL: "' + ASQL + '"', 11);

  inherited Create(nil);

  Connection := AConn;
  {$IFDEF IBX}Transaction := AConn.Transaction;{$ENDIF}
  if ASQL <> '' then SQLText := ASQL;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

{$IFDEF IBX}
//==============================================================================================
function TxQuery.GetConnection: TxConnection;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxQuery.GetConnection') else _udebug := nil;{$ENDIF}

  Result := TxConnection(DataBase);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxQuery.SetConnection(const Value: TxConnection);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxQuery.SetConnection') else _udebug := nil;{$ENDIF}

  DataBase := TIBDataBase(Value);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
{$ENDIF} //TxQuery IBX section

//==============================================================================================
//==============================================================================================
//==============================================================================================
// TProvInfo
//==============================================================================================
//==============================================================================================
//==============================================================================================
constructor TProvInfo.Create(AConn: TxConnection; const APrvName, AText: WideString);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TProvInfo.Create') else _udebug := nil;{$ENDIF}

  FQuery := TxQuery.Create(AConn, AText);

  FProvider := TDataSetProvider.Create(nil);
  FProvider.DataSet := FQuery;
  FProvider.Name := APrvName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
destructor TProvInfo.Destroy;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TProvInfo.Destroy') else _udebug := nil;{$ENDIF}

  FProvider.Free;
  FQuery.Free;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
// TProvCache
//==============================================================================================
//==============================================================================================
//==============================================================================================
function TProvCache.AddProvider(const APrvName: WideString; AProv, AText: TDataSet): TProvInfo;
  var
    FText: TStringList;
    FID: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TProvCache.AddProvider') else _udebug := nil;{$ENDIF}

  FText := TStringList.Create;

  try
    AProv.Locate('name', APrvName, []);
    FID := AProv.fieldbyname('ID').AsInteger;

    AText.First;
    while not AText.Eof do begin
      if AText.fieldbyname('id').AsInteger = FID
        then FText.AddObject(AText.fieldbyname('TextStr').AsString, pointer(AText.FieldByName('lineid').AsInteger));

      AText.Next;
    end;

    SortByObj(FText);

    try
      Result := TProvInfo.Create(FConnection, APrvName, FText.Text);
      Result.Index := FCache.Add(Result);

    except
      Result := nil;
      raise;
    end;

  finally
    FText.Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
constructor TProvCache.Create(AConn: TxConnection);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TProvCache.Create') else _udebug := nil;{$ENDIF}


  FConnection := AConn;
  FCache := TList.Create;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
destructor TProvCache.Destroy;
  var
    i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TProvCache.Destroy') else _udebug := nil;{$ENDIF}

  for i := 0 to FCache.Count-1 do TProvInfo(FCache.Items[i]).Free;

  FCache.Free;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TProvCache.DropProvider(APrv: TProvInfo): boolean;
  var
    i: integer;
    FProvName: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TProvCache.DropProvider') else _udebug := nil;{$ENDIF}

  Result := True;

  if APrv <> nil then
    try
      i := APrv.Index;
      FCache.Delete(i);
      FProvName := APrv.Provider.Name;
      FreeAndNil(APrv);

    except
      on e: exception do begin
        Result := False;
        LogEvent('error: (drop_provider) ' + FProvName + ': ' + e.Message);
      end;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TProvCache.GetProvider(const APrvName: WideString): TProvInfo;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TProvCache.GetProvider') else _udebug := nil;{$ENDIF}

  Result := nil;

  try
    for i := 0 to FCache.Count - 1 do
      if TProvInfo(FCache.Items[i]).Provider.Name = APrvName then begin
        Result := FCache.Items[i];
         begin
          {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
          Exit;
        end;

      end;

  except
    on e: exception do begin
      LogEvent('Error: (get_provider) ' + APrvName + ': ' + e.Message);
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
//==============================================================================================
function InitConnection(const APath: String; const doOpen: Boolean): TxConnection;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'InitConnection') else _udebug := nil;{$ENDIF}

  if trim(APath) <> '' then LogEvent('---trace--- InitConnection; DB: "' + APath + '"', 10);

  Result := TxConnection.Create(nil);

  // some defaults
  //UserSysName := 'SYSDBA';
  //UserPass := 'masterkey';

  with Result do
    try
      DataBase := APath; // maybe empty string. then this is just for class init

      {$IFDEF IBX}
        Params.Add('user_name=sysdba');
        Params.Add('password=masterkey');
        Params.Add('lc_ctype=WIN1251');
        Params.Add('sql_role_name=users');
        //Protocol := TCP;
        LoginPrompt := False;
        SQLDialect := 3;
      {$ENDIF}

      {$IFDEF ZEOS}
        Protocol := DBDriver;
        HostName := sqlServerAddr;
        User     := 'sysdba';
        Password := 'masterkey';
        // setting lock on others transactions for consistency
        TransactIsolationLevel := tiSerializable; //tiReadCommitted;
        // see also "InterBase and Firebird server transactions.htm" http://www.devrace.com/en/fibplus/articles/479.php

        { explanation of driver options from ZDbcInterbase6.pas:
          case TransactIsolationLevel of
          tiReadCommitted:
            begin
              Params.Add('isc_tpb_read_committed');
              Params.Add('isc_tpb_rec_version');
              Params.Add('isc_tpb_nowait');
            end;
          tiRepeatableRead:
            begin
              Params.Add('isc_tpb_concurrency');
              Params.Add('isc_tpb_nowait');
            end;
          tiSerializable:
            begin
              Params.Add('isc_tpb_consistency');
            end;
        }
        
        Properties.Clear;
        LoginPrompt := False;
      {$ENDIF}

      if (APath <> '') and doOpen then begin
        LogEvent('* InitConnection: Checking connection to SQL server via driver: ' + DBDriver);
        Connect;
      end;

    except
      on E: Exception do begin
        LogEvent('! InitConnection: ERROR: ' + E.Message);
        Result := nil;
      end;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function ExecScript(const ADBName, ASQL: string; AConn: TxConnection; doTransaction: Boolean; var Err: String): Boolean;
  var
    scount, i: Integer;
    sql_text, FoldDB: string;
    ignoreres, FreconnectDB: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'ExecScript(DB: "' + ADBName + '")') else _udebug := nil;{$ENDIF}

  Result := False;
  Err := '';
  sCount := WordCount(ASQL, [';']);

  FoldDB := AConn.Database;
  FReconnectDB := AConn.Connected;

  try // finally
    try
      if AConn.Connected then begin
        if FoldDB <> ADBName then begin
          AConn.Disconnect;
          AConn.Database := ADBName;
          AConn.Connect;
        end;
      end
      else begin // not connected
        AConn.Database := ADBName;
        AConn.Connect;
      end;

      if doTransaction then AConn.StartTransaction;

    except
      on e: exception do begin
        Err := '! Error: ExecSript: DB "' + ADBName + '": connection error ' + e.Message;
        LogEvent(Err);
        Exit;
      end;
    end;

    for i := 1 to sCount do begin
      ignoreres := False;
      sql_text := trim(ReplaceStr(ExtractWord(i, ASQL, [';']), '^', ';'));

      if sql_text = '' then Continue;

      if AnsiStartsText('!NOERR!', sql_text) then begin // there may be recoverable errors, so ignoring them
        ignoreres := True;
        sql_text := AnsiMidStr(sql_text, 8, 999999);
      end;

      try
        AConn.ExecuteDirect(sql_text);

      except
        on e: exception do begin
          Err := Err + 'ExecSript: ';

          if ignoreRes then Err := Err + '(! Ignored by request !): ';

          Err := Err + ' DB "' + ADBName + '" SQL: "' + sql_text + '"'#13#10 + 'Error text is: ' + e.Message + #13#10#13#10;

          if not ignoreres then begin
            if doTransaction then Aconn.RollBack;

            Exit;
          end;
        end;
      end; // try
    end; // for i := 1 to sCount do begin

    try
      if doTransaction then AConn.Commit;

      Result := True;

    except
      on e: exception do begin
        Err := '! Error: ExecSript: DB "' + ADBName + '": commit error ' + e.Message;
        Exit;
      end;
    end;

  finally
    if FoldDB <> ADBName then begin
      AConn.Disconnect;
      AConn.Database := FoldDB;
    end;

    if FReconnectDB then AConn.Connect;

    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;

end;

//==============================================================================================
function ExecStatement(const ADBName, ASQL: string; AConn: TxConnection; var Err: String): Boolean;
  var
    FoldDB: string;
    FreconnectDB: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'ExecStatement(DB: "' + ADBName + '")') else _udebug := nil;{$ENDIF}

  Result := False;
  Err := '';

  FoldDB := AConn.Database;
  FReconnectDB := AConn.Connected;

  try // finally
    try
      if AConn.Connected then begin
        if FoldDB <> ADBName then begin
          AConn.Disconnect;
          AConn.Database := ADBName;
          AConn.Connect;
        end;
      end
      else begin // not connected
        AConn.Database := ADBName;
        AConn.Connect;
      end;

    except
      on e: exception do begin
        Err := 'ExecSript: DB "' + ADBName + '": connection error ' + e.Message;
        Exit;
      end;
    end;

    try
      AConn.ExecuteDirect(ASQL);

    except
      on e: exception do begin
        Err := 'ExecStatement: DB "' + ADBName + '" SQL: "' + asql + '"'#13#10 + 'Error text is: ' + e.Message + #13#10#13#10;
      end;
    end; // try

  finally
    if FoldDB <> ADBName then begin
      AConn.Disconnect;
      AConn.Database := FoldDB;
    end;

    if FReconnectDB then AConn.Connect;

    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;

end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('ssSrvTypes', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  {$IFDEF UDEBUG}
  //debugUnregisterUnit(DEBUG_unit_ID);
  {$ENDIF}

end.
