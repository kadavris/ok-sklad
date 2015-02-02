unit udf_math;

interface

uses Windows;

function FormatFloat(var Value : Double; var K : Integer): Double; cdecl; export;
function ValueInStr(S: PChar; var Value: Integer): Integer; cdecl; export;
function Trim(S: PChar): PChar; cdecl; export;

implementation

uses SysUtils;

var
  hThreadLocalVariables: Integer;         (* Index to thread-local storage *)

const
  cSignificantlyLarger = 1024 * 4;
  
type
  TISC_QUAD = record
    gds_quad_high      : Longint;
    gds_quad_low       : Longint;
  end;
  PISC_QUAD = ^TISC_QUAD;
  
  TThreadLocalVariables = class(TObject)
  protected
    FPChar: PChar;
    FPCharSize: Integer;
    FQuad: PISC_QUAD;
  public
    constructor Create;
    destructor Destroy; override;
  end;

function ThreadLocals: TThreadLocalVariables;
begin
  result := TLSGetValue(hThreadLocalVariables);
  if result = nil then begin
    result := TThreadLocalVariables.Create;
    TLSSetValue(hThreadLocalVariables, result);
  end;
end;

function MakeResultString(Source, OptionalDest: PChar; Len: Integer): PChar;
begin
  result := OptionalDest;
  if (Len = 0) then
    Len := StrLen(Source) + 1;
  if (result = nil) then begin
    {$ifdef FREE_IT}
    result := ib_util_malloc(Len);
    {$else}
    with ThreadLocals do begin
      (*
       * If the current PChar is smaller than than Source, or
       * it is significanly larger than Source, then reallocate it
       * in cSignificantlyLarger chunks.
       *)
      if (FPCharSize < Len) or
         (FPCharSize > Len + cSignificantlyLarger) then begin
        FPCharSize := 0;
        (*
         * Realistically, we'll never return strings longer than about
         * 2k, so I'd rather risk spending time in a loop that *adds* than
         * "compute" FPCharSize by performing division and modulo arithmetic.
         * Addition is very fast, and the while loop will in general, only
         * be at most 1 to 2 steps.
         *)
        while (FPCharSize < Len) do
          Inc(FPCharSize, cSignificantlyLarger);
        ReallocMem(FPChar, FPCharSize);
      end;
      result := FPChar;
    end;
    {$endif}
  end;
  if (Source <> result) then begin
    if (Source = nil) or (Len = 1) then
      result[0] := #0
    else
      Move(Source^, result^, Len);
  end;
end;

function Trim(S: PChar): PChar;
begin
  //Result := MakeResultString(PChar(Trim(PAnsiChar(S))), nil, 0);
  //Result := StrPCopy  lstrcat(S, S);
  StrPCopy(Result, SysUtils.Trim(S));
end;

function FormatFloat(var Value : Double; var K : Integer): Double;
var
  ScaledPart, Temp : double;
begin
  ScaledPart:=Value/Exp(K * Ln(10));
  Temp:=Frac(ScaledPart);
  ScaledPart:=Int(ScaledPart);
  if Temp>=0.49999999 then ScaledPart:=ScaledPart+1;
  if Temp<=-0.49999999 then ScaledPart:=ScaledPart-1;
  Result:=StrToFloat(FloatToStr(ScaledPart*Exp(K * Ln(10))));
end;

function ValueInStr(S: PChar; var Value: Integer): Integer;
var
  i: Integer;
  w: string;
begin
  Result := 0;
  w := '';
  for i := 0 to StrLen(S) - 1 do begin
    if S[i] = ',' then begin
      if IntToStr(Value) = w then begin
        Result := 1;
        Exit;
      end
      else w := '';
    end
    else w := w + s[i];
  end;
  if (w <> '') and (IntToStr(Value) = w) then Result := 1;
end;

{ TThreadLocalVariables }

constructor TThreadLocalVariables.Create;
begin
  ReallocMem(FPChar, cSignificantlyLarger);
  FPCharSize := cSignificantlyLarger;
  ReallocMem(FQuad, SizeOf(TISC_QUAD));
end;

destructor TThreadLocalVariables.Destroy;
begin
  inherited;
end;

end.


