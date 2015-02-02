//UDEBUG code already inserted. Please do not remove this line.
unit xIBQuery;

interface

uses
  {$IFDEF ZEOS}ZDataset, ZStoredProcedure,{$ENDIF}
  {$IFDEF IBO}IB_Components, IB_Query,{$ENDIF}
  {$IFDEF IBX}IBCustomDataSet, IBQuery,{$ENDIF}
  SysUtils, Classes, DB;

type
  TxIBQuery = class(
    {$IFDEF ZEOS}TZQuery{$ENDIF}
    {$IFDEF IBO}IB_Query{$ENDIF}
    {$IFDEF IBX}TIBQuery{$ENDIF}
  )
    private
      FMacroChar: Char;
      FMacros: TParams;

      procedure SetMacroChar(const Value: Char);
      procedure SetMacros(const Value: TParams);
      procedure CreateMacros(AList: TParams; const AStr: string);

      {$IFDEF IBX}
      FSQLStrings: TStringList;
      function GetSQLStrings: TStringList;
      procedure SetSQLStrings(const Value: TStringList);
      {$ENDIF}

      function GetSQLText: String;
      procedure SetSQLText(const Value: String);

    protected
      procedure QueryChanged(Sender: TObject);
      procedure PSExecute; override;
      procedure OpenCursor(InfoQuery: Boolean); override;

    public
      constructor Create(AOwner: TComponent); overload; override;

      destructor Destroy; override;
      procedure ExpandMacros;
      procedure Execute;{$IFDEF IBO}override;{$ENDIF}

    published
      property MacroChar: Char read FMacroChar write SetMacroChar;
      property Macros: TParams read FMacros write SetMacros;

      {$IFDEF IBX}
      property SQL: TStrings read GetSQL write SetSQL;
      {$ENDIF}

      property SQLText: String read GetSQLText write SetSQLText;
  end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  {$IFDEF UDEBUG}udebug,{$ENDIF}
  StrUtils, xStrUtils;

const
  DefMacroChar : Char = '%';

{$IFDEF UDEBUG}
var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';
{$ENDIF}

//==============================================================================================
constructor TxIBQuery.Create(AOwner: TComponent);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxIBQuery.Create') else _udebug := nil;{$ENDIF}

  inherited;
  self.

  FMacros := TParams.Create;//(Self, TParams);
  FMacroChar := DefMacroChar;
  {$IFDEF IBX}FSQL := TStringList.Create;{$ENDIF}
  //TStringList(SQL).OnChange := QueryChanged;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxIBQuery.CreateMacros(AList: TParams; const AStr: string);
  var
    i: integer;
    TempStr: String;
    AddMacro: boolean;
    CurChar: Char;
    FPar: TParam;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxIBQuery.CreateMacros') else _udebug := nil;{$ENDIF}

  TempStr := '';
  AddMacro := False;
  AList.Clear;

  for i := 1 to Length(AStr) do begin
    CurChar := AStr[i];

    if CurChar = FMacroChar
      then AddMacro := True
      else if (CurChar in [' ', ',', ')', ';', '=', #13, #10]) and (TempStr <> '') then begin
        FPar := TParam.Create(FMacros);
        FPar.Name := TempStr;
        FPar.DataType := ftString;
        TempStr := '';
        AddMacro := False;
      end
      else if AddMacro then TempStr := TempStr + CurChar;
  end;

  if TempStr <> '' then begin
    FPar := TParam.Create(FMacros);
    FPar.Name := TempStr;
    FPar.DataType := ftString;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
destructor TxIBQuery.Destroy;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxIBQuery.Destroy') else _udebug := nil;{$ENDIF}

  FMacros.Free;
  {$IFDEF IBX}FreeAndNil(FSQL);{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxIBQuery.Execute;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxIBQuery.Execute') else _udebug := nil;{$ENDIF}

  ExpandMacros;

  {$IFDEF ZEOS}ExecSQL;{$ENDIF}
  {$IFDEF IBO}inherited;{$ENDIF}
  {$IFDEF IBX}ExecSQL;{$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxIBQuery.ExpandMacros;
  var
    Res: string;
    i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxIBQuery.ExpandMacros') else _udebug := nil;{$ENDIF}

  Res := SQL.Text;

  for i := 0 to FMacros.Count-1 do begin
    Res := ReplaceStr(Res, FMacroChar + FMacros[i].Name, FMacros[i].AsString);
  end;

  inherited SQL.Text := Res;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
{$IFDEF IBX}
function TxIBQuery.GetSQLStrings: TStringList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxIBQuery.GetSQLStrings') else _udebug := nil;{$ENDIF}

  Result := FSQLStrings;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxIBQuery.SetSQLStrings(const Value: TStringList);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxIBQuery.SetSQLStrings') else _udebug := nil;{$ENDIF}

  FSQLstrings.Assign(Value);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;
{$ENDIF} // IBX section

//==============================================================================================
function TxIBQuery.GetSQLText: String;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxIBQuery.GetSQLText') else _udebug := nil;{$ENDIF}

  Result := SQL.Text;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxIBQuery.SetSQLText(const Value: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  if SQL.Text = Value then Exit;
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxIBQuery.SetSQLText') else _udebug := nil;{$ENDIF}

  SQL.Text := Value;
  QueryChanged(nil);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxIBQuery.OpenCursor(InfoQuery: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxIBQuery.OpenCursor') else _udebug := nil;{$ENDIF}

  ExpandMacros;
  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxIBQuery.PSExecute;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxIBQuery.PSExecute') else _udebug := nil;{$ENDIF}

  ExpandMacros;
  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxIBQuery.QueryChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxIBQuery.QueryChanged') else _udebug := nil;{$ENDIF}

  CreateMacros(FMacros, SQL.Text);
  //inherited SQL.Assign(SQL);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxIBQuery.SetMacroChar(const Value: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxIBQuery.SetMacroChar') else _udebug := nil;{$ENDIF}

  FMacroChar := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TxIBQuery.SetMacros(const Value: TParams);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TxIBQuery.SetMacros') else _udebug := nil;{$ENDIF}

  FMacros.Assign(Value);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('xIBQuery', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  {$IFDEF UDEBUG}
  //debugUnregisterUnit(DEBUG_unit_ID);
  {$ENDIF}

end.
