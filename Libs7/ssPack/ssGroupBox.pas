unit ssGroupBox;

interface

uses
  SysUtils, Classes, Controls, cxControls, cxGroupBox, Graphics, cxGraphics,
  Messages, ssBevel;

const
  clXPHotTrack = $206B2408;
  
type
  TxMouseMoveEvent = procedure(Sender: TObject) of object;

  TssGroupBox = class(TcxGroupBox)
  private
    FCaptionBkPicture: TPicture;
    FHotTrack: Boolean;
    FHotTrackColor: TColor;
    FOver: Boolean;
    FOnMouseLeave: TxMouseMoveEvent;
    FOnMouseEnter: TxMouseMoveEvent;
    FHideCaption: Boolean;
    FEdges: TssBevelEdges;
    procedure SetCaptionBkPicture(const Value: TPicture);
    procedure SetHotTrack(const Value: Boolean);
    procedure SetHotTrackColor(const Value: TColor);
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure SetHideCaption(const Value: Boolean);
    procedure SetEdges(const Value: TssBevelEdges);

  protected
   procedure Paint; override;

  public
   constructor Create(AOwner: TComponent); override;
   destructor Destroy; override;

  published
   property CaptionBkPicture: TPicture read FCaptionBkPicture write SetCaptionBkPicture;
   property Edges: TssBevelEdges read FEdges write SetEdges;
   property HideCaption: Boolean read FHideCaption write SetHideCaption default False;
   property HotTrack: Boolean read FHotTrack write SetHotTrack default True;
   property HotTrackColor: TColor read FHotTrackColor write SetHotTrackColor default clXPHotTrack;
   property OnMouseEnter: TxMouseMoveEvent read FOnMouseEnter write FOnMouseEnter;
   property OnMouseLeave: TxMouseMoveEvent read FOnMouseLeave write FOnMouseLeave;
  end;

implementation

uses Windows, Types, dxThemeConsts, dxThemeManager, dxUxTheme, cxEditUtils,
     cxContainer, cxEditPaintUtils, cxLookAndFeels, ssBaseConst;

{ TssGroupBox }

procedure TssGroupBox.CMMouseEnter(var Message: TMessage);
var
  FControl: TControl;
begin
  if not FHotTrack then Exit;
  FControl := Self.Parent.ControlAtPos(Self.Parent.ScreenToClient(Mouse.CursorPos), False, True);
  if (FControl = Self) and not FOver then begin
    FOver := True;
    Invalidate;
    if Assigned(FOnMouseEnter) then FOnMouseEnter(Self);
//    PostMessage(ph, WM_USER + 1, 0,0);
  end;
end;

procedure TssGroupBox.CMMouseLeave(var Message: TMessage);
var
  FControl: TControl;
begin
  if not FHotTrack then Exit;
  FControl := Self.Parent.ControlAtPos(Self.Parent.ScreenToClient(Mouse.CursorPos), False, True);
  if FControl <> Self then begin
    FOver := False;
    Invalidate;
    if Assigned(FOnMouseLeave) then FOnMouseLeave(Self);
//    PostMessage(ph, WM_USER + 1, 1,0);
  end;
end;

constructor TssGroupBox.Create(AOwner: TComponent);
begin
  inherited;

  FCaptionBkPicture := TPicture.Create;

  FEdges := [beLeft, beRight, beTop, beBottom];
  FHotTrack := True;
  FHotTrackColor := clXPHotTrack;
end;

destructor TssGroupBox.Destroy;
begin
  FCaptionBkPicture.Free;

  inherited;
end;

procedure TssGroupBox.Paint;

  procedure BevelLine(C: TColor; X1, Y1, X2, Y2: Integer);
  begin
    with Canvas do
    begin
      Pen.Color := C;
      MoveTo(X1, Y1);
      LineTo(X2, Y2);
    end;
  end;

var
  H, W, D, tX, tY: Integer;
  ATextRect, ABodyRect, AControlRect, AHeaderRect: TRect;
  Ft : hFont;
  TTM : TTextMetric;
  TLF   : TLogFont;
  ACaptionSize: TSize;
  ANativeState: Integer;
  ATheme: TTheme;
  ARgn: TcxRegion;
  AColor{, OldColor}: Cardinal;
begin
  inherited Paint;

  with Canvas do
  begin
    // Initial settings
    Brush.Color := Self.Color;
    Font := Self.Font;
    tX := 0;
    tY := 0;

    // Adjustments
    H := TextHeight('0');
    W := TextWidth(Text);
    if Alignment in [alLeftTop, alLeftCenter, alLeftBottom, alRightTop,
       alRightCenter, alRightBottom] then begin
      GetTextMetrics(Handle, TTM);
      if (TTM.tmPitchAndFamily and TMPF_TRUETYPE) = 0 then begin
        Font.Name := 'Arial';
        H := TextHeight('Wg');
        W := TextWidth(Text);
      end;
    end;
    D := H div 2 - 1;

    // ABodeRect calculations
    ABodyRect := ClientRect;
    case Alignment of
      alTopLeft, alTopCenter, alTopRight: ABodyRect.Top := ABodyRect.Top + D;
      alLeftTop, alLeftCenter, alLeftBottom: ABodyRect.Left := ABodyRect.Left + D;
      alRightTop, alRightCenter, alRightBottom: ABodyRect.Right := ABodyRect.Right - D;
      alBottomLeft, alBottomCenter, alBottomRight: ABodyRect. Bottom := ABodyRect.Bottom - D;
    end;

    // ATextRect calculations
    if Text <> '' then
    begin
      case Alignment of
        alTopLeft:
        begin
          ATextRect := Rect(8, 1, 8 + W, H);
          tX := 8;
          tY := 0;
        end;
        alTopCenter:
        begin
          ATextRect := Rect((Width - W) div 2, 1, (Width - W) div 2 + W, H);
          tX := (Width - W) div 2;
          tY := 0;
        end;
        alTopRight:
        begin
          ATextRect := Rect(Width - W - 8, 1, Width - 8, H);
          tX := Width - W - 8;
          tY := 0;
        end;
        alBottomLeft:
        begin
          ATextRect := Rect(8, Height - H, 8 + W, Height);
          tX := 8;
          tY := Height - H;
        end;
        alBottomCenter:
        begin
          ATextRect := Rect((Width - W) div 2, Height - H, (Width - W) div 2 + W, Height);
          tX := (Width - W) div 2;
          tY := Height - H;
        end;
        alBottomRight:
        begin
          ATextRect := Rect(Width - W - 8, Height - H, Width - 8, Height);
          tX := Width - W - 8;
          tY := Height - H;
        end;
        alLeftTop:
        begin
          ATextRect := Rect(0, 8, H, 8 + W);
          tX := 0;
          tY := 8 + W;
        end;
        alLeftCenter:
        begin
          ATextRect := Rect(0, (Height - W) div 2, H, (Height - W) div 2 + W);
          tX := 0;
          tY := (Height - W) div 2 + W;
        end;
        alLeftBottom:
        begin
          ATextRect := Rect(0, Height - W - 8, H, Height - 8);
          tX := 0;
          tY := Height - 8;
        end;
        alRightTop:
        begin
          ATextRect := Rect(Width - H, 8, Width, 8 + W);
          tX := Width;
          tY := 8;
        end;
        alRightCenter:
        begin
          ATextRect := Rect(Width - H, (Height - W) div 2, Width, (Height - W) div 2 + W);
          tX := Width;
          tY := (Height - W) div 2;
        end;
        alRightBottom:
        begin
          ATextRect := Rect(Width - H, Height - W - 8, Width, Height - 8);
          tX := Width;
          tY := Height - 8 -W;
        end;
        alCenterCenter:
        begin
          ATextRect := Rect((Width - W) div 2, (Height - H) div 2, (Width - W) div 2 + W, (Height - H) div 2 + H);
          tX := (Width - W) div 2;
          tY := (Height - H) div 2;
        end;
        else
        begin
          ATextRect := Rect (8, 0, 8 + W, H);
          tX := 0;
          tY := 0;
        end;
      end;

      if Alignment in [alLeftTop, alLeftCenter, alLeftBottom] then begin
        GetTextMetrics(Handle, TTM);
        if (TTM.tmPitchAndFamily and TMPF_TRUETYPE) = 0 then
          Font.Name := 'Arial';
        GetObject(Font.Handle, SizeOf(TLF), @TLF);
        TLF.lfEscapement := 900;
        Ft := CreateFontIndirect(TLF);
        Font.Handle := Ft;
      end;
      if Alignment in [alRightTop, alRightCenter, alRightBottom] then begin
        GetTextMetrics(Handle, TTM);
        if (TTM.tmPitchAndFamily and TMPF_TRUETYPE) = 0 then
          Font.Name := 'Arial';
        GetObject(Font.Handle, SizeOf(TLF), @TLF);
        TLF.lfEscapement := 2700;
        Ft := CreateFontIndirect(TLF);
        Font.Handle := Ft;
      end;
    end;

    if AreVisualStylesMustBeUsed(LookAndFeel.NativeStyle, totButton) then
    begin
      if Caption = '' then
        FillChar(ATextRect, SizeOf(ATextRect), 0)
      else
      begin
        GetTextExtentPoint32(Handle, PChar(Caption),
          Length(Caption), ACaptionSize);

        ARgn := GetClipRegion;
        AControlRect := GetControlRect(Self);
        ExcludeClipRect(ATextRect);

        ATheme := OpenTheme(totButton);
        if Enabled then
          ANativeState := GBS_NORMAL
        else
          ANativeState := GBS_DISABLED;

        if IsThemeBackgroundPartiallyTransparent(ATheme, BP_GROUPBOX, ANativeState) then
          DrawThemeParentBackground(Handle, Canvas.Handle, @AControlRect)
        else
          cxEditFillRect(Canvas.Handle, AControlRect, GetSolidBrush(Canvas, Self.Color));

        DrawThemeBackground(ATheme, Canvas.Handle, BP_GROUPBOX, ANativeState, @ABodyRect);

        SetClipRegion(ARgn, roSet);
        Brush.Style := bsSolid;
        GetThemeColor(ATheme, BP_GROUPBOX, ANativeState, TMT_TEXTCOLOR, AColor);
        Font.Color := AColor;
      end;
    end else
    begin
      // Not native drawing
      FillRect(ClientRect);
      case LookAndFeel.Kind of
        lfUltraFlat:
          begin
            Brush.Color := Self.Color;
            if FHideCaption then ABodyRect := ClientRect
              else InflateRect(ABodyRect, -1, -1);
            if FOver and FHotTrack then Brush.Color := FHotTrackColor
              else Brush.Color := clBtnShadow;
            if beLeft in FEdges then BevelLine(Brush.Color, ABodyRect.Left, ABodyRect.Top, ABodyRect.Left, ABodyRect.Bottom);
            if beRight in FEdges then BevelLine(Brush.Color, ABodyRect.Right - 1, ABodyRect.Top, ABodyRect.Right - 1, ABodyRect.Bottom);
            if beTop in FEdges then BevelLine(Brush.Color, ABodyRect.Left, ABodyRect.Top, ABodyRect.Right, ABodyRect.Top);
            if beBottom in FEdges then BevelLine(Brush.Color, ABodyRect.Left, ABodyRect.Bottom - 1, ABodyRect.Right, ABodyRect.Bottom - 1);
//            FrameRect(ABodyRect);
          end;
        lfFlat:
          begin
            Brush.Color := clBtnHighLight;
            FrameRect(ABodyRect);
            InflateRect(ABodyRect, -1, -1);
            Brush.Color := clBtnShadow;
            FrameRect(ABodyRect);
          end;
        lfStandard:
          begin
            Brush.Color := clBtnHighlight;
            FrameRect(ABodyRect);
            OffsetRect(ABodyRect, -1, -1);
            Brush.Color := clBtnShadow;
            FrameRect(ABodyRect);
          end;
      end;
      Brush.Color := Self.Color;
      if not FHideCaption then FillRect(ATextRect);
      Brush.Color := CaptionBkColor;
    end;

    if FHideCaption then Exit;
    SetBkMode(Handle, TRANSPARENT);
    if Alignment in [alLeftTop, alLeftCenter, alLeftBottom, alRightTop,
      alRightCenter, alRightBottom] then
      ExtTextOut(Handle, tX, tY, ETO_CLIPPED, @ATextRect, PChar(Text), Length(Text), nil)
    else begin
      if ATextRect.Top>=2 then AHeaderRect.Top:=ATextRect.Top-2
       else AHeaderRect.Top:=0;
      if ATextRect.Bottom<Self.Height-3 then AHeaderRect.Bottom:=ATextRect.Bottom+3
       else AHeaderRect.Bottom:=Self.Height;
      AHeaderRect.Left:=ATextRect.Left; AHeaderRect.Right:=Self.Width-ATextRect.Left;

      if (FCaptionBkPicture<>nil) and (FCaptionBkPicture.Width>0) then begin
       Canvas.StretchDraw(AHeaderRect, FCaptionBkPicture.Bitmap);
       Canvas.Brush.Color := clBtnShadow;
       Canvas.FrameRect(AHeaderRect);
      end;

      SetBkMode(Handle, TRANSPARENT);
      DrawText(Text, ATextRect, cxShowPrefix or cxSingleLine);
    end;
  end;
end;

procedure TssGroupBox.SetCaptionBkPicture(const Value: TPicture);
begin
  FCaptionBkPicture.Assign(Value);
  Repaint;
end;

procedure TssGroupBox.SetEdges(const Value: TssBevelEdges);
begin
  FEdges := Value;
  Invalidate;
end;

procedure TssGroupBox.SetHideCaption(const Value: Boolean);
begin
  FHideCaption := Value;
  Invalidate;
end;

procedure TssGroupBox.SetHotTrack(const Value: Boolean);
begin
  FHotTrack := Value;
  Invalidate;
end;

procedure TssGroupBox.SetHotTrackColor(const Value: TColor);
begin
  FHotTrackColor := Value;
end;

end.
