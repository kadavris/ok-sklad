//UDEBUG code already inserted. Please do not remove this line.
{$I ok_server.inc}
unit ssFun;

interface

uses 
  Classes;

procedure SortByObj(AList: TStringList);

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  {$IFDEF UDEBUG}udebug,{$ENDIF}
  sysutils;

{$IFDEF UDEBUG}var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';{$ENDIF}

//==============================================================================================
procedure SortByObj(AList: TStringList);
  var
    i: integer;
    f: boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'SortByObj') else _udebug := nil;{$ENDIF}

  f := True;
  while f do begin
    f := False;

    for i := 0 to AList.Count - 2 do
      if Integer(AList.Objects[i]) > Integer(AList.Objects[i + 1]) then begin
        f := True;
        AList.Exchange(i, i + 1);
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('ssFun', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  {$IFDEF UDEBUG}
  //debugUnregisterUnit(DEBUG_unit_ID);
  {$ENDIF}

end.
