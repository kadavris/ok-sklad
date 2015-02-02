{$IFNDEF PKG}
{$I ok_sklad.inc}
{$ENDIF}
unit ssBaseSkinForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ImgList,
  ssSpeedButton, ssPanel, ssGradientPanel;

type
  TfrmBaseSkin = class(TForm)
    ilTitleBar: TImageList;
    panTitleBar: TssGradientPanel;
    panTitleButtons: TssPanel;
    btnTBMinimize: TssSpeedButton;
    btnTBMaximize: TssSpeedButton;
    btnTBClose: TssSpeedButton;

    procedure btnTBMinimizeClick(Sender: TObject);
    procedure btnTBMaximizeClick(Sender: TObject);
    procedure btnTBCloseClick(Sender: TObject);
    procedure panTitleBarMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure panTitleBarDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    procedure WMSetText(var M: TMessage); message WM_SETTEXT;
    procedure WMGetMinMaxInfo(var M: TWMGetMinMaxInfo); message WM_GETMINMAXINFO;
    procedure WMActivate(var M: TMessage); message WM_ACTIVATE;
    procedure setFonts;

  protected
    lastALUpdate: TDateTime; // last action list update. used in descendant modules to prevent too fast reiterations

    function  allowALUpdate(const ms: Integer = 100): boolean; // 100 milliseconds between updates minimum
    procedure DoCreate; override;

  public
    //procedure SetText(const Value: TCaption); override;
    //function  GetText: TCaption; override;
    procedure LoadSkin; virtual;
  end;

var
  frmBaseSkin: TfrmBaseSkin;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  {$IFNDEF PKG}prConst, ClientData, prFun, {$ENDIF}
  ssBevel, UDebug, ssDBGrid, cxEdit, Math, StdCtrls, cxControls, ssStrUtil, StrUtils, DateUtils,
  ssBaseConst;

var
  DEBUG_unit_ID: Integer;
  Debugging: Boolean;
  DEBUG_group_ID: string = '';

{$R *.dfm}

//==============================================================================================
procedure TfrmBaseSkin.DoCreate;
  var
    AStyle: Integer;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseSkin.DoCreate') else _udebug := nil;{$ENDIF}

  if panTitleBar.Visible then begin
    AStyle := GetWindowLong(Handle, GWL_STYLE);

    if ((AStyle and WS_CAPTION) = WS_CAPTION) then begin
      AStyle := AStyle - WS_CAPTION;
      SetWindowLong(Handle, GWL_STYLE, AStyle);
      Height := ClientHeight;
    end;

    btnTBMinimize.Visible := not (BorderStyle in [bsDialog, bsToolWindow, bsSizeToolWin]);
    btnTBMaximize.Visible := btnTBMinimize.Visible;

    case WindowState of
      wsNormal: btnTBMaximize.ImageIndex := 3;
      wsMaximized: btnTBMaximize.ImageIndex := 0;
    end;
  end;

  LoadSkin;

  inherited;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseSkin.btnTBMinimizeClick(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseSkin.btnTBMinimizeClick') else _udebug := nil;{$ENDIF}

  if Application.MainForm = Self
    then Application.Minimize
    else WindowState := wsMinimized;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseSkin.btnTBMaximizeClick(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseSkin.btnTBMaximizeClick') else _udebug := nil;{$ENDIF}

  if WindowState = wsNormal then begin
    WindowState := wsMaximized;
    if Width > Screen.WorkAreaWidth then Width := Screen.WorkAreaWidth;
    if Height > Screen.WorkAreaHeight then Height := Screen.WorkAreaHeight;
    btnTBMaximize.ImageIndex := 0;
  end
  else begin
    WindowState := wsNormal;
    btnTBMaximize.ImageIndex := 3;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseSkin.btnTBCloseClick(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseSkin.btnTBCloseClick') else _udebug := nil;{$ENDIF}

  Close;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

(*
//==============================================================================================
procedure TfrmBaseSkin.SetText(const Value: TCaption);
begin
  if panTitleBar.Visible
    then panTitleBar.Caption := Value
    else inherited;
end;

//==============================================================================================
function  TfrmBaseSkin.GetText: TCaption;
begin
  if panTitleBar.Visible
    then Result := panTitleBar.Caption
    else Result := inherited;
end;
*)

//==============================================================================================
procedure TfrmBaseSkin.WMSetText(var M: TMessage);
  var
    s: string;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseSkin.WMSetText') else _udebug := nil;{$ENDIF}

  inherited;

  if trim(Self.Caption) = ''  then Exit;
  s := Self.Caption;

  if Assigned(panTitleBar) then begin
    panTitleBar.Caption := ' ' + s;
    Self.Caption := '';
    panTitleButtons.Invalidate;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseSkin.WMGetMinMaxInfo(var M: TWMGetMinMaxInfo);
  var
    R: TRect;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseSkin.WMGetMinMaxInfo') else _udebug := nil;{$ENDIF}

  inherited;
  SystemParametersInfo(SPI_GETWORKAREA, 0, @R, 0);
  M.MinMaxInfo^.ptMaxSize.Y := R.Bottom + 6;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseSkin.WMActivate(var M: TMessage);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseSkin.WMActivate') else _udebug := nil;{$ENDIF}

  if not panTitleBar.Visible then Exit;

  if M.WParam = WA_INACTIVE then begin
    panTitleBar.GrStartColor := clBtnShadow;
    panTitleBar.GrEndColor := clBtnFace;
  end
  else begin
    panTitleBar.GrStartColor := clActiveCaption;
    panTitleBar.GrEndColor := clGradientActiveCaption;
  end;
  panTitleButtons.Repaint;

  inherited;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseSkin.panTitleBarMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseSkin.panTitleBarMouseDown') else _udebug := nil;{$ENDIF}

  if (WindowState <> wsMaximized) and (Button = mbLeft) then begin
    ReleaseCapture;
    Self.Perform(WM_SYSCOMMAND, $F012, 0);
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseSkin.panTitleBarDblClick(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseSkin.panTitleBarDblClick') else _udebug := nil;{$ENDIF}

  if btnTBMaximize.Visible and not (BorderStyle in [bsDialog, bsToolWindow])
  then begin
    if WindowState = wsNormal then begin
      WindowState := wsMaximized;
      btnTBMaximize.ImageIndex := 0;
    end
    else begin
      WindowState := wsNormal;
      btnTBMaximize.ImageIndex := 3;
    end;
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseSkin.FormShow(Sender: TObject);
//{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseSkin.FormShow') else _udebug := nil;{$ENDIF}

  panTitleBar.Visible := (FormStyle <> fsMDIChild);
  setFonts;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseSkin.LoadSkin;
//{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseSkin.LoadSkin') else _udebug := nil;{$ENDIF}

  Self.Color := clokMainBk;
  setFonts;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseSkin.FormCreate(Sender: TObject);
  var
    i: Integer;
    c: TControl;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseSkin.FormCreate') else _udebug := nil;{$ENDIF}

  //panTitleBar.Visible := False;
  setFonts;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseSkin.FormDestroy(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseSkin.FormDestroy') else _udebug := nil;{$ENDIF}

  inherited;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseSkin.setFonts;
  var
    i, dy, dm, h: Integer;
    c: TControl;
    //{$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseSkin.FormCreate') else _udebug := nil;{$ENDIF}

  if AnsiEndsText('UKR', Self.Name) or AnsiEndsText('RUS', Self.Name)
     or AnsiEndsText('Torg12', Self.Name)
  then Exit;
   
  {$IFDEF MAIN}
  setFontStyle(Font);

  for i := 0 to ComponentCount - 1 do
    try
      if (Components[i] is TLabel) and not (TLabel(Components[i]).ParentFont)
        then setFontStyle(TLabel(Components[i]).font, False)
      else if Components[i] is TssDBGrid
        then setFontStyle(TssDBGRid(Components[i]).font, True)
      else if (Components[i] is TPanel) and not (TPanel(Components[i]).ParentFont)
        then setFontStyle(TPanel(Components[i]).font, False)
      else if Components[i] is TssBevel
        then setFontStyle(TssBevel(Components[i]).font, False);

    except
    end;

  panTitleBar.Font.color := clWhite;
  panTitleBar.Height := panTitleBar.Font.Size + 14;
  dy := DayOfTheYear(now) div 2;
  dm := DayOfTheMonth(now) * 4;
  h := HourOf(now);
  panTitleBar.GrStartColor := (dy div 2) * $10000 + dm * $100 + h * 5;
  panTitleBar.GrEndColor := (dy mod 200 + 50) * $10000 + dm * 2 * $100 + h * 10;
  panTitleBar.RePaint;
    
  btnTBMinimize.Top := floor(panTitleBar.Height / 2 - btnTBMinimize.Height / 2) - 2;
  btnTBMaximize.Top := floor(panTitleBar.Height / 2 - btnTBMaximize.Height / 2) - 2;
  btnTBClose.Top := floor(panTitleBar.Height / 2 - btnTBClose.Height / 2) - 2;

  //Self.Invalidate;
  Application.ProcessMessages;
  {$ENDIF} // MAIN

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function  TfrmBaseSkin.allowALUpdate(const ms: Integer = 100): boolean; // 100 milliseconds between updates minimum
begin
  Result := (MillisecondsBetween(now, lastALUpdate) >= ms);
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('ssBaseSkinForm', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //debugUnregisterUnit(DEBUG_unit_ID);

end.

