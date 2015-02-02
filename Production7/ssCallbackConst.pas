unit ssCallbackConst;

interface

const
  CA_REFRESH     = 1;

  CA_MEASURES    = 1;
  CA_ACCOUNTTYPE = 2;
  CA_WHOUSE      = 3;
  CA_BANKS       = 4;
  CA_MATERIALS   = 5;
  CA_KAGENTS     = 6;
  CA_CURRENCY    = 7;
  CA_WMAT        = 8;
  CA_WBIN        = 9;
  CA_WBOUT       = 9;
  CA_PAYDOCIN    = 10;
  CA_PAYDOCOUT   = 11;
  CA_PRICETYPES  = 12;
  CA_COUNTRIES   = 13;

implementation
  uses Udebug;
  
  var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('ssCallbackConst', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.                                    
