{$I ok_sklad.inc}
unit Progress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  JvTimerList,
  Dialogs, ComCtrls, StdCtrls, ssBaseSkinForm, ImgList, ssSpeedButton,
  ssPanel, ExtCtrls, ssGradientPanel;

type
  TfrmProgress = class(TfrmBaseSkin)
    panAnime: TPanel;
    Animate: TAnimate;
    panMain: TPanel;
    lText: TLabel;
    pbMain: TProgressBar;
    panDetail: TPanel;
    lDet: TLabel;
    pbDet: TProgressBar;
    panButtons: TPanel;
    butOK: TButton;
    butCancel: TButton;
    butSkip: TButton;
    panLog: TPanel;
    gbLog: TGroupBox;
    log: TMemo;

    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormHide(Sender: TObject);
    procedure butOKClick(Sender: TObject);
    procedure butSkipClick(Sender: TObject);
    procedure butCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    PWait: Pointer;
    Fbutton: TModalResult;
    FCanHide: Boolean;
    tEvent: TJvTimerEvent;
    FTimerStarted: TDateTime; // start time for DoTimer call
    FlText: String;

    procedure onTimer(Sender: TObject);

    procedure setAVI(Value: TCommonAVI);

    procedure setInfoText(const t: String);
    function  getInfoText: String;
    procedure setInfoDet(const t: String);
    function  getInfoDet: String;

    procedure Stop; //internal. stops counters, animations, etc.

  public
    procedure ShowDetail;
    procedure ShowLog;
    procedure ClearLog;
    procedure ShowButtons(const showOK, showSkip, showCancel: Boolean);

    procedure HideDetail;
    procedure HideLog;
    procedure HideAll; // hides all additional props

    procedure AddLine(const s: String);
    procedure ClearButtonsState;
    procedure Done; // used to allow user to see the log if necessary and close manually
    procedure DoTimer(AMax: Integer = 60); // just starts counting to AMax value. useful for backups, etc.

    property buttonPressed: TModalResult read FButton;

    property CommonAVI: TCommonAVI write setAVI;

    property InfoText: String read getInfoText write setInfoText;
    property InfoDet: String read getInfoDet write setInfoDet;
    property ProgressMain: TProgressBar read pbMain;
    property ProgressDet: TProgressBar read pbDet;
  end;

{var
  frmProgress: TfrmProgress;
}

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  StrUtils, DateUtils, ClientData, Udebug, prFun;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfrmProgress.FormShow(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmProgress.FormShow') else _udebug := nil;{$ENDIF}

  inherited;

  Animate.Transparent := False;
  Animate.Transparent := True;
  Animate.Active := True;
  Application.ProcessMessages;
  pbMain.Position := 0;
  PWait := DisableTaskWindows(Self.Handle);
  ClearButtonsState;
  FCanHide := False;

  butOK.Caption := rs('Common', 'OK');
  butSkip.Caption := rs('Common', 'Skip');
  butCancel.Caption := rs('Common', 'Cancel');

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmProgress.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmProgress.FormCloseQuery') else _udebug := nil;{$ENDIF}

  CanClose := False;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmProgress.FormHide(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmProgress.FormHide') else _udebug := nil;{$ENDIF}

  tEvent.Enabled := False;
  Animate.CommonAVI := aviCopyFile;
  Animate.Active := False;
  
  HideAll;

  EnableTaskWindows(PWait);
  Application.ProcessMessages;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmProgress.ShowDetail;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  if panDetail.Visible then Exit;
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmProgress.ShowDetail') else _udebug := nil;{$ENDIF}

  Self.Height := Self.Height + panDetail.Height;
  panDetail.Visible := True;
  Self.Repaint;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmProgress.ShowLog;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  if panLog.Visible then Exit;
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmProgress.ShowLog') else _udebug := nil;{$ENDIF}

  Self.Height := Self.Height + panLog.Height;
  panLog.Visible := True;
  Self.Repaint;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmProgress.ShowButtons(const showOK, showSkip, showCancel: Boolean);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmProgress.ShowButtons') else _udebug := nil;{$ENDIF}

  butOK.Visible := showOK;
  butSkip.Visible := showSkip;
  butCancel.Visible := showCancel;

  if showOK or showSkip or showCancel then begin // some button(s) active - show panel
    if not panButtons.Visible then Self.Height := Self.Height + panButtons.Height;

    panButtons.Visible := True;
  end
  else begin // hide panel
    if panButtons.Visible then Self.Height := Self.Height - panButtons.Height;

    panButtons.Visible := False;
  end;

  ClearButtonsState;
  Self.Repaint;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmProgress.HideDetail;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmProgress.HideDetail') else _udebug := nil;{$ENDIF}

  if panDetail.Visible then Self.Height := Self.Height - panDetail.Height;
  
  panDetail.Visible := False;
  Self.Repaint;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
//==============================================================================================
procedure TfrmProgress.HideLog;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  if not panLog.Visible then Exit;
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmProgress.HideLog') else _udebug := nil;{$ENDIF}

  ClearLog;
  Self.Height := Self.Height - panLog.Height;
  panLog.Visible := False;
  Self.Repaint;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmProgress.AddLine(const s: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  if not panLog.Visible then Exit;
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmProgress.AddLine') else _udebug := nil;{$ENDIF}

  Log.Lines.Add(s);
  Self.Repaint;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmProgress.ClearButtonsState;
begin
  Fbutton := mrNone;
end;

//==============================================================================================
procedure TfrmProgress.butOKClick(Sender: TObject);
begin
  inherited;
  ClearButtonsState;
  Fbutton := mrOK;
  if FCanHide then Hide; // user pressed OK to hide the form after reading the log
end;

//==============================================================================================
procedure TfrmProgress.butSkipClick(Sender: TObject);
begin
  inherited;
  ClearButtonsState;
  Fbutton := mrIgnore;
end;

//==============================================================================================
procedure TfrmProgress.butCancelClick(Sender: TObject);
begin
  inherited;
  ClearButtonsState;
  Fbutton := mrCancel;
end;

//==============================================================================================
procedure TfrmProgress.Done;
begin
  Stop;
  ClearButtonsState;
  ShowButtons(True, False, False); // show the "OK"
end;

//==============================================================================================
procedure TfrmProgress.Stop;
begin
  tEvent.Enabled := False;
  FCanHide := True;
  Animate.Active := False;
  //Self.Repaint;
end;

//==============================================================================================
procedure TfrmProgress.DoTimer(AMax: Integer = 60); // just starts counting to AMax value. useful for backups, etc.
begin
  pbMain.Max := AMax;
  pbMain.Position := 0;
  tEvent.Enabled := True;
  FTimerStarted := now;
  Show;
end;

//==============================================================================================
procedure TfrmProgress.onTimer(Sender: TObject);
  var
    t: Integer;
begin
  inherited;

  t := SecondsBetween(now, FTimerStarted);
  if pbMain.Position < pbMain.Max then pbMain.Position := t;

  lText.Caption := GetSpent(1000 * t, False) + '... ' + FlText;
  Application.ProcessMessages;
end;

//==============================================================================================
procedure TfrmProgress.HideAll;
begin
  HideDetail;
  HideLog;
  ShowButtons(False, False, False); // hide the panel
  lText.Caption := '';
  FlTExt := '';
  Self.Repaint;
end;

//==============================================================================================
procedure TfrmProgress.FormCreate(Sender: TObject);
begin
  inherited;
  HideAll;

  // gory shit
  tEvent := dmData.Timers.Events.ItemByHandle(dmData.Timers.Add(onTimer, 1000, True));
  tEvent.Enabled := False;
end;

//==============================================================================================
procedure TfrmProgress.setAVI(Value: TCommonAVI);
begin
  Animate.CommonAVI := Value;
end;

//==============================================================================================
procedure TfrmProgress.setInfoText(const t: String);
begin
  lText.caption := t;
  FlText := t; // for on timer to count properly 
  Self.Repaint;
end;

//==============================================================================================
function TfrmProgress.getInfoText: String;
begin
  Result := ltext.caption;
end;

//==============================================================================================
procedure TfrmProgress.setInfoDet(const t: String);
begin
  lDet.caption := t;
  Self.Repaint;
end;

//==============================================================================================
function TfrmProgress.getInfoDet: String;
begin
  Result := lDet.caption;
end;

//==============================================================================================
procedure TfrmProgress.clearLog;
begin
  Log.Clear;
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('Progress', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
