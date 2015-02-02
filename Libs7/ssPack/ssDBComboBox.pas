unit ssDBComboBox;

interface

uses
  SysUtils, Classes, Controls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxDBLookupComboBox, ssMemDS, DB;

type
  TssDBComboBox = class(TcxDBLookupComboBox)
  private
   FmdData: TssMemoryData;
   FsrcData: TDataSource;
   FLoading: boolean;
   FDefFieldName: string;
   procedure ReloadData;
   procedure SetDefFieldName(const Value: string);
  protected
   procedure PropertiesChanged(Sender: TObject); override;
  public
   property DataBinding;
   constructor Create(AOwner: TComponent); override;
   destructor Destroy; override;
  published
   property DefFieldName: string read FDefFieldName write SetDefFieldName;
  end;

implementation

{ TssDBComboBox }

constructor TssDBComboBox.Create(AOwner: TComponent);
begin
  inherited;

  FmdData:=TssMemoryData.Create(nil);
  FsrcData:=TDataSource.Create(nil);
  FsrcData.DataSet:=FmdData;
end;

destructor TssDBComboBox.Destroy;
begin
  FmdData.Free;
  FsrcData.Free;

  inherited;
end;

procedure TssDBComboBox.PropertiesChanged(Sender: TObject);
begin
  ReloadData;
  inherited;
end;

procedure TssDBComboBox.ReloadData;
var DS: TDataSet;
    i: integer;
begin
   if not FLoading and not (csDesigning in ComponentState) then
    try
     FLoading:=True;
     DS:=nil;
     if (Self.Properties.ListSource<>nil) then DS:=Self.Properties.ListSource.DataSet;
     with FmdData do begin
      Close;
      if Assigned(DS) then begin
       CopyStructure(DS);
       Open;
       if DS.Active then begin
        for i:=0 to Fields.Count-1 do Fields[i].ReadOnly:=False;
        LoadFromDataSet(DS, DS.RecordCount, lmAppend);
       end;
       DataBinding.DataSource:=FsrcData;
       DataBinding.DataField:=Properties.KeyFieldNames;
       try
        if DefFieldName<>'' then Self.Properties.ListSource.DataSet.Locate(DefFieldName, 1, []);
       except
       end;
      end;
     end;
    finally
     FLoading:=False;
    end;
end;

procedure TssDBComboBox.SetDefFieldName(const Value: string);
begin
  FDefFieldName := Value;

  try
   if not (csDesigning in ComponentState)
     then Properties.ListSource.DataSet.Locate(Value, 1, []);
  except
  end;
end;

end.
