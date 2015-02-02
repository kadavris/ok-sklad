//UDEBUG code already inserted. Please do not remove this line.
{$I ok_server.inc}
unit Props;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, xLngdefs, Mask;

type
  TfrmProps = class(TForm)
    gbDC: TGroupBox;
    rbtNoCheck: TRadioButton;
    rbtCheck: TRadioButton;
    edClientsCheckInterval: TEdit;
    lMin: TLabel;
    gbCommon: TGroupBox;
    chbProvExecLogging: TCheckBox;
    edTimeout: TEdit;
    lTimeout: TLabel;
    lMinTimeout: TLabel;
    lMaxLogSize: TLabel;
    edMaxLogSize: TEdit;
    cbMaxLogSize: TComboBox;
    cbLanguage: TComboBox;
    lLanguage: TLabel;
    gbDebug: TGroupBox;
    cbDebugLevel: TComboBox;
    btnRepairSS: TButton;
    Panel1: TPanel;
    btnOk: TButton;
    lDebugLevel: TLabel;
    lLogBackupQuantity: TLabel;
    edLogBackupQuantity: TMaskEdit;

    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure rbtNoCheckClick(Sender: TObject);
    procedure edClientsCheckIntervalKeyPress(Sender: TObject; var Key: Char);
    procedure cbLanguageChange(Sender: TObject);
    procedure cbDebugLevelChange(Sender: TObject);
    procedure btnRepairSSClick(Sender: TObject);

  private
    procedure SetCaptions;
  end;

var
  frmProps: TfrmProps;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  {$IFDEF UDEBUG}udebug,{$ENDIF}
  MAth, ssSrvConst, ssSrvDB, ServerData, ssRegUtils, ShellAPI;

{$IFDEF UDEBUG}
var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';
{$ENDIF}

{$R *.dfm}

//==============================================================================================
procedure TfrmProps.FormCreate(Sender: TObject);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmProps.FormCreate') else _udebug := nil;{$ENDIF}

  chbProvExecLogging.Checked := ProvExecLogging;
  edClientsCheckInterval.Text := IntToStr(ClientCheckInterval div 60000);
  edTimeOut.Text := IntToStr(ClientCheckTimeOut div 60000);

  edLogBackupQuantity.Text := IntTosTr(MaxLogBackupsQuantity);

  if CheckForDeadConnections
    then rbtCheck.Checked := True
    else rbtNoCheck.Checked := True;

  cbLanguage.Clear;
  with dmData.Lng do begin
    for i := 0 to FilesCount-1 do cbLanguage.Items.Add(Files[i].LangName);
    cbLanguage.ItemIndex := ActiveLngIndex;
  end;

  cbDebugLevel.ItemIndex := DebugLevel;

  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmProps.btnOkClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmProps.btnOkClick') else _udebug := nil;{$ENDIF}

  ProvExecLogging := chbProvExecLogging.Checked;

  CheckForDeadConnections := rbtCheck.Checked;
  ClientCheckInterval := Trunc(StrToInt(edClientsCheckInterval.Text) * 60000);
  ClientCheckTimeOut := Trunc(StrToInt(edTimeout.Text) * 60000);

  if cbMaxLogSize.ItemIndex = 0
    then MaxLogSize := StrToInt(edMaxLogSize.Text)
    else MaxLogSize := StrToInt(edMaxLogSize.Text) * 1000;

  xSrvDB.Timer.Interval := ClientCheckInterval;

  MaxLogBackupsQuantity := StrToInt(edLogBackupQuantity.Text);

  WriteToRegInt(ServerRegKey, 'CheckForDeadConnections', Integer(CheckForDeadConnections), HKEY_LOCAL_MACHINE);
  WriteToRegInt(ServerRegKey, 'ClientCheckInterval', ClientCheckInterval, HKEY_LOCAL_MACHINE);
  WriteToRegInt(ServerRegKey, 'ClientCheckTimeOut', ClientCheckTimeOut, HKEY_LOCAL_MACHINE);
  WriteToRegInt(ServerRegKey, 'MaxLogSize', MaxLogSize, HKEY_LOCAL_MACHINE);
  WriteToRegInt(ServerRegKey, 'MaxLogBackups', MaxLogBackupsQuantity, HKEY_LOCAL_MACHINE);

  WriteToRegStr(ServerRegKey, 'Lang', LangName, HKEY_LOCAL_MACHINE);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmProps.rbtNoCheckClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmProps.rbtNoCheckClick') else _udebug := nil;{$ENDIF}

  edClientsCheckInterval.Enabled := rbtCheck.Checked;
  lMin.Enabled := rbtCheck.Checked;
  lTimeout.Enabled := rbtCheck.Checked;
  lMinTimeout.Enabled := rbtCheck.Checked;
  edTimeOut.Enabled := rbtCheck.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmProps.edClientsCheckIntervalKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmProps.edClientsCheckIntervalKeyPress') else _udebug := nil;{$ENDIF}

  if not (Key in ['0'..'9', #13, #8]) then Key := #0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmProps.SetCaptions;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmProps.SetCaptions') else _udebug := nil;{$ENDIF}

  with dmData.Lng do begin
    Self.Caption := GetRS(Self.Name, 'rs_Title');
    //gbLogging.Caption := ' ' + GetRS(Self.Name, 'rs_LogOptions') + ' ';
    gbDC.Caption := ' ' + GetRS(Self.Name, 'rs_CheckingDeadConn') + ' ';
    chbProvExecLogging.Caption := GetRS(Self.Name, 'rs_LoggingProvExec');
    rbtNoCheck.Caption := GetRS(Self.Name, 'rs_DontCheckDC');
    rbtCheck.Caption := GetRS(Self.Name, 'rs_CheckDC');
    lMin.Caption := GetRS(Self.Name, 'rs_Min');
    lMinTimeout.Caption := GetRS(Self.Name, 'rs_Min');
    lTimeout.Caption := GetRS(Self.Name, 'rs_DCTimeout');

    gbCommon.Caption := ' ' + GetRS(Self.Name, 'rs_Common') + ' ';
    lMaxLogSize.Caption := GetRS(Self.Name, 'rs_MaxLogSize') + ':';

    lLogBackupQuantity.Caption := GetRS(Self.Name, 'lLogBackupQuantity') + ':';

    with cbMaxLogSize do begin
      Items.Clear;
      Items.Add(GetRS(Self.Name, 'rs_InKB'));
      Items.Add(GetRS(Self.Name, 'rs_InMB'));
    end;

    if MaxLogSize >= 1000 then begin
      edMaxLogSize.Text := IntToStr(MaxLogSize div 1000);
      cbMaxLogSize.ItemIndex := 1;
    end
    else begin
      edMaxLogSize.Text := IntToStr(MaxLogSize);
      cbMaxLogSize.ItemIndex := 0;
    end;

    lLanguage.Caption := GetRS(Self.Name, 'rs_LangLabel');

    btnRepairSS.Caption := GetRS(Self.Name, 'btnRepairSS');

    gbDebug.Caption := '  ' + GetRS(Self.Name, 'gbDebug') + '  ';
    lDebugLevel.Caption := GetRS(Self.Name, 'lDebugLevel');

    cbDebugLevel.Items.Clear;
    cbDebugLevel.Items.BeginUpdate;
    for i := 0 to 11 do
      case i of
        0,3,5,10,11: cbDebugLevel.Items.Add(GetRS(Self.Name, 'dl' + IntTostr(i)));
        else cbDebugLevel.Items.Add(IntToStr(i));
      end;//case
    cbDebugLevel.Items.endUpdate;

    cbDebugLevel.ItemIndex := DebugLevel;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmProps.cbLanguageChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmProps.cbLanguageChange') else _udebug := nil;{$ENDIF}

  with dmData.Lng do begin
    ActiveLngIndex := cbLanguage.ItemIndex;
    LangID := cbLanguage.ItemIndex;
    LangName := langNames[LangID];
    Active := true;
  end;

  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmProps.cbDebugLevelChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmProps.cbDebugLevelChange') else _udebug := nil;{$ENDIF}

  DebugLevel := cbDebugLevel.ItemIndex;
  WriteToRegInt(ServerRegKey, 'DebugLevel', DebugLevel);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmProps.btnRepairSSClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar(serverPath + '\\scktsrvr.exe'), '/silent /install', nil, SW_HIDE);
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('Props', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  {$IFDEF UDEBUG}
  //debugUnregisterUnit(DEBUG_unit_ID);
  {$ENDIF}

end.
