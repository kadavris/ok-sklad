unit xIBUtils;

interface

uses Windows;

function CreateDB(const AFileName: string): boolean;

implementation

uses Dialogs;

type
  PVoid                = ^Pointer;
  ISC_STATUS           = Longint;
  PISC_STATUS          = ^ISC_STATUS;
  TISC_DB_HANDLE       = PVoid;
  PISC_DB_HANDLE       = ^TISC_DB_HANDLE;
  TISC_TR_HANDLE       = PVoid;
  PISC_TR_HANDLE       = ^TISC_TR_HANDLE;

var
  GDS32DLL: Integer;
  isc_dsql_execute_immediate: function (status_vector     : PISC_STATUS;
				 db_handle                : PISC_DB_HANDLE;
				 tran_handle              : PISC_TR_HANDLE;
				 length                   : Word;
				 statement                : PChar;
				 dialect                  : Word;
                 xsqlda                   : Pointer): Longint; stdcall;

function CreateDB(const AFileName: string): boolean;
var
  err_code: Longint;
  tr_handle: TISC_TR_HANDLE;
  db_handle: TISC_DB_HANDLE;
  status_vector: array [0..19] of Longint;
begin
  Result := False;
  if not Assigned(isc_dsql_execute_immediate) then Exit;
  showmessage('dll loaded');
  db_handle := nil;
  tr_handle := nil;
  err_code := isc_dsql_execute_immediate(@status_vector, @db_handle, @tr_handle, 0, PChar(AFileName), 1, nil);
  if err_code = 0 then Result := True; 
end;

initialization
  GDS32DLL := 0;
  GDS32DLL := LoadLibrary('FBCLIENT.DLL');
  if GDS32DLL <> 0
   then isc_dsql_execute_immediate:=GetProcAddress(GDS32DLL,'isc_dsql_execute_immediate');

finalization
  if GDS32DLL <> 0 then FreeLibrary(GDS32DLL);

end.



