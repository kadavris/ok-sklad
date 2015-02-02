unit okFontComboBox;

interface

uses
  Windows, SysUtils, Classes, Controls, StdCtrls, FR_Combo, Graphics, Messages, dialogs;

type
  TokFontComboBox = class(TfrFontComboBox)
  private
    FOverBtn: Boolean;
    FDefEditProc: Pointer;
    FEditInstance: Pointer;
    procedure SetOverBtn(const Value: Boolean);
    procedure EditWndProc(var Message: TMessage);

    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;

  protected
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure PaintBorder(DC: HDC; const SolidBorder: Boolean); override;
    procedure PaintButton(bnStyle: Integer); override;
    property OverBtn: Boolean read FOverBtn write SetOverBtn;

  public
    constructor Create(AOwner: TComponent); override;
    procedure CreateWnd; override;

  end;

  TokComboBox = class(TfrComboBox)
  private
    FOverBtn: Boolean;
    FDefEditProc: Pointer;
    FEditInstance: Pointer;
    procedure SetOverBtn(const Value: Boolean);
    procedure EditWndProc(var Message: TMessage);

    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure CMMouseEnter(var Message: TMessage); message CM_MOUSEENTER;

  protected
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure PaintBorder(DC: HDC; const SolidBorder: Boolean); override;
    procedure PaintButton(bnStyle: Integer); override;
    property OverBtn: Boolean read FOverBtn write SetOverBtn;

  public
    constructor Create(AOwner: TComponent); override;
    procedure CreateWnd; override;

  end;

implementation

uses Types;

{ TokFontComboBox }

procedure TokFontComboBox.CMMouseEnter(var Message: TMessage);
begin
  inherited;
end;

procedure TokFontComboBox.CMMouseLeave(var Message: TMessage);
begin
  OverBtn := False;
  inherited;
end;

constructor TokFontComboBox.Create(AOwner: TComponent);
begin
  inherited;

  FEditInstance := MakeObjectInstance(EditWndProc);
  FDefEditProc := nil;
end;

procedure TokFontComboBox.CreateWnd;
begin
  inherited;

  FDefEditProc := Pointer(GetWindowLong(FEditHandle, GWL_WNDPROC));
  SetWindowLong(FEditHandle, GWL_WNDPROC, Longint(FEditInstance));
end;

procedure TokFontComboBox.EditWndProc(var Message: TMessage);
  procedure CallDefaultProc;
  begin
    with Message do
      Result := CallWindowProc(FDefEditProc, FEditHandle, Msg, WParam, LParam);
  end;
begin
  case Message.Msg of
    WM_MOUSEMOVE:
      begin
        OverBtn := False;
      end;
    else
      CallDefaultProc;
  end;
end;

procedure TokFontComboBox.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  R: TRect;
begin
  SetRect(R, Width - FButtonWidth - 3, 1, Width - 1, Height - 1);
  OverBtn := PtInRect(R, Point(X, Y));
end;

procedure TokFontComboBox.PaintBorder(DC: HDC; const SolidBorder: Boolean);
var
  R: TRect;
  BtnFaceBrush, WindowBrush, HT, BB: HBRUSH;
begin
  BtnFaceBrush := GetSysColorBrush(COLOR_BTNFACE);
  WindowBrush := GetSysColorBrush(COLOR_WINDOW);
  GetWindowRect(Handle, R);
  OffsetRect (R, -R.Left, -R.Top);
  InflateRect(R, -1, -1);
  FrameRect (DC, R, WindowBrush {BtnFaceBrush});
  InflateRect(R, -1, -1);
  R.Right := R.Right - FButtonWidth - 1;
  FrameRect (DC, R, WindowBrush);
  if SolidBorder then
  begin
    GetWindowRect(Handle, R);
    OffsetRect (R, -R.Left, -R.Top);
//    InflateRect(R, -1, -1);
    HT := CreateSolidBrush(ColorToRGB(543892488));
    FrameRect(DC, R, HT);
    DeleteObject(HT);
  end else
  begin
    GetWindowRect(Handle, R);
    OffsetRect (R, -R.Left, -R.Top);
//    InflateRect(R, -1, -1);
    BB := CreateSolidBrush(ColorToRGB(clBtnShadow));
    FrameRect (DC, R, BB);
    DeleteObject(BB);
  end;
end;

procedure TokFontComboBox.PaintButton(bnStyle: Integer);
var
  R: TRect;
  DC: HDC;
  Brush, SaveBrush: HBRUSH;
  X, Y: Integer;
  Pen, SavePen: HPEN;
  WindowBrush: HBRUSH;
begin
  WindowBrush := GetSysColorBrush(COLOR_WINDOW);
  DC := GetWindowDC(Handle);
  SetRect(R, Width - FButtonWidth - 3, 1, Width - 1, Height - 1);
  X := Trunc(FButtonWidth / 2) + Width - FButtonWidth - 4;
  Y := Trunc((Height - 4) / 2) + 1;

  if FOverBtn
    then Brush := CreateSolidBrush(ColorToRGB(550944437))
    else Brush := CreateSolidBrush(GetSysColor(COLOR_BTNFACE));
  SaveBrush := SelectObject(DC, Brush);
  if not OverBtn then begin
    FrameRect(DC, R, WindowBrush);
    InflateRect(R, -1, -1);
  end;
  FillRect(DC, R, Brush);
  SelectObject(DC, SaveBrush);
  DeleteObject(Brush);

  case bnStyle of
    0: begin
//         FrameRect (DC, R, WindowBrush);
{         GetWindowRect(Handle, R);
         OffsetRect (R, -R.Left, -R.Top);
         InflateRect(R, -FButtonWidth - 3, -2);}

         if OverBtn then begin
           Pen := CreatePen(PS_SOLID, 1, ColorToRGB(clBtnShadow));
           SavePen := SelectObject(DC, Pen);
           MoveToEx(DC, R.Left, R.Top, nil);
           LineTo(DC, R.Left, R.Bottom);
           SelectObject(DC, SavePen);
           DeleteObject(Pen);
         end;
         PaintButtonGlyph(DC, X, Y);
       end;
  1,2: begin
{         DrawEdge (DC, R, BDR_RAISEDINNER, BF_RECT);
         GetWindowRect(Handle, R);
         OffsetRect (R, -R.Left, -R.Top);
         InflateRect(R, -FButtonWidth - 3, -1);}

         if OverBtn then begin
           Pen := CreatePen(PS_SOLID, 1, ColorToRGB(543892488));
           SavePen := SelectObject(DC, Pen);
           MoveToEx(DC, R.Left, R.Top, nil);
           LineTo(DC, R.Left, R.Bottom);
           SelectObject(DC, SavePen);
           DeleteObject(Pen);
         end;
         if bnStyle = 1
           then PaintButtonGlyph(DC, X, Y)
           else PaintButtonGlyph(DC, X + 1, Y + 1);
       end;
  end;
  ReleaseDC(Handle, DC);
end;

procedure TokFontComboBox.SetOverBtn(const Value: Boolean);
begin
  if FOverBtn = Value then Exit;
  FOverBtn := Value;
  PaintButton(0);
end;

{ TokComboBox }

procedure TokComboBox.CMMouseEnter(var Message: TMessage);
begin
  inherited;
end;

procedure TokComboBox.CMMouseLeave(var Message: TMessage);
begin
  OverBtn := False;
  inherited;
end;

constructor TokComboBox.Create(AOwner: TComponent);
begin
  inherited;

end;

procedure TokComboBox.CreateWnd;
begin
  inherited;

end;

procedure TokComboBox.EditWndProc(var Message: TMessage);
  procedure CallDefaultProc;
  begin
    with Message do
      Result := CallWindowProc(FDefEditProc, FEditHandle, Msg, WParam, LParam);
  end;
begin
  case Message.Msg of
    WM_MOUSEMOVE:
      begin
        OverBtn := False;
      end;
    else
      CallDefaultProc;
  end;
end;

procedure TokComboBox.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  R: TRect;
begin
  SetRect(R, Width - FButtonWidth - 3, 1, Width - 1, Height - 1);
  OverBtn := PtInRect(R, Point(X, Y));
end;

procedure TokComboBox.PaintBorder(DC: HDC; const SolidBorder: Boolean);
var
  R: TRect;
  BtnFaceBrush, WindowBrush, HT, BB: HBRUSH;
begin
  BtnFaceBrush := GetSysColorBrush(COLOR_BTNFACE);
  WindowBrush := GetSysColorBrush(COLOR_WINDOW);
  GetWindowRect(Handle, R);
  OffsetRect (R, -R.Left, -R.Top);
  InflateRect(R, -1, -1);
  FrameRect (DC, R, WindowBrush {BtnFaceBrush});
  InflateRect(R, -1, -1);
  R.Right := R.Right - FButtonWidth - 1;
  FrameRect (DC, R, WindowBrush);
  if SolidBorder then
  begin
    GetWindowRect(Handle, R);
    OffsetRect (R, -R.Left, -R.Top);
//    InflateRect(R, -1, -1);
    HT := CreateSolidBrush(ColorToRGB(543892488));
    FrameRect(DC, R, HT);
    DeleteObject(HT);
  end else
  begin
    GetWindowRect(Handle, R);
    OffsetRect (R, -R.Left, -R.Top);
//    InflateRect(R, -1, -1);
    BB := CreateSolidBrush(ColorToRGB(clBtnShadow));
    FrameRect (DC, R, BB);
    DeleteObject(BB);
  end;
end;

procedure TokComboBox.PaintButton(bnStyle: Integer);
var
  R: TRect;
  DC: HDC;
  Brush, SaveBrush: HBRUSH;
  X, Y: Integer;
  Pen, SavePen: HPEN;
  WindowBrush: HBRUSH;
begin
  WindowBrush := GetSysColorBrush(COLOR_WINDOW);
  DC := GetWindowDC(Handle);
  SetRect(R, Width - FButtonWidth - 3, 1, Width - 1, Height - 1);
  X := Trunc(FButtonWidth / 2) + Width - FButtonWidth - 4;
  Y := Trunc((Height - 4) / 2) + 1;

  if FOverBtn
    then Brush := CreateSolidBrush(ColorToRGB(550944437))
    else Brush := CreateSolidBrush(GetSysColor(COLOR_BTNFACE));
  SaveBrush := SelectObject(DC, Brush);
  if not OverBtn then begin
    FrameRect(DC, R, WindowBrush);
    InflateRect(R, -1, -1);
  end;
  FillRect(DC, R, Brush);
  SelectObject(DC, SaveBrush);
  DeleteObject(Brush);

  case bnStyle of
    0: begin
//         FrameRect (DC, R, WindowBrush);
{         GetWindowRect(Handle, R);
         OffsetRect (R, -R.Left, -R.Top);
         InflateRect(R, -FButtonWidth - 3, -2);}

         if OverBtn then begin
           Pen := CreatePen(PS_SOLID, 1, ColorToRGB(clBtnShadow));
           SavePen := SelectObject(DC, Pen);
           MoveToEx(DC, R.Left, R.Top, nil);
           LineTo(DC, R.Left, R.Bottom);
           SelectObject(DC, SavePen);
           DeleteObject(Pen);
         end;
         PaintButtonGlyph(DC, X, Y);
       end;
  1,2: begin
{         DrawEdge (DC, R, BDR_RAISEDINNER, BF_RECT);
         GetWindowRect(Handle, R);
         OffsetRect (R, -R.Left, -R.Top);
         InflateRect(R, -FButtonWidth - 3, -1);}

         if OverBtn then begin
           Pen := CreatePen(PS_SOLID, 1, ColorToRGB(543892488));
           SavePen := SelectObject(DC, Pen);
           MoveToEx(DC, R.Left, R.Top, nil);
           LineTo(DC, R.Left, R.Bottom);
           SelectObject(DC, SavePen);
           DeleteObject(Pen);
         end;

         if bnStyle = 1
           then PaintButtonGlyph(DC, X, Y)
           else PaintButtonGlyph(DC, X + 1, Y + 1);
       end;
  end;
  ReleaseDC(Handle, DC);
end;

procedure TokComboBox.SetOverBtn(const Value: Boolean);
begin
  if FOverBtn = Value then Exit;
  FOverBtn := Value;
  PaintButton(0);
end;

end.
