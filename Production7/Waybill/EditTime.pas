{$I ok_sklad.inc}
unit EditTime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ssBaseDlg, cxLookAndFeelPainters, ssFormStorage, ActnList,
  StdCtrls, cxButtons, ExtCtrls, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxTimeEdit,ssBaseConst, Buttons,
  ImgList, ssSpeedButton, ssPanel, ssGradientPanel, xButton;

type
  TfrmEditTime = class(TBaseDlg)
    lTime: TLabel;
    edTime1: TcxTimeEdit;
    sbNowTime: TSpeedButton;
    aNowTime: TAction;
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure edTimePropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure aNowTimeExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    FModified: boolean;
  end;

var
  frmEditTime: TfrmEditTime;

implementation

uses
  ClientData, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}


//==============================================================================================
procedure TfrmEditTime.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTime.ActionListUpdate') else _udebug := nil;{$ENDIF}


  aOk.Enabled:=true;
  aApply.Enabled:=aOk.Enabled and FModified;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTime.edTimePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTime.edTimePropertiesChange') else _udebug := nil;{$ENDIF}


  FModified:=true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTime.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTime.FormShow') else _udebug := nil;{$ENDIF}


  FModified:=false;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTime.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTime.FormCloseQuery') else _udebug := nil;{$ENDIF}


  if ModalResult in [mrOK, mrYes]
  then begin
    CanClose:=False;
    case ModalResult of
       mrOK:  CanClose:=true;
       mrYes: FModified:=false;
    end;
  end;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTime.aNowTimeExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTime.aNowTimeExecute') else _udebug := nil;{$ENDIF}


  edTime1.Time := Now;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditTime.FormKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditTime.FormKeyPress') else _udebug := nil;{$ENDIF}


  if (Key = #13) then begin
    Key:=#0;
    Perform(WM_NEXTDLGCTL,0,0);
  end;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditTime', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
