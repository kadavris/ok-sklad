unit xStrUtils;

interface

uses Classes, SysUtils;

type
  TCharSet = set of AnsiChar;

function DelChars(const S: AnsiString; C: AnsiChar): AnsiString;
function DelCharsEx(const S: AnsiString; Chars: TCharSet): AnsiString;
function WordCount(const S: AnsiString; const WordDelims: TSysCharSet): Integer;
function ExtractWord(N: Integer; const S: AnsiString; const WordDelims: TSysCharSet): AnsiString;
procedure StrToList(const S: AnsiString; AList: TStringList; const WordDelims: TSysCharSet);
function ListToStr(AList: TStringList; const Delim: AnsiChar): AnsiString;
function ReplaceStr(const S, Srch, Replace: AnsiString): AnsiString;
function StreamToHexStr(AStream: TStream): AnsiString;
procedure HexStrToStream(AStream: TStream; AStr: AnsiString);
function HexToDec(AHex: AnsiString): Byte;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses Math;

//==============================================================================================
function DelCharsEx(const S: AnsiString; Chars: TCharSet): AnsiString;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to Length(S) do
    if not (S[i] in Chars) then Result := Result + S[i];
end;

//==============================================================================================
function HexToDec(AHex: AnsiString): Byte;
var
  i: Integer;
  b: Byte;
begin
  Result := 0;
  for i := 1 downto 0 do begin
    case AHex[i + 1] of
      'A': b := 10;
      'B': b := 11;
      'C': b := 12;
      'D': b := 13;
      'E': b := 14;
      'F': b := 15
     else b := StrToInt(AHex[i + 1]);
    end;
    Result := Result + Trunc(b*IntPower(16, 1 - i));
  end;
end;

//==============================================================================================
procedure HexStrToStream(AStream: TStream; AStr: AnsiString);
var
  i, j: Integer;
  b: Byte;
begin
  with AStream do begin
    Size := Length(AStr) div 2;
    j := 1;
    Position := 0;
    for i := 1 to Length(AStr) div 2 do begin
      b := HexToDec(AStr[j] + AStr[j + 1]);
      Write(b, 1);
      inc(j, 2);
    end;
  end;
end;

//==============================================================================================
function StreamToHexStr(AStream: TStream): AnsiString;
var
  i: Integer;
  b: Byte;
begin
  Result := EmptyStr;
  with AStream do begin
    Seek(0, soFromBeginning);
    for i := 1 to Size do begin
      Read(b, 1);
      Result := Result + IntToHex(b, 2);
    end;
  end;
end;

//==============================================================================================
function ReplaceStr(const S, Srch, Replace: AnsiString): AnsiString;
var
  I: Integer;
  Source: AnsiString;
begin
  Source := S;
  Result := '';
  repeat
    I := Pos(Srch, Source);
    if I > 0 then begin
      Result := Result + Copy(Source, 1, I - 1) + Replace;
      Source := Copy(Source, I + Length(Srch), MaxInt);
    end
    else Result := Result + Source;
  until I <= 0;
end;

//==============================================================================================
function DelChars(const S: AnsiString; C: AnsiChar): AnsiString;
var i: integer;
begin
  Result := '';
  for i := 1 to Length(S) do
   if S[i]<>C then Result := Result+S[i];
end;

//==============================================================================================
function WordCount(const S: AnsiString; const WordDelims: TSysCharSet): Integer;
var
  i: integer;
begin
  Result := 1;
  for i := 1 to Length(S) do
   if S[i] in WordDelims then inc(Result);
end;

//==============================================================================================
function ExtractWord(N: Integer; const S: AnsiString; const WordDelims: TSysCharSet): AnsiString;
var
  i, wpos: Integer;
begin
  Result := '';
  WPos := 1;
  for i := 1 to Length(S) do
   if S[i] in WordDelims then begin
    if WPos=N then Exit;
    inc(WPos);
    Result := '';
   end
   else Result := Result+S[i];
end;

//==============================================================================================
procedure StrToList(const S: AnsiString; AList: TStringList; const WordDelims: TSysCharSet);
var
  i: integer;
begin
  with AList do begin
   Clear;
   for i := 1 to WordCount(S, WordDelims) do
    AList.Add(ExtractWord(i, S, WordDelims));
  end;
end;

//==============================================================================================
function ListToStr(AList: TStringList; const Delim: AnsiChar): AnsiString;
var
  i: integer;
begin
  Result := '';
  for i := 0 to AList.Count-1 do
   Result := Result+AList[i]+Delim;
  if Result<>'' then System.Delete(Result, Length(Result), 1);
end;

end.
