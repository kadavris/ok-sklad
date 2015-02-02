unit flLabel;

interface

uses
  SysUtils, Classes, Controls, StdCtrls, flImageList, Graphics, ExtCtrls,
  Messages;

type
  TflLabel = class(TLabel)
  private
    FImageList: TflImageList;
    FSmartTruncate: Boolean;
    FLetterDelay: Integer;
    FDelayDraw: Boolean;
    procedure SetImageList(const Value: TflImageList);
    procedure SetSmartTruncate(const Value: Boolean);
    procedure SetLetterDelay(const Value: Integer);
    procedure CMTextChanged(var M: TMessage); message CM_TEXTCHANGED;
    procedure SetDelayDraw(const Value: Boolean);
    { Private declarations }
  protected
    FTimer: TTimer;
    FTmpCaption: string;
    FTmpIndex: Integer;
    procedure Paint; override;
    function GetHoldString(const AText: string; AWidth: Integer): string;
    procedure DoTimer(Sender: TObject); virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function CalcTextWidth(const AText: string): Integer;
    procedure StartDelayDraw;
  published
    property DelayDraw: Boolean read FDelayDraw write SetDelayDraw
     default True;
    property ImageList: TflImageList read FImageList write SetImageList;
    property LetterDelay: Integer read FLetterDelay write SetLetterDelay
      default 100;
    property SmartTruncate: Boolean read FSmartTruncate write SetSmartTruncate
      default True;
  end;

Var
  Imgs: array[' '..'~'] of Integer =
   (88,62,63,64,65,66,93,82,67,68,69,70,71,72,73,74,61,52,53,54,55,
    56,57,58,59,60,75,76,77,78,79,80,81,26,27,28,29,30,31,32,33,
    34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,83,84,
    85,94,86,87, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,
    16,17,18,19,20,21,22,23,24,25,91,90,92,89);

implementation

{ TflLabel }

function TflLabel.CalcTextWidth(const AText: string): Integer;
var
  i: Integer;
begin
  Result := 0;
  for i := 1 to Length(AText) do
    Result := Result + StrToInt(ImageList.Widths[Imgs[AText[i]]]);
end;

procedure TflLabel.CMTextChanged(var M: TMessage);
begin
  inherited;

  if FDelayDraw then StartDelayDraw;
end;

constructor TflLabel.Create(AOwner: TComponent);
begin
  inherited;

  FTimer := TTimer.Create(nil);
  with FTimer do begin
    Interval := FLetterDelay;
    OnTimer := DoTimer;
    Enabled := False;
  end;

  AutoSize := False;
  FLetterDelay := 100;
  FSmartTruncate := True;
  FDelayDraw := True;
end;

destructor TflLabel.Destroy;
begin
  FTimer.Free;

  inherited;
end;

procedure TflLabel.DoTimer(Sender: TObject);
var
  S: string;
begin
  S := Caption;
  if FTmpIndex = Length(S) then begin
    FTimer.Enabled := False;
    Exit;
  end;
  Inc(FTmpIndex);
  FTmpCaption := FTmpCaption + S[FTmpIndex];
  Invalidate;
end;

function TflLabel.GetHoldString(const AText: string;
  AWidth: Integer): string;
var
  i, W: Integer;
begin
  Result := '';
  W := 0;
  for i := 1 to Length(AText) do begin
    if W + StrToInt(ImageList.Widths[Imgs[AText[i]]]) <= AWidth then begin
      Result := Result + AText[i];
      W := W + StrToInt(ImageList.Widths[Imgs[AText[i]]]);
    end
    else Break;
  end;
end;

procedure TflLabel.Paint;
var
  i, X, W: Integer;
  S: string;
  Bmp: TBitmap;
  NeedTrunc: Boolean;
begin
  if FTimer.Enabled
    then S := FTmpCaption
    else S := Caption;
  W := CalcTextWidth(S);
  NeedTrunc := W > Self.Width;
  if FSmartTruncate and NeedTrunc then begin
    S := GetHoldString(S, Self.Width - CalcTextWidth('...')) + '...';
  end;
  Bmp := TBitmap.Create;
  Bmp.Transparent := True;
  X := 0;
  with Canvas do begin
    Brush.Color := Self.Color;
    if not FTimer.Enabled or (FTmpIndex = 1) or (FSmartTruncate and NeedTrunc) then
      FillRect(ClientRect);
    for i := 1 to Length(S) do begin
      Bmp.Width := 0;
      Bmp.Height := 0;
      FImageList.GetBitmap(Imgs[S[i]], Bmp);
      Draw(X, 0, Bmp);
      Inc(X, StrToInt(FImageList.Widths[Imgs[S[i]]]));
//      FImageList.Draw(Canvas, FImageList.Width*i, 0, Imgs[S[i]]);
    end;
  end;
  Bmp.Free;
end;

procedure TflLabel.SetDelayDraw(const Value: Boolean);
begin
  FDelayDraw := Value;
end;

procedure TflLabel.SetImageList(const Value: TflImageList);
begin
  FImageList := Value;
end;

procedure TflLabel.SetLetterDelay(const Value: Integer);
begin
  FLetterDelay := Value;
  FTimer.Interval := Value;
end;

procedure TflLabel.SetSmartTruncate(const Value: Boolean);
begin
  FSmartTruncate := Value;
  Invalidate;
end;

procedure TflLabel.StartDelayDraw;
begin
  if not FDelayDraw then Exit;
  FTmpCaption := '';
  FTmpIndex := 0;
  FTimer.Enabled := True;
end;

end.
