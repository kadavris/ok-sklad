unit okSkladClassDefs;

interface

implementation

uses 
  prConst, CCMain, Login, Main, Udebug;

var 
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('okSkladClassDefs', @Debugging, DEBUG_group_ID);
  {$ENDIF}

  TfrmCCMainClass := TfrmCCMain;
  TokLoginClass := TfrmLogin;
  TokMainClass := TfrmMain;


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
