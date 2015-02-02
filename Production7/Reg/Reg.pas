{$I ok_sklad.inc}
unit Reg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ssBaseSkinForm, ImgList, ssSpeedButton, ssPanel, ExtCtrls,
  ssGradientPanel, xButton, ssBevel, cxControls, cxGroupBox, ssGroupBox,
  StdCtrls, cxContainer, cxEdit, cxTextEdit, cxMemo, ActnList;

type
  TfrmReg = class(TfrmBaseSkin)
    panMain: TPanel;
    ssBevel2: TssBevel;
    ssBevel1: TssBevel;
    Image1: TImage;
    ssBevel3: TssBevel;
    lRegText: TLabel;
    lRegKey: TLabel;
    memKey: TcxMemo;
    btnOpen: TssSpeedButton;
    ActionList1: TActionList;
    aReg: TAction;
    aCancel: TAction;
    Panel1: TPanel;
    btnOK: TxButton;
    btnCancel: TxButton;
    procedure btnOpenClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure aRegExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction; var Handled: Boolean);

  private
    procedure SetCaptions;
  end;

var
  frmReg: TfrmReg;

//==============================================================================================
implementation

uses
  prConst, fMessageDlg, ClientData, Udebug, xLngDefs;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfrmReg.btnOpenClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmReg.btnOpenClick') else _udebug := nil;{$ENDIF}

  with TOpenDialog.Create(nil) do
  try
    DefaultExt := 'txt';
    Filter := 'Text Documents (*.txt)|*.txt|All Files (*.*)|*.*';
    if Execute then memKey.Lines.LoadFromFile(FileName);

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmReg.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmReg.SetCaptions') else _udebug := nil;{$ENDIF}

  with dmData.Lng do begin
    lRegText.Caption := GetRS(Self.Name, 'RegText');
    lRegKey.Caption := GetRS(Self.Name, 'RegKey');
    Self.Caption := GetRS(Self.Name, 'Title');
    btnOpen.Hint := GetRS('Common', 'Open');

    aReg.Caption := GetRS(Self.Name, 'Reg');
    aCancel.Caption := GetRS('Common', 'Cancel');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmReg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    FPath: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmReg.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult = mrOk then begin
    CanClose := False;
    FPath := ExtractFilePath(ParamStr(0)) + 'clntkey.txt';
    memKey.Lines.SaveToFile(FPath);
    ssMessageDlg(langman.getrs(Self.Name, 'Registered'), ssmtInformation, [ssmbOk]);
    CanClose := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmReg.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmReg.FormCreate') else _udebug := nil;{$ENDIF}

  case CountryRules.CID of
    cidUS: ImageEN.Visible := True;
  end;

  SetCaptions;

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
procedure TfrmReg.aCancelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmReg.aCancelExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrCancel;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmReg.ActionList1Update(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmReg.ActionList1Update') else _udebug := nil;{$ENDIF}

  aReg.Enabled := Trim(memKey.Text) <> EmptyStr;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('Reg', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
