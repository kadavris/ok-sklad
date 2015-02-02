unit ssStrUtil;

interface

uses
  SysUtils, Forms, Classes, Types, Math;

type
  TCharset = set of Char;

  function  addLine(s: string; crp: Integer = 0): string;
  function  addNonEmptyLine(lbl, txt: string; crp: Integer = 0): string;
  function  addspaces(s: String; lead,tail: Integer): String;
  function  AnsiUpperCaseEx(const S: String): String;
  {$IFDEF VER150}function  CharInSet(c: AnsiChar; s: TCharSet): Boolean;{$ENDIF}
  function  compareVersionNumbers(v1,v2: String): integer;
  {$IFNDEF PKG}function DeclineWord(Count: Int64; const Single, pluralOV, pluralA: String): String;{$ENDIF}
  function  DeclineWordList(Count: Integer; const declensions: String): String;
  function  DelChars(const S: String; Chrs: TCharset): String;
  function  ExtractWord(N: Integer; const S: String; const WordDelims: TSysCharSet): String;
  function  FindPart(const HelpWilds, InputStr: String): Integer;
  function  IsWild(InputStr, Wilds: String; IgnoreCase: Boolean): Boolean;
  function  PadLeft(s: string; sp: Integer): string; overload;
  function  PadLeft(sl: TStringList; sp: Integer): string; overload;
  function  PosEx_(const SubStr, S: String; Offset: Cardinal = 1): Integer;
  function  ReplaceStr(const S, Srch, Replace: String): String;
  function  ssStrToFloat(inStr: String; defaultValue: Extended = NaN): Extended; // kills non-number chars beforehand. dieOnError=True for exception raising
  function  WordCount(const S: String; const WordDelims: TSysCharSet): Integer;
  function  WordPosition(const N: Integer; const S: String; const WordDelims: TSysCharSet): Integer;
  function  WordPositionEx(const SS, S: String; const WordDelims: TSysCharSet): Integer;
  function  XorDecode(const Key, Source: String): String;
  function  XorEncode(const Key, Source: String): String;
  // parses input String into array of strings
  procedure ExtractWords(const S: String; const WordDelims: TSysCharSet; out wlist: TStringDynArray; skipEmpty: Boolean = False);
  procedure parseVersionNumber(const v: String; var vp: TIntegerDynArray);

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  Controls, xLngDefs, StrUtils;

//==============================================================================================
function  addLine(s: string; crp: Integer = 0): string;
begin
  Result := ifThen( (crp and 2) = 2, #13#10, '');
  if s <> '' then Result := Result + s;
  if (crp and 1) = 1 then Result := Result + #13#10;
end;

//==============================================================================================
function  addNonEmptyLine(lbl, txt: string; crp: Integer = 0): string;
begin
  if Trim(txt) <> '' then Result := addLine(lbl + txt, crp);
end;

//==============================================================================================
{$IFDEF VER150}
function CharInSet(c: AnsiChar; s: TCharSet): Boolean;
begin
  Result := c in s;
end;
{$ENDIF}

//==============================================================================================
function  PadLeft(s: string; sp: Integer): string;
  var
    rs: String;
begin
  rs := StringOfChar(' ', sp);
  Result := rs + AnsiReplaceStr(s, #13#10, #13#10 + rs);
  if AnsiEndsStr(#13#10 + rs, s) then setlength(s, length(s) - sp); // trim spaces past the last crlf 
end;

//==============================================================================================
function  PadLeft(sl: TStringList; sp: Integer): string;
  var i: Integer;
begin
  Result := '';
  for i := 0 to sl.Count - 1 do Result := Result + PadLeft(sl[i], sp) + #13#10;
end;

//==============================================================================================
function PosEx_(const SubStr, S: String; Offset: Cardinal = 1): Integer;
  var
    I,X: Integer;
    Len, LenSubStr: Integer;
begin
  if False{Offset = 1}
  then Result := Pos(SubStr, S)
  else begin
    I := Offset;
    LenSubStr := Length(SubStr);
    Len := Length(S) - LenSubStr + 1;

    while I <= Len do begin
      if AnsiUpperCase(S[I]) = AnsiUpperCase(SubStr[1]) then begin
        X := 1;

        while (X < LenSubStr) and (AnsiUpperCase(S[I + X]) = AnsiUpperCase(SubStr[X + 1])) do Inc(X);

        if (X = LenSubStr) then begin
          Result := I;
          Exit;
        end;
      end;

      Inc(I);
    end;

    Result := 0;
  end;
end;

//==============================================================================================
function WordPositionEx(const SS, S: String; const WordDelims: TSysCharSet): Integer;
  var
    i: Integer;
begin
  Result := -1;

  for i := 1 to WordCount(S, WordDelims) do
    if Trim(ExtractWord(i, S, WordDelims)) = SS then begin
      Result := i;
      Exit;
    end;
end;

{$IFNDEF PKG}
//==============================================================================================
function DeclineWord(Count: Int64; const Single, pluralOV, pluralA: String): String;
  var
    Remainder: Integer;
begin
  Result := '';
  if (Count > 10) and (Count < 20)
    then Remainder := Count
    else Remainder := Count mod 10;

  case LangID of
    lidRUS,
    lidUKR:
      begin
        case Remainder of
          0, 5..9, 11..19: Result := Single + pluralOV;
          1: Result := Single;
          2..4: Result := Single + pluralA;
        end;
      end;

    lidENG:
      begin
        if Count = 1
          then Result := Single
          else Result := Single + 's';
      end

    else begin
      raise Exception.Create('DeclineWord: language conversion is undefined for lang: ' + LangNames[langID]);
    end
  end; //case langID
end;
{$ENDIF}

//==============================================================================================
function DeclineWordList(Count: Integer; const declensions: String): String;
begin
  if (Count > 9) and (Count < 20)
    then Result := ExtractWord(11, declensions, [','])
    else Result := ExtractWord(Count mod 10, declensions, [',']);
end;

//==============================================================================================
function AnsiUpperCaseEx(const S: String): String;
  var i: Integer;
begin
  Result := '';

  for i := 1 to Length(S) do
    if CharInSet(S[i], ['і', 'є', 'ї'])
      then Result := Result + S[i]
      else Result := Result + AnsiUpperCase(S[i]);
end;

//==============================================================================================
function DelChars(const S: String; Chrs: TCharset): String;
  var I: Integer;
begin
  Result := S;

  for I := Length(Result) downto 1 do
    if CharInSet(Result[I], Chrs) then Delete(Result, I, 1);
end;

//==============================================================================================
function XorDecode(const Key, Source: String): String;
  var
    I: Integer;
    C: Char;
begin
  Result := '';
  for I := 0 to Length(Source) div 2 - 1 do begin
    C := Chr(StrToIntDef('$' + Copy(Source, (I * 2) + 1, 2), Ord(' ')));

    if Length(Key) > 0 then C := Chr(Byte(Key[1 + (I mod Length(Key))]) xor Byte(C));

    Result := Result + C;
  end;
end;

//==============================================================================================
function XorEncode(const Key, Source: String): String;
  var
    I: Integer;
    C: Byte;
begin
  Result := '';
  for I := 1 to Length(Source) do begin

    if Length(Key) > 0
      then C := Byte(Key[1 + ((I - 1) mod Length(Key))]) xor Byte(Source[I])
      else C := Byte(Source[I]);

    Result := Result + AnsiLowerCase(IntToHex(C, 2));
  end;
end;

//==============================================================================================
function WordCount(const S: String; const WordDelims: TSysCharSet): Integer;
  var
    SLen, I: Cardinal;
begin
  Result := 0;
  I := 1;
  SLen := Length(S);

  while I <= SLen do begin
    while (I <= SLen) and CharInSet(S[I], WordDelims) do Inc(I);

    if I <= SLen then Inc(Result);

    while (I <= SLen) and not CharInSet(S[I], WordDelims) do Inc(I);
  end;
end;

//==============================================================================================
function FindPart(const HelpWilds, InputStr: String): Integer;
  var
    I, J: Integer;
    Diff: Integer;
begin
  I := Pos('?', HelpWilds);

  if I = 0 then begin // if no '?' in HelpWilds
    Result := Pos(HelpWilds, InputStr);
    Exit;
  end;

  // '?' in HelpWilds
  Diff := Length(InputStr) - Length(HelpWilds);
  if Diff < 0 then begin
    Result := 0;
    Exit;
  end;

  // now move HelpWilds over InputStr
  for I := 0 to Diff do begin
    for J := 1 to Length(HelpWilds) do begin
      if (InputStr[I + J] = HelpWilds[J]) or (HelpWilds[J] = '?')
      then begin
        if J = Length(HelpWilds) then begin
          Result := I + 1;
          Exit;
        end;
      end
      else Break;
    end;
  end;

  Result := 0;
end;

//==============================================================================================
function IsWild(InputStr, Wilds: String; IgnoreCase: Boolean): Boolean;
  var
    CWild, CInputWord: Integer; { counter for positions }
    I, LenHelpWilds: Integer;
    MaxInputWord, MaxWilds: Integer; { Length of InputStr and Wilds }
    HelpWilds: String;


  function SearchNext(var Wilds: String): Integer; // looking for next *, returns position and String until position
  begin
    Result := Pos('*', Wilds);
    if Result > 0 then Wilds := Copy(Wilds, 1, Result - 1);
  end;

begin
  if Wilds = InputStr then begin
    Result := True;
    Exit;
  end;

  repeat // delete '**', because '**' = '*'
    I := Pos('**', Wilds);
    if I > 0 then Wilds := Copy(Wilds, 1, I - 1) + '*' + Copy(Wilds, I + 2, MaxInt);
  until I = 0;

  if Wilds = '*' then begin { for fast end, if Wilds only '*' }
    Result := True;
    Exit;
  end;

  MaxInputWord := Length(InputStr);
  MaxWilds := Length(Wilds);
  if IgnoreCase then begin { upcase all letters }
    InputStr := AnsiUpperCase(InputStr);
    Wilds := AnsiUpperCase(Wilds);
  end;

  if (MaxWilds = 0) or (MaxInputWord = 0) then begin
    Result := False;
    Exit;
  end;

  CInputWord := 1;
  CWild := 1;
  Result := True;
  repeat
    if InputStr[CInputWord] = Wilds[CWild] then begin { equal letters }
      { goto next letter }
      Inc(CWild);
      Inc(CInputWord);
      Continue;
    end;

    if Wilds[CWild] = '?' then begin { equal to '?' }
      { goto next letter }
      Inc(CWild);
      Inc(CInputWord);
      Continue;
    end;

    if Wilds[CWild] = '*' then begin { handling of '*' }
      HelpWilds := Copy(Wilds, CWild + 1, MaxWilds);
      I := SearchNext(HelpWilds);
      LenHelpWilds := Length(HelpWilds);
      if I = 0 then begin
        { no '*' in the rest, compare the ends }
        if HelpWilds = '' then Exit; { '*' is the last letter }
        { check the rest for equal Length and no '?' }
        for I := 0 to LenHelpWilds - 1 do begin
          if (HelpWilds[LenHelpWilds - I] <> InputStr[MaxInputWord - I]) and
            (HelpWilds[LenHelpWilds - I]<> '?') then
          begin
            Result := False;
            Exit;
          end;
        end;
        Exit;
      end;
      { handle all to the next '*' }
      Inc(CWild, 1 + LenHelpWilds);
      I := FindPart(HelpWilds, Copy(InputStr, CInputWord, MaxInt));
      if I= 0 then begin
        Result := False;
        Exit;
      end;
      CInputWord := I + LenHelpWilds;
      Continue;
    end;
    Result := False;
    Exit;
  until (CInputWord > MaxInputWord) or (CWild > MaxWilds);
  { no completed evaluation }
  if CInputWord <= MaxInputWord then Result := False;
  if (CWild <= MaxWilds) and (Wilds[MaxWilds] <> '*') then Result := False;
end;

//==============================================================================================
function ReplaceStr(const S, Srch, Replace: String): String;
  var
    I: Integer;
    Source: String;
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
function WordPosition(const N: Integer; const S: String; const WordDelims: TSysCharSet): Integer;
  var
    Count, I: Integer;
begin
  Count := 0;
  I := 1;
  Result := 0;
  while (I <= Length(S)) and (Count <> N) do begin
    { skip over delimiters }
    while (I <= Length(S)) and CharInSet(S[I], WordDelims) do Inc(I);
    { if we're not beyond end of S, we're at the start of a word }
    if I <= Length(S) then Inc(Count);
    { if not finished, find the end of the current word }
    if Count <> N then
      while (I <= Length(S)) and not CharInSet(S[I], WordDelims) do Inc(I)
    else Result := I;
  end;
end;

//==============================================================================================
function ExtractWord(N: Integer; const S: String; const WordDelims: TSysCharSet): String;
  var
    start,I,slen: Integer;
begin
  Result := '';
  slen := Length(S);
  start := WordPosition(N, S, WordDelims);

  if start <> 0 then begin
    i := start + 1;
    while (I <= slen) and not(CharInSet(S[I], WordDelims)) do inc(i);
    Result := AnsiMidStr(s, start, i - start);
  end;
end;

//==============================================================================================
// parses input String into array of strings
procedure ExtractWords(const S: String; const WordDelims: TSysCharSet; out wlist: TStringDynArray; skipEmpty: Boolean = False);
  var
    I,currword,slen,start: Integer;
begin
  if s = '' then Exit;
  slen := length(s) + 1; // to make last char counted
  currword := -1; // current word index in wlist
  start := 1; // current word begin pos

  for i := 1 to slen do
    if (i = slen) or (CharInSet(s[i], WordDelims)) then begin // adding new word
      if not skipEmpty or (skipEmpty and (i > start)) then begin
        inc(currword);
        if High(wlist) < currword then setLength(wlist, currword + 1);
        wlist[currword] := '';

        if i > start then wlist[currword] := AnsiMidStr(s, start, i - start);

        start := i + 1;
      end;

      if i = slen then Exit;

    end;
end;

//==============================================================================================
function addspaces(s: String; lead,tail: Integer): String;
begin
  Result := StringOfChar(' ',lead) + s + StringOfChar(' ',tail);
end;

//==============================================================================================
procedure parseVersionNumber(const v: String; var vp: TIntegerDynArray);
 var
   i: Integer;
   strarr: TStringDynArray;
begin
  ExtractWords(v, ['.', '/', ' ', '_', '-'], strarr);
  if High(strarr) > 3 then SetLength(strarr, 4);
  SetLength(vp,4);

  for i := 0 to 3 do
    if i > High(strarr)
      then vp[i] := 0
      else
        try
          vp[i] := StrToInt(strarr[i]);

        except
          if i = 0
            then vp[i] := -1
            else vp[i] := 0;
        end;
end;

//==============================================================================================
// NOTE! this func used also in comparing file names
function compareVersionNumbers(v1,v2: String): integer;
 var
   i: Integer;
   av1, av2: TIntegerDynArray;
begin
  parseVersionNumber(v1, av1);
  parseVersionNumber(v2, av2);

  Result := 0;

  for i := 0 to 3 do begin
    if av1[i] < av2[i]
      then begin Result := -1; Break; end
      else if av1[i] > av2[i] then begin Result := 1; Break; end;
  end;
//writeln('!D: compareVer: ' + v1 + '(' + IntToStr(av1[0]) + '.' + IntToStr(av1[1]) + '.' + IntToStr(av1[2]) + '.' + IntToStr(av1[3]) + ') <=> ' + v2 + '(' + IntToStr(av2[0]) + '.' + IntToStr(av2[1]) + '.' + IntToStr(av2[2]) + '.' + IntToStr(av2[3]) + ') = ' + IntTostr(Result));
end;

//==============================================================================================
// kills non-number chars beforehand
// Посвящается Мудакам, которые обрабатывают данные не из оригинального датасета, а из ячейки таблицы с пририсованной хуйнёй по бокам.
function ssStrToFloat(inStr: String; defaultValue: Extended = NaN): Extended;
  const errMsg: String = 'ssStrToFloat: crappy input: ';

  var
    i,l: Integer;
    hasDP, hasDigits: Boolean;
    s: String;
begin
  Result := defaultValue;

  l := length(inStr);
  i := 1;

  while (i <= l) and not (CharInSet(inStr[i], ['0'..'9', '+', '-'])) do inc(i); // skipping head garbage

  if i > l
    then if isNaN(defaultValue)
         then raise Exception.Create(errMsg + inStr)
         else Exit;

  if CharInSet(inStr[i], ['+', '-'])
    then begin s := inStr[i]; inc(i); end
    else s := '';

  hasDP := False; // controls garbage decimal point chars
  hasdigits := False; // for number sanity check

  while i <= l do begin
    if CharInSet(inStr[i], [' ', chr($A0)]) then begin // spaces may be used as thousands separator. $a0 is special grid-dy case
      inc(i);
      Continue;
    end
    else if CharInSet(inStr[i], [',', '.']) then begin
      if hasDP  // garbage decimal point
        then if isNaN(defaultValue)
             then raise Exception.Create(errMsg + inStr)
             else Exit;

      hasDP := True;
      s := s + decimalSeparator; // for we'll always be in correct locale
      inc(i);

      Continue;
    end
    else if CharInSet(inStr[i], ['0'..'9']) then hasDigits := True
    else Break; // tail garbage

    s := s + inStr[i];
    inc(i);
  end;

  if hasDigits then
    try
      Result := StrToFloat(s);

    except
      if isNaN(defaultValue) then raise Exception.Create(errMsg + inStr)
    end;
end;

end.

