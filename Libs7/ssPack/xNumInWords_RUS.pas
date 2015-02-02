unit xNumInWords_RUS;

interface

uses
  xLngDefs;

function numInWords_RUS(Value: int64; inGender: TGender; inpadezh: Tpadezh): string;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  SysUtils, prFun, Math;

var
  gender: Tgender;
  padezh: Tpadezh;
  ValueTemp: int64;

//==============================================================================================
function Num(Value: byte): String;
begin
  Result := '';

  case padezh of
    padezhIE, padezhIM: begin
      case Value of
         1: case gender of
              GenderMale: Result := Result + 'один ';
              GenderFemale: Result := Result + 'одна ';
              else Result := Result + 'одно ';
            end;
         2: if gender <> GenderFemale then Result := Result + 'два ' else Result := Result + 'две ';
         3: Result := Result + 'три ';
         4: Result := Result + 'четыре ';
         5: Result := Result + 'пять ';
         6: Result := Result + 'шесть ';
         7: Result := Result + 'семь ';
         8: Result := Result + 'восемь ';
         9: Result := Result + 'девять ';
        10: Result := Result + 'десять ';
        11: Result := Result + 'одиннадцать ';
        12: Result := Result + 'двенадцать ';
        13: Result := Result + 'тринадцать ';
        14: Result := Result + 'четырнадцать ';
        15: Result := Result + 'пятнадцать ';
        16: Result := Result + 'шестнадцать ';
        17: Result := Result + 'семнадцать ';
        18: Result := Result + 'восемнадцать ';
        19: Result := Result + 'девятнадцать ';
     end //case
   end // padezhIE,IM

   else // all other padezhs now here ;)
     case Value of
        1: if gender = genderMale then Result := Result + 'одном '
           else if gender = genderFemale then Result := Result + 'одной '
           else Result := Result + 'одном ';
        2: if gender in [genderMale, genderNone] then Result := Result + 'двух ' else Result := Result + 'двух ';
        3: Result := Result + 'трёх ';
        4: Result := Result + 'четырёх ';
        5: Result := Result + 'пяти ';
        6: Result := Result + 'шести ';
        7: Result := Result + 'семи ';
        8: Result := Result + 'восьми ';
        9: Result := Result + 'девяти ';
       10: Result := Result + 'десяти ';
       11: Result := Result + 'одиннадцати ';
       12: Result := Result + 'двенадцати ';
       13: Result := Result + 'тринадцати ';
       14: Result := Result + 'четырнадцати ';
       15: Result := Result + 'пятнадцати ';
       16: Result := Result + 'шестнадцати ';
       17: Result := Result + 'семнадцати ';
       18: Result := Result + 'восемнадцати ';
       19: Result := Result + 'девятнадцати ';
     end; // case value
  end; // case padezh
end;

//==============================================================================================
function Num10(Value: byte): String;
begin
  Result := '';
  case padezh of
    padezhIE, padezhIM: begin
      case Value of
        2: Result := Result + 'двадцать ';
        3: Result := Result + 'тридцать ';
        4: Result := Result + 'сорок ';
        5: Result := Result + 'пятьдесят ';
        6: Result := Result + 'шестьдесят ';
        7: Result := Result + 'семьдесят ';
        8: Result := Result + 'восемьдесят ';
        9: Result := Result + 'девяносто ';
      end;  //case Value
    end //     padezhIE, padezhIM: begin

    else
      case Value of
        2: Result := Result + 'двадцати ';
        3: Result := Result + 'тридцати ';
        4: Result := Result + 'сорока ';
        5: Result := Result + 'пятидесяти ';
        6: Result := Result + 'шестидесяти ';
        7: Result := Result + 'семидесяти ';
        8: Result := Result + 'восьмидесяти ';
        9: Result := Result + 'девяноста ';
      end; // case Value
  end; // case padezh
end;

//==============================================================================================
function Num100(Value: byte): String;
begin
  Result := '';

  case padezh of
    padezhIE, padezhIM: begin
      case Value of
        1: Result := Result + 'сто ';
        2: Result := Result + 'двести ';
        3: Result := Result + 'триста ';
        4: Result := Result + 'четыреста ';
        5: Result := Result + 'пятьсот ';
        6: Result := Result + 'шестьсот ';
        7: Result := Result + 'семьсот ';
        8: Result := Result + 'восемьсот ';
        9: Result := Result + 'девятьсот ';
      end;  //case Value
    end //     padezhIE, padezhIM: begin

    else
      case Value of
        1: Result := Result + 'ста ';
        2: Result := Result + 'двухсот ';
        3: Result := Result + 'трёхсот ';
        4: Result := Result + 'четырёхсот ';
        5: Result := Result + 'пятисот ';
        6: Result := Result + 'шестисот ';
        7: Result := Result + 'семисот ';
        8: Result := Result + 'восьмисот ';
        9: Result := Result + 'девятисот ';
      end; // case Value
  end; // case padezh
end;

//==============================================================================================
function _numInWords_RUS(Value: int64; inGender: Tgender; inpadezh: Tpadezh): string;
Begin
   padezh := inpadezh;

   if Value = 0
   then Result := 'ноль '
   else begin
     Result := '';
     gender := genderNone;
     {
     case padezh of
       padezhIE, padezhIM: begin
         Result := Result + NumMult(1000000000000,'триллион ','триллиона ','триллионов ');
         Result := Result + NumMult(1000000000,'миллиард ','миллиарда ','миллиардов ');
         Result := Result + NumMult(1000000,'миллион ','миллиона ','миллионов ');
         gender := inGender;
         Result := Result + NumMult(1000, 'тысяча ','тысячи ','тысяч ');
       end
       else begin // all other padezhs now here ;)
         Result := Result + NumMult(1000000000000,'триллионах ','триллионах ','триллионах ');
         Result := Result + NumMult(1000000000,'миллиардах ','миллиардах ','миллиардах ');
         Result := Result + NumMult(1000000,'миллионах ','миллионах ','миллионах ');
         gender := inGender;
         Result := Result + NumMult(1000, 'тысячах ','тысячах ','тысячах ');
       end;
     end; // case
     }
     gender := inGender;
     ValueTemp := Value;
   end;

   Result := AnsiUpperCase(Result[1]) + Copy(Result, 2, Length(Result) - 1);
end;

// STUB !!!!
//==============================================================================================
function numInWords_RUS(Value: int64; inGender: TGender; inpadezh: Tpadezh): string;
begin
  Result := PropisRus(Value, ifThen(inGender = genderFemale, 1, 0), ((inpadezh <> padezhIE) and (inpadezh <> padezhIE)) );
end;

end.

