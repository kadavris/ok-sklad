unit okServer_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 28.06.2010 1:45:05 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\Projects\ssEnt\ssServer\OK_Server.tlb (1)
// LIBID: {28C92F31-54F8-4268-B04A-5CF3EE232D84}
// LCID: 0
// Helpfile: 
// HelpString: ssServer Library
// DepndLst: 
//   (1) v1.0 Midas, (D:\Projects\ssEnt\ssServer\midas.dll)
//   (2) v2.0 stdole, (C:\Windows\system32\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, Midas, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  okServerMajorVersion = 1;
  okServerMinorVersion = 0;

  LIBID_okServer: TGUID = '{28C92F31-54F8-4268-B04A-5CF3EE232D84}';

  IID_IokSrv: TGUID = '{063FDAC0-52F5-4C98-842A-404A7A21F1C5}';
  CLASS_okSrv: TGUID = '{D1BE25BD-C0E1-44F4-A8BC-13090C33D877}';
  IID_IssCallback: TGUID = '{749206C6-4B97-48FA-88F0-563125C1D61F}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IokSrv = interface;
  IokSrvDisp = dispinterface;
  IssCallback = interface;
  IssCallbackDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  okSrv = IokSrv;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  POleVariant1 = ^OleVariant; {*}


// *********************************************************************//
// Interface: IokSrv
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {063FDAC0-52F5-4C98-842A-404A7A21F1C5}
// *********************************************************************//
  IokSrv = interface(IAppServer)
    ['{063FDAC0-52F5-4C98-842A-404A7A21F1C5}']
    procedure Start; safecall;
    procedure Commit; safecall;
    procedure Rollback; safecall;
    function GetMaxProvID: OleVariant; safecall;
    function AddProvider(ID: Integer; const Name: WideString; PID: Integer; IsGroup: Integer; 
                         IsNew: Integer): OleVariant; safecall;
    function DropProvider(ID: Integer): OleVariant; safecall;
    function ModifyProvText(ID: Integer; const Text: WideString): OleVariant; safecall;
    function GetProvText(ID: Integer): OleVariant; safecall;
    function AS_GetMacros(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; safecall;
    procedure AS_SetMacros(const ProviderName: WideString; var Macros: OleVariant); safecall;
    function SetClientInfo(const IP: WideString; const Host: WideString; const Intf: IDispatch): OleVariant; safecall;
    function GetDBParams(ID: Integer): OleVariant; safecall;
    function AddDB(ID: Integer; const Name: WideString; Def: Integer; IsNew: Integer): OleVariant; safecall;
    function AddDBParams(ID: Integer; const DBParams: WideString; IsNew: Integer): OleVariant; safecall;
    function DropDB(ID: Integer; DelFile: Integer): OleVariant; safecall;
    function Connect(DBID: Integer): OleVariant; safecall;
    procedure Disconnect; safecall;
    function CheckLogin(const Login: WideString; const Pass: WideString; DBID: Integer; 
                        SMode: Integer): OleVariant; safecall;
    function NewDB(const FileName: WideString; const Params: WideString): OleVariant; safecall;
    function GetDBFileName: OleVariant; safecall;
    function Rsv_Add(PosID: Integer; MatID: Integer; WID: Integer; AVisible: Integer; Amount: Double): OleVariant; safecall;
    procedure Rsv_Delete(ID: Integer); safecall;
    procedure Clnt_Check; safecall;
    function Callback_Reg(const Intf: IAppServer; out ID: OleVariant): OleVariant; safecall;
    procedure q_Add(AType: Integer; AParam: OleVariant); safecall;
    function db_TestConnect(const Path: WideString): OleVariant; safecall;
    function db_Update(ID: Integer; const Name: WideString; Def: Integer; const Path: WideString): OleVariant; safecall;
    procedure usr_WriteBlob(const Data: WideString; ALength: Integer; const ATable: WideString; 
                            const AField: WideString; AID: Integer; const AKeyField: WideString; 
                            const APar1: WideString; const Apar2: WideString); safecall;
    function usrs_Add(const Login: WideString; const Pass: WideString; const FullName: WideString): OleVariant; safecall;
    function usrs_Delete(UserID: Integer): OleVariant; safecall;
    function usrs_Update(UserID: Integer; const UserName: WideString; const Pass: WideString; 
                         const FullName: WideString): OleVariant; safecall;
    function doclck_Add(ID: Integer; DocType: Integer): OleVariant; safecall;
    function doclck_Delete(ID: Integer; DocType: Integer): OleVariant; safecall;
    function doclck_Check(ID: Integer; DocType: Integer): OleVariant; safecall;
    function GetMaxID(const TableName: WideString; const KeyName: WideString): OleVariant; safecall;
    function db_Backup(const BackupFile: WideString; DBID: Integer): OleVariant; safecall;
    function db_Restore(const BackupFile: WideString; DBID: Integer): OleVariant; safecall;
    function db_SaveBackupInfo(DBID: Integer; const BackupDir: WideString; IntervalValue: Integer; 
                               const IntervalType: WideString; var BackupTime: OleVariant): OleVariant; safecall;
    function db_UpdateStat(DBID: Integer): OleVariant; safecall;
    function db_SaveUpdateStatInfo(DBID: Integer; IntervalValue: Integer; 
                                   const IntervalType: WideString; var UpdTime: OleVariant): OleVariant; safecall;
    function db_CheckVersion(const Ver: WideString): OleVariant; safecall;
    function db_DoUpdate(const Ver: WideString): OleVariant; safecall;
    procedure usr_SetActivity(FunID: Integer); safecall;
    function ver_GetCount: OleVariant; safecall;
    function db_ExecScript(const sql: WideString): OleVariant; safecall;
    function db_SetDialect(DBID: Integer; Value: Integer): OleVariant; safecall;
    function db_Copy(ADBFrom: Integer; ADBTo: Integer; const Tables: WideString; DelData: Integer; 
                     CType: Integer; OnDate: TDateTime): OleVariant; safecall;
    function stat_GetLog: OleVariant; safecall;
    function stat_lastError: OleVariant; safecall;
    function ClientRegInfo(const AclientMsg: WideString; out AservKey: OleVariant; 
                           out AservMsg: OleVariant): OleVariant; safecall;
    function stat_lastTrErrors: OleVariant; safecall;
    function db_Repair(const BackupFile: WideString; DBID: Integer): OleVariant; safecall;
    function Command(Code: Integer; Params: OleVariant; out Output: OleVariant): OleVariant; safecall;
  end;

// *********************************************************************//
// DispIntf:  IokSrvDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {063FDAC0-52F5-4C98-842A-404A7A21F1C5}
// *********************************************************************//
  IokSrvDisp = dispinterface
    ['{063FDAC0-52F5-4C98-842A-404A7A21F1C5}']
    procedure Start; dispid 1;
    procedure Commit; dispid 2;
    procedure Rollback; dispid 3;
    function GetMaxProvID: OleVariant; dispid 4;
    function AddProvider(ID: Integer; const Name: WideString; PID: Integer; IsGroup: Integer; 
                         IsNew: Integer): OleVariant; dispid 8;
    function DropProvider(ID: Integer): OleVariant; dispid 9;
    function ModifyProvText(ID: Integer; const Text: WideString): OleVariant; dispid 10;
    function GetProvText(ID: Integer): OleVariant; dispid 11;
    function AS_GetMacros(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 5;
    procedure AS_SetMacros(const ProviderName: WideString; var Macros: OleVariant); dispid 6;
    function SetClientInfo(const IP: WideString; const Host: WideString; const Intf: IDispatch): OleVariant; dispid 7;
    function GetDBParams(ID: Integer): OleVariant; dispid 12;
    function AddDB(ID: Integer; const Name: WideString; Def: Integer; IsNew: Integer): OleVariant; dispid 13;
    function AddDBParams(ID: Integer; const DBParams: WideString; IsNew: Integer): OleVariant; dispid 14;
    function DropDB(ID: Integer; DelFile: Integer): OleVariant; dispid 15;
    function Connect(DBID: Integer): OleVariant; dispid 16;
    procedure Disconnect; dispid 17;
    function CheckLogin(const Login: WideString; const Pass: WideString; DBID: Integer; 
                        SMode: Integer): OleVariant; dispid 18;
    function NewDB(const FileName: WideString; const Params: WideString): OleVariant; dispid 19;
    function GetDBFileName: OleVariant; dispid 20;
    function Rsv_Add(PosID: Integer; MatID: Integer; WID: Integer; AVisible: Integer; Amount: Double): OleVariant; dispid 21;
    procedure Rsv_Delete(ID: Integer); dispid 22;
    procedure Clnt_Check; dispid 23;
    function Callback_Reg(const Intf: IAppServer; out ID: OleVariant): OleVariant; dispid 24;
    procedure q_Add(AType: Integer; AParam: OleVariant); dispid 25;
    function db_TestConnect(const Path: WideString): OleVariant; dispid 26;
    function db_Update(ID: Integer; const Name: WideString; Def: Integer; const Path: WideString): OleVariant; dispid 27;
    procedure usr_WriteBlob(const Data: WideString; ALength: Integer; const ATable: WideString; 
                            const AField: WideString; AID: Integer; const AKeyField: WideString; 
                            const APar1: WideString; const Apar2: WideString); dispid 28;
    function usrs_Add(const Login: WideString; const Pass: WideString; const FullName: WideString): OleVariant; dispid 29;
    function usrs_Delete(UserID: Integer): OleVariant; dispid 30;
    function usrs_Update(UserID: Integer; const UserName: WideString; const Pass: WideString; 
                         const FullName: WideString): OleVariant; dispid 31;
    function doclck_Add(ID: Integer; DocType: Integer): OleVariant; dispid 32;
    function doclck_Delete(ID: Integer; DocType: Integer): OleVariant; dispid 33;
    function doclck_Check(ID: Integer; DocType: Integer): OleVariant; dispid 34;
    function GetMaxID(const TableName: WideString; const KeyName: WideString): OleVariant; dispid 35;
    function db_Backup(const BackupFile: WideString; DBID: Integer): OleVariant; dispid 36;
    function db_Restore(const BackupFile: WideString; DBID: Integer): OleVariant; dispid 37;
    function db_SaveBackupInfo(DBID: Integer; const BackupDir: WideString; IntervalValue: Integer; 
                               const IntervalType: WideString; var BackupTime: OleVariant): OleVariant; dispid 38;
    function db_UpdateStat(DBID: Integer): OleVariant; dispid 39;
    function db_SaveUpdateStatInfo(DBID: Integer; IntervalValue: Integer; 
                                   const IntervalType: WideString; var UpdTime: OleVariant): OleVariant; dispid 40;
    function db_CheckVersion(const Ver: WideString): OleVariant; dispid 42;
    function db_DoUpdate(const Ver: WideString): OleVariant; dispid 43;
    procedure usr_SetActivity(FunID: Integer); dispid 41;
    function ver_GetCount: OleVariant; dispid 44;
    function db_ExecScript(const sql: WideString): OleVariant; dispid 45;
    function db_SetDialect(DBID: Integer; Value: Integer): OleVariant; dispid 46;
    function db_Copy(ADBFrom: Integer; ADBTo: Integer; const Tables: WideString; DelData: Integer; 
                     CType: Integer; OnDate: TDateTime): OleVariant; dispid 47;
    function stat_GetLog: OleVariant; dispid 301;
    function stat_lastError: OleVariant; dispid 302;
    function ClientRegInfo(const AclientMsg: WideString; out AservKey: OleVariant; 
                           out AservMsg: OleVariant): OleVariant; dispid 303;
    function stat_lastTrErrors: OleVariant; dispid 304;
    function db_Repair(const BackupFile: WideString; DBID: Integer): OleVariant; dispid 305;
    function Command(Code: Integer; Params: OleVariant; out Output: OleVariant): OleVariant; dispid 306;
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: Integer; 
                             out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                           Options: Integer; const CommandText: WideString; var Params: OleVariant; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// Interface: IssCallback
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {749206C6-4B97-48FA-88F0-563125C1D61F}
// *********************************************************************//
  IssCallback = interface(IDispatch)
    ['{749206C6-4B97-48FA-88F0-563125C1D61F}']
    procedure ExecCommand(CType: Integer; CParam: Integer; SourceAddr: Integer); safecall;
  end;

// *********************************************************************//
// DispIntf:  IssCallbackDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {749206C6-4B97-48FA-88F0-563125C1D61F}
// *********************************************************************//
  IssCallbackDisp = dispinterface
    ['{749206C6-4B97-48FA-88F0-563125C1D61F}']
    procedure ExecCommand(CType: Integer; CParam: Integer; SourceAddr: Integer); dispid 1;
  end;

// *********************************************************************//
// The Class CookSrv provides a Create and CreateRemote method to          
// create instances of the default interface IokSrv exposed by              
// the CoClass okSrv. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CookSrv = class
    class function Create: IokSrv;
    class function CreateRemote(const MachineName: string): IokSrv;
  end;

implementation

uses ComObj;

class function CookSrv.Create: IokSrv;
begin
  Result := CreateComObject(CLASS_okSrv) as IokSrv;
end;

class function CookSrv.CreateRemote(const MachineName: string): IokSrv;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_okSrv) as IokSrv;
end;

end.
