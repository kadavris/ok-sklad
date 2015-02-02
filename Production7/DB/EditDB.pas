{$I ok_sklad.inc}
unit EditDB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxCntner, dxEditor, StdCtrls,
  ActnList, ssBaseTypes, ssFormStorage, cxCheckBox, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxLookAndFeelPainters, cxButtons, ssBaseDlg,
  ssBevel, ImgList, ssSpeedButton, ssPanel, ssGradientPanel, xButton,
  cxMaskEdit, cxButtonEdit, cxLabel, DB, DBClient, MConnect, SConnect,
  ssSocketConnection, ssLabel;

type
  TDBInfo = record
    DBName, DBPath: String;
    DBID, Def: Integer;
  end;
  PDBInfo = ^TDBInfo;

  TfrmEditDB = class(TBaseDlg)
    bvlMain: TssBevel;
    edName: TcxTextEdit;
    lName: TLabel;
    edDBPath: TcxButtonEdit;
    chbDefault: TcxCheckBox;
    lDBText: TcxLabel;
    imgMain: TImage;
    bvlSep: TssBevel;
    btnTestConnect: TxButton;
    aTestConnect: TAction;
    lDBPath: TssLabel;
    lServer: TLabel;
    txtServer: TssBevel;
    imgHost: TImage;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure DataModified(Sender: TObject);
    procedure bvlMainMouseEnter(Sender: TObject);
    procedure bvlMainMouseLeave(Sender: TObject);
    procedure edDBPathPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure aTestConnectExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  protected
    procedure setid(const Value: integer); override;
    procedure SetParentName(const Value: string); override;

  public
    procedure SetCaptions; override;
    { Public declarations }
  end;

var
  frmEditDB: TfrmEditDB;

implementation

uses 
  ssBaseConst, prConst, ClientData, prFun,
  ssCallbackConst, ssClientDataSet, xLngManager, fMessageDlg, udebug;

var 
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}
//==============================================================================================
procedure TfrmEditDB.setid(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDB.setid') else _udebug := nil;{$ENDIF}

  if Value = 0 then begin
    FID := Value;
    Self.Caption := dmData.Lng.GetRS(ParentNameEx, 'TitleAdd');
    //edDBPath.Text := dmData.SConnection.AppServer.GetDBFileName;
  end
  else with PDBInfo(Value)^ do begin
    FID := DBID;
    Self.Caption := dmData.Lng.GetRS(ParentNameEx, 'TitleEdit');
    edName.Text := DBName;
    edDBPath.Text := DBPath;
    edDBPath.Enabled := False;
    lDBPath.Enabled := False;
    chbDefault.Checked := Def = 1;

    if not IsPattern then begin
      chbDefault.Enabled := not chbDefault.Checked;
      btnApply.Enabled := False;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDB.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    NewRecord: boolean;
    dbid: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDB.FormCloseQuery') else _udebug := nil;{$ENDIF}


    if ModalResult in [mrOK, mrYes] then begin
      CanClose := False;

      Screen.Cursor := crHourGlass;
      try
        NewRecord := FID = 0;
        if not dmData.Sconnection.Connected then dmData.SConnection.Open;

        if NewRecord then begin
          if dmData.SConnection.AppServer.NewDB(edDBPath.Text, '') = 0 then begin
            ssMessageDlg(rs(ParentNameEx, 'DBCreateError'), ssmtError, [ssmbOk]);
              {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
              Exit;
          end;
          dbid := dmData.SConnection.AppServer.AddDB(0, edName.Text, Integer(chbDefault.Checked), 1);
          if (dbid <= 0) or (dmData.SConnection.AppServer.AddDBParams(dbid,
              'PROVIDER=LCPI.IBProvider.1;User ID=SYSDBA;Password=masterkey;Persist Security Info=True;ctype=WIN1251;auto_commit=True;Data Source=' + edDBPath.Text, 0) <> 0)
          then begin
            ssMessageDlg(rs(ParentNameEx, 'DBCreateError'), ssmtError, [ssmbOk]);
            {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
            Exit;
          end;
        end
        else begin
          if dmData.SConnection.AppServer.db_Update(FID, edName.Text,
            Integer(chbDefault.Checked), edDBPath.Text) <> 0 then begin
            ssMessageDlg(rs(ParentNameEx, 'DBUpdateError'), ssmtError, [ssmbOk]);
            {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
            Exit;
          end;
        end;

        SendMessage(MainHandle, WM_REFRESH, dbid, 0);

        if ModalResult = mrYes then begin
          if NewRecord then begin
            if not IsPattern then edName.Text := '';
            edDBPath.Text := dmData.SConnection.AppServer.GetDBFileName;
            chbDefault.Enabled := True;
            chbDefault.Checked := False;
            edName.SetFocus;
            FID := 0;
          end
        end
        else CanClose := True;

        FModified := False;
      finally
        Screen.Cursor := crDefault;
      end;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDB.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDB.ActionListUpdate') else _udebug := nil;{$ENDIF}


   aOk.Enabled := (Trim(edName.Text)<>'') and (Trim(edDBPath.Text)<>'');
   aApply.Enabled := aOk.Enabled and FModified;

   aTestConnect.Enabled := Trim(edDBPath.Text) <> '';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDB.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDB.DataModified') else _udebug := nil;{$ENDIF}


  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDB.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDB.SetCaptions') else _udebug := nil;{$ENDIF}


  inherited;

  with dmData.Lng do begin
    lName.Caption := GetRS(ParentNameEx, 'Name') + ':';
    chbDefault.Properties.Caption := GetRS(ParentNameEx, 'Def');
    lDBText.Caption := GetRS(ParentNameEx, 'DBWarning');
    lDBPath.Caption := GetRS(ParentNameEx, 'Path') + ':';
    aTestConnect.Caption := GetRS(ParentNameEx, 'TestConnect');
    lServer.Caption := GetRS(ParentNameEx, 'Server') + ':';
    txtServer.Caption := '    ' + dmData.SConnection.Host;

    aOK.Caption := GetRS('Common', 'OK');
    aCancel.Caption := GetRS('Common', 'Cancel');
    aApply.Caption := GetRS('Common', 'Apply');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDB.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDB.SetParentName') else _udebug := nil;{$ENDIF}


  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDB.bvlMainMouseEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDB.bvlMainMouseEnter') else _udebug := nil;{$ENDIF}

  with Sender as TssBevel do
    if HotTrack then bvlSep.ColorOuter := HotTrackColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditDB.bvlMainMouseLeave(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDB.bvlMainMouseLeave') else _udebug := nil;{$ENDIF}

  with Sender as TssBevel do
    if HotTrack then bvlSep.ColorOuter := clBtnShadow;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditDB.edDBPathPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDB.edDBPathPropertiesButtonClick') else _udebug := nil;{$ENDIF}


  with TSaveDialog.Create(nil) do
    try
      DefaultExt := 'gdb';
      Filter := 'Interbase/Firebird Database (*.gdb)|*.gdb|All Files (*.*)|*.*';
      if Execute then begin
        edDBPath.Text := FileName;
      end;
    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDB.aTestConnectExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDB.aTestConnectExecute') else _udebug := nil;{$ENDIF}


  if dmData.SConnection.AppServer.db_TestConnect(edDBPath.Text) = 0
    then ssMessageDlg(rs(ParentNameEx, 'ConnectSuccess'), ssmtInformation, [ssmbOk])
    else ssMessageDlg(rs(ParentNameEx, 'ConnectError'), ssmtError, [ssmbOk]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditDB.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditDB.FormCreate') else _udebug := nil;{$ENDIF}


  dmData.Images.GetBitmap(86, imgHost.Picture.Bitmap);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditDB', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
