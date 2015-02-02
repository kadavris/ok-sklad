unit OK_Sklad_TLB;

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
// File generated on 17.11.2010 16:03:51 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\Projects\Production7\OK_Sklad.tlb (1)
// LIBID: {C2E09378-22FC-4364-85E3-46393454E065}
// LCID: 0
// Helpfile: 
// HelpString: Production Library
// DepndLst: 
//   (1) v1.0 okServer, (D:\Projects\ssEnt\ssServer\OK_Server.exe)
//   (2) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, okServer_TLB, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  OK_SkladMajorVersion = 2;
  OK_SkladMinorVersion = 0;

  LIBID_OK_Sklad: TGUID = '{C2E09378-22FC-4364-85E3-46393454E065}';

  CLASS_IssClntCallback: TGUID = '{F99E9DDA-7C9A-4CF4-B226-24F8AB68D07D}';
type

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  IssClntCallback = IssCallback;


// *********************************************************************//
// The Class CoIssClntCallback provides a Create and CreateRemote method to          
// create instances of the default interface IssCallback exposed by              
// the CoClass IssClntCallback. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoIssClntCallback = class
    class function Create: IssCallback;
    class function CreateRemote(const MachineName: string): IssCallback;
  end;

implementation

uses ComObj;

class function CoIssClntCallback.Create: IssCallback;
begin
  Result := CreateComObject(CLASS_IssClntCallback) as IssCallback;
end;

class function CoIssClntCallback.CreateRemote(const MachineName: string): IssCallback;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_IssClntCallback) as IssCallback;
end;

end.
