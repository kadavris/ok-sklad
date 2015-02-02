unit okMoneyFun;

interface

function MoneyToStr(AValue: Extended): string;

//==============================================================================
implementation

uses
  sysutils, prConst, prFun, ssFun, xLngDefs, xNumInWords, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


//==============================================================================================
function MoneyToStr(AValue: Extended): string;
 var
   fr: string;
   FValue: Extended;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'MoneyToStr') else _udebug := nil;{$ENDIF}

  FValue := StrToFloat(FloatToStr(RoundToA(AValue, -2)));
  fr := FloatToStr(100 * RoundToA(Frac(FValue), -2));
  if Length(fr) = 1 then fr := '0' + fr;

  case RepLangID of
    lidRUS: Result := PropisRUS(Trunc(FValue), 0);
    lidUKR: Result := PropisUKR(Trunc(FValue), False);
    lidENG: Result := NumInWords(Trunc(FValue), genderMale);
    lidESP: Result := NumInWords(Trunc(FValue), genderMale);
    else Result := 'no MoneyToStr for lang: ' + langNames[langID];
  end;

  Result := Result + BaseCurrShortName + ' ' + fr + ' ' + BaseCurrFracName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

end.


