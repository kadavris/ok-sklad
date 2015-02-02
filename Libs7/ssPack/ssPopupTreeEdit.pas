unit ssPopupTreeEdit;

interface

uses
  SysUtils, Classes, Controls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxTL, cxDBTL, DB, ImgList, dialogs, cxLookAndFeels,
  Messages;

type
  TssLocateOptions = set of (loPartialKey, loCaseInsensitive);
  TssPopupTreeEdit = class(TcxPopupEdit)
  private
    FTree: TcxDBTreeList;
    FParentField: string;
    FKeyField: string;
    FDisplayField: string;
    FValue: integer;
    FShowExpandedTree: boolean;
    FOnGetNodeImageIndex: TcxTreeListGetNodeImageIndexEvent;
    FAllowEmpty: Boolean;

    function GetListSource: TDataSource;
    procedure SetListSource(const Value: TDataSource);
    procedure SetKeyField(const Value: string);
    procedure SetParentField(const Value: string);
    procedure SetDisplayField(const Value: string);
    procedure SetValue(const Value: integer);
    procedure TreeDblClick(Sender: TObject);
    procedure TreeKeyPress(Sender: TObject; var Key: Char);
    procedure TreeGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType;var AIndex: TImageIndex);
    function GetImages: TCustomImageList;
    procedure SetImages(const Value: TCustomImageList);
    procedure RefreshLookupItems;
    procedure SetAllowEmpty(const Value: Boolean);

  protected
    procedure DoInitPopup; override;
    procedure DoEditKeyPress(var Key: Char); override;
    procedure DoEditKeyUp(var Key: Word; Shift: TShiftState); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Loaded; override;
    procedure CloseUp(AAccept: Boolean); override;
    property Value: integer read FValue write SetValue;
    property InnerTree: TcxDBTreeList read FTree;
    function Locate(AValue: Variant; ACol: integer; ALocateOptions: TssLocateOptions = []): boolean;

  published
    property OnGetNodeImageIndex: TcxTreeListGetNodeImageIndexEvent read FOnGetNodeImageIndex write FOnGetNodeImageIndex;
    property AllowEmpty: Boolean read FAllowEmpty write SetAllowEmpty default True;
    property ListSource: TDataSource read GetListSource write SetListSource;
    property KeyField: string read FKeyField write SetKeyField;
    property ParentField: string read FParentField write SetParentField;
    property DisplayField: string read FDisplayField write SetDisplayField;
    property ShowExpandedTree: boolean read FShowExpandedTree write FShowExpandedTree;
    property Images: TCustomImageList read GetImages write SetImages;
  end;

implementation

uses Windows;

{ TssPopupTreeEdit }

procedure TssPopupTreeEdit.CloseUp(AAccept: Boolean);
begin
  inherited;
end;

constructor TssPopupTreeEdit.Create(AOwner: TComponent);
  var 
    FCol: TcxTreeListColumn;
begin
  inherited;

  Properties.PopupSizeable := False;
  Properties.PopupAutoSize := False;
  FAllowEmpty := True;
  Text := '';
  FTree := TcxDBTreeList.Create(nil);

  with FTree do begin
    Font.Assign(Self.Font);
    LookAndFeel.Kind := lfFlat;
    CreateColumn;
    FCol := CreateColumn;
    FCol.Visible := False;
    BorderStyle := cxcbsNone;
    OptionsView.Headers := False;
    OptionsView.ColumnAutoWidth := True;
    OptionsSelection.CellSelect := False;
    Self.Properties.PopupControl := FTree;
    OnDblClick := TreeDblClick;
    OnKeyPress := TreeKeyPress;
    OnGetNodeImageIndex := TreeGetNodeImageIndex;
  end;
end;

destructor TssPopupTreeEdit.Destroy;
begin
  FTree.Free;

  inherited;
end;

procedure TssPopupTreeEdit.DoEditKeyPress(var Key: Char);
  var
    FText: string;
begin
  if (Key=#8) and ((Length(EditingText)<>SelLength) or not FAllowEmpty) 
  then Key:=#0 
  else if Key=' ' then begin
    DropDown;
    Key:=#0;
  end 
  else if (Key>#29) then begin
    FText:=Copy(EditingText, 1, SelStart)+Key;
    Key:=#0;
    if Locate(FText, 0, [loPartialKey]) then begin
      EditingText:=FTree.FocusedNode.Values[0];
      FValue:=FTree.FocusedNode.Values[1];
      SelStart:=Length(FText);
      SelLength:=Length(EditingText) - SelStart;
    end;
  end
  else inherited;
end;

procedure TssPopupTreeEdit.DoEditKeyUp(var Key: Word; Shift: TShiftState);
begin
  if (Key in [VK_DOWN, VK_UP]) and (Shift = []) and (FTree.Count > 0) then begin
    if EditingText = '' then begin
      EditingText := FTree.FocusedNode.Values[0];
      FValue:=FTree.FocusedNode.Values[1];
      SelectAll;
    end
    else
    case Key of
     VK_DOWN:
       if FTree.FocusedNode<>FTree.LastNode then begin
         if not FTree.FocusedNode.Expanded then FTree.FocusedNode.Expand(False);
         FTree.FocusedNode:=FTree.FocusedNode.GetNext;
         EditingText:=FTree.FocusedNode.Values[0];
         SelectAll;
         FValue:=FTree.FocusedNode.Values[1];
       end;
     VK_UP:
       if FTree.FocusedNode.AbsoluteIndex<>0 then begin
         FTree.FocusedNode:=FTree.FocusedNode.GetPrev;
         EditingText:=FTree.FocusedNode.Values[0];
         SelectAll;
         FValue:=FTree.FocusedNode.Values[1];
       end;
    end;
  end
  else inherited;
end;

procedure TssPopupTreeEdit.DoInitPopup;
begin
  if FShowExpandedTree then FTree.FullExpand;
  inherited;
end;

function TssPopupTreeEdit.GetImages: TCustomImageList;
begin
  Result:=FTree.Images;
end;

function TssPopupTreeEdit.GetListSource: TDataSource;
begin
  Result:=FTree.DataController.DataSource;
end;

procedure TssPopupTreeEdit.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key in [VK_BACK, VK_DELETE]) and ((Length(EditingText)<>SelLength) or not FAllowEmpty)
    then Key:=0;
end;

procedure TssPopupTreeEdit.Loaded;
begin
  inherited;

  FTree.Width := Self.Width - 2;
  Properties.PopupWidth := Self.Width - 2;
end;

function TssPopupTreeEdit.Locate(AValue: Variant; ACol: integer; ALocateOptions: TssLocateOptions = []): boolean;
  var 
    i: integer;

  function LocateNode(AValue: Variant; ACol: integer; ANode: TcxTreeListNode): boolean;
    var 
      i: integer;
      res: boolean;
  begin
    Result:=False;

    if loPartialKey in ALocateOptions
      then res:=Pos(AnsiLowerCase(AValue), AnsiLowerCase(ANode.Values[ACol]))=1
      else res:=ANode.Values[ACol]=AValue;

    if res then begin
      FTree.FocusedNode:=ANode;
      Result:=True;
      Exit;
    end;

    if not ANode.Expanded then ANode.Expand(False);
    for i:=0 to ANode.Count-1 do begin
      if LocateNode(AValue, ACol, ANode.Items[i]) then begin
        Result:=True;
        Exit;
      end;
    end;

    if not FShowExpandedTree then ANode.Collapse(False);
  end;

begin
  Result:=False;

  for i:=0 to FTree.Count-1 do begin
    if LocateNode(AValue, ACol, FTree.Items[i]) then begin
      Result:=True;
      Exit;
    end;
  end;
end;

procedure TssPopupTreeEdit.RefreshLookupItems;
  var 
    BM: TBookmark;
begin
   with Properties.LookupItems do begin
     Clear;

     if (ListSource<>nil) and (ListSource.DataSet<>nil) and not ListSource.DataSet.IsEmpty 
     then begin
       BM:=ListSource.DataSet.GetBookmark;
       try
         ListSource.DataSet.First;
         while not ListSource.DataSet.Eof do begin
           Add(ListSource.DataSet.fieldbyname(FDisplayField).AsString);
           ListSource.DataSet.Next;
         end;

       finally
          ListSource.DataSet.GotoBookmark(BM);
          ListSource.DataSet.FreeBookmark(BM);
       end;
    end;
  end;
end;

procedure TssPopupTreeEdit.SetAllowEmpty(const Value: Boolean);
begin
  FAllowEmpty := Value;
end;

procedure TssPopupTreeEdit.SetDisplayField(const Value: string);
begin
  FDisplayField := Value;
  FTree.Columns[0].DataBinding.FieldName:=Value;
end;

procedure TssPopupTreeEdit.SetImages(const Value: TCustomImageList);
begin
  FTree.Images:=Value;
end;

procedure TssPopupTreeEdit.SetKeyField(const Value: string);
begin
  FKeyField := Value;
  FTree.DataController.KeyField:=Value;
  FTree.Columns[1].DataBinding.FieldName:=Value;
end;

procedure TssPopupTreeEdit.SetListSource(const Value: TDataSource);
begin
  FTree.DataController.DataSource:=Value;
  RefreshLookupItems;
end;

procedure TssPopupTreeEdit.SetParentField(const Value: string);
begin
  FParentField := Value;
  FTree.DataController.ParentField:=Value;
end;

procedure TssPopupTreeEdit.SetValue(const Value: integer);
begin
  if Locate(Value, 1) or (Value = 0) then begin
    FValue := Value;
    if Value <> 0 then Self.Text:=FTree.FocusedNode.Values[0];
  end;
end;

procedure TssPopupTreeEdit.TreeDblClick(Sender: TObject);
begin
  if FTree.FocusedNode <> nil then begin
    FValue := FTree.FocusedNode.Values[1];
    Self.Text := FTree.FocusedNode.Values[0];
    Self.CloseUp(False);
  end;
end;

procedure TssPopupTreeEdit.TreeGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
begin
  if Assigned(OnGetNodeImageIndex) then
    OnGetNodeImageIndex(Sender, ANode, AIndexType, AIndex); 
end;

procedure TssPopupTreeEdit.TreeKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #13: TreeDblClick(Sender);
    #27: CloseUp(True);
  end;
end;

end.
