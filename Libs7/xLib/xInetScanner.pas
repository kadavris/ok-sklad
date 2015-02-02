unit xInetScanner;

interface

uses
  SysUtils, Classes, WinInet, Contnrs, StrUtils, EmbeddedWB, Windows, SHDocVw, MSHTML;

type
  TxInetAccessType = (atDirect, atPreconfig, atPreconfigWithNoAutoProxy, atProxy);

  TxInetConnectionFlagsType = (cfAsync, cfFromCache, cfOffline);
  TxInetConnectionFlags = set of TxInetConnectionFlagsType;

  TxSearchForType = (sfSWF, sfGIF, sfEXE);
  TxURLType = (utHTML, utGIF, utCSS, utUnknown, utSWF);

const
  X_DEF_PROXYBYPASS = '<local>';
  X_SWF_SEARCH_ATTR = 'getflashplayer';

type
  TxURL = class;
  TxInetScanner = class;

  TxOnFindURL = procedure (Sender: TObject; AURL: TxURL) of object;

  TxURLScanThread = class(TThread)
  private
    FScanner: TxInetScanner;
    FURL: TxURL;
    FWithParse: Boolean;
    procedure Parse;
  public
    constructor Create(CreateSuspended: Boolean);
    procedure Execute; override;
    destructor Destroy; override;
  end;

  TxInetConnectionParams = class(TPersistent)
  private
    FScanner: TxInetScanner;
    FAccessType: TxInetAccessType;
    FAgent: string;
    FProxyPort: Integer;
    FProxyName: string;
    FProxyBypass: string;
    FFlags: TxInetConnectionFlags;
    procedure SetAccessType(const Value: TxInetAccessType);
  public
    constructor Create(AScanner: TxInetScanner); virtual;
  published
    property AccessType: TxInetAccessType read FAccessType write SetAccessType
      default atPreconfig;
    property Agent: string read FAgent write FAgent;
    property Flags: TxInetConnectionFlags read FFlags write FFlags default [];
    property ProxyName: string read FProxyName write FProxyName;
    property ProxyPort: Integer read FProxyPort write FProxyPort default 8080;
    property ProxyBypass: string read FProxyBypass write FProxyBypass;
  end;

  TxURL = class(TPersistent)
  private
    FScanner: TxInetScanner;
    FURLName: string;
    FHandle: HINTERNET;
    FData: string;
    FSize: Cardinal;
    FURLs: TObjectList;
    FURLFileName: string;
    FURLFullPath: string;
    FLevel: Cardinal;
    FParentURL: TxURL;
    FURLType: TxURLType;
    FURLTypeText: string;
    FRecvBytes: Cardinal;
    FDownloading: Boolean;
    FParsing: Boolean;
    FScanThread: TxURLScanThread;
    FOnEndDownload: TNotifyEvent;
    FOnStartParse: TNotifyEvent;
    FOnEndParse: TNotifyEvent;
    FOnStartDownload: TNotifyEvent;
    FOnSuspendScan: TNotifyEvent;
    FOnResumeScan: TNotifyEvent;
    FDownloaded: Boolean;
    procedure SetURLName(const Value: string);
    function GetURL(AIndex: Integer): TxURL;
    function GetURLsCount: Integer;
    procedure SetURLType(const AType: string);
  public
    function AddURL(const AURLName: string): TxURL;
    function AsString: string;
    constructor Create(AScanner: TxInetScanner); virtual;
    destructor Destroy; override;
    procedure Download(AWithParse: Boolean = False; ACreateThread: Boolean = False);
    procedure GetURLInfo;
    procedure Open;
    procedure Close;
    procedure Parse(AWB: TEmbeddedWB);
    procedure SuspendScan;
    procedure ResumeScan;
    procedure SaveToFile(const AFileName: string);
    property Size: Cardinal read FSize;
    property Level: Cardinal read FLevel;
    property Downloading: Boolean read FDownloading;
    property Parsing: Boolean read FParsing;
    property RecvBytes: Cardinal read FRecvBytes;
    property ParentURL: TxURL read FParentURL;
    property URLs[AIndex: Integer]: TxURL read GetURL;
    property URLFileName: string read FURLFileName;
    property URLType: TxURLType read FURLType;
    property URLTypeText: string read FURLTypeText;
    property URLFullPath: string read FURLFullPath;
  published
    property URLName: string read FURLName write SetURLName;
    property URLsCount: Integer read GetURLsCount;

    property OnStartDownload: TNotifyEvent read FOnStartDownload
      write FOnStartDownload;
    property OnEndDownload: TNotifyEvent read FOnEndDownload
      write FOnEndDownload;
    property OnStartParse: TNotifyEvent read FOnStartParse write FOnStartParse;
    property OnEndParse: TNotifyEvent read FOnEndParse write FOnEndParse;
    property OnResumeScan: TNotifyEvent read FOnResumeScan write FOnResumeScan;
    property OnSuspendScan: TNotifyEvent read FOnSuspendScan write FOnSuspendScan;
  end;

  TxInetScanner = class(TComponent)
  private
    FURLs: TList;
    FSession: HINTERNET;
    FConnected: Boolean;
    FConnection: TxInetConnectionParams;
    FStartURL: TxURL;
    FSearchFor: TxSearchForType;
    FOnFindURL: TxOnFindURL;
    FScanDepth: Cardinal;
    FAllowExtRefs: Boolean;
    FOnEndScan: TNotifyEvent;
    FOnStartScan: TNotifyEvent;
    FOnSuspendScan: TNotifyEvent;
    FOnResumeScan: TNotifyEvent;
    FWB: TEmbeddedWB;
    FDownloaded: Boolean;
    FFrameList: TList;
    FDoc: IHTMLDocument2;
    procedure SetConnected(const Value: Boolean);
    procedure SetConnection(const Value: TxInetConnectionParams);
    procedure SetStartURL(const Value: TxURL);
    function GetURL(AIndex: Integer): TxURL;
    function GetURLsCount: Integer;
    procedure DoStartScan(Sender: TObject);
    procedure DoEndScan(Sender: TObject);
    procedure DocumentComplete(Sender: TObject; const pDisp: IDispatch;
      var URL: OleVariant);
    { Private declarations }
  protected
    procedure Loaded; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure Scan;
    procedure Resume;
    procedure Suspend;
    function IndexOfURL(const AURLName: string): Integer;
    procedure URLsClear;
    property URLsCount: Integer read GetURLsCount;
    property URLs[AIndex: Integer]: TxURL read GetURL;
    property WB: TEmbeddedWB read FWB write FWB;
  published
    property AllowExtRefs: Boolean read FAllowExtRefs write FAllowExtRefs
      default False;
    property Connected: Boolean read FConnected write SetConnected default False;
    property Connection: TxInetConnectionParams read FConnection
      write SetConnection;
    property ScanDepth: Cardinal read FScanDepth write FScanDepth default 1;
    property SearchFor: TxSearchForType read FSearchFor write FSearchFor
      default sfSWF;
    property StartURL: TxURL read FStartURL write SetStartURL;

    property OnFindURL: TxOnFindURL read FOnFindURL write FOnFindURL;
    property OnStartScan: TNotifyEvent read FOnStartScan write FOnStartScan;
    property OnEndScan: TNotifyEvent read FOnEndScan write FOnEndScan;
    property OnResumeScan: TNotifyEvent read FOnResumeScan write FOnResumeScan;
    property OnSuspendScan: TNotifyEvent read FOnSuspendScan write FOnSuspendScan;
  end;

implementation

uses
  Controls, Forms, {ssStrUtil,} dialogs;

{ TxInetConnectionParams }

//==============================================================================================
constructor TxInetConnectionParams.Create(AScanner: TxInetScanner);
begin
  FScanner := AScanner;

  FAccessType := atPreconfig;
  FProxyBypass := X_DEF_PROXYBYPASS;
  FAgent := ':-)';
  FProxyPort := 8080;
end;

//==============================================================================================
procedure TxInetConnectionParams.SetAccessType(
  const Value: TxInetAccessType);
begin
  FAccessType := Value;
end;

{ TxInetScanner }

//==============================================================================================
constructor TxInetScanner.Create(AOwner: TComponent);
begin
  inherited;

  FConnection := TxInetConnectionParams.Create(Self);
  FURLs := TList.Create;
  FStartURL := TxURL.Create(Self);
  with FStartURL do begin
    FLevel := 0;
    OnStartDownload := Self.DoStartScan;
    OnEndParse := Self.DoEndScan;
  end;
  FSearchFor := sfSWF;
  FScanDepth := 1;

  FWB := TEmbeddedWB.Create(nil);
  with FWB do begin
    FWB.Height := 0;
    if not (csDesigning in ComponentState)
      then ParentWindow := (Self.Owner as TWinControl).Handle;
//      then FWB.ParentWindow := GetDesktopWindow;
    FWB.Hide;
    OnDocumentComplete := Self.DocumentComplete;
    DownloadOptions := [DLCTL_NO_DLACTIVEXCTLS, DLCTL_NO_RUNACTIVEXCTLS,
      DLCTL_SILENT, DLCTL_PRAGMA_NO_CACHE];
  end;

  FFrameList := TList.Create; 
end;

//==============================================================================================
destructor TxInetScanner.Destroy;
begin
  if Connected then Connected := False;
//  FWB.ParentWindow := 0;
  FFrameList.Free;
  FWB.Free;
  FURLs.Free;
  FStartURL.Free;
  FConnection.Free;

  inherited;
end;

//==============================================================================================
procedure TxURL.Download(AWithParse: Boolean = False; ACreateThread: Boolean = False);
begin
  if FHandle = nil then Exit;

  if Assigned(OnStartDownload) then OnStartDownload(Self);
  FDownloading := True;
  FDownloaded := False;
  if ACreateThread then begin
    FScanThread := TxURLScanThread.Create(True);
    with FScanThread do begin
      FreeOnTerminate := True;
      FScanner := Self.FScanner;
      FWithParse := AWithParse;
      FURL := Self;
      Resume;
    end;
  end
  else begin
    FScanner.FWB.Navigate(FURLFullPath);
    repeat
      Application.ProcessMessages;
    until FScanner.FDownloaded;
    FDownloading := False;
    if Assigned(OnEndDownload) then OnEndDownload(Self);
    if AWithParse then Parse(FScanner.FWB);
  end;
end;

//==============================================================================================
procedure TxInetScanner.DocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
  if (pDisp as IWebBrowser) = (Sender as TWebBrowser).DefaultInterface
    then FDownloaded := True
    else begin
//      FFrameList.Add(Pointer((pDisp as IWebBrowser).Document as IHTMLDocument2));
      FDoc := (pDisp as IWebBrowser).Document as IHTMLDocument2;
    end;
end;

//==============================================================================================
procedure TxInetScanner.DoEndScan(Sender: TObject);
begin
  if Assigned(FOnEndScan) then FOnEndScan(Self);
end;

//==============================================================================================
procedure TxInetScanner.DoStartScan(Sender: TObject);
begin
  if Assigned(FOnStartScan) then FOnStartScan(Self);
end;

//==============================================================================================
function TxInetScanner.GetURL(AIndex: Integer): TxURL;
begin
  Result := TxURL(FURLs[AIndex]);
end;

//==============================================================================================
function TxInetScanner.GetURLsCount: Integer;
begin
  Result := FURLs.Count;
end;

//==============================================================================================
function TxInetScanner.IndexOfURL(const AURLName: string): Integer;
var
  i: Integer;
begin
  Result := -1;
  for i := 0 to FURLs.Count - 1 do
    if TxURL(FURLs[i]).URLName = AURLName then begin
      Result := i;
      Exit;
    end;
end;

//==============================================================================================
procedure TxInetScanner.Loaded;
begin
  inherited;
end;

//==============================================================================================
procedure TxInetScanner.Resume;
var
  i: Integer;
begin
  for i := 0 to FURLs.Count - 1 do
    TxURL(FURLs[i]).ResumeScan;
  FStartURL.ResumeScan;
  if Assigned(FOnResumeScan) then FOnResumeScan(Self);
end;

//==============================================================================================
procedure TxInetScanner.Scan;
begin
  URLsClear;
  FFrameList.Clear;
  StartURL.Download(True, False);
//  repeat until not StartURL.Downloading;
//  StartURL.Parse;
end;

//==============================================================================================
procedure TxInetScanner.SetConnected(const Value: Boolean);
var
  FAccessType, FFlags: Integer;
begin
  if FConnected = Value then Exit;
  FConnected := Value;

  if Value then begin
    case FConnection.AccessType of
      atDirect:
        FAccessType := INTERNET_OPEN_TYPE_DIRECT;
      atPreconfig:
        FAccessType := INTERNET_OPEN_TYPE_PRECONFIG;
      atPreconfigWithNoAutoProxy:
        FAccessType := INTERNET_OPEN_TYPE_PRECONFIG_WITH_NO_AUTOPROXY;
      atProxy:
        FAccessType := INTERNET_OPEN_TYPE_PROXY;
    end;
    FFlags := 0;
    if cfAsync in FConnection.Flags
      then FFlags := FFlags or INTERNET_FLAG_ASYNC;
    if cfFromCache in FConnection.Flags
      then FFlags := FFlags or INTERNET_FLAG_FROM_CACHE;
    if cfOffline in FConnection.Flags
      then FFlags := FFlags or INTERNET_FLAG_OFFLINE;

    FSession := InternetOpen(PChar(FConnection.Agent), FAccessType,
      PChar(FConnection.ProxyName + ':' + IntToStr(FConnection.ProxyPort)),
      PChar(FConnection.ProxyBypass), FFlags);
    if FSession = nil then begin
      FConnected := False;
      raise Exception.Create('Could not connect to Internet!');
      Exit;
    end;

    FStartURL.Open;
    if FStartURL.FHandle = nil then begin
      FConnected := False;
      InternetCloseHandle(FSession);
      raise Exception.CreateFmt('Could not open URL: %s !', [FStartURL.URLName]);
      Exit;
    end;
  end
  else begin
    FStartURL.Close;
    InternetCloseHandle(FSession);
  end;
end;

//==============================================================================================
procedure TxInetScanner.SetConnection(const Value: TxInetConnectionParams);
begin
  FConnection := Value;
end;

//==============================================================================================
procedure TxInetScanner.SetStartURL(const Value: TxURL);
begin
  FStartURL.Assign(Value);

  if Connected then Connected := False;
end;

//==============================================================================================
procedure TxInetScanner.Suspend;
var
  i: Integer;
begin
  for i := 0 to FURLs.Count - 1 do
    TxURL(FURLs[i]).SuspendScan;
  FStartURL.SuspendScan;
  if Assigned(FOnSuspendScan) then FOnSuspendScan(Self);  
end;

//==============================================================================================
procedure TxInetScanner.URLsClear;
begin
{  for i := 0 to FURLs.Count - 1 do begin
    if TxURL(FURLs[i]).Level = 0
      then TxURL(FURLs[0]).FURLs.Clear;
  end;}
  FStartURL.FURLs.Clear;
  FURLs.Clear;
end;

{ TxURL }

//==============================================================================================
constructor TxURL.Create(AScanner: TxInetScanner);
begin
  FScanner := AScanner;
  FURLs := TObjectList.Create(True);
end;

//==============================================================================================
procedure TxURL.SetURLName(const Value: string);
begin
  FURLName := Value;
  if (Pos('://', FURLName) = 0) and (Value[1] <> '/') and (PosEx_('www', FURLName) = 0)
    then FURLName := '/' + FURLName; 
  FURLFileName := ExtractWord(WordCount(Value, ['/']), Value, ['/']);
  if (FURLName[1] = '/') and (Self <> FScanner.StartURL)
    then FURLFullPath := FScanner.StartURL.FURLFullPath + FURLName
    else if Pos('://', FURLName) = 0
      then FURLFullPath := 'http://' + FURLName
      else FURLFullPath := FURLName;
  if FURLFullPath[Length(FURLFullPath)] = '/'
    then System.Delete(FURLFullPath, Length(FURLFullPath), 1);
  FURLName := Value;  
end;

//==============================================================================================
procedure TxURL.Open;
begin
  FHandle := InternetOpenUrl(FScanner.FSession, PChar(FURLFullPath), nil, 0, 0, 0);
end;

//==============================================================================================
procedure TxURL.Close;
begin
  if Assigned(FHandle) then begin
    FData := '';
    InternetCloseHandle(FHandle);
  end;  
end;

//==============================================================================================
function TxURL.AsString: string;
begin
  Result := FData;
end;

//==============================================================================================
procedure TxURL.SaveToFile(const AFileName: string);
var
  F: TextFile;
begin
  AssignFile(F, AFileName);
  Rewrite(F);
  Write(F, FData);
  CloseFile(F);
end;

//==============================================================================================
procedure TxURL.Parse;
var
  FOffs, j, i: Integer;
  FExt, FRes: string;
  FURL: TxURL;
  FExtSkip: Boolean;
  IHTML, IFrame: IHTMLDocument2;
  ICol: IHTMLElementCollection;
  IItem: IHTMLElement;
  IWnd: IHTMLWindow2;
//  IFrame: IHTMLWindow2;
  OV: OleVariant;
  s: string;
begin
  if AWB = nil then Exit;
  AWB.ControlInterface.Document.QueryInterface(IID_IHTMLDOCUMENT2, IHTML);
  IHTML.all.tags('html').QueryInterface(IHTMLElementCollection, ICol);
  if ICol.length = 0 then Exit;
  ICol.item(0, 0).QueryInterface(IHTMLElement, IItem);
  FData := IItem.innerHTML;

  if FData = '' then Exit;
  FParsing := True;
  if Assigned(FOnStartParse) then FOnStartParse(Self);
  case FScanner.SearchFor of
    sfSWF: FExt := '.swf';
    sfGIF: FExt := '.gif';
    sfEXE: FExt := '.exe';
  end;
{  FOffs := PosEx_(FExt, FData);
  while FOffs > 0 do begin
    i := 1;
    FRes := FExt;
    while not (FData[FOffs - i] in ['=', '"', ' ']) do begin
      if Pos('http://', LowerCase(FRes)) = 1 then Break;
      FRes := FData[FOffs - i] + FRes;
      Inc(i);
    end;
    FRes := DelChars(FRes, ['''', '+']);
    FURL := AddURL(FRes);
    if FURL <> nil then begin
      FURL.GetURLInfo;
      if Assigned(FScanner.OnFindURL) then FScanner.OnFindURL(FScanner, FURL);
    end;
    FOffs := PosEx_(FExt, FData, FOffs + 1);
  end;}

  try
    for i := 0 to IHTML.embeds.length - 1 do begin
      IHTML.embeds.item(i, 0).QueryInterface(IHTMLElement, IItem);
      if PosEx_(X_SWF_SEARCH_ATTR, IItem.getAttribute('pluginspage', 0)) > 0  then
      begin
        FRes := IItem.getAttribute('src', 0);
        FURL := AddURL(FRes);
        if FURL <> nil then begin
          FURL.GetURLInfo;
          if Assigned(FScanner.OnFindURL) then FScanner.OnFindURL(FScanner, FURL);
        end;
      end;
    end;
  except
    on e:exception do showmessage(e.Message);
  end;

  //executing frames
  for j := 0 to FScanner.FFrameList.Count  do begin
//    IFrame := IHTMLDocument2(FScanner.FFrameList[j]);
    IFrame := FScanner.FDoc;
    showmessage(iframe.body.innerHTML);
    for i := 0 to IFrame.embeds.length - 1 do begin
      IFrame.embeds.item(i, 0).QueryInterface(IHTMLElement, IItem);
      if PosEx_(X_SWF_SEARCH_ATTR, IItem.getAttribute('pluginspage', 0)) > 0  then
      begin
        FRes := IItem.getAttribute('src', 0);
        FURL := AddURL(FRes);
        if FURL <> nil then begin
          FURL.GetURLInfo;
          if Assigned(FScanner.OnFindURL) then FScanner.OnFindURL(FScanner, FURL);
        end;
      end;
    end;
  end;
{  FOffs := PosEx_('<iframe', FData);
  while FOffs > 0 do begin
    i := 8;
    FRes := '';
    while not (FData[FOffs + i] in ['>']) do begin
      FRes := FRes + FData[FOffs + i];
      Inc(i);
    end;
    j := PosEx_('src=', FRes);
    if j > 0 then begin
      FRes := Copy(FRes, j, Length(FRes) - j + 1);
      FRes := ExtractWord(1, FRes, [' ', #13, #10]);
      System.Delete(FRes, 1, 4);
      FRes := DelChars(FRes, ['''', '"']);

//      if FRes[1] in ['"', ''''] then System.Delete(FRes, 1, 1);
//      if FRes[Length(FRes)] in ['"', ''''] then System.Delete(FRes, Length(FRes), 1);

      FURL := AddURL(FRes);
      if FURL <> nil then begin
        FURL.GetURLInfo;
        if Assigned(FScanner.OnFindURL) then FScanner.OnFindURL(FScanner, FURL);
        FURL.Open;
        FURL.Download(True);
//        repeat until not FURL.Downloading;
//        FURL.Parse;
      end;
    end;

    FOffs := PosEx_('<iframe', FData, FOffs + 1);
  end;

  //executing java-scripts
  FOffs := PosEx_('language=JavaScript', FData);
  while FOffs > 0 do begin
    i := 20;
    FRes := '';
    while not (FData[FOffs + i] in ['>']) do begin
      FRes := FRes + FData[FOffs + i];
      Inc(i);
    end;
    j := PosEx_('src=', FRes);
    if j > 0 then begin
      FRes := Copy(FRes, j, Length(FRes) - j + 1);
      FRes := ExtractWord(1, FRes, [' ', #13, #10]);
      System.Delete(FRes, 1, 4);
      FRes := DelChars(FRes, ['''', '"']);
//      if FRes[1]='"' then System.Delete(FRes, 1, 1);
//      if FRes[Length(FRes)]='"' then System.Delete(FRes, Length(FRes), 1);
      FURL := AddURL(FRes);
      if FURL <> nil then begin
        FURL.GetURLInfo;
        if Assigned(FScanner.OnFindURL) then FScanner.OnFindURL(FScanner, FURL);
        FURL.Open;
        FURL.Download(True);
//        repeat until not FURL.Downloading;
//        FURL.Parse;
      end;
    end;

    FOffs := PosEx_('language=JavaScript', FData, FOffs + 1);
  end;


  if Self.Level < FScanner.ScanDepth - 1 then begin
    FExt := 'href="';
    FOffs := PosEx_(FExt, FData);
    while FOffs > 0 do begin
      i := 6;
      FRes := '';
      while not (FData[FOffs + i] in ['"']) do begin
        FRes := FRes + FData[FOffs + i];
        Inc(i);
      end;
      FExtSkip := (FRes = '')
       or
        (not FScanner.AllowExtRefs and
        (Pos('://', LowerCase(FRes)) > 0) and
        (Pos(LowerCase(FScanner.StartURL.URLName), LowerCase(FRes)) = 0))
       or
        (FRes[1] = '?');
      if not FExtSkip then begin
        FURL := AddURL(FRes);
        if FURL <> nil then begin
          FURL.GetURLInfo;
          if Assigned(FScanner.OnFindURL) then FScanner.OnFindURL(FScanner, FURL);
          if FURL.URLType = utHTML then begin
            FURL.Open;
            FURL.Download(True);
//            repeat until not FURL.Downloading;
//            FURL.Parse;
          end;
        end;
      end;
      FOffs := PosEx_(FExt, FData, FOffs + 1);
    end;
  end;}
  FParsing := False;
  if Assigned(FOnEndParse) then FOnEndParse(Self);
end;

//==============================================================================================
function TxURL.GetURL(AIndex: Integer): TxURL;
begin
  Result := TxURL(FURLs[AIndex]);
end;

//==============================================================================================
destructor TxURL.Destroy;
begin
  FURLs.Clear;
  FURLs.Free;

  inherited;
end;

//==============================================================================================
function TxURL.AddURL(const AURLName: string): TxURL;
begin
  if FScanner.IndexOfURL(AURLName) <> -1 then begin
    Result := nil;
    Exit;
  end;
  Result := TxURL.Create(Self.FScanner);
  with Result do begin
    URLName := AURLName;
    FParentURL := Self;
    FLevel := Self.FLevel + 1;
  end;
  if Result.URLFullPath = FScanner.StartURL.URLFullPath then begin
    FreeAndNil(Result);
    Exit;
  end;
  FURLs.Add(Result);
  FScanner.FURLs.Add(Result);
end;

//==============================================================================================
function TxURL.GetURLsCount: Integer;
begin
  Result := FURLs.Count;
end;

//==============================================================================================
procedure TxURL.GetURLInfo;
var
  FConnect, FRequest: HINTERNET;
  FURLC: TURLComponents;
  FHostName, FURLPath: array[1..INTERNET_MAX_PATH_LENGTH] of Char;
  FBuffSize, FIndex: Cardinal;
  FBuff: string;
begin
  if FScanner.FSession = nil then Exit;
  SetURLType('');
  FillChar(FURLC, SizeOf(TURLComponents), 0);
  with FURLC do begin
    dwStructSize := SizeOf(TURLComponents);
    lpszScheme := nil;
    dwSchemeLength := 0;
    lpSzExtraInfo := nil;
    dwExtraInfoLength := 0;
    lpSzHostName := @FHostName[1];
    dwHostNameLength := INTERNET_MAX_PATH_LENGTH;
    lpszUrlPath := @FURLPath[1];
    dwUrlPathLength := INTERNET_MAX_PATH_LENGTH;
  end;

  InternetCrackUrl(PChar(FURLFullPath), 0, ICU_ESCAPE, FURLC);
  FConnect := InternetConnect(FScanner.FSession, FURLC.lpszHostName, FURLC.nPort, nil,
    nil, INTERNET_SERVICE_HTTP, 0, 0);
  if Assigned(FConnect) then
  try
    FRequest := HttpOpenRequest(FConnect, PChar('HEAD'),
      PChar(StringReplace(FURLC.lpszUrlPath, '/', '//', [rfReplaceAll])), nil,
      nil, nil, INTERNET_FLAG_RELOAD, 0);
    if Assigned(FRequest) then
    try
      if HttpSendRequest(FRequest, nil, 0, FURLC.lpszExtraInfo,
        FURLC.dwExtraInfoLength) then
      begin
        FBuffSize := 1024;
        FIndex := 0;
        SetLength(FBuff, FBuffSize);
        if HttpQueryInfo(FRequest, HTTP_QUERY_CONTENT_TYPE, @FBuff[1],
          FBuffSize, FIndex) then
        begin
          SetLength(FBuff, FBuffSize);
          SetURLType(FBuff);
        end;

        if FURLType <> utHTML then begin
          FBuffSize := 1024;
          FIndex := 0;
          SetLength(FBuff, FBuffSize);
          if HttpQueryInfo(FRequest, HTTP_QUERY_CONTENT_LENGTH, @FBuff[1],
            FBuffSize, FIndex) then
          begin
            SetLength(FBuff, FBuffSize);
            FSize := StrToInt(FBuff);
          end;
        end;

      end;
    finally
      InternetCloseHandle(FRequest);
    end;
  finally
    InternetCloseHandle(FConnect);
  end;
end;

//==============================================================================================
procedure TxURL.SetURLType(const AType: string);
begin
  FURLTypeText := AType;
  FURLType := utUnknown;
  if Pos('.swf', LowerCase(FURLName)) > 0 then FURLType := utSWF else
  if Pos('text/html', AType) = 1 then FURLType := utHTML else
  if Pos('image/gif', AType) = 1 then FURLType := utGIF else
  if Pos('application/x-shockwave-flash', AType) = 1 then FURLType := utSWF else
  if AType = 'text/css' then FURLType := utCSS;
end;

{ TxScanThread }

//==============================================================================================
constructor TxURLScanThread.Create(CreateSuspended: Boolean);
begin
  inherited Create(CreateSuspended);
end;

//==============================================================================================
destructor TxURLScanThread.Destroy;
begin
  inherited;
end;

//==============================================================================================
procedure TxURLScanThread.Execute;
const
  BuffSize = 1024;
var
  FBuff: string;
  FAcceptedLen: Cardinal;
  IHTML: IHTMLDocument2;
  ICol: IHTMLElementCollection;
  IItem: IHTMLElement;
  f: string;
begin
  FURL.FData := '';
  if FWithParse then begin
//    FWB.ParentWindow := FWnd;
    FURL.FScanner.FWB.Navigate(FURL.FURLFullPath);
    repeat
      Application.ProcessMessages;
    until FURL.FScanner.FDownloaded;
  end
  else begin
    repeat
      SetLength(FBuff, BuffSize);
      InternetReadFile(FURL.FHandle, @FBuff[1], BuffSize, FAcceptedLen);
      SetLength(FBuff, FAcceptedLen);
      FURL.FRecvBytes := FURL.FRecvBytes + FAcceptedLen;
      FURL.FData := FURL.FData + FBuff;
    until FAcceptedLen = 0;
  end;
  FURL.FDownloading := False;
  if Assigned(FURL.OnEndDownload) then FURL.OnEndDownload(FURL);
  if FWithParse then begin
    Synchronize(Parse);
  end;
  Terminate;
end;

//==============================================================================================
procedure TxURL.ResumeScan;
begin
  if FParsing or FDownloading then begin
    if Assigned(FOnResumeScan) then FOnResumeScan(Self);
    if FScanThread.Suspended then FScanThread.Resume;
  end;
end;

//==============================================================================================
procedure TxURL.SuspendScan;
begin
  if FParsing or FDownloading then begin
    if Assigned(FOnSuspendScan) then FOnSuspendScan(Self);
    if not FScanThread.Suspended then FScanThread.Suspend;
  end;
end;

//==============================================================================================
procedure TxURLScanThread.Parse;
begin
  FURL.Parse(FURL.FScanner.FWB);
end;

end.
