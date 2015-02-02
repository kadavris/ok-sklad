{$I ok_server.inc}
//UDEBUG code already inserted. Please do not remove this line.
unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShellAPI, Menus, StdCtrls, ExtCtrls, ComCtrls, ActiveX,
  Grids, DBGrids, DB, ImgList;

const
  WM_PRICON = WM_USER + 1;

type
  TfrmMain = class(TForm)
    PopupMenu: TPopupMenu;
    mnuShutdown: TMenuItem;
    N1: TMenuItem;
    mnuProps: TMenuItem;
    pcMain: TPageControl;
    tsClients: TTabSheet;
    tsLog: TTabSheet;
    memLog: TMemo;
    lvMain: TListView;
    tmrClients: TTimer;
    mnuTitle: TMenuItem;
    mnuLog: TMenuItem;
    N3: TMenuItem;
    N2: TMenuItem;
    mnuChangekey: TMenuItem;
    ImageList1: TImageList;
    tsDebug: TTabSheet;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Memo1: TMemo;
    Panel1: TPanel;
    btnDebug1: TButton;
    btnDebug2: TButton;

    procedure FormDestroy(Sender: TObject);
    procedure mnuShutdownClick(Sender: TObject);
    procedure Show1Click(Sender: TObject);
    procedure mnuPropsClick(Sender: TObject);
    procedure tmrClientsTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mnuAboutClick(Sender: TObject);
    procedure mnuLogClick(Sender: TObject);
    procedure mnuChangekeyClick(Sender: TObject);
    procedure btnDebug1Click(Sender: TObject);
    procedure btnDebug2Click(Sender: TObject);
    procedure FormHide(Sender: TObject);

  private
    FIconData: TNotifyIconData;
    FInTimer: boolean;
    procedure WMPrIcon(var M: TMessage); message WM_PRICON;
    procedure SetCaptions;

  public
    procedure AddIcon;
    //procedure AppExeption(Sender: TObject; E: Exception);
  end;

var
  frmMain: TfrmMain;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  {$IFDEF UDEBUG}udebug,{$ENDIF}
  xIBUtils, // for debugging the unit
  Reg, ssSrvConst, Props, ssSrvDB, SrvData, ServerData, About, servlog, strUtils,
  protection;

{$IFDEF UDEBUG}
var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';
{$ENDIF}

{$R *.dfm}

//==============================================================================================
procedure TfrmMain.AddIcon;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.AddIcon') else _udebug := nil;{$ENDIF}
  
  with FIconData do begin
    cbSize := SizeOf(FIconData);
    Wnd := Self.Handle;
    uID := $DEDB;
    uFlags := NIF_MESSAGE or NIF_ICON{ or NIF_TIP};
    hIcon := Forms.Application.Icon.Handle;
    uCallbackMessage := WM_PRICON;
    //StrLCopy(szTip, PChar(Caption), SizeOf(szTip) - 1);
  end;

  Shell_NotifyIcon(NIM_Add, @FIconData);
  
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.FormDestroy') else _udebug := nil;{$ENDIF}
  
  Shell_NotifyIcon(NIM_DELETE, @FIconData);
  
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.mnuShutdownClick(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.mnuShutdownClick') else _udebug := nil;{$ENDIF}

  xSrvDB.Clients.Clear;

  //if not Visible then Close;

  Halt;

  Application.Terminate;
  Application.ProcessMessages;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.WMPrIcon(var M: TMessage);
  var
    pt: TPoint;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.WMPrIcon') else _udebug := nil;{$ENDIF}

  case M.LParam of
  //{$IFNDEF FREE}
    WM_RBUTTONUP:
      begin
        SetForegroundWindow(Handle);

        if not Visible then begin
          GetCursorPos(pt);
          SetCaptions;
          PopupMenu.Popup(pt.x, pt.y);
        end;
      end;
  //{$ENDIF}

    WM_LBUTTONDBLCLK:
      if Visible
        then SetForegroundWindow(Handle)
        else ShowModal;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.Show1Click(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.Show1Click') else _udebug := nil;{$ENDIF}
  
  Self.ShowModal;
  
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmMain.mnuPropsClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.mnuPropsClick') else _udebug := nil;{$ENDIF}
  
  with TfrmProps.Create(nil) do
    try
      ShowModal;
      
    finally
      Free;
    end;
  
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.tmrClientsTimer(Sender: TObject);
  var
    FList: TxClients;
    FItem: TListItem;
    i: integer;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  if not Self.Visible or FInTimer then Exit;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.tmrClientsTimer') else _udebug := nil;{$ENDIF}

  FList := nil;
  FItem := nil;

  try // finally
    FInTimer := True;
    lvMain.Clear;

    try
      FList := TxClients.Create;
      xSrvDB.GetClients(FList);

    except
      on E: Exception do begin
        LogEvent('Error: (xSrvDB.GetClients); ClientsCount=' + IntToStr(xSrvDB.Clients.ClientsCount) + '; ' + E.Message);
        Exit;
      end;
    end;

    for i := 0 to FList.ClientsCount - 1 do begin
      try
        if FList.Items[i] <> nil then begin
          FItem := lvMain.Items.Add;
          FItem.Data := FList.Items[i].Addr;
          FItem.Caption := FList.Items[i].Name + ' [' + FList.Items[i].IP + '] ' + IntToStr(Integer(FList.Items[i].Addr));

          FItem.SubItems.Add(DateTimeToStr(FList.Items[i].Conn_Time));
          FItem.SubItems.Add(DateTimeToStr(FList.Items[i].Check_Time));
        end;

      except
        on E: Exception do LogEvent('! Error: (Get_Clients); ClientsCount=' + IntToStr(FList.ClientsCount) + ifThen(FItem <> nil, FItem.Caption, '') +'; ' + E.Message);
      end;
    end;

  finally
    if Flist <> nil then FList.Free;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    FInTimer := False;
  end;
end;

//==============================================================================================
procedure TfrmMain.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.FormCreate') else _udebug := nil;{$ENDIF}

  try
    Application.Title := OK_AppName + '  ' + OK_Version;

    {$IFNDEF UDEBUG}
    tsDebug.Visible := False;
    {$ENDIF}

  except
  end;

  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.SetCaptions') else _udebug := nil;{$ENDIF}
    
  with dmData.Lng do try
    Self.Caption := OK_AppName + ' ' + OK_Version;
    tsClients.Caption := GetRS(Self.Name, 'rs_Clients');

    lvMain.Columns[0].Caption := GetRS(Self.Name, 'rs_Client');
    lvMain.Columns[1].Caption := GetRS(Self.Name, 'rs_ConnTime');
    lvMain.Columns[2].Caption := GetRS(Self.Name, 'rs_CheckTime');

    mnuProps.Caption := GetRS(Self.Name, 'rs_Props');
    mnuShutdown.Caption := GetRS(Self.Name, 'rs_Shutdown');

    mnuTitle.Caption := GetRS(Self.Name, 'rs_About') + ' ' + Self.Caption;

    {$IFDEF FREE}
      mnuChangeKey.Visible := False;
    {$ELSE}
      if RegInfo.Text = '' then begin
        mnuChangeKey.Caption := GetRS(Self.Name, 'SetKey');
        mnuChangeKey.imageIndex := 6;
      end
      else begin
        mnuChangeKey.Caption := GetRS(Self.Name, 'changeKey');
        mnuChangeKey.imageIndex := 7;
      end;
    {$ENDIF}

    mnuLog.Caption := GetRS(Self.Name, 'rs_mnuLog');

  except
    on e:Exception do LogEvent('TfrmMain.SetCaptions: exception: ' + e.Message);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.FormShow(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.FormShow') else _udebug := nil;{$ENDIF}

  BringToFront;
  pcMain.ActivePage := tsClients;
  tmrClients.Enabled := True;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.FormHide(Sender: TObject);
begin
  tmrClients.Enabled := False;
end;

(*
//==============================================================================================
procedure TfrmMain.AppExeption(Sender: TObject; E: Exception);
begin
  LogEvent(E.Message);
end;
*)

//==============================================================================================
procedure TfrmMain.mnuAboutClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.mnuAboutClick') else _udebug := nil;{$ENDIF}

  with TfrmAbout.Create(nil) do
    try
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.mnuLogClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMain.mnuLogClick') else _udebug := nil;{$ENDIF}

  with TfrmLog.Create(nil) do
    try
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmMain.mnuChangekeyClick(Sender: TObject);
begin
  with TfrmReg.Create(nil) do
  try
    ShowModal;

  finally
    Free;
  end;
end;

//==============================================================================================
procedure TfrmMain.btnDebug1Click(Sender: TObject);
  var
    Error, f, t: String;
begin
  if not OpenDialog1.Execute then Exit;
  f := OpenDialog1.FileName;
  t := AnsiMidStr(f, 1, length(f) - 3) + 'fbk';
  Memo1.Lines.Add('backup from ' + f);
  Memo1.Lines.Add('saving to ' + t);

  if 0 < IBDBBackup('', f, t, dbAdminDefName, dbAdminDefPass, Error)
    then Memo1.Lines.Add(Error);
end;

//==============================================================================================
procedure TfrmMain.btnDebug2Click(Sender: TObject);
  var
    Error, f, t: String;
begin
  if not OpenDialog1.Execute then Exit;
  f := OpenDialog1.FileName;
  t := AnsiMidStr(f, 1, length(f) - 3) + 'fdb';
  Memo1.Lines.Add('restoring from ' + f);
  Memo1.Lines.Add('saving to ' + t);

  if 0 < IBDBRestore('', t, f, dbAdminDefName, dbAdminDefPass, Error)
    then Memo1.Lines.Add(Error);
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('Main', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  {$IFDEF UDEBUG}
  //debugUnregisterUnit(DEBUG_unit_ID);
  {$ENDIF}

end.
