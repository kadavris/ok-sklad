unit xLngManDsgn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, xButton, ActnList, xLngManager, ImgList, Menus,
  {$IFDEF DELPHI7}
  dxTL, dxCntner6, dxTLClms,
  {$ELSE}
  dxdbtree,
  {$ENDIF}
  ComCtrls, IniFiles, ExtCtrls, StdCtrls, xBevel;

type
  TfrmLngManDsgn = class(TForm)
    ActionList: TActionList;
    ilMain: TImageList;
    aClose: TAction;
    aNewSection: TAction;
    aNewValue: TAction;
    aDelete: TAction;
    pmMain: TPopupMenu;
    NewSection1: TMenuItem;
    NewValue1: TMenuItem;
    N1: TMenuItem;
    Delete1: TMenuItem;
    aOpen: TAction;
    pcMain: TPageControl;
    tsFiles: TTabSheet;
    tsRes: TTabSheet;
    tlMain: TdxTreeList;
    colKey: TdxTreeListColumn;
    btnNewSection: TxButton;
    btnNewValue: TxButton;
    btnDelete: TxButton;
    btnClose: TxButton;
    tlFiles: TdxTreeList;
    colDesc: TdxTreeListColumn;
    xButton1: TxButton;
    aFClear: TAction;
    aFDelete: TAction;
    xButton2: TxButton;
    colFileName: TdxTreeListButtonColumn;
    xButton3: TxButton;
    aFAdd: TAction;
    rbtOnlyActive: TRadioButton;
    rbtAll: TRadioButton;
    Panel1: TPanel;
    xBevel1: TxBevel;
    btnExpand: TxButton;
    btnCollapse: TxButton;
    colName: TdxTreeListColumn;

    procedure tlMainGetImageIndex(Sender: TObject; Node: TdxTreeListNode; var Index: Integer);
    procedure tlMainEditing(Sender: TObject; Node: TdxTreeListNode; var Allow: Boolean);
    procedure tlMainChangeNode(Sender: TObject; OldNode, Node: TdxTreeListNode);
    procedure tlMainEdited(Sender: TObject; Node: TdxTreeListNode);
    procedure aCloseExecute(Sender: TObject);
    procedure aNewSectionExecute(Sender: TObject);
    procedure aNewValueExecute(Sender: TObject);
    procedure aDeleteExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aOpenExecute(Sender: TObject);
    procedure aFClearExecute(Sender: TObject);
    procedure aFAddExecute(Sender: TObject);
    procedure tlFilesEdited(Sender: TObject; Node: TdxTreeListNode);
    procedure colFileNameButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure tlMainExit(Sender: TObject);
    procedure aFDeleteExecute(Sender: TObject);
    procedure pcMainChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure tlMainColumnClick(Sender: TObject; Column: TdxTreeListColumn);
    procedure FormCreate(Sender: TObject);
    procedure rbtOnlyActiveClick(Sender: TObject);
    procedure btnExpandClick(Sender: TObject);
    procedure btnCollapseClick(Sender: TObject);
    procedure tlMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure tlMainExpanded(Sender: TObject; Node: TdxTreeListNode);
    procedure tlMainCollapsed(Sender: TObject; Node: TdxTreeListNode);
    procedure tlMainColumnSorting(Sender: TObject; Column: TdxTreeListColumn; var Allow: Boolean);
    procedure tlMainChangedColumnsWidth(Sender: TObject);

  private
    FLngManager: TxLngManager;
    procedure GetFiles;
    procedure SetLngManager(const Value: TxLngManager);
    procedure FillRes;
    procedure FillTree(ALngFile: TxLngFile; ANode: TdxTreeListNode; AParent: TxLngManItem);
    procedure AdjustMain;
    function FindNode(AParent: TdxTreeListNode; const AValue: string): TdxTreeListNode;

  public
    property LngManager: TxLngManager read FLngManager write SetLngManager;
  end;

var
  frmLngManDsgn: TfrmLngManDsgn;

implementation

{$R *.dfm}

//===========================================================================
procedure TfrmLngManDsgn.FillTree(ALngFile: TxLngFile; ANode: TdxTreeListNode; AParent: TxLngManItem);
var
  i: Integer;
  FNode: TdxTreeListNode;
begin
  with FLngManager do begin
    for i := 0 to ALngFile.Count - 1 do
      if ALngFile.Items[i].Parent = AParent then begin
        if ANode = nil then begin
          FNode := FindNode(nil, ALngFile.Items[i].KeyName);
          if FNode = nil then begin
            FNode := tlMain.Add;
            FNode.Values[0] := ALngFile.Items[i].KeyName;
          end;
        end
        else begin
          FNode := FindNode(ANode, ALngFile.Items[i].KeyName);
          if FNode = nil then begin
            FNode := ANode.AddChild;
            FNode.Values[0] := ALngFile.Items[i].KeyName;
          end;
          FNode.Values[ALngFile.Index * 2 + 1] := ALngFile.Items[i].Text;
        end;
        FNode.Values[ALngFile.Index * 2 + 2] := Integer(ALngFile.Items[i]);
        if ANode = nil then FillTree(ALngFile, FNode, ALngFile.Items[i]);
      end;
  end;
end;

//===========================================================================
procedure TfrmLngManDsgn.SetLngManager(const Value: TxLngManager);
begin
  FLngManager := Value;
  if not Value.ModifyOnly then tlMain.Options := tlMain.Options - [aoRowSelect];
  if Value = nil then Exit;
  GetFiles;
  if Value.Active then begin
    FillRes;
  end;
end;

//===========================================================================
procedure TfrmLngManDsgn.tlMainGetImageIndex(Sender: TObject; Node: TdxTreeListNode; var Index: Integer);
begin
  if Node.Level = 0 then
    if Node.Expanded then Index := 1
      else Index := 0
    else Index := 2;  
end;

//===========================================================================
procedure TfrmLngManDsgn.tlMainEditing(Sender: TObject; Node: TdxTreeListNode; var Allow: Boolean);
begin
  if (LngManager.ModifyOnly and ((Node.Level = 0) or (tlMain.FocusedColumn = 0)))
   or (not LngManager.ModifyOnly and (tlMain.FocusedColumn = 1) and (Node.Level = 0))
     then Allow := False;
end;

//===========================================================================
procedure TfrmLngManDsgn.tlMainChangeNode(Sender: TObject; OldNode, Node: TdxTreeListNode);
begin
  if LngManager.ModifyOnly then
    if Node.Level = 0
      then tlMain.Options := tlMain.Options + [aoRowSelect]
      else tlMain.Options := tlMain.Options - [aoRowSelect];
end;

//===========================================================================
procedure TfrmLngManDsgn.tlMainEdited(Sender: TObject; Node: TdxTreeListNode);
  var
    FRealIndex: Integer;
    i: Integer;
begin
  if tlMain.FocusedColumn > 0 then begin
    FRealIndex := tlMain.VisibleColumns[tlMain.FocusedColumn].Index;
    if VarToStr(Node.Values[FRealIndex + 1]) <> EmptyStr
      then FLngManager.Files[(FRealIndex - 1) div 2].UpdateItem(TxLngManItem(Integer(Node.Values[FRealIndex + 1])),
        Node.Values[0], Node.Values[FRealIndex])
      else begin
        if VarToStr(Node.Parent.Values[FRealIndex + 1]) = EmptyStr then begin
          Node.Parent.Values[FRealIndex + 1] :=
            Integer(FLngManager.Files[(FRealIndex - 1) div 2].AddItemEx(Node.Parent.Values[0], EmptyStr, nil));
        end;
          Node.Values[FRealIndex + 1] :=
            Integer(FLngManager.Files[(FRealIndex - 1) div 2].AddItemEx(Node.Values[0], Node.Values[FRealIndex],
            TxLngManItem(Integer(Node.Parent.Values[FRealIndex + 1]))));
      end;
  end
  else begin
    for i := 0 to FLngManager.FilesCount - 1 do begin
      if VarToStr(Node.Values[i * 2 + 2]) <> EmptyStr then
        FLngManager.Files[i].UpdateItem(TxLngManItem(Integer(Node.Values[i * 2 + 2])),
          VarToStr(Node.Values[0]), Node.Values[i * 2 + 1]);
    end;
  end;
end;

//===========================================================================
procedure TfrmLngManDsgn.aCloseExecute(Sender: TObject);
begin
  Close;
end;

//===========================================================================
procedure TfrmLngManDsgn.aNewSectionExecute(Sender: TObject);
  var
    FNode: TdxTreeListNode;
    i: Integer;
begin
  if tlMain.EditingText <> EmptyStr then tlMain.CloseEditor;
  FNode := tlMain.Add;
  AdjustMain;
  FNode.Values[0] := 'New Section';

  for i := 0 to FLngManager.FilesCount - 1 do
    FNode.Values[i * 2 + 2] := Integer(FLngManager.Files[i].AddItemEx('New Section', EmptyStr, nil));

  tlMain.FocusedNumber := FNode.AbsoluteIndex;
  tlMain.FocusedColumn := 0;
  tlMain.ShowEditor;
end;

//===========================================================================
procedure TfrmLngManDsgn.aNewValueExecute(Sender: TObject);
  var
    FNode: TdxTreeListNode;
    i: Integer;
begin
  if tlMain.EditingText <> EmptyStr then tlMain.CloseEditor;

  if tlMain.FocusedNode.Level = 0
    then FNode := tlMain.FocusedNode.AddChild
    else FNode := tlMain.FocusedNode.Parent.AddChild;

  AdjustMain;  
  FNode.Parent.Expand(False);
  FNode.Values[0] := 'rs_';

  for i := 0 to FLngManager.FilesCount - 1 do begin
    if VarToStr(FNode.Parent.Values[i * 2 + 2]) = EmptyStr
      then FNode.Parent.Values[i * 2 + 2] := Integer(FLngManager.Files[i].AddItemEx(FNode.Parent.Values[0], EmptyStr, nil));
    FNode.Values[i * 2 + 2] := Integer(FLngManager.Files[i].AddItemEx('rs_', EmptyStr,
      TxLngManItem(Integer(FNode.Parent.Values[i * 2 + 2]))));
  end;
  tlMain.FocusedNumber := FNode.AbsoluteIndex;
  tlMain.FocusedColumn := 0;
  tlMain.ShowEditor;
  tlMain.InplaceEditor.Deselect;
end;

//===========================================================================
procedure TfrmLngManDsgn.aDeleteExecute(Sender: TObject);
  var
    FNode: TdxTreeListNode;
    i: Integer;
begin
  FNode := tlMain.FocusedNode;
  for i := 0 to FLngManager.FilesCount - 1 do
    if VarToStr(FNode.Values[i * 2 + 2]) <> EmptyStr
      then FLngManager.Files[i].DropItem(TxLngManItem(Integer(FNode.Values[i * 2 + 2])));
  tlMain.FocusedNumber := FNode.AbsoluteIndex - 1;
  FNode.Free;
end;

//===========================================================================
procedure TfrmLngManDsgn.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
begin
  aNewSection.Enabled := FLngManager.Active and not FLngManager.ModifyOnly;
  aNewValue.Enabled := aNewSection.Enabled and (tlMain.Count > 0);
  aDelete.Enabled := aNewSection.Enabled and (tlMain.FocusedNode <> nil);

  aFDelete.Enabled := tlFiles.Count > 0;
  aFClear.Enabled := aFDelete.Enabled;
end;

//===========================================================================
procedure TfrmLngManDsgn.aOpenExecute(Sender: TObject);
begin
  with FLngManager do
    if Active then begin
      Close;
      tlMain.ClearNodes;
      aOpen.Caption := 'Open';
    end
    else begin
      Open;
      LngManager := FLngManager;
      aOpen.Caption := 'Close';
//      btnOpen.Invalidate;
    end;
end;

//===========================================================================
procedure TfrmLngManDsgn.aFClearExecute(Sender: TObject);
begin
  FLngManager.ClearCfg;
  FLngManager.Clear;
  tlFiles.ClearNodes;
end;

//===========================================================================
procedure TfrmLngManDsgn.aFAddExecute(Sender: TObject);
  var
    FNode: TdxTreeListNode;
begin
  FNode := tlFiles.Add;
  FNode.Data := FLngManager.AddFile;
  tlFiles.FocusedNumber := FNode.AbsoluteIndex;
  tlFiles.FocusedColumn := 0;
  tlFiles.ShowEditor;
end;

//===========================================================================
procedure TfrmLngManDsgn.GetFiles;
  var
    FNode: TdxTreeListNode;
    i: Integer;
begin
  with LngManager do begin
    for i := 0 to FilesCount - 1 do begin
      FNode := tlFiles.Add;
      FNode.Values[colDesc.Index] := Files[i].Desc;
      FNode.Values[colFileName.Index] := Files[i].FileName;
      FNode.Values[colName.Index] := Files[i].LangName;
      FNode.Data := Files[i];
    end;
    colDesc.Sorted := csUp;
  end;
end;

//===========================================================================
procedure TfrmLngManDsgn.tlFilesEdited(Sender: TObject; Node: TdxTreeListNode);
begin
  with TxLngFile(Node.Data) do begin
    Desc := Node.Values[colDesc.Index];
    FileName := Node.Values[colFileName.Index];
    LangName := Node.Values[colName.Index];
  end;
  tsRes.Tag := 1;
end;

//===========================================================================
procedure TfrmLngManDsgn.colFileNameButtonClick(Sender: TObject; AbsoluteIndex: Integer);
begin
  with TOpenDialog.Create(nil) do
  try
    if Execute then begin
      tlFiles.FocusedNode.Values[1] := FileName;
      tlFiles.CloseEditor;
    end;
  finally
    Free;
  end;
end;

//===========================================================================
procedure TfrmLngManDsgn.tlMainExit(Sender: TObject);
begin
  tlFiles.CloseEditor;
end;

//===========================================================================
procedure TfrmLngManDsgn.aFDeleteExecute(Sender: TObject);
var
  FNode: TdxTreeListNode;
begin
  FNode := tlFiles.FocusedNode;
  if FNode = nil then Exit;
  TxLngFile(FNode.Data).Parent.DropFile(TxLngFile(FNode.Data).Index);
  FNode.Free;
end;

//===========================================================================
procedure TfrmLngManDsgn.pcMainChange(Sender: TObject);
begin
  if (pcMain.ActivePage = tsRes) and (tsRes.Tag = 1) then begin
    FillRes;
    tsRes.Tag := 0;
  end;
end;

//===========================================================================
procedure TfrmLngManDsgn.AdjustMain;
var
  i, Offset, FColWidth: Integer;
  AStyle: Integer;
begin
  AStyle := GetWindowLong(tlMain.Handle, GWL_STYLE);
  if WS_VSCROLL and AStyle = WS_VSCROLL then Offset := 20
    else Offset := 4;
  with LngManager do begin
    if rbtOnlyActive.Checked then begin
      for i := 1 to tlMain.ColumnCount - 1 do
        if tlMain.Columns[i].Visible and (ActiveLngIndex * 2 <> i - 1)
          then tlMain.Columns[i].Width := 20;
      if ActiveLngIndex <> -1
        then tlMain.Columns[ActiveLngIndex * 2 + 1].Width := tlMain.Width -
          tlMain.Columns[0].Width - (tlMain.VisibleColumnCount - 2) * 20 - Offset
        else tlMain.Columns[0].Width := tlMain.Width - (tlMain.VisibleColumnCount - 1) * 20 -
          Offset;
    end
    else begin
      FColWidth := (tlMain.Width - Offset - colKey.Width) div (tlMain.VisibleColumnCount - 1);
      for i := 1 to tlMain.ColumnCount - 1 do
        tlMain.Columns[i].Width := FColWidth;
    end;      
  end;
end;

//===========================================================================
procedure TfrmLngManDsgn.FormResize(Sender: TObject);
begin
  AdjustMain;
end;

//===========================================================================
procedure TfrmLngManDsgn.tlMainColumnClick(Sender: TObject; Column: TdxTreeListColumn);
begin
  if (Column.Index > 0) then
    if (LngManager.ActiveLngIndex <> Column.Index - 1) then begin
      LngManager.ActiveLngIndex := (Column.Index - 1) div 2;
      AdjustMain;
    end;
end;

//===========================================================================
procedure TfrmLngManDsgn.FillRes;
var
  FCol: TdxTreeListColumn;
  i: Integer;
begin
  with FLngManager do begin
    while tlMain.ColumnCount > 1 do
      tlMain.Columns[1].Free;
    for i := 0 to FilesCount - 1 do begin
      FCol := tlMain.CreateColumn(TdxTreeListColumn);
      FCol.Width := 200;
      FCol.HeaderAlignment := taCenter;
      FCol.Caption := Files[i].Desc;
      FCol.Sizing := False;
      FCol.MinWidth := 20;

      FCol := tlMain.CreateColumn(TdxTreeListColumn);
      FCol.Visible := False;
    end;
    tlMain.ClearNodes;
    for i := 0 to FilesCount - 1 do begin
      FillTree(Files[i], nil, nil);
    end;
  end;
  AdjustMain;
  colKey.Sorted := csUp;
end;

//===========================================================================
procedure TfrmLngManDsgn.FormCreate(Sender: TObject);
begin
  pcMain.ActivePageIndex := 0;
end;

//===========================================================================
function TfrmLngManDsgn.FindNode(AParent: TdxTreeListNode; const AValue: string): TdxTreeListNode;
var
  i: Integer;
begin
  Result := nil;
  if AParent = nil then begin
    for i := 0 to tlMain.Count - 1 do
      if VarToStr(tlMain.Items[i].Values[0]) = AValue then begin
        Result := tlMain.Items[i];
        Exit;
      end;
  end
  else begin
    for i := 0 to AParent.Count - 1 do
      if VarToStr(AParent.Items[i].Values[0]) = AValue then begin
        Result := AParent.Items[i];
        Exit;
      end;
  end;
end;

//===========================================================================
procedure TfrmLngManDsgn.rbtOnlyActiveClick(Sender: TObject);
begin
  AdjustMain;
end;

//===========================================================================
procedure TfrmLngManDsgn.btnExpandClick(Sender: TObject);
begin
  tlMain.FullExpand;
  AdjustMain;
end;

//===========================================================================
procedure TfrmLngManDsgn.btnCollapseClick(Sender: TObject);
begin
  tlMain.FullCollapse;
  AdjustMain;
end;

//===========================================================================
procedure TfrmLngManDsgn.tlMainCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
  if ANode.Level = 0 then AFont.Style := [fsBold];
end;

//===========================================================================
procedure TfrmLngManDsgn.tlMainExpanded(Sender: TObject; Node: TdxTreeListNode);
begin
  AdjustMain;
end;

//===========================================================================
procedure TfrmLngManDsgn.tlMainCollapsed(Sender: TObject; Node: TdxTreeListNode);
begin
  AdjustMain;
end;

//===========================================================================
procedure TfrmLngManDsgn.tlMainColumnSorting(Sender: TObject; Column: TdxTreeListColumn; var Allow: Boolean);
begin
  Allow := Column.Index = 0; 
end;

//===========================================================================
procedure TfrmLngManDsgn.tlMainChangedColumnsWidth(Sender: TObject);
begin
  AdjustMain;
end;

end.
