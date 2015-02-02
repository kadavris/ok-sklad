unit xButton;

interface

uses
  SysUtils, Classes, Controls, Graphics, xGradient, Messages, xStyleContainer;

type
  TxButton = class;
  TxButtonState = (xbsDown, xbsUp);

  TxButtonActionLink = class(TControlActionLink)
  protected
    FClient: TxButton;
    procedure AssignClient(AClient: TObject); override;
  end;

  TxButton = class(TCustomControl)
  private
    FColor: TColor;
    FColorInner: TColor;
    FColorOuter: TColor;
    FDrawFrame: Boolean;
    FGradient: TxGradient;
    FState: TxButtonState;
    FHotTrack: Boolean;
    FDisabledShadowColor: TColor;
    FDisabledColor: TColor;
    FDrawFocusRect: Boolean;
    FFocusRectColor: TColor;
    FHotTrackShadowColor: TColor;
    Painting: Boolean;
    FStyleContainer: TxStyleContainer;
    FDefault: Boolean;
    procedure SetColor(const Value: TColor);
    procedure SetDrawFrame(const Value: Boolean);
    procedure SetColorInner(const Value: TColor);
    procedure SetColorOuter(const Value: TColor);
    procedure SetGradient(const Value: TxGradient);
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure SetHotTrack(const Value: Boolean);
    procedure SetDisabledColor(const Value: TColor);
    procedure SetDisabledShadowColor(const Value: TColor);
    procedure SetDrawFocusRect(const Value: Boolean);
    procedure SetFocusRectColor(const Value: TColor);
    procedure SetHotTrackShadowColor(const Value: TColor);
    procedure SetStyleContainer(const Value: TxStyleContainer);
    procedure SetDefault(const Value: Boolean);
  protected
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure WMKillFocus(var Message: TWMSetFocus); message WM_KILLFOCUS;
    procedure CMTextChanged(var M: TMessage); message CM_TEXTCHANGED;
    procedure CMDialogKey(var Message: TCMDialogKey); message CM_DIALOGKEY;
    procedure WMChar(var M: TWMChar); message WM_CHAR;
    procedure WMKeyDown(var M: TMessage); message WM_KEYDOWN;
    procedure WMKeyUp(var M: TMessage); message WM_KEYUP;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure Paint; override;
    procedure PaintFrame; virtual;
    procedure SetEnabled(Value: Boolean); override;
    procedure WndProc(var Message: TMessage); override;
  public
    FOver: Boolean;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ContainerDeleted;
  published
    property Action;
    property Align;
    property Anchors;
    property Caption;
    property Color: TColor read FColor write SetColor default clBtnFace;
    property ColorInner: TColor read FColorInner write SetColorInner default
      clBtnHighlight;
    property ColorOuter: TColor read FColorOuter write SetColorOuter default
      clBtnShadow;
    property Default: Boolean read FDefault write SetDefault default False;  
    property DisabledColor: TColor read FDisabledColor write SetDisabledColor
      default clBtnShadow;
    property DisabledShadowColor: TColor read FDisabledShadowColor write
      SetDisabledShadowColor default clBtnHighlight;
    property DrawFocusRect: Boolean read FDrawFocusRect write SetDrawFocusRect
      default True;
    property DrawFrame: Boolean read FDrawFrame write SetDrawFrame default True;
    property Enabled;
    property FocusRectColor: TColor read FFocusRectColor write SetFocusRectColor
      default clBlack;
    property Font;
    property Gradient: TxGradient read FGradient write SetGradient;
    property HotTrack: Boolean read FHotTrack write SetHotTrack default True;
    property HotTrackShadowColor: TColor read FHotTrackShadowColor
      write SetHotTrackShadowColor default clBtnShadow;
    property OnClick;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyUp;
    property OnKeyPress;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property ParentFont;
    property StyleContainer: TxStyleContainer read FStyleContainer
      write SetStyleContainer; 
    property TabOrder;
    property TabStop default True;
    property Visible;
  end;

implementation

uses Types, ExtCtrls, StdCtrls, Windows, Forms;

constructor TxButton.Create(AOwner: TComponent);
begin
  inherited;

  Width := 80;
  Height := 25;

  FColor := clBtnFace;
  FColorInner := clBtnHighlight;
  FColorOuter := clBtnShadow;
  FDisabledColor := clBtnShadow;
  FDisabledShadowColor := clBtnHighlight;

  FDrawFrame := True;
  FDrawFocusRect := True;

  FState := xbsUp;
  FHotTrack := True;
  FHotTrackShadowColor := clBtnShadow;

  TabStop := True;

  FGradient := TxGradient.Create(Self);
end;

destructor TxButton.Destroy;
begin
  Gradient.Free;

  inherited;
end;

procedure TxButton.PaintFrame;
var
  R: TRect;
begin
  R := ClientRect;
  Canvas.Brush.Color := FColor;
  if (Focused and FDrawFocusRect) or (FDefault and Enabled) then begin
    Canvas.Brush.Color := FFocusRectColor;
//    Canvas.RoundRect(R.Left, R.Top, R.Right, R.Bottom, 2, 2);
    Canvas.FrameRect(R);
    InflateRect(R, -1, -1);
  end;
  if not (csDesigning in ComponentState) and FOver and FHotTrack then begin
    Frame3D(Canvas, R, $206B2408, $206B2408, 1)
  end
  else
    if FState = xbsUp then Frame3D(Canvas, R, FColorInner, FColorOuter, 1)
      else Frame3D(Canvas, R, FColorOuter, FColorInner, 1);
  Canvas.Brush.Color := FColor;
end;

procedure TxButton.Paint;
var
  R: TRect;
  TH, TW, X, Y: Word;
  FOldStyle: TFontStyles;
  grSCOld: TColor;
begin
  if not Painting then begin
    Painting := True;
    try
      R := ClientRect;
      Canvas.Font := Font;
      FOldStyle := Font.Style;
    //  if FOver and not (csDesigning in ComponentState) and FHotTrack
    //    then Canvas.Font.Style := Canvas.Font.Style + [fsBold];

      if Gradient.Enabled then begin
        grSCOld := Gradient.ColorBegin;
        if not (csDesigning in ComponentState) and FHotTrack and FOver then begin
          Canvas.Brush.Color := $20D6BEB5;
          Canvas.FillRect(R);
        end
        else Gradient.GradientFill;
      end
      else with Canvas do begin
        Brush.Color := FColor;
        FillRect(R);
      end;
      if DrawFrame then PaintFrame;
      InflateRect(R, -3, -3);
      TW := Canvas.TextWidth(Caption);
      TH := Canvas.TextHeight('W');

      Canvas.Brush.Style := bsClear;
      X := (Width - TW) div 2;
      Y := (Height - TH) div 2;
      if not Enabled then begin
        Canvas.Font.Color := FDisabledShadowColor;
        Canvas.TextOut(X + 1, Y + 1, Caption);
        Canvas.Font.Color := FDisabledColor;
        Canvas.TextOut(X, Y, Caption);
      end
      else begin
        if FOver and not (csDesigning in ComponentState) and FHotTrack and
          (FState = xbsUp) then begin
          Canvas.Font.Color := FHotTrackShadowColor;
//          Canvas.TextOut(X + 1, Y + 1, Caption);
          Canvas.Font.Color := Font.Color;
        end
        else if FState = xbsDown then begin
//          Inc(X);
//          Inc(Y);
        end;
        Canvas.TextOut(X, Y, Caption);
      end;
      Canvas.Font.Style := FOldStyle;
    finally
      Painting := False;
    end;
  end;
end;

procedure TxButton.SetColor(const Value: TColor);
begin
  FColor := Value;
  Invalidate;
end;

procedure TxButton.SetColorInner(const Value: TColor);
begin
  FColorInner := Value;
  Invalidate;
end;

procedure TxButton.SetColorOuter(const Value: TColor);
begin
  FColorOuter := Value;
  Invalidate;
end;

procedure TxButton.SetDrawFrame(const Value: Boolean);
begin
  FDrawFrame := Value;
  Invalidate;
end;

procedure TxButton.MouseDown(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  if (Button = mbLeft) then begin
    FState := xbsDown;
  end;
  Invalidate;
end;

procedure TxButton.MouseUp(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y);
  if (Button = mbLeft) then begin
    FState := xbsUp;
  end;
  Invalidate;
end;

procedure TxButton.WndProc(var Message: TMessage);
begin
  case Message.Msg of
    WM_LBUTTONDOWN, WM_LBUTTONDBLCLK:
      if not (csDesigning in ComponentState) and not Focused then begin
        Windows.SetFocus(Handle);
        if not Focused then Exit;
      end;
  end;
  inherited WndProc(Message);
end;

procedure TxButton.WMKillFocus(var Message: TWMSetFocus);
begin
  inherited;
  Invalidate;
end;

procedure TxButton.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  Invalidate;
end;

procedure TxButton.SetGradient(const Value: TxGradient);
begin
  FGradient.Assign(Value);
end;

procedure TxButton.CMMouseEnter(var Message: TMessage);
begin
  inherited;
  FOver := True;
  Invalidate;
end;

procedure TxButton.CMMouseLeave(var Message: TMessage);
begin
  inherited;
  FOver := False;
  Invalidate;
end;

procedure TxButton.SetHotTrack(const Value: Boolean);
begin
  FHotTrack := Value;
  Invalidate;
end;

procedure TxButton.SetEnabled(Value: Boolean);
begin
  inherited;
  Invalidate;
end;

procedure TxButton.SetDisabledColor(const Value: TColor);
begin
  FDisabledColor := Value;
  Invalidate;
end;

procedure TxButton.SetDisabledShadowColor(const Value: TColor);
begin
  FDisabledShadowColor := Value;
  Invalidate;
end;

procedure TxButton.SetDrawFocusRect(const Value: Boolean);
begin
  FDrawFocusRect := Value;
  Invalidate;
end;

procedure TxButton.SetFocusRectColor(const Value: TColor);
begin
  FFocusRectColor := Value;
  Invalidate;
end;

procedure TxButton.CMTextChanged(var M: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure TxButton.SetHotTrackShadowColor(const Value: TColor);
begin
  FHotTrackShadowColor := Value;
  Invalidate;
end;

{ TxButtonActionLink }

procedure TxButtonActionLink.AssignClient(AClient: TObject);
begin
  inherited AssignClient(AClient);
  FClient := AClient as TxButton;
end;

procedure TxButton.WMChar(var M: TWMChar);
begin
  if M.CharCode = 13 then
    if Assigned(OnClick) then OnClick(Self);
end;

procedure TxButton.WMKeyDown(var M: TMessage);
var
  KS: TKeyboardState;
  SS: TShiftState;
  Key: Word;
begin
  if M.WParam = 13 then begin
    FState := xbsDown;
    Invalidate;
  end;

  if Assigned(OnKeyDown) then begin
    GetKeyboardState(KS);
    Key := M.WParam;
    SS := KeyboardStateToShiftState(KS);
    OnKeyDown(Self, Key, SS);
  end;
end;

procedure TxButton.WMKeyUp(var M: TMessage);
var
  KS: TKeyboardState;
  SS: TShiftState;
  Key: Word;
begin
  if M.WParam = 13 then begin
    FState := xbsUp;
    Invalidate;
  end;

  if Assigned(OnKeyUp) then begin
    Key := M.WParam;
    GetKeyboardState(KS);
    SS := KeyboardStateToShiftState(KS);
    OnKeyUp(Self, Key, SS);
  end;
end;

procedure TxButton.SetStyleContainer(const Value: TxStyleContainer);
begin
  if Value = FStyleContainer then Exit;
  if Value = nil then FStyleContainer.UnregControl(Self)
    else Value.RegControl(Self);

  if Value <> nil then begin
    Self.Gradient.Assign(Value.Gradient); 
  end;  
  FStyleContainer := Value;
end;

procedure TxButton.ContainerDeleted;
begin
  FStyleContainer := nil;
end;

procedure TxButton.CMDialogKey(var Message: TCMDialogKey);
begin
  with Message do
    if ((CharCode = VK_RETURN) and FDefault) and
      (KeyDataToShiftState(Message.KeyData) = []) and CanFocus then
    begin
      Click;
      Result := 1;
    end else
      inherited;
end;

procedure TxButton.SetDefault(const Value: Boolean);
begin
  FDefault := Value;
  Invalidate;
end;

end.
