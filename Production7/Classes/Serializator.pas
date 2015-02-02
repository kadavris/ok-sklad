{$I ok_sklad.inc}
{------------------------------------------------------------------------------
 Import/Export with tight bound to TMetaClass*
 v1.0 - AP

 todo:
   should be meta for this with descends that performs bin/xml import/export and one for server/client connection

------------------------------------------------------------------------------}
unit Serializator;

interface

uses
  Classes, xLngManager, XMLDoc, XMLIntf;

const
  // find mode bit flags
  SerFindCurSection  = 1;
  SerFindSubSections = 2;
  SerFindTopSections = 4;
  SerFindSpanSections = SerFindCurSection + SerFindSubSections + SerFindTopSections;

  SerFindSubClasses  = $100;
  SerFindSiblingClasses = $101;
  SerFindSpanClasses = SerFindSubClasses + SerFindSiblingClasses;

  SerFindAnywhere = SerFindSpanClasses + SerFindSpanSections;


type
  // see vtInt, etc... constants below
  TSerializatorTypes = (SerTypeError = 0, SerTypeInt = 10, SerTypeExt = 11, SerTypeStr = 12, SerTypeWStr = 13,
                        SerTypeInt64 = 14, SerTypeDate = 15, SerTypeBool = 16);

  TSerializatorStates = (SerStateWriting, // write mode.
                         SerStateInit, // empty
                         SerStateBOF, SerStateEOF, SerStateClassBegin, SerStateClassEnd, SerStateSectionBegin, SerStateSectionEnd,
                         SerStateInSection, // used for SectionState func to determine position in given section
                         SerStateVar // variable. default. can be combined with class/section states above
                         );

  TSerializatorState = set of TSerializatorStates;


  // base class.
  TSerializator = class
    protected
      FStream: TStream;
      FmyStream: Boolean;
      FreadMode: Boolean; // True in deSerialization state
      FError: Integer;
      FCurrentID: String; //current data element ID
      FClassName: String; //current class
      Flevel: Integer; // current nesting level

      FSections, Fclasses: TStringList; // ierarchy of sections/classes on read

      procedure internalInit; virtual;

      procedure propPutBool(const v: Boolean);
      procedure propPutDateTime(const v: TDateTime);
      procedure propPutExt(const v: Extended);
      procedure propPutInt(const v: Integer);
      procedure propPutInt64(const v: Int64);
      procedure propPutStr(const v: AnsiString);
      procedure propPutStream(const v: TMemoryStream);
      procedure propPutWStr(const v: WideString);

      function  propGetSectionName: String; virtual; abstract;
      function  propGetState: TSerializatorState; virtual; abstract;

      procedure setCurrentID(AID: String);

    public
      constructor Create(const ForExport: Boolean = True; stream: TStream = nil); overload; virtual;
      constructor Create(AString: String); overload;  virtual;// quick-import setup
      destructor  Destroy; virtual;

      procedure Clear; virtual;

      procedure setStream(AStream: TStream);

      function  CheckAll: Boolean; // check CRC (and validity possible) of all stream
      function  CheckSection: Boolean; // --"-- for current section

      procedure Start; virtual; abstract; // start whole process
      procedure Finish; virtual; abstract; // finish serialization process

      procedure BeginClass(const Cname: String); virtual; abstract; // begins new class. autoclosin prevoius sections,etc
      procedure EndClass; virtual; abstract;
      procedure BeginSection(const Sname: String); virtual; abstract; // begins section in class
      procedure EndSection(Sname: String = ''); virtual; abstract;   // ends current section in class

      function  SkipClass: Boolean; virtual; abstract; // False if there is no next class
      function  SkipSection: Boolean; virtual; abstract; // False if there is no next section
      function  NextVar: Boolean; virtual; abstract; // False if there is no next Var in current section
      function  gotoClassStart: Boolean; virtual; abstract; // False if there is no classes yet
      function  gotoSectionStart: Boolean; virtual; abstract; // False if there is no section(s) yet

      function  FindVar(const AID: String; Mode: Integer): Boolean; virtual; abstract;
      function  SectionState(Aname: string): TSerializatorState; virtual; abstract;

      procedure PutBool(const AID: String; const v: Boolean); virtual; abstract;
      function  GetBool: Boolean; virtual; abstract;
      procedure PutDateTime(const AID: String; const v: TDateTime); virtual; abstract;
      function  GetDateTime: TDateTime; virtual; abstract;
      procedure PutExt(const AID: String; const v: Extended); virtual; abstract;
      function  GetExt: Extended; virtual; abstract;
      procedure PutInt(const AID: String; const v: Integer); virtual; abstract;
      function  GetInt: Integer; virtual; abstract;
      procedure PutInt64(const AID: String; const v: Int64); virtual; abstract;
      function  GetInt64: Int64; virtual; abstract;
      procedure PutStr(const AID: String; const v: AnsiString); virtual; abstract;
      function  GetStr: AnsiString; virtual; abstract;
      //procedure PutStream(const AID: String; const v: TMemoryStream); virtual; abstract;
      //function  GetStream: TMemoryStream; virtual; abstract;
      procedure PutWStr(const AID: String; const v: WideString); virtual; abstract;
      function  GetWStr: WideString; virtual; abstract;

      function getErrorText(lm: TxLngManager): String;

      function GetType: TSerializatorTypes; virtual; abstract;

    published
      property Error: Integer read FError;

      property ID: String read FCurrentID write setCurrentId;
      property PropType: TSerializatorTypes read GetType;
      property SectionName: String read propGetSectionName write BeginSection;
      property State: TSerializatorState read propGetState;

      property Bool: Boolean read GetBool write propPutBool;
      property DateTime: TDateTime read GetDateTime write propPutDateTime;
      property Ext: Extended read GetExt write propPutExt;
      property Int: Integer read GetInt write propPutInt;
      property Int64: Int64 read GetInt64 write propPutInt64;
      property Str: AnsiString read GetStr write propPutStr;
      //property Stream: TMemoryStream read GetStream write propPutStream;
      property WStr: WideString read GetWStr write propPutWStr;
  end;

//-----------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------
//- XML -----------------------------------------------------------------------------
//-----------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------
  TSerXMLPos = class // contains all needed data for some position in tree
    private
      FNode: IXMLNode;
      FSections: TStringList;

    public
      State: TSerializatorState;

      constructor Create(ANode: IXMLNode);
      destructor  Destroy;

    published
      property Node: IXMLNode read Fnode write FNode;
      property Sections: TStringList read FSections;
      //property State: TSerializatorState read FState write FState;
  end;

  //-------------------------------------------
  TSerXML = class(TSerializator)
    protected
      FPos: TSerXMLPos;
      FXMLDoc: IXMLDocument;

      procedure internalInit; override;
      procedure internalPutVar(const AType: Byte; val: AnsiString; vname: AnsiString = ''; Attrs: AnsiString = '');

      procedure propPutBool(const v: Boolean);
      procedure propPutDateTime(const v: TDateTime);
      procedure propPutExt(const v: Extended);
      procedure propPutInt(const v: Integer);
      procedure propPutInt64(const v: Int64);
      procedure propPutStr(const v: AnsiString);
      procedure propPutStream(const v: TMemoryStream);
      procedure propPutWStr(const v: WideString);

      function  propGetSectionName: String; override;
      function  propGetState: TSerializatorState; override;

      procedure setCurrentID(AID: String);

      // internal helpers for dealing with xml tree
      function  goNextNode(p: TSerXMLPos; mode: Integer = 0): Boolean;
      function  goNextSibling(p: TSerXMLPos; mode: Integer = 0): Boolean;
      function  goParentNode(p: TSerXMLPos; mode: Integer = 0): Boolean;

      function  getClassHeader: Boolean;
      function  internalSkipToNode(p: TSerXMLPos; ANodeName: WideString): Boolean;
      function  internalQuote(s: String): String;
      procedure internalSetState(pos: TSerXMLPos);

    public
      constructor Create(const ForExport: Boolean = True; stream: TStream = nil); overload; override;
      constructor Create(AString: String); overload; override; // quick-import setup
      destructor  Destroy; override;

      procedure Clear; override;

      //function  CheckAll: Boolean; // check CRC (and validity possible) of all stream
      //function  CheckSection: Boolean; // --"-- for current section

      procedure Start; override; // start whole process
      procedure Finish; override; // finish serialization process

      procedure BeginClass(const Cname: String); override; // begins new class. autoclosin prevoius sections,etc
      procedure EndClass; override;
      procedure BeginSection(const Sname: String); override; // begins section on the serialization process
      procedure EndSection(Sname: String = ''); override; // ends current section on serialization process

      function  SkipSection: Boolean; override; // False if there is no next section
      function  NextVar: Boolean; override; // False if there is no next Var in current section
      function  gotoSectionStart: Boolean; override; // False if there is no section(s) yet
      //function  gotoClassStart: Boolean; override; // False if there is no section(s) yet

      function  FindVar(const AID: String; Mode: Integer = SerFindSpanSections): Boolean; override;
      function  SectionState(Aname: string): TSerializatorState; override;

      procedure PutBool(const AID: String; const v: Boolean); override;
      function  GetBool: Boolean; override;
      procedure PutDateTime(const AID: String; const v: TDateTime); override;
      function  GetDateTime: TDateTime; override;
      procedure PutExt(const AID: String; const v: Extended); override;
      function  GetExt: Extended; override;
      procedure PutInt(const AID: String; const v: Integer); override;
      function  GetInt: Integer; override;
      procedure PutInt64(const AID: String; const v: Int64); override;
      function  GetInt64: Int64; override;
      procedure PutStr(const AID: String; const v: AnsiString); override;
      function  GetStr: AnsiString; override;
      //procedure PutStream(const AID: String; const v: TMemoryStream); override;
      //function  GetStream: TMemoryStream; override;
      procedure PutWStr(const AID: String; const v: WideString); override;
      function  GetWStr: WideString; override;

      //function getErrorText(lm: TxLngManager): String;

      function GetType: TSerializatorTypes; override;

    published
      property Error: Integer read FError;

      property ID: String read FCurrentID write setCurrentId;
      property VarType: TSerializatorTypes read GetType;
      property SectionName: String read propGetSectionName write BeginSection;

      property Bool: Boolean read GetBool write propPutBool;
      property Ext: Extended read GetExt write propPutExt;
      property Int: Integer read GetInt write propPutInt;
      property Int64: Int64 read GetInt64 write propPutInt64;
      property Str: AnsiString read GetStr write propPutStr;
      property WStr: WideString read GetWStr write propPutWStr;
      property DateTime: TDateTime read GetDateTime write propPutDateTime;
      //property Stream: TMemoryStream read GetStream write propPutStream;
  end;

  //-----------------------------------------------------------------------------------
  //-----------------------------------------------------------------------------------
  //-----------------------------------------------------------------------------------
  (*
  TSerBIN = class(TSerializator)
    protected
      FNode, FSection: IXMLNode;
      FXMLDoc: IXMLDocument;

      procedure internalPutStr(const AType: Byte; const v: AnsiString);

      procedure propPutInt(const v: Integer);
      procedure propPutExt(const v: Extended);
      procedure propPutStr(const v: AnsiString);
      procedure propPutWStr(const v: WideString);
      procedure propPutDateTime(const v: TDateTime);
      procedure propPutStream(const v: TMemoryStream);

      procedure setCurrentID(AID: String);
      function  loadSection: boolean;

    public
      constructor Create(const ForExport = True; stream: TStream = nil); overload; override;
      constructor Create(AString: String); overload; override; // quick-import setup
      destructor  Destroy; override;

      procedure Clear; override;

      function  CheckAll: Boolean; // check CRC (and validity possible) of all stream
      function  CheckSection: Boolean; // --"-- for current section

      procedure Start; // start whole process
      procedure Finish; // finish serialization process

      procedure BeginSection(const Sname: String); // begins section on the serialization process
      procedure EndSection(const Sname: String); // ends current section on serialization process

      function  SkipSection: Boolean; // False if there is no next section
      function  NextVar: Boolean; // False if there is no next Var in current section
      function  gotoSectionStart: Boolean; // False if there is no section(s) yet

      function  FindVar(const AID: String; const CurrSecOnly: Boolean): Boolean;

      procedure PutInt(const AID: String; const v: Integer);
      function  GetInt: Integer;

      procedure PutExt(const AID: String; const v: Extended);
      function  GetExt: Extended;

      procedure PutStr(const AID: String; const v: AnsiString);
      function  GetStr: AnsiString;

      procedure PutWStr(const AID: String; const v: WideString);
      function  GetWStr: WideString;

      procedure PutDateTime(const AID: String; const v: TDateTime);
      function  GetDateTime: TDateTime;

      //procedure PutStream(const AID: String; const v: TMemoryStream);
      //function  GetStream: TMemoryStream;

      function getErrorText(lm: TxLngManager): String;

      function GetType: TSerializatorTypes;

    published
      property Error: Integer read FError;

      property ID: String read FCurrentID write setCurrentId;
      property VarType: TSerializatorTypes read GetType;
      property SectionName: String read FSectionName write BeginSection;

      property Int: Integer read GetInt write propPutInt;
      property Ext: Extended read GetExt write propPutExt;
      property Str: AnsiString read GetStr write propPutStr;
      property WStr: WideString read GetWStr write propPutWStr;
      property DateTime: TDateTime read GetDateTime write propPutDateTime;
      //property Stream: TMemoryStream read GetStream write propPutStream;
  end; // TSerBIN
*)

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  Windows, synacode {for CRC32}, SysUtils, WinSock, ssStrUtil;

const
  BinHeaderTag: String = 'AP'#19#72;
  mimeHeaderTag: String = 'A1P9S7E2R';
  vtHeader: Byte = $80;
  vtSectionBegin: Byte = $01;
  vtSectionEnd: Byte   = $02;
  vtID: Byte = $04;

  vtInt: Byte  = 10;
  vtExt: Byte  = 11;
  vtStr: Byte  = 12;
  vtWStr: Byte = 13;
  vtInt64: Byte = 14;
  vtDateTime: Byte = 15;
  vtBool: Byte = 16;

  xmlTypes: array[10..16] of String = ('i', 'e', 's', 'w', 'i64', 'd', 'b'); // vtXXX mapping to char

  // *** common constants
  errNoError = 0;
  errHeaderVerMismatch = 1;
  errBadSection = 2;
  errBadSectionName = 3;
  errBadData = 4;
  errVarTypeMismatch = 5;
  errBadIntVar = 6;
  errBadExtVar = 7;
  errBadStrVar = 8;
  errBadWStrVar = 9;
  errBadDTVar = 10;
  errNoHeaderID = 11;
  errHeaderCRC = 12;
  errBadXMLData = 13;

//==============================================================================================
function TSerializator.getErrorText(lm: TxLngManager): String;
begin
  Result := lm.GetRS('Serializator', 'err' + IntToStr(Ferror));
end;

//==============================================================================================
procedure TSerializator.Clear;
begin
  Ferror := 0;
  FSections.Clear;
  FreadMode := False;

  if FmyStream
    then try
      FStream.Position := 0;
      FStream.Size := 0;

    except
      FmyStream := False;
      FStream := nil;
    end;
end;

//==============================================================================================
procedure TSerializator.internalInit;
begin
  FmyStream := False;
  FStream := nil;
  FSections := TStringList.Create;
  Fclasses := TStringList.Create;
end;

//==============================================================================================
constructor Tserializator.Create(AString: String); // quick-import setup
begin
  internalInit;
  setStream(nil);
  Clear;
  FStream.WriteBuffer(astring, Length(AString));
  FreadMode := True;
end;

//==============================================================================================
constructor TSerializator.Create(const ForExport: Boolean = True; stream: TStream = nil);
begin
  internalInit;
  setStream(stream);
  Clear;
  FreadMode := not ForExport;
end;

//==============================================================================================
destructor TSerializator.Destroy;
begin
  if FmyStream then FStream.Free;
  FSections.Free;
  inherited;
end;

//==============================================================================================
procedure TSerializator.setStream(AStream: TStream);
begin
  if FmyStream then begin
    if AStream = nil then Exit;
    FStream.Free;
  end;

  FmyStream := (AStream = nil);
  if AStream <> nil
    then FStream := AStream
    else FStream := TMemoryStream.Create;

  FCurrentID := '';
  FClassName := '';
  Flevel := 0;
end;

//==============================================================================================
procedure TSerializator.propPutBool(const v: Boolean);
begin
  Ferror := 0;
end;

//==============================================================================================
procedure TSerializator.propPutInt(const v: Integer);
begin
  Ferror := 0;
end;

//==============================================================================================
procedure TSerializator.propPutInt64(const v: Int64);
begin
  Ferror := 0;
end;

//==============================================================================================
procedure TSerializator.propPutExt(const v: Extended);
begin
  Ferror := 0;
end;

//==============================================================================================
procedure TSerializator.propPutStr(const v: AnsiString);
begin
  Ferror := 0;
end;

//==============================================================================================
procedure TSerializator.propPutWStr(const v: WideString);
begin
  Ferror := 0;
end;

//==============================================================================================
procedure TSerializator.propPutDateTime(const v: TDateTime);
begin
  Ferror := 0;
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
  Result := False;
end;

//==============================================================================================
function TSerializator.CheckSection: Boolean; // --"-- for current section
begin
  Ferror := 0;
  Result := False;
end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
// TSerBIN =====================================================================================
//==============================================================================================
//==============================================================================================
//==============================================================================================
const
  // *** binary serializator onstants
  protoMajor: Byte = 1; // major and minor protocol versions
  protoMinor: Byte = 0;

type
  Sheader = packed record // binary stream header
    Sync: array [0..3] of Char; // see HeaderTag
    protoMin, protoMaj: Byte;
    crc: Integer;

    case crcdata: Boolean of
      False: (
         pMaj, pMin: Byte;
      );

      True: ( buf: array [0..2] of Byte; ); // to calculate crc easily
  end; // Sheader

(*
procedure TSerBIN.Clear;
begin
  Ferror := 0;
  FManualMode := False;
  FSections.Clear;
  FSectionsTexts.Clear;
  FreadMode := False;

  if FmyStream
    then try
      FStream.Position := 0;
      FStream.Size := 0;

    except
      FmyStream := False;
      FStream := nil;
    end;
end;

//==============================================================================================
procedure TSerBIN.internalInit;
begin
  FmyStream := False;
  FStream := nil;
  FSections := TStringList.Create;
  FSectionsTexts := TStringList.Create;
end;

//==============================================================================================
constructor TSerBIN.Create(const ForExport = True; stream: TStream = nil);
begin
  internalInit;
  setStream(stream);
  Clear;
  FreadMode := not ForExport;
end;

//==============================================================================================
destructor TSerBIN.Destroy;
begin
  if FmyStream then FStream.Free;
  FSections.Free;
  FSectionsTexts.Free;
  inherited;
end;

//==============================================================================================
procedure TSerBIN.setStream(AStream: TStream);
begin
  if FmyStream then begin
    if AStream = nil then Exit;
    FStream.Free;
  end;

  FmyStream := (AStream = nil);
  if AStream <> nil
    then FStream := AStream
    else FStream := TMemoryStream.Create;
end;

//==============================================================================================
procedure TSerBIN.Start; // start whole process
begin
end;

//==============================================================================================
procedure TSerBIN.Finish; // finish serialization process
begin
end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
function TSerBIN.loadSection: Boolean;
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
// used to put user strings and also the IDs of Vars etc...
procedure TSerBIN.internalPutStr(const AType: Byte; const v: AnsiString);
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
procedure TSerBIN.propPutInt(const v: Integer);
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
procedure TSerBIN.propPutExt(const v: Extended);
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
procedure TSerBIN.propPutStr(const v: AnsiString);
begin
  Ferror := 0;

  if FSectionBegin = -1 then BeginSection('');

  internalPutStr(vtID, FCurrentID);
  internalPutStr(vtStr, v);
end;

//==============================================================================================
procedure TSerBIN.propPutWStr(const v: WideString);
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
procedure TSerBIN.propPutDateTime(const v: TDateTime);
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
procedure TSerBIN.propPutStream(const v: TMemoryStream);
begin
end;

//==============================================================================================
procedure TSerBIN.setCurrentID(AID: String);
begin
  Ferror := 0;

  FCurrentID := AID;
end;

//==============================================================================================
function TSerBIN.CheckAll: Boolean; // check CRC (and validity possible) of all stream
begin
  Ferror := 0;

  Result := True;
end;

//==============================================================================================
function TSerBIN.CheckSection: Boolean; // --"-- for current section
begin
  Ferror := 0;

  Result := True;
end;

//==============================================================================================
procedure TSerBIN.putHeader;
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
function TSerBIN.getHeader: Boolean;
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
procedure TSerBIN.BeginClass(const Cname: String); // begins new class. autoclosin prevoius sections,etc
begin
  FClassName := CName;
end;

//==============================================================================================
procedure TSerBIN.EndClass;
begin
end;

//==============================================================================================
procedure TSerBIN.BeginSection(const Sname: String); // begins section on the serialization process
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
procedure TSerBIN.EndSection(const Sname: String); // ends current section on serialization process
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
function TSerBIN.SkipSection: Boolean;
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
function TSerBIN.NextVar: Boolean;
begin
  Ferror := 0;

  Result := False;
end;

//==============================================================================================
function TSerBIN.gotoSectionStart: Boolean;
begin
  Ferror := 0;

  Result := False;

  if FSectionBegin = -1 then Exit;

  Fstream.Seek(FSectionBegin, soBeginning);

  Result := True;
end;

//==============================================================================================
function TSerBIN.FindVar(const AID: String; const CurrSecOnly: Boolean): Boolean;
begin
  Ferror := 0;

  Result := False;
end;

//==============================================================================================
procedure TSerBIN.PutInt(const AID: String; const v: Integer);
begin
  Ferror := 0;

  ID := AID;
  propPutInt(v);
end;

//==============================================================================================
function TSerBIN.GetInt: Integer;
  var
    n: Byte;
    v: Integer;
begin
  Ferror := 0;

  Result := 0;

  if 1 <> FStream.Read(n, 1) then begin FError := errVarTypeMismatch; Exit; end;

  if 4 <> FStream.Read(v, 4) then begin FError := errBadData; Exit; end;

  Result := ntohl(v);
end;

//==============================================================================================
procedure TSerBIN.PutExt(const AID: String; const v: Extended);
begin
  Ferror := 0;

  ID := AID;
  propPutExt(v);
end;

//==============================================================================================
function TSerBIN.GetExt: Extended;
  var
    n: Byte;
    size: Byte;
    str: AnsiString;
begin
  Ferror := 0;

  Result := 0;

  if 1 <> FStream.Read(n, 1) then begin FError := errBadData; Exit; end;

  if n <> vtExt then begin FError := errVarTypeMismatch; Exit; end;

  if 1 <> FStream.Read(size, 1) then begin FError := errBadData; Exit; end;

  setLength(str, size);
  if size <> FStream.Read(str, size) then begin FError := errBadData; Exit; end;

  try
    Result := StrToFloat(str);
  except
    FError := errBadExtVar;
    Result := 0.0;
    Exit;
  end;
end;

//==============================================================================================
procedure TSerBIN.PutStr(const AID: String; const v: AnsiString);
begin
  Ferror := 0;

  ID := AID;
  propPutStr(v);
end;

//==============================================================================================
function TSerBIN.GetStr: AnsiString;
  var
    n: Byte;
    size: Integer;
    str: AnsiString;
begin
  Ferror := 0;

  if 1 <> FStream.Read(n, 1) then begin FError := errBadData; Exit; end;

  if n <> vtStr then begin FError := errVarTypeMismatch; Exit; end;

  if 4 <> FStream.Read(size, 4) then begin FError := errBadData; Exit; end;
  size := ntohl(size);
  if size < 0 {or (size > FStream.Size - FStream.Position + 1)} then begin FError := errBadData; Exit; end;

  setLength(str, size);
  if size <> FStream.Read(str, size) then begin FError := errBadData; Exit; end;

  Result := str;
end;

//==============================================================================================
procedure TSerBIN.PutWStr(const AID: String; const v: WideString);
begin
  Ferror := 0;

  ID := AID;
  propPutWStr(v);
end;

//==============================================================================================
function TSerBIN.GetWStr: WideString;
  var
    n: Byte;
    size: Integer;
    str: WideString;
begin
  Ferror := 0;

  if 1 <> FStream.Read(n, 1) then begin FError := errBadData; Exit; end;

  if n <> vtWStr then begin FError := errVarTypeMismatch; Exit; end;

  if 4 <> FStream.Read(size, 4) then begin FError := errBadData; Exit; end;
  size := ntohl(size);
  if size < 0 {or (not size > FStream.Size - FStream.Position + 1)} then begin FError := errBadData; Exit; end;

  setLength(str, size div 2);
  if size <> FStream.Read(str, size) then begin FError := errBadData; Exit; end;

  Result := str;
end;

//==============================================================================================
procedure TSerBIN.PutDateTime(const AID: String; const v: TDateTime);
begin
  Ferror := 0;

  ID := AID;
  propPutDateTime(v);
end;

//==============================================================================================
function TSerBIN.GetDateTime: TDateTime;
  var
    n: Byte;
    size: Byte;
    str: AnsiString;
begin
  Ferror := 0;

  Result := 0;

  if 1 <> FStream.Read(n, 1) then begin FError := errBadData; Exit; end;

  if n <> vtDateTime then begin FError := errVarTypeMismatch; Exit; end;

  if 1 <> FStream.Read(size, 1) then begin FError := errBadData; Exit; end;

  setLength(str, size);
  if size <> FStream.Read(str, size) then begin FError := errBadData; Exit; end;

  try
    Result := StrToFloat(str);
  except
    FError := errBadDTVar;
    Result := 0.0;
    Exit;
  end;
end;

//==============================================================================================
procedure TSerBIN.PutStream(const AID: String; const v: TMemoryStream);
begin
end;

//==============================================================================================
function TSerBIN.GetStream: TMemoryStream;
begin
  Result := nil;
end;

//==============================================================================================
function TSerBIN.GetType: TSerBINTypes;
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
*)

//==============================================================================================
//==============================================================================================
//==============================================================================================
// TSerXML =====================================================================================
//==============================================================================================
//==============================================================================================
//==============================================================================================
constructor TSerXMLPos.Create(ANode: IXMLNode);
begin
  FSections := tstringlist.create;
end;

//==============================================================================================
destructor  TSerXMLPos.Destroy;
begin
  FSections.free;
end;

//==============================================================================================
procedure TSerXML.Clear;
begin
  inherited;

  FPos.Node := nil;
  FPos.Sections.Clear;
  FXMLDoc := nil;
end;

//==============================================================================================
procedure TSerXML.internalInit;
begin
  inherited;
  FPos := TSerXMLPos.Create(nil);
end;

//==============================================================================================
constructor TSerXML.Create(AString: String); // quick-import setup
begin
  internalInit;

  try
    FXMLDoc := LoadXMLData(AString);
    FPos.Node := FXMLDoc.DocumentElement.ChildNodes.First;

  except
    FError := errBadXMLData;
  end;
end;

//==============================================================================================
constructor TSerXML.Create(const ForExport: Boolean = True; stream: TStream = nil);
begin
  internalInit;
  setStream(stream);
  Clear;
  FXMLDoc := TXMLDocument.Create(nil);
  FreadMode := not ForExport;

  if FreadMode
    then try
      FXMLDoc.LoadFromStream(stream);
      FPos.Node := FXMLDoc.DocumentElement.ChildNodes.First;
      getClassHeader;

    except
      FError := errBadXMLData;
    end;
end;

//==============================================================================================
destructor TSerXML.Destroy;
begin
  Clear;

  inherited;
end;

//==============================================================================================
function  TSerXML.internalQuote(s: String): String;
  var
    i: Integer;
begin
  Result := '';
  for i := 1 to Length(s) do
    case s[i] of
      '<':  Result := Result + '&lt;';
      '>':  Result := Result + '&gt;';
      '&':  Result := Result + '&amp;';
      '''': Result := Result + '&apos;';
      '"':  Result := Result + '&quot;';
      else  Result := Result + s[i];
    end;
end;

//==============================================================================================
// used to put user strings and also the IDs of Vars etc...
procedure TSerXML.internalPutVar(const AType: Byte; val: AnsiString; vname: AnsiString = ''; Attrs: AnsiString = '');
  var
    s: String;
begin
  Ferror := 0;

  if vname = '' then vname := FCurrentID;
  s := StringOfChar(' ', Flevel * 2) + '<var name="' + vname + '" type="' + xmlTypes[AType] + '"' + Attrs + ' >' + internalQuote(val) + '</var>'#13#10;
  FStream.WriteBuffer(s, Length(s));
end;

//==============================================================================================
procedure TSerXML.propPutInt(const v: Integer);
begin
  internalPutVar(vtInt, IntToStr(v));
end;

//==============================================================================================
procedure TSerXML.propPutInt64(const v: Int64);
begin
  internalPutVar(vtInt64, IntToStr(v));
end;

//==============================================================================================
procedure TSerXML.propPutExt(const v: Extended);
begin
  internalPutVar(vtExt, FloatToStr(v));
end;

//==============================================================================================
procedure TSerXML.propPutStr(const v: AnsiString);
begin
  internalPutVar(vtStr, v);
end;

//==============================================================================================
procedure TSerXML.propPutWStr(const v: WideString);
begin
  internalPutVar(vtWStr, v);
end;

//==============================================================================================
procedure TSerXML.propPutDateTime(const v: TDateTime);
  var
    s: String;
begin
  DateTimeToString(s, 'yyyy-mm-dd hh:nn:ss', v);
  internalPutVar(vtDateTime, s);
end;

//==============================================================================================
procedure TSerXML.propPutBool(const v: Boolean);
begin
  internalPutVar(vtBool, BoolToStr(v));
end;

//==============================================================================================
procedure TSerXML.propPutStream(const v: TMemoryStream);
begin
  FError := 0;
end;

//==============================================================================================
procedure TSerXML.setCurrentID(AID: String);
begin
  Ferror := 0;

  FCurrentID := AID;
end;

//==============================================================================================
function  TSerXML.propGetState: TSerializatorState;
begin
  Result := Fpos.State;
end;

//==============================================================================================
function  TSerXML.SectionState(Aname: string): TSerializatorState;
begin

end;

//==============================================================================================
procedure TSerXML.internalSetState(pos: TSerXMLPos);
  var
    oldNode,pNode: IXMLNode;
    pName: String;
begin
  oldNode := pos.Node;
  pNode := pos.Node.ParentNode;
  pName := LowerCase(pNode.NodeName);

  if pName = 'class' then begin
    if pos.node = pNode.ChildNodes.First
      then Include(pos.State, SerStateClassBegin)
      else Exclude(pos.State, SerStateClassBegin);

    if pos.node = pNode.ChildNodes.Last
      then Include(pos.State, SerStateClassEnd)
      else Exclude(pos.State, SerStateClassEnd);
  end;

  if pName = 'section' then begin
    if pos.node = pNode.ChildNodes.First
      then Include(pos.State, SerStateSectionBegin)
      else Exclude(pos.State, SerStateSectionBegin);

    if pos.node = pNode.ChildNodes.Last
      then Include(pos.State, SerStateSectionEnd)
      else Exclude(pos.State, SerStateSectionEnd);
  end;

  pNode := oldNode.ParentNode;
  while pNode.ParentNode <> FXMLDoc.DocumentElement do pNode := pNode.ParentNode;
  if pNode = FXMLDoc.DocumentElement.ChildNodes.First
    then Include(pos.State, SerStateBOF)
    else Exclude(pos.State, SerStateBOF);

  if pNode = FXMLDoc.DocumentElement.ChildNodes.Last
    then Include(pos.State, SerStateEOF)
    else Exclude(pos.State, SerStateEOF);

  if FSections.Count > 0
    then Include(pos.State, SerStateInSection)
    else Exclude(pos.State, SerStateInSection);
end;

//==============================================================================================
function  TSerXML.goNextNode(p: TSerXMLPos; mode: Integer = 0): Boolean;
  var
    oldNode: IXMLNode;
begin
  Result := False;
  oldNode := p.Node;

  try
    if (p.node.ChildNodes <> nil) and (p.node.ChildNodes.Count > 0) then begin
      p.Node := p.Node.ChildNodes.First;
      if WideLowerCase(p.Node.NodeName) = 'section' then FSections.AddObject(p.Node.Attributes['name'], Pointer(p.Node));
      if WideLowerCase(p.Node.NodeName) = 'class'   then Fclasses.AddObject(p.Node.Attributes['name'], Pointer(p.Node));
      Result := True;
      Exit;
    end;

    Result := goNextSibling(p);
    if Result then Exit;

    Result := goParentNode(p);

  finally
    if not Result then p.Node := oldNode;
    internalSetState(p);
  end;
end;

//==============================================================================================
function  TSerXML.goNextSibling(p: TSerXMLPos; mode: Integer = 0): Boolean;
  var
    oldNode: IXMLNode;
begin
  Result := True;
  oldNode := p.Node;

  try
    p.Node := p.Node.NextSibling;
    if WideLowerCase(oldNode.NodeName) = 'section' then FSections.Delete(FSections.Count - 1);
    if WideLowerCase(p.Node.NodeName)  = 'section' then FSections.AddObject(p.Node.Attributes['name'], Pointer(p.Node));
    if WideLowerCase(oldNode.NodeName) = 'class' then Fclasses.Delete(Fclasses.Count - 1);
    if WideLowerCase(p.Node.NodeName)  = 'class' then Fclasses.AddObject(p.Node.Attributes['name'], Pointer(p.Node));
    internalSetState(p);

  except
    p.Node := oldNode;
    Result := False;
  end;
end;

//==============================================================================================
function  TSerXML.goParentNode(p: TSerXMLPos; mode: Integer = 0): Boolean;
begin
  Result := False;
  if p.Node.ParentNode = FXMLDoc.DocumentElement then Exit;

  if WideLowerCase(p.Node.NodeName) = 'section' then FSections.Delete(FSections.Count - 1);
  if WideLowerCase(p.Node.NodeName) = 'class'  then Fclasses.Delete(Fclasses.Count - 1);
  p.Node := p.Node.ParentNode;
  internalSetState(p);
  Result := True;
end;

//==============================================================================================
function  TSerXML.internalSkipToNode(p: TSerXMLPos; ANodeName: WideString): Boolean;
  var
    oldNode: IXMLNode;
begin
  Result := False;
  oldNode := FPos.Node;

  repeat
    if WideLowerCase(p.Node.NodeName) <> WideLowerCase(ANodeName) then begin
      Result := True;
      Exit;
    end;
  until goNextNode(p, SerFindSpanSections);

  p.Node := oldNode;
end;

//==============================================================================================
function TSerXML.SkipSection: Boolean;
begin
  Ferror := 0;
  Result := internalSkipToNode(Fpos, 'section'); // bad idea
end;

//==============================================================================================
// used mostly internally to switch to the next var, with state checking and more.
function TSerXML.NextVar: Boolean;
  var
    oldNode: IXMLNode;
begin
  Ferror := 0;
  Result := False;

  if (SerStateClassEnd in FPos.State) or (SerStateEOF in FPos.State) then Exit;

  oldNode := FPos.node;

  try // finally
    while goNextNode(FPos, SerFindSpanSections) do begin
      if WideLowerCase(FPos.Node.NodeName) = 'var' then begin
        Result := True;
        FcurrentID := FPos.node.Attributes['name'];
        Include(FPos.State, SerStateVar);
        Exit;
      end;
    end; // while gonextnode

  finally
    internalSetState(FPos);
    if not Result then FPos.Node := oldNode;
  end;
end;

//==============================================================================================
function TSerXML.getClassHeader: Boolean;
begin
  Ferror := 0;
  Result := False;

  if not internalSkipToNode(Fpos, 'class') then Exit;
  if not internalSkipToNode(Fpos, 'var') then Exit;

  Result := True;
end;

//==============================================================================================
procedure TSerXML.Start; // start whole process
begin
  Ferror := 0;
end;

//==============================================================================================
procedure TSerXML.Finish; // finish serialization process
begin
  if FSections.Count > 0 then EndSection(FSections[0]);
  if FClassName <> '' then EndClass;
end;

//==============================================================================================
procedure TSerXML.BeginClass(const Cname: String); // begins new class. autoclosin prevoius sections,etc
  var
    s: String;
begin
  s := '<Class name="' + Cname + '">'#13#10;
  FStream.WriteBuffer(s, Length(s));
  FClassName := AnsiLowerCase(Cname);
end;

//==============================================================================================
procedure TSerXML.EndClass;
  var
    s: String;
begin
  s := '</Class>'#13#10;
  FStream.WriteBuffer(s, Length(s));
  FClassName := '';
end;

//==============================================================================================
function  TSerXML.propGetSectionName: String;
begin
  if FSections.Count = 0
    then Result := ''
    else Result := FSections.Strings[FSections.count - 1];
end;

//==============================================================================================
procedure TSerXML.BeginSection(const Sname: String); // begins section on the serialization process
  var
    s: String;
begin
  Ferror := 0;

  FSections.Add(Sname);
  s := StringOfChar(' ', Flevel * 2) + '<Section name="' + Sname + '">'#13#10;
  Inc(Flevel);
  FStream.WriteBuffer(s, Length(s));
end;

//==============================================================================================
procedure TSerXML.EndSection(Sname: String = ''); // ends section (and sub-sections) on serialization process; ''-current only
  var
    i: Integer;
    s: String;
begin
  Ferror := 0;

  if FSections.Count = 0 then begin
    FError := errBadSection;
    Exit;
  end;

  if Sname = '' then Sname := FSections[FSections.count - 1];
  Sname := AnsiLowerCase(Sname);

  for i := FSections.Count - 1 downto 0 do begin
    Dec(Flevel);
    s := StringOfChar(' ', Flevel * 2) + '</Section> <!-- ' + FSections[i] + ' -->'#13#10;
    FStream.WriteBuffer(s, Length(s));
    s := FSections[i];
    FSections.Delete(i);
    if AnsiLowerCase(s) = Sname then Break;
  end;
end;

//==============================================================================================
function TSerXML.gotoSectionStart: Boolean;
  var
    oldNode: IXMLNode;
begin
  Ferror := 0;

  Result := False;

  if FSections.Count = 0 then Exit;

  oldNode := FPos.Node;
  FPos.node := IXMLNode(Pointer(FSections.objects[FSections.Count - 1]));

  Result := NextVar;
  if not Result then FPos.Node := oldNode;
end;

//==============================================================================================
function TSerXML.FindVar(const AID: String; Mode: Integer = SerFindSpanSections): Boolean;
  var
    oldNode: IXMLNode;
begin
  Ferror := 0;
  Result := False;
  oldNode := FPos.node;

  try // finally
    while not ((SerStateEOF in FPos.State) or (SerStateClassEnd in FPos.state)) do begin
      if WideLowerCase(FPos.Node.Attributes['name']) = AnsiLowerCase(AID) then begin
        Result := True;
        Exit;
      end;

      if not NextVar then Exit;
    end;

  finally
    if not Result then FPos.Node := oldNode;
  end;
end;

//==============================================================================================
procedure TSerXML.PutInt(const AID: String; const v: Integer);
begin
  Ferror := 0;

  ID := AID;
  propPutInt(v);
end;

//==============================================================================================
function TSerXML.GetInt: Integer;
begin
  Result := 0;

  if FPos.Node.Attributes['type'] <> xmlTypes[vtInt] then begin
    Ferror := errVarTypeMismatch;
    Exit;
  end;

  try
    Result := StrToInt(FPos.Node.NodeValue);
    Ferror := 0;
    NextVar;

  except
    Ferror := errBadData;
  end;
end;

//==============================================================================================
procedure TSerXML.PutInt64(const AID: String; const v: Int64);
begin
  Ferror := 0;

  ID := AID;
  propPutInt64(v);
end;

//==============================================================================================
function TSerXML.GetInt64: Int64;
begin
  Result := 0;

  if FPos.Node.Attributes['type'] <> xmlTypes[vtInt64] then begin
    Ferror := errVarTypeMismatch;
    Exit;
  end;

  try
    Result := StrToInt(FPos.Node.NodeValue);
    Ferror := 0;
    NextVar;

  except
    Ferror := errBadData;
  end;
end;

//==============================================================================================
procedure TSerXML.PutExt(const AID: String; const v: Extended);
begin
  Ferror := 0;

  ID := AID;
  propPutExt(v);
end;

//==============================================================================================
function TSerXML.GetExt: Extended;
begin
  Result := 0.0;

  if FPos.Node.Attributes['type'] <> xmlTypes[vtExt] then begin
    Ferror := errVarTypeMismatch;
    Exit;
  end;

  try
    Result := StrToFloat(FPos.Node.NodeValue);
    Ferror := 0;
    NextVar;

  except
    Ferror := errBadData;
  end;
end;

//==============================================================================================
procedure TSerXML.PutStr(const AID: String; const v: AnsiString);
begin
  Ferror := 0;

  ID := AID;
  propPutStr(v);
end;

//==============================================================================================
function TSerXML.GetStr: AnsiString;
begin
  Result := '';

  if FPos.Node.Attributes['type'] <> xmlTypes[vtStr] then begin
    Ferror := errVarTypeMismatch;
    Exit;
  end;

  try
    Result := FPos.Node.NodeValue;
    Ferror := 0;
    NextVar;

  except
    Ferror := errBadData;
  end;
end;

//==============================================================================================
procedure TSerXML.PutWStr(const AID: String; const v: WideString);
begin
  Ferror := 0;

  ID := AID;
  propPutWStr(v);
end;

//==============================================================================================
function TSerXML.GetWStr: WideString;
begin
  Result := '';

  if FPos.Node.Attributes['type'] <> xmlTypes[vtWStr] then begin
    Ferror := errVarTypeMismatch;
    Exit;
  end;

  try
    Result := FPos.Node.NodeValue;
    Ferror := 0;
    NextVar;

  except
    Ferror := errBadData;
  end;
end;

//==============================================================================================
procedure TSerXML.PutDateTime(const AID: String; const v: TDateTime);
begin
  Ferror := 0;

  ID := AID;
  propPutDateTime(v);
end;

//==============================================================================================
function TSerXML.GetDateTime: TDateTime;
  var
    fs: TFormatSettings;
begin
  Result := 0.0;

  if FPos.Node.Attributes['type'] <> xmlTypes[vtDateTime] then begin
    Ferror := errVarTypeMismatch;
    Exit;
  end;

  try
    GetLocaleFormatSettings(GetUserDefaultLCID, fs);
    fs.ShortDateFormat := 'yyyy-mm-dd';
    fs.ShortTimeFormat := 'hh:nn:ss';
    Result := StrToDateTime(FPos.Node.NodeValue, fs);
    Ferror := 0;
    NextVar;

  except
    Ferror := errBadData;
  end;
end;

//==============================================================================================
procedure TSerXML.PutBool(const AID: String; const v: Boolean);
begin
  Ferror := 0;

  ID := AID;
  propPutBool(v);
end;

//==============================================================================================
function TSerXML.GetBool: Boolean;
begin
  Result := False;

  if FPos.Node.Attributes['type'] <> xmlTypes[vtBool] then begin
    Ferror := errVarTypeMismatch;
    Exit;
  end;

  try
    Result := StrToBool(FPos.Node.NodeValue);
    Ferror := 0;
    NextVar;

  except
    Ferror := errBadData;
  end;
end;

//==============================================================================================
function TSerXML.GetType: TSerializatorTypes;
begin
  Ferror := 0;
  Result := SerTypeError;

  if FPos.Node.Attributes['type'] = 'i' then Result := SerTypeInt
  else if FPos.Node.Attributes['type'] = 'e' then Result := SerTypeExt
  else if FPos.Node.Attributes['type'] = 's' then Result := SerTypeStr
  else if FPos.Node.Attributes['type'] = 'w' then Result := SerTypeWStr
  else if FPos.Node.Attributes['type'] = 'i64' then Result := SerTypeInt64
  else if FPos.Node.Attributes['type'] = 'd' then Result := SerTypeDate
  else if FPos.Node.Attributes['type'] = 'b' then Result := SerTypeBool;
end;

end.

