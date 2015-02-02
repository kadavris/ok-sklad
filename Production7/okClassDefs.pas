unit okClassDefs;

interface

implementation
  var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';



uses prConst;

initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('okClassDefs', @Debugging, DEBUG_group_ID);{$ENDIF}

  



finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
