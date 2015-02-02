{$I ok_server.inc}
//UDEBUG code already inserted. Please do not remove this line.
unit ssSrvDB;

interface

uses
  Classes, Forms, DBClient, ssMemDS, ExtCtrls, xClasses, ssSrvTypes,
  Provider, Midas, ComObj, ComServ;

var
  ClientCheckInterval : Cardinal = 600000; // ms
  ClientCheckTimeOut  : Cardinal = 60000;  // ms
  mtxClientsTimeOut   : Cardinal = 10000;
  mtxReservedTimeOut  : Cardinal = 10000;
  mtxUsersTimeout     : Cardinal = 10000;
  mtxDocLockedTimeout : Cardinal = 10000;
  mtxDBTimeout        : Cardinal = 10000;

  MaxClientsCount     : Integer = 1;

type
  TxSrvDBInfo = record
    DBPath      : string[255];
    ProvFile    : string[24];
    ProvTextFile: string[24];
    DBFile      : string[24];
    DBParamsFile: string[24];
    UsersFile   : string[24];
  end;

  //----------------------------------------------------------------------
  TxClientInfo = class
    public
      Addr       : pointer;
      IP         : string;
      Name       : string;
      Conn_Time  : TDateTime;
      Check_Time : TDateTime;

      FunID        : Integer;
      FunStartTime : TDateTime;

      Intf   : IDispatch;
      Stream : Pointer;

      lastError   : String;
      ValidClient : Boolean; // is client authenticated by the ClientRegInfo()?

      constructor Create(AAddr: pointer; const AIP, AName: string; AConn_Time, ACheck_Time: TDateTime; AIntf: IDispatch); virtual;
  end;

  //----------------------------------------------------------------------
  TxClients = class
    private
      {$IFDEF FREE}
        FList: array[0..0] of TxClientInfo;
      {$ELSE}
        FList: array of TxClientInfo;
      {$ENDIF}

      function GetClient(Index: Integer): TxClientInfo;
      function GetClientsCount: Integer;
      procedure SetClient(Index: Integer; const Value: TxClientInfo);

    public
      constructor Create; virtual;
      destructor Destroy; override;
      procedure Clear;

      function Add(AAddr: Pointer; AIP, AName: string; AConn_Time, ACheck_Time: TDateTime; AIntf: IDispatch; AStream: Pointer): TxClientInfo;
      function AddClient(AClientInfo: TxClientInfo): Integer;
      function GetClientByAddr(AAddr: Pointer): TxClientInfo;
      function GetClientByIP(IP: String): TxClientInfo;

      procedure Delete(AAddr: Pointer);
      procedure CopyStruct(AClients: TxClients);
      procedure CompactList;

      property Items[Index: Integer]: TxClientInfo read GetClient write SetClient;
      property ClientsCount: Integer read GetClientsCount;
  end;

  //----------------------------------------------------------------------
  //----------------------------------------------------------------------
  //----------------------------------------------------------------------
  TdbLocks = class
    public
      dbid: Integer;
      client: TxClientInfo;
      when: TDateTime;
  end;

  //----------------------------------------------------------------------
  TxSrvDB = class
    private
      FTimer: TTimer;
      FcdsDB: TClientDataSet;
      FcdsUsers: TClientDataSet;
      FcdsProv: TClientDataSet;
      FcdsProvText: TClientDataSet;
      FcdsDBParams: TClientDataSet;
      FClients: TxClients;
      FmdReserved: TssMemoryData;
      FmdDocLocked: TssMemoryData;
      FmdClients: TssMemoryData;
      FprvReserved: TDataSetProvider;
      //FClientsLockedTimeOut: cardinal;

      FmtxClients: TxMutex;
      FmtxReserved: TxMutex;
      FmtxUsers: TxMutex;
      FmtxDocLocked: TxMutex;

      FRsv_ID: Integer;
      FmdIDs: TssMemoryData;
      FmtxIDs: TxMutex;
      FmtxDB: TxMutex;

      Fdblocks: TList; // list of locked DBs (TdbLocks records)

      procedure CheckClients(Sender: TObject);
      procedure LoadBackupInfo;
      procedure CheckDBLocks;

    public
      property cdsUsers: TClientDataSet read FcdsUsers;
      property cdsDB: TClientDataSet read FcdsDB;
      property cdsProv: TClientDataSet read FcdsProv;
      property cdsProvText: TClientDataSet read FcdsProvText;
      property cdsDBParams: TClientDataSet read FcdsDBParams;
      property mdReserved: TssMemoryData read FmdReserved;
      property mdDocLocked: TssMemoryData read FmdDocLocked;
      property mdIDs: TssMemoryData read FmdIDs;

      property mtxClients: TxMutex read FmtxClients;
      property mtxReserved: TxMutex read FmtxReserved;
      property mtxUsers: TxMutex read FmtxUsers;
      property mtxDocLocked: TxMutex read FmtxDocLocked;
      property mtxIDs: TxMutex read FmtxIDs;
      property mtxDB: TxMutex read FmtxDB;

      property prvReserved: TDataSetProvider read FprvReserved;
      property Clients: TxClients read FClients;
      property Timer: TTimer read FTimer;
      property Rsv_ID: Integer read FRsv_ID write FRsv_ID;

      constructor Create(AInfo: TxSrvDBInfo); virtual;
      destructor Destroy; override;

      function AddClient(AClientInfo: TxClientInfo): TxSrvResult;
      function DeleteClient(AAddr: integer): TxSrvResult;
      procedure GetClients(AClients: TxClients);
      function SetClntActivity(AFunID: Integer; AAddr: Pointer): TxSrvResult;

      function Rsv_Add(AAddr, PosID, MatID, WID, AVisible: integer; Amount: Extended; var AID: Integer): TxSrvResult;
      function Rsv_Delete(AID, AAddr: integer): TxSrvResult;

      function DocLck_Add(AAddr, AID, AType: integer): TxSrvResult;
      function DocLck_Delete(AAddr, AID, AType: Integer): TxSrvResult;

      function Clnt_Check(AAddr: integer): TxSrvResult;
      {function Clnt_SendAll(AAction: TxQueueAction): TxSrvResult;

      function Usrs_Add(const AUserName, AFullName, APass: string): Integer;
      function Usrs_Delete(AUserID: Integer): Integer;
      function Usrs_Modify(AUserID: Integer; const AUserName, AFullName, APass: string): Integer;
      }

      procedure db_SaveBackupInfo(ADBID: Integer; const ABackupDir, AIntervalType: string; AIntervalValue: Integer; ABackupTime: TDateTime);
      procedure db_SaveUpdateStatInfo(ADBID: Integer; const AIntervalType: string; AIntervalValue: Integer; AUpdTime: TDateTime);

      function lockDB(dbid: Integer; AAddr: Pointer): Boolean;
      function unlockDB(dbid: Integer; AAddr: Pointer): Boolean;
  end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  {$IFDEF IBX}IBServices,{$ENDIF}
  udebug, Windows, IniFiles, DB,
  inGlobal,
  SysUtils, Variants, DateUtils, StrUtils,
  ssSrvConst, SrvData, ActiveX, xFun, ssRegUtils, Registry;

var 
  {$IFDEF UDEBUG}DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';{$ENDIF}
  FinLockFunc: Boolean = False;

//==============================================================================================
function getClientInfoStr(c: TxClientInfo; fallback: String = ''): String;
begin
  if c = nil 
  then Result := ' [no client info (nil)]'
  else begin
    try
      Result := ' [' + IntToStr(Integer(c.Addr)) + '] ' + c.Name + '/' + c.IP;
    except
      Result := '';
      if fallback <> '' then Result := ' ' + fallback;
      Result := Result + ' (Client info destroyed ! )';
    end;
  end;
end;

//==============================================================================================
function TxSrvDB.AddClient(AClientInfo: TxClientInfo): TxSrvResult;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxSrvDB.AddClient') else _udebug := nil;{$ENDIF}

  Result := srUnknown;

  case FmtxClients.Obtain of
    twAbandoned: Result := srAbandoned;
    twTimedOut:  Result := srTimedOut;

    twSuccess:
      try
        if FClients.AddClient(AClientInfo) <> -1 then Result := srNone;

      finally
        FmtxClients.Release;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TxSrvDB.Rsv_Add(AAddr, PosID, MatID, WID, AVisible: integer; Amount: Extended; var AID: Integer): TxSrvResult;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxSrvDB.Rsv_Add') else _udebug := nil;{$ENDIF}

  Result := srNone;

  case FmtxReserved.Obtain of
    twAbandoned: Result := srAbandoned;
    twTimedOut:  Result := srTimedOut;

    twSuccess:
      try
        Rsv_ID := Rsv_ID + 1;

        with FmdReserved do begin
          Append;
          FieldByName('id').AsInteger := Rsv_ID;
          FieldByName('addr').AsInteger := AAddr;
          FieldByName('posid').AsInteger := PosID;
          FieldByName('matid').AsInteger := MatID;
          FieldByName('wid').AsInteger := WID;
          FieldByName('amount').AsFloat := Amount;
          FieldByName('at_time').AsDateTime := Now;
          FieldByName('visible').AsInteger := AVisible;
          Post;
          First;
        end;

        AID := Rsv_ID;

      finally
        FmtxReserved.Release;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxSrvDB.CheckClients(Sender: TObject);
  {$IFNDEF FREE}
  var
    FAddr, i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  {$ENDIF}
begin
  {$IFNDEF FREE}
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxSrvDB.CheckClients') else _udebug := nil;{$ENDIF}

  if not CheckForDeadConnections then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  FAddr := 0;
  case FmtxClients.Obtain of
    twSuccess:
      begin
        LogEvent('= Checking for dead connections started');

        with FClients do
          try
            for i := 0 to High(FList) do begin
              if Items[i] <> nil then begin
                try
                  FAddr := Integer(Items[i].Addr);

                except
                  on E:Exception do begin
                    LogError('Check_Clients: corrupted reference found');
                    Items[i] := nil;
                    Continue;
                  end;
                end;

                try
                  if MillisecondsBetween(Now, Items[i].Check_Time) > ClientCheckTimeOut then begin
                    LogEvent('! dropping dead client: ' + getClientInfoStr(Items[i]) );

                    Delete(Items[i].Addr);
                    Rsv_Delete(-1, FAddr);
                    DocLck_Delete(FAddr, -1, 0);
                    Items[i] := nil;

                    //TssSrv(pointer(FAddr)).ComObject._Release;
                    //TssSrv(pointer(FAddr)).Free;
                  end;

                except
                  on E:Exception do begin
                    LogError('Check_Clients: ' + E.Message);
                    Items[i] := nil;
                  end;
                end;

              end; // if Items[i] <> nil
            end; // for i


          finally
            FmtxClients.Release;
            LogEvent('= Checking for dead connections finished');
          end;

      end; // tsSuccess:
  end; // case FmtxClients.Obtain

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  {$ENDIF} // not FREE
end;

//==============================================================================================
function TxSrvDB.Clnt_Check(AAddr: integer): TxSrvResult;
  var
    FClientInfo: TxClientInfo;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxSrvDB.Clnt_Check') else _udebug := nil;{$ENDIF}

  Result := srUnknown;

  case FmtxClients.Obtain of
    twAbandoned: Result := srAbandoned;
    twTimedOut:  Result := srTimedOut;

    twSuccess:
      try
        FClientInfo := FClients.GetClientByAddr(Pointer(AAddr));

        if FClientInfo <> nil then begin
          FClientInfo.Check_Time := Now;
          Result := srNone;
        end
        else Result := srUnknown;

      finally
        FmtxClients.Release;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
constructor TxSrvDB.Create(AInfo: TxSrvDBInfo);
  var
    FField: TField;
    intTmp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxSrvDB.Create') else _udebug := nil;{$ENDIF}

  try
    if ReadFromRegInt(ServerRegKey, 'ClientCheckInterval', intTmp, HKEY_LOCAL_MACHINE)
      then ClientCheckInterval := intTmp;

    if ReadFromRegInt(ServerRegKey, 'ClientCheckTimeOut', intTmp, HKEY_LOCAL_MACHINE)
      then ClientCheckTimeOut := intTmp;

    if ReadFromRegInt(ServerRegKey, 'CheckForDeadConnections', intTmp, HKEY_LOCAL_MACHINE)
      then CheckForDeadConnections := intTmp = 1;

    FcdsUsers := TClientDataSet.Create(nil);
    FcdsProv := TClientDataSet.Create(nil);
    FcdsProvText := TClientDataSet.Create(nil);
    FcdsDB := TClientDataSet.Create(nil);
    FcdsDBParams := TClientDataSet.Create(nil);
    FcdsProv.FileName := AInfo.DBPath + '\' + AInfo.ProvFile;
    FcdsProvText.FileName := AInfo.DBPath + '\' + AInfo.ProvTextFile;
    FcdsUsers.FileName := AInfo.DBPath + '\' + AInfo.UsersFile;
    FcdsDB.FileName := AInfo.DBPath + '\' + AInfo.DBFile;
    FcdsDBParams.FileName := AInfo.DBPath + '\' + AInfo.DBParamsFile;
    FcdsProv.Open;
    FcdsProvText.Open;

    with FcdsDB do begin
      FieldDefs.Add('dbid', ftInteger);
      FieldDefs.Add('desc', ftString, 128);
      FieldDefs.Add('def', ftInteger);
      FieldDefs[0].CreateField(FcdsDB);
      FieldDefs[1].CreateField(FcdsDB);
      FieldDefs[2].CreateField(FcdsDB);

      FField := TStringField.Create(FcdsDB);
      FField.FieldName := 'fbackupdir';
      FField.DataSet := FcdsDB;
      FField.FieldKind := fkInternalCalc;
      FField.Name := 'cdsDBBackupDirField';
      FField.Size := 128;

      FField := TIntegerField.Create(FcdsDB);
      FField.FieldName := 'fintervalvalue';
      FField.DataSet := FcdsDB;
      FField.FieldKind := fkInternalCalc;
      FField.Name := 'cdsDBIntervalValueField';

      FField := TStringField.Create(FcdsDB);
      FField.FieldName := 'fintervaltype';
      FField.DataSet := FcdsDB;
      FField.FieldKind := fkInternalCalc;
      FField.Name := 'cdsDBIntervalTypeField';
      FField.Size := 1;

      FField := TDateTimeField.Create(FcdsDB);
      FField.FieldName := 'fbackuptime';
      FField.DataSet := FcdsDB;
      FField.FieldKind := fkInternalCalc;
      FField.Name := 'cdsDBBackupTimeField';

      FField := TIntegerField.Create(FcdsDB);
      FField.FieldName := 'fupdintervalvalue';
      FField.DataSet := FcdsDB;
      FField.FieldKind := fkInternalCalc;
      FField.Name := 'cdsDBUpdIntervalValueField';

      FField := TStringField.Create(FcdsDB);
      FField.FieldName := 'fupdintervaltype';
      FField.DataSet := FcdsDB;
      FField.FieldKind := fkInternalCalc;
      FField.Name := 'cdsDBUpdIntervalTypeField';
      FField.Size := 1;

      FField := TDateTimeField.Create(FcdsDB);
      FField.FieldName := 'fupdtime';
      FField.DataSet := FcdsDB;
      FField.FieldKind := fkInternalCalc;
      FField.Name := 'cdsDBUpdTimeField';
    end;

    try
      FcdsDB.Open;
      FcdsDB.LogChanges := False;
      //LogError('problem w first DBOpen on ' + FcdsDB.FileName);

    except
      try
        FcdsDB.Open;
        FcdsDB.LogChanges := False;

      except
        LogError('fatal problem w DBOpen on ' + FcdsDB.FileName);
        Halt;
      end;
    end;

    LoadBackupInfo;

    FcdsDBParams.Open;
    FcdsUsers.Open;
    FcdsProv.LogChanges := False;
    FcdsProvText.LogChanges := False;
    FcdsDBParams.LogChanges := False;
    FcdsUsers.LogChanges := False;

    FClients := TxClients.Create;

    FmdReserved := TssMemoryData.Create(nil);

    with FmdReserved do begin
      FieldDefs.Add('id', ftInteger);
      FieldDefs.Add('addr', ftInteger);
      FieldDefs.Add('posid', ftInteger);
      FieldDefs.Add('matid', ftInteger);
      FieldDefs.Add('wid', ftInteger);
      FieldDefs.Add('amount', ftFloat);
      FieldDefs.Add('at_time', ftDateTime);
      FieldDefs.Add('visible', ftInteger);
      Open;
    end;

    FprvReserved := TDataSetProvider.Create(nil);
    FprvReserved.DataSet := FmdReserved;
    FprvReserved.Name := pSysRsv_List;

    FmdClients := TssMemoryData.Create(nil);
    with FmdClients do begin
      FieldDefs.Add('id', ftInteger);
      FieldDefs.Add('addr', ftInteger);
      FieldDefs.Add('ip', ftString, 48);
      FieldDefs.Add('name', ftString, 128);
      FieldDefs.Add('funid', ftInteger);
      Open;
    end;

    FmdDocLocked := TssMemoryData.Create(nil);
    with FmdDocLocked do begin
      FieldDefs.Add('id', ftInteger);
      FieldDefs.Add('addr', ftInteger);
      FieldDefs.Add('doctype', ftInteger);
      FieldDefs.Add('at_time', ftDateTime);
      Open;
    end;

    FmdIDs := TssMemoryData.Create(nil);
    with FmdIDs do begin
      FieldDefs.Add('tablename', ftString, 48);
      FieldDefs.Add('keyname', ftString, 48);
      FieldDefs.Add('id', ftInteger);
      FieldDefs.Add('dbid', ftInteger);
      Open;
    end;

    FmtxDB := TxMutex.Create(mtxDBTimeout);
    DieOnSysError('FmtxDB = nil');

    FmtxIDs := TxMutex.Create(mtxClientsTimeout);
    DieOnSysError('FmtxIDs = nil');

    FmtxClients := TxMutex.Create(mtxClientsTimeout);
    DieOnSysError('FmtxClients = nil');

    FmtxReserved := TxMutex.Create(mtxReservedTimeout);
    DieOnSysError('FmtxReserved = nil');

    FmtxDocLocked := TxMutex.Create(mtxDocLockedTimeout);
    DieOnSysError('FmtxDocLocked = nil');

    FmtxUsers := TxMutex.Create(mtxUsersTimeout);
    DieOnSysError('FmtxUsers = nil');

    FTimer := TTimer.Create(nil);
    FTimer.Interval := ClientCheckInterval;
    FTimer.OnTimer := CheckClients;

    FdbLocks := TList.Create;

  except
    on e: exception do begin
      logError(e.message);
      raise;
    end
  end;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TxSrvDB.DeleteClient(AAddr: integer): TxSrvResult;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxSrvDB.DeleteClient') else _udebug := nil;{$ENDIF}

  Result := srUnknown;

  case FmtxClients.Obtain of
    twAbandoned: Result := srAbandoned;
    twTimedOut:  Result := srTimedOut;

    twSuccess:
      try
        FClients.Delete(Pointer(AAddr));
        Result := srNone;

      finally
        FmtxClients.Release;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TxSrvDB.Rsv_Delete(AID, AAddr: Integer): TxSrvResult;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxSrvDB.Rsv_Delete') else _udebug := nil;{$ENDIF}

  Result := srNone;

  case FmtxReserved.Obtain of
    twAbandoned: Result := srAbandoned;
    twTimedOut:  Result := srTimedOut;

    twSuccess:
      try
        with FmdReserved do
          if AID = -1
            then while Locate('addr', AAddr, []) do Delete
            else if Locate('id', AID, []) then Delete;

      finally
        FmtxReserved.Release;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
destructor TxSrvDB.Destroy;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxSrvDB.Destroy') else _udebug := nil;{$ENDIF}

  try
    FprvReserved.Free;
    FcdsUsers.Free;
    FcdsDB.Free;
    FcdsProv.Free;
    FcdsProvText.Free;
    FcdsDBParams.Free;
    FmdReserved.Free;
    FmdDocLocked.Free;
    FmdIDs.Free;
    FTimer.Free;
    //LogEvent('= xSrvDB.Destroy: xClients.Count = ' + IntToStr(Clients.ClientsCount));
    FmdClients.Free;
    FClients.Free;

    FmtxClients.Free;
    FmtxUsers.Free;
    FmtxDB.Free;
    FmtxIDs.Free;
    FmtxDocLocked.Free;
    FmtxReserved.Free;

  except
    on e:Exception do LogError('xSrvDB.Destroy: ' + e.Message);
  end;

  LogEvent('********************************* Server shutdown ********************************');

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

{ TxClientInfo }
//==============================================================================================
constructor TxClientInfo.Create(AAddr: pointer; const AIP, AName: string; AConn_Time, ACheck_Time: TDateTime; AIntf: IDispatch);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxClientInfo.Create') else _udebug := nil;{$ENDIF}

  Addr := AAddr;
  IP := AIP;
  Name := AName;
  Conn_Time := AConn_Time;
  Check_Time := ACheck_Time;
  Intf := AIntf;
  lastError := '';
  ValidClient := False; // is client authenticated lately by the ClientRegInfo()?

  LogEvent('= (' + IntToStr(Integer(AAddr)) + ') Client record created: IP: ' + AIP + '; Name: ' + AName);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxSrvDB.GetClients(AClients: TxClients);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxSrvDB.GetClients') else _udebug := nil;{$ENDIF}

  case FmtxClients.Obtain of
    twSuccess:
      try
        AClients.CopyStruct(FClients);

      finally
        FmtxClients.Release;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxSrvDB.CheckDBLocks;
  var
    i: Integer;
    lr: TdbLocks;
    cl: TxClientInfo;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxSrvDB.CheckDBLocks') else _udebug := nil;{$ENDIF}

  try //except
    for i := 0 to FdbLocks.Count - 1 do begin
      lr := FdbLocks[i];

      cl := nil;

      try
        cl := FClients.GetClientByAddr(lr.client);

        if MilliSecondsBetween(now, lr.when) > DBsLockedTimeOut then begin // timeout
          LogEvent('? TxSrvDB.CheckDBLocks: DB lock of ' + getClientInfoStr(cl, IntToStr(Integer(lr.client)) ) + ' timed out', 10);

          lr := nil;
        end;

      except
        lr := nil;
      end;

      if (cl = nil) or (lr = nil) then begin
        TdbLocks(FdbLocks[i]).Destroy;
        FdbLocks[i] := nil;
      end;
    end;

    FdbLocks.Pack;

  except
    on e: Exception do LogError('TxSrvDB.CheckDBLocks: exception: ' + e.Message);
  end;
  
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TxSrvDB.lockDB(dbid: Integer; AAddr: Pointer): Boolean;
  var
    i: Integer;
    lr: TdbLocks;
    cl: TxClientInfo;
    st: Cardinal;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxSrvDB.lockDB') else _udebug := nil;{$ENDIF}

  Result := False;

  try // finally
    if not WaitForLock(FinLockFunc, 2) then begin
      LogError('TxSrvDB.lockDB: WaitForLock timeout');
      Exit;
    end;

    CheckDBLocks;

    st := GetTickCount;

    while (dbid = -1) and (FdbLocks.Count > 0) do begin
      sleep(100);

      if GetTickCount - st > DBsLockedTimeOut then  begin
        LogError('TxSrvDB.lockDB for all: timeout');
        Exit;
      end;

      CheckDBLocks;
    end;

    if (maxclientscount = 1) and (FdbLocks.Count > 1) then LogError('TxSrvDB.lockDB: more than 1 lock per client found');

    for i := 0 to FdbLocks.Count - 1 do begin // check locking availability
      cl := nil;

      try
        lr := FdbLocks[i];
        cl := FClients.GetClientByAddr(lr.client);

        if lr.dbid = dbid then begin
          // if there is lock from other client then it is not expired yet (check above) we just leave
          if lr.client = AAddr
            then begin
              lr.when := now; // refreshing. (maybe this is bad practice?)
              Result := True;
            end
            else LogEvent('TxSrvDB.lockDB: DB ' + IntTosTr(dbid) + ' is still locked by ' + getClientInfoStr(cl), 0);

          Exit;
        end;

      except
        on e: Exception do LogError('TxSrvDB.lockDB: DB ' + IntTosTr(dbid) + ' lock ' + getClientInfoStr(cl) + ' timed out (client is gone)')
      end;
    end; // for

    // locking
    lr := TdbLocks.Create;
    lr.dbid := dbid;
    lr.when := now;
    lr.client := AAddr;
    FdbLocks.add(lr);

    cl := FClients.GetClientByAddr(AAddr);
    LogEvent('= (' + IntToStr(Integer(AAddr)) + ') TxSrvDB.lockDB: id: ' + IntTostr(dbid) + getClientInfoStr(cl), 15);

    Result := True;

  finally
    FinLockFunc := False;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
function TxSrvDB.unlockDB(dbid: Integer; AAddr: Pointer): Boolean;
  var
    i: Integer;
    lr: TdbLocks;
    cl: TxClientInfo;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxSrvDB.unlockDB') else _udebug := nil;{$ENDIF}

  Result := False;

  try // finally
    if not WaitForLock(FinLockFunc, 2) then begin
      LogError('TxSrvDB.unLockDB: WaitForLock timeout');
      Exit;
    end;

    CheckDBLocks;

    cl := FClients.GetClientByAddr(AAddr);

    if cl = nil then begin
      LogEvent('! (' + IntToStr(Integer(AAddr)) + ') TxSrvDB.unlockDB: DB id: ' + IntTostr(dbid) + ' locked by dead client. Overrided', 5);
      Result := True;
      exit;
    end;

    for i := 0 to FdbLocks.Count - 1 do begin // check locking availability
      try
        lr := FdbLocks[i];

        if (lr.dbid = dbid) or (dbid = -1) then begin
          if lr.client = AAddr then begin
            lr.Destroy;
            FdbLocks[i] := nil;
            Result := True;
          end
          else LogError('TxSrvDB.unlockDB: non-owner: ' + getClientInfoStr(cl, IntToStr(Integer(AAddr)) ) + ' tried to unlock DB id: ' + IntTostr(dbid));
        end;

      except
        on e: Exception do begin
          LogError('TxSrvDB.unlockDB: DB id: ' + IntTostr(dbid) + ' failed for ' + getClientInfoStr(cl, IntToStr(Integer(AAddr))) );
        end;
      end;
    end;

    try
      if Result
        then LogEvent('= (' + IntToStr(Integer(AAddr)) + ') TxSrvDB.unlockDB: DB id: ' + IntTostr(dbid) + ' UN-locked' + getClientInfoStr(cl), 15)
        else LogError('! (' + IntToStr(Integer(AAddr)) + ') TxSrvDB.unlockDB: DB id: ' + IntTostr(dbid) + ' UN-lock fails' + getClientInfoStr(cl) );

    except
    end;

    FdbLocks.Pack;

  finally
    FinLockFunc := False;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
procedure TxClients.CopyStruct(AClients: TxClients);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxClients.CopyStruct') else _udebug := nil;{$ENDIF}

  Clear;

  for i := 0 to AClients.ClientsCount - 1 do
    if AClients.Items[i] <> nil
      then Self.Add(AClients.Items[i].Addr, AClients.Items[i].IP, AClients.Items[i].Name,
                    AClients.Items[i].Conn_Time, AClients.Items[i].Check_Time, nil, nil);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
(*
function TxSrvDB.Clnt_SendAll(AAction: TxQueueAction): TxSrvResult;
 var
   FIntf: IDispatch;
   v: Variant;
   i: Integer;
   {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxSrvDB.Clnt_SendAll') else _udebug := nil;{$ENDIF}

  case FmtxClients.Obtain of
   twAbandoned:
     begin
       Result := srAbandoned;
       Exit;
     end;

   twTimedOut:
     begin
       Result := srTimedOut;
       Exit;
     end;

   twSuccess:
     try
       with FClients do begin
        for i := 0 to ClientsCount - 1 do begin
          try
            OleCheck(CoGetInterfaceAndReleaseStream(IStream(Items[i].Stream), IID_IDispatch, Items[i].Intf));
          except
            on e:exception do begin
              LogError('CoGetInterfaceAndReleaseStream: '+e.Message);
              Exit;
            end;
          end;

          try
            v := Items[i].Intf;
            if not VarIsNull(v)
              then v.ExecCommand(AAction.ActionType, AAction.Param, AAction.AddInfo);

          except
            on e:exception do begin
              LogError('ExecCommand: ' + e.Message + ' ' + getClientInfoStr(Items[i]) );
              Items[i].Intf := null;
              FClients.Delete(Items[i].Addr);
              Exit;
            end;
          end;

          try
            Items[i].Stream := nil;
            if not VarIsNull(Items[i].Intf) then
              OleCheck(CoMarshalInterThreadInterfaceInStream(IID_IDispatch, Items[i].Intf, IStream(Items[i].Stream)));

          except
            on e:exception do LogError('CoMarshalInterThreadInterfaceInStream: '+e.Message);
          end;
        end;
       end;

       Result := srNone;

     finally
       FmtxClients.Release;
     end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
*)

{ TxClients }
//==============================================================================================
function TxClients.Add(AAddr: Pointer; AIP, AName: string; AConn_Time, ACheck_Time: TDateTime; AIntf: IDispatch; AStream: Pointer): TxClientInfo;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxClients.Add') else _udebug := nil;{$ENDIF}

  Result := TxClientInfo.Create(AAddr, AIP, AName, AConn_Time, ACheck_Time, AIntf);

  if AddClient(Result) = -1 then begin
    Result.Free;
    Result := nil;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TxClients.AddClient(AClientInfo: TxClientInfo): Integer;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxClients.AddClient') else _udebug := nil;{$ENDIF}

  {$IFDEF FREE}
    if FList[0] = nil 
      then begin
        Result := 0;
        FList[0] := AClientInfo;
      end
      else Result := -1;

  {$ELSE}
    if length(FList) < MaxClientsCount then begin
      //{$IFDEF DEBUG}LogEvent('* MaxUsers reset from ' + IntToStr(length(FList)) + ' to ' + IntToStr(MaxClientsCount));{$ENDIF}
      i := High(FList) + 1;
      SetLength(FList, MaxClientsCount);

      while i <= High(FList) do begin
        Flist[i] := nil;
        inc(i);
      end;
    end;

    for i := 0 to High(FList) do if FList[i] = nil then Break;

    if i > High(FList)
      then begin
        Result := -1;
        LogError('TxClients.AddClient: no room');
      end
      else begin
        FList[i] := AClientInfo;
        Result := i;
      end;

  {$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxClients.Clear;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxClients.Clear') else _udebug := nil;{$ENDIF}

  for i := 0 to High(FList) do begin
    if Items[i] = nil then Continue;

    try
      if Items[i].Stream <> nil then
        if CoReleaseMarshalData(IStream(Items[i].Stream)) <> S_OK
          then LogError('TxClients.Clear: CoReleaseMarshalData: ' + GetSysError + getClientInfoStr(Items[i]) );

    except
      on e: Exception do LogError('TxClients.Clear: CoReleaseMarshalData: ' + e.Message + '/' + GetSysError);
    end;

    try
      Items[i].Free;

    except
      on e: Exception do LogError('TxClients.Clear: txClient.Free: ' + e.Message);
    end;

    Items[i] := nil;
  end; // for i := 0 to High(FList)

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
constructor TxClients.Create;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxClients.Create') else _udebug := nil;{$ENDIF}

  {$IFNDEF FREE}
    if MaxClientsCount > 0
      then SetLength(FList, MaxClientsCount)
      else SetLength(FList, 1);
  {$ENDIF}

  for i := 0 to High(FList) do FList[i] := nil; 

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxClients.CompactList;
  var
    i, ii: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxClients.CompactList') else _udebug := nil;{$ENDIF}

  try
    i := 0;
    while i < High(Flist) do begin
      while Flist[i] <> nil do begin
        inc(i);
        if i >= High(Flist) then Exit;
      end;

      for ii := i + 1 to High(FList)
        do if Flist[ii] <> nil then begin
          Flist[i] := Flist[ii];
          Flist[ii] := nil;
          break;
        end;

      if Flist[i] = nil then Break; // no more items up there
    end; // while i < High(Flist) 

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
function TxClients.GetClientsCount: Integer;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxClients.GetClientsCount') else _udebug := nil;{$ENDIF}

  Result := 0;

  //{$IFDEF DEBUG}logEvent('* clientsCount: High(Flist): ' + intTosTr(High(Flist)));{$ENDIF}

  for i := 0 to High(FList) do begin
    try
      if FList[i] = nil then Continue;

      if Flist[i].Name <> '' then inc(Result);

      (*{$IFDEF DEBUG}
      logEvent('* clientsCount: #' + intTosTr(i) + ';' + getClientInfoStr(Flist[i]) + '; Valid: ' + BoolToStr(FList[i].validclient));
      {$ENDIF}
      *)

    except
      LogError('TxClients.getClientsCount: abandoned reference found for item #' + IntToStr(i));
      Flist[i] := nil;
    end;
  end;

  CompactList;

  //{$IFDEF DEBUG}logEvent('= clientsCount: ' + intTosTr(Result));{$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxClients.Delete(AAddr: Pointer);
  var
    i: Integer;
    Found: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxClients.Delete') else _udebug := nil;{$ENDIF}

  Found := False;

  for i := 0 to High(FList) do begin
    if Items[i] = nil then Continue;

    // well we'll try to track every possible fuckup with this list
    try
      if Items[i].Addr <> AAddr then Continue;

    except
      LogError('TxClients.Delete: abandoned reference found for ' + IntToStr(Integer(AAddr)));
      Items[i] := nil;
      Continue;
    end;

    //----------------------------
    try
      if Items[i].Stream <> nil then
        if CoReleaseMarshalData(IStream(Items[i].Stream)) <> S_OK
          then LogError('TxClients.Delete: CoReleaseMarshalData' + getClientInfoStr(Items[i]) );

    except
      LogError('TxClients.Delete: CoReleaseMarshalData crashed');
    end;

    //----------------------------
    try
      LogEvent('= TxClients.Delete: Client is beind deleted: ' + getClientInfoStr(Items[i], IntToStr(Integer(AAddr)) ) );

    except
      LogError('TxClients.Delete: Client data corrupted for: ' + IntToStr(Integer(AAddr)));
    end;

    //----------------------------
    try
      Items[i].Free;

    except
      LogError('TxClients.Delete: txclient.Free crashed for ' + IntToStr(Integer(AAddr)));
    end;

    Items[i] := nil;
 
    Found := True;
  end;

  if not Found then LogEvent('! Warning: TxClient.Delete for missing client: ' + IntToStr(Integer(AAddr)));

  CompactList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
destructor TxClients.Destroy;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxClients.Destroy') else _udebug := nil;{$ENDIF}

  Clear;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TxClients.GetClient(Index: Integer): TxClientInfo;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxClients.GetClient') else _udebug := nil;{$ENDIF}

  if (Index < 0) or (high(FList) < Index) then begin
    Result := nil;
    logError('GetClient: index out of bounds');
  end
  else Result := FList[Index];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TxClients.GetClientByAddr(AAddr: Pointer): TxClientInfo;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxClients.GetClientByAddr') else _udebug := nil;{$ENDIF}

  Result := nil;

  for i := 0 to High(FList) do
    try
      if (Items[i] <> nil) and (Items[i].Addr = AAddr) then begin
        Result := Items[i];
        Break;
      end;

    except
      Items[i] := nil;
      CompactList;
      LogError('TxClients.GetClientByAddr: abandoned reference found');
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TxClients.GetClientByIP(IP: String): TxClientInfo;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxClients.GetClientByIP') else _udebug := nil;{$ENDIF}

  Result := nil;

  for i := 0 to High(FList) do
    try
      if (Items[i] <> nil) and (Items[i].IP = IP) then begin
        Result := Items[i];
        Break;
      end;

    except
      Items[i] := nil;
      CompactList;
      LogError('TxClients.GetClientByIP: abandoned reference found');
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxClients.SetClient(Index: Integer; const Value: TxClientInfo);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxClients.SetClient') else _udebug := nil;{$ENDIF}

  if (Index < 0) or (Index > High(FList))
    then LogError('TxClients.SetClient with index out of bounds')
    else FList[Index] := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

(*
//==============================================================================================
function TxSrvDB.Usrs_Add(const AUserName, AFullName, APass: string): Integer;
  {$IFDEF IBX}
  var
    FID, FSysID: Integer;
    FSysName: string;
    i: Integer;
  {$ENDIF}
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxSrvDB.Usrs_Add') else _udebug := nil;{$ENDIF}

  {$IFDEF IBX}
  with TIBSecurityService.Create(nil) do
    try
      try
        LoginPrompt := False;
        ServerName := 'localhost';
        Params.Add('user_name=sysdba');
        Params.Add('password=masterkey');
        Active := True;

        FID := GetMax(cdsUsers, 'userid') + 1;
        FSysName := 'USER' + IntToStr(FID);
        DisplayUser(FSysName);

        if (UserInfoCount = -1) or not cdsUsers.Locate('login', AUserName, [loCaseInsensitive])
        then begin
          DisplayUsers;
          FSysID := 0;

          for i := 0 to UserInfoCount - 1 do
            if UserInfo[i].UserID > FSysID then FSysID := UserInfo[i].UserID;

          FSysName := 'USER' + IntToStr(FSysID + 1);

          UserName := FSysName;
          UserID := FSysID + 1;

          {if APass = EmptyStr
            then Password := '1'
            else }Password := FSysName;

          try
            AddUser;
            cdsUsers.SaveToFile(cdsUsers.FileName, dfXML);
            cdsUsers.First;
            Result := FSysID + 1;

          except
            on E: Exception do begin
              Result := -2; // error creating firebird user
              cdsUsers.Delete;
              LogError(E.Message + '; ' + FSysName);
            end;
          end;
        end
        else Result := -3; // user exists

        Active := False;

      except
        Result := -1; // unknown error
      end;

    finally
      Free;
    end;
  {$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TxSrvDB.Usrs_Delete(AUserID: Integer): Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxSrvDB.Usrs_Delete') else _udebug := nil;{$ENDIF}

  {$IFDEF IBX}
  with TIBSecurityService.Create(nil) do
    try
      try
        LoginPrompt := False;
        ServerName := 'localhost';
        Params.Add('user_name=sysdba');
        Params.Add('password=masterkey');
        Active := True;

        if cdsUsers.Locate('userid', AUserID, []) then begin
          FSysName := cdsUsers.FieldByName('sysname').AsString;
          UserName := FSysName;
          try
            //DeleteUser;
            cdsUsers.Delete;
            cdsUsers.SaveToFile(cdsUsers.FileName, dfXML);
            cdsUsers.First;
            Result := 0;

          except
            Result := -2; // error deleting firebird user
          end;
        end
        else Result := -3; // invalid user id

        Active := False;

      except
        Result := -1; // unknown error
      end;

    finally
      Free;
    end;
  {$ENDIF}


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TxSrvDB.Usrs_Modify(AUserID: Integer; const AUserName, AFullName, APass: string): Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxSrvDB.Usrs_Modify') else _udebug := nil;{$ENDIF}

  {$IFDEF IBX}
  with TIBSecurityService.Create(nil) do
    try
      try
        LoginPrompt := False;
        ServerName := 'localhost';
        Params.Add('user_name=sysdba');
        Params.Add('password=masterkey');
        Active := True;

        FSysName := 'USER' + IntToStr(AUserID);
        try
          if UpperCase(FSysName) <> 'SYSDBA' then begin
            DisplayUser(FSysName);
            UserName := UserInfo[0].UserName;

            if APass = EmptyStr
              then Password := '1'
              else Password := FSysName;

            ModifyUser;
          end;

          {cdsUsers.Edit;
          cdsUsers.FieldByName('name').AsString := AFullName;
          cdsUsers.FieldByName('login').AsString := AUserName;
          cdsUsers.FieldByName('pass').AsString := APass;
          cdsUsers.Post;
          cdsUsers.SaveToFile(cdsUsers.FileName, dfXML);
          cdsUsers.First;
          }
          Result := 0;

        except
          on e:exception do begin
            logError('TxSrvDB.Usrs_Modify: ' + e.Message);
            Result := -2; // error updating firebird user
          end;
        end;
        //end
        //else Result := -3; // invalid user id

        Active := False;

      except
        Result := -1; // unknown error
      end;

    finally
      Free;
    end;
  {$ENDIF}


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
*)

//==============================================================================================
function TxSrvDB.DocLck_Add(AAddr, AID, AType: integer): TxSrvResult;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxSrvDB.DocLck_Add') else _udebug := nil;{$ENDIF}

  Result := srNone;

  case FmtxDocLocked.Obtain of
    twAbandoned: Result := srAbandoned;
    twTimedOut:  Result := srTimedOut;

    twSuccess:
      try
        with FmdDocLocked do begin
          Append;
          FieldByName('id').AsInteger := AID;
          FieldByName('addr').AsInteger := AAddr;
          FieldByName('at_time').AsDateTime := Now;
          FieldByName('doctype').AsInteger := AType;
          Post;
          First;
        end;

      finally
        FmtxDocLocked.Release;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TxSrvDB.DocLck_Delete(AAddr, AID, AType: Integer): TxSrvResult;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxSrvDB.DocLck_Delete') else _udebug := nil;{$ENDIF}

  Result := srNone;

  case FmtxDocLocked.Obtain of
    twAbandoned: Result := srAbandoned;
    twTimedOut:  Result := srTimedOut;

    twSuccess:
      try
        with FmdDocLocked do
         if AID = -1
           then while Locate('addr', AAddr, []) do Delete
           else if Locate('id;doctype', VarArrayOf([AID, AType]), []) then Delete;

      finally
        FmtxDocLocked.Release;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxSrvDB.LoadBackupInfo;
  var
    FDBKey: string;
    intTmp: Integer;
    strDir, strType: string;
    dtTime: TDateTime;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxSrvDB.LoadBackupInfo') else _udebug := nil;{$ENDIF}

  with TRegistry.Create do
  try
    RootKey := HKEY_LOCAL_MACHINE;
    FcdsDB.First;

    while not FcdsDB.Eof do begin
      FDBKey := 'DB' + FcdsDB.FieldByName('dbid').AsString;

      if OpenKey(BackupSvcRegKey + '\' + FDBKey, False) then
        try
          try
            intTmp := ReadInteger('IntervalValue');
            strDir := ReadString('BackupDir');
            strType := ReadString('IntervalType');
            dtTime := ReadDateTime('BackupTime');

            FcdsDB.Edit;
            FcdsDB.FieldByName('fintervalvalue').AsInteger := intTmp;
            FcdsDB.FieldByName('fbackupdir').AsString := strDir;
            FcdsDB.FieldByName('fintervaltype').AsString := strType;
            FcdsDB.FieldByName('fbackuptime').AsDateTime := dtTime;
            FcdsDB.Post;

          except
            on e: exception do LogError('TxSrvDB.LoadBackupInfo: ' + e.message);
          end;

          try
            intTmp  := ReadInteger('UpdIntervalValue');
            strType := ReadString('UpdIntervalType');
            dtTime  := ReadDateTime('UpdTime');
            FcdsDB.Edit;
            FcdsDB.FieldByName('fupdintervalvalue').AsInteger := intTmp;
            FcdsDB.FieldByName('fupdintervaltype').AsString := strType;
            FcdsDB.FieldByName('fupdtime').AsDateTime := dtTime;
            FcdsDB.Post;

          except
            on e: exception do LogEvent('= TxSrvDB.LoadBackupInfo: ' + e.message);
          end;

        finally
          CloseKey;
        end;

      FcdsDB.Next;
    end;

    FcdsDB.First;

  finally
    Free;
  end;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxSrvDB.db_SaveBackupInfo(ADBID: Integer; const ABackupDir,
  AIntervalType: string; AIntervalValue: Integer; ABackupTime: TDateTime);

  var
    Reg: TRegistry;
    FDBKey: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxSrvDB.db_SaveBackupInfo') else _udebug := nil;{$ENDIF}

  FDBKey := 'DB' + IntToStr(ADBID);
  Reg := TRegistry.Create;

  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;

    with FcdsDB do
    if Locate('dbid', ADBID, []) then begin
      Edit;
      FieldByName('fbackupdir').AsString := ABackupDir;
      FieldByName('fintervaltype').AsString := AIntervalType;
      FieldByName('fbackuptime').AsDateTime := ABackupTime;
      FieldByName('fintervalvalue').AsInteger := AIntervalValue;
      Post;

      WriteToRegDate(BackupSvcRegKey + '\' + FDBKey, 'LastBackupTime', 0, HKEY_LOCAL_MACHINE);
      WriteToRegStr(BackupSvcRegKey + '\' + FDBKey, 'BackupDir', ABackupDir, HKEY_LOCAL_MACHINE);
      WriteToRegStr(BackupSvcRegKey + '\' + FDBKey, 'IntervalType', AIntervalType, HKEY_LOCAL_MACHINE);
      WriteToRegInt(BackupSvcRegKey + '\' + FDBKey, 'IntervalValue', AIntervalValue, HKEY_LOCAL_MACHINE);
      WriteToRegDate(BackupSvcRegKey + '\' + FDBKey, 'BackupTime', ABackupTime, HKEY_LOCAL_MACHINE);
    end;

  finally
    Reg.Free;
  end;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxSrvDB.db_SaveUpdateStatInfo(ADBID: Integer;
  const AIntervalType: string; AIntervalValue: Integer; AUpdTime: TDateTime);

  var
    Reg: TRegistry;
    FDBKey: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxSrvDB.db_SaveUpdateStatInfo') else _udebug := nil;{$ENDIF}

  FDBKey := 'DB' + IntToStr(ADBID);
  Reg := TRegistry.Create;

  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;

    with FcdsDB do
    if Locate('dbid', ADBID, []) then begin
      Edit;
      FieldByName('fupdintervaltype').AsString := AIntervalType;
      FieldByName('fupdtime').AsDateTime := AUpdTime;
      FieldByName('fupdintervalvalue').AsInteger := AIntervalValue;
      Post;

      WriteToRegDate(BackupSvcRegKey + '\' + FDBKey, 'LastUpdTime', 0, HKEY_LOCAL_MACHINE);
      WriteToRegStr(BackupSvcRegKey + '\' + FDBKey, 'UpdIntervalType', AIntervalType, HKEY_LOCAL_MACHINE);
      WriteToRegInt(BackupSvcRegKey + '\' + FDBKey, 'UpdIntervalValue', AIntervalValue, HKEY_LOCAL_MACHINE);
      WriteToRegDate(BackupSvcRegKey + '\' + FDBKey, 'UpdTime', AUpdTime, HKEY_LOCAL_MACHINE);
    end;

  finally
    Reg.Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TxSrvDB.SetClntActivity(AFunID: Integer; AAddr: Pointer): TxSrvResult;
  var
    ci: TxClientInfo;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxSrvDB.SetClntActivity') else _udebug := nil;{$ENDIF}

  Result := srUnknown;

  try
    case FmtxClients.Obtain of
      twAbandoned: Result := srAbandoned;
      twTimedOut:  Result := srTimedOut;

      twSuccess:
        try
          ci := FClients.GetClientByAddr(AAddr);

          if ci <> nil then with ci do begin
            FunID := AFunID;
            FunStartTime := Now;
          end
          else LogError('(' + IntToStr(Integer(AAddr)) + ') TxSrvDB.SetclientActivity: missing client');

        finally
          FmtxClients.Release;
        end;
    end;

  except
    on E: Exception do LogError('SetClntActivity: ' + E.Message);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('ssSrvDB', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  {$IFDEF UDEBUG}
  //debugUnregisterUnit(DEBUG_unit_ID);
  {$ENDIF}

end.
