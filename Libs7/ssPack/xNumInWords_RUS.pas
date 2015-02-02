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
              GenderMale: Result := Result + '���� ';
              GenderFemale: Result := Result + '���� ';
              else Result := Result + '���� ';
            end;
         2: if gender <> GenderFemale then Result := Result + '��� ' else Result := Result + '��� ';
         3: Result := Result + '��� ';
         4: Result := Result + '������ ';
         5: Result := Result + '���� ';
         6: Result := Result + '����� ';
         7: Result := Result + '���� ';
         8: Result := Result + '������ ';
         9: Result := Result + '������ ';
        10: Result := Result + '������ ';
        11: Result := Result + '����������� ';
        12: Result := Result + '���������� ';
        13: Result := Result + '���������� ';
        14: Result := Result + '������������ ';
        15: Result := Result + '���������� ';
        16: Result := Result + '����������� ';
        17: Result := Result + '���������� ';
        18: Result := Result + '������������ ';
        19: Result := Result + '������������ ';
     end //case
   end // padezhIE,IM

   else // all other padezhs now here ;)
     case Value of
        1: if gender = genderMale then Result := Result + '����� '
           else if gender = genderFemale then Result := Result + '����� '
           else Result := Result + '����� ';
        2: if gender in [genderMale, genderNone] then Result := Result + '���� ' else Result := Result + '���� ';
        3: Result := Result + '��� ';
        4: Result := Result + '������ ';
        5: Result := Result + '���� ';
        6: Result := Result + '����� ';
        7: Result := Result + '���� ';
        8: Result := Result + '������ ';
        9: Result := Result + '������ ';
       10: Result := Result + '������ ';
       11: Result := Result + '����������� ';
       12: Result := Result + '���������� ';
       13: Result := Result + '���������� ';
       14: Result := Result + '������������ ';
       15: Result := Result + '���������� ';
       16: Result := Result + '����������� ';
       17: Result := Result + '���������� ';
       18: Result := Result + '������������ ';
       19: Result := Result + '������������ ';
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
        2: Result := Result + '�������� ';
        3: Result := Result + '�������� ';
        4: Result := Result + '����� ';
        5: Result := Result + '��������� ';
        6: Result := Result + '���������� ';
        7: Result := Result + '��������� ';
        8: Result := Result + '����������� ';
        9: Result := Result + '��������� ';
      end;  //case Value
    end //     padezhIE, padezhIM: begin

    else
      case Value of
        2: Result := Result + '�������� ';
        3: Result := Result + '�������� ';
        4: Result := Result + '������ ';
        5: Result := Result + '���������� ';
        6: Result := Result + '����������� ';
        7: Result := Result + '���������� ';
        8: Result := Result + '������������ ';
        9: Result := Result + '��������� ';
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
        1: Result := Result + '��� ';
        2: Result := Result + '������ ';
        3: Result := Result + '������ ';
        4: Result := Result + '��������� ';
        5: Result := Result + '������� ';
        6: Result := Result + '�������� ';
        7: Result := Result + '������� ';
        8: Result := Result + '��������� ';
        9: Result := Result + '��������� ';
      end;  //case Value
    end //     padezhIE, padezhIM: begin

    else
      case Value of
        1: Result := Result + '��� ';
        2: Result := Result + '������� ';
        3: Result := Result + '������ ';
        4: Result := Result + '��������� ';
        5: Result := Result + '������� ';
        6: Result := Result + '�������� ';
        7: Result := Result + '������� ';
        8: Result := Result + '��������� ';
        9: Result := Result + '��������� ';
      end; // case Value
  end; // case padezh
end;

//==============================================================================================
function _numInWords_RUS(Value: int64; inGender: Tgender; inpadezh: Tpadezh): string;
Begin
   padezh := inpadezh;

   if Value = 0
   then Result := '���� '
   else begin
     Result := '';
     gender := genderNone;
     {
     case padezh of
       padezhIE, padezhIM: begin
         Result := Result + NumMult(1000000000000,'�������� ','��������� ','���������� ');
         Result := Result + NumMult(1000000000,'�������� ','��������� ','���������� ');
         Result := Result + NumMult(1000000,'������� ','�������� ','��������� ');
         gender := inGender;
         Result := Result + NumMult(1000, '������ ','������ ','����� ');
       end
       else begin // all other padezhs now here ;)
         Result := Result + NumMult(1000000000000,'���������� ','���������� ','���������� ');
         Result := Result + NumMult(1000000000,'���������� ','���������� ','���������� ');
         Result := Result + NumMult(1000000,'��������� ','��������� ','��������� ');
         gender := inGender;
         Result := Result + NumMult(1000, '������� ','������� ','������� ');
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

