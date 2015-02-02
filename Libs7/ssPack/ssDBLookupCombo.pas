unit ssDBLookupCombo;

interface

uses
  SysUtils, Classes, Controls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, DB, Dialogs, Windows, Messages;

type
  TssDBLookupCombo = class;

  TssDBlcbLink = class(TDataLink)
  private
    FControl: TssDBLookupCombo;
  protected
    procedure ActiveChanged; override;
  end;

  TssDBLookupCombo = class(TcxComboBox)
  private
    FDataLink: TssDBlcbLink;
    FLoading: Boolean;
    FDefFieldName: string;
    FListField: string;
    FKeyField: string;
    FEmptyValue: Integer;
    FDisplayEmpty: string;
    FKeyValue: Integer;
    procedure SetDefFieldName(const Value: string);
    function GetListSource: TDataSource;
    procedure SetListSource(const Value: TDataSource);
    procedure SetListField(const Value: string);
    procedure SetKeyField(const Value: string);
    procedure SetEmptyValue(const Value: Integer);
    procedure SetDisplayEmpty(const Value: string);
    procedure SetKeyValue(const Value: Integer);

  protected
    procedure PropertiesChanged(Sender: TObject); override;
    procedure SetEditValue(const Value: TcxEditValue); override;
    procedure DoEditKeyPress(var Key: Char); override;
    procedure DoEditKeyDown(var Key: Word; Shift: TShiftState); override;
    function SetDisplayText(const Value: TCaption): Boolean; override;
    procedure InternalSetEditValue(const Value: TcxEditValue; AValidateEditValue: Boolean); override;
    function InternalSetText(const Value: TCaption): Boolean; override;

  public
    procedure ReloadData;
    constructor Create(AOwner: TComponent); override;
    procedure Loaded; override;
    destructor Destroy; override;
    property KeyValue: integer read FKeyValue write SetKeyValue;

  published
    property DefFieldName: string read FDefFieldName write SetDefFieldName;
    property DisplayEmpty: string read FDisplayEmpty write SetDisplayEmpty;
    property EmptyValue: integer read FEmptyValue write SetEmptyValue;
    property KeyField: string read FKeyField write SetKeyField;
    property ListField: string read FListField write SetListField;
    property ListSource: TDataSource read GetListSource write SetListSource;
  end;

implementation

{ TssDBComboBox }
//==============================================================================================
constructor TssDBLookupCombo.Create(AOwner: TComponent);
begin
  inherited;

  FDataLink := TssDBlcbLink.Create;
  FDataLink.FControl := Self;
end;

//==============================================================================================
destructor TssDBLookupCombo.Destroy;
begin
  FDataLink.Free;

  inherited;
end;

//==============================================================================================
function TssDBLookupCombo.GetListSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

//==============================================================================================
procedure TssDBLookupCombo.PropertiesChanged(Sender: TObject);
begin
//  ReloadData;
  inherited;
end;

//==============================================================================================
procedure TssDBLookupCombo.ReloadData;
var
  DS: TDataSet;
  BM: TBookmark;
  FList: TStringList;
  FOldText: string;
  FLocate: Boolean;
begin
  if not FLoading then
  try
    FLoading := True;
    DS := nil;
    if ListSource <> nil then DS := FDataLink.DataSet;
    if DS = nil then Exit;
    if DS.Active then begin
      FLocate := Properties.Items.Count = 0;
      FOldText := EditText;
      Properties.Items.Clear;
      if DS.FindField(FKeyField) = nil then Exit;
      if DS.FindField(FListField) = nil then Exit;
      FList := TStringList.Create;
      BM := DS.GetBookmark;
      try
        if FDisplayEmpty <> ''
          then FList.AddObject(FDisplayEmpty, TObject(Pointer(FEmptyValue)));
        DS.First;
        while not DS.Eof do begin
          if Trim(DS.fieldbyname(FListField).AsString) <> EmptyStr
            then FList.AddObject(DS.fieldbyname(FListField).AsString,
              TObject(Pointer(DS.fieldbyname(FKeyField).AsInteger)));
          DS.Next;
        end;
        Properties.Items.Assign(FList);
        if FLocate
          then if Properties.Items.Count > 0 then ItemIndex := 0 else
          else Text := FOldText;
      finally
        DS.GotoBookmark(BM);
        DS.FreeBookmark(BM);
        FList.Free;
      end;
    end;
  finally
    FLoading := False;
  end;
end;

//==============================================================================================
procedure TssDBLookupCombo.SetDefFieldName(const Value: string);
begin
{  FDefFieldName := Value;

  try
   Properties.ListSource.DataSet.Locate(Value, 1, []);
  except
  end;}
end;

//==============================================================================================
procedure TssDBLookupCombo.SetDisplayEmpty(const Value: string);
begin
  if FDisplayEmpty <> Value then begin
    FDisplayEmpty := Value;
    if Properties.Items.Count > 0 then begin
      if Value = ''
        then Properties.Items.Delete(0)
        else Properties.Items.Strings[0] := Value;
    end;
  end;
end;

//==============================================================================================
function TssDBLookupCombo.SetDisplayText(const Value: TCaption): Boolean;
begin
  Result := True;
  if (Value = '') and (FDisplayEmpty <> '')
    then ItemIndex := 0
    else Result := inherited SetDisplayText(Value);
end;

//==============================================================================================
procedure TssDBLookupCombo.SetEditValue(const Value: TcxEditValue);
  var
   i: integer;
begin
  if (Value = '') and (FDisplayEmpty <> '') then begin
    ItemIndex := 0;
    FKeyValue := FEmptyValue;
  end
  else begin
    i := Properties.Items.IndexOf(Value);
    if FDataLink.DataSource = nil then Exit;
    FKeyValue := Integer(Properties.Items.Objects[i]);
    if not ListSource.DataSet.Active
      then ListSource.DataSet.Open;
    FDataLink.DataSet.Locate(FKeyField, FKeyValue, []);
  end;
  inherited;
end;

//==============================================================================================
procedure TssDBLookupCombo.SetEmptyValue(const Value: integer);
begin
  if FEmptyValue <> Value then begin
    FEmptyValue := Value;
    if (FDisplayEmpty <> '') and (Properties.Items.Count > 0)
      then Properties.Items.Objects[0] := TObject(Pointer(Value));
  end;
end;

//==============================================================================================
procedure TssDBLookupCombo.SetKeyField(const Value: string);
begin
  if FKeyField <> Value then begin
    FKeyField := Value;
    ReloadData;
  end;
end;

//==============================================================================================
procedure TssDBLookupCombo.SetListField(const Value: string);
begin
  if FListField <> Value then begin
    FListField := Value;
    ReloadData;
  end;
end;

//==============================================================================================
procedure TssDBLookupCombo.SetListSource(const Value: TDataSource);
begin
  if FDataLink.DataSource <> Value then begin
    FDataLink.DataSource := Value;
    if Value <> nil then Value.FreeNotification(Self);
    ReloadData;
  end;
end;

{ TssDBlcbLink }

//==============================================================================================
procedure TssDBlcbLink.ActiveChanged;
begin
  FControl.ReloadData;
end;

//==============================================================================================
procedure TssDBLookupCombo.SetKeyValue(const Value: integer);
var
  i: Integer;
begin
  if Value <> FKeyValue then begin
    i := Properties.Items.IndexOfObject(Pointer(Value));
    if i = -1 then begin
      if FDisplayEmpty = EmptyStr then Self.Clear;
      if FDisplayEmpty <> '' then Self.ItemIndex := 0;
      FKeyValue := FEmptyValue;
      Exit;
    end;
    ItemIndex := i;
    FDataLink.DataSet.Locate(FKeyField, Value, []);
    FKeyValue := Value;
  end;
end;

//==============================================================================================
procedure TssDBLookupCombo.InternalSetEditValue(const Value: TcxEditValue;
  AValidateEditValue: Boolean);
begin
  inherited;
end;

//==============================================================================================
procedure TssDBLookupCombo.Loaded;
begin
  inherited;

  if FDisplayEmpty <> EmptyStr then begin
    Properties.Items.AddObject(FDisplayEmpty, TObject(Pointer(FEmptyValue)));
    FKeyValue := FEmptyValue;
    Text := Properties.Items[0];
  end;  
end;

//==============================================================================================
procedure TssDBLookupCombo.DoEditKeyPress(var Key: Char);
begin
//  if (Key = #27) and DroppedDown then DroppedDown := False
//    else
  inherited;
  if ItemIndex >= 0
    then FKeyValue := Integer(Properties.Items.Objects[ItemIndex]);
end;

//==============================================================================================
procedure TssDBLookupCombo.DoEditKeyDown(var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_DOWN) and Assigned(ListSource) and not ListSource.DataSet.Active
    then ListSource.DataSet.Open;
  inherited;
end;

//==============================================================================================
function TssDBLookupCombo.InternalSetText(const Value: TCaption): Boolean;
begin
  Result := inherited InternalSetText(Value);
end;

end.
