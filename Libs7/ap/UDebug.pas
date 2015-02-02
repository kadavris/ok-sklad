{
UDebug: Delphi units debugging module.
Copyright by Andrej Pakhutin
}
{$IFDEF SERVER}
{$I ok_server.inc}
{$ELSE}
{$I ok_sklad.inc}
{$ENDIF}
unit UDebug;

interface

uses
  Classes;
  
const
  fStackPtrMax = 1000;

  debugLevelHigh   = 10;
  debugLevelHi     = 10;
  debugLevelMed    = 5;
  debugLevelMedium = 5;
  debugLevelLow    = 1;
  debugLevelLo     = 1;
  debugLevelNone   = 0;

type
  TLoopedList = class
    private
      FData, FID: array of Variant;
      FPosition: Integer; // current position (internal)
      FUserPos: Integer; // used to store position for First, next, etc.. to work
      Filled: Boolean; // if capacity is all used

      function getData(const idx: Integer): Variant;
      procedure setData(const idx: Integer; const Value: Variant);
      function getID(const idx: Integer): Variant;
      procedure setID(const idx: Integer; const Value: Variant);

    public
      constructor Create(const ALength: Integer);
      destructor  Destroy; override;

      procedure Clear;
      function  Count: Integer;
      function  Capacity: Integer;
      //procedure SetLength(NewLength: Integer);

      procedure Push(Adata: Variant); overload;
      procedure Push(Adata: Variant; AID: Variant); overload;
      //function Pop: Variant;

      function  bof: Boolean;
      function  eof: Boolean;
      procedure Next;
      procedure Prev;
      procedure First;
      procedure Last;

      function CurrentData: Variant; // current element
      function CurrentID: Variant;   // current element

      property Position: Integer read FPosition;
      property Data[const idx: Integer]: Variant read getData write setData; default;
      property ID[const idx: Integer]: Variant read getID write setID;
  end;

  //--------------------------------------
  Tprofiler = class
    private
      FID: Cardinal;
      Fstart, Fend: TDateTime;
      Fcalls: Cardinal;
      FtotalTime: Integer;
      Frunning: Boolean;

    public
      constructor Create; reintroduce;
      destructor Destroy; override;

      procedure Start(id: Cardinal);
      function Stop: Integer;
      function Spent: Integer;
      function SpentStr: String;

      property Calls: Cardinal read Fcalls;
      property Started: TDateTime read FStart;
      property Stopped: TDateTime read Fend;
  end;

  //--------------------------------------
  Tdebug = class
    private
      FID: Cardinal;
      Fplace: String;
      Fprofiler: Tprofiler;
      FunitID: Integer;
      FCheckPoints: TStringList;

      procedure addTrace(start: Boolean; sp: Integer = 0);
      procedure Clear; // internal pre-create settings

    public
      constructor Create(const place: String; LogIt: Boolean = True); overload;
      constructor Create(const level, unitID: Integer; const fname: String); overload;
      destructor  Destroy; overload; override;
      destructor  Destroy(const msg: String); reintroduce; overload;

      procedure add(const s: String);
      procedure CheckPoint(const s: String = '');
      function  getCheckPoints: String;
  end; // Tdebug

  function profTopByTime: String;
  function profTopByCalls: String;
  function GetSpent(spent: Integer; showMs: Boolean = True): String; // time in milliseconds

  procedure udebug3(const fnam, pnam, pinf: String);
  procedure udebug1(const s: String);
  function  udebugDump(html: Boolean = False; max: Cardinal = fStackPtrMax): String;

  function  debugRegisterUnit(uname: String; DebugAllowed: pointer; groupID: String): Integer;
  procedure debugUnRegisterUnit(uID: Integer);
  procedure setUnitDebugLevel(uID: Integer; level: Integer);
  procedure debugStoreErrorPlace; // need that?
  procedure debugInstantLog(const s: String; SaveInStack:Boolean = True);

  procedure debugProfilingLevel(const APL: Integer);

  function  debugMemDump(const APtr: Pointer; Alen: Integer; const ADigitGroups: Integer = 0): String;
  function  debugStrDump(const APtr: Pointer; const Alen: Integer = 0): String; // dumps string with non-printables in hex

  procedure udebugSetLogFile(Aname: String);

  function  translateAccViolAddr(mapfile, errstr: String): String; // gets address from standard 'Access Violation at addr...' message and finds function name in memmap

var
  FProfilingLevel: Integer;
  cmdLineDebugLevel: Integer = 0;

//#########################################################################################
//#########################################################################################
//#########################################################################################
implementation

uses
  {$IFNDEF PKG}
    ssRegUtils,
    {$IFDEF SERVER}
      ssSrvConst,
    {$ELSE}
      ClientData, ssBaseConst,
    {$ENDIF}
  {$ENDIF}
  xClasses, strUtils, SysUtils, Windows, DateUtils, Math, Types, Variants;

type
  PByte = ^Byte;
  CharPtr = ^Char;

{const
  udebugMutexName: String = 'udebugMutex1';
}

var
  udebugMutexTimeOut: Integer = 1000; // msec
  udebugMutex: TxMutex = nil;
  udebugLogFileName: String;
  udebugLogFile: TextFile;

type
  TitemType = (itDefault, itFuncStart, itFuncStop, itFuncSingleCall, itFuncMultiple);

  //--------------------------------------
  TprofTop = class // Top NN profiler's list data container
    public
      Val: Integer;
      added: TDateTime; // time added to the list
  end;

  //--------------------------------------
  TfStackItem = record
    parent: Tdebug;
    ownerid: Cardinal; // for Tdebug's addtrace to know what items are their own
    itemType: TitemType;
    fname: String;
    parname: String;
    parinfo: String;
    count: Cardinal;
    spent: Integer;
    time: TDateTime;
  end;

  //--------------------------------------
  TdebugStack = array [1..fStackPtrMax] of TfStackItem;

  //--------------------------------------
  TdebugID = record
    id: Integer;
    place: String;
  end;

  //--------------------------------------
  Tunits = record
    name: String;
    group: String;
    Debugging: ^boolean;
    level: Integer;
  end;

var
  fTraceStack: TdebugStack;
  fTraceStackPtr: Cardinal = 0;
  fCallStack: TdebugStack; // just a function nesting information
  fCallStackPtr: Cardinal = 0;
  debugID: Cardinal = 1; // uniq trace counter
  fTraceStackFilled: Boolean = False;
  //IDList: TList;
  units: array of Tunits;

  profTopByTime_list: TStringList;
  profTopByCalls_list: TStringList;

  clearLog: Boolean = True;

//===============================================================
function translateAccViolAddr(mapfile, errstr: String): String;
  const
    key = '63257671816471645';

  var
    addr, curraddr: LongInt;
    map: TStringList;
    i,min,max: Integer;
    s: String;
begin
  //Access violation at address 0054EA80 in module 'OK-Ser~1.EXE'. Read of address 00000008
  Result := '';
  s := AnsiLowerCase(errstr);
  i := AnsiPos('at address', s) + 11;
  s := AnsiMidStr(s, i, 999);
  i := AnsiPos(' ', s);
  s := AnsiMidStr(s, 1, i - 1);
  if not TryStrToInt(s, addr) then Exit;
  addr := addr - $401000;

  map := TStringList.Create;
  
  try // finally
    try // except
      map.LoadFromFile(mapfile);
      min := 0;
      max := map.Count - 1;

      // addresses are sorted ascended, so performing fast search
      while True do begin
        i := (max - min) div 2 + min;

        if max <= i + 1 then break; // found it

        if not TryStrToInt(AnsiLowerCase(map.Names[i]), curraddr) then Exit;

        if curraddr < addr
          then min := i
          else if curraddr = addr
               then break
               else max := i;
      end; // while

      s := map.ValueFromIndex[i];
      for i := 1 to length(s) // decoding function name
        do Result := Result + chr( ord(s[i]) - StrToInt(key[i mod length(key) + 1]) );

    except
    end;

  finally
    map.Free;
  end;
end;

//===============================================================
//===============================================================
// TLoopedList
//===============================================================
//===============================================================
procedure TLoopedList.Clear;
begin
  FPosition := -1;
  FUserPos := -1;
  Filled := False;
end;

//===============================================================
constructor TLoopedList.Create(const ALength: Integer);
begin
  Clear;
  System.setLength(FData, ALength);
  System.setLength(FID, ALength);
end;

//===============================================================
destructor TLoopedList.Destroy;
begin
  inherited;
end;

//===============================================================
function TLoopedList.Count: Integer;
begin
  if Filled
    then Result := High(FData) + 1
    else Result := FPosition + 1;
end;

//===============================================================
function TLoopedList.Capacity: Integer;
begin
  Result := High(FData) + 1;
end;

//===============================================================
{procedure TLoopedList.SetLength(NewLength: Integer);
begin
end;
}
//===============================================================
procedure TLoopedList.Push(Adata: Variant);
begin
  Push(AData, Null);
end;

//===============================================================
procedure TLoopedList.Push(Adata: Variant; AID: Variant);
begin
  inc(FPosition);
  if FPosition > High(FData) then begin
    FPosition := 0;
    Filled := True;
  end;

  FData[FPosition] := AData;
  FID[FPosition] := AID;
  FUserPos := FPosition; 
end;

//===============================================================
{function TLoopedList.Pop: Variant;
  var
    i: Integer;
begin
  if FPosition = -1 then begin
    Result := Null;
    Exit;
  end;

  Result := FData[FPosition];

  if Filled then begin
    i := ifThen(FPosition = High(FData), 0, FPosition + 1);
  end;

  dec(FPosition);
end;
}
//===============================================================
function TLoopedList.bof: Boolean;
begin
  if not Filled or (Filled and (FPosition = High(FData)))
    then Result := (FUserPos <= 0)
    else Result := (FUserPos = FPosition + 1);
end;

//===============================================================
function TLoopedList.eof: Boolean;
begin
  Result := (FPosition = -1) or (FUserPos = FPosition);
end;

//===============================================================
procedure TLoopedList.First;
begin
  if not Filled or (Filled and (FPosition = High(FData)))
    then FUserPos := 0
    else FUserPos := FPosition + 1;
end;

//===============================================================
procedure TLoopedList.Last;
begin
  FUserPos := FPosition;
end;

//===============================================================
procedure TLoopedList.Next;
begin
  if Self.Eof then Exit;

  if Filled and (FUserPos = High(FData))
    then FUserPos := 0
    else inc(FUserPos);
end;

//===============================================================
procedure TLoopedList.Prev;
begin
  if Self.Bof then Exit;

  if Filled and (FUserPos = 0)
    then FUserPos := High(FData)
    else dec(FUserPos);
end;

//===============================================================
function TLoopedList.CurrentData: Variant; // current element
begin
  Result := FData[FUserPos];
end;

//===============================================================
function TLoopedList.CurrentID: Variant;   // current element
begin
  Result := FID[FUserPos];
end;

//===============================================================
function TLoopedList.getData(const idx: Integer): Variant;
begin
  if (idx < 0) or (idx > High(FData))
    then Result := Null
    else Result := FData[idx];
end;

//===============================================================
procedure TLoopedList.setData(const idx: Integer; const Value: Variant);
begin
  FData[idx] := Value;
end;

//===============================================================
function TLoopedList.getID(const idx: Integer): Variant;
begin
  if (idx < 0) or (idx > High(FData))
    then Result := Null
    else Result := FID[idx];
end;

//===============================================================
procedure TLoopedList.setID(const idx: Integer; const Value: Variant);
begin
  FID[idx] := Value;
end;

//===============================================================
//===============================================================
//===============================================================
//===============================================================
procedure preparePush(AParent: Tdebug);
begin
  if fTraceStackPtr = fStackPtrMax
    then begin
      fTraceStackPtr := 1;
      fTraceStackFilled := True;
    end
    else inc(fTraceStackPtr);

  with fTraceStack[fTraceStackPtr] do begin
    parent := AParent;
    itemType := itDefault;
    ownerid := 0; //Tdebug class id is always <> 0
  end;
end;

//===============================================================
procedure prepareCSPush(AParent: Tdebug);
  var n: Cardinal;
begin
  if fCallStackPtr = fStackPtrMax
    then for n := 2 to fStackPtrMax do fCallStack[n - 1] := fCallStack[n] // shifting down
    else inc(fCallStackPtr);

  if fCallStackPtr < 1 then fCallStackPtr := 1;

  with fCallStack[fCallStackPtr] do begin
    parent := Aparent;
    if AParent <> nil then begin
      fname := AParent.Fplace;
      ownerid := AParent.FID;
    end
    else begin
      fname := '';
      ownerid := 0;
    end;
    parname := '';
    parinfo := '';
    itemType := itDefault;
  end;
end;

//===============================================================
procedure pushStackInternal(const fnam, pnam, pinf: String);
begin
  try
    if (fTraceStackPtr > 0) and (fTraceStack[fTraceStackPtr].fname = fnam)
    then inc(fTraceStack[fTraceStackPtr].count)
    else begin
      preparePush(nil);

      with fTraceStack[fTraceStackPtr] do begin
        parname := pnam;
        parinfo := pinf;
        fname := fnam;
        count := 1;
        time := GetTime;
        spent := 0;
      end;
    end;

  except
  end;
end;

//===============================================================
function debugRegisterUnit(uname: String; DebugAllowed: Pointer; groupID: String): Integer;
  var
    n,l: Integer;
begin
  Result := -1;

  if udebugMutex = nil then udebugMutex := txMutex.Create(udebugMutexTimeOut);

  case udebugMutex.Obtain of
    twTimedOut: Exit;
    //twAbandoned,
    //twSuccess:
  end; // case udebugMutex.Obtain of

  try
    SetLength(units, High(units) + 2);

    n := High(units);
    units[n].name := uname;
    units[n].group := groupID;
    units[n].Debugging := DebugAllowed;

    {$IFNDEF PKG}
    if ReadFromRegInt(MainRegKey+'\debug\units', uname, l)
      then units[n].level := l
      else units[n].level := debugLevelNone;
    {$ENDIF}

    Result := n;

    try
      Boolean(DebugAllowed^) := True; // turning debug for this unit on while there is no automatic catchup code
      pushStackInternal('Unit registered: ' + uname, '', '');

    except
      pushStackInternal('Unit reg: ' + uname + ' failed at the end point', '', '');
    end;

  finally
    udebugMutex.Release;
  end;
end;

//===============================================================
procedure debugUnRegisterUnit(uID: Integer);
begin
  {
  case udebugMutex.Obtain of
    twTimedOut: Exit;
    //twAbandoned,
    //twSuccess:
  end; // case udebugMutex.Obtain of

  try
    try
      pushStackInternal('Unit UNregistered: '+units[uID].name, '', '');
    except
    end;

  finally
    udebugMutex.Release;
  end;
  }
end;

//===============================================================
function GetSpent(spent: Integer; showMs: Boolean = True): String; // time in milliseconds
  var
    h,m,s: integer;
    ms: String;
begin
  Result := '';
  if spent = 0 then begin Result := 'Zero time'; Exit; end;

  h := 0; m := 0; s := 0;
  if spent >= 3600000 then begin
    h := spent div 3600000;
    spent := spent - h * 3600000;
  end;

  if spent >= 60000 then begin
    m := spent div 60000;
    spent := spent - m * 60000;
  end;

  if spent >= 1000 then begin
    s := spent div 1000;
    spent := spent - s * 1000;
  end;

  if showMS
    then ms := Format('.%-03d', [spent])
    else ms := '';

  if (h > 0) and (m + s = 0) then Result := IntToStr(h) + ' hour' + ifThen(h > 1, 's', '')
  else if (m > 0) and (h + s = 0) then Result := IntToStr(m) + ' minute' + ifThen(m > 1, 's', '')
  else if (s > 0) and (h + m = 0) then Result := IntToStr(s) + ' second' + ifThen(s > 1, 's', '')
  else begin
    if h > 0 then Result := ifThen(h > 9, '', '0') + IntToStr(h) + ':';
    Result := Result + ifThen(m > 9, '', '0') + IntToStr(m) + ':';
    Result := Result + ifThen(s > 9, '', '0') + IntToStr(s) + ms;
  end;
end;

//===============================================================
function profTopCompare(List: TStringList; Index1, Index2: Integer): Integer;
begin
  if (List.Objects[Index2] as TProfTop).Val < (List.Objects[Index1] as TProfTop).Val
    then Result := -1
    else if (List.Objects[Index2] as TProfTop).Val > (List.Objects[Index1] as TProfTop).Val
           then Result := 1
           else Result := 0;
end;

//===============================================================
function profTopByTime: String;
  var i: integer;
begin
  case udebugMutex.Obtain of
    twTimedOut: Exit;
    //twAbandoned,
    //twSuccess:
  end; // case udebugMutex.Obtain of

  try
    Result := '';
    profTopByTime_list.CustomSort(profTopCompare);

    for i := 0 to profTopByTime_list.Count - 1 do
      Result := Result + Format('%3d: ', [i]) + GetSpent((profTopByTime_list.Objects[i] as TProfTop).Val)
                + ' on ' + profTopByTime_list[i] + #13#10;

  finally
    udebugMutex.Release;
  end;
end;

//===============================================================
function profTopByCalls: String;
  var i: integer;
begin
  case udebugMutex.Obtain of
    twTimedOut: Exit;
    //twAbandoned,
    //twSuccess:
  end; // case udebugMutex.Obtain of

  try
    Result := '';
    ProfTopByCalls_list.CustomSort(profTopCompare);

    for i := 0 to profTopByCalls_list.Count - 1 do
      Result := Result + Format('%3d: %d calls of ', [i, (profTopByCalls_list.Objects[i] as TProfTop).Val])
                + profTopByCalls_list[i] + #13#10;

  finally
    udebugMutex.Release;
  end;
end;

//===============================================================
procedure profAddTop(var list: TStringList; s: String; newval: Integer);
  var
    i, fi: Integer;
    min: Integer;
    mindate: TDateTime;
    pto: TprofTop;
begin
  try
    fi := list.IndexOf(s);

    if fi = -1 then begin
      if list.Count = 100 then begin
        min := MaxInt;
        mindate := now;
        for i := 0 to list.Count - 1 do // getting minimum
          with (list.objects[i] as TProfTop) do
          if (Val <= min) and (LessThanValue = compareDateTime(added, mindate)) then begin
            min := Val;
            fi := i;
          end;

        if (list.objects[fi] as TProfTop).Val > newval then Exit; // this val is too low for Top

        (list.objects[fi] as TProfTop).Free;
        list.Delete(fi);
      end;

      pto := TprofTop.Create;
      pto.val := newval;
      pto.added := now;
      list.AddObject(s, pto);
    end
    else (list.Objects[fi] as TProfTop).Val := (list.objects[fi] as TProfTop).Val + newval;

  except
    {$IFDEF DEBUG}pushStackInternal('profAddTop croaked at ' + s, '', '');{$ENDIF}
  end;
end;

//===============================================================
//===============================================================
//= Tprofiler ===================================================
//===============================================================
//===============================================================
constructor TProfiler.Create;
begin
  FID := 0;
  Fcalls := 0;
  Frunning := False;
  //Fstart, Fend: TDateTime;
  //FtotalTime: TDateTime;
end;

//===============================================================
destructor TProfiler.Destroy;
begin
  if FRunning then Stop;
  inherited;
end;

//===============================================================
procedure TProfiler.Start(id: Cardinal);
begin
  Fstart := GetTime;
  Frunning := True;
  inc(Fcalls);
end;

//===============================================================
function TProfiler.Stop: Integer;
begin
  if not Frunning then begin
    Result := MilliSecondsBetween(Fend, Fstart);
    Exit;
  end;
  Fend := GetTime;
  Result := MilliSecondsBetween(Fend,Fstart);
  FtotalTime := FtotalTime + Result;
  Frunning := False;
end;

//===============================================================
function TProfiler.Spent: Integer;
begin
  if Frunning
    then Result := MilliSecondsBetween(GetTime, Fstart)
    else Result := MilliSecondsBetween(Fend, Fstart);
end;

//===============================================================
function TProfiler.SpentStr: String;
begin
  Result := getSpent(spent);
end;

//===============================================================
//===============================================================
//= TDebug ======================================================
//===============================================================
//===============================================================
procedure Tdebug.Clear; //internal only
begin
  FID := 0;
  Fplace := '';
  Fprofiler := nil;
  FunitID := -1;
  FCheckPoints := nil;
end;

//===============================================================
constructor Tdebug.Create(const place: String; LogIt: Boolean = True);
begin
  case udebugMutex.Obtain of
    twTimedOut: Exit;
    //twAbandoned,
    //twSuccess:
  end; // case udebugMutex.Obtain of

  Clear;

  try
    try
      Fplace := place;

      FID := debugID;
      inc(debugID);
      if debugID = 0 then inc(debugID);

      addTrace(True);

    except
      Fplace := '';
      Fprofiler := nil;
    end;

  finally
    udebugMutex.Release;
  end;

  if logIt and ( cmdLineDebugLevel > 14) then debugInstantLog('TDebug.Create(' + place + ')', False);
end;

//===============================================================
constructor Tdebug.Create(const level, unitID: Integer; const fname: String);
begin
  try
    Create(fname, False);
    FunitID := unitID;

    if FProfilingLevel > 0 then begin
      Fprofiler := Tprofiler.Create;
      Fprofiler.Start(0);
    end;

    if cmdLineDebugLevel > 14 then debugInstantLog('TDebug.Create(' + fname + ')', False);

  except
    Fplace := '';
    Fprofiler := nil;
  end
end;

//===============================================================
destructor Tdebug.Destroy;
  var
    sp: Integer;
begin
  case udebugMutex.Obtain of
    twTimedOut: Exit;
    //twAbandoned,
    //twSuccess:
  end; // case udebugMutex.Obtain of

  sp := 0;

  try
    try
      if Fprofiler <> nil then begin
        sp := Fprofiler.Stop;

        if sp > 0 then profAddTop(profTopByTime_list, Fplace, sp);

        profAddTop(profTopByCalls_list, Fplace, Fprofiler.calls);
        Fprofiler.Destroy;
      end;

    except
    end;

    try
      addTrace(False, sp);

    except
    end;

  finally
    udebugMutex.Release;
  end;

  if cmdLineDebugLevel > 14 then debugInstantLog('TDebug.Destroy(' + fplace + '), spent: ' + GetSpent(sp, True), False);

  FCheckPoints.Free;
  
  inherited;
end;

//===============================================================
destructor TDebug.Destroy(const msg: String);
begin
  Destroy;
  udebug1(Fplace + ' *** Exit with message: ' + msg);
end;

//===============================================================
procedure Tdebug.add(const s: String);
begin
  udebug1(s);
end;

//===============================================================
procedure Tdebug.CheckPoint(const s: String = '');
begin
  if FcheckPoints = nil then FcheckPoints := TStringlist.Create;
  
  if s = ''
    then FCheckPoints.Add(IntToStr(FCheckPoints.Count + 1))
    else FCheckPoints.Add(IntToStr(FCheckPoints.Count + 1) + ': ' + s);
end;

//===============================================================
function  Tdebug.getCheckPoints: String;
begin
  if (FCheckPoints = nil) or (FCheckPoints.Count = 0)
    then Result := ''
    else Result := FCheckPoints.Text;
end;

//===============================================================
{procedure getStack(const Value: Cardinal);
begin
  if (Value < 1) or (Value > fTraceStackPtr) then Result := nil;
  else Result := fTraceStack[Value];
end;
}

//===============================================================
function lookCSID(AID: Cardinal; startFrom: Cardinal = 0): Cardinal; // looks up matching id down the fCallStack
  var lp: Cardinal;
begin
  Result := 0;
  if startFrom = 0 then startFrom := fCallStackPtr;

  for lp := startFrom downto 1 do
    if fCallStack[lp].ownerid = AID then begin Result := lp; Exit; end;
end;

//===============================================================
function lookID(AID: Cardinal): Cardinal; // looks up matching id down the fTraceStack
  var lp: Cardinal;
begin
  Result := 0;
  for lp := fTraceStackPtr - 1 downto 1 do
    if fTraceStack[lp].ownerid = AID then begin Result := lp; Exit; end;

  if not fTraceStackFilled or (fTraceStackPtr = fStackPtrMax) then Exit; // no loop possible

  for lp := fStackPtrMax downto fTraceStackPtr + 1 do
    if fTraceStack[lp].ownerid = AID then begin Result := lp; Exit; end;
end;

//===============================================================
procedure Tdebug.addTrace(start: Boolean; sp: Integer = 0);
  var
    lp: Integer;
begin
  // for start of func we're always adding a new entry. when it ends we'll look what was behind it
  if start then begin
    preparePush(Self);

    with fTraceStack[fTraceStackPtr] do begin
      ownerid := FID;
      itemType := itFuncStart;
      fname := Fplace;
      parname := units[FunitID].name;
      count := 1;
      time := GetTime;
      spent := sp;
    end;

    prepareCSPush(Self);

    with fCallStack[fCallStackPtr] do begin
      itemType := itFuncStart;
      parname := units[FunitID].name;
    end;

    Exit;
  end; // if start

  // trying to clear stack till our function start. even if some intermediate was not unregistered itself from the top of call stack
  lp := LookCSID(FID);
  if lp > 0 then begin
    fCallStackPtr := lp - 1;
    if fCallStackPtr < 1 then fCallStackPtr := 1;
  end
  else begin
    prepareCSPush(Self);
    with fCallStack[fCallStackPtr] do begin
      parname := units[FunitID].name;
      parinfo := '--- Stalled stack item';
    end;
  end;

  // if this is not our start on the stack top - marking exit as separate item
  if FID <> fTraceStack[fTraceStackPtr].ownerid then begin
    preparePush(Self);

    with fTraceStack[fTraceStackPtr] do begin
      ownerID := FID;
      itemType := itFuncStop;
      fname := FPlace;
      parname := units[FunitID].name;
      count := 1;
      time := GetTime;
      spent := sp;
    end;

    Exit;
  end;

  // so, here is our beginning on top of the stack

  // for the end of func we should check if it is repeated or recursive call, etc...
  lp := fTraceStackPtr - 1; // getting back one step (if there was something of course)
  if lp <= 0 then
    if fTraceStackFilled
      then lp := fStackPtrMax // stack was full, so looping to the top
      else lp := 1; // we're 1st element!

  // cannot merge if previous element is NOT the same func as we are OR it is not marked as repeated call
  if (FPlace <> fTraceStack[lp].fname) or (not (fTraceStack[lp].itemType in [itFuncSingleCall, itFuncMultiple]))
  then
    with fTraceStack[fTraceStackPtr] do begin // just marking our ending separately
      itemType := itFuncSingleCall;
      count := 1;
      time := GetTime;
      spent := sp;

      Exit;
    end;

  //  we can merge with previous call
  with fTraceStack[lp] do begin
    itemType := itFuncMultiple;
    inc(count);
    spent := spent + sp;
  end;

  fTraceStackPtr := lp; // making our beginning element vanish
end;

//===============================================================
procedure udebug3(const fnam, pnam, pinf: String);
begin
  case udebugMutex.Obtain of
    twTimedOut: Exit;
    //twAbandoned,
    //twSuccess:
  end; // case udebugMutex.Obtain of

  try
    pushStackInternal(fnam, pnam, pinf);

  finally
    udebugMutex.Release;
  end;
end;
//===============================================================
procedure udebug1(const s: String);
begin
  udebug3(s, '', '');
end;

//===============================================================
function hTag(html: Boolean; tag: string; crp: Integer = 0): String;
begin
  Result := ifThen( (crp and 2) = 2, #13#10, '');
  if html then Result := Result + tag;
  if (crp and 1) = 1 then Result := Result + #13#10;
end;

//===============================================================
function udebugDumpCallStack(html: Boolean = False): String;
  var
    i: Cardinal;
begin
  case udebugMutex.Obtain of
    twTimedOut: Exit;
    //twAbandoned,
    //twSuccess:
  end; // case udebugMutex.Obtain of

  try
    Result := hTag(html, '<P>', 2) + 'CallStack:';

    if fCallStackPtr = 0 then begin
      Result := Result + ' Empty...';
      Exit;
    end;

    for i := 1 to fCallStackPtr do
      with fCallStack[i] do begin
        Result := Result + hTag(html, '<BR>', 2) + format('%3d/%5d - ', [i, ownerid]) + fname + '/' + parname + ' ' + parinfo;

        if (parent <> nil) and (parent.getCheckPoints <> '')
          then Result := Result + hTag(html, '<BR>', 2) + 'CheckPoints: '#13#10 + parent.getCheckPoints;
      end;

  finally
    udebugMutex.Release;
  end;
end;

//===============================================================
function udebugDump(html: Boolean = False; max: Cardinal = fStackPtrMax): String;
  var
    i, lastpos, level: Cardinal;
    timeprefix, prefix, sprefix, spaces, suffix: String;

  procedure MakePrefix;
  begin
    spaces := StringOfChar(' ', level * 2);
    sprefix := #13#10 + spaces + StringOfChar(' ', 13);
    timeprefix := TimeToStr(fTraceStack[i].time);

    if level > 0 then begin
      prefix := hTag(html, '<LI> ', 2) + timeprefix + ': ' + spaces;
      suffix := hTag(html, '</LI>', 1);
    end
    else begin
      prefix := hTag(html, '<BR> ', 2) + timeprefix + ': ';
      suffix := '';
    end;
  end;

  function AddSpent(spent: Integer): String;
  begin
    if spent = 0 then begin
      Result := '';
      Exit;
    end;
    Result := ', ' + getSpent(spent);
    if spent > 500 then Result := Result + ' <<<<<============ SLOW';
  end;

begin
  case udebugMutex.Obtain of
    twTimedOut: Exit;
    //twAbandoned,
    //twSuccess:
  end; // case udebugMutex.Obtain of

  try
    if fTraceStackPtr = 0 then begin Result := #13#10'Stack is Empty'; exit; end;

    Result := hTag(html, '<P>', 2) + 'Debug dump starts here. Shivvver in Great Fear ye puny earthlings! '#13#10 + StringOFChar('-', 20);

    if fTraceStackFilled then begin // cycle it
      if max > fStackPtrMax then max := fStackPtrMax;
      i := fTraceStackPtr + 1;
      if i > fStackPtrMax then i := 0;
      lastpos := i + max;
      if lastpos > fStackPtrMax then lastpos := lastpos - fStackPtrMax - 1; //set it before begin
    end
    else begin // from begin to stackptr
      if max > fTraceStackPtr then max := fTraceStackPtr;
      i := 0;
      lastpos := fTraceStackPtr;
    end;

    Result := udebugDumpCallStack + hTag(html, '<H2>', 2) + 'Trace log for ' + intToStr(max) + ' positions' + hTag(html, '</H2><DIV>');

    level := 0;
    while i <> lastpos do begin
      inc(i);
      if i = fStackPtrMax then i := 1;

      MakePrefix;

      with fTraceStack[i] do
        case itemType of
          itDefault:
            if fname <> '' then begin
              MakePrefix;
              if (parname = '') and (parinfo = '') // it is a single message, not a Tdebug matter
                then Result := Result + hTag(html, '<BR>', 2) + timeprefix + fname + #13#10
                else Result := Result + prefix + fname;

              if count > 1 then Result := Result + ' (' + IntToStr(count) + ' times)';
              if parname <> '' then Result := Result + ' of ' + parname;
              if parinfo <> '' then Result := Result + ' / ' + parinfo;
            end;

          itFuncStart:
            begin
              MakePrefix;
              inc(level);
              Result := Result + prefix + ' +++++ Begin lvl: ' + IntTostr(level) + ' ' + fname + '/' + parname + sprefix + hTag(html, '<UL>');
            end;

          itFuncStop: begin
            if level > 0 then begin // in case of stack cycled and begin of func was erased.
              dec(level);
              MakePrefix;
              Result := Result + sprefix + hTag(html, '</UL>') + prefix + ' ----- End lvl: ' + IntTostr(level + 1) + ' '
                         + fname + '/' + parname + AddSpent(spent) + suffix;
            end
            else Result := Result + prefix + ' ----- End ' + fname + '/' + parname + AddSpent(spent) + suffix;
          end; // itFuncStop

          itFuncSingleCall: begin
            MakePrefix;
            Result := Result + prefix + fname + '/' + parname + AddSpent(spent) + suffix;
          end; //itFuncSingleCall

          itFuncMultiple: begin
            MakePrefix;
            Result := Result + prefix + fname + '/' + parname + ' (' + IntToStr(count) + ' times)' + AddSpent(spent) + suffix;
          end; //itFuncSingleCall

        end; // case
    end; // while
    Result := Result + sprefix + hTag(html, '<BR>' ,2) + 'Debug dump ends here ---------------------------------------------' + hTag(html, '</div>', 2);

  finally
    udebugMutex.Release;
  end;
end;

//===============================================================
procedure setUnitDebugLevel(uID: Integer; level: Integer);
begin
  {$IFNDEF PKG}
  case udebugMutex.Obtain of
    twTimedOut: Exit;
    //twAbandoned,
    //twSuccess:
  end; // case udebugMutex.Obtain of

  try
    WriteToRegInt(MainRegKey+'\debug\units', units[uID].name, level);
    units[uID].level := level;

  finally
    udebugMutex.Release;
  end;
  {$ENDIF}
end;

//===============================================================
procedure debugStoreErrorPlace; // just visually splits log for now
begin
  udebug3('-*-*-*-*-*-*-*- Error here -*-*-*-*-*-*-*-',
          '-*-*-*-*-*-*-*- Error here -*-*-*-*-*-*-*-',
          '-*-*-*-*-*-*-*- Error here -*-*-*-*-*-*-*-');
  udebug1(udebugDumpCallStack);
end;

//===============================================================
procedure udebugSetLogFile(Aname: String);
begin
  case udebugMutex.Obtain of
    twTimedOut: Exit;
    //twAbandoned,
    //twSuccess:
  end; // case udebugMutex.Obtain of

  try
    try
      AssignFile(udebugLogFile, AName);

    except
      Exit;
    end;

    try
      Append(udebugLogFile);

    except
      try
        Rewrite(udebugLogFile);

      except
        Exit;
      end;
    end;

    CloseFile(udebugLogFile);

  finally
    udebugMutex.Release;
  end;

  udebugLogFileName := Aname;
end;

//===============================================================
procedure debugInstantLog(const s: String; SaveInStack: Boolean = True);
begin
  if udebugMutex = nil then udebugMutex := txMutex.Create(udebugMutexTimeOut);

  case udebugMutex.Obtain of
    twTimedOut: Exit;
    //twAbandoned,
    //twSuccess:
  end; // case udebugMutex.Obtain of

  try
    if SaveInStack then pushStackInternal(s, '', '');

    {try
      AssignFile(F, ExtractFilePath(ParamStr(0)) + udebugLogFileName);

    except
      raise Exception.Create('assignfile(' + udebugLogFileName + ')');
      Exit;
    end;
    }

    if clearLog // clear log on first call
      then
        try
          clearLog := False;
          Rewrite(udebugLogFile)

        except
          //raise Exception.Create('rewrite1(' + udebugLogFileName + ')');
          Exit;
        end
      else
        try
          Append(udebugLogFile);

        except
          try
            Rewrite(udebugLogFile);

          except
            //raise Exception.Create('rewrite2(' + udebugLogFileName + ')');
            Exit;
          end;
        end;

    try
      Writeln(udebugLogFile, DateToStr(now) + ' ' + TimeToStr(now) + ': ' + s);
      CloseFile(udebugLogFile);

    except
      //raise Exception.Create(udebugLogFileName + ' write error ;)');
    end;

  finally
    udebugMutex.Release;
  end;
end;

//===============================================================
procedure debugProfilingLevel(const APL: Integer);
begin
  FProfilingLevel := APL;
end;

//===============================================================
function debugMemDump(const APtr: Pointer; Alen: Integer; const ADigitGroups: Integer = 0): String;
  var
    pc: ^Char;
    g: Integer;
begin
  Result := '';
  pc := APtr;
  g := 0;

  while ALen > 0 do begin
    Result := Result + IntToHex(Byte(pc^), 2);
    inc(pc);
    dec(Alen);

    if ADigitGroups > 0 then begin
      inc(g);
      if g = ADigitGroups then begin
        Result := Result + ' ';
        g := 0;
      end;
    end;
  end;
end;

//===============================================================
function debugStrDump(const APtr: Pointer; const Alen: Integer = 0): String;
  var
    pc: ^Char;
    str: Boolean;
    len: Integer;
begin
  Result := '';
  pc := APtr;
  str := False;
  len := ALen;

  while ((ALen <> 0) and (Len > 0)) or ((ALen = 0) and (pc^ <> #0)) do begin
    if (Byte(pc^) > 32) and (Byte(pc^) < $ff) then begin
      if not str then begin
        str := True;
        Result := Result + '''';
      end;
      Result := Result + pc^;
    end
    else begin
      if str then begin
        str := False;
        Result := Result + ''' ';
      end;

      Result := Result + '0x' + IntToHex(Byte(pc^), 2) + ' ';
    end;

    inc(pc);
    dec(len);
  end;

  if str then Result := Result + '''';
end;

//===============================================================
initialization
  if udebugMutex = nil then udebugMutex := txMutex.Create(udebugMutexTimeOut);

  //IDList := Tlist.Create;

  profTopByTime_list := TStringlist.Create;
  profTopByCalls_list := TStringlist.Create;

  FProfilingLevel := debugLevelNone;

  udebugSetLogFile(ExtractFilePath(ParamStr(0)) + 'messages.log');

//===============================================================
finalization

  udebugMutex.Free;
end.


