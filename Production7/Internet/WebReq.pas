unit WebReq;

interface

uses
  Classes, {$IFDEF MSWINDOWS}Windows,{$ENDIF}
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  StdCtrls,
  XMLIntf, XMLDoc;

type
  {$IFDEF VER150}
  TWebReqHTTPMethod = TidHTTPMethod;
  {$ELSE}
  TWebReqHTTPMethod = (hmGet, hmPost);
  {$ENDIF}

  TWebReq = class
  private
    FURL: string;
    FidHTTP: TidHTTP;
    FmyidHTTP: Boolean;
    FSrc, FResp: TStringStream;
    FMethod: TWebReqHTTPMethod;

  public
    constructor Create;
    destructor Destroy; override;

    procedure Clear;
    procedure AddData(const AXML: String);
  end;

  //----------------------------------------------------------------------------------------
  TThreadedWebReq = class(TThread)
  private
    FURL: string;
    FidHTTP: TidHTTP;
    FmyidHTTP: Boolean;
    FSrc, FResp: TStringStream;
    FMethod: TWebReqHTTPMethod;

    procedure SetName;

  protected
    procedure Execute; override;

  public
    constructor Create(PidHTTP: TidHTTP; Purl: string; Presp: TStringStream); overload;
    constructor Create(PidHTTP: TidHTTP; hm: TWebReqHTTPMethod; Purl: string; Psrc,Presp: TStringStream); overload;
    property idHTTP: TidHTTP read FidHTTP;
  end;

  // leave Req empty to perform GET request. For Post method request should be in form var=value#13#10... not with '&'s
  function WebQuickPost(Host, URL: String; Req: String; var Resp: String; Timeout: integer = 30000; const HTTPWorkProc: TWorkEvent = nil): Boolean;

  function XMLpost(const WSID: Integer; const Acmd: String; const Source: TStringStream; memo: TMemo = nil; const HTTPWorkProc: TWorkEvent = nil): String;
  function XMLshowServerResponse(const s: String; newline: Boolean = False; const memo: TMemo = nil): Boolean;

  function XMLStrToFloat(s: String): Extended; // handling different locales at web server and client

//==============================================================================================
//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  udebug, sysutils, Dialogs, prFun, DBClient, prConst, strUtils, Forms, synacode, Controls;
  
{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure WebReq.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{$IFDEF MSWINDOWS}
type
  TThreadNameInfo = record
    FType: LongWord;     // must be 0x1000
    FName: PChar;        // pointer to name (in user address space)
    FThreadID: LongWord; // thread ID (-1 indicates caller thread)
    FFlags: LongWord;    // reserved for future use, must be zero
  end;
{$ENDIF}

{$IFDEF UDEBUG}var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';{$ENDIF}

{ WebReq }

//==============================================================================================
constructor TWebReq.Create;
begin
end;

//==============================================================================================
destructor TWebReq.Destroy;
begin
end;

//==============================================================================================
procedure TWebReq.Clear;
begin
end;

//==============================================================================================
procedure TWebReq.AddData(const AXML: String);
begin
end;

//==============================================================================================
//==============================================================================================
//==== TThreadedWebReq =========================================================================
//==============================================================================================
//==============================================================================================
procedure TThreadedWebReq.SetName;
  {$IFDEF MSWINDOWS}
  var
    ThreadNameInfo: TThreadNameInfo;
  {$ENDIF}
begin
{$IFDEF MSWINDOWS}
  ThreadNameInfo.FType := $1000;
  ThreadNameInfo.FName := 'getNews';
  ThreadNameInfo.FThreadID := $FFFFFFFF;
  ThreadNameInfo.FFlags := 0;

  try
    RaiseException( $406D1388, 0, sizeof(ThreadNameInfo) div sizeof(LongWord), @ThreadNameInfo );
  except
  end;
{$ENDIF}
end;

//==============================================================================================
constructor TThreadedWebReq.Create( PidHTTP: TidHTTP; hm: TWebReqHTTPMethod; Purl: string; Psrc,Presp: TStringStream );
begin
  FidHTTP := PidHTTP;
  Furl := Purl;
  Fresp := Presp;
  Fsrc := Psrc;
  Fmethod := hm;
  FreeOnTerminate := True;

  inherited Create(False);
end;

//==============================================================================================
constructor TThreadedWebReq.Create(PidHTTP: TidHTTP; Purl: string; Presp: TStringStream);
begin
  FidHTTP := PidHTTP;
  Furl := Purl;
  Fresp := Presp;
  Fsrc := nil;
  Fmethod := hmGet;
  FreeOnTerminate := True;
  
  inherited Create(False);
end;

//==============================================================================================
procedure TThreadedWebReq.Execute;
begin
  SetName;

  try
    if Fmethod = hmPost
      then FidHTTP.Post(Furl, FSrc, FResp)
      else FidHTTP.Get(FURL, FResp);

  except
    on e: Exception do udebug1('!E: DoRequest('+FURL+'): ' + e.message);
  end;
end;

//==============================================================================================
//==============================================================================================
//== common functions ==========================================================================
//==============================================================================================
//==============================================================================================
// leave Req empty to perform GET request
function WebQuickPost(Host, URL: String; Req: String; var Resp: String; Timeout: integer = 30000; const HTTPWorkProc: TWorkEvent = nil): Boolean;
  var
    idHTTP1: TidHTTP;
    src: TStringList;
begin
  idHTTP1 := TidHTTP.Create(nil);
  Result := True;
  src := nil;

  try
    try
      idHTTP1.ReadTimeout := Timeout;
      idHTTP1.Request.UserAgent := OK_Version;
      {$IFDEF VER150}
      idHTTP1.host := host;
      {$ENDIF}
      idHTTP1.Request.ContentType := 'application/x-www-form-urlencoded';
      idHTTP1.Request.ContentLength := Length(req);
      idHTTP1.onWork := HTTPWorkProc;
      //idHTTP1.HTTPOptions := [];//idHTTP1.HTTPOptions + [hoKeepOrigProtocol];
      //idHTTP1.ProtocolVersion := pv_11;

      Screen.Cursor := crHourGlass;

      if trim(Req) = '' then begin
        Resp := idHTTP1.Get(url);
      end
      else begin
        src := TStringList.Create;
        src.Text := Req;

        Resp := idHTTP1.Post(url, Src);
      end;

    except
      on e: Exception do begin
        Result := False;
        Resp := e.Message;
      end;
    end;

  finally
    if src <> nil then src.Destroy;
    idHTTP1.destroy;
    Screen.Cursor := crDefault;
  end;
end;

//==============================================================================================
function XMLpost(const WSID: Integer; const Acmd: String; const Source: TStringStream; memo: TMemo = nil; const HTTPWorkProc: TWorkEvent = nil): String;
  var
    s, skey, host, url, Req, Resp: String;
    stream, Response: TStringStream;
    idHTTP1: TidHTTP;
begin
  {$IFNDEF FREE}
  Result := '';
  host := ''; skey := '';

  with newDataSet do try
    ProviderName := 'pWebShop_Get';
    FetchParams;
    Params.ParamByName('id').asInteger := WSID;
    Open;
    host := FieldByName('name').asString; // hostname with optional http://
    s := FieldByName('xmlurl').asString; // custom admin php tail

    if s = ''
      then url := host + '/' + URL_XMLDefault
      else url := host + '/' + s;

    skey := FieldByName('xmlseckey').asString;
    Close;

  finally
    Free;
  end;

  if (host = '') or (skey = '') then Exit;

  if AnsiStartsText('http://', host) then host := AnsiMidStr(host, 8, length(host));

  if not AnsiStartsText('http://', url) then url := 'http://' + url;

  s := '<?xml >' + crlf + '<WebRequest>' + crlf + '<Method>' + Acmd + '</Method>' + crlf;

  if source <> nil
    then s := s + '<Data>' + crlf + Source.DataString + '</Data>' + crlf;

  s := s  + '</WebRequest>' + crlf;

  if (cmdLineDebugLevel > 5) and (memo <> nil)
    then memo.Lines.Add('--------------' + crlf + '*** XMLPost sending: ' + crlf + s + crlf + '---------------');

  //-----------------------------------------------------------
  Req := 'XML=' + EncodeBase64(s);
  if skey <> '' then Req := Req + crlf + 'key=' + skey;

  if WebQuickPost(Host, URL, Req, Resp, 30000, HTTPWorkProc) then begin
    if (cmdLineDebugLevel > 5) and (memo <> nil) then memo.Lines.Add(rs('WebReq', 'Export_ServerResponse') + crlf + Resp);

    Result := Resp;
  end
  else begin
    if memo <> nil
      then memo.Lines.Add(rs('WebReq', 'xml_error_post') + ': ' + Resp)
      else raise Exception.Create(Resp);
  end;

  {$ENDIF}
end;

//==============================================================================================
function XMLshowServerResponse(const s: String; newline: Boolean = False; const memo: TMemo = nil): Boolean;
  var
    resp: iXMLDocument;
    Node: IXMLNode;
    success: Boolean;
    msg: String;
begin
  Result := False;
  Success := False;

  try
    resp := LoadXMLData(s);
    msg := '';
    Node := resp.DocumentElement.ChildNodes.First;
    while node <> nil do begin
      if AnsiLowerCase(Node.NodeName) = 'success' then begin
        success := (trim(node.Text) = '1');
        Result := success;
      end
      else if (AnsiLowerCase(Node.NodeName) = 'message') and (Trim(Node.Text) <> '')
        then msg := trim(node.text) + '.'
      else if (AnsiLowerCase(Node.NodeName) = 'errormessage') and (Trim(Node.Text) <> '')
        then msg := trim(node.text) + '.';

      Node := Node.NextSibling;
    end;

  except
    on e:Exception do begin
      if trim(s) = ''
        then memo.Lines.Add('! Server returned empty answer')
        else memo.Lines.Add('! Server RAW XML: ' + s); // just printing unparsed answer
      Exit;
    end;
  end;

  if newLine then memo.Lines.Add(rs('Common', 'ServerResponse'));

  if Success
    then memo.Lines[memo.Lines.Count - 1] := memo.Lines[memo.Lines.Count - 1] + ' ' + rs('Common', 'OK') + '. ' + msg
    else memo.Lines[memo.Lines.Count - 1] := memo.Lines[memo.Lines.Count - 1] + ' ' + rs('Common', 'error') + ': ' + msg;
  
  resp := nil;
end;

//==============================================================================================
function XMLStrToFloat(s: String): Extended; // trying to cope with possible different locales on web and local client
  var
    fs: TFormatSettings;
    num,OurDS: String;
begin
  s := trim(s);
  if s = '' then begin
    Result := 0.0;
    Exit;
  end;

  if TryStrToFloat(s, Result) then Exit; // nothing to worry about

  GetLocaleFormatSettings(LOCALE_USER_DEFAULT, fs);
  OurDS := fs.DecimalSeparator;
  num := StringReplace(s,   ' ', '', [rfReplaceAll]); // just in case
  num := StringReplace(num, '.', OurDS, [rfReplaceAll]);
  num := StringReplace(num, ',', OurDS, [rfReplaceAll]);

  if TryStrToFloat(num, Result) then Exit; // well...

  raise Exception.Create('XMLStrToFloat: can not figure out what to do with ' + s);
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('WebReq', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.

