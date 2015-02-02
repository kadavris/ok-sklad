{$I ok_server.inc}
//UDEBUG code already inserted. Please do not remove this line.
unit Reg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ActnList, Buttons, Clipbrd;

type
  TfrmReg = class(TForm)
    panMain: TPanel;
    Bevel1: TBevel;
    btnRegister: TButton;
    btnCancel: TButton;
    ImageStd: TImage;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    lRegText: TLabel;
    lHardwareID: TLabel;
    edHardwareID: TEdit;
    lKey: TLabel;
    memKey: TMemo;
    ActionList1: TActionList;
    aReg: TAction;
    aCancel: TAction;
    btnCopy: TSpeedButton;
    btnOpen: TSpeedButton;
    shIndicator: TShape;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure aRegExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActionList1Update(Action: TBasicAction; var Handled: Boolean);
    procedure btnCopyClick(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure memKeyChange(Sender: TObject);

  private
    procedure SetCaptions;
  end;

var
  frmReg: TfrmReg;

//==================================================================================
//==================================================================================
//==================================================================================
//==================================================================================
implementation

uses
  {$IFDEF UDEBUG}udebug,{$ENDIF}
  ssSrvConst, ServerData, Protection, xLngDefs;

{$IFDEF UDEBUG}
var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';
{$ENDIF}

{$R *.dfm}

//==============================================================================================
procedure TfrmReg.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmReg.FormCreate') else _udebug := nil;{$ENDIF}

  SetCaptions;
  //MessageDlg(dmData.Lng.GetRS(Self.Name, 'HardwareWarn'), mtWarning, [mbOk], 0);
  edHardwareID.Text := trim(CurrentHardwareID);
  imageStd.Picture.Bitmap.LoadFromResourceName(resDllHandle, 'hbansrv');
    
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmReg.btnCancelClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmReg.btnCancelClick') else _udebug := nil;{$ENDIF}

  ModalResult := mrCancel;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmReg.aCancelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmReg.aCancelExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrCancel;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmReg.aRegExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmReg.aRegExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrOk;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmReg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmReg.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult = mrOk then begin
    CanClose := False;

    if not AssignRegKey(memKey.Text) then begin
      MessageDlg(dmData.Lng.GetRS(Self.Name, 'rs_InvalidKey'), mtError, [mbOk], 0);
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    SaveRegKey(serverPath + 'srvkey.txt');
    MessageDlg(dmData.Lng.GetRS(Self.Name, 'rs_Registered'), mtInformation, [mbOk], 0);
    needActivation;
  end;

  CanClose := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmReg.ActionList1Update(Action: TBasicAction; var Handled: Boolean);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmReg.ActionList1Update') else _udebug := nil;{$ENDIF}

  aReg.Enabled := Trim(memKey.Text) <> '';

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmReg.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmReg.SetCaptions') else _udebug := nil;{$ENDIF}

  with dmData.Lng do begin
    Self.Caption := OK_AppName + ': ' + GetRS(Self.Name, 'rs_Title');
    lRegText.Caption := Format(GetRS(Self.Name, 'rs_RegText'), [OK_URL]);
    lHardwareID.Caption := GetRS(Self.Name, 'rs_HardwareID');
    lKey.Caption := GetRS(Self.Name, 'rs_RegKey');

    aCancel.Caption := GetRS(Self.Name, 'rs_Cancel');
    aReg.Caption := GetRS(Self.Name, 'rs_Register');

    btnCopy.Hint := GetRS(Self.Name, 'rs_Copy');
    btnOpen.Hint := GetRS(Self.Name, 'rs_Open');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmReg.btnCopyClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmReg.btnCopyClick') else _udebug := nil;{$ENDIF}

  Clipboard.AsText := edHardwareID.Text;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmReg.btnOpenClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmReg.btnOpenClick') else _udebug := nil;{$ENDIF}

  with TOpenDialog.Create(nil) do
  try
    Caption := dmData.Lng.GetRS(Self.Name, 'rs_Open');
    DefaultExt := 'txt';
    Filter := dmData.Lng.GetRS(Self.Name, 'fileSel');

    if Execute then memKey.Lines.LoadFromFile(FileName);

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmReg.memKeyChange(Sender: TObject);
begin
  if trim(memkey.text) = ''
    then shIndicator.Brush.Color := clYellow
    else case AssignRegKey(memKey.Text) of
      True: shIndicator.Brush.Color := clLime;
      False: shIndicator.Brush.Color := clRed;
    end; // case

  aReg.Enabled := (shIndicator.Brush.Color = clLime);
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('Reg', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  {$IFDEF UDEBUG}
  //debugUnregisterUnit(DEBUG_unit_ID);
  {$ENDIF}

end.
