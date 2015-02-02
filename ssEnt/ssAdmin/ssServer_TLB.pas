unit ssServer_TLB;

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

// PASTLWTR : $Revision:   1.130  $
// File generated on 12.12.2003 13:41:38 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\Projects\Production\ssServer\ssServer.tlb (1)
// LIBID: {28C92F31-54F8-4268-B04A-5CF3EE232D84}
// LCID: 0
// Helpfile: 
// DepndLst: 
//   (1) v1.0 Midas, (C:\WINNT\System32\midas.dll)
//   (2) v2.0 stdole, (C:\WINNT\System32\stdole2.tlb)
//   (3) v4.0 StdVCL, (C:\WINNT\System32\stdvcl40.dll)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}

interface

uses ActiveX, Classes, Graphics, Midas, StdVCL, Variants, Windows;
  


// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  ssServerMajorVersion = 1;
  ssServerMinorVersion = 0;

  LIBID_ssServer: TGUID = '{28C92F31-54F8-4268-B04A-5CF3EE232D84}';

  IID_IssSrv: TGUID = '{063FDAC0-52F5-4C98-842A-404A7A21F1C5}';
  CLASS_ssSrv: TGUID = '{D1BE25BD-C0E1-44F4-A8BC-13090C33D877}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IssSrv = interface;
  IssSrvDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  ssSrv = IssSrv;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  POleVariant1 = ^OleVariant; {*}


// *********************************************************************//
// Interface: IssSrv
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {063FDAC0-52F5-4C98-842A-404A7A21F1C5}
// *********************************************************************//
  IssSrv = interface(IAppServer)
    ['{063FDAC0-52F5-4C98-842A-404A7A21F1C5}']
    procedure Start; safecall;
    procedure Commit; safecall;
    procedure Rollback; safecall;
    function  GetMaxProvID: OleVariant; safecall;
    function  AddProvider(ID: Integer; const Name: WideString; PID: Integer; IsGroup: Integer; 
                          IsNew: Integer): OleVariant; safecall;
    function  DropProvider(ID: Integer): OleVariant; safecall;
    function  ModifyProvText(ID: Integer; const Text: WideString): OleVariant; safecall;
    function  GetProvText(ID: Integer): OleVariant; safecall;
    function  AS_GetMacros(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; safecall;
    procedure AS_SetMacros(const ProviderName: WideString; var Macros: OleVariant); safecall;
    procedure SetClientInfo(const IP: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  IssSrvDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {063FDAC0-52F5-4C98-842A-404A7A21F1C5}
// *********************************************************************//
  IssSrvDisp = dispinterface
    ['{063FDAC0-52F5-4C98-842A-404A7A21F1C5}']
    procedure Start; dispid 1;
    procedure Commit; dispid 2;
    procedure Rollback; dispid 3;
    function  GetMaxProvID: OleVariant; dispid 4;
    function  AddProvider(ID: Integer; const Name: WideString; PID: Integer; IsGroup: Integer; 
                          IsNew: Integer): OleVariant; dispid 8;
    function  DropProvider(ID: Integer): OleVariant; dispid 9;
    function  ModifyProvText(ID: Integer; const Text: WideString): OleVariant; dispid 10;
    function  GetProvText(ID: Integer): OleVariant; dispid 11;
    function  AS_GetMacros(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 5;
    procedure AS_SetMacros(const ProviderName: WideString; var Macros: OleVariant); dispid 6;
    procedure SetClientInfo(const IP: WideString); dispid 7;
    function  AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; 
                              MaxErrors: Integer; out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function  AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                            Options: Integer; const CommandText: WideString; 
                            var Params: OleVariant; var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function  AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function  AS_GetProviderNames: OleVariant; dispid 20000003;
    function  AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function  AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                            var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CossSrv provides a Create and CreateRemote method to          
// create instances of the default interface IssSrv exposed by              
// the CoClass ssSrv. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CossSrv = class
    class function Create: IssSrv;
    class function CreateRemote(const MachineName: string): IssSrv;
  end;

implementation

uses ComObj;

class function CossSrv.Create: IssSrv;
begin
  Result := CreateComObject(CLASS_ssSrv) as IssSrv;
end;

class function CossSrv.CreateRemote(const MachineName: string): IssSrv;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ssSrv) as IssSrv;
end;

end.
