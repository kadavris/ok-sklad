{$I ok_server.inc}
//UDEBUG code already inserted. Please do not remove this line.
unit SrvData;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  {$IFDEF ZEOS}ZSQLMonitor,{$ENDIF}
  DBClient, okServer_TLB, StdVcl, DB, ssMemDS, ssSrvTypes, Provider, Midas,
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  AppEvnts;

type
  TokSrv = class(TRemoteDataModule, IokSrv)
    ApplicationEvents1: TApplicationEvents;
      procedure RemoteDataModuleCreate(Sender: TObject);
      procedure RemoteDataModuleDestroy(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);

    private
      Conn: TxConnection; // DB conn
      FClientStored: Boolean; // is client was stored in server's list actually
      FDBID: Integer;
      FDBPath: string;
      FIntf: IDispatch;
      FIP, FHost: string;
      FValidClient: Boolean; // client-server interoperability cross check result
      FVersion: string;
      InTran: Boolean;
      internalTrPlace: String; // place of current internal transaction. used to identify stalled ones

      lastSQLError, lastTrErrors: String;

      mdProv, mdText, mdDB, mdDBInfo: TssMemoryData;

      PrvCache: TProvCache;
      PrvList: TStringList;
      prvProv, prvDB, prvDBParams, prvUsers: TDataSetProvider;

      UserFullName: string;
      UserID: Integer;
      UserLogin: string;
      UserPass: string;
      UserSysName: string;

      procedure LoadProviders;
      //procedure LoadDBs;
      procedure GetProvList;

      procedure storeErrorMessage(const m: String; log: boolean = True); // AP: saves&logs error message for client retrieval
      procedure storeMessage(const prefix, m: String; const ADebugLevel: Integer = 0);
      procedure clearErrorMessage;
      {$IFDEF ZEOS}
      procedure sqlLogger(Sender: TObject; Event: TZLoggingEvent);
      {$ENDIF}

      function TrState: String;

      {procedure lock;
      procedure Unlock;
      }

      function lockDB: Boolean;
      procedure UnlockDB;

      // internal transactions helpers. do not start nested trs if user already started one. also checks for lost transactions and other things
      procedure InternalTrStart(place: string);
      procedure InternalTrCommit;
      procedure InternalTrRollback;

    protected
      class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
      function AS_GetProviderNames: OleVariant; safecall;
      function AS_GetRecords(const ProviderName: WideString; Count: Integer;
        out RecsOut: Integer; Options: Integer; const CommandText: WideString;
        var Params, OwnerData: OleVariant): OleVariant; safecall;

      function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant;
        MaxErrors: Integer; out ErrorCount: Integer;
        var OwnerData: OleVariant): OleVariant; safecall;

      function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; safecall;
      function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; safecall;
      function AS_RowRequest(const ProviderName: WideString; Row: OleVariant;
               RequestType: Integer; var OwnerData: OleVariant): OleVariant; safecall;

      procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; var Params, OwnerData: OleVariant); safecall;
      procedure Commit; safecall;
      procedure Rollback; safecall;
      procedure Start; safecall;
      function GetMaxProvID: OleVariant; safecall;
      function AddProvider(ID: Integer; const Name: WideString; PID, IsGroup, IsNew: Integer): OleVariant; safecall;
      function DropProvider(ID: Integer): OleVariant; safecall;
      function ModifyProvText(ID: Integer; const Text: WideString): OleVariant; safecall;
      function GetProvText(ID: Integer): OleVariant; safecall;
      function AS_GetMacros(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; safecall;
      procedure AS_SetMacros(const ProviderName: WideString; var Macros: OleVariant); safecall;
      function SetClientInfo(const IP, Host: WideString; const Intf: IDispatch): OleVariant; safecall;
      function GetDBParams(ID: Integer): OleVariant; safecall;
      function AddDB(ID: Integer; const Name: WideString; Def, IsNew: Integer): OleVariant; safecall;
      function AddDBParams(ID: Integer; const DBParams: WideString; IsNew: Integer): OleVariant; safecall;
      function DropDB(ID, DelFile: Integer): OleVariant; safecall;
      function Connect(DBID: Integer): OleVariant; safecall;
      procedure Disconnect; safecall;
      function CreateDBFile(const AFileName, AParams: string): Integer;
      function CheckLogin(const Login, Pass: WideString; DBID, SMode: Integer): OleVariant; safecall;
      function NewDB(const FileName, Params: WideString): OleVariant; safecall;
      function GetDBFileName: OleVariant; safecall;
      function Rsv_Add(PosID, MatID, WID, AVisible: Integer; Amount: Double): OleVariant; safecall;
      procedure Rsv_Delete(ID: Integer); safecall;
      procedure Clnt_Check; safecall;
      function Callback_Reg(const Intf: IAppServer; out ID: OleVariant): OleVariant; safecall;
      procedure q_Add(AType: Integer; AParam: OleVariant); safecall;
      function db_TestConnect(const Path: WideString): OleVariant; safecall;
      function db_Update(ID: Integer; const Name: WideString; Def: Integer; const Path: WideString): OleVariant; safecall;
      procedure usr_WriteBlob(const Data: WideString; ALength: Integer;
                const ATable, AField: WideString; AID: Integer; const AKeyField,
                APar1, Apar2: WideString); safecall;
      function usrs_Add(const Login, Pass, FullName: WideString): OleVariant; safecall;
      function usrs_Delete(UserID: Integer): OleVariant; safecall;
      function usrs_Update(UserID: Integer; const UserName, Pass, FullName: WideString): OleVariant; safecall;
      function doclck_Add(ID, DocType: Integer): OleVariant; safecall;
      function doclck_Delete(ID, DocType: Integer): OleVariant; safecall;
      function doclck_Check(ID, DocType: Integer): OleVariant; safecall;
      function GetMaxID(const TableName, KeyName: WideString): OleVariant; safecall;
      function db_Backup(const BackupFile: WideString; DBID: Integer): OleVariant; safecall;
      function db_Restore(const BackupFile: WideString; DBID: Integer): OleVariant; safecall;
      function db_SaveBackupInfo(DBID: Integer; const BackupDir: WideString;
               IntervalValue: Integer; const IntervalType: WideString;
               var BackupTime: OleVariant): OleVariant; safecall;

      function db_UpdateStat(DBID: Integer): OleVariant; safecall;
      function db_SaveUpdateStatInfo(DBID, IntervalValue: Integer;
               const IntervalType: WideString; var UpdTime: OleVariant): OleVariant; safecall;

      function GetDBVersion: String;
      function db_CheckVersion(const Ver: WideString): OleVariant; safecall;
      function db_DoUpdate(const Ver: WideString): OleVariant; safecall;
      procedure usr_SetActivity(FunID: Integer); safecall;
      function ver_GetCount: OleVariant; safecall;
      function db_ExecScript(const sql: WideString): OleVariant; safecall;
      function db_SetDialect(DBID, Value: Integer): OleVariant; safecall;
      function db_Copy(ADBFrom, ADBTo: Integer; const Tables: WideString; DelData, CType: Integer; OnDate: TDateTime): OleVariant; safecall;
      function stat_GetLog: OleVariant; safecall;
      function stat_lastError: OleVariant; safecall;
      function ClientRegInfo(const AclientMsg: WideString; out AservKey, AservMsg: OleVariant): OleVariant; safecall;
      function stat_lastTrErrors: OleVariant; safecall;
      function db_Repair(const BackupFile: WideString; DBID: Integer): OleVariant; safecall;
    function Command(Code: Integer; Params: OleVariant;
      out Output: OleVariant): OleVariant; safecall;  function IokSrv.Callback_Reg = IokSrv_Callback_Reg;
    function IokSrv_Callback_Reg(const Intf: IAppServer;
      out ID: OleVariant): OleVariant; safecall;
  end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  {$IFDEF ZEOS}ZdbcLogging,{$ENDIF}
  udebug,//must be always included for some internal functions
  Dialogs, ssSrvConst, Main, ssFun, Variants, xStrUtils, xFun, CommonConstants, Forms, Controls,
  xIBUtils, xIBQuery,
  ssSrvDB, xClasses, ActiveX,
  ssRegUtils, ssStrUtil, Types, DateUtils, StrUtils, protection;

{$IFDEF UDEBUG}
var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';
{$ENDIF}

{$R *.DFM}

//==============================================================================================
class procedure TokSrv.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.UpdateRegistry') else _udebug := nil;{$ENDIF}

  if Register then begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end
  else begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TokSrv.InternalTrStart(place: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.InternalTrStart') else _udebug := nil;{$ENDIF}

  if not InTran then begin // no user transactions
    if Conn.InTransaction then begin
      storeErrorMessage('InternalTrStart: doing rollback of previous transaction (' + internalTrPlace + ')');
      Conn.Rollback;
    end;

    Conn.StartTransaction;
    internalTrPlace := place;
    storeMessage('-', 'InternalTrStart: Start: ' + place, 15);
  end
  else internalTrPlace := 'client''s transaction';

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TokSrv.InternalTrCommit;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.InternalTrCommit') else _udebug := nil;{$ENDIF}

  if not InTran then begin // no user transactions
    if Conn.InTransaction then begin
      storeMessage('-', 'InternalTrCommit: commiting: ' + internalTrPlace, 15);
      Conn.Commit;
    end
    else storeErrorMessage('InternalTrCommit: transaction inative: ' + internalTrPlace);

    internalTrPlace := '';
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TokSrv.InternalTrRollback;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.InternalTrRollback') else _udebug := nil;{$ENDIF}

  if not InTran then begin // no user transactions
    if Conn.InTransaction then begin
      storeMessage('-', 'InternalTrRollback: Rolling: ' + internalTrPlace, 15);
      Conn.Rollback;
    end
    else storeErrorMessage('InternalTrRollback: transaction inactive: ' + internalTrPlace);

    internalTrPlace := '';
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.TrState: String;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.TrState') else _udebug := nil;{$ENDIF}

  Result := '';
  if inTran
    then Result := ' client''''s'
    else if Conn.Connected and Conn.InTransaction then Result := ' internal(' + internalTrPlace + ')';

  if Result <> ''
    then Result := Result + ' transaction is active'
    else Result := ' no active transactions';

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TokSrv.Commit;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.Commit') else _udebug := nil;{$ENDIF}

  storeMessage('-', 'client Commit,' + TrState, 0);

  if not inTran and Conn.InTransaction then begin
    storeErrorMessage('TokSrv.Commit: rolling back stalled internal transaction: ' + internalTrPlace);
    InternalTrRollback;
  end;

  if Conn.InTransaction
    then Conn.Commit
    else storeErrorMessage('TokSrv.Commit: lost transaction');

  InTran := False;
  UnlockDB;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TokSrv.Rollback;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.Rollback') else _udebug := nil;{$ENDIF}

  storeMessage('-', 'client RollBack,' + TrState, 0);

  if inTran then begin
    if Conn.InTransaction
      then Conn.Rollback
      else storeErrorMessage('TokSrv.Rollback: lost transaction');
  end
  else begin
    if Conn.InTransaction then begin
      storeErrorMessage('TokSrv.Rollback: no client TR, but rolling back internal TR: ' + internalTrPlace);
      InternalTrRollback;
    end;
  end;

  InTran := False;

  UnlockDB;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TokSrv.Start;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.Start') else _udebug := nil;{$ENDIF}

  storeMessage('-', 'client START,' + TrState, 0);

  lastTrErrors := '';

  if not InTran then begin
    if Conn.InTransaction then begin
      storeErrorMessage('TokSrv.Start: emergency rollback of internal TR: ' + internalTrPlace);
      InternalTrRollback;
    end;

    Conn.StartTransaction;
    InTran := True;
  end
  else storeErrorMessage('TokSrv.Start: nested attempt ignored');

  lockDB;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.lockDB: Boolean;
  var
    st: Cardinal;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.lockDB') else _udebug := nil;{$ENDIF}

  Result := False;

  try // finally
    if FDBID <> -1 then begin
      st := GetTickCount;

      while not xSrvDB.lockDB(FDBID, Self) do begin
        sleep(100);

        if GetTickCount - st > DBsLockedTimeOut then  begin
          storeErrorMessage('TokSrv.lockDB: timeout');
          Exit;
        end;
      end;

      storeMessage('.', 'DB id: ' + IntTostr(FDBID) + ' locked', 15);
    end;

    Result := True;

    Lock; // lock thread;

  finally
    //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure TokSrv.UnlockDB;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.unlockDB') else _udebug := nil;{$ENDIF}

  if FDBID <> -1 then begin
    xSrvDB.unlockDB(FDBID, Self);
    storeMessage('.', 'DB id: ' + IntTostr(FDBID) + ' UN-locked', 15);
  end;
  
  Unlock; //unlock thread

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.AS_GetProviderNames: OleVariant; safecall;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.AS_GetProviderNames') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'AS_GetProviderNames', 15);
  if not mdProv.Active then LoadProviders;
  Result := VarArrayFromStrings(PrvList);
                                           
  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TokSrv.RemoteDataModuleCreate(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.RemoteDataModuleCreate') else _udebug := nil;{$ENDIF}

  inc(rdmCount);

  storeMessage('---trace---', 'RemoteDataModuleCreate', 10);

  Conn := InitConnection('', False);
  {$IFDEF ZEOS}
  Conn.Monitor.OnLogTrace := sqlLogger;
  {$ENDIF}

  mdProv := TssMemoryData.Create(nil);
  mdText := TssMemoryData.Create(nil);
  mdDB := TssMemoryData.Create(nil);
  mdDBInfo := TssMemoryData.Create(nil);

  prvProv := TDataSetProvider.Create(nil);
  prvProv.DataSet := mdProv;
  prvProv.Name := pSysProviders_List;

  prvDB := TDataSetProvider.Create(nil);
  prvDB.DataSet := xSrvDB.cdsDB;
  prvDB.Name := pSysDB_List;

  prvDBParams := TDataSetProvider.Create(nil);
  prvDBParams.DataSet := xSrvDB.cdsDBParams;
  prvDBParams.Name := pSysDBParams_List;

  FValidCLient := True; // default for demo and not the only
  //LoadDBs;

  prvUsers := TDataSetProvider.Create(nil);
  prvUsers.DataSet := xSrvDB.cdsUsers;
  prvUsers.Name := pSysUsers_List;

  PrvList := TStringList.Create;
  PrvCache := TProvCache.Create(Conn);

  FClientStored := False;

  FDBID := -1;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TokSrv.RemoteDataModuleDestroy(Sender: TObject);
  var
    res: TxSrvResult;
    //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.RemoteDataModuleDestroy') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'RemoteDataModuledestroy', 10);

  SetSingleUserMode(Self, False);

  mdText.Free;
  mdProv.Free;
  mdDB.Free;
  mdDBInfo.Free;
  prvProv.Free;
  prvDB.Free;
  prvDBParams.Free;
  prvUsers.Free;
  PrvList.Free;
  PrvCache.Free;

  res := xSrvDb.Rsv_Delete(-1, Integer(Self));

  case res of
    srTimedOut: storeMessage('?', 'Rsv [' + IntToStr(Integer(Self)) + '] delete timeout ');
  end;

  try
    xSrvDB.DocLck_Delete(Integer(Self), -1, 0);

    if FClientStored
      then res := xSrvDB.DeleteClient(Integer(Self))
      else res := srNone;

    case res of
      srTimedOut: storeMessage('?', 'Client [' + IntToStr(Integer(Self)) + '] delete timeout ');
    end;

  except
    on E:Exception do storeMessage('!', 'rdm_destroy.xSrvDB.DeleteClient: ' + IntToStr(Integer(Self)) + E.Message);
  end;

  if Conn.Connected then Conn.Disconnect;
  
  Conn.Destroy;

  if FIP <> '' then storeMessage('?', 'Client disconnected: ' + IntToStr(Integer(Self)));

  dec(rdmCount);

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TokSrv.LoadProviders;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.LoadProviders') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'loadProviders', 10);

  mdProv.Close;
  mdProv.CopyStructure(xSrvDB.cdsProv);
  mdProv.Open;
  xSrvDB.cdsProv.First;
  mdProv.LoadFromDataSet(xSrvDB.cdsProv, xSrvDB.cdsProv.RecordCount, lmAppend);
  GetProvList;

  mdText.Close;
  mdText.CopyStructure(xSrvDB.cdsProvText);
  mdText.Open;
  xSrvDB.cdsProvText.First;
  mdText.LoadFromDataSet(xSrvDB.cdsProvText, xSrvDB.cdsProvText.RecordCount, lmAppend);
  //storeMessage('#', 'Text: -> '+IntToStr(xSrvDB.cdsProvText.RecordCount)+':'+IntToStr(mdText.RecordCount));
  //storeMessage('#', 'Prov: -> '+IntToStr(xSrvDB.cdsProv.RecordCount)+':'+IntToStr(mdProv.RecordCount));
  //storeMessage('#', 'End Loading Providers');


  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TokSrv.GetProvList;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.GetProvList') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'getProvList', 11);

  PrvList.Clear;

  with mdProv do begin
    First;
    while not Eof do begin
      if fieldbyname('isgroup').AsInteger = 0 then PrvList.Add(fieldbyname('name').AsString);
      Next;
    end;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.AS_GetRecords(const ProviderName: WideString;
         Count: Integer; out RecsOut: Integer; Options: Integer;
         const CommandText: WideString; var Params,
         OwnerData: OleVariant): OleVariant; safecall;
  var
    Prv: TProvInfo;
    FParams: OleVariant;
    FOptions: Integer;
    i: Integer;
    t: TDateTime;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.AS_GetRecords(' + ProviderName + ')') else _udebug := nil;{$ENDIF}

  clearErrorMessage;
  t := now;
  storeMessage('+', 'AS_GetRecords(' + ProviderName + ') starting with' + TrState, 5);

  if not LockDB then begin
    //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  if not mdProv.Active then LoadProviders;

  FParams := Params;
  FOptions := Options;

  try
    try
      //if not Conn.Connected then storeMessage('?', 'not connected');
      //if ProvExecLogging then storeMessage('++', ProviderName + ' (start get records)');

      if ProviderName = pSysProviders_List
        then Result := prvProv.GetRecords(Count, RecsOut, Options, CommandText, Params, OwnerData)

      else if ProviderName = pSysDB_List
      then begin
        case xSrvDB.mtxDB.Obtain of
          twAbandoned: storeerrorMessage('as_getrecords; mtxDB - abandoned!');
          twTimedOut:  storeerrorMessage('as_getrecords; mtxDB - timed out!');

          twSuccess:
            begin
              try
                xSrvDB.cdsDB.First;
                Result := prvDB.GetRecords(Count, RecsOut, Options, CommandText, Params, OwnerData)

              except
                on e: Exception do storeerrorMessage('as_getrecords; ' + e.Message);
              end;

              xSrvDB.mtxDB.Release;
            end;
        end; // case xSrvDB.mtxDB.Obtain
      end //if ProviderName = pSysDB_List
      //-------------------------------------------------------------------------------------
      else if ProviderName = pSysActiveUsers_List then begin
        case xSrvDB.mtxClients.Obtain of
          twAbandoned: storeerrorMessage('as_getrecords; mtxClients - abandoned!');
          twTimedOut:  storeerrorMessage('as_getrecords; mtxClients - timed out!');

          twSuccess:
            try
              with TssMemoryData.Create(nil) do
              try
                FieldDefs.Add('userid', ftInteger);
                FieldDefs.Add('name', ftString, 128);
                FieldDefs.Add('login', ftString, 128);
                FieldDefs.Add('ip', ftString, 128);
                FieldDefs.Add('funid', ftInteger);
                FieldDefs.Add('interval', ftInteger);
                Open;

                for i := 0 to xSrvDB.Clients.ClientsCount - 1 do begin
                  Append;
                  FieldByName('userid').AsInteger := TokSrv(xSrvDB.Clients.Items[i].Addr).UserID;
                  FieldByName('funid').AsInteger := xSrvDB.Clients.Items[i].FunID;
                  FieldByName('ip').AsString := xSrvDB.Clients.Items[i].IP;
                  FieldByName('name').AsString := TokSrv(xSrvDB.Clients.Items[i].Addr).UserFullName;
                  FieldByName('login').AsString := TokSrv(xSrvDB.Clients.Items[i].Addr).UserLogin;
                  FieldByName('interval').AsInteger := Trunc((Now - xSrvDB.Clients.Items[i].FunStartTime) * 60 * 60 * 24);
                  Post;
                end;

                First;
                prvUsers.DataSet := Fields[0].DataSet;
                Result := prvUsers.GetRecords(Count, RecsOut, Options, CommandText, FParams, OwnerData);
                Close;

              finally
                Free;
              end;

            finally
              xSrvDB.mtxClients.Release;
            end;
        end;

      end//if ProviderName = pSysActiveUsers_List
      //-------------------------------------------------------------------------------------
      else if ProviderName = pSysUsers_List
      then begin
        with TxQuery.Create(Conn, 'select * from users') do
        try
          Open;
          prvUsers.DataSet := Fields[0].DataSet;
          Result := prvUsers.GetRecords(Count, RecsOut, FOptions, CommandText, FParams, OwnerData);
          Close;

        finally
          Free;
        end;
      end //if ProviderName = pSysUsers_List
      //-------------------------------------------------------------------------------------
      else if ProviderName = pSysDBParams_List
      then begin
        case xSrvDB.mtxDB.Obtain of
          twAbandoned: storeerrorMessage('as_getrecords; mtxDB - abandoned!');
          twTimedOut:  storeerrorMessage('as_getrecords; mtxDB - timed out!');

          twSuccess:
            try
              xSrvDB.cdsDBParams.First;
              Result := prvDBParams.GetRecords(Count, RecsOut, Options, CommandText, Params, OwnerData)

            finally
              xSrvDB.mtxDB.Release;
            end;
        end;
      end //if ProviderName = pSysDBParams_List
      //-------------------------------------------------------------------------------------
      else if ProviderName = pSysRsv_List
      then begin
        case xSrvDB.mtxReserved.Obtain of
          twAbandoned: storeerrorMessage('as_getrecords; mtxReserved - abandoned!');
          twTimedOut:  storeerrorMessage('as_getrecords; mtxReserved - timed out!');

          twSuccess:
            try
              try
                xSrvDB.mdReserved.First;
                Result := xSrvDB.prvReserved.GetRecords(Count, RecsOut, Options, CommandText, Params, OwnerData);

              finally
                xSrvDB.mtxReserved.Release;
              end;

            except
              on e: Exception do storeErrorMessage('pSysRsv_List: ' + e.Message);
            end;
         end;
      end //if ProviderName = pSysRsv_List
      //-------------------------------------------------------------------------------------
      else begin // any other provider
        //storeMessage('++', 'AS_GetRecords: start getprov' + ProviderName, 15);

        Prv := PrvCache.GetProvider(ProviderName);

        InternalTrStart('AS_GetRecords(' + ProviderName + '); cmd: ' + CommandText);

        if Prv = nil then Prv := PrvCache.AddProvider(ProviderName, mdProv, mdText); //storeMessage('++', 'AS_GetRecords: OK addprov ' + ProviderName, 15);

        Result := Prv.Provider.GetRecords(Count, RecsOut, Options, CommandText, Params, OwnerData); //storeMessage('++', 'AS_GetRecords: getrecords() OK on ' + ProviderName, 15);

        {$IFDEF PROTECT}if not ProtCheck then RecsOut := RecsOut div Count + 18;{$ENDIF}

        storeMessage('*', 'records out: ' + IntToStr(RecsOut), 10);

        internalTrCommit;

        PrvCache.DropProvider(Prv);
      end; // any other provider

      //if ProvExecLogging then storeMessage('++', ProviderName+' (end get records)');

    except
      on E: Exception do begin
        storeErrorMessage('AS_GetRecords: exception ' + e.Message + ' on prov: ' + ProviderName + '; cmd: ' + CommandText + ';' + TrState);
        InternalTrRollback;
      end;
    end;

  finally
    UnLockDB;
  end;

  storeMessage('+', 'AS_GetRecords(' + ProviderName + ') done. Elapsed: ' + GetSpent(MilliSecondsBetween(now, t)), 5);

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: Integer; out ErrorCount: Integer;
  var OwnerData: OleVariant): OleVariant; safecall;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.AS_ApplyUpdates') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'AS_ApplyUpdates', 10);

  {$IFDEF PROTECT}
  //{$I ASPROTECT\UserPolyBuffer.inc}
  if not ProtCheck then Result := '[eq';
  {$ENDIF}

  clearErrorMessage;

  if not LockDB then begin
    //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  try
    try
      Result := PrvCache.GetProvider(ProviderName).Provider.ApplyUpdates(Delta, MaxErrors, ErrorCount, OwnerData);

    except
      on e:exception do storeErrorMessage('ApplyUpdates; Prov: ' + ProviderName + '; err: ' + e.Message, False);
    end;

  finally
    UnLockDB;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; safecall;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.AS_DataRequest') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'AS_dataRequest', 15);

  {$IFDEF PROTECT}
  //{$I ASPROTECT\UserPolyBuffer.inc}
  if not ProtCheck then Result := '[eq';
  {$ENDIF}

  clearErrorMessage;
  if not LockDB then begin
    //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  try
    try
      Result := PrvCache.GetProvider(ProviderName).Provider.DataRequest(Data);

    except
      on e:exception do storeErrorMessage('DataRequest; Prov: ' + ProviderName + '; err: ' + e.Message, False);
    end;

  finally
    UnLockDB;
  end;


  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; safecall;
  var
    Prv: TProvInfo;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.AS_GetParams') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'AS_GetParams', 15);

  {$IFDEF PROTECT}
  //{$I ASPROTECT\UserPolyBuffer.inc}
  if not ProtCheck then Result := '[eq';
  {$ENDIF}

  clearErrorMessage;
  if not mdProv.Active then LoadProviders;

  try
    Lock;

    try
      if ProvExecLogging then storeMessage('++', ProviderName+' (start getting params)');
      Prv := PrvCache.GetProvider(ProviderName);

      if Prv = nil then Prv := PrvCache.AddProvider(ProviderName, mdProv, mdText);

      Result := Prv.Provider.GetParams(OwnerData);
      if ProvExecLogging then storeMessage('++', ProviderName+' (end getting params)');

    except
      on e:exception do storeErrorMessage('GetParams; Prov: ' + ProviderName + '; err: ' + e.Message);
    end;

  finally
    UnLock;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; var OwnerData: OleVariant): OleVariant; safecall;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.AS_RowRequest') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'AS_Rowrequest', 15);

  {$IFDEF PROTECT}
  //{$I ASPROTECT\UserPolyBuffer.inc}
  if not ProtCheck then Result := '[eq';
  {$ENDIF}

  clearErrorMessage;

  if not LockDB then begin
    //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  try
    try
      Result := PrvCache.GetProvider(ProviderName).Provider.RowRequest(Row, RequestType, OwnerData);

    except
      on e:exception do storeErrorMessage('RowRequest; Prov: ' + ProviderName + '; err: ' + e.Message);
    end;

  finally
    UnLockDB;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TokSrv.AS_Execute(const ProviderName, CommandText: WideString; var Params, OwnerData: OleVariant); safecall;
  var
    Prv: TProvInfo;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.AS_Execute') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'AS_Execute(' + ProviderName + ')' + TrState, 9);

  {$IFDEF PROTECT}
  //{$I ASPROTECT\UserPolyBuffer.inc}
  if not ProtCheck then  begin
    //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  {$ENDIF}

  clearErrorMessage;
  if not mdProv.Active then LoadProviders;

  if not LockDB then begin
    //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  try
    try
      Prv := PrvCache.GetProvider(ProviderName);
      if Prv = nil then Prv := PrvCache.AddProvider(ProviderName, mdProv, mdText);

      internalTrStart('AS_Execute(' + ProviderName + ')');

      Prv.Provider.Execute(CommandText, Params, OwnerData);

      internalTrCommit;

      PrvCache.DropProvider(Prv);

      if ProvExecLogging then storeMessage('++', ProviderName+' (end execute)');

    except
      on e:exception do begin
        storeErrorMessage('AS_Execute; Prov: ' + ProviderName + '; cmd:' + CommandText + '; err: ' + e.Message);
        internalTrRollback;
      end;
    end;

  finally
    UnLockDB;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.GetMaxProvID: OleVariant;
  var
    maxx: integer;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.GetMaxProvID') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'GetMaxProvID', 10);

  clearErrorMessage;

  while ProvidersLocked do sleep(100);

  Lock;
  LockProvider;

  try
    try
      xSrvDB.cdsProv.First;
      maxx := xSrvDB.cdsProv.fieldbyname('id').AsInteger;

      while not xSrvDB.cdsProv.Eof do begin
        if xSrvDB.cdsProv.FieldByName('id').AsInteger > maxx then maxx := xSrvDB.cdsProv.FieldByName('id').AsInteger;
        xSrvDB.cdsProv.Next;
      end;

      Result := maxx;

    except
       on e:exception do storeErrorMessage('GetMaxProvId err: ' + e.Message);
    end;

  finally
    unlock;
    UnLockProvider;
  end;


  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.AddProvider(ID: Integer; const Name: WideString; PID, IsGroup, IsNew: Integer): OleVariant;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.AddProvider') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'AddProvider', 10);

  clearErrorMessage;

  while ProvidersLocked do sleep(100);

  Result := 0;

  Lock;
  LockProvider;

  try
    try
      if xSrvDB.cdsProv.Locate('name', Name, []) then begin
        Result := -2;
        //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;

      if IsNew = 1
        then xSrvDB.cdsProv.Append
        else begin
          if xSrvDB.cdsProv.Locate('id', ID, [])
            then xSrvDB.cdsProv.Edit
            else begin
              Result := -1;
              //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
              Exit;
            end;
        end;

     xSrvDB.cdsProv.FieldByName('id').AsInteger := ID;
     xSrvDB.cdsProv.FieldByName('pid').AsInteger := PID;

     if IsNew = 1 then xSrvDB.cdsProv.FieldByName('isgroup').AsInteger := IsGroup;

     xSrvDB.cdsProv.FieldByName('name').AsString := Name;
     xSrvDB.cdsProv.Post;
     xSrvDB.cdsProv.SaveToFile(xSrvDB.cdsProv.FileName, dfXML);
     mdProv.Append;
     mdProv.FieldByName('id').AsInteger := ID;
     mdProv.FieldByName('pid').AsInteger := PID;
     mdProv.FieldByName('name').AsString := Name;

     if IsNew = 1 then mdProv.FieldByName('isgroup').AsInteger := IsGroup;

     mdProv.Post;

   except
     on e:exception do begin
       storeErrorMessage('AddProvider; Prov: ' + Name + '; err: ' + e.Message);
       Result := -1;
     end;
   end;

  finally
    unlock;
    UnLockProvider;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.DropProvider(ID: Integer): OleVariant;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.DropProvider') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'DropProvider', 10);

  clearErrorMessage;

  Result := 0;
  while ProvidersLocked do sleep(100);

  Lock;
  LockProvider;

  try
    try
      while xSrvDB.cdsProvText.Locate('id', ID, []) do xSrvDB.cdsProvText.Delete;

      xSrvDB.cdsProvText.SaveToFile(xSrvDB.cdsProvText.FileName, dfXML);

      if xSrvDB.cdsProv.Locate('id', ID, []) then begin
        xSrvDB.cdsProv.Delete;
        xSrvDB.cdsProv.SaveToFile(xSrvDB.cdsProv.FileName, dfXML);
      end;

    except
      on e:exception do storeErrorMessage('DropProvider; err: ' + e.Message);
    end;

  finally
    Unlock;
    UnLockProvider;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.ModifyProvText(ID: Integer; const Text: WideString): OleVariant;
  var
    FList: TStringList;
    i: integer;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.ModifyProvText') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'ModifyProvText', 10);

  clearErrorMessage;

  Result := 0;

  while ProvidersLocked do sleep(100);

  Lock;
  LockProvider;

  FList := TStringList.Create;

  try
    try
      FList.Text := Text;

      while xSrvDB.cdsProvText.Locate('id', ID, []) do xSrvDB.cdsProvText.Delete;

      for i := 0 to FList.Count - 1 do begin
        xSrvDB.cdsProvText.Append;
        xSrvDB.cdsProvText.FieldByName('id').AsInteger := ID;
        xSrvDB.cdsProvText.FieldByName('lineid').AsInteger := i;
        xSrvDB.cdsProvText.FieldByName('textstr').AsString := FList.Strings[i];
        xSrvDB.cdsProvText.Post;
      end;

      xSrvDB.cdsProvText.SaveToFile(xSrvDB.cdsProvText.FileName, dfXML);

    except
      on e:exception do begin
        storeErrorMessage('ModifyProvText err: ' + e.Message);
        Result := -1;
      end;
    end;

  finally
    Unlock;
    UnLockProvider;
    FList.Free;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.GetProvText(ID: Integer): OleVariant;
  var
    FList: TStringList;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.GetProvText') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'GetProvText', 10);
  clearErrorMessage;

  Result := '';

  while ProvidersLocked do sleep(100);

  LockProvider;

  FList := TStringList.Create;

  try
    try
      xSrvDB.cdsProvText.First;

      while not xSrvDB.cdsProvText.Eof do begin
        if xSrvDB.cdsProvText.fieldbyname('id').AsInteger = ID
          then FList.AddObject(xSrvDB.cdsProvText.fieldbyname('TextStr').AsString, pointer(xSrvDB.cdsProvText.FieldByName('lineid').AsInteger));

        xSrvDB.cdsProvText.Next;
      end;

      SortByObj(FList);
      Result := FList.Text;

    except
      on e:exception do storeErrorMessage('GetProvText err: ' + e.Message);
    end;

  finally
    UnLockProvider;
    FList.Free;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.AS_GetMacros(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; safecall;
  var
    Macros: TParams;
    Prv: TProvInfo;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.AS_GetMacros') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'AS_GetMacros', 15);

  {$IFDEF PROTECT}
  //{$I ASPROTECT\UserPolyBuffer.inc}
  if not ProtCheck then Result := '[eq';
  {$ENDIF}

  clearErrorMessage;
  if not mdProv.Active then LoadProviders;

  try
    Lock;

    try
      if ProvExecLogging then storeMessage('++', ProviderName + ' (start getting macros)');
      Prv := PrvCache.GetProvider(ProviderName);

      if Prv = nil then Prv := PrvCache.AddProvider(ProviderName, mdProv, mdText);

      Macros := TParams.Create;
      try
        Macros.Assign(TxQuery(Prv.Provider.DataSet).Macros);
        if Macros.Count = 0
         then Result := NULL
         else Result := PackageParams(Macros);

      finally
        Macros.Free;
      end;

      if ProvExecLogging then storeMessage('++', ProviderName + ' (end getting params)');

    except
      on e:exception do storeErrorMessage('AS_GetMacros; Prov: ' + ProviderName + '; err: ' + e.Message);
    end;

  finally
    UnLock;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TokSrv.AS_SetMacros(const ProviderName: WideString; var Macros: OleVariant); safecall;
  var
    Prv: TProvInfo;
    FData: TParams;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.AS_SetMacros') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'AS_SetMacros', 15);

  {$IFDEF PROTECT}
  //{$I ASPROTECT\UserPolyBuffer.inc}
  if not ProtCheck then Exit;
  {$ENDIF}

  clearErrorMessage;
  if not mdProv.Active then LoadProviders;

  if not LockDB then begin
    //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  try
    try
      if ProvExecLogging then storeMessage('++', ProviderName+' (start setting macros)');
      Prv := PrvCache.GetProvider(ProviderName);
      if Prv = nil then Prv := PrvCache.AddProvider(ProviderName, mdProv, mdText);

      FData := TParams.Create;
      try
        UnpackParams(Macros, FData);
        TxQuery(Prv.Provider.DataSet).Macros.AssignValues(FData);

      finally
        FData.Free;
      end;

      if ProvExecLogging then storeMessage('++', ProviderName+' (end setting macros)');

    except
      on e:exception do storeErrorMessage('AS_SetMacros; Prov: ' + ProviderName + '; err: ' + e.Message);
    end;

  finally
    UnLockDB;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.SetClientInfo(const IP, Host: WideString; const Intf: IDispatch): OleVariant;
  var
    FInfo: TxClientInfo;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.SetClientInfo') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'SetClientInfo', 10);

  clearErrorMessage;

  try
    if ((MaxClientsCount = 0) and (xSrvDB.Clients.ClientsCount = 1)) // allow one client even with invalid key
       or ((MaxClientsCount > 0) and (xSrvDB.Clients.ClientsCount = MaxClientsCount)) 
    then begin
      Result := -10;
      //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    FIP := IP;
    FHost := Host;
    FIntf := Intf;
    FInfo := xSrvDB.Clients.Add(Self, IP, Host, Now, Now, nil, nil);
    FClientStored := True;

    OleCheck(CoMarshalInterThreadInterfaceInStream(IID_IDispatch, FIntf, IStream(FInfo.Stream)));
    Result := Integer(Self);

    storeMessage('>', 'SetClientInfo Host: ' + Host + '; #' + IntToStr(xSrvDB.Clients.ClientsCount) + '; connected: ' + IntToStr(integer(Self)), 4);

  except
    on e:exception do storeErrorMessage('setclientinfo: ' + e.message);
  end;

  //storeMessage('>', 'SetClientInfo: xClients.Count = ' + IntToStr(xSrvDB.Clients.ClientsCount) + '; Stream = ' + IntToStr(Integer(FInfo.Stream)));

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

(*
//==============================================================================================
procedure TokSrv.LoadDBs;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.LoadDBs') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'LoadDBs', 10);

  if not lockDB then begin
    storeErrorMessage('LoadDBs: timeout in DB Lock');
    //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  try
    try
      mdDB.Close;
      mdDB.CopyStructure(xSrvDB.cdsDB);
      mdDB.Open;
      cdsDB.First;
      mdDB.LoadFromDataSet(xSrvDB.cdsDB, xSrvDB.cdsDB.RecordCount, lmAppend);

      mdDBInfo.Close;
      mdDBInfo.CopyStructure(cdsDBInfo);
      mdDBInfo.Open;
      cdsDBInfo.First;
      mdDBInfo.LoadFromDataSet(cdsDBInfo, cdsDBInfo.RecordCount, lmAppend);

    except
      on e:exception do begin
        storeErrorMessage('LoadDBs err: ' + e.Message);
      end;
    end;

  finally
    unlockDB;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
*)

//==============================================================================================
function TokSrv.GetDBParams(ID: Integer): OleVariant;
  var
    FRes: string;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.GetDBParams') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'GetDBParams', 10);

  clearErrorMessage;
  Result := '';
  FRes := '';

  xSrvDB.cdsDBParams.First;

  while not xSrvDB.cdsDBParams.Eof do begin
    if xSrvDB.cdsDBParams.fieldbyname('dbid').AsInteger = ID
      then FRes := FRes + xSrvDB.cdsDBParams.fieldbyname('parname').AsString + '=' + xSrvDB.cdsDBParams.FieldByName('parvalue').AsString + ';';

    xSrvDB.cdsDBParams.Next;
  end;

  Result := FRes;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.AddDB(ID: Integer; const Name: WideString; Def, IsNew: Integer): OleVariant;
  var
    Maxx: integer;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.AddDB') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'AddDB', 10);

  clearErrorMessage;
  //while ProvidersLocked do sleep(100);

  Result := 0;

  if IsNew = 1
    then Maxx := GetMax(xSrvDB.cdsDB, 'dbid') + 1
    else Maxx := ID;

  //LockProvider;
  try
    try
      if IsNew = 1
        then xSrvDB.cdsDB.Append
        else begin
          if xSrvDB.cdsDB.Locate('dbid', Maxx, [])
            then xSrvDB.cdsDB.Edit
            else begin
              Result := -1;
              //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
              Exit;
            end;
        end;

      xSrvDB.cdsDB.FieldByName('dbid').AsInteger := Maxx;
      xSrvDB.cdsDB.FieldByName('def').AsInteger := Def;
      xSrvDB.cdsDB.FieldByName('desc').AsString := Name;
      xSrvDB.cdsDB.Post;
      xSrvDB.cdsDB.First;

      if Def = 1 then
        with xSrvDB.cdsDB do begin
          while not Eof do begin
            if FieldByName('dbid').AsInteger <> Maxx then begin
              Edit;
              FieldByName('def').AsInteger := 0;
              Post;
            end;

            Next;
           end;
        end;

      xSrvDB.cdsDB.SaveToFile(xSrvDB.cdsDB.FileName, dfXML);

    except
      on e:Exception do begin
        Result := -1;
        storeErrorMessage('addDB Name: ' + Name + ': ' + e.Message);
      end;
    end;

  finally
    //UnLockProvider;
  end;

  Result := Maxx;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.AddDBParams(ID: Integer; const DBParams: WideString; IsNew: Integer): OleVariant;
  var
    Par, ParName, ParValue: string;
    i: integer;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.AddDBParams') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'AddDBParams', 10);

  clearErrorMessage;
  Result := 0;

  if not lockDB then begin
    Result := -1;
    //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  try // for DB unlocking on exits
    try
      for i := 1 to WordCount(DBParams, [';']) do begin
        Par := ExtractWord(i, DBParams, [';']);
        ParName := ExtractWord(1, Par, ['=']);
        ParValue := ExtractWord(2, Par, ['=']);

        if IsNew = 1
          then xSrvDB.cdsDBParams.Append
          else begin
            if xSrvDB.cdsDBParams.Locate('dbid;parname', VarArrayOf([ID, ParName]), [])
              then xSrvDB.cdsDBParams.Edit
              else xSrvDB.cdsDBParams.Append;
          end;

        xSrvDB.cdsDBParams.FieldByName('dbid').AsInteger := ID;
        xSrvDB.cdsDBParams.FieldByName('parname').AsString := ParName;
        xSrvDB.cdsDBParams.FieldByName('parvalue').AsString := ParValue;
        xSrvDB.cdsDBParams.Post;
      end;

      xSrvDB.cdsDBParams.SaveToFile(xSrvDB.cdsDBParams.FileName, dfXML);

    except
      on e:exception do storeErrorMessage('AddDBParams; Params: ' + DBParams + '; err: ' + e.Message);
    end;

  finally
    unlockDB;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.DropDB(ID, DelFile: Integer): OleVariant;
  var
    FDef: Integer;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.DropDB') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'DropDB', 10);

  clearErrorMessage;
  Result := 0;

  if not lockDB then begin
    Result := -1;
    //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  try // for DB unlocking on exits
    try
      if xSrvDB.cdsDB.Locate('dbid', ID, []) then begin
        if (DelFile = 1) and xSrvDB.cdsDBParams.Locate('dbid;parname', VarArrayOf([ID, 'Data Source']), [])
        then begin
          if FileExists(xSrvDB.cdsDBParams.FieldByName('parvalue').AsString) 
             and not DeleteFile(xSrvDB.cdsDBParams.FieldByName('parvalue').AsString) 
          then begin
            Result := -3;
            //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
            Exit;
          end;
        end;

        FDef := xSrvDB.cdsDB.FieldByName('def').AsInteger;
        xSrvDB.cdsDB.Delete;
        
        if FDef = 1 then begin
          xSrvDB.cdsDB.Edit;
          xSrvDB.cdsDB.FieldByName('Def').AsInteger := 1;
          xSrvDB.cdsDB.Post;
        end;

        xSrvDB.cdsDB.SaveToFile(xSrvDB.cdsDB.FileName, dfXML);

        while xSrvDB.cdsDBParams.Locate('dbid', ID, []) do xSrvDB.cdsDBParams.Delete;

        xSrvDB.cdsDBParams.SaveToFile(xSrvDB.cdsDBParams.FileName, dfXML);
        DropRegKey(BackupSvcRegKey + '\' + 'DB' + IntToStr(ID), HKEY_LOCAL_MACHINE);
      end
      else Result := -2;

    except
      on e: exception do storeErrorMessage('DropDB: ' + e.Message);
    end;

  finally
    unlockDB;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.Connect(DBID: Integer): OleVariant;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.Connect') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'Connect', 10);

  //{$IFDEF PROTECT}{$I ASPROTECT\UserPolyBuffer.inc}if not ProtCheck then Result := '[eq'; Exit;{$ENDIF}

  clearErrorMessage;

  Result := -1;

  UserSysName := dbAdminDefName;
  UserPass := dbAdminDefPass;

  try // finally
    if Conn.Connected
    then if (DBID <> -1) and (FDBID = DBID) // request for the same DBID we already connected
      then begin
        storeMessage('?', 'TokSrv.Connect: Already connected', 9);

        Result := 0;
        Exit;
      end
      else Disconnect;

    FDBID := DBID;
    GetConnString(FDBID, FDBPath); // we need just DBpath to connect. Result is ADO string, FDBID on return has real DBID if -1 is supplied

    if FDBID = -1 then begin
      storeErrorMessage('TokSrv.Connect: no default db or invalid id: ' + IntToStr(DBID));
      Exit;
    end;

    if not FileExists(FDBPath) then begin
      storeErrorMessage('TokSrv.Connect: Missing database file. ID: ' + IntToStr(FDBID) + ', path: ' + FDBPath);
      Exit;
    end;

    storeMessage('.', 'TokSrv.Connect: locking', 10);
    if not lockDB then Exit;

    try // finally for unlocking
      try
        storeMessage('.', 'TokSrv.Connect: dis', 10);
        Conn.Disconnect;
        storeMessage('.', 'TokSrv.Connect: db path set to ' + FDBPath, 10);
        Conn.DataBase := FDBPath;

        if not FValidClient then begin
          {$IFDEF DEBUG}storeErrorMessage('TokSrv.Connect: Invalid client');{$ENDIF}
          Conn.User := '';
          Conn.Password := '';
        end;

        storeMessage('.', 'TokSrv.Connect: connect', 10);
        Conn.Connect;

        storeMessage('.', 'TokSrv.Connect: get db version', 10);
        FVersion := GetDBVersion;
        if FVersion <> '' then Result := 0;

      except
        on E: Exception do begin
          storeErrorMessage('TokSrv.Connect: ' + e.Message);
          Exit;
        end;
      end;

    finally
      unlockDB;
    end;

    storeMessage('*', 'TokSrv.Connect: Connected to: "' + FDBPath + '", DB Ver: ' + FVersion, 4);

  finally
    //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure TokSrv.Disconnect;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.Disconnect') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'Disconnect', 10);

  clearErrorMessage;

  if Conn.Connected then Conn.Disconnect;
  FDBID := -1;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
{SNMode = 1 for single user mode request
  Result:
  >= 0 = USerID OK
  -1 = general fuckup
  -2 = non-admin request for single user mode
  -3 = already in single user mode
  -4 = single user mode denied because of connected clients
  -5 = user name or pass invalis
  -6 = DB connect error
}
function TokSrv.CheckLogin(const Login, Pass: WideString; DBID, SMode: Integer): OleVariant;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.CheckLogin') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'CheckLogin', 10);

  //{$IFDEF PROTECT}{$I ASPROTECT\UserPolyBuffer.inc}{$ENDIF}

  clearErrorMessage;

  Result := -1;

  FNextProtCheck := IncMilliSecond(now, random(60000) + 500); // 0,5 sec - 1 min

  try // finally
    (*if not FValidClient then begin
      {$IFDEF DEBUG}storeErrorMessage('Invalid client');{$ENDIF}
      Exit;
    end;
    *)

    if (SMode = 1) and (SingleUserOwner <> nil) and (SingleUserOwner <> Self) then begin
      Result := -3; //сервер уже в монопольном режиме не под нашим контролем
      Exit;
    end;

    if Connect(DBID) <> 0 then begin
      Result := -6;
      Exit;
    end;

    try // exception catcher
      with TxQuery.Create(Conn, 'select * from users where name=''' + Login + '''') do
      try // finally
        Open;

        if IsEmpty
          then Result := -5

        {$IFNDEF FREE}
        else if (SMode = 1) and (FieldByName('userid').AsInteger > 0) 
             then Result := -2 //монопольный режим доступен только для администратора

        else if (FieldByName('userid').AsInteger = 0) and (SMode = 1) and (xSrvDB.Clients.ClientsCount > 1)
             then Result := -4 //монопольный режим невозможен из-за подключенных юзеров
        {$ENDIF}

        else begin // demo or non-admin
          UserPass := FieldByName('pass').AsString;

          if Pass <> UserPass 
            then Result := -5

          else begin
            UserID := fieldbyname('userid').AsInteger;
            UserLogin := Login;
            UserSysName := FieldByName('sysname').AsString;
            UserFullName := FieldByName('fullname').AsString;
            Result := UserID;

            {$IFDEF DEBUG}storeMessage('*', 'CheckLogin: UserID: ' + IntToStr(UserID) + ', UserLogin: "' + UserLogin
                         + '", UserSysName: "' + UserSysName + '", UserPass: "' + UserPass + '"', 6);
            {$ENDIF}

            SetSingleUserMode(Self, (SMode = 1));
          end;
        end;

        Close;
        //Disconnect; // now we do not disconnect 'cos client is set to avoid reconnects by every chance

      finally
        Free;
      end;

    except
      on e: Exception do storeErrorMessage('CheckLogin: ' + e.Message);
    end;

  finally
    storeMessage('-', 'CheckLogin: Result code: ' + IntToStr(Result), 10);
    FValidClient := (Result >= 0);
    {$IFDEF DEBUG}if not FValidClient then storeErrorMessage('CheckLogin: Client invalidated!');{$ENDIF}
    //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
function TokSrv.CreateDBFile(const AFileName, AParams: string): Integer;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.CreateDBFile') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'CreateDBFile', 10);

  clearErrorMessage;

  Result := 1;

  try
    if FileExists(AFileName) then begin
      Result := 2;
      //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    if not Windows.CopyFile(PChar(serverPath + EmptyDBFile + DBDefaultExt), PChar(AFileName), False)
    then begin
      Result := 0;
      storeerrorMessage('CreateDBFile("' + AFileName + '", "' + AParams + '"): Emptydb copy error;');
    end;

  except
    on E: Exception do storeErrorMessage('CreateDBFile("' + AFileName + '", "' + AParams + '" Err: ' + E.Message);
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.NewDB(const FileName, Params: WideString): OleVariant;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.NewDB') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'NewDB', 10);

  clearErrorMessage;

  Result := CreateDBFile(FileName, Params);

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.GetDBFileName: OleVariant;
  var
    SR: TSearchRec;
    maxx: integer;
    s: string;
    c: char;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.GetDBFileName') else _udebug := nil;{$ENDIF}
  
  storeMessage('---trace---', 'GetDBFileName', 10);

  clearErrorMessage;

  maxx := 1;

  Result := '';

  if 0 = FindFirst( serverPath + UserDBPath + UserDefDBName + '*.?db', faAnyFile, SR )
  then begin
    repeat
      s := SR.Name;
      c := s[length(s) - 2];
      if (c <> 'f') and (c <> 'F') and (c <> 'g') and (c <> 'G') then Continue;

      System.Delete(s, 1, Length(UserDefDBName));
      System.Delete(s, Length(s) - 3, 4);

      try
        if Maxx < StrToInt(s) then Maxx := StrToInt(s);
      except
      end;
    until FindNext(SR) <> 0;

    Result := serverPath + UserDBPath + UserDefDBName + IntToStr(Maxx + 1) + DBDefaultExt;
  end
  else Result := serverPath + UserDBPath + UserDefDBName + '1' + DBDefaultExt;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.Rsv_Add(PosID, MatID, WID, AVisible: Integer; Amount: Double): OleVariant;
  var
    FID: Integer;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.Rsv_Add') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'Rsv_Add', 10);

  {$IFDEF PROTECT}
  //{$I ASPROTECT\UserPolyBuffer.inc}
  if not ProtCheck then Result := '[eq';
  {$ENDIF}

  clearErrorMessage;

  Result := -1;

  try
    Lock;

    case xSrvDB.Rsv_Add(Integer(Self), PosID, MatID, WID, AVisible, Amount, FID) of
      srAbandoned: storeErrorMessage('Rsv_Add: mtxReserved abandoned!');
      srTimedOut:  storeErrorMessage('Rsv_Add: mtxReserved timed out!');
      srNone: Result := FID;
    end;

  finally
    Unlock;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TokSrv.Rsv_Delete(ID: Integer);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.Rsv_Delete') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'Rsv_Delete', 10);

  clearErrorMessage;

  try
    Lock;

  case xSrvDB.Rsv_Delete(ID, Integer(Self)) of
    srAbandoned: storeErrorMessage('Rsv_Delete: mtxReserved abandoned!');
    srTimedOut:  storeErrorMessage('Rsv_Delete: mtxReserved timed out!');
  end;

  finally
    Unlock;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TokSrv.Clnt_Check;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.Clnt_Check') else _udebug := nil;{$ENDIF}

  //storeMessage('---trace---', 'Clnt_Check', 10);

  clearErrorMessage;

  case xSrvDB.Clnt_Check(Integer(Self)) of
    srAbandoned: storeErrorMessage('Clnt_Check: mtxClients abandoned!');
    srTimedOut:  storeErrorMessage('Clnt_Check: mtxClients timed out!');
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.Callback_Reg(const Intf: IAppServer; out ID: OleVariant): OleVariant;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.Callback_Reg') else _udebug := nil;{$ENDIF}

  //storeMessage('---trace---', 'CallBackReg', 10);

  clearErrorMessage;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TokSrv.q_Add(AType: Integer; AParam: OleVariant);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.q_Add') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'q_Add', 10);

  clearErrorMessage;

  xQueue.Add(AType, AParam, Integer(Self));

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.db_TestConnect(const Path: WideString): OleVariant;
  var
    testConn: TxConnection;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.db_TestConnect') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'db_TestConnect', 10);

  clearErrorMessage;

  Result := 0;

  testConn := InitConnection(Path, True);

  if testConn = nil then begin
    Result := -1;
    //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  testConn.Disconnect;
  testConn.Free;
  sleep(500);

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.db_Update(ID: Integer; const Name: WideString; Def: Integer; const Path: WideString): OleVariant;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.db_Update') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'db_Update', 10);

  clearErrorMessage;

  Result := 0;

  try
    if xSrvDB.cdsDB.Locate('dbid', ID, [])
      then xSrvDB.cdsDB.Edit
      else begin
        Result := -1;
        //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;

    xSrvDB.cdsDB.FieldByName('def').AsInteger := Def;
    xSrvDB.cdsDB.FieldByName('desc').AsString := Name;
    xSrvDB.cdsDB.Post;
    xSrvDB.cdsDB.First;

    if Def = 1 then // unsetting default from other DBs
      with xSrvDB.cdsDB do begin
        while not Eof do begin
          if FieldByName('dbid').AsInteger <> ID then begin
            Edit;
            FieldByName('def').AsInteger := 0;
            Post;
          end;

          Next;
        end;
      end;

    xSrvDB.cdsDB.SaveToFile(xSrvDB.cdsDB.FileName, dfXML);

    if xSrvDB.cdsDBParams.Locate('dbid;parname', VarArrayOf([ID, 'Data Source']), [])
      then xSrvDB.cdsDBParams.Edit
      else begin
        Result := -1;
        //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;

    xSrvDB.cdsDBParams.FieldByName('parvalue').AsString := Path;
    xSrvDB.cdsDBParams.Post;
    xSrvDB.cdsDBParams.SaveToFile(xSrvDB.cdsDBParams.FileName, dfXML);

  except
    on e:Exception do begin
      Result := -1;
      storeErrorMessage('db_Update: Name: ' + Name + '; Path:' + Path + '; err: ' + e.Message);
    end;
  end;
  
  Result := 0;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TokSrv.usr_WriteBlob(const Data: WideString; ALength: Integer;
  const ATable, AField: WideString; AID: Integer; const AKeyField, APar1,
  Apar2: WideString);

  var
    FStream: TMemoryStream;
    s: String;
    //fBuffer: string;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.usr_WriteBlob') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'usr_WriteBlob', 10);

  clearErrorMessage;

  if not LockDB then begin
    //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  //storeMessage('-', 'start writing blob');
  FStream := TMemoryStream.Create;

  try
    try
      HexStrToStream(FStream, Data);
      //FStream.Write(Data[1], ALength);

      internalTrStart('usr_WriteBlob');

      with TxQuery.Create(Conn) do
        try
          if (AID > 0) or (APar1 = '') then begin // APar1 for compat w logo update
            s := 'update ' + ATable + ' set ' + AField + '=:data';
            if APar1 <> '' then s := s + ',' + APar1;
            if AID > 0 then s := s + ' where ' + AKeyField + '=' + IntToStr(AID);
            if APar2 <> '' then s := s + APar2;
          end
          else begin
            s := 'insert into ' + ATable + ' ( ' + AField;
            if APar1 <> '' then s := s + ',' + APar1;
            s := s + ') values (:data';
            if APar2 <> '' then s := s + ',' + APar2;
            s := s + ')';
          end;

          SQLText := s;
          storeMessage('-', 'usrWriteBlob SQL: "' + S + '"', 6);

          if Data = '' then begin
            Params.ParamByName('data').DataType := ftBlob;
            Params.ParamByName('data').Clear;
          end
          else Params.ParamByName('data').LoadFromStream(FStream, ftBlob);

          Execute;

          internalTrCommit;

        finally
          Free;
        end;

      except
        on e:exception do begin
          storeErrorMessage('usrWriteBlob SQL: "' + s + '"; err: ' + e.Message);
          internalTrRollback;
        end;
      end;

  finally
    UnlockDB;
    FStream.Free;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.usrs_Add(const Login, Pass, FullName: WideString): OleVariant;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.usrs_Add') else _udebug := nil;{$ENDIF}

  Result := 0;
  (*
  storeMessage('---trace---', 'usrs_Add', 10);

  clearErrorMessage;

  case xSrvDB.mtxUsers.Obtain of
    twAbandoned:
      begin
        storeErrorMessage('usrs_add - abandoned; ' + IntToStr(Integer(Self)));
        Result := -4;
        //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;

    twTimedOut:
      begin
        storeErrorMessage('usrs_add - timeout; ' + IntToStr(Integer(Self)));
        Result := -5;
        //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;

    twSuccess:
      try
        Result := xSrvDB.Usrs_Add(Login, FullName, Pass);

        case Result of
           0: storeMessage('*', 'User ' + Login + ' successfully created');
          -1: storeErrorMessage('usrs_add - unknown; ' + IntToStr(Integer(Self)));
          -2: storeErrorMessage('usrs_add - error creating fb-user; ' + IntToStr(Integer(Self)));
          -3: storeErrorMessage('usrs_add - user already exists; ' + IntToStr(Integer(Self)));
        end;

      finally
        xSrvDB.mtxUsers.Release;
      end;
  end;
  *)

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.usrs_Delete(UserID: Integer): OleVariant;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.usrs_Delete') else _udebug := nil;{$ENDIF}

  Result := 0;
  (*
  storeMessage('---trace---', 'usrs_Delete', 10);

  clearErrorMessage;

  case xSrvDB.mtxUsers.Obtain of
    twAbandoned:
      begin
        storeErrorMessage('usrs_delete - abandoned; ' + IntToStr(Integer(Self)));
        Result := -4; // abandoned

        //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;

    twTimedOut:
      begin
        storeErrorMessage('usrs_delete - timeout; ' + IntToStr(Integer(Self)));
        Result := -5; // timeout

        //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;

    twSuccess:
      try
        Result := xSrvDB.Usrs_Delete(UserID);

        case Result of
          //0: storeErrorMessage('User ' + Login + ' successfully deleted');
          -1: storeErrorMessage('usrs_delete - unknown; ' + IntToStr(Integer(Self)));
          -2: storeErrorMessage('usrs_delete - error deleting fb-user; ' + IntToStr(Integer(Self)));
          -3: storeErrorMessage('usrs_delete - invalid user id; ' + IntToStr(Integer(Self)));
        end;

      finally
        xSrvDB.mtxUsers.Release;
      end;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
function TokSrv.usrs_Update(UserID: Integer; const UserName, Pass, FullName: WideString): OleVariant;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.usrs_Update') else _udebug := nil;{$ENDIF}

  Result := 0;
  (*
  storeMessage('---trace---', 'usrs_Update', 10);

  clearErrorMessage;

  case xSrvDB.mtxUsers.Obtain of
    twAbandoned:
      begin
        storeErrorMessage('usrs_update - abandoned; ' + IntToStr(Integer(Self)));
        Result := -4;

        //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;

    twTimedOut:
      begin
        storeErrorMessage('usrs_update - timeout; ' + IntToStr(Integer(Self)));
        Result := -5;

        //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;

    twSuccess:
      try
        Result := xSrvDB.Usrs_Modify(UserID, UserName, FullName, Pass);

        case Result of
          -1: storeErrorMessage('usrs_update - unknown; ' + IntToStr(Integer(Self)));
          -2: storeErrorMessage('usrs_update - error updating fb-user; ' + IntToStr(Integer(Self)));
          -3: storeErrorMessage('usrs_update - invalid user id; ' + IntToStr(Integer(Self)));
        end;

      finally
        xSrvDB.mtxUsers.Release;
      end;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
function TokSrv.doclck_Add(ID, DocType: Integer): OleVariant;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.doclck_Add') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'doclck_Add', 10);

  clearErrorMessage;

  Result := -1;

  case xSrvDB.DocLck_Add(Integer(Self), ID, DocType) of
    srAbandoned: storeerrorMessage('DocLck_Add: mtxDocLocked abandoned!');
    srTimedOut:  storeerrorMessage('DocLck_Add: mtxDocLocked timed out!');
    srNone:      Result := 0;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.doclck_Delete(ID, DocType: Integer): OleVariant;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.doclck_Delete') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'doclck_Delete', 10);

  clearErrorMessage;

  Result := -1;

  case xSrvDB.DocLck_Delete(Integer(Self), ID, DocType) of
    srAbandoned: storeerrorMessage('DocLck_Delete: mtxDocLocked abandoned!');
    srTimedOut:  storeerrorMessage('DocLck_Delete: mtxDocLocked timed out!');
    srNone:      Result := 0;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.doclck_Check(ID, DocType: Integer): OleVariant;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.doclck_Check') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'doclck_Check', 10);

  clearErrorMessage;

  Result := '?';

  case xSrvDB.mtxDocLocked.Obtain of
    twAbandoned:
      begin
        storeerrorMessage('DocLck_Check - abandoned!');
        //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;

    twTimedOut:
      begin
        storeerrorMessage('DocLck_Check - timed out!');
        //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;

    twSuccess:
      try
        if xSrvDB.mdDocLocked.Locate('id;doctype', VarArrayOf([ID, DocType]), []) then begin
          Result := TokSrv(xSrvDB.mdDocLocked.FieldByName('addr').AsInteger).UserLogin +
                    ' (' + TokSrv(xSrvDB.mdDocLocked.FieldByName('addr').AsInteger).UserFullName + ')';
        end
        else Result := '';

      finally
        xSrvDB.mtxDocLocked.Release;
      end;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.GetMaxID(const TableName, KeyName: WideString): OleVariant;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.GetMaxID') else _udebug := nil;{$ENDIF}
                                         
  storeMessage('---trace---', 'GetMaxID', 10);

  {$IFDEF PROTECT}
  //{$I ASPROTECT\UserPolyBuffer.inc}
  if not ProtCheck then Result := -random(847636);
  {$ENDIF}

  clearErrorMessage;

  Result := -1;
  case xSrvDB.mtxIDs.Obtain of
    twAbandoned:
      begin
        storeerrorMessage('getmaxid - abandoned!');
        //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;

    twTimedOut:
      begin
        storeerrorMessage('getmaxid - timed out!');
        //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;

    twSuccess:
      try
        with xSrvDB.mdIDs do
          if Locate('dbid;tablename;keyname', VarArrayOf([FDBID, TableName, KeyName]), []) then begin
            Result := FieldByName('id').AsInteger + 1;

            Edit;
            FieldByName('id').AsInteger := Result + 1;
            Post;
          end
          else with TxQuery.Create(Conn) do
            try
              SQLText := 'select max(' + KeyName + ') from ' + TableName;

              try
                Open;
                Result := Fields[0].AsInteger + 1;
                Close;

                xSrvDB.mdIDs.Append;
                xSrvDB.mdIDs.FieldByName('id').AsInteger := Result;
                xSrvDB.mdIDs.FieldByName('dbid').AsInteger := FDBID;
                xSrvDB.mdIDs.FieldByName('tablename').AsString := TableName;
                xSrvDB.mdIDs.FieldByName('keyname').AsString := KeyName;
                xSrvDB.mdIDs.Post;

              except
                on E: Exception do begin
                  Result := -1;
                  storeErrorMessage('getmaxid: ' + E.Message);
                end;
              end;

            finally
              Free;
            end; // else with TxQuery.Create(nil)

      finally
        xSrvDB.mtxIDs.Release;
      end;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.db_Backup(const BackupFile: WideString; DBID: Integer): OleVariant;
  var
    FFile, Error: string;
    ID: Integer;
    tmpSU: Boolean;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.db_Backup') else _udebug := nil;{$ENDIF}

  tmpSU := False;

  {$IFNDEF FREE}
  if SingleUserOwner <> Self then begin
    if 0 <> SetSingleUserMode(Self, True) then begin
      Result := -2;
      storeErrorMessage('db_Backup with no singleuser');
      Exit;
    end;
    tmpSU := True;
  end;
  {$ENDIF}

  storeMessage('---trace---', 'db_Backup', 10);

  clearErrorMessage;

  Result := -1;

  FFile := BackupFile;
  ID := DBID; // default

  case xSrvDB.mtxDB.Obtain of
    twAbandoned:
      begin
        storeerrorMessage('db_backup: mtxDB - abandoned!');
        Exit;
      end;

    twTimedOut:
      begin
        storeerrorMessage('db_backup: mtxDB - timed out!');
        Exit;
      end;

    twSuccess:
      try
        if (DBID = -1) and xSrvDB.cdsDB.Locate('def', 1, [])
          then ID := xSrvDB.cdsDB.FieldByName('dbid').AsInteger;

        if xSrvDB.cdsDBParams.Locate('dbid;parname', VarArrayOf([ID, 'Data Source']), [])
        then begin
          storeMessage('#', 'db_Backup: .fbk=' + FFile + '; .?db=' + xSrvDB.cdsDBParams.FieldByName('parvalue').AsString, 1);

          if (ID = FDBID) and Conn.Connected then Conn.Disconnect;

          //--------------------------------------
          {$IFDEF ZEOS}
            Result := IBDBBackup(sqlServerAddr, xSrvDB.cdsDBParams.FieldByName('parvalue').AsString, FFile, dbAdminDefName, dbAdminDefPass, Error);
          {$ENDIF}

          //--------------------------------------
          {$IFDEF IBX}
            with TIBBackupService.Create(nil) do
            try
              ServerName := 'localhost';
              LoginPrompt := False;
              Protocol := TCP;
              Params.Add('user_name=sysdba');
              Params.Add('password=masterkey');
              BackupFile.Add(FFile);
              DatabaseName := Trim(xSrvDB.cdsDBParams.FieldByName('parvalue').AsString);

              try
                Active := True;
                ServiceStart;

                while IsServiceRunning do sleep(200);

                Active := False;
                Result := 0;

              except
                on E: Exception do Error := E.Message;
              end;

            finally
              Free;
            end;
          {$ENDIF} // IBX

          if Result <> 0 then storeErrorMessage('db_backup: error: ' + Error);
        end;//if xSrvDB.cdsDBParams.Locate('dbid;parname', VarArrayOf([FDBID, 'Data Source']), []) then begin

      finally
        if ID = FDBID then Conn.Connect;

        xSrvDB.mtxDB.Release;

        if tmpSU then SetSingleUserMode(Self, False);
      end;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.db_Restore(const BackupFile: WideString; DBID: Integer): OleVariant;
  var
    FFile, Error: string;
    ID: Integer;
    tmpSU: Boolean;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  tmpSU := False;

  {$IFNDEF FREE}
  if SingleUserOwner <> Self then begin
    if 0 <> SetSingleUserMode(Self, True) then begin
      Result := -2;
      storeErrorMessage('db_Restore with no singleuser');
      Exit;
    end;
    tmpSU := True;
  end;
  {$ENDIF}

  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.db_Restore') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'db_Restore', 10);

  {$IFDEF PROTECT}
  //{$I ASPROTECT\UserPolyBuffer.inc}
  if not ProtCheck then Result := '[eq';
  {$ENDIF}

  clearErrorMessage;

  Result := -1;

  FFile := BackupFile;
  ID := DBID; // default

  case xSrvDB.mtxDB.Obtain of
    twAbandoned:
      begin
        storeerrorMessage('db_restore: mtxDB - abandoned!');
        Exit;
      end;

    twTimedOut:
      begin
        storeerrorMessage('db_restore: mtxDB - timed out!');
        Exit;
      end;

    twSuccess:
      try
        if (DBID = -1) and xSrvDB.cdsDB.Locate('def', 1, [])
          then ID := xSrvDB.cdsDB.FieldByName('dbid').AsInteger;

        if xSrvDB.cdsDBParams.Locate('dbid;parname', VarArrayOf([ID, 'Data Source']), []) then begin
          if (ID = FDBID) and Conn.Connected then Conn.Disconnect;

          //--------------------------------------
          {$IFDEF ZEOS}
          Result := IBDBRestore(sqlServerAddr, xSrvDB.cdsDBParams.FieldByName('parvalue').AsString, FFile, dbAdminDefName, dbAdminDefPass, Error);
          {$ENDIF} // ZEOS

          //--------------------------------------
          {$IFDEF IBX}
          with TIBRestoreService.Create(nil) do
          try
            ServerName := 'localhost';
            LoginPrompt := False;
            Params.Add('user_name=sysdba');
            Params.Add('password=masterkey');
            BackupFile.Add(FFile);
            DatabaseName.Add(Trim(xSrvDB.cdsDBParams.FieldByName('parvalue').AsString));
            Options := [Replace];
            PageSize := 0;

            try
              try
                Conn.Connected := False;
                Active := True;
                ServiceStart;
                while IsServiceRunning do sleep(100);
                Active := False;
                Result := 0;

              finally
                Conn.Connected := True;
              end;

            except
              on E: Exception do Error := E.Message;
            end;

          finally
            Free;
          end;
          {$ENDIF} // IBX

          if Result <> 0 then storeErrorMessage('db_restore: error: ' + Error);
        end;//if xSrvDB.cdsDBParams.Locate('dbid;parname', VarArrayOf([FDBID, 'Data Source']), []) then begin

      finally
        if ID = FDBID then Conn.Connect;

        xSrvDB.mtxDB.Release;

        if tmpSU then SetSingleUserMode(Self, False);
      end;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.db_Repair(const BackupFile: WideString; DBID: Integer): OleVariant;
  var
    FFile, Error: string;
    ID: Integer;
    tmpSU: Boolean;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.db_Repair') else _udebug := nil;{$ENDIF}

  tmpSU := False;

  {$IFNDEF FREE}
  if SingleUserOwner <> Self then begin
    if 0 <> SetSingleUserMode(Self, True) then begin
      Result := -2;
      storeErrorMessage('db_Repair with no singleuser');
      Exit;
    end;
    tmpSU := True;
  end;
  {$ENDIF}

  storeMessage('---trace---', 'db_Repair', 10);

  {$IFDEF PROTECT}
  //{$I ASPROTECT\UserPolyBuffer.inc}
  if not ProtCheck then Result := '[eq';
  {$ENDIF}

  clearErrorMessage;

  Result := -1;

  FFile := BackupFile;
  ID := DBID; // default

  case xSrvDB.mtxDB.Obtain of
    twAbandoned:
      begin
        storeerrorMessage('db_repair: mtxDB - abandoned!');
        Exit;
      end;

    twTimedOut:
      begin
        storeerrorMessage('db_repair: mtxDB - timed out!');
        Exit;
      end;

    twSuccess:
      try
        if (DBID = -1) and xSrvDB.cdsDB.Locate('def', 1, [])
          then ID := xSrvDB.cdsDB.FieldByName('dbid').AsInteger;

        if (ID = FDBID) and Conn.Connected then Conn.Disconnect;

        if xSrvDB.cdsDBParams.Locate('dbid;parname', VarArrayOf([ID, 'Data Source']), []) then begin
          //--------------------------------------
          {$IFDEF ZEOS}
          Result := IBDBRepair(sqlServerAddr, xSrvDB.cdsDBParams.FieldByName('parvalue').AsString, dbAdminDefName, dbAdminDefPass, Error);
          {$ENDIF} // ZEOS

          if Result <> 0 then begin
            storeErrorMessage('db_repair: error: ' + Error);
          end;
        end;//if xSrvDB.cdsDBParams.Locate('dbid;parname', VarArrayOf([FDBID, 'Data Source']), []) then begin

      finally
        if ID = FDBID then Conn.Connect;

        xSrvDB.mtxDB.Release;

        if tmpSU then SetSingleUserMode(Self, False);
      end;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.db_SaveBackupInfo(DBID: Integer;
  const BackupDir: WideString; IntervalValue: Integer;
  const IntervalType: WideString; var BackupTime: OleVariant): OleVariant;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.db_SaveBackupInfo') else _udebug := nil;{$ENDIF}
                                                  
  storeMessage('---trace---', 'db_SaveBackupInfo', 10);

  clearErrorMessage;

  Result := -1;
  case xSrvDB.mtxDB.Obtain of
    twAbandoned:
      begin
        storeerrorMessage('db_savebackupinfo: mtxDB - abandoned!');
        //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;

    twTimedOut:
      begin
        storeerrorMessage('db_savebackupinfo: mtxDB - timed out!');
        //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;

    twSuccess:
      try
        xSrvDB.db_SaveBackupInfo(DBID, BackupDir, IntervalType, IntervalValue, BackupTime);

      finally
        xSrvDB.mtxDB.Release;
      end;
  end;


  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.db_UpdateStat(DBID: Integer): OleVariant;
  var
    FDBID: Integer;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.db_UpdateStat') else _udebug := nil;{$ENDIF}
  
  storeMessage('---trace---', 'db_UpdateStat', 10);

  clearErrorMessage;

  Result := -1;
  case xSrvDB.mtxDB.Obtain of
    twAbandoned:
      begin
        storeerrorMessage('db_update_stat: mtxDB - abandoned!');
        //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;

    twTimedOut:
      begin
        storeerrorMessage('db_update_stat: mtxDB - timed out!');
        //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;

    twSuccess:
      try
        try
          if (DBID = -1) and xSrvDB.cdsDB.Locate('def', 1, [])
            then FDBID := xSrvDB.cdsDB.FieldByName('dbid').AsInteger
            else FDBID := DBID;

          Connect(FDBID);

          with TxQuery.Create(Conn, 'execute procedure sp_update_stat') do
          try
            Execute;

            Result := 0;

          finally
            Free;
          end;

        except
          on E: Exception do storeErrorMessage('db_update_stat: ' + E.Message);
        end;

      finally
        xSrvDB.mtxDB.Release;
      end;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.db_SaveUpdateStatInfo(DBID, IntervalValue: Integer;
  const IntervalType: WideString; var UpdTime: OleVariant): OleVariant;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.db_SaveUpdateStatInfo') else _udebug := nil;{$ENDIF}
  
  storeMessage('---trace---', 'db_SaveUpdateStatInfo', 10);

  clearErrorMessage;
  
  Result := -1;

  case xSrvDB.mtxDB.Obtain of
    twAbandoned:
      begin
        storeerrorMessage('db_saveupdatestatinfo: mtxDB - abandoned!');
        //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;

    twTimedOut:
      begin
        storeerrorMessage('db_saveupdatestatinfo: mtxDB - timed out!');
        //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;

    twSuccess:
      try
        xSrvDB.db_SaveUpdateStatInfo(DBID, IntervalType, IntervalValue, UpdTime);

      finally
        xSrvDB.mtxDB.Release;
      end;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.GetDBVersion: String;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.GetDBVersion') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'GetDBVersion', 10);

  clearErrorMessage;

  Result := '';

  try
    with TxQuery.Create(Conn, 'select ver from commonparams') do
    try
      Open;
      Result := Fields[0].AsString;
      Close;

    finally
      Free;
    end;

  except
    on e:exception do storeErrorMessage('GetDBVersion err: ' + e.Message);
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.db_CheckVersion(const Ver: WideString): OleVariant;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.db_CheckVersion') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'db_CheckVersion', 10);

  FVersion := GetDBVersion;
  Result := FVersion;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
{function stripSQLcomments(const s: String): String;
  var
   i: Integer;
   c: Char;
   eol: Boolean;
begin
  c := '';
  for i := 1 to length(s) do begin
    eol := (i = 1) or (s[i-1] = #10) or (s[i-1] = #13);

    if i > 1 then begin

      if eol and (c = '-') then c := ''; // end of -- comment
        else if (c = '/') and (s[i] = '/') and (s[i-1] = '*')
        then c := ''
      else if c = '' then Result := Result + s[i];
end;
}
//==============================================================================================
function TokSrv.db_DoUpdate(const Ver: WideString): OleVariant;
  var
    FSQL: TStringList;
    FVerInfo: TxVerInfo;
    FSQLFile, FErr: string;
    i: Integer;
    {updateFiles: TStringList;
    searchRec: TsearchRec;
    va: TIntegerDynArray;
    }
    //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}

  //---------------------------------------
  function processFile: Boolean;
  begin
    Result := True;

    if FileExists(FSQLFile) then begin
      storeMessage('---trace---', 'db_DoUpdate/processFile for ' + FSQLFile, 10);

      FSQL.LoadFromFile(FSQLFile);

      if not ExecScript(FDBPath, FSQL.Text, Conn, True, FErr) then begin
        storeErrorMessage('db_DoUpdate schmucked on file: ' + FSQLFile + ' with message: ' + Ferr);
        Result := False;
      end;
    end;
  end;
  //---------------------------------------
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.db_DoUpdate') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'db_DoUpdate for ' + FDBPath, 10);

  {$IFDEF PROTECT}
  //{$I ASPROTECT\UserPolyBuffer.inc}
  if not ProtCheck then Result := '[eq';
  {$ENDIF}

  clearErrorMessage;

  Result := -1;

  if FDBPath = '' then  begin
    //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  FVerInfo := TxVerInfo.Create;
  FSQL := TStringList.Create;

  // ------------------------ new, broken update code. ;)
(*
  FDialect := 3;

  if 0 <> FindFirst(serverPath + 'upd\*.sql', faArchive, searchRec) then begin
    storeErrorMessage('db_DoUpdate: no files found: ' + serverPath + 'upd\*.sql');
    //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  updateFiles := TStringList.Create;
  updateFiles.CaseSensitive := False;

  repeat
    updateFiles.Add(searchRec.Name);
  until 0 <> FindNext(searchRec);

  updateFiles.Sort;

  storeMessage('*', 'Collected ' + IntTostr(updateFiles.Count) + ' files', 6);

  i := 0;
  while (i < updateFiles.count)
        and (compareVersionNumbers(FVersion, ExtractFileName(updateFiles[i])) >= 0)
  do inc(i);

  storeMessage('*', 'Skipped ' + IntToStr(i) + ' files', 6);

  while (i < updateFiles.count) and (0 <> compareVersionNumbers(FVersion, Ver)) do begin
    storeMessage('+', 'Running DB update ' + updateFiles[i]);
    FSQL.LoadFromFile(updateFiles[i]);

    if ExecScript(FDBPath, FSQL.Text, Conn, True) <> 0 then begin
      storeErrorMessage('db_DoUpdate: error on file: ' + FSQLFile);
      //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    parseVersionNumber(ExtractFileName(updateFiles[i]), va);
    FVersion := IntToStr(va[0]) + '.' + IntToStr(va[1]) + '.' + IntToStr(va[2]) + '.' + IntToStr(va[3]);

    if not ExecScript(FDBPath, 'update commonparams set ver=''' + FVersion + '''', Conn, True)
    then begin
      storeErrorMessage('db_DoUpdate: update commonparams set ver=' + FVersion);
      //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;
    inc(i);
  end;

  Result := 0;
  FVerInfo.Free;
  FSQL.Free;
*)

  // ---------------------- old update code
  //FDialect := 3;

  try
    try
      FVerInfo.CurrVersion := FVersion;

      repeat
        FVerInfo.Next;

        if FVerInfo.CurrVersion = '1.4.11' 
          then FVerInfo.CurrVersion := '2.0.5' // skip unnecessary CPU load ;)
          else if FVerInfo.CurrVersion = '2.0.7' then FVerInfo.CurrVersion := '2.1.1';

        FSQLFile := serverPath + 'upd\' + StringReplace(FVerInfo.CurrVersion, '.', '_', [rfReplaceAll]) + '.sql';

        if not processFile then  begin
          //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
          Exit;
        end;


        FSQLFile := serverPath + 'upd\' + StringReplace(FVerInfo.CurrVersion, '.', '_', [rfReplaceAll]) + '_data.sql';

        if not processFile then  begin
          //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
          Exit;
        end;


        for i := 1 to 10 do begin
          FSQLFile := serverPath + 'upd\' + StringReplace(FVerInfo.CurrVersion, '.', '_', [rfReplaceAll]) + '_data' + IntToStr(i) + '.sql';

          if not processFile then  begin
            //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
            Exit;
          end;

        end;

        if not ExecScript(FDBPath, 'update commonparams set ver=''' + FVerInfo.CurrVersion + '''', Conn, True, Ferr)
        then begin
          storeErrorMessage('db_DoUpdate: update commonparams set ver=' + FVerInfo.CurrVersion + ': ' + Ferr);
          //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
          Exit;
        end;

      until FVerInfo.CurrVersion = Ver;

      Result := 0;

    except
      on E: Exception do storeErrorMessage('db_DoUpdate: ' + E.Message);
    end;

  finally
    FVerInfo.Free;
    FSQL.Free;
  end;

  storeMessage('---trace---', 'db_DoUpdate done', 10);

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TokSrv.usr_SetActivity(FunID: Integer);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.usr_SetActivity') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'usr_SetActivity', 10);

  clearErrorMessage;

  xSrvDB.SetClntActivity(FunID, Self);

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.ver_GetCount: OleVariant;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.ver_GetCount') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'ver_GetCount', 10);

  clearErrorMessage;

  Result := MaxClientsCount;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.db_ExecScript(const sql: WideString): OleVariant;
  var
    FErr: string;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.db_ExecScript') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'db_ExecScript: ' + Sql, 10);

  clearErrorMessage;

  FErr := '';

  try
    if not ExecScript(FDBPath, SQL, Conn, True, FErr) then begin
      storeErrorMessage('db_ExecScript: ' + FErr);
      Result := FErr;
      //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

  except
    on e: Exception do begin
      FErr := e.Message;
      storeErrorMessage('db_ExecScript: ' + FErr);
    end;
  end;

  Result := FErr;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.db_SetDialect(DBID, Value: Integer): OleVariant;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.db_SetDialect') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'db_SetDialect', 10);

  clearErrorMessage;

  Result := -1;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TokSrv.db_Copy(ADBFrom, ADBTo: Integer; const Tables: WideString;
  DelData, CType: Integer; OnDate: TDateTime): OleVariant;
var
    i: Integer;
    FCreateExt, FInsDest, FDelDest, FDropExt, FInsFromExt, FInsToExt: string;
    FTable, FNullIf: String;
    FromDBID, ToDBID: Integer;
    FromDBPath, ToDBPath: string;
    FDDL: TxQuery;
    FErr: string;
    Freconnect: Boolean;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}

  function getRealDBParams(AID: Integer; var outID: Integer; var outPath: String): Boolean;
  begin
    Result := False;
    if (AID = -1) and xSrvDB.cdsDB.Locate('def', 1, [])
      then outID := xSrvDB.cdsDB.FieldByName('dbid').AsInteger
      else outID := AID;

    if not xSrvDB.cdsDBParams.Locate('dbid;parname', VarArrayOf([outID, 'Data Source']), [])
    then begin
      Ferr := 'Database ID: ' + IntToStr(outID) + ' is invalid';
      Exit;
    end;
    outPath := Trim(xSrvDB.cdsDBParams.FieldByName('parvalue').AsString);
    Result := True;
  end;

begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.db_Copy') else _udebug := nil;{$ENDIF}

  storeMessage('---trace---', 'db_Copy(' + Tables + ')', 5);

  {$IFDEF PROTECT}
  //{$I ASPROTECT\UserPolyBuffer.inc}
  if not ProtCheck then Result := '[eq';
  {$ENDIF}

  clearErrorMessage;

  Freconnect := Conn.Connected;

  Conn.Disconnect; // make it easy for execScript, so no dummy reconnections will be made at the end of call

  FDDL := TxQuery.Create(Conn);

  try // finally
    try //except
      if not DirectoryExists(extTblPath)
        then if not CreateDir(extTblPath) then raise Exception.Create('Cannot create temporary table directory: ' + extTblPath);

      storeMessage('%', 'External tables path: ' + exttblpath, 5);

      if not getRealDBParams(ADBTo, ToDBID, ToDBPath) or not getRealDBParams(ADBFrom, FromDBID, FromDBPath)
        then Exit;

      //-------------------------------------------------------------------------
      for i := 1 to WordCount(Tables, [',']) do begin
        FCreateExt := ''; FInsToExt := ''; FErr := ''; FDropExt := ''; FInsDest := ''; FdelDest := '';

        FTable := ExtractWord(i, Tables, [',']);
        DeleteFile(ExtTblPath + FTable + '.ext');
        storeMessage('%', '   Processing table: ' + FTable, 10);

        // getting fields descriptions
        FDDL.SQLText := 'select * from sp_extract_tddl(''' + FTable + ''')';
        FDDL.Open;

        case CType of
          1: FCreateExt := FCreateExt + 'create table ext_kagent external file ''' + ExtTblPath + 'kagent.ext'' (' + FDDL.Fields[1].AsString
                      + ', saldo numeric(15,8), ondate timestamp);';

          else FCreateExt := FCreateExt + 'create table ext_' + FTable + ' external file ''' + ExtTblPath + FTable + '.ext'' ('
                             + FDDL.Fields[1].AsString + ');';
        end;

        FNullIf := FDDL.Fields[2].AsString;

        FDDL.Close;

        case CType of
          1: FInsToExt := FInsToExt + 'insert into ext_kagent select ka.*, kas.saldo, ''' + DateToStr(OnDate) + ''' as ondate from kagent ka'
              + ' left join kagentsaldo kas on (ka.kaid=kas.kaid and (kas.saldo is null or kas.ondate='
              + '(select max(ondate) from kagentsaldo where kaid=ka.kaid and ondate<=''' + DateToStr(OnDate) + ''')));';

          2: if LowerCase(FTable) = 'kagent'
               then FInsToExt := FInsToExt + 'insert into ext_kagent select * from kagent where ktype=3;'
               else FInsToExt := FInsToExt + 'insert into ext_' + FTable + ' select a.* from ' + FTable
                                 + ' a, kagent ka where ka.kaid=a.kaid and ka.ktype=3;'

          else FInsToExt := FInsToExt + 'insert into ext_' + FTable + ' select * from ' + FTable + ';';
        end; // case CType of

        if DelData = 1 then begin
          if FTable = 'currency' then FDelDest := FDelDest + 'delete from currencyrate;';
          FDelDest := FDelDest + 'delete from ' + FTable + ';';
        end;

        FInsFromExt := 'insert into ' + FTable + ' select ' + FNullIf + ' from ext_' + FTable + ';';

        if CType = 1 then begin
          FInsFromExt := ReplaceStr(FInsFromExt, 'nullif(STARTSALDO,'''')', 'SALDO');
          FInsFromExt := ReplaceStr(FInsFromExt, 'nullif(STARTSALDODATE,'''')', '''' + DateToStr(OnDate) + '''');
          FInsFromExt := FInsFromExt + 'insert into kagentsaldo select kaid, startsaldodate, startsaldo from kagent where startsaldo is not null;';
        end;

        if LowerCase(FTable) = 'customtree' 
          then FInsFromExt := ReplaceStr(FInsFromExt, 'nullif(NAME,'''')', 'NAME'); // name can be empty string, but cannot be null

        if LowerCase(FTable) = 'cttext' 
          then FInsFromExt := ReplaceStr(FInsFromExt, 'nullif(DATA,'''')', 'DATA'); // data can be empty string, but cannot be null

        { // we should copy blobs some other way as external tables do not support them
        if LowerCase(FTable) = 'materials' then begin // copying product images too. IDs is not important as it is PKey only
          FCreateExt := FCreateExt + 'create table ext_blobs external file ''' + ExtTblPath 
                        + 'blobs.ext'' (OWNERID INTEGER, OWNERTYPE INTEGER, DATA BLOB SUB_TYPE 0 SEGMENT SIZE 1024, USERDATA INTEGER);';
          FInsToExt := FInsToExt + 'insert into ext_blobs select * from blobs where ownertype=1000;';
          FInsFromExt := FInsFromExt + 'insert into blobs select * from ext_blobs;';
          FDropExt := FDropExt + 'execute procedure sp_drop_table(''ext_blobs'');';
        end;
        }

        FInsDest := FInsDest + FInsFromExt;

        FDropExt := FDropExt + 'execute procedure sp_drop_table(''' + 'ext_' + FTable + ''');';

        //----------------------------------------------------------------------------------
        FErr := '';

        // dropping external tables if they exists from previous copy
        storeMessage('%', 'FDropExt: ' + ReplaceStr(FDropExt, ';', ';' + #13#10), 10);
        if not ExecScript(FromDBPath, FDropExt, Conn, True, FErr) then begin
          FErr := 'db_Copy: external tables drop error: ' + Ferr;
          storeErrorMessage(FErr);
          Result := FErr;
          Exit;
        end;

        // making external tables
        storeMessage('%', 'FCreateExt: ' + ReplaceStr(FCreateExt, ';', ';' + #13#10), 10);
        if not ExecScript(FromDBPath, FCreateExt, Conn, True, FErr) then begin
          Ferr := 'db_Copy: create external tables error: ' + Ferr;
          storeErrorMessage(Ferr);
          Result := FErr;
          Exit;
        end;

        // copying data into external tables
        storeMessage('%', 'FInsToExt: ' + ReplaceStr(FInsToExt, ';', ';' + #13#10), 10);
        if not ExecScript(FromDBPath, FInsToExt, Conn, True, FErr) then begin
          FErr := 'db_Copy: insert into external tables error: ' + Ferr;
          storeErrorMessage(Ferr);
          Result := FErr;
          Exit;
        end;

        // removing references to ext tables from source DB
        if not ExecScript(FromDBPath, FDropExt, Conn, True, FErr) then begin
          Ferr := 'db_Copy: drop external @ source error: ' + Ferr;
          storeErrorMessage(Ferr);
          Result := FErr;
          Exit;
        end;

        // removing references to ext tables from dest DB (just in case)
        if not ExecScript(ToDBPath, FDropExt, Conn, True, FErr) then begin
          Ferr := 'db_Copy: initial drop external @ dest error: ' + Ferr;
          storeErrorMessage(Ferr);
          Result := FErr;
          Exit;
        end;

        // creating ext tables definition in dest DB
        if not ExecScript(ToDBPath, FCreateExt, Conn, True, FErr) then begin
          Ferr := 'db_Copy: create external @ dest error: ' + Ferr;
          storeErrorMessage(Ferr);
          Result := FErr;
          Exit;
        end;

        // deleting table data in dest DB
        storeMessage('%', 'FDelDest: ' + ReplaceStr(FDelDest, ';', ';' + #13#10), 10);
        if not ExecScript(ToDBPath, FDelDest, Conn, True, FErr) then begin
          Ferr := 'db_Copy: delete from dest error: ' + Ferr;
          storeErrorMessage(Ferr);
          Result := FErr;
          Exit;
        end;

        // copying data from ext tables into dest DB
        storeMessage('%', 'FInsDest: ' + ReplaceStr(FInsDest, ';', ';' + #13#10), 10);
        if not ExecScript(ToDBPath, FInsDest, Conn, True, FErr) then begin
          Ferr := 'db_Copy: insert into dest error: ' + Ferr;
          storeErrorMessage(Ferr);
          Result := FErr;
          Exit;
        end;

        // removing external tables reference from dest DB
        if not ExecScript(ToDBPath, FDropExt, Conn, True, FErr) then begin
          Ferr := 'db_Copy: final drop external @ dest error: ' + Ferr;
          storeErrorMessage(Ferr);
          Result := FErr;
          Exit;
        end;
      end;  // for i := 1 to WordCount(Tables, [','])

    except
      on e:exception do storeErrorMessage('DBCopy Tables: ' + Tables + '; err: ' + e.Message);
    end;

  finally
    FDDL.Free;
    if FReconnect then Conn.Connected := True;
    //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
{
  if AclientMsg = '' then just returns server HID and RegKeyCheckState in AservMsg
  if AclientMsg contains type=A then sets new key and saves it if check passed. also returns RegKeyCheckState in AservMsg
  Result = 0: OK
  Result = 1: Client/server types mismatch
  Result = 2: incompatible client version
  Result = 3: timeout for activation
  Result = 4: wrong hardware ID in key
  Result = 5: activation denied by our web-server
}
function TokSrv.ClientRegInfo(const AclientMsg: WideString; out AservKey, AservMsg: OleVariant): OleVariant; safecall;
  var
    clientMsg: TStringList;
    i: Integer;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TokSrv.ClientRegInfo') else _udebug := nil;{$ENDIF}

  {$IFDEF PROTECT}
  //{$I ASPROTECT\UserPolyBuffer.inc}
  {$ENDIF}

  {$IFDEF DEBUG}storeMessage('---trace---', 'ClientRegInfo', 0);{$ENDIF}
  Result := 0;

  SetNextRegCheck; // checking for expired activation or just request new key validation

  clientMsg := TstringList.Create();

  try //finally
    try //except
      AservKey := RegKey;

      // adding activation status to key state
      if servAuthMsg.Values['Atype'] = '-1'
        then RegKeyCheckState := RegKeyCheckState or protKeyActTimeout
        else RegKeyCheckState := RegKeyCheckState and not protKeyActTimeout;

      if servAuthMsg.Values['Atype'] = '1'
        then RegKeyCheckState := RegKeyCheckState or protKeyActPending
        else RegKeyCheckState := RegKeyCheckState and not protKeyActPending;

      // key check from client. returning current key and validation state
      if AclientMsg = '' then begin
        AservKey := CurrentHardwareID;
        {$IFDEF FREE}
          AservMsg := 0;
        {$ELSE}
          AservMsg := RegKeyCheckState;
        {$ENDIF}

        {$IFDEF DEBUG}storeMessage('@', 'ClientRegInfo: HID requested');{$ENDIF}

        Exit;
      end;

      clientMsg.Text := decodeKey(AclientMsg);

      {$IFNDEF FREE}
        if clientMsg.Values['type'] = 'A' then begin
          {$IFDEF DEBUG}storeMessage('@', 'ClientRegInfo: New Key pushed', 10);{$ENDIF}

          if AssignRegKey(AclientMsg) then begin
            {$IFDEF DEBUG}storeMessage('@', 'ClientRegInfo: Key is valid', 10);{$ENDIF}

            SaveRegKey(serverPath + '\' + 'srvkey.txt');
            MaxClientsCount := StrToInt(RegInfo.Values['maxclients']);
            ClearRegCheck; // assuming that push happens only in activation dialog in client and only if activation succedes
          end
          else begin 
            {$IFDEF DEBUG}storeErrorMessage('ClientRegInfo: Pushed Key is invalid: ' + AclientMsg);{$ENDIF}
          end;

          AservMsg := RegKeyCheckState;

          Exit;
        end;
      {$ENDIF}

      servAuthMsg.Values['serverVer'] := FullVersionNo;

      {$IFDEF DEBUG}
        servAuthMsg.Values['Type'] := clientMsg.Values['type']; // faking client compatibility for debug
      {$ELSE}
        servAuthMsg.Values['Type'] := {$IFDEF FREE}'F'{$ELSE}'C'{$ENDIF};
      {$ENDIF}

      {$IFDEF DEBUG}
        storeMessage('@', 'Auth: cltMsg: "' + clientMsg.Text + '"');
        storeMessage('@', 'Auth: srvKey: "' + RegInfo.Text + '"');
      {$ENDIF}

      {$IFNDEF DEBUG}
      if clientMsg.Values['type'] <> servAuthMsg.Values['Type']
      then Result := 1 // not our kind
      else
      {$ENDIF}
      begin
        i := compareversionNumbers(clientMsg.Values['clientVer'], minClientVer);

        if i < 0 
        then Result := 2
        else begin
          {$IFNDEF FREE}
            // check if client returned valid activation
            if clientMsg.Values['Active'] = '1' then begin
              ClearRegCheck; // activated. begins routine N-days key rechecking
              {$IFDEF DEBUG}storeMessage('@', 'Activation succesfull');{$ENDIF}
            end
            else if servAuthMsg.Values['Atype'] = '-1' then begin
              Result := 3; // timeout for activation
              {$IFDEF DEBUG}storeMessage('@', 'Activation Timeout. Dropping client');{$ENDIF}
            end
            else if clientMsg.Values['Active'] = '0' then begin
              WriteToRegDate(ServerRegKey, nonActStop, IncMonth(now, -1), HKEY_LOCAL_MACHINE); // act as if activation period expired
              {$IFDEF DEBUG}storeMessage('@', 'Activation denied. Dropping client');{$ENDIF}
              Result := 5; // activation denied
            end;
          {$ENDIF}
        end; // client version accepted
      end; // client type accepted

      FValidClient := (Result = 0);

      {$IFDEF DEBUG}
        if Result = 0
          then storeMessage('@', 'Auth succesful')
          else storeMessage('@', 'Auth UNSUCCESSFULL, code: ' + IntTostr(Result));

        storeMessage('@', 'Auth: srvMsg: "' + servAuthMsg.Text + '"');
      {$ENDIF}

      AservMsg := encodeKey(servAuthMsg.Text);

    except
      on e: Exception do storeErrorMessage('ClientRegInfo: ' + e.Message);
    end;

  finally
    clientMsg.Destroy;
    //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
function TokSrv.stat_GetLog: OleVariant; safecall;
begin
  Result := #13#10'Server log:'#13#10 + GetLogStack(False, 0);
end;

//==============================================================================================
function TokSrv.stat_lastError: OleVariant; safecall;
begin
  Result := lastSQLError + IfThen(lastTrErrors <> '', '(Transaction: ' + lastTrErrors + ')', '');
end;

//==============================================================================================
function TokSrv.stat_lastTrErrors: OleVariant;
begin
  Result := lastTrErrors;
end;

//==============================================================================================
procedure TokSrv.clearErrorMessage;
begin
  lastSQLError := '';
  lastTrErrors := '';
end;

//==============================================================================================
procedure TokSrv.storeErrorMessage(const m :String; log: boolean = True);
begin
  lastSQLError := m;

  if inTran or Conn.inTransaction then begin
    if lastTrErrors <> '' then lastTrErrors := lastTrErrors + ','#13#10;
    lastTrErrors := lastTrErrors + m;
  end;

  if log then logEvent('! Error ' + '(' + IntToStr(Integer(Self)) + ') ' + ifThen(FIP = '', '', Fhost + '(IP: ' + FIP + '); ') + m);
end;

//==============================================================================================
procedure TokSrv.storeMessage(const prefix, m: String; const ADebugLevel: Integer = 0);
  var
    s: String;
begin
  s := ifThen(prefix <> '', prefix + ' ', '');

  {$IFDEF DEBUG}
  s := s + '(' + IntToStr(Integer(Self)) + '); ';
  {$ELSE}
  if rdmCount > 1
    then s := s + '(' + IntToStr(Integer(Self)) + ifThen(FIP = '', '); ', '/' + Fhost + '/' + FIP + '); ')
    else s := s + '';
  {$ENDIF}

  LogEvent(s + m, ADebugLevel);
end;

{$IFDEF ZEOS}
//==============================================================================================
procedure TokSrv.sqlLogger(Sender: TObject; Event: TZLoggingEvent);
  var
    s: String;
begin
  if DebugLevel < 11 then Exit;

  case Event.Category of
    lcConnect:     s := 'Connect';
    lcDisconnect:  s := 'Disconnect';
    lcTransaction: s := 'Transaction';
    lcExecute:     s := 'Execute';
    else s := 'Other';
  end;

  s := s + ', msg: ' + Event.Message;

  if (Event.ErrorCode <> 0) or (Event.Error <> '')
    then s := s + ', errcode: ' + IntToStr(Event.ErrorCode) + ', error: ' + Event.Error;

  storeMessage('&', s, 11);
end;
{$ENDIF}

//==============================================================================================
function TokSrv.Command(Code: Integer; Params: OleVariant; out Output: OleVariant): OleVariant;
var
    s: String;
    n: Integer;
begin
  storeMessage('---trace---', 'Command(' + IntToStr(Code) + ')', 10);

  case Code of
    cmdGetDir:
      begin
        Result := GetDir(Params, s); // fmt: name|datetime|size|attr#13#10
        Output := s;
      end;

    cmdSetSingleUserMode:
      begin
        Result := SetSingleUserMode(Self, (Params <> ''));
      end; // cmdSetSingleUserMode:

    cmdSetServerDebugLevel:
      begin
        Result := False;

        try
          n := Params;
          if n < 0 then begin
            Result := DebugLevel;
            Exit;
          end;
          cmdLineDebug := (n > 0);
          DebugLevel := n;
          Result := True;

        except
        end;
      end; // cmdSetServerDebugLevel

   cmdGetServerSysInfo:
     begin
       Result := True;
       Output := 'Server ' + OK_Version + ' Sys Info: '#13#10 + RegSysInfo.Text;
     end;

    else storeErrorMessage('Invalid command code: ' + IntToStr(Code));
  end;
end;

//==============================================================================================
procedure TokSrv.ApplicationEvents1Exception(Sender: TObject; E: Exception);
  var
    errtxt: String;
    i: Integer;
begin
  Screen.Cursor := crDefault;
  debugStoreErrorPlace;

  // stat
  if not ReadFromRegInt(ServerRegKey, regKeyExceptions, i) then i := 0;
  WriteToRegInt(ServerRegKey, regKeyExceptions, i + 1);

  if Pos('Access violation', E.Message) > 0 then begin
    errtxt := E.Message + ' (apparently in "' + translateAccViolAddr(serverExeMapFile, e.Message) + '")';
  end; //

  if errtxt = '' then errtxt := E.Message;

  debugInstantLog('! Exception in ' + Sender.ClassName + ': ' + errtxt + udebugDump);

  {errtxt := dmData.lng('Common', 'ErrorOccured') + ':  ' + errtxt;

  Application.ssMessageDlg(errtxt, ssmtError, [ssmbOK], '', False, showAddButtons);
  }
end;

//==============================================================================================
function TokSrv.IokSrv_Callback_Reg(const Intf: IAppServer;
  out ID: OleVariant): OleVariant;
begin

end;

initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('SrvData', @Debugging, DEBUG_group_ID);
  {$ENDIF}

  try // inserted by UDEBUG processor
    TComponentFactory.Create(ComServer, TokSrv, Class_okSrv, ciMultiInstance, tmSingle);
    debugInstantLog('+ ComServer Registered');

  except // inserted by UDEBUG processor
    {$IFDEF UDEBUG}
    on e: exception do begin
      debugInstantLog('error at SrvData/ini: ' + e.Message);
      e.Create('error at SrvData/ini: ' + e.Message);
    end;
    {$ENDIF}
  end; // try

//==============================================================================================
finalization
  {$IFDEF UDEBUG}
  //debugUnregisterUnit(DEBUG_unit_ID);
  {$ENDIF}

end.
