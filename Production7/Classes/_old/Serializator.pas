{$I ok_sklad.inc}
{------------------------------------------------------------------------------
 Import/Export with tight bound to TMetaClasses

 todo:
   should be meta for this with descends that performs bin/xml import/export and one for server/client connection
   
------------------------------------------------------------------------------}
unit Serializator;

interface

uses
  Classes, xLngManager;

type
  // see vtInt, etc... constants below
  TSerializatorTypes = (SerTypeError = 0, SerTypeInt = 10, SerTypeExt = 11, SerTypeStr = 12, SerTypeWStr = 13, SerTypeInt64 = 14, SerTypeDate = 15);

  TSerializator = class
    private
      FStream: TStream;
      FmyStream: Boolean;
      FreadMode: Boolean; // True in deSerialization state
      FError: Integer;

      FSectionName: String; // name of current section
      FSectionBegin, FNextSection: Int64; // offsets in stream
      FcurrentID: String; // current prop Id

      procedure internalPutStr(const AType: Byte; const v: AnsiString);

      procedure propPutInt(const v: Integer);
      procedure propPutExt(const v: Extended);
      procedure propPutStr(const v: AnsiString);
      procedure propPutWStr(const v: WideString);
      procedure propPutDateTime(const v: TDateTime);
      procedure propPutStream(const v: TMemoryStream);

      procedure setCurrentID(AID: String);
      function loadSection: boolean;

    public
      constructor Create; overload;
      constructor Create(const stream: TStream); overload;
      destructor Destroy; override;
      destructor Free;

      procedure Clear(const stream: TStream);

      function CheckAll: Boolean; // check CRC (and validity possible) of all stream
      function CheckSection: Boolean; // --"-- for current section

      procedure putHeader;
      function getHeader: Boolean;

      procedure BeginSection(const Sname: String); // begins section on the serialization process
      procedure EndSection; // ends current section on serialization process

      function SkipSection: Boolean; // False if there is no next section
      function SkipProp: Boolean; // False if there is no next prop in current section
      function gotoSectionStart: Boolean; // False if there is no section(s) yet

      function FindProp(const AID: String; const CurrSecOnly: Boolean): Boolean;

      procedure PutInt(const AID: String; const v: Integer);
      function GetInt: Integer;

      procedure PutExt(const AID: String; const v: Extended);
      function GetExt: Extended;

      procedure PutStr(const AID: String; const v: AnsiString);
      function GetStr: AnsiString;

      procedure PutWStr(const AID: String; const v: WideString);
      function GetWStr: WideString;

      procedure PutDateTime(const AID: String; const v: TDateTime);
      function GetDateTime: TDateTime;

      procedure PutStream(const AID: String; const v: TMemoryStream);
      function GetStream: TMemoryStream;

      function getErrorText(lm: TxLngManager): String;

      function GetType: TSerializatorTypes;

    published
      property Error: Integer read FError;

      property ID: String read FCurrentID write setCurrentId;
      property PropType: TSerializatorTypes read GetType;
      property SectionName: String read FSectionName write BeginSection;

      property Int: Integer read GetInt write propPutInt;
      property Ext: Extended read GetExt write propPutExt;
      property Str: AnsiString read GetStr write propPutStr;
      property WStr: WideString read GetWStr write propPutWStr;
      property DateTime: TDateTime read GetDateTime write propPutDateTime;
      property Stream: TMemoryStream read GetStream write propPutStream;

  end;

//==============================================================================================
implementation

uses
  Windows, synacode {for CRC32}, SysUtils, WinSock;

type
  Sheader = packed record
    Sync: Byte;
    crc: Integer;

    case crcdata: Boolean of
      False: (
         pMaj, pMin: Byte;
      );

      True: ( buf: array [0..2] of Byte; ); // to calculate crc easily
  end; // Sheader

const
  protoMajor = 1; // major and minor protocol versions
  protoMinor = 0;

  vtHeader = $80;
  vtSectionBegin = $01;
  vtSectionEnd   = $02;
  vtID = $04;

  vtInt  = 10;
  vtExt  = 11;
  vtStr  = 12;
  vtWStr = 13;
  vtInt64= 14;
  vtDateTime = 15;

  errNoError = 0;
  errHeaderVerMismatch = 1;
  errBadSection = 2;
  errBadSectionName = 3;
  errBadData = 4;
  errPropTypeMismatch = 5;
  errBadIntProp = 6;
  errBadExtProp = 7;
  errBadStrProp = 8;
  errBadWStrProp = 9;
  errBadDTProp = 10;
  errNoHeaderID = 11;
  errHeaderCRC = 12;

//==============================================================================================
function TSerializator.getErrorText(lm: TxLngManager): String;
begin
  Result := lm.GetRS('Serializator', 'err' + IntToStr(Ferror)); 
end;

//==============================================================================================
procedure TSerializator.Clear(const stream: TStream);
  var
    buf: array [0..4] of Byte;
begin
  Ferror := 0;

  if FmyStream then begin
    if Stream <> nil then begin
      Fstream.Free;
      Fstream := Stream;
      FmyStream := False;
    end
    else FStream.Size := 0;
  end
  else begin // external stream
    if Stream <> nil
      then FStream := Stream
      else begin
        FStream := TMemoryStream.Create;
        FmyStream := True;
      end;
  end;

  FStream.Position := 0;
  FreadMode := (Fstream.Size > 0);

  if FreadMode then begin
    getHeader;
    if Ferror = 0 then loadSection;
  end
  else begin
    FSectionName := '';
    FSectionBegin := -1;
    FcurrentID := '';
  end;
end;

//==============================================================================================
constructor TSerializator.Create;
begin
  FmyStream := False;
  Clear(nil); // let it create new stream
end;

//==============================================================================================
constructor TSerializator.Create(const stream: TStream);
begin
  FmyStream := False;
  Clear(Stream);
end;

//==============================================================================================
destructor TSerializator.Destroy;
begin
  if FmyStream then FStream.Free;
  inherited;
end;

//==============================================================================================
destructor TSerializator.Free;
begin
  Destroy;
end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
function TSerializator.loadSection: Boolean;
  var
    buf: array[0..3] of Byte;
begin
  Ferror := 0;

  Result := False;

  FSectionBegin := FStream.Position;

  // we need at least section name size + crc + next sec offset
  if FStream.Size - FStream.Position < 11 then begin FError := errBadSection; Exit; end;

  FStream.Read(buf, 1);
  if buf[0] <> vtSectionBegin then begin FError := errBadSection; Exit; end;

  FSectionName := getStr;
  if FError > 0 then begin FError := errBadSectionName; Exit; end;

  Result := True;
end;

//==============================================================================================
// used to put user strings and also the IDs of props etc...
procedure TSerializator.internalPutStr(const AType: Byte; const v: AnsiString);
  var
    vs: Byte;
    len, buf: Cardinal;
begin
  Ferror := 0;

  if AType <> vtStr then begin
    vs := AType;
    FStream.write(vs, 1);
    if AType = vtID then FCurrentID := '';
  end;

  vs := vtStr;
  FStream.Write(vs, 1);

  len := Length(v);
  buf := htonl(len);
  FStream.Write(buf, sizeof(buf));
  if len > 0 then FStream.Write(v, Len);
end;

//==============================================================================================
procedure TSerializator.propPutInt(const v: Integer);
  var
    val: String;
    vs: Byte;
begin
  Ferror := 0;

  if FSectionBegin = -1 then BeginSection('');
  internalPutStr(vtID, FCurrentID);

  vs := vtInt; Fstream.Write(vs, 1);
  val := IntToStr(v);
  vs := Length(val); Fstream.Write(vs, 1);
  Fstream.Write(val, vs);
end;

//==============================================================================================
procedure TSerializator.propPutExt(const v: Extended);
  var
    val: String;
    vs: Byte;
begin
  Ferror := 0;

  if FSectionBegin = -1 then BeginSection('');
  internalPutStr(vtID, FCurrentID);

  vs := vtExt;
  Fstream.Write(vs, 1);
  val := FloatToStr(v);
  vs := Length(val);
  Fstream.Write(vs, 1);

  Fstream.Write(val, vs);
end;

//==============================================================================================
procedure TSerializator.propPutStr(const v: AnsiString);
begin
  Ferror := 0;

  if FSectionBegin = -1 then BeginSection('');

  internalPutStr(vtID, FCurrentID);
  internalPutStr(vtStr, v);
end;

//==============================================================================================
procedure TSerializator.propPutWStr(const v: WideString);
  var
    vs: Byte;
    len, buf: Cardinal;
begin
  Ferror := 0;

  if FSectionBegin = -1 then BeginSection('');
  internalPutStr(vtID, FCurrentID);

  vs := vtWStr; Fstream.Write(vs, 1);
  len := Length(v) * 2;
  buf := htonl(len);
  Fstream.Write(buf, sizeof(buf));
  if len > 0 then Fstream.Write(v, Len);
end;

//==============================================================================================
procedure TSerializator.propPutDateTime(const v: TDateTime);
  var
    val: String;
    vs: Byte;
begin
  Ferror := 0;

  if FSectionBegin = -1 then BeginSection('');
  internalPutStr(vtID, FCurrentID);

  vs := vtDateTime;
  Fstream.Write(vs, 1);
  val := FloatToStr(v);
  vs := Length(val);
  Fstream.Write(vs, 1);

  Fstream.Write(val, vs);
end;

//==============================================================================================
procedure TSerializator.propPutStream(const v: TMemoryStream);
begin
end;

//==============================================================================================
procedure TSerializator.setCurrentID(AID: String);
begin
  Ferror := 0;

  FCurrentID := AID;
end;

//==============================================================================================
function TSerializator.CheckAll: Boolean; // check CRC (and validity possible) of all stream
begin
  Ferror := 0;

  Result := True;
end;

//==============================================================================================
function TSerializator.CheckSection: Boolean; // --"-- for current section
begin
  Ferror := 0;

  Result := True;
end;

//==============================================================================================
procedure TSerializator.putHeader;
  var
    h: Sheader;
    i: Integer;
begin
  Ferror := 0;

  h.Sync := vtHeader;
  h.pMaj := protoMajor;
  h.pMin := protoMinor;

  h.crc := Integer($FFFFFFFF);
  for i := 0 to High(h.buf) do h.crc := UpdateCrc32(h.buf[i], h.crc);
  h.crc := htonl(h.crc);

  FStream.Write(h, sizeof(h));
  FSectionBegin := FStream.Position;
end;

//==============================================================================================
function TSerializator.getHeader: Boolean;
  var
    h: Sheader;
    i,crc: Integer;
begin
  Ferror := 0;
  Result := False;

  Fstream.Read(h, sizeof(h));

  if h.Sync <> vtHeader then begin Ferror := errNoHeaderID; Exit; end;
  if (h.pMaj <> protoMajor) or (h.pMin <> protoMinor) then begin Ferror := errHeaderVerMismatch; Exit; end;

  crc := Integer($FFFFFFFF);
  for i := 0 to High(h.buf) do crc := UpdateCrc32(h.buf[i], crc);

  if crc <> ntohl(h.crc) then begin Ferror := errHeaderCRC; Exit; end;

  FSectionBegin := FStream.Position;
  Result := True;
end;

//==============================================================================================
procedure TSerializator.BeginSection(const Sname: String); // begins section on the serialization process
  var
    buf: array[0..3] of Byte;
begin
  Ferror := 0;

  if FSectionBegin = -1
    then putHeader
    else EndSection;

  FStream.Write(buf, 4); // reserve space for crc32
  FStream.Write(buf, 4); // reserve space for ptr to the next section

  internalPutStr(vtSectionBegin, Sname);
end;

//==============================================================================================
procedure TSerializator.EndSection; // ends current section on serialization process
  const
    bSize = 64;
  var
    buf: array [1..bSize] of Byte;
    pos, oldpos: Int64;
    crc: Integer;
    nextsec: Cardinal;
begin
  Ferror := 0;

  oldpos := FStream.Position;

  if FSectionBegin > -1 then begin // finalizing
    // do crc32
    crc := Integer($FFFFFFFF);

    pos := Fstream.Seek(FsectionBegin, soBeginning);

    while pos < oldpos do begin // todo 5 -coptimize: optimize this with larger buffer
      if (pos < FSectionBegin) or (pos > FSectionBegin + 8) then begin
        Fstream.Read(buf, 1);
        crc := UpdateCrc32(buf[1], crc);
      end;

      inc(pos);
    end;

    crc := htonl(crc);
    Fstream.Seek(FSectionBegin, soBeginning);
    FStream.Write(crc, 4);
    // end CRC32

    // setting ptr to the next section
    nextsec := htonl(oldpos - FSectionBegin);
    FStream.Write(nextsec, 4);
  end;

  FsectionBegin := Fstream.Seek(oldpos, soBeginning);
end;

//==============================================================================================
function TSerializator.SkipSection: Boolean;
  var
    ns: Cardinal;
begin
  Ferror := 0;

  Result := False;
  if FSectionBegin = -1 then Exit;

  Fstream.Seek(FSectionBegin + 4, soBeginning);
  FStream.Read(ns, 4);
  ns := ntohl(ns);
  if (ns = 0) or (ns > FStream.Size) then Exit;

  FsectionBegin := Fstream.Seek(ns, soBeginning);
  Result := loadSection;
end;

//==============================================================================================
function TSerializator.SkipProp: Boolean;
begin
  Ferror := 0;

  Result := False;
end;

//==============================================================================================
function TSerializator.gotoSectionStart: Boolean;
begin
  Ferror := 0;

  Result := False;

  if FSectionBegin = -1 then Exit;

  Fstream.Seek(FSectionBegin, soBeginning);

  Result := True;
end;

//==============================================================================================
function TSerializator.FindProp(const AID: String; const CurrSecOnly: Boolean): Boolean;
begin
  Ferror := 0;

  Result := False;
end;

//==============================================================================================
procedure TSerializator.PutInt(const AID: String; const v: Integer);
begin
  Ferror := 0;

  ID := AID;
  propPutInt(v);
end;

//==============================================================================================
function TSerializator.GetInt: Integer;
  var
    n: Byte;
    v: Integer;
begin
  Ferror := 0;

  Result := 0;

  if 1 <> FStream.Read(n, 1) then begin FError := errPropTypeMismatch; Exit; end;

  if 4 <> FStream.Read(v, 4) then begin FError := errBadData; Exit; end;

  Result := ntohl(v);
end;

//==============================================================================================
procedure TSerializator.PutExt(const AID: String; const v: Extended);
begin
  Ferror := 0;

  ID := AID;
  propPutExt(v);
end;

//==============================================================================================
function TSerializator.GetExt: Extended;
  var
    n: Byte;
    size: Byte;
    str: AnsiString;
begin
  Ferror := 0;

  Result := 0;

  if 1 <> FStream.Read(n, 1) then begin FError := errBadData; Exit; end;

  if n <> vtExt then begin FError := errPropTypeMismatch; Exit; end;

  if 1 <> FStream.Read(size, 1) then begin FError := errBadData; Exit; end;

  setLength(str, size);
  if size <> FStream.Read(str, size) then begin FError := errBadData; Exit; end;

  try
    Result := StrToFloat(str);
  except
    FError := errBadExtProp;
    Result := 0.0;
    Exit;
  end;
end;

//==============================================================================================
procedure TSerializator.PutStr(const AID: String; const v: AnsiString);
begin
  Ferror := 0;

  ID := AID;
  propPutStr(v);
end;

//==============================================================================================
function TSerializator.GetStr: AnsiString;
  var
    n: Byte;
    size: Integer;
    str: AnsiString;
begin
  Ferror := 0;

  if 1 <> FStream.Read(n, 1) then begin FError := errBadData; Exit; end;

  if n <> vtStr then begin FError := errPropTypeMismatch; Exit; end;

  if 4 <> FStream.Read(size, 4) then begin FError := errBadData; Exit; end;
  size := ntohl(size);
  if size < 0 {or (size > FStream.Size - FStream.Position + 1)} then begin FError := errBadData; Exit; end;

  setLength(str, size);
  if size <> FStream.Read(str, size) then begin FError := errBadData; Exit; end;

  Result := str;
end;

//==============================================================================================
procedure TSerializator.PutWStr(const AID: String; const v: WideString);
begin
  Ferror := 0;

  ID := AID;
  propPutWStr(v);
end;

//==============================================================================================
function TSerializator.GetWStr: WideString;
  var
    n: Byte;
    size: Integer;
    str: WideString;
begin
  Ferror := 0;

  if 1 <> FStream.Read(n, 1) then begin FError := errBadData; Exit; end;

  if n <> vtWStr then begin FError := errPropTypeMismatch; Exit; end;

  if 4 <> FStream.Read(size, 4) then begin FError := errBadData; Exit; end;
  size := ntohl(size);
  if size < 0 {or (not size > FStream.Size - FStream.Position + 1)} then begin FError := errBadData; Exit; end;

  setLength(str, size div 2);
  if size <> FStream.Read(str, size) then begin FError := errBadData; Exit; end;

  Result := str;
end;

//==============================================================================================
procedure TSerializator.PutDateTime(const AID: String; const v: TDateTime);
begin
  Ferror := 0;

  ID := AID;
  propPutDateTime(v);
end;

//==============================================================================================
function TSerializator.GetDateTime: TDateTime;
  var
    n: Byte;
    size: Byte;
    str: AnsiString;
begin
  Ferror := 0;

  Result := 0;

  if 1 <> FStream.Read(n, 1) then begin FError := errBadData; Exit; end;

  if n <> vtDateTime then begin FError := errPropTypeMismatch; Exit; end;

  if 1 <> FStream.Read(size, 1) then begin FError := errBadData; Exit; end;

  setLength(str, size);
  if size <> FStream.Read(str, size) then begin FError := errBadData; Exit; end;

  try
    Result := StrToFloat(str);
  except
    FError := errBadDTProp;
    Result := 0.0;
    Exit;
  end;
end;

//==============================================================================================
procedure TSerializator.PutStream(const AID: String; const v: TMemoryStream);
begin
end;

//==============================================================================================
function TSerializator.GetStream: TMemoryStream;
begin
  Result := nil;
end;

//==============================================================================================
function TSerializator.GetType: TSerializatorTypes;
  var
    n: Byte;
begin
  Ferror := 0;
  
  if 1 <> FStream.Read(n, 1) then begin
    FError := errBadData;
    Result := SerTypeError;
    Exit;
  end;

  Result := TSerializatorTypes(n);
  FStream.seek(-1, soFromCurrent);
end;

end.

