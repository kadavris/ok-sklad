unit ssDBTreeView;

interface

uses
  SysUtils, Classes, Controls, cxControls, cxContainer, cxTreeView, DB, ComCtrls,
  DBGrids;

type
  TssDBTreeView = class;

  TssTreeViewDataLink = class(TDataLink)
  private
    FControl: TssDBTreeView;
  protected
    procedure ActiveChanged; override;
  end;

  TssDBTreeView = class(TcxTreeView)
  private
    FDataLink: TssTreeViewDataLink;
    FDisplayField: string;
    FParentField: string;
    FKeyField: string;
    FAllItems: string;
    procedure SetDataSource(Value: TDataSource);
    procedure SetDisplayField(const Value: string);
    procedure SetKeyField(const Value: string);
    procedure SetParentField(const Value: string);
    function GetDataSource: TDataSource;
    procedure SetAllItems(const Value: string);
    function InternalLocate(ANode: TTreeNode; const AValue: integer): boolean;

  protected
    procedure RefreshTree; virtual;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Locate(const AValue: integer): boolean;
    function GetNode(const AValue: integer): TTreeNode;

  published
    property ParentField: string read FParentField write SetParentField;
    property DisplayField: string read FDisplayField write SetDisplayField;
    property KeyField: string read FKeyField write SetKeyField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property AllItems: string read FAllItems write SetAllItems;
  end;

implementation

constructor TssDBTreeView.Create(AOwner: TComponent);
begin
  inherited;

  FDataLink:=TssTreeViewDataLink.Create;
  FDataLink.FControl:=Self;
end;

destructor TssDBTreeView.Destroy;
begin
  FDataLink.Free;

  inherited;
end;

function TssDBTreeView.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

function TssDBTreeView.GetNode(const AValue: integer): TTreeNode;
  var
    i: integer;
begin
     Result:=nil;
     for i:=0 to Items.Count-1 do
      if Integer(Items[i].Data)=AValue then begin
       Result:=Items[i];
      end;
end;

function TssDBTreeView.InternalLocate(ANode: TTreeNode; const AValue: integer): boolean;
  var
    i: integer;
    FExp: boolean;
begin
  Result:=False;
  if Integer(ANode.Data)=AValue then begin
    Selected:=ANode;
    Result:=True;
    Exit;
  end;

  FExp:=ANode.Expanded;
  ANode.Expand(False);

  for i:=0 to ANode.Count-1 do
    if InternalLocate(ANode.Item[i], AValue) then begin
      Result:=True;
      Exit;
    end;
  if not FExp then ANode.Collapse(False);
end;

function TssDBTreeView.Locate(const AValue: integer): boolean;
  var
    i: integer;
begin
     Result:=False;
     for i:=0 to Items.Count-1 do begin
      if InternalLocate(Items[i], AValue) then begin
       Result:=True;
       Exit;
      end;
     end;
end;

procedure TssDBTreeView.RefreshTree;
  var
    FNode: TTreeNode;

  procedure SetChildren(ANode: TTreeNode; AID: integer);
    var
      BM: TBookmark;
      FNode: TTreeNode;
  begin
    with FDataLink.DataSet do begin
      BM:=GetBookmark;
      try
        First;
        while not Eof do begin
          if (fieldbyname(FParentField).AsInteger=AID) and (fieldbyname(FKeyField).AsInteger<>AID) then begin
            FNode:=Self.Items.AddChild(ANode, fieldbyname(FDisplayField).AsString);
            FNode.Data:=pointer(fieldbyname(FKeyField).AsInteger);
            SetChildren(FNode, fieldbyname(FKeyField).AsInteger);
            if AutoExpand then FNode.Expand(False);
          end;
          Next;
        end;
        GotoBookmark(BM);

      finally
        FreeBookmark(BM);
      end;
    end;
  end;

begin
  if FDataLink.DataSet=nil then Exit;

  with FDataLink.DataSet do begin
    Self.Items.Clear;
    if not Active then Exit;

    if FAllItems<>'' then begin
      FNode:=Self.Items.Add(nil, FAllItems);
      FNode.Data:=Pointer(-1);
    end;

    while not Eof do begin
      if fieldbyname(FParentField).AsInteger=fieldbyname(FKeyField).AsInteger then begin
        FNode:=Self.Items.Add(nil, fieldbyname(FDisplayField).AsString);
        FNode.Data:=pointer(fieldbyname(FKeyField).AsInteger);
        SetChildren(FNode, fieldbyname(FKeyField).AsInteger);
        if AutoExpand then FNode.Expand(False);
      end;
      Next;
    end;
 
    if Self.Items.Count>0 then Self.Selected:=Self.Items[0];
  end;
end;

procedure TssDBTreeView.SetAllItems(const Value: string);
  var
    FNode: TTreeNode;
begin
  if FDataLink.DataSource=nil then Exit;

  if FAllItems<>Value then begin
    FAllItems:=Value;
    FNode:=GetNode(-1);
    if FNode=nil then begin
      FNode:=Items.AddFirst(nil, FAllItems);
      FNode.Data:=pointer(-1);
    end
    else begin
      if Trim(Value)='' 
        then Items.Delete(FNode)
        else FNode.Text:=Value; 
    end;
  end;
end;

procedure TssDBTreeView.SetDataSource(Value: TDataSource);
begin
  if FDataLink.DataSource<>Value then begin
    FDataLink.DataSource := Value;
    if Value <> nil then Value.FreeNotification(Self);
    RefreshTree;
  end;
end;

procedure TssDBTreeView.SetDisplayField(const Value: string);
begin
  if FDisplayField<>Value then begin
    FDisplayField := Value;
    RefreshTree;
  end;
end;

procedure TssDBTreeView.SetKeyField(const Value: string);
begin
  if FKeyField<>Value then begin
    FKeyField := Value;
    RefreshTree;
  end;
end;

procedure TssDBTreeView.SetParentField(const Value: string);
begin
  if FParentField<>Value then begin
    FParentField := Value;
    RefreshTree;
  end;
end;

{ TssTreeViewDataLink }

procedure TssTreeViewDataLink.ActiveChanged;
begin
  FControl.RefreshTree;
end;

end.
