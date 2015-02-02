unit Main;

interface

uses
  Windows, Messages, SysUtils, Classes, SvcMgr, Variants, xClasses, xLog,
  DB, DBClient, ssClientDataSet, MConnect, SConnect, ssSocketConnection,
  ExtCtrls;

type
  TsvcBackup = class(TService)
    tmrMain: TTimer;
    SConn: TssSocketConnection;
    cdsDB: TssClientDataSet;
    Log: TxLog;
    qMain: TxQueue;
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure ServiceContinue(Sender: TService; var Continued: Boolean);
    procedure ServicePause(Sender: TService; var Paused: Boolean);
    procedure tmrMainTimer(Sender: TObject);
    procedure ServiceCreate(Sender: TObject);
    procedure ServiceShutdown(Sender: TService);
    procedure qMainAction(AAction: TxQueueAction);
  private
    InProcess: Boolean;
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  svcBackup: TsvcBackup;

//=============================================================================
//=============================================================================
//=============================================================================
//=============================================================================
implementation

uses
  Registry, ssRegUtils, ok_svc_const;
{$R *.DFM}

//=============================================================================
function IntToStrEx(const AValue, ADigits: Integer): string;
var
  S: string;
  i, l: Integer;
begin
  S := IntToStr(AValue);
  L := Length(S);
  for i := 1 to ADigits - l do
    S := '0' + S;
  Result := S;
end;

//=============================================================================
procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  svcBackup.Controller(CtrlCode);
end;

//=============================================================================
function TsvcBackup.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

//=============================================================================
procedure TsvcBackup.ServiceStart(Sender: TService; var Started: Boolean);
begin
  Log.Add('Backup Service started');
  tmrMain.Enabled := True;
  Started := True;
end;

//=============================================================================
procedure TsvcBackup.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  Log.Add('Backup Service stopped');
  tmrMain.Enabled := False;
  Stopped := True;
end;

//=============================================================================
procedure TsvcBackup.ServiceContinue(Sender: TService; var Continued: Boolean);
begin
  Log.Add('Backup Service continued');
  tmrMain.Enabled := True;
  Continued := True;
end;

//=============================================================================
procedure TsvcBackup.ServicePause(Sender: TService; var Paused: Boolean);
begin
  Log.Add('Backup Service paused');
  tmrMain.Enabled := False;
  Paused := True;
end;

//=============================================================================
procedure TsvcBackup.tmrMainTimer(Sender: TObject);
  var
    h, min, sec, msec, d, m, y, h2, min2, sec2: Word;
    FDBKey: string;
    intTmp, i, DBID, intInterval: Integer;
    strDir, strType: string;
    dtTime, dtLastBackup: TDateTime;
    lstKeys: TStringList;
begin
  if (Status = csRunning) and not InProcess then begin
    InProcess := True;
    DecodeTime(Time, h, min, sec, msec);
    DecodeDate(Date, y, m, d);

    with TRegistry.Create do
    try
      lstKeys := TStringList.Create;
      RootKey := HKEY_LOCAL_MACHINE;

      if not OpenKey(BackupSvcRegKey, False) then Exit;
      GetKeyNames(lstKeys);
      CloseKey;
      for i := 0 to lstKeys.Count - 1 do begin
        FDBKey := lstKeys.Strings[i];
        if OpenKey(BackupSvcRegKey + '\' + FDBKey, False) then begin
          try
            try
              intTmp := ReadInteger('IntervalValue');
              if intTmp <= 0 then Continue;
              strDir := ReadString('BackupDir');
              strType := ReadString('IntervalType');
              dtTime := ReadDateTime('BackupTime');
              dtLastBackup := ReadDateTime('LastBackupTime');
              DecodeTime(dtTime, h2, min2, sec2, msec);
              intInterval := 1;
              case strType[1] of
                'D': intInterval := intTmp;
                'W': intInterval := intTmp * 7;
                'M': intInterval := intTmp * 30;
              end;

              {$IFDEF DEBUG}
              Log.Add(DateTimeToStr(Now));
              Log.Add(DateTimeToStr(dtLastBackup));
              Log.Add(FloatToStr(Now - dtLastBackup));
              {$ENDIF}
              if (Now - dtLastBackup) > intInterval then begin
                DBID := StrToInt(Copy(FDBKey, 3, Length(FDBKey) - 2));
                if (h = h2) and (min = min2)// and (sec = sec2)
                  then begin
                    qMain.Add(0, DBID, strDir);
                  end;
              end;

            finally
              CloseKey;
            end;

          except
            on e: exception do begin
              Log.Add(e.message);
            end;
          end;
        end;
      end;

    finally
      Free;
      lstKeys.Free;
    end;

    InProcess := False;
  end;
end;

//=============================================================================
procedure TsvcBackup.ServiceCreate(Sender: TObject);
begin
  Log.FileName := ExtractFilePath(ParamStr(0)) + 'svcbackup.log';
end;

//=============================================================================
procedure TsvcBackup.ServiceShutdown(Sender: TService);
begin
  Log.Add('Backup Service shutdowned');
end;

//=============================================================================
procedure TsvcBackup.qMainAction(AAction: TxQueueAction);
  var
    h, min, sec, msec, d, m, y: Word;
    DBID, Res: Integer;
    BackupFile: string;
begin
  try
    SConn.Connected := True;

  except
    InProcess := False;
    Log.Add('Error: could not connect to OK_Server');
    Exit;
  end;

  cdsDB.Open;

  if cdsDB.Locate('dbid', AAction.Param, []) then begin
    Log.Add('Start backuping batabase <' + cdsDB.FieldByName('desc').AsString + '>');
    DBID := AAction.Param;
    DecodeTime(Time, h, min, sec, msec);
    DecodeDate(Date, y, m, d);
    try
      BackupFile := VarToStr(AAction.AddInfo) + '\' + cdsDB.FieldByName('desc').AsString + IntToStrEx(d, 2)
                    + IntToStrEx(m, 2) + IntToStr(y) + '_' + IntToStrEx(h, 2) + IntToStrEx(min, 2) + '.fbk';

      //Log.Add(BackupFile);
      Res := SConn.AppServer.db_Backup(BackupFile, DBID);

      if Res = 0
        then begin
          Log.Add('Database <' + cdsDB.FieldByName('desc').AsString + '> backup complete');
          WriteToRegDate(BackupSvcRegKey + '\DB' + IntToStr(DBID), 'LastBackupTime', Now, HKEY_LOCAL_MACHINE);
        end  
        else Log.Add('Error: Database <' + cdsDB.FieldByName('desc').AsString + '> backup failed')

    except
      on E:Exception do begin
        Log.Add('Error: ' + E.Message);
        SConn.Connected := False;
      end;
    end;
  end;
  cdsDB.Close;
  SConn.Connected := False;
end;

end.
