
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{       Borland Socket Server source code               }
{                                                       }
{       Copyright (c) 1997,99 Inprise Corporation       }
{                                                       }
{*******************************************************}

program ScktSrvr;

uses
  SvcMgr, Forms, Windows, SysUtils, WinSvc, ScktCnst,
  ScktMain in 'ScktMain.pas' {SocketForm};

{$R *.RES}

var
  ServiceExists: Boolean; // AP: check flag

function Installing: Boolean;
begin
  Result := FindCmdLineSwitch('INSTALL',['-','\','/'], True) or
            FindCmdLineSwitch('UNINSTALL',['-','\','/'], True);
end;

function StartService: Boolean;
  var
    Mgr, Svc: Integer;
    UserName, ServiceStartName: string;
    Config: Pointer;
    Size: DWord;
begin
  Result := False;

  Mgr := OpenSCManager(nil, nil, SC_MANAGER_ALL_ACCESS);

  if Mgr <> 0 then
  begin
    Svc := OpenService(Mgr, PChar(SServiceName), SERVICE_ALL_ACCESS);

    Result := Svc <> 0;
    ServiceExists := Result; // added by AP

    if Result then
    begin
      QueryServiceConfig(Svc, nil, 0, Size);
      Config := AllocMem(Size);
      try
        QueryServiceConfig(Svc, Config, Size, Size);
        ServiceStartName := PQueryServiceConfig(Config)^.lpServiceStartName;
        if CompareText(ServiceStartName, 'LocalSystem') = 0 then ServiceStartName := 'SYSTEM';

      finally
        Dispose(Config);
      end;

      CloseServiceHandle(Svc);
    end;

    CloseServiceHandle(Mgr);
  end;

  if Result then
  begin
    Size := 256;
    SetLength(UserName, Size);
    GetUserName(PChar(UserName), Size);
    SetLength(UserName, StrLen(PChar(UserName)));
    Result := CompareText(UserName, ServiceStartName) = 0;
  end;
end;

//=======================================================================================
//main
begin
  quiet := FindCmdLineSwitch('QUIET',['-','/'], True) or FindCmdLineSwitch('SILENT',['-','/'], True);

  if not Installing then
  begin
    CreateMutex(nil, True, 'SCKTSRVR');
    if GetLastError = ERROR_ALREADY_EXISTS then
    begin
      if not quiet then MessageBox(0, PChar(SAlreadyRunning), SApplicationName, MB_ICONERROR);
      Halt;
    end;
  end;

  if StartService or Installing then begin
    if ServiceExists and Installing and quiet then Halt; // added by AP
    SvcMgr.Application.Initialize;
    SocketService := TSocketService.CreateNew(SvcMgr.Application, 0);
    SvcMgr.Application.CreateForm(TSocketForm, SocketForm);
    SvcMgr.Application.Run;
  end
  else begin
    Forms.Application.ShowMainForm := False;
    Forms.Application.Initialize;
    Forms.Application.CreateForm(TSocketForm, SocketForm);
    SocketForm.Initialize(False);
    Forms.Application.Run;
  end;
end.
