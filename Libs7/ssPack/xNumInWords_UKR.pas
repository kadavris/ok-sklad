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
    1:  if gender <> genderFemale then Result := Result + '���� ' else Result := Result + '���� ';
    2:  if gender <> genderFemale then Result := Result + '��� ' else Result := Result + '�� ';
    3:  Result := Result + '��� ';
    4:  Result := Result + '������ ';
    5:  Result := Result + '�'+char(39)+'��� ';
    6:  Result := Result + '����� ';
    7:  Result := Result + '�� ';
    8:  Result := Result + '��� ';
    9:  Result := Result + '���' + char(39) + '��� ';
    10: Result := Result + '������ ';
    11: Result := Result + '���������� ';
    12: Result := Result + '���������� ';
    13: Result := Result + '���������� ';
    14: Result := Result + '������������ ';
    15: Result := Result + '�' + char(39) + '��������� ';
    16: Result := Result + '����������� ';
    17: Result := Result + '��������� ';
    18: Result := Result + '���������� ';
    19: Result := Result + '���' + char(39) + '��������� ';
  end
end;

//========================================================
function Num10(Value: byte): String;
begin
  case Value of
    2: Result := Result + '�������� ';
    3: Result := Result + '�������� ';
    4: Result := Result + '����� ';
    5: Result := Result + '�' + char(39) + '������� ';
    6: Result := Result + '��������� ';
    7: Result := Result + '������� ';
    8: Result := Result + '�������� ';
    9: Result := Result + '���' + char(39) + '������ ';
  end;
end;

//========================================================
function Num100(Value: byte): String;
begin
  case Value of
    1: Result := Result + '��� ';
    2: Result := Result + '���� ';
    3: Result := Result + '������ ';
    4: Result := Result + '��������� ';
    5: Result := Result + '�' + char(39) + '����� ';
    6: Result := Result + '������� ';
    7: Result := Result + '����� ';
    8: Result := Result + '������ ';
    9: Result := Result + '���' + char(39) + '����� ';
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
  then Result := '���� '
  else begin
    Result := '';
    gender := genderNone;

    NumMult(1000000000000, '�������� ', '��������� ', '��������� ');
    NumMult(1000000000, '������ ', '������� ', '������� ');
    NumMult(1000000, '������ ', '������� ', '������� ');

    gender := inGender;
    NumMult(1000, '������ ', '������ ', '����� ');
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

