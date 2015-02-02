unit xLog;

interface

uses
  SysUtils, Classes, xClasses;

type

  TxLog = class(TComponent)
  private
    FFileName: TFileName;
    FMutex: TxMutex;
    FBeginStrWithTime: Boolean;
    FTimeout: Cardinal;
    FLogStack: TStringList;
    procedure SetTimeout(const Value: Cardinal);

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Add(const AStr: AnsiString): Integer;
    procedure Loaded; override;
    procedure AddToStack(const S: string);
    function GetLogStack(html: Boolean): String;

  published
    property BeginStrWithTime: Boolean read FBeginStrWithTime write FBeginStrWithTime default True;
    property FileName: TFileName read FFileName write FFileName;
    property Timeout: Cardinal read FTimeout write SetTimeout default 1000;
  end;

implementation

const
  LogStackMax = 100;

//==============================================================================================
function TxLog.Add(const AStr: AnsiString): Integer;
  var
    F: TextFile;
    S: AnsiString;
begin
  Result := -1;
  if FFileName = EmptyStr then Exit;

  s := DateTimeToStr(Now) + ':  ';

  if FlogStack.Count > 0 then begin
    if FLogStack.Strings[FlogStack.Count - 1] = AStr then begin
      Result := 0; Exit;
    end;
  end;

  if FMutex.Obtain <> twSuccess then Exit;

  try
    AssignFile(F, FFileName);
    try
      if FileExists(FFileName)
        then Append(F)
        else Rewrite(F);
      try
        if FlogStack.Count = 0 then begin
		  Writeln(F, #10#13);
          if FBeginStrWithTime then Write(F, s);
          Writeln(F,'Log Started -------------------------------');
        end;

        if FBeginStrWithTime then Write(F, s);

        Writeln(F, AStr);
        AddToStack(AStr);
        Result := 0;

      finally
        CloseFile(F);
      end;

    except
      raise;
    end;
 
  finally
    FMutex.Release;
  end;
end;

//==============================================================================================
constructor TxLog.Create(AOwner: TComponent);
begin
  inherited;

  FBeginStrWithTime := True;
  FTimeout := 1000;

  FMutex := TxMutex.Create(FTimeout);

  FlogStack := TstringList.Create;
  FLogStack.Capacity := LogStackMax;
end;

//==============================================================================================
destructor TxLog.Destroy;
begin
  FMutex.Free;
  FlogStack.Destroy;

  inherited;
end;

//==============================================================================================
procedure TxLog.Loaded;
begin
  inherited;

  FMutex.Timeout := FTimeout;
end;

//==============================================================================================
function TxLog.GetLogStack(html: Boolean): String;
  var i: Integer;
begin
  if not html then begin
    Result := FLogStack.Text; Exit;
  end;

  Result := '<UL>' + #10#13;
  for i := 0 to FLogStack.Count - 1 do
    Result := Result + '<LI>' + FLogStack.Strings[i] + #10#13;
  Result := Result + '</UL>' + #10#13;
end;

//==============================================================================================
procedure TxLog.AddToStack(const S: string);
begin
  if FLogStack.Count = LogStackMax then FlogStack.Delete(0);
  FLogStack.Append(S);
end;

//==============================================================================================
procedure TxLog.SetTimeout(const Value: Cardinal);
begin
  FTimeout := Value;

  FMutex.Timeout := Value;
end;

end.
