{$I ok_sklad.inc}
unit Lock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ssBaseIntfDlg, ActnList, ImgList, xButton, ssSpeedButton, ssFun,
  ssPanel, ExtCtrls, ssGradientPanel, cxControls, cxContainer, cxEdit,
  cxTextEdit, StdCtrls, ssBevel, cxGroupBox, ssGroupBox, ssBaseConst;

type
  TfrmLock = class(TfrmBaseIntfDlg)
    btnHelp: TssSpeedButton;
    gbMain: TssGroupBox;
    lUser: TLabel;
    lPassword: TLabel;
    edPass: TcxTextEdit;
    txtLang: TLabel;
    txtUser: TssBevel;
    lUnlock: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edPassKeyPress(Sender: TObject; var Key: Char);

  private
    WrongPassCount: Integer;
    procedure WMLayoutChanged(var M: TMessage); message WM_LAYOUTCHANGED;

  public
    procedure SetCaptions;
  end;

var
  frmLock: TfrmLock;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  prConst, fMessageDlg, Udebug, prFun;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfrmLock.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmLock.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    btnHelp.Hint := GetRS('Common', 'Help');
    aOk.Caption := GetRS('Common', 'OK');
    aCancel.Caption := GetRS(Self.Name, 'FinishWork');
    Self.Caption := OK_AppName;
    lUnlock.Caption := ' ' + GetRS(Self.Name, 'Title') + ' ';
    lUser.Caption := GetRS(Self.Name, 'UserName') + ':';
    lPassword.Caption := GetRS(Self.Name, 'Password') + ':';
  end;

  txtUser.Caption := UserName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmLock.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmLock.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  SetCaptions;
  txtLang.Caption := keyboardIndicator;
  WrongPassCount := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmLock.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmLock.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult = mrOk then begin
    CanClose := False;
    if edPass.Text <> UserPass then begin
      if WrongPassCount > 0 then sleep(WrongPassCount * 1000);
      inc(WrongPassCount);
      ssMessageDlg(LangMan.GetRS(Self.Name, 'IncorrectPass'), ssmtError, [ssmbOk]);
      edPass.SetFocus;
    end
    else CanClose := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmLock.WMLayoutChanged(var M: TMessage);
begin
  txtLang.Caption := keyboardIndicator;
end;

//==============================================================================================
procedure TfrmLock.edPassKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmLock.edPassKeyPress') else _udebug := nil;{$ENDIF}

  if Key = #13 then begin
    Key := #0;
    aOk.Execute;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('Lock', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}
end.
