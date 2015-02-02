unit ssImagePanel;

interface

uses
  SysUtils, Classes, Controls, ExtCtrls, Graphics;

type
  TssImagePanel = class(TPanel)
  private
   FPicture: TPicture;
   procedure SetPicture(const Value: TPicture);
  protected
   procedure Paint; override;
  public
   constructor Create(AOwner: TComponent); override;
   destructor Destroy; override;
  published
   property Picture: TPicture read FPicture write SetPicture;
  end;

implementation

uses Windows;

{ TssImagePanel }

constructor TssImagePanel.Create(AOwner: TComponent);
begin
  inherited;
  FPicture:=TPicture.Create;
end;

destructor TssImagePanel.Destroy;
begin
  FPicture.Free;

  inherited;
end;

procedure TssImagePanel.Paint;
const
  Alignments: array[TAlignment] of Longint = (DT_LEFT, DT_RIGHT, DT_CENTER);
var
  Rect: TRect;
  TopColor, BottomColor: TColor;
  FontHeight: Integer;
  Flags: Longint;

  procedure AdjustColors(Bevel: TPanelBevel);
  begin
    TopColor := clBtnHighlight;
    if Bevel = bvLowered then TopColor := clBtnShadow;
    BottomColor := clBtnShadow;
    if Bevel = bvLowered then BottomColor := clBtnHighlight;
  end;

begin
  Rect := GetClientRect;
  if BevelOuter <> bvNone then
  begin
    AdjustColors(BevelOuter);
    Frame3D(Canvas, Rect, TopColor, BottomColor, BevelWidth);
  end;
  Frame3D(Canvas, Rect, Color, Color, BorderWidth);
  if BevelInner <> bvNone then
  begin
    AdjustColors(BevelInner);
    Frame3D(Canvas, Rect, TopColor, BottomColor, BevelWidth);
  end;
  with Canvas do
  begin
//    if not ThemeServices.ThemesEnabled or not ParentBackground then
//    begin
      Brush.Color := Color;
      FillRect(Rect);
      if Assigned(FPicture) then Canvas.StretchDraw(ClientRect, FPicture.Bitmap);
//    end;
    Brush.Style := bsClear;
    Font := Self.Font;
    FontHeight := TextHeight('W');
    with Rect do
    begin
      Top := ((Bottom + Top) - FontHeight) div 2;
      Bottom := Top + FontHeight;
    end;
    Flags := DT_EXPANDTABS or DT_VCENTER or Alignments[Alignment];
    Flags := DrawTextBiDiModeFlags(Flags);
    DrawText(Handle, PChar(Caption), -1, Rect, Flags);
  end;
end;

procedure TssImagePanel.SetPicture(const Value: TPicture);
begin
  FPicture.Assign(Value);
end;

end.
