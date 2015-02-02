{$I ok_server.inc}
//UDEBUG code already inserted. Please do not remove this line.
unit ServerData;

interface

uses
  SysUtils, Classes, xLngManager, Forms;

type
  TdmData = class(TDataModule)
    Lng: TxLngManager;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  end;

var
  dmData: TdmData;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  {$IFDEF UDEBUG}udebug,{$ENDIF}
  ssSrvConst, ssRegUtils, Windows, xLngDefs;

{$IFDEF UDEBUG}var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';{$ENDIF}

{$R *.dfm}

//==============================================================================================
procedure TdmData.DataModuleCreate(Sender: TObject);
  var
    n: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TdmData.DataModuleCreate') else _udebug := nil;{$ENDIF}

  CountryRules := TCountryRules.Create(ServerPath + 'CountryFlags.dll');

  if not ReadFromRegInt(MainRegKey, 'CountryID', n, HKEY_LOCAL_MACHINE)
     or (n < 0) or (n > cidMax)
  then begin
    if not ReadFromRegInt(MainRegKey, 'CountryID', n, HKEY_CURRENT_USER) 
       or (n < 0) or (n > cidMax)
    then begin
      n := 0;
      LogEvent('! CountryID is not set');
    end
    else WriteToRegInt(MainRegKey, 'CountryID', 0, HKEY_LOCAL_MACHINE);
  end;

  CountryRules.SetCurrent(n);
 
  LogEvent('+ CountryID: ' + IntToStr(CountryRules.CID));

  //--------------------------------------------------------------
  if not ReadFromRegStr(MainRegKey, 'Lang', LangName, HKEY_CURRENT_USER) or (-1 = LangIDbyName(LangName)) then begin
    if not ReadFromRegStr(MainRegKey, 'Lang', LangName, HKEY_LOCAL_MACHINE) or (-1 = LangIDbyName(LangName)) then begin // getting install default
      if CountryRules.LangID <> -1 then LangName := LangNames[CountryRules.LangID]; // default language for this country
      WriteToRegStr(MainRegKey, 'Lang', LangName, HKEY_LOCAL_MACHINE);
    end;

    WriteToRegStr(MainRegKey, 'Lang', LangName, HKEY_CURRENT_USER);
  end;

  LangID := LangIDbyName(LangName);

  //--------------------------------------------------------------
  with Lng do begin
    CfgFile := ExtractFilePath(ParamStr(0)) + 'LNG\srvlng.ini';

    try
      Active := False;
      ActiveLngIndex := 0;
      Active := True;

      if LangID >= FilesCount // we can have more countries than langs in the future ;)
        then LangID := 0;

      ActiveLngIndex := LangID;

      LangName := langNames[LangID];

    except
      Application.MessageBox('Unable to load language resource file! Exitting.','Language Manager error');
      Application.Terminate;
      Application.ProcessMessages;

      Halt;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TdmData.DataModuleDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TdmData.DataModuleDestroy') else _udebug := nil;{$ENDIF}

  Lng.Active := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('ServerData', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  {$IFDEF UDEBUG}
  //debugUnregisterUnit(DEBUG_unit_ID);
  {$ENDIF}

end.
