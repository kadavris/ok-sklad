unit flListView;

interface

uses
  SysUtils, Classes, Controls, StdCtrls, flLabel, messages, Types;

type
  TflListView = class(TflLabel)
  private
    FItems: TStrings;
    FRowInterval: Integer;
    FMaxRowCount: Integer;
    FMoveInterval: Integer;
    FMargin: Cardinal;
    procedure SetItems(const Value: TStrings);
    procedure SetRowInterval(const Value: Integer);
    procedure CMTextChanged(var M: TMessage); message CM_TEXTCHANGED;
    procedure SetMaxRowCount(const Value: Integer);
    procedure MoveCanvas;
    procedure SetMoveInterval(const Value: Integer);
    function GetPaintStatus: Boolean;
    procedure SetMargin(const Value: Cardinal);
  protected
    InMove: Boolean;
    FFillBk: Boolean;
    procedure Paint; override;
    procedure DoTimer(Sender: TObject); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Add(const AStr: string);
    procedure Clear;
    procedure RepaintBk; 

    property InPainting: Boolean read GetPaintStatus;
  published
    property Items: TStrings read FItems write SetItems;
    property Margin: Cardinal read FMargin write SetMargin default 0;
    property MaxRowCount: Integer read FMaxRowCount write SetMaxRowCount
      default 10;
    property MoveInterval: Integer read FMoveInterval write SetMoveInterval
      default 3;
    property RowInterval: Integer read FRowInterval write SetRowInterval
      default 0;
  end;

implementation

uses Graphics;

procedure TflListView.Add(const AStr: string);
begin
  if FItems.Count = FMaxRowCount then begin
    MoveCanvas;
    FItems.Clear;
  end;
  FItems.Add(AStr);
  StartDelayDraw;
  Invalidate;
end;

procedure TflListView.Clear;
begin
  FItems.Clear;
  FFillBk := True;
  Invalidate;
end;

procedure TflListView.CMTextChanged(var M: TMessage);
begin
  inherited;

  FTimer.Enabled := False;
end;

constructor TflListView.Create(AOwner: TComponent);
begin
  inherited;

  Color := clBlack;
  Width := 300;
  Height := 300;
  FItems := TStringList.Create;
  FMaxRowCount := 10;
  FMoveInterval := 3;
end;

destructor TflListView.Destroy;
begin
  FItems.Free;

  inherited;
end;

procedure TflListView.DoTimer(Sender: TObject);
var
  S: string;
begin
  S := FItems[FItems.Count - 1];
  if FTmpIndex = Length(S) then begin
    FTimer.Enabled := False;
    Exit;
  end;
  Inc(FTmpIndex);
  FTmpCaption := FTmpCaption + S[FTmpIndex];
  Invalidate;
end;

function TflListView.GetPaintStatus: Boolean;
begin
  Result := FTimer.Enabled;
end;

procedure TflListView.MoveCanvas;
var
  R: TRect;
begin
  with Canvas do begin
    InMove := True;
    Invalidate;
  end;
end;

procedure TflListView.Paint;
var
  i, j, X, W, Y: Integer;
  S: string;
  Bmp: TBitmap;
  NeedTrunc: Boolean;
  R, R1: TRect;
begin
  if InMove then begin
    //R.Top := 0; R.Bottom := 50; R.Right := 50; R.Left := 0;
    R := ClientRect; R.Bottom := FMargin + MaxRowCount * 11 + FRowInterval * (MaxRowCount - 1);
    R1 := R;
    R.Top := R.Top - 1;
    R.Bottom := R.Bottom - 1;
    //Canvas.CopyMode := cmPatPaint;
    for i := 1 to R.Bottom do begin
      Sleep(FMoveInterval);
      Canvas.CopyRect(R, Self.Canvas, R1);
    end;
    InMove := False;
  end;
  Bmp := TBitmap.Create;
  Bmp.Transparent := True;
  with Canvas do begin
    Brush.Color := Self.Color;
    //ClipRect

    //if not FTimer.Enabled or (FTmpIndex = 1) or (FSmartTruncate and NeedTrunc) then
    if not FTimer.Enabled or FFillBk then begin
      FillRect(ClientRect);
      FFillBk := False;
    end;

    Y := FMargin;
    if not Assigned(ImageList) then Exit;
    for j := 0 to FItems.Count - 1 do begin
      if FTimer.Enabled and (j = FItems.Count - 1)
        then S := FTmpCaption
        else S := FItems[j];
      W := CalcTextWidth(S);
      NeedTrunc := W > Self.Width;
      if SmartTruncate and NeedTrunc then begin
        S := GetHoldString(S, Self.Width - CalcTextWidth('...')) + '...';
      end;

      X := FMargin;
      if (FTimer.Enabled and ((j = FItems.Count - 1)) or (Length(FTmpCaption) = 1)) or not FTimer.Enabled then begin
        for i := 1 to Length(S) do begin
          Bmp.Width := 0;
          Bmp.Height := 0;
          ImageList.GetBitmap(Imgs[S[i]], Bmp);
          Draw(X, Y, Bmp);
          Inc(X, StrToInt(ImageList.Widths[Imgs[S[i]]]));
          //FImageList.Draw(Canvas, FImageList.Width*i, 0, Imgs[S[i]]);
        end;
      end;
      Inc(Y, 11 + FRowInterval);
    end;
  end;
  Bmp.Free;
end;

procedure TflListView.RepaintBk;
begin
  FFillBk := True;
  Invalidate;
end;

procedure TflListView.SetItems(const Value: TStrings);
begin
  FItems.Assign(Value);
end;

procedure TflListView.SetMargin(const Value: Cardinal);
begin
  FMargin := Value;
  Invalidate;
end;

procedure TflListView.SetMaxRowCount(const Value: Integer);
begin
  FMaxRowCount := Value;
end;

procedure TflListView.SetMoveInterval(const Value: Integer);
begin
  FMoveInterval := Value;
end;

procedure TflListView.SetRowInterval(const Value: Integer);
begin
  FRowInterval := Value;
  Invalidate;
end;

end.
