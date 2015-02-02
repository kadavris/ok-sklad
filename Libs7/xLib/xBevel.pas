unit xBevel;

interface

uses
  SysUtils, Classes, Controls, ExtCtrls, Graphics, xGradient;

type
  TxBevelStyle = (bsLowered, bsRaised, bsSingle);

  TxBevelEdge = (beLeft, beRight, beTop, beBottom);
  TxBevelEdges = set of TxBevelEdge;

  TxBevel = class(TGraphicControl)
  private
    FShape: TBevelShape;
    FStyle: TxBevelStyle;
    FColorInner: TColor;
    FColorOuter: TColor;
    FCaption: TCaption;
    FAlignment: TAlignment;
    FGradient: TxGradient;
    FEdges: TxBevelEdges;
    procedure SetShape(const Value: TBevelShape);
    procedure SetStyle(const Value: TxBevelStyle);
    procedure SetColorInner(const Value: TColor);
    procedure SetColorOuter(const Value: TColor);
    procedure SetCaption(const Value: TCaption);
    procedure SetAlignment(const Value: TAlignment);
    procedure SetEdges(const Value: TxBevelEdges);
    procedure SetGradient(const Value: TxGradient);
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Align;
    property Alignment: TAlignment read FAlignment write SetAlignment;
    property Anchors;
    property Caption: TCaption read FCaption write SetCaption;
    property ColorInner: TColor read FColorInner write SetColorInner;
    property ColorOuter: TColor read FColorOuter write SetColorOuter;
    property Constraints;
    property Edges: TxBevelEdges read FEdges write SetEdges;
    property Font;
    property Gradient: TxGradient read FGradient write SetGradient;
    property ParentShowHint;
    property Shape: TBevelShape read FShape write SetShape default bsBox;
    property ShowHint;
    property Style: TxBevelStyle read FStyle write SetStyle default bsLowered;
    property Visible;
  end;

implementation

uses Types, Windows;

constructor TxBevel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csReplicatable];
  FStyle := bsLowered;
  FShape := bsBox;
  FColorInner:=clBtnShadow;
  FColorOuter:=clBtnHighlight;
  Width := 50;
  Height := 50;
  FGradient := TxGradient.Create(Self);
  with FGradient do begin
   ColorBegin:=clBtnFace;
   ColorEnd:=clBtnFace;
  end;
end;

destructor TxBevel.Destroy;
begin
  FGradient.Free;

  inherited;
end;

procedure TxBevel.Paint;
const
  XorColor = $00FFD8CE;
  Alignments: array[TAlignment] of Longint = (DT_LEFT, DT_RIGHT, DT_CENTER);

var
  Color1, Color2: TColor;
  Temp: TColor;
  {tx, ty, }th, tw: integer;
  R: TRect;
  Flags: Longint;

  procedure BevelRect(const R: TRect);
  begin
    with Canvas do begin
      Pen.Color := Color1;
      PolyLine([Point(R.Left, R.Bottom), Point(R.Left, R.Top), Point(R.Right, R.Top)]);
      Pen.Color := Color2;
      PolyLine([Point(R.Right, R.Top), Point(R.Right, R.Bottom), Point(R.Left, R.Bottom)]);
    end;
  end;

  procedure BevelLine(C: TColor; X1, Y1, X2, Y2: Integer);
  begin
    with Canvas do
    begin
      Pen.Color := C;
      MoveTo(X1, Y1);
      LineTo(X2, Y2);
    end;
  end;

begin
  R:=ClientRect;
  with Canvas do begin
    if FGradient.Enabled then FGradient.GradientFill;
    tw := TextWidth(FCaption);
    th := TextHeight(FCaption);
    if (csDesigning in ComponentState) then begin
      if (FShape = bsSpacer) then begin
        Pen.Style := psDot;
        Pen.Mode := pmXor;
        Pen.Color := XorColor;
        Brush.Style := bsClear;
        Rectangle(0, 0, ClientWidth, ClientHeight);
      end
      else begin
        Pen.Style := psSolid;
        Pen.Mode  := pmCopy;
        Pen.Color := clBlack;
        Brush.Style := bsSolid;
      end;
    end;

    Pen.Width := 1;

    if FStyle = bsLowered then begin
      Color1 := FColorInner;
      Color2 := FColorOuter;
    end
    else begin
      Color1 := FColorOuter;
      Color2 := FColorInner;
    end;

    case FShape of
      bsBox: BevelRect(Rect(0, 0, Width - 1, Height - 1));
      bsFrame:
        begin
          Temp := Color1;
          Color1 := Color2;
          BevelRect(Rect(1, 1, Width - 1, Height - 1));
          Color2 := Temp;
          Color1 := Temp;
          BevelRect(Rect(0, 0, Width - 2, Height - 2));
        end;
      bsTopLine:
        begin
          BevelLine(Color1, 0, 0, Width, 0);
          if FStyle <> bsSingle then BevelLine(Color2, 0, 1, Width, 1);
        end;
      bsBottomLine:
        begin
          BevelLine(Color1, 0, Height - 2, Width, Height - 2);
          if FStyle <> bsSingle then BevelLine(Color2, 0, Height - 1, Width, Height - 1);
        end;
      bsLeftLine:
        begin
          BevelLine(Color1, 0, 0, 0, Height);
          if FStyle <> bsSingle then BevelLine(Color2, 1, 0, 1, Height);
        end;
      bsRightLine:
        begin
          BevelLine(Color1, Width - 2, 0, Width - 2, Height);
          if FStyle <> bsSingle then BevelLine(Color2, Width - 1, 0, Width - 1, Height);
        end;
    end;
    Font:=Self.Font;
    Brush.Style:=bsClear;
    with R do begin
      Top := ((Bottom + Top) - th) div 2;
      Bottom := Top + th;
      Left:=Left+2;
      Right:=Right-2;
    end;
    Flags := DT_EXPANDTABS or DT_VCENTER or Alignments[Alignment];
    Flags := DrawTextBiDiModeFlags(Flags);
    DrawText(Handle, PChar(FCaption), -1, R, Flags);
  end;
end;

procedure TxBevel.SetAlignment(const Value: TAlignment);
begin
  FAlignment := Value;
  Invalidate;
end;

procedure TxBevel.SetCaption(const Value: TCaption);
begin
  FCaption := Value;
  Invalidate;
end;

procedure TxBevel.SetColorInner(const Value: TColor);
begin
  if Value <> FColorInner then begin
    FColorInner := Value;
    Invalidate;
  end;
end;

procedure TxBevel.SetColorOuter(const Value: TColor);
begin
  if Value <> FColorOuter then begin
    FColorOuter := Value;
    Invalidate;
  end;
end;

procedure TxBevel.SetEdges(const Value: TxBevelEdges);
begin
  FEdges := Value;
  Invalidate;
end;

procedure TxBevel.SetGradient(const Value: TxGradient);
begin
  FGradient.Assign(Value);
end;

procedure TxBevel.SetShape(const Value: TBevelShape);
begin
  if Value <> FShape then begin
    FShape := Value;
    Invalidate;
  end;
end;

procedure TxBevel.SetStyle(const Value: TxBevelStyle);
begin
  if Value <> FStyle then begin
    FStyle := Value;
    Invalidate;
  end;
end;

end.
