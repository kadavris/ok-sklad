unit ssDateUtils;

interface

uses SysUtils;

function ssDateToStr(ADate: TDateTime): string;
function ssHourToStr(AHour: Integer): string;
function ssMinToStr(AMin: Integer): string;
function ssTimeToStr(ASec: Integer): string;

function LastSecondInDay(d: TDateTime): TDateTime;
function LastSecondInDayStr: string;

implementation

uses
  {$IFNDEF PKG}prFun, prConst, {$ENDIF}
  DateUtils, ssStrUtil;

{$IFDEF PKG} // STUB
function rs(a,b:string; c:integer=0): string; begin Result := 'stub'; end;
{$ENDIF}

//==============================================================================================
function ssDateToStr(ADate: TDateTime): string;
  var d, m, y: word;
begin
  DecodeDate(ADate, y, m, d);
  Result := IntToStr(d) + ' ' + rs('Period', 'monthpp' + intToStr(m)) + ' ' + IntToStr(y)
     //+ ' ' + rs('Period', 'YearR') + '.'
     ;
end;

//==============================================================================================
function ssHourToStr(AHour: Integer): string;
begin
  Result := IntToStr(AHour) + ' ' + DeclineWordList(Ahour, rs('Period', 'timeHourDeclensions'));
end;

//==============================================================================================
function ssMinToStr(AMin: Integer): string;
begin
  Result := IntToStr(AMin) + ' ' + DeclineWordList(AMin, rs('Period', 'timeMinDeclensions'));
end;

//==============================================================================================
function ssTimeToStr(ASec: Integer): string;
  var FInt: Integer;
begin
  Result := '';
  if ASec < 60 then Result := rs('Period', 'timeLessMin')
  else begin
    FInt := ASec div 3600;
    if FInt > 0 then Result := ssHourToStr(FInt) + ' ';

    FInt := (ASec mod 3600) div 60;
    if FInt > 0 then Result := Result + ssMinToStr(FInt);
  end;
end;

//==============================================================================================
function LastSecondInDay(d: TDateTime): TDateTime;
begin
  Result := DateOf(d) + StrToTime('23' + TimeSeparator + '59' + TimeSeparator + '59');
end;

//==============================================================================================
function LastSecondInDayStr: string;
begin
  Result := '23' + TimeSeparator + '59' + TimeSeparator + '59';
end;

end.
