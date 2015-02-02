unit xStyleContainer;

interface

uses
  SysUtils, Classes, Controls, xGradient;

type
  TxStyleContainer = class(TComponent)
  private
    FList: TList;
    FGradient: TxGradient;
    procedure SetGradient(const Value: TxGradient);
    procedure SetStyle;
    procedure GrChange(Sender: TObject);
    procedure NotifyCtrls;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure RegControl(AControl: TControl);
    procedure UnregControl(AControl: TControl);
  published
    property Gradient: TxGradient read FGradient write SetGradient;
  end;

implementation

uses xButton;

constructor TxStyleContainer.Create(AOwner: TComponent);
begin
  inherited;

  FGradient := TxGradient.Create(nil);
  FGradient.OnChange := GrChange;
  FList := TList.Create;

end;

destructor TxStyleContainer.Destroy;
begin
  try
    NotifyCtrls;
    FList.Clear;
    FList.Free;
    FGradient.Free;
  except
  end;
  
  inherited;
end;

procedure TxStyleContainer.GrChange(Sender: TObject);
begin
  SetStyle;
end;

procedure TxStyleContainer.NotifyCtrls;
var
  i: Integer;
begin
  try
    for i := 0 to FList.Count - 1 do
      with TxButton(FList[i]) do
        ContainerDeleted;
  except
  end;      
end;

procedure TxStyleContainer.RegControl(AControl: TControl);
begin
  if FList.IndexOf(AControl) = -1
    then FList.Add(AControl);
end;

procedure TxStyleContainer.SetGradient(const Value: TxGradient);
begin
  FGradient := Value;
end;

procedure TxStyleContainer.SetStyle;
var
  i: Integer;
begin
  try
    for i := 0 to FList.Count - 1 do
      with TxButton(FList[i]) do
        Gradient.Assign(Self.Gradient);
  except
  end;
end;

procedure TxStyleContainer.UnregControl(AControl: TControl);
begin
  if FList.IndexOf(AControl) <> -1
    then FList.Delete(FList.IndexOf(AControl));
end;

end.
 