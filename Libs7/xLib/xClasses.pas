unit xClasses;

interface

uses Windows, Classes, ExtCtrls, SysUtils, xStrUtils;

const
  QueueAccessTimeout = 2000;

type
  TxQueueAction = class;
  TxQueue = class;
  TxMutex = class;
  TxVerInfo = class;

  TxWaitResult = (twAbandoned, twTimedOut, twSuccess, twNone);
  TxExecuteActionEvent = procedure(AAction: TxQueueAction) of object;
  TxVerCompResult = (crEqual, crSmaller, crLarger);

  TxVerInfo = class
  private
    MajorVersionLo: Integer;
    MajorVersionHi: Integer;
    MinorVersionLo: Integer;
    MinorVersionHi: Integer;
    ReleaseVersionLo: Integer;
    ReleaseVersionHi: Integer;

    FCurrMajor: Integer;
    FCurrMinor: Integer;
    FCurrRelease: Integer;
    function GetCurrVersion: string;
    procedure SetCurrVersion(const Value: string);
  public
    constructor Create; virtual;
    procedure First;
    procedure Last;
    procedure Next;
    function Eof: Boolean;
    class function Compare(const AVer1, AVer2: string): TxVerCompResult;

    property CurrVersion: string read GetCurrVersion write SetCurrVersion;
  end;

  TxMutex = class
  private
    FHandle: THandle;
    FTimeout: Cardinal;
  public
    property Handle: THandle read FHandle;
    property Timeout: Cardinal read FTimeout write FTimeout;
    constructor Create(ATimeout: Cardinal); virtual;
    destructor Destroy; override;
    procedure Release;
    function Obtain: TxWaitResult;
  end;

  TxQueueAction = class
  private
    FActionType: Integer;
    FParam: Variant;
    FAddInfo: Variant;

  public
    property ActionType: Integer read FActionType write FActionType;
    property Param: Variant read FParam write FParam;
    property AddInfo: Variant read FAddInfo write FAddInfo;
    constructor Create(AActionType: Integer; AParam, AAddInfo: Variant); virtual;
  end;

  TxQueue = class(TComponent)
  private
    FTimer: TTimer;
    FQueue: TList;
    FmtxMain: TxMutex;
    FOnAction: TxExecuteActionEvent;
    FCheckInterval: Cardinal;
    function GetItem(Index: Integer): TxQueueAction;
    procedure Timer(Sender: TObject);
    procedure SetCheckInterval(const Value: Cardinal);

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function Add(AActionType: Integer; AParam, AAddInfo: Variant; AToBegin: boolean = False): TxQueueAction;
    procedure Delete(AIndex: Integer);

    property Items[Index: Integer]: TxQueueAction read GetItem;

  published
    property OnAction: TxExecuteActionEvent read FOnAction write FOnAction;
    property CheckInterval: Cardinal read FCheckInterval write SetCheckInterval default 1000;
  end;

implementation

{ TxMutex }
//==============================================================================================
constructor TxMutex.Create(ATimeout: Cardinal);
begin
  FTimeout:=ATimeout;
  FHandle:=CreateMutex(nil, False, nil);
end;

//==============================================================================================
destructor TxMutex.Destroy;
begin
  CloseHandle(FHandle);

  inherited;
end;

//==============================================================================================
function TxMutex.Obtain: TxWaitResult;
var
  res: dword;
begin
  Result := twNone;
  res := WaitForSingleObject(FHandle, FTimeout);
  case res of
    WAIT_OBJECT_0: Result := twSuccess;
    WAIT_ABANDONED: Result := twAbandoned;
    WAIT_TIMEOUT: Result := twTimedOut;
  end;
end;

//==============================================================================================
procedure TxMutex.Release;
begin
  ReleaseMutex(FHandle);
end;

{ TxQueue }

//==============================================================================================
function TxQueue.Add(AActionType: Integer; AParam, AAddInfo: Variant;
  AToBegin: boolean): TxQueueAction;
begin
  Result := nil;
  if FmtxMain.Obtain = twSuccess then
    try
      Result := TxQueueAction.Create(AActionType, AParam, AAddInfo);
      FQueue.Add(Result);
      if AToBegin then FQueue.Move(FQueue.Count-1, 0);
    finally
      FmtxMain.Release;
    end;
end;

//==============================================================================================
constructor TxQueue.Create(AOwner: TComponent);
begin
  inherited;

  FQueue := TList.Create;

  FmtxMain := TxMutex.Create(QueueAccessTimeout);

  FTimer := TTimer.Create(nil);
  FTimer.OnTimer := Timer;

  CheckInterval := 1000;
end;

//==============================================================================================
procedure TxQueue.Delete(AIndex: Integer);
begin
  if FmtxMain.Obtain = twSuccess then
    try
      Items[AIndex].Free;
      FQueue.Delete(AIndex);
    finally
      FmtxMain.Release;
    end;
end;

//==============================================================================================
destructor TxQueue.Destroy;
var
  i: integer;
begin
  FTimer.Free;
  FmtxMain.Free;

  for i := 0 to FQueue.Count-1 do TxQueueAction(FQueue.Items[i]).Free;
  FQueue.Free;

  inherited;
end;

//==============================================================================================
function TxQueue.GetItem(Index: Integer): TxQueueAction;
begin
  Result := FQueue[Index];
end;

//==============================================================================================
procedure TxQueue.SetCheckInterval(const Value: Cardinal);
begin
  FCheckInterval := Value;
  FTimer.Interval := Value;
end;

//==============================================================================================
procedure TxQueue.Timer(Sender: TObject);
begin
  if csDesigning in ComponentState then Exit;
  FTimer.Enabled := False;
  if FmtxMain.Obtain = twSuccess then
    try
      while FQueue.Count > 0 do begin
        if Assigned(FOnAction) then FOnAction(Items[0]);
        Items[0].Free;
        FQueue.Delete(0);
      end;
    finally
      FmtxMain.Release;
    end;
  FTimer.Enabled := True;  
end;

{ TxQueueAction }

//==============================================================================================
constructor TxQueueAction.Create(AActionType: Integer; AParam, AAddInfo: Variant);
begin
  FActionType := AActionType;
  FParam := AParam;
  FAddInfo := AAddInfo;
end;

{ TxVerInfo }

class function TxVerInfo.Compare(const AVer1, AVer2: string): TxVerCompResult;
var
  FMajor1, FMajor2, FMinor1, FMinor2, FRelease1, FRelease2: Integer;
begin
  FMajor1 := StrToInt(ExtractWord(1, AVer1, ['.']));
  FMinor1 := StrToInt(ExtractWord(2, AVer1, ['.']));
  FRelease1 := StrToInt(ExtractWord(3, AVer1, ['.']));

  FMajor2 := StrToInt(ExtractWord(1, AVer2, ['.']));
  FMinor2 := StrToInt(ExtractWord(2, AVer2, ['.']));
  FRelease2 := StrToInt(ExtractWord(3, AVer2, ['.']));

  if (FMajor1 = FMajor2) and (FMinor1 = FMinor2) and (FRelease1 = FRelease2) then
  begin
    Result := crEqual;
    Exit;
  end;

  if (FMajor1 > FMajor2) or
     ((FMajor1 = FMajor2) and ((FMinor1 > FMinor2) or
     ((FMinor1 = FMinor2) and (FRelease1 > FRelease2)))) then Result := crLarger
    else Result := crSmaller;
end;

//==============================================================================================
constructor TxVerInfo.Create;
begin
  MajorVersionHi := 10;
  MajorVersionLo := 1;
  MinorVersionHi := 50;
  MinorVersionLo := 0;
  ReleaseVersionHi := 50;
  ReleaseVersionLo := 0;
  First;
end;

//==============================================================================================
function TxVerInfo.Eof: Boolean;
begin
  Result := (FCurrMajor = MajorVersionHi) and (FCurrMinor = MinorVersionHi)
    and (FCurrRelease = ReleaseVersionHi);
end;

//==============================================================================================
procedure TxVerInfo.First;
begin
  FCurrMajor := MajorVersionLo;
  FCurrMinor := MinorVersionLo;
  FCurrRelease := ReleaseVersionLo;
end;

//==============================================================================================
function TxVerInfo.GetCurrVersion: string;
begin
  Result := IntToStr(FCurrMajor) + '.' + IntToStr(FCurrMinor) + '.' +
    IntToStr(FCurrRelease);
end;

//==============================================================================================
procedure TxVerInfo.Last;
begin
  FCurrMajor := MajorVersionHi;
  FCurrMinor := MinorVersionHi;
  FCurrRelease := ReleaseVersionHi;
end;

//==============================================================================================
procedure TxVerInfo.Next;
begin
  if not Eof then begin
    Inc(FCurrRelease);
    if FCurrRelease > ReleaseVersionHi then begin
      FCurrRelease := ReleaseVersionLo;
      Inc(FCurrMinor);
      if FCurrMinor > MinorVersionHi then begin
        FCurrMinor := MinorVersionLo;
        Inc(FCurrMajor);
      end;
    end;
  end;
end;

//==============================================================================================
procedure TxVerInfo.SetCurrVersion(const Value: string);
begin
  FCurrMajor := StrToInt(ExtractWord(1, Value, ['.']));
  FCurrMinor := StrToInt(ExtractWord(2, Value, ['.']));
  FCurrRelease := StrToInt(ExtractWord(3, Value, ['.']));
  if (FCurrMajor > MajorVersionHi) or (FCurrMajor < MajorVersionLo) or
     (FCurrMinor > MinorVersionHi) or (FCurrMinor < MinorVersionLo) or
     (FCurrRelease > ReleaseVersionHi) or (FCurrRelease < ReleaseVersionLo)
     then First;
end;

end.
