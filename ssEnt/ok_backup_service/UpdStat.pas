unit UpdStat;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, SvcMgr, Dialogs,
  DB, DBClient, MConnect, SConnect, ssSocketConnection, xClasses, xLog,
  ExtCtrls, ssClientDataSet;

type
  TsvcUpdateStat = class(TService)
    SConn: TssSocketConnection;
    tmrMain: TTimer;
    Log: TxLog;
    qMain: TxQueue;
    cdsDB: TssClientDataSet;

    procedure ServiceCreate(Sender: TObject);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure ServicePause(Sender: TService; var Paused: Boolean);
    procedure ServiceShutdown(Sender: TService);
    procedure ServiceContinue(Sender: TService; var Continued: Boolean);
    procedure tmrMainTimer(Sender: TObject);
    procedure qMainAction(AAction: TxQueueAction);

  private
    InProcess: Boolean;

  public
    function GetServiceController: TServiceController; override;

  end;

var
  svcUpdateStat: TsvcUpdateStat;

//=============================================================================
//=============================================================================
//=============================================================================
implementation

uses Registry, ok_svc_const, ssRegUtils;
{$R *.DFM}

//=============================================================================
function IntToStrEx(const AValue, ADigits: Integer): string;
  var
    S: string;
    i, l: Integer;
begin
  S := IntToStr(AValue);
  L := Length(S);

  for i := 1 to ADigits - l do S := '0' + S;

  Result := S;
end;

//=============================================================================
procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  svcUpdateStat.Controller(CtrlCode);
end;

//=============================================================================
function TsvcUpdateStat.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

//=============================================================================
procedure TsvcUpdateStat.ServiceCreate(Sender: TObject);
begin
  Log.FileName := ExtractFilePath(ParamStr(0)) + 'svcupdstat.log';
end;

//=============================================================================
procedure TsvcUpdateStat.ServiceStart(Sender: TService; var Started: Boolean);
begin
  Log.Add('Update Statistics Service started');
  tmrMain.Enabled := True;
  Started := True;
end;

//=============================================================================
procedure TsvcUpdateStat.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  Log.Add('Update Statistics Service stopped');
  tmrMain.Enabled := False;
  Stopped := True;
end;

//=============================================================================
procedure TsvcUpdateStat.ServicePause(Sender: TService; var Paused: Boolean);
begin
  Log.Add('Update Statistics Service paused');
  tmrMain.Enabled := False;
  Paused := True;
end;

//=============================================================================
procedure TsvcUpdateStat.ServiceShutdown(Sender: TService);
begin
  Log.Add('Update Statistics Service shutdowned');
end;

//=============================================================================
procedure TsvcUpdateStat.ServiceContinue(Sender: TService; var Continued: Boolean);
begin
  Log.Add('Update Statistics Service continued');
  tmrMain.Enabled := True;
  Continued := True;
end;

//=============================================================================
procedure TsvcUpdateStat.tmrMainTimer(Sender: TObject);
  var
    h, min, sec, msec, d, m, y, h2, min2, sec2: Word;
    FDBKey: string;
    intTmp, i, DBID, intInterval: Integer;
    strType: string;
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
              intTmp := ReadInteger('UpdIntervalValue');

              if intTmp <= 0 then Continue; 

              strType := ReadString('UpdIntervalType');
              dtTime := ReadDateTime('UpdTime');

              try
                dtLastBackup := ReadDateTime('UpdLastTime');

              except
                dtLastBackup := 0;
              end;

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
                    qMain.Add(0, DBID, 0);
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
//  Log.Add('begin');
end;

//=============================================================================
procedure TsvcUpdateStat.qMainAction(AAction: TxQueueAction);
  var
    h, min, sec, msec, d, m, y: Word;
    DBID, Res: Integer;
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
    Log.Add('Start updating statistics for database <' + cdsDB.FieldByName('desc').AsString + '>');
    DBID := AAction.Param;
    DecodeTime(Time, h, min, sec, msec);
    DecodeDate(Date, y, m, d);

    try
      //Log.Add(BackupFile);

      Res := SConn.AppServer.db_UpdateStat(DBID);

      if Res = 0
        then begin
          Log.Add('Update statistics for database <' + cdsDB.FieldByName('desc').AsString + '> complete');
          WriteToRegDate(BackupSvcRegKey + '\DB' + IntToStr(DBID), 'UpdLastTime', Now, HKEY_LOCAL_MACHINE);
        end  
        else Log.Add('Error: Update statistics for database <' + cdsDB.FieldByName('desc').AsString + '> failed')

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
