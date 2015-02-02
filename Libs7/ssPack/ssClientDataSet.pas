unit ssClientDataSet;

interface

uses
  Windows, Messages, SysUtils, Classes, DB,
  {$IFNDEF NODESIGN}DesignEditors, DSDesign,{$ENDIF}
  DBClient;

type
  TssClientDataSet = class(TClientDataSet)
  private
    FMacros: TParams;
    procedure SetMacros(const Value: TParams);

  protected
    procedure OpenCursor(InfoQuery: Boolean); override;

  public
    procedure FetchMacros;
    procedure SendMacros;
    procedure Execute; override;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  published
    property Macros: TParams read FMacros write SetMacros;
  end;

  {$IFNDEF NODESIGN}
  TssCDSEditor = class(TComponentEditor)
  public
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: integer; override;
    procedure ExecuteVerb(Index: Integer); override;
  end;
  {$ENDIF}

implementation

uses Variants;

{ TssClientDataSet }
//==============================================================================================
constructor TssClientDataSet.Create(AOwner: TComponent);
begin
  inherited;
  FMacros := TParams.Create(Self);
end;

//==============================================================================================
destructor TssClientDataSet.Destroy;
begin
  FreeAndNil(FMacros);

  inherited;
end;

//==============================================================================================
procedure TssClientDataSet.Execute;
begin
  if FMacros.Count > 0 then SendMacros;

  inherited;
end;

//==============================================================================================
procedure TssClientDataSet.FetchMacros;
  var
   OwnerData, FData: OleVariant;
   S: Variant;
begin
  OwnerData := NULL;
  //FData := IssSrvDisp(AppServer).AS_GetMacros(ProviderName, OwnerData);
  S := AppServer;
  FData := S.AS_GetMacros(ProviderName, OwnerData);
  UnpackParams(FData, FMacros);
end;

//==============================================================================================
procedure TssClientDataSet.OpenCursor(InfoQuery: Boolean);
begin
  if FMacros.Count>0 then SendMacros;

  inherited;
end;

//==============================================================================================
procedure TssClientDataSet.SendMacros;
  var
    FData: OleVariant;
    S: Variant;
begin
  FData := PackageParams(FMacros);
  //IssSrvDisp(AppServer).AS_SetMacros(ProviderName, FData);
  S := AppServer;
  S.AS_SetMacros(ProviderName, FData);
end;

//==============================================================================================
procedure TssClientDataSet.SetMacros(const Value: TParams);
begin
  FMacros.Assign(Value);
end;

{ TssCDSEditor }

{$IFNDEF NODESIGN}
//==============================================================================================
procedure TssCDSEditor.ExecuteVerb(Index: Integer);
begin
  case Index of
    //0: ShowFieldsEditor(Designer, TDataSet(Component), TDSDesigner);
    1: TssClientDataSet(Component).FetchParams;
    2: TssClientDataSet(Component).FetchMacros;
  end;
end;

//==============================================================================================
function TssCDSEditor.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := 'Fields Editor...';
    1: Result := 'Fetch Params';
    2: Result := 'Fetch Macros';
  end;
end;

//==============================================================================================
function TssCDSEditor.GetVerbCount: integer;
begin
  Result := 3;
end;

{$ENDIF}

end.
