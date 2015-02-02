unit xNumInWords_UKR;

interface

uses
  xLngDefs;

  function numInWords_UKR(Value: int64; inGender: TGender; inpadezh: Tpadezh): string;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  SysUtils, prFun;

var
   gender: TGender;
   ValueTemp: int64;

//========================================================
function Num(Value: byte): String;
begin
  Result := '';

  case Value of
    1:  if gender <> genderFemale then Result := Result + 'один ' else Result := Result + 'одна ';
    2:  if gender <> genderFemale then Result := Result + 'два ' else Result := Result + 'дв≥ ';
    3:  Result := Result + 'три ';
    4:  Result := Result + 'чотири ';
    5:  Result := Result + 'п'+char(39)+'€ть ';
    6:  Result := Result + 'ш≥сть ';
    7:  Result := Result + 'с≥м ';
    8:  Result := Result + 'в≥с≥м ';
    9:  Result := Result + 'дев' + char(39) + '€ть ';
    10: Result := Result + 'дес€ть ';
    11: Result := Result + 'одинадц€ть ';
    12: Result := Result + 'дванадц€ть ';
    13: Result := Result + 'тринадц€ть ';
    14: Result := Result + 'чотирнадц€ть ';
    15: Result := Result + 'п' + char(39) + '€тнадц€ть ';
    16: Result := Result + 'ш≥стнадц€ть ';
    17: Result := Result + 'с≥мнадц€ть ';
    18: Result := Result + 'в≥с≥мнадц€ть ';
    19: Result := Result + 'дев' + char(39) + '€тнадц€ть ';
  end
end;

//========================================================
function Num10(Value: byte): String;
begin
  case Value of
    2: Result := Result + 'двадц€ть ';
    3: Result := Result + 'тридц€ть ';
    4: Result := Result + 'сорок ';
    5: Result := Result + 'п' + char(39) + '€тдес€т ';
    6: Result := Result + 'ш≥стдес€т ';
    7: Result := Result + 'с≥мдес€т ';
    8: Result := Result + 'в≥с≥мдес€т ';
    9: Result := Result + 'дев' + char(39) + '€носто ';
  end;
end;

//========================================================
function Num100(Value: byte): String;
begin
  case Value of
    1: Result := Result + 'сто ';
    2: Result := Result + 'дв≥ст≥ ';
    3: Result := Result + 'триста ';
    4: Result := Result + 'чотириста ';
    5: Result := Result + 'п' + char(39) + '€тсот ';
    6: Result := Result + 'ш≥стсот ';
    7: Result := Result + 'с≥мсот ';
    8: Result := Result + 'в≥с≥мсот ';
    9: Result := Result + 'дев' + char(39) + '€тсот ';
  end
end;

//========================================================
function Num00:String;
begin
  Result := Num100(ValueTemp div 100);

  ValueTemp := ValueTemp mod 100;

  if ValueTemp < 20
    then Result := Result + Num(ValueTemp)
    else begin
       Result := Result + Num10(ValueTemp div 10);
       ValueTemp := ValueTemp mod 10;
       Result := Result + Num(ValueTemp);
     end;
end;

//========================================================
function NumMult(Mult: int64; s1,s2,s3: string): String;
begin
end;

//==============================================================================================
function _NumInWords_UKR(Value: int64; inGender: Tgender; padezh: Tpadezh): string;
Begin
  if Value = 0
  then Result := 'нуль '
  else begin
    Result := '';
    gender := genderNone;

    NumMult(1000000000000, 'трильйон ', 'трильйона ', 'трильйон≥в ');
    NumMult(1000000000, 'м≥ль€рд ', 'м≥ль€рда ', 'м≥ль€рд≥в ');
    NumMult(1000000, 'м≥льйон ', 'м≥льйона ', 'м≥льйон≥в ');

    gender := inGender;
    NumMult(1000, 'тис€ча ', 'тис€ч≥ ', 'тис€ч ');
    ValueTemp := Value;
    Num00;
  end;

  Result := AnsiUpperCase(Result[1]) + Copy(Result, 2, Length(Result) - 1);
end;

// STUB !!!!
//==============================================================================================
function numInWords_UKR(Value: int64; inGender: TGender; inpadezh: Tpadezh): string;
begin
  Result := PropisUKR(Value, (inGender = genderNone));
end;

end.

