unit xNumInWords_ENG;

interface
function NumInWords_ENG(number: Int64): String;


implementation

uses {xLngDefs, xLngManager,} SysUtils;

const
  smalls: array [0..19] of String = (
    'zero ',
    'one ',
    'two ',
    'three ',
    'four ',
    'five ',
    'six ',
    'seven ',
    'eight ',
    'nine ',
    'ten ',
    'eleven ',
    'twelve ',
    'thirteen ',
    'fourteen ',
    'fifteen ',
    'sixteen ',
    'seventeen ',
    'eighteen ',
    'nineteen '
  );

  maxstop = 4;
  stopsn: array [1..maxstop] of int64 = (1000000000, 1000000, 1000, 100);
  stopss: array [1..maxstop] of String = ('trillion', 'million', 'thousand', 'hundred');

//==============================================================================================
function niwRS(n: int64; s,r: string; sp:integer): String;
begin
  {
  if n > 1
    then Result := rs(s, r + 'm' + niwGenderChars[gender], sp)
    else Result := rs(s, r + 's' + niwGenderChars[gender], sp);
  }
end;

//==============================================================================================
function niwHundreds(number: Int64): String;
begin
//  Result := NumInWords_ENG(number, gender) + rs(rs_lang, 'hundred' + IntToStr(number), 2);
end;

//==============================================================================================
function niwTens(number: Int64): String;
begin
  case number of
    2:  Result := 'twenty ';
    3:  Result := 'thirty ';
    4:  Result := 'fourty ';
    5:  Result := 'fifty ';
    6:  Result := 'sixty ';
    7:  Result := 'seventy ';
    8:  Result := 'eighty ';
    9:  Result := 'ninety ';
  end;
end;

//==============================================================================================
function suff(n: int64): String;
begin
  if n = 1
    then Result := ' '
    else Result := 's ';
end;

//==============================================================================================
function NumInWords_ENG(number: Int64): String;
  var i: Integer; n: Int64;
begin
  if number = 0 then begin
    Result := 'zero ';
    Exit;
  end;

  Result := '';

  i := 0;
  while (number > 0) and (i <= maxstop) do begin
    inc(i);
    if number >= stopsn[i] then begin
      n := number div stopsn[i];
      Result := Result + NumInwords_ENG(n) + stopss[i] + suff(n);
      number := number - n * stopsn[i];
    end;
  end;

  if number >= 20 then begin
    n := number div 10;
    Result := Result + niwTens(n);
    number := number - n * 10;
  end;

  if number > 0 then Result := Result + smalls[number];
end;

end.

