unit flImageList;

interface

uses
  SysUtils, Classes, ImgList, Controls;

type
  TflImageList = class(TImageList)
  private
    FWidths: TStrings;
    procedure SetWidths(const Value: TStrings);
    { Private declarations }
  protected
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Widths: TStrings read FWidths write SetWidths;
  end;

implementation

{ TflImageList }

constructor TflImageList.Create(AOwner: TComponent);
begin
  inherited;

  FWidths := TStringList.Create;
end;

destructor TflImageList.Destroy;
begin
  FWidths.Free;

  inherited;
end;

procedure TflImageList.SetWidths(const Value: TStrings);
begin
  FWidths.Assign(Value);
end;

end.
