//UDEBUG code already inserted. Please do not remove this line.
unit xLngManager;

interface

uses
  {$IFNDEF NODESIGN}DesignEditors,{$ENDIF}
  SysUtils, Classes, IniFiles, Contnrs, xLog;

type
  TxStorageType = (stText, stDLL);

  TxLngManager = class;

  //------------------------------------------------------------
  TxLngManItem = class
    private
      FParent: TxLngManItem;
      FText: string;
      FKeyName: string;

      procedure SetText(const Value: string);
      procedure SetKeyName(const Value: string);

    public
      constructor Create(const AKeyName, AText: string; AParent: TxLngManItem = nil); virtual;
      property KeyName: string read FKeyName write SetKeyName;
      property Parent: TxLngManItem read FParent write FParent;
      property Text: string read FText write SetText;
  end;

  //------------------------------------------------------------
  TxLngFile = class
    private
      FLngFile: TIniFile;
      FItems: TObjectList;
      FParent: TxLngManager;
      FCfgFile: string;
      FFileName: string;
      FDesc: string;
      FLangName: string;

      procedure SetFileName(const Value: string);
      procedure SetDesc(const Value: string);
      function GetItem(Index: Integer): TxLngManItem;
      function GetCount: Integer;
      procedure RecreateIniFile;
      function GetIndex: Integer;
      procedure SetLangName(const Value: string);

    protected
      function AddItem(const AKeyName, AText: string; AParent: TxLngManItem): TxLngManItem;

    public
      constructor Create(const ADesc, AFileName, AName, ACfgFile: string); reintroduce;
      destructor Destroy; override;

      function AddItemEx(const AKeyName, AText: string; AParent: TxLngManItem): TxLngManItem;
      procedure Clear;
      procedure DropItem(AItem: TxLngManItem);
      function GetRS(const ASection, AKeyName: string): string;
      procedure Load;
      procedure UpdateItem(AItem: TxLngManItem; const AKeyName, AText: string);
      function Read(const ASection, AKey: string): string;
      procedure Write(const ASection, AKey, AValue: string);

      property CfgFile: string read FCfgFile write FCfgFile;
      property Count: Integer read GetCount;
      property Desc: string read FDesc write SetDesc;
      property FileName: string read FFileName write SetFileName;
      property LangName: string read FLangName write SetLangName;
      property Index: Integer read GetIndex;
      property Items[Index: Integer]: TxLngManItem read GetItem;
      property Parent: TxLngManager read FParent;
  end;

  //------------------------------------------------------------
  TxLngManager = class(TComponent)
    private
      FActive: Boolean;
      FFiles: TObjectList;
      FModifyOnly: Boolean;
      FActiveLngIndex: Integer;
      FStorageType: TxStorageType;
      FCfgFile: TFileName;
      FDefaultSection: String;

      procedure SetActive(const Value: Boolean);
      procedure LoadItems;
      procedure SetActiveLngIndex(const Value: Integer);
      function GetActiveLngFile: TxLngFile;
      procedure SetStorageType(const Value: TxStorageType);
      function GetFile(Index: Integer): TxLngFile;
      function GetFilesCount: Integer;
      procedure SetFile(Index: Integer; const Value: TxLngFile);
      procedure SetCfgFile(const Value: TFileName);
      function ReadCfgFile: Boolean;
      function GetActiveLng: string;
      procedure SetActiveLng(const Value: string);
      procedure setDefaultSection(const Value: String);

    protected
      procedure Loaded; override;

    public
      Logger: TxLog;
      function AddFile: TxLngFile;
      procedure DropFile(AIndex: Integer);

      function GetRS(const ASection, AKeyName: string): string;
      procedure Clear;
      procedure ClearCfg;
      constructor Create(AOwner: TComponent); override;
      destructor Destroy; override;
      procedure Open;
      procedure Close;
      procedure ShowEditor;

      property ActiveLng: TxLngFile read GetActiveLngFile;
      property FilesCount: Integer read GetFilesCount;
      property Files[Index: Integer]: TxLngFile read GetFile write SetFile;

    published
      property Active: Boolean read FActive write SetActive;
      property ActiveLngIndex: Integer read FActiveLngIndex write SetActiveLngIndex default -1;
      property ActiveLngDesc: string read GetActiveLng write SetActiveLng;
      property CfgFile: TFileName read FCfgFile write SetCfgFile;
      property DefaultSection: String read FDefaultSection write setDefaultSection;
      property ModifyOnly: Boolean read FModifyOnly write FModifyOnly default False;
      property StorageType: TxStorageType read FStorageType write SetStorageType default stText;
  end;

  //------------------------------------------------------------
  {$IFNDEF NODESIGN}
  TxLngManEditor = class(TComponentEditor)
    public
      function GetVerb(Index: Integer): string; override;
      function GetVerbCount: integer; override;
      procedure ExecuteVerb(Index: Integer); override;
  end;
  {$ENDIF}

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  {$IFNDEF NODESIGN}xLngManDsgn,{$ENDIF}
  {$IFDEF UDEBUG}Udebug,{$ENDIF}
  SysUtils, xStrUtils, ComObj, Dialogs, Controls;

{$IFDEF UDEBUG}var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';{$ENDIF}

//==============================================================================================
procedure TxLngManager.Clear;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngManager.Clear') else _udebug := nil;{$ENDIF}

  FFiles.Clear;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
constructor TxLngManager.Create(AOwner: TComponent);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngManager.Create') else _udebug := nil;{$ENDIF}

  inherited Create(AOwner);

  FFiles := TObjectList.Create(True);

  FActiveLngIndex := -1;
  Logger := nil;
  FDefaultSection := '';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
destructor TxLngManager.Destroy;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngManager.Destroy') else _udebug := nil;{$ENDIF}


  Clear;
  FFiles.Destroy;

  inherited;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxLngManager.LoadItems;
  var
    i: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngManager.LoadItems') else _udebug := nil;{$ENDIF}


  for i := 0 to FilesCount - 1 do begin
    {$IFDEF UDEBUG}debugInstantLog('TxLngManager.LoadItems: reading lang file ' + Files[i].FileName);{$ENDIF}
    Files[i].Clear;
    Files[i].Load;
  end;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxLngManager.SetActive(const Value: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngManager.SetActive') else _udebug := nil;{$ENDIF}


  if FActive = Value then  begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;


  if Value and (csLoading in ComponentState) then begin
    FActive := False;
    ActiveLngIndex := -1;
    Clear;
     begin
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

  end;

  if Value then begin
    {$IFDEF UDEBUG}debugInstantLog('TxLngManager.SetActive: reading config ' + FCfgFile);{$ENDIF}
    if not ReadCfgFile then raise Exception.Create('Invalid configuration file! Check CfgFile property.');
    LoadItems;
  end
  else begin
    ActiveLngIndex := -1;
    Clear;
  end;

  {$IFDEF UDEBUG}debugInstantLog('TxLngManager.SetActive: set to ' + ifThen(Value, 'ON', 'OFF'));{$ENDIF}
  FActive := Value;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxLngManager.Loaded;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngManager.Loaded') else _udebug := nil;{$ENDIF}


  inherited;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxLngManager.ShowEditor;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngManager.ShowEditor') else _udebug := nil;{$ENDIF}


  {$IFNDEF NODESIGN}
  with TfrmLngManDsgn.Create(nil) do
    try
      LngManager := Self;
      ShowModal;

    finally
      Free;
    end;
  {$ENDIF}


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TxLngManager.GetRS(const ASection, AKeyName: string): string;
  var 
    i: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngManager.GetRS') else _udebug := nil;{$ENDIF}


  if (trim(Asection) = '') and (FDefaultSection = '') then begin Result := AKeyName;  begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;
 end;

  {$IFNDEF PKG}
  if FActiveLngIndex = -1 then  begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  {$ELSE}
  if FActiveLngindex = -1 then begin // for ready-getting captions @ design time
    SetActive(True);
    SetActiveLngIndex(0);
  end;
  {$ENDIF}

  Result := AKeyName + ' of ' + ASection + ' missing!';

  with ActiveLng do begin
    if trim(ASection) <> '' then
      for i := 0 to Count - 1 do
        if (Items[i].Parent <> nil) and (0 = AnsiCompareText(Items[i].Parent.KeyName, ASection))
            and (0 = AnsiCompareText(Items[i].KeyName, AKeyName)) and (Items[i].Text <> '')
          then begin
            Result := Items[i].Text;
             begin
              {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
              Exit;
            end;

          end;

    if FDefaultSection <> '' then // not found. trying default
      for i := 0 to Count - 1 do
        if (Items[i].Parent <> nil) and (0 = AnsiCompareText(Items[i].Parent.KeyName, FDefaultSection))
            and (0 = AnsiCompareText(Items[i].KeyName, AKeyName)) and (Items[i].Text <> '')
          then begin
            Result := Items[i].Text;
             begin
              {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
              Exit;
            end;

          end;
  end; // with ActiveLng

  {$IFNDEF PKG}
  if Logger <> nil then Logger.Add('langman: ' + Result);
  {$ENDIF}


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

{ TxLngManEditor }
{$IFNDEF NODESIGN}
//==============================================================================================
procedure TxLngManEditor.ExecuteVerb(Index: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngManEditor.ExecuteVerb') else _udebug := nil;{$ENDIF}


  case Index of
   0: with TxLngManager(Component) do begin
        if not Active then Active := True;
        ShowEditor;
      end;
  end;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TxLngManEditor.GetVerb(Index: Integer): string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngManEditor.GetVerb') else _udebug := nil;{$ENDIF}


  case Index of
    0: Result := 'Items...';
  end;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TxLngManEditor.GetVerbCount: integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngManEditor.GetVerbCount') else _udebug := nil;{$ENDIF}

  Result := 1;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
{$ENDIF}

//==============================================================================================
procedure TxLngManager.Close;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngManager.Close') else _udebug := nil;{$ENDIF}

  Active := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxLngManager.Open;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngManager.Open') else _udebug := nil;{$ENDIF}

  Active := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxLngManager.SetActiveLngIndex(const Value: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngManager.SetActiveLngIndex') else _udebug := nil;{$ENDIF}

  if ( Value < 0 ) or ( Value > FFiles.Count - 1 )
    then FActiveLngIndex := -1
    else FActiveLngIndex := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TxLngManager.GetActiveLngFile: TxLngFile;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngManager.GetActiveLngFile') else _udebug := nil;{$ENDIF}

  Result := TxLngFile(FFiles[FActiveLngIndex]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxLngManager.SetStorageType(const Value: TxStorageType);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngManager.SetStorageType') else _udebug := nil;{$ENDIF}

  FStorageType := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxLngManager.DropFile(AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngManager.DropFile') else _udebug := nil;{$ENDIF}

  if Files[AIndex].Desc <> '' then
    with TIniFile.Create(FCfgFile) do
    try
      EraseSection(Files[AIndex].Desc);

    finally
      Free;
    end;

  FFiles.Delete(AIndex);

  if AIndex <= FActiveLngIndex then ActiveLngIndex := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TxLngManager.AddFile: TxLngFile;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngManager.AddFile') else _udebug := nil;{$ENDIF}


  Result := TxLngFile.Create('', '', '', FCfgFile);
  Result.FParent := Self;
  FFiles.Add(Result);


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TxLngManager.GetFile(Index: Integer): TxLngFile;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngManager.GetFile') else _udebug := nil;{$ENDIF}

  Result := TxLngFile(FFiles[Index]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TxLngManager.GetFilesCount: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngManager.GetFilesCount') else _udebug := nil;{$ENDIF}

  Result := FFiles.Count;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxLngManager.SetFile(Index: Integer; const Value: TxLngFile);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngManager.SetFile') else _udebug := nil;{$ENDIF}
  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxLngManager.SetCfgFile(const Value: TFileName);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngManager.SetCfgFile') else _udebug := nil;{$ENDIF}


  Active := False;
  FCfgFile := Value;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TxLngManager.ReadCfgFile: Boolean;
  var
    FCfg: TIniFile;
    FSec: TStringList;
    i: Integer;
    FLngFile: TxLngFile;
    FDesc, FName, FLangName: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngManager.ReadCfgFile') else _udebug := nil;{$ENDIF}


  Result := False;

  if not FileExists(FCfgFile) then  begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;


  FSec := TStringList.Create;

  try
    try
      FCfg := TIniFile.Create(FCfgFile);
      FCfg.ReadSections(FSec);
      FFiles.Clear;

      for i := 0 to FSec.Count - 1 do begin
        FDesc := DelCharsEx(FSec[i], ['[', ']']);
        FName := FCfg.ReadString(FSec[i], 'FileName', '');

        if FName[2] <> ':'
          then FName := ExtractFilePath(FCfgFile) + FName; // convert relative path to full

        FLangName := FCfg.ReadString(FSec[i], 'LangName', '');
        FLngFile := TxLngFile.Create(FDesc, FName, FLangName, FCfgFile);
        FLngFile.CfgFile := FCfgFile;
        FLngFile.FParent := Self;
        FFiles.Add(FLngFile);
      end;

      Result := True;

    except
      FFiles.Clear;
    end;

  finally
    FSec.Free;
  end;

  if FFiles.Count > 0 then ActiveLngIndex := 0;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TxLngManager.GetActiveLng: string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngManager.GetActiveLng') else _udebug := nil;{$ENDIF}


  if FActiveLngIndex <> -1
    then Result := TxLngFile(FFiles[FActiveLngIndex]).Desc
    else Result := '<not defined>';


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxLngManager.SetActiveLng(const Value: string);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngManager.SetActiveLng') else _udebug := nil;{$ENDIF}


  for i := 0 to FilesCount - 1 do
    if Files[i].Desc = Value then begin
      ActiveLngIndex := i;
       begin
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;

    end;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxLngManager.ClearCfg;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngManager.ClearCfg') else _udebug := nil;{$ENDIF}


  with TIniFile.Create(FCfgFile) do
  try
    for i := 0 to FFiles.Count - 1 do
      if Files[i].Desc <> '' then EraseSection(Files[i].Desc);

  finally
    Free;
  end;



  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxLngManager.setDefaultSection(const Value: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngManager.setDefaultSection') else _udebug := nil;{$ENDIF}


  if FDefaultSection = trim(Value) then  begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  
  FDefaultSection := trim(Value);


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

{ TxLngManItem }
//==============================================================================================
//==============================================================================================
//==============================================================================================
constructor TxLngManItem.Create(const AKeyName, AText: string; AParent: TxLngManItem);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngManItem.Create') else _udebug := nil;{$ENDIF}


  FText := AText;
  FKeyName := AKeyName;
  FParent := AParent;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxLngManItem.SetKeyName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngManItem.SetKeyName') else _udebug := nil;{$ENDIF}


  FKeyName := Value;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxLngManItem.SetText(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngManItem.SetText') else _udebug := nil;{$ENDIF}


  FText := Value;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

{ TxLngFile }
//==============================================================================================
//==============================================================================================
//==============================================================================================
function TxLngFile.AddItem(const AKeyName, AText: string; AParent: TxLngManItem): TxLngManItem;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngFile.AddItem') else _udebug := nil;{$ENDIF}


  Result := TxLngManItem.Create(AKeyName, AText, AParent);
  FItems.Add(Result);


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TxLngFile.AddItemEx(const AKeyName, AText: string; AParent: TxLngManItem): TxLngManItem;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngFile.AddItemEx') else _udebug := nil;{$ENDIF}


  Result := AddItem(AKeyName, AText, AParent);

  if AParent <> nil then FLngFile.WriteString(AParent.KeyName, AKeyName, AText);


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxLngFile.Clear;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngFile.Clear') else _udebug := nil;{$ENDIF}


  FItems.Clear;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
constructor TxLngFile.Create(const ADesc, AFileName, AName, ACfgFile: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngFile.Create') else _udebug := nil;{$ENDIF}


  inherited Create;

  FLngFile := nil;
  FItems := TObjectList.Create(True);
  FDesc := ADesc;

  if AFileName[2] <> ':'
    then FFileName := ExtractFilePath(ParamStr(0)) + AFileName
    else FFileName := AFileName;

  FLangName := AName;

  FCfgFile := ACfgFile;

  RecreateIniFile;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
destructor TxLngFile.Destroy;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngFile.Destroy') else _udebug := nil;{$ENDIF}


  if FLngFile <> nil then FreeAndNil(FLngFile);
  FItems.Free;

  inherited;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxLngFile.DropItem(AItem: TxLngManItem);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngFile.DropItem') else _udebug := nil;{$ENDIF}


  with FLngFile do
    if AItem.Parent = nil
      then EraseSection(AItem.KeyName)
      else DeleteKey(AItem.Parent.KeyName, AItem.KeyName);


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TxLngFile.GetCount: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngFile.GetCount') else _udebug := nil;{$ENDIF}


  Result := FItems.Count;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TxLngFile.GetIndex: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngFile.GetIndex') else _udebug := nil;{$ENDIF}


  Result := FParent.FFiles.IndexOf(Self);


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TxLngFile.GetItem(Index: Integer): TxLngManItem;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngFile.GetItem') else _udebug := nil;{$ENDIF}


  Result := TxLngManItem(FItems[Index]);


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TxLngFile.GetRS(const ASection, AKeyName: string): string;
  var 
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngFile.GetRS') else _udebug := nil;{$ENDIF}


  Result := AKeyName + ' of ' + ASection;

  for i := 0 to Count - 1 do
    if (Items[i].Parent <> nil) and (0 = AnsiCompareText(Items[i].Parent.KeyName, ASection))
          and (0 = AnsiCompareText(Items[i].KeyName, AKeyName))
      then begin
        Result := Items[i].Text;
         begin
          {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
          Exit;
        end;

      end;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxLngFile.Load;
  var
    F: TextFile;
    S: string;
    p: Integer;
    FItem, FCurSection: TxLngManItem;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngFile.Load') else _udebug := nil;{$ENDIF}


  if FFileName = '' then  begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;


  AssignFile(F, FFileName);

  try
    Reset(F);
    FCurSection := nil;

    while not Eof(F) do begin
      Readln(F, S);
      S := Trim(S);

      if ( S = '' ) or ( s[1] = ';' ) then Continue;

      if S[1] = '[' then begin
        FItem := AddItem(AnsiLowerCase(AnsiMidStr(s, 2, length(s) - 2 )), '', nil);
        FCurSection := FItem;
      end
      else if 0 <> AnsiPos('=', s) then begin
        p := AnsiPos('=', s);
        AddItem( AnsiLowerCase(AnsiMidStr(S, 1, p - 1)), AnsiMidStr(S, p + 1, 999), FCurSection );
      end;
    end;

    CloseFile(F);

  except
    CloseFile(F);
    raise Exception.Create('Error loading resource file!');
  end;

  {$IFDEF DEBUG}debugInstantLog('TxLngFile.Load for ' + FFileName + ' OK');{$ENDIF}


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TxLngFile.Read(const ASection, AKey: string): string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngFile.Read') else _udebug := nil;{$ENDIF}


  if FLngFile <> nil
    then Result := FLngFile.ReadString(ASection, AKey, '')
    else Result := '';


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxLngFile.RecreateIniFile;
  var
    FName: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngFile.RecreateIniFile') else _udebug := nil;{$ENDIF}


  if Assigned(FLngFile) then FreeAndNil(FLngFile);

  if FFileName = '' then  begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;


  FName := FFileName;

  if not FileExists(FName)
     and (MessageDlg('Resource file "' + FFileName + '" does not exist! Create it?', mtWarning, [mbYes, mbNo], 0) = mrYes)
  then begin
    FileCreate(FName);
  end;

  FLngFile := TIniFile.Create(FName);


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxLngFile.SetDesc(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngFile.SetDesc') else _udebug := nil;{$ENDIF}


  if (FCfgFile <> '') and (FDesc <> Value) and (FDesc <> '') then begin
    with TIniFile.Create(FCfgFile) do
    try
      EraseSection(FDesc);

    finally
      Free;
    end;
  end;

  FDesc := Value;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxLngFile.SetFileName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngFile.SetFileName') else _udebug := nil;{$ENDIF}


  if (FCfgFile <> '') and (Value <> '') then begin
    with TIniFile.Create(FCfgFile) do
    try
      WriteString(FDesc, 'FileName', Value);

    finally
      Free;
    end;
  end;

  FFileName := Value;

  RecreateIniFile;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxLngFile.SetLangName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngFile.SetLangName') else _udebug := nil;{$ENDIF}


  if (FCfgFile <> '') and (Value <> '') then begin
    with TIniFile.Create(FCfgFile) do
    try
      WriteString(FDesc, 'LangName', Value);

    finally
      Free;
    end;
  end;

  FLangName := Value;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxLngFile.UpdateItem(AItem: TxLngManItem; const AKeyName, AText: string);
  var 
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngFile.UpdateItem') else _udebug := nil;{$ENDIF}


  if AItem.Parent = nil then begin
    FLngFile.EraseSection(AItem.KeyName);

    for i := 1 to Count - 1 do
      if Items[i].Parent = AItem
        then FLngFile.WriteString(AKeyName, Items[i].KeyName, Items[i].Text);
  end
  else begin
    if AKeyName <> AItem.KeyName then FLngFile.DeleteKey(AItem.Parent.KeyName, AItem.KeyName);

    FLngFile.WriteString(AItem.Parent.KeyName, AKeyName, AText);
  end;

  AItem.Text := AText;
  AItem.KeyName := AKeyName;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxLngFile.Write(const ASection, AKey, AValue: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxLngFile.Write') else _udebug := nil;{$ENDIF}


  FLngFile.WriteString(ASection, AKey, AValue);


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('xLngManager', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  {$IFDEF UDEBUG}
  //debugUnregisterUnit(DEBUG_unit_ID);
  {$ENDIF}

end.
