unit xBarCode;

interface

uses
  SysUtils, Classes, Controls, Graphics, Types;

type
  TEAN13_Sel = array[1..6] of Byte;
  TEAN13_Digit = string[4];
  TEAN13_Section = array[0..9] of TEAN13_Digit;

const
  EAN13_Sel: array[0..9] of TEAN13_Sel =
   (
    (1, 1, 1, 2, 2, 2), //0
    (1, 1, 2, 1, 2, 2), //1
    (1, 1, 2, 2, 1, 2), //2
    (1, 1, 2, 2, 2, 1), //3
    (1, 2, 1, 1, 2, 2), //4
    (1, 2, 2, 1, 1, 2), //5
    (1, 2, 2, 2, 1, 1), //6
    (1, 2, 1, 2, 1, 2), //7
    (1, 2, 1, 2, 2, 1), //8
    (1, 2, 2, 1, 2, 1)  //9
   );

  EAN13_Subsets: array[1..3] of TEAN13_Section =
   (
    ('3211', '2221', '2122', '1411', '1132',
     '1131', '1114', '1312', '1213', '3112'),
    ('1123', '1222', '2212', '1141', '2311',
     '1311', '4111', '2131', '3121', '2113'),
    ('3211', '2221', '2122', '1411', '1132',
     '1131', '1114', '1312', '1213', '3112')
   );

type
  TxBarType = (EAN13);

  TxBarCode = class(TCustomControl)
  private
    FBarCode: TCaption;
    FBarType: TxBarType;
//    FSection1, FSection2: string;
    FBarColor: TColor;
    FMargin: Cardinal;
    FTransparent: Boolean;
    FColor: TColor;
    FShowFirstDigit: Boolean;
    FShowLastSymbol: Boolean;
    FErrorText: TCaption;
    FErrorTextColor: TColor;
    procedure SetBarCode(const Value: TCaption);
    procedure SetBarType(const Value: TxBarType);
    procedure SetBarColor(const Value: TColor);
//    procedure SetSections;
    procedure SetMargin(const Value: Cardinal);
    procedure SetTransparent(const Value: Boolean);
    procedure SetColor(const Value: TColor);
    procedure SetShowFirstDigit(const Value: Boolean);
    procedure SetShowLastSymbol(const Value: Boolean);
    procedure SetErrorText(const Value: TCaption);
    procedure SetErrorTextColor(const Value: TColor);
  protected
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
  published
    property BarCode: TCaption read FBarCode write SetBarCode;
    property BarColor: TColor read FBarColor write SetBarColor;
    property BarType: TxBarType read FBarType write SetBarType;
    property Color: TColor read FColor write SetColor default clWindow;
    property ErrorText: TCaption read FErrorText write SetErrorText;
    property ErrorTextColor: TColor read FErrorTextColor write SetErrorTextColor
      default clRed;
    property Font;
    property Margin: Cardinal read FMargin write SetMargin default 0;
    property ParentColor;
    property ShowFirstDigit: Boolean read FShowFirstDigit write SetShowFirstDigit
      default True;
    property ShowLastSymbol: Boolean read FShowLastSymbol write SetShowLastSymbol
      default True;
    property Transparent: Boolean read FTransparent write SetTransparent
      default False;
  end;

implementation

uses
  Windows;

constructor TxBarCode.Create(AOwner: TComponent);
begin
  inherited;

  Width := 120;
  Height := 60;
  FColor := clWindow;
  FShowFirstDigit := True;
  FShowLastSymbol := True;

  FErrorText := 'Invalid Barcode!';
  FErrorTextColor := clRed;
end;

procedure TxBarCode.Paint;
var
  R: TRect;
  X, i, TH, TW: Integer;
  S, SS: string;
  Flags: Longint;

 procedure DrawItem(AColor: TColor; X1, Y1, X2, Y2: Integer);
 begin
   with Canvas do begin
     Brush.Color := AColor;
     FillRect(Rect(X1, Y1, X2, Y2));
     X := X2;
   end;
 end;

 procedure DrawSep1(R: TRect);
 begin
   DrawItem(FBarColor, X, R.Top, X + 1, R.Bottom);
   DrawItem(Color, X, R.Top, X + 1, R.Bottom);
   DrawItem(FBarColor, X, R.Top, X + 1, R.Bottom);
 end;

 procedure DrawSep2(R: TRect);
 begin
   DrawItem(Color, X, R.Top, X + 1, R.Bottom);
   DrawItem(FBarColor, X, R.Top, X + 1, R.Bottom);
   DrawItem(Color, X, R.Top, X + 1, R.Bottom);
   DrawItem(FBarColor, X, R.Top, X + 1, R.Bottom);
   DrawItem(Color, X, R.Top, X + 1, R.Bottom);
 end;

 procedure DrawSection(const S, SS: string; R: TRect; AColor1, AColor2: TColor);
 var
   i, W: Integer;
   FColor: TColor;
   DX, TH: Integer;
   TR: TRect;
   Flags: Longint;
   FDigit: string;
 begin
   FColor := AColor1;
   DX := X;
   TH := Canvas.TextHeight('0');
   for i := 1 to Length(S) do begin
     W := StrToInt(S[i]);
     DrawItem(FColor, X, R.Top, X + W, R.Bottom - 8);
     if FColor = AColor1
       then FColor := AColor2
       else FColor := AColor1;

     if i mod 4 = 0 then begin
       Canvas.Brush.Color := Self.FColor;
       Canvas.Brush.Style := bsClear;
       TR.Left := DX;
       TR.Top := R.Bottom - 9;
       TR.Right := X;
       TR.Bottom := TR.Top + TH;
       Flags := DT_EXPANDTABS or DT_RIGHT or DT_TOP;
       Flags := DrawTextBiDiModeFlags(Flags);
       FDigit := SS[i div 4];
       DrawText(Canvas.Handle, PChar(FDigit), -1, TR, Flags);
//       Canvas.TextOut(DX, R.Bottom - 8, SS[i div 4]);
       DX := X;
     end;

   end;
 end;

begin
  R := ClientRect;
  with Canvas do begin
    Font := Self.Font;
    if not FTransparent then begin
      Brush.Color := Self.FColor;
      FillRect(R);
    end;
    if Length(FBarCode) <> 13 then begin

      Flags := DT_CALCRECT or DT_EXPANDTABS or DT_CENTER or DT_WORDBREAK;
      Flags := DrawTextBiDiModeFlags(Flags);
      DrawText(Handle, PChar(FErrorText), -1, R, Flags);
      th:=R.Bottom-R.Top;
      R.Top := ClientRect.Top+((ClientRect.Bottom-ClientRect.Top-th) div 2);
      R.Bottom:=R.Top+th;
      TW := R.Right - R.Left;
      R.Left := ClientRect.Left + (Self.Width - TW) div 2;
      R.Right := R.Left + TW;

      Flags := DT_EXPANDTABS or DT_VCENTER or DT_CENTER or DT_WORDBREAK;
      Flags := DrawTextBiDiModeFlags(Flags);
//      TH := TextHeight('H');
//      R.Top := (R.Bottom - R.Top - TH) div 2;
//      R.Bottom := R.Top + TH;
      Font.Color := FErrorTextColor;
      Windows.DrawText(Handle, PChar(FErrorText), -1, R, Flags);
      Exit;
    end;

    InflateRect(R, -FMargin, -FMargin - 5);
    X := FMargin;
    if FShowFirstDigit then begin
      Brush.Color := Self.FColor;
      TextOut(X + 1, R.Bottom - 9, FBarCode[1]);
      X := X + 7;
    end;
    DrawSep1(R);

    S := '';
    SS := '';
    for i := 2 to 7 do begin
      S := S + EAN13_Subsets[EAN13_Sel[StrToInt(FBarCode[1])][i - 1]][StrToInt(FBarCode[i])];
      SS := SS + FBarCode[i];
    end;
    DrawSection(S, SS, R, Self.FColor, BarColor);

    DrawSep2(R);

    S := '';
    SS := '';
    for i := 8 to 13 do begin
      S := S + EAN13_Subsets[3][StrToInt(FBarCode[i])];
      SS := SS + FBarCode[i];
    end;  
    DrawSection(S, SS, R, BarColor, Self.FColor);

    DrawSep1(R);

    if FShowLastSymbol then begin
      Brush.Color := Self.FColor;
      TextOut(X + 2, R.Bottom - 9, '>');
    end;

  end;
end;

procedure TxBarCode.SetBarCode(const Value: TCaption);
begin
  FBarCode := Value;
  Invalidate;
end;

procedure TxBarCode.SetBarColor(const Value: TColor);
begin
  FBarColor := Value;
  Invalidate;
end;

procedure TxBarCode.SetBarType(const Value: TxBarType);
begin
  FBarType := Value;
  Invalidate;
end;

procedure TxBarCode.SetColor(const Value: TColor);
begin
  FColor := Value;
  Invalidate;
end;

procedure TxBarCode.SetErrorText(const Value: TCaption);
begin
  FErrorText := Value;
  Invalidate;
end;

procedure TxBarCode.SetErrorTextColor(const Value: TColor);
begin
  FErrorTextColor := Value;
  Invalidate;
end;

procedure TxBarCode.SetMargin(const Value: Cardinal);
begin
  FMargin := Value;
  Invalidate;
end;

{procedure TxBarCode.SetSections;
begin

end;}

procedure TxBarCode.SetShowFirstDigit(const Value: Boolean);
begin
  FShowFirstDigit := Value;
  Invalidate;
end;

procedure TxBarCode.SetShowLastSymbol(const Value: Boolean);
begin
  FShowLastSymbol := Value;
  Invalidate;
end;

procedure TxBarCode.SetTransparent(const Value: Boolean);
begin
  FTransparent := Value;
  Invalidate;
end;

end.
