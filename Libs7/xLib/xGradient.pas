unit xGradient;

interface

uses Classes, Graphics, Controls, xGraphUtils;

type
  TxGraphicControl = class(TGraphicControl)
  public
    property Canvas;
  end;

  TxCustomControl = class(TCustomControl)
  public
    property Canvas;
  end;

  TxGradient = class(TPersistent)
  private
    FDirection: TGradientDirection;
    FColorEnd: TColor;
    FControl: TControl;
    FEnabled: boolean;
    FHalfEffect: boolean;
    FHalfColorPercent: integer;
    FOnChange: TNotifyEvent;
    procedure SetDirection(const Value: TGradientDirection);
    procedure SetColorBegin(const Value: TColor);
    procedure SetColorEnd(const Value: TColor);
    procedure SetEnabled(const Value: boolean);
    procedure SetHalfEffect(const Value: boolean);
    procedure SetHalfColorPercent(const Value: integer);
  public
    FColorBegin: TColor;
    constructor Create(AControl: TControl); reintroduce; overload;
    function GradientFill: boolean;
    procedure Assign(Source: TPersistent); override;
  published
    property ColorBegin: TColor read FColorBegin write SetColorBegin
      default clBtnFace;
    property ColorEnd: TColor read FColorEnd write SetColorEnd
      default clBtnFace;
    property Direction: TGradientDirection read FDirection write SetDirection
      default gdHorizontal;
    property Enabled: boolean read FEnabled write SetEnabled default False;
    property HalfEffect: boolean read FHalfEffect write SetHalfEffect default False;
    property HalfColorPercent: integer read FHalfColorPercent write SetHalfColorPercent default 0;

    property OnChange: TNotifyEvent read FOnChange write FOnChange;
  end;

implementation

uses Types;

procedure TxGradient.Assign(Source: TPersistent);
begin
  if (Source = nil) or not (Source is TxGradient) then Exit;
  with Source as TxGradient do begin
    Self.FDirection := Direction;
    Self.FColorBegin := ColorBegin;
    Self.FColorEnd := ColorEnd;
    Self.FEnabled := Enabled;
    Self.FHalfEffect := HalfEffect;
    Self.FHalfColorPercent := HalfColorPercent;
  end;
  if FControl <> nil then FControl.Invalidate;
end;

constructor TxGradient.Create(AControl: TControl);
begin
  inherited Create;

  FControl := AControl;

  FColorBegin := clBtnFace;
  FColorEnd := clBtnFace;
end;

function TxGradient.GradientFill: boolean;
var
   R1, R2, RF: TRect;
   Fixed: integer;
   FCanvas: TCanvas;
begin
  Result := False;
  if FControl = nil then Exit;
  R1:=FControl.ClientRect;
  R2:=R1;
  if FDirection=gdHorizontal then Fixed:=Trunc(FHalfColorPercent/100*FControl.Width)
   else Fixed:=Trunc(FHalfColorPercent/100*FControl.Height);
  if FHalfEffect then
   if FDirection=gdHorizontal then R1.Right:=(R1.Right-Fixed) div 2
    else R1.Bottom:=(R1.Bottom-Fixed) div 2;

  if FControl is TGraphicControl
    then FCanvas := TxGraphicControl(FControl).Canvas
    else FCanvas := TxCustomControl(FControl).Canvas;
  Result:=DrawGradient(FCanvas, R1, FColorBegin, FColorEnd, FDirection);
  if Fixed>0 then
   with FCanvas do begin
    Brush.Color:=FColorEnd;
     if FDirection=gdHorizontal then begin
      RF.Left:=R1.Right;
      RF.Top:=0;
      RF.Bottom:=R1.Bottom;
      RF.Right:=R1.Right+Fixed;
     end
     else begin
      RF.Left:=0;
      RF.Top:=R1.Bottom;
      RF.Bottom:=R1.Bottom+Fixed;
      RF.Right:=R1.Right;
     end;
    FillRect(RF);
   end;
  if FHalfEffect then begin
   if FDirection=gdHorizontal then R2.Left:=R1.Right+Fixed
    else R2.Top := R1.Bottom + Fixed;
   DrawGradient(FCanvas, R2, FColorEnd, FColorBegin, FDirection);
  end;
end;

procedure TxGradient.SetColorBegin(const Value: TColor);
begin
  FColorBegin := Value;
  if FControl <> nil then FControl.Invalidate;
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TxGradient.SetColorEnd(const Value: TColor);
begin
  FColorEnd := Value;
  if FControl <> nil then FControl.Invalidate;
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TxGradient.SetDirection(const Value: TGradientDirection);
begin
  FDirection := Value;
  if FControl <> nil then FControl.Invalidate;
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TxGradient.SetEnabled(const Value: boolean);
begin
  FEnabled := Value;
  if FControl <> nil then FControl.Invalidate;
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TxGradient.SetHalfColorPercent(const Value: integer);
begin
  if Value<0 then FHalfColorPercent:=0
   else if Value>100 then FHalfColorPercent:=100
    else FHalfColorPercent := Value;
  if FControl <> nil then FControl.Invalidate;
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TxGradient.SetHalfEffect(const Value: boolean);
begin
  FHalfEffect := Value;
  if FControl <> nil then FControl.Invalidate;
  if Assigned(FOnChange) then FOnChange(Self);
end;

end.
