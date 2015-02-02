{$WARNINGS OFF}
unit ssGradientPanel;

interface

uses
  Windows, SysUtils, Classes, Controls, ExtCtrls, Graphics, ssGraphUtil;

type
  TssGradientPanel = class(TPanel)
  private
    FGrStartColor: TColor;
    FGrEndColor: TColor;
    FGrDirection: TGradientDirection;
    FRightMargin: Cardinal;
    procedure SetGrStartColor(const Value: TColor);
    procedure SetGrEndColor(const Value: TColor);
    procedure SetGrDirection(const Value: TGradientDirection);
    procedure SetRightMargin(const Value: Cardinal);

  protected
    procedure Paint; override;

  public
    constructor Create(AOwner: TComponent); override;

  published
    property GrStartColor: TColor read FGrStartColor write SetGrStartColor;
    property GrEndColor: TColor read FGrEndColor write SetGrEndColor;
    property GrDirection: TGradientDirection read FGrDirection write SetGrDirection;
    property RightMargin: Cardinal read FRightMargin write SetRightMargin default 0;
  end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses Types;

//==============================================================================================
constructor TssGradientPanel.Create(AOwner: TComponent);
begin
  inherited;

  FGrStartColor := Color;
  FGrEndColor := Color;
end;

//==============================================================================================
procedure TssGradientPanel.Paint;
  const
    Alignments: array[TAlignment] of Longint = (DT_LEFT, DT_RIGHT, DT_CENTER);
  var
    TopColor, BottomColor: TColor;
    FontHeight: integer;
    Rect: TRect;
    Flags: Longint;

  procedure AdjustColors(Bevel: TPanelBevel);
  begin
    TopColor := clBtnHighlight;
    if Bevel = bvLowered then TopColor := clBtnShadow;
    BottomColor := clBtnShadow;
    if Bevel = bvLowered then BottomColor := clBtnHighlight;
  end;

begin
  Rect := ClientRect;

  if not DrawGradient(Canvas, Rect, FGrStartColor, FGrEndColor, FGrDirection) then begin
    Canvas.Brush.Color := Color;
    Canvas.FillRect(ClientRect);
  end;

  if BevelOuter <> bvNone then begin
    AdjustColors(BevelOuter);
    Frame3D(Canvas, Rect, TopColor, BottomColor, BevelWidth);
  end;

  Frame3D(Canvas, Rect, Color, Color, BorderWidth);

  if BevelInner <> bvNone then begin
    AdjustColors(BevelInner);
    Frame3D(Canvas, Rect, TopColor, BottomColor, BevelWidth);
  end;

  with Canvas do begin
    Brush.Style := bsClear;
    Font := Self.Font;
    FontHeight := TextHeight('W');

    with Rect do begin
      Left := 18; // reserve for glyph
      Top := ((Bottom + Top) - FontHeight) div 2;
      Bottom := Top + FontHeight;
      Right := Right - RightMargin - Left;
    end;

    Flags := DT_EXPANDTABS or DT_VCENTER or Alignments[Alignment];
    Flags := DrawTextBiDiModeFlags(Flags);
    DrawText(Handle, PChar(Caption), -1, Rect, Flags);
  end;
end;

//==============================================================================================
procedure TssGradientPanel.SetGrDirection(const Value: TGradientDirection);
begin
  FGrDirection := Value;
  Invalidate;
end;

//==============================================================================================
procedure TssGradientPanel.SetGrEndColor(const Value: TColor);
begin
  FGrEndColor := Value;
  Invalidate;
end;

//==============================================================================================
procedure TssGradientPanel.SetGrStartColor(const Value: TColor);
begin
  FGrStartColor := Value;
  Invalidate;
end;

//==============================================================================================
procedure TssGradientPanel.SetRightMargin(const Value: Cardinal);
begin
  FRightMargin := Value;
  Invalidate;
end;

end.
