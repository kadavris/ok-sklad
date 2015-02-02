unit xPlayer;

interface

uses
  SysUtils, Types, Classes, Controls, ShockwaveFlashObjects_TLB;

type
  TxPlayer = class(TCustomControl)
  private
    FFlash: TShockwaveFlash;
    procedure RecalcFlashPos;
    procedure MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
  protected
    function DoMouseWheel(Shift: TShiftState; WheelDelta: Integer;
      MousePos: TPoint): Boolean; override;
  public
    procedure Resize; override;
    procedure Paint; override;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    { Published declarations }
  end;

implementation

uses Graphics;

{ TxPlayer }

const
  DefHeight = 300;
  DefWidth = 300;

  DefFlashWidth = 200;
  DefFlashHeight = 200;

constructor TxPlayer.Create(AOwner: TComponent);
begin
  inherited;

  Height := DefHeight;
  Width := DefWidth;
//  OnMouseWheel := MouseWheel;

  FFlash := TShockwaveFlash.Create(Self);
  with FFlash do begin
    Width := DefFlashWidth;
    Height := DefFlashHeight;
    BackgroundColor := 0;
    RecalcFlashPos;
    FFlash.Parent := Self;
  end;
end;

destructor TxPlayer.Destroy;
begin
  try
    FFlash.Free;
  except
  end;

  inherited;
end;

function TxPlayer.DoMouseWheel(Shift: TShiftState; WheelDelta: Integer;
  MousePos: TPoint): Boolean;
begin
  FFlash.Width := FFlash.Width + Trunc(WheelDelta/Abs(WheelDelta));
  FFlash.Height := FFlash.Height + Trunc(WheelDelta/Abs(WheelDelta));
  RecalcFlashPos;
  Result := inherited DoMouseWheel(Shift, WheelDelta, MousePos)
end;

procedure TxPlayer.MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
end;

procedure TxPlayer.Paint;
begin
  with Canvas do begin
    Pen.Color := clBlack;
    Rectangle(Self.ClientRect);
  end;
end;

procedure TxPlayer.RecalcFlashPos;
begin
  with FFlash do begin
    Left := (Self.Width - Width) div 2;
    Top := (Self.Height - Height) div 2;
  end;
end;

procedure TxPlayer.Resize;
begin
  RecalcFlashPos;

  inherited;
end;

end.
