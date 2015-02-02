unit ssLabel;

interface

uses
  SysUtils, Classes, Controls, StdCtrls, Types, Graphics;

type
  TssDisabledDraw = (ddStandard, ddUser);

  TssLabel = class(TLabel)
  private
    FDisabledDraw: TssDisabledDraw;
    FDisabledColor: TColor;

    procedure SetDisabledDraw(const Value: TssDisabledDraw);
    procedure SetDisabledColor(const Value: TColor);

  protected
    procedure DoDrawText(var Rect: TRect; Flags: Longint); override;

  published
    property DisabledDraw: TssDisabledDraw read FDisabledDraw write SetDisabledDraw;
    property DisabledColor: TColor read FDisabledColor write SetDisabledColor;
  end;

procedure Register;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses Windows;

//==============================================================================================
procedure Register;
begin
  RegisterComponents('SS Pack', [TssLabel]);
end;

//==============================================================================================
procedure TssLabel.DoDrawText(var Rect: TRect; Flags: Integer);
  var
    Text: string;
begin
  Text := GetLabelText;

  if (Flags and DT_CALCRECT <> 0) and ((Text = '') or ShowAccelChar and
    (Text[1] = '&') and (Text[2] = #0)) then Text := Text + ' ';

  if not ShowAccelChar then Flags := Flags or DT_NOPREFIX;

  Flags := DrawTextBiDiModeFlags(Flags);
  Canvas.Font := Font;

  if not Enabled then
  begin
    if FDisabledDraw=ddStandard then begin
      Canvas.Font.Color := clBtnHighlight;
      OffsetRect(Rect, 1, 1);
    end
    else Canvas.Font.Color := FDisabledColor;

    DrawText(Canvas.Handle, PChar(Text), Length(Text), Rect, Flags);

    if FDisabledDraw=ddStandard then begin
      OffsetRect(Rect, -1, -1);
      Canvas.Font.Color := clBtnShadow;
      DrawText(Canvas.Handle, PChar(Text), Length(Text), Rect, Flags);
    end;
  end
  else DrawText(Canvas.Handle, PChar(Text), Length(Text), Rect, Flags);
end;

//==============================================================================================
procedure TssLabel.SetDisabledColor(const Value: TColor);
begin
  FDisabledColor := Value;
  Invalidate;
end;

//==============================================================================================
procedure TssLabel.SetDisabledDraw(const Value: TssDisabledDraw);
begin
  FDisabledDraw := Value;
  Invalidate;
end;

end.
