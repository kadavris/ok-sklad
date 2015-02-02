unit ssClntCallback;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  ComObj, ActiveX, OK_Sklad_TLB, StdVcl, okServer_TLB, Windows;

type
  TIssClntCallback = class(TAutoObject, IssCallback)
    protected
      procedure ExecCommand(CType, CParam, SourceAddr: Integer); safecall;
  end;

procedure initCallback;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  ComServ, SysUtils, Dialogs, ClientData, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

//==============================================================================================
procedure TIssClntCallback.ExecCommand(CType, CParam, SourceAddr: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TIssClntCallback.ExecCommand') else _udebug := nil;{$ENDIF}

  try
    dmData.q_Add(CType, CParam, SourceAddr);
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure initCallback;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TIssClntCallback/initCallBack') else _udebug := nil;{$ENDIF}

  TAutoObjectFactory.Create(ComServer, TIssClntCallback, Class_IssClntCallback, ciMultiInstance, tmSingle);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('ssClntCallback', @Debugging, DEBUG_group_ID);
  {$ENDIF}

  (*{$IFNDEF PKG}
  TAutoObjectFactory.Create(ComServer, TIssClntCallback, Class_IssClntCallback, ciMultiInstance, tmSingle);
  {$ENDIF}
  *)

finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
