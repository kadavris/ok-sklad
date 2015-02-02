{$I ok_sklad.inc}
unit ssBaseDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ActnList, ImgList, xButton,
  cxLookAndFeelPainters, cxButtons,
  ssFormStorage, ssBaseSkinForm, ssBevel, ssSpeedButton, ssGradientPanel, ssBaseIntfDlg, ssPanel;

type
  TBaseDlg = class(TfrmBaseIntfDlg)
    FormStorage: TssFormStorage;
    panMain: TPanel;
    aLock: TAction;
    aHelp: TAction;
    aSendErrMessage: TAction;
    panToolBar: TPanel;
    btnLock: TssSpeedButton;
    btnSendErrMessage: TssSpeedButton;
    btnHelp: TssSpeedButton;

    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aLockExecute(Sender: TObject);
    procedure aHelpExecute(Sender: TObject);
    procedure aSendErrMessageExecute(Sender: TObject);

  private
    FOnDate: TDateTime;
    FIDs: string;

  protected
    FParentName: string;
    FID: integer;
    FSubID: integer;
    FGrpID: integer;
    FModified: Boolean;

    procedure SetID(const Value: integer); virtual; abstract;
    procedure SetIDs(const Value: string); virtual;
    procedure SetParentName(const Value: string); virtual;
    procedure SetOnDate(const Value: TDateTime); virtual;
    procedure SetSubID(const Value: integer); virtual;
    procedure DoCreate; override;
    procedure SetGrpID(const Value: integer); virtual;
    function  CheckModified: Boolean; virtual;
    function  getBaseHeight: Integer;
    function  getBaseWidth: Integer;

  public
    MainHandle: HWND;
    SourceID: integer;
    IsPattern: Boolean;

    procedure SetCaptions; virtual;
    procedure DoHelp; virtual;
    procedure DoCustom(AParam: Integer); virtual;

    property GrpID: integer read FGrpID write SetGrpID;
    property ParentNameEx: string read FParentName write SetParentName;
    property ID: integer read FID write SetID;
    property IDs: string read FIDs write SetIDs;
    property SubID: integer read FSubID write SetSubID;
    property OnDate: TDateTime read FOnDate write SetOnDate;
    property BaseHeight: Integer read getBaseHeight;
    property BaseWidth: Integer read getBaseWidth;
  end;

  TBaseDlgClass = class of TBaseDlg;

var
  BaseDlg: TBaseDlg;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
   {$IFNDEF PKG}prFun, {$ENDIF}
   prConst, fMessageDlg, Udebug;

var
   DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TBaseDlg.SetOnDate(const Value: TDateTime);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TBaseDlg.SetOnDate') else _udebug := nil;{$ENDIF}

  FOnDate := Value;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TBaseDlg.SetSubID(const Value: integer);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TBaseDlg.SetSubID') else _udebug := nil;{$ENDIF}

  FSubID := Value;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TBaseDlg.SetParentName(const Value: string);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TBaseDlg.SetParentName') else _udebug := nil;{$ENDIF}

  FParentName := Value;
  SetCaptions;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TBaseDlg.SetCaptions;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TBaseDlg.SetCaptions') else _udebug := nil;{$ENDIF}

  btnLock.Hint := LangMan.GetRS('Common', 'Lock');
  btnHelp.Hint := LangMan.GetRS('Common', 'Help');
  btnSendErrMessage.Hint := LangMan.GetRS('Common', 'SendErrMessage');

  aOK.Caption := LangMan.GetRS('Common', 'OK');
  aCancel.Caption := LangMan.GetRS('Common', 'Cancel');
  aApply.Caption := LangMan.GetRS('Common', 'Apply');

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TBaseDlg.DoCreate;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TBaseDlg.DoCreate') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFNDEF PKG}
  FormStorage.IniFileName := PrRegKey;
  FormStorage.IniSection := Self.Name;
  //FormStorage.Active := True;
  //SetStyle(Self, IStyle);
  lastALUpdate := now;
  {$ENDIF}


  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TBaseDlg.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TBaseDlg.ActionListUpdate') else _udebug := nil;{$ENDIF}
  lastALUpdate := now;
  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TBaseDlg.SetGrpID(const Value: integer);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TBaseDlg.SetGrpID') else _udebug := nil;{$ENDIF}

  FGrpID := Value;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TBaseDlg.aLockExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TBaseDlg.aLockExecute') else _udebug := nil;{$ENDIF}

  {$IFNDEF PKG}LockScreen;{$ENDIF}

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TBaseDlg.aHelpExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TBaseDlg.aHelpExecute') else _udebug := nil;{$ENDIF}

  {$IFNDEF PKG}DoHelp;{$ENDIF}

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TBaseDlg.DoHelp;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TBaseDlg.DoHelp') else _udebug := nil;{$ENDIF}

  {$IFNDEF PKG}ShowHelpTopic(Self.ClassName);{$ENDIF}

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TBaseDlg.DoCustom(AParam: Integer);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TBaseDlg.DoCustom') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TBaseDlg.aSendErrMessageExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TBaseDlg.aSendErrMessageExecute') else _udebug := nil;{$ENDIF}

  {$IFNDEF PKG}SendMsg;{$ENDIF}

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TBaseDlg.SetIDs(const Value: string);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TBaseDlg.SetIDs') else _udebug := nil;{$ENDIF}

  FIDs := Value;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TBaseDlg.CheckModified: Boolean;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TBaseDlg.CheckModified') else _udebug := nil;{$ENDIF}

  Result := False;

  if EditingDisabled then Exit;

  if FModified and (ssMessageDlg(LangMan.GetRS('Common', 'DataChangedSave'), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes) then Result := True;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TBaseDlg.getBaseHeight: Integer;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TBaseDlg.getBaseHeight') else _udebug := nil;{$ENDIF}

  Result := panTitleBar.Height + panToolBar.Height + panButtons.Height;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TBaseDlg.getBaseWidth: Integer;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TBaseDlg.getBaseWidth') else _udebug := nil;{$ENDIF}

  Result := btnOK.Width + btnCancel.Width + btnApply.Width + 10;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('ssBaseDlg', @Debugging, DEBUG_group_ID);
  {$ENDIF}

finalization
  //debugUnregisterUnit(DEBUG_unit_ID);

end.
