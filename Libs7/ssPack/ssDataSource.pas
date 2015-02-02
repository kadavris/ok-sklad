unit ssDataSource;

interface

uses Classes, DB, ExtCtrls;

type
  TssDataSource = class(TDataSource)
  private
    FField: TField;
    FOnDelDataChange: TDataChangeEvent;
    FTimer: TTimer;

    function GetDelay: integer;
    procedure SetDelay(Value: integer);

    procedure StartTimer(Sender: TObject; Field: TField);
    procedure DoTimer(Sender: TObject);

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  published
    property AutoEdit;
    property DataSet;
    property Enabled;
    property OnStateChange;
    property OnUpdateData;
    property OnDataChange: TDataChangeEvent read FOnDelDataChange;

    property ChangeDelay: integer read GetDelay write SetDelay;
    property OnDelayedDataChange: TDataChangeEvent read FOnDelDataChange write FOnDelDataChange;
  end;

//================================================================================
implementation

constructor TssDataSource.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  inherited OnDataChange:=StartTimer;

  FField := Nil;
  FOnDelDataChange := Nil;

  FTimer := TTimer.Create(Self);
  FTimer.Enabled := false;
  FTimer.OnTimer := DoTimer;
end;

//================================================================================
destructor TssDataSource.Destroy;
begin
  FTimer.Free;
  inherited Destroy;
end;

//================================================================================
procedure TssDataSource.SetDelay(Value : integer);
  var
    AState : boolean;
begin
  with FTimer do begin
    AState := Enabled;

    Enabled := false;
    Interval := Value;

    Enabled := AState;
  end;
end;

//================================================================================
function TssDataSource.GetDelay: integer;
begin
  Result := FTimer.Interval;
end;

//================================================================================
procedure TssDataSource.StartTimer(Sender : TObject; Field : TField);
begin
  FField := Field;

  if (FTimer.Interval <> 0) and Assigned(FOnDelDataChange)
    then begin 
      FTimer.Enabled := false; 
      FTimer.Enabled := true;
    end
    else DoTimer(Sender);
end;

//================================================================================
procedure TssDataSource.DoTimer(Sender : TObject);
begin
  FTimer.Enabled := false;

  if Assigned(FOnDelDataChange) then FOnDelDataChange(Sender, FField);
end;


end.
