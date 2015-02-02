unit udf_date;

interface

uses Types;

type
  Long = Longint;
  ULong = DWord;

  TISC_TIMESTAMP = record
    d_date : Long;
    d_time : ULong;
  end;
  PISC_TIMESTAMP = ^TISC_TIMESTAMP;

  TCTime = record
    tm_sec : integer;   // Seconds
    tm_min : integer;   // Minutes
    tm_hour : integer;  // Hour (0--23)
    tm_mday : integer;  // Day of month (1--31)
    tm_mon : integer;   // Month (0--11)
    tm_year : integer;  // Year (calendar year minus 1900)
    tm_wday : integer;  // Weekday (0--6) Sunday = 0)
    tm_yday : integer;  // Day of year (0--365)
    tm_isdst : integer; // 0 if daylight savings time is not in effect)
  end;
  PCTime = ^TCTime;

  function ExtractDate(var Value : TISC_TIMESTAMP): PISC_TIMESTAMP; cdecl; export;
  function IncDate(var Value : TISC_TIMESTAMP): PISC_TIMESTAMP; cdecl; export;
  function Now: PISC_TIMESTAMP; cdecl; export;

implementation

uses SysUtils, Windows, DateUtils;

procedure isc_decode_timestamp(ib_date: PISC_TIMESTAMP; tm_date: PCTime); stdcall;
  external 'fbclient.dll';

procedure isc_encode_timestamp(tm_date: PCTime; ib_date: PISC_TIMESTAMP); stdcall;
  external 'fbclient.dll';

function ib_util_malloc (l: Integer): Pointer; cdecl; external 'ib_util.dll';

procedure InitCTime(var tm: TCTIME);
begin
  with tm do begin
    tm_sec := 0;
    tm_min := 0;
    tm_hour := 0;
    tm_mday := 0;
    tm_mon := 0;
    tm_year := 0;
    tm_wday := 0;
    tm_yday := 0;
    tm_isdst := 0;
  end;
end;

function IncDate(var Value : TISC_TIMESTAMP): PISC_TIMESTAMP; cdecl; export;
  var
    tm_res, tm_src: TCTIME;
    dd_dest: TDateTime;
    yy, mm, dd: Word;
begin
  InitCTime(tm_res);
  isc_decode_timestamp(@Value, @tm_src);
  dd_dest := EncodeDate(tm_src.tm_year + 1900, tm_src.tm_mon + 1, tm_src.tm_mday) + 1;
  DecodeDate(dd_dest, yy, mm, dd);
  with tm_res do begin
    tm_year := yy - 1900;
    tm_mon := mm - 1;
    tm_mday := dd;
    tm_isdst := tm_src.tm_isdst;
  end;

  Result := ib_util_malloc(SizeOf(TISC_TIMESTAMP));

  isc_encode_timestamp(@tm_res, Result);
end;

function ExtractDate(var Value : TISC_TIMESTAMP): PISC_TIMESTAMP; cdecl; export;
  var
    tm_res, tm_src: TCTIME;
begin
  InitCTime(tm_res);
  isc_decode_timestamp(@Value, @tm_src);
  with tm_res do begin
    tm_year := tm_src.tm_year;
    tm_mon := tm_src.tm_mon;
    tm_mday := tm_src.tm_mday;
    tm_isdst := tm_src.tm_isdst;
  end;

  Result := ib_util_malloc(SizeOf(TISC_TIMESTAMP));

  isc_encode_timestamp(@tm_res, Result);
end;

function Now: PISC_TIMESTAMP; cdecl; export;
  var
    d, m, y, h, mm, s, ms: Word;
    tm_res: TCTIME;
begin
  DecodeDateTime(SysUtils.Now, y, m, d, h, mm, s, ms);
  InitCTime(tm_res);
  with tm_res do begin
    tm_year := y - 1900;
    tm_mon := m - 1;
    tm_mday := d;
    tm_hour := h;
    tm_min := mm;
    tm_sec := s;
  end;

  Result := ib_util_malloc(SizeOf(TISC_TIMESTAMP));

  isc_encode_timestamp(@tm_res, Result);
end;

end.
