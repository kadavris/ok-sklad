unit ssDBGrid;

interface

uses
  Windows, SysUtils, Classes, Controls, 
  dxCntner6, dxTL6, dxDBTL6, dxDBCtrl6, dxDBGrid6,
  Forms, Variants, xLngManager, Messages, dialogs;

const
  WM_OK_NEEDADJUST = WM_USER + 100;

type
  TssDBGridGetTitleEvent = procedure (Sender: TObject; var AText: string; var ImgList: TImageList; var AIndex: Integer) of object;

  TssDBGridGetGroupNodeAddText = procedure (Sender: TObject; Node: TdxTreeListNode; var AText: string) of object;

  //----------------------------------------------------------------------
  TssDBGridColumn = class(TdxDBGridColumn)
    public
      function GetGroupText(const Value: string): string; override;
  end;

  //----------------------------------------------------------------------
  TssDBGrid = class(TdxDBGrid)
    private
      FCurrCol, FCurrHeader: TdxDBTreeListColumn;
      FCurrNode: TdxTreeListNode;
      FLangManager: TxLngManager;
      FOnNeedAdjust: TNotifyEvent;
      FOnGetOptionsTitle: TssDBGridGetTitleEvent;
      FAutoHideGroupPanel: Boolean;
      FOnGetGroupNodeAddText: TssDBGridGetGroupNodeAddText;
      FAllowGrouping: Boolean;
      FblockGNS: Boolean; // blocks looping in getNodestring event calling

      procedure SetLangManager(const Value: TxLngManager);
      procedure WMOKNeedAdjust(var M: TMessage); message WM_OK_NEEDADJUST;
      procedure SetAutoHideGroupPanel(const Value: Boolean);

    protected
      procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
      procedure StartDragHeader(AbsoluteIndex: Integer); override;
      procedure EndDragHeader(Flag: Boolean); override;
      procedure ReLoadGroupList; override;
      function  GetNodeString(Node: TdxTreeListNode; Column: Integer): string; override;
      procedure DoEndDragHeader(P: TPoint; AbsoluteIndex: Integer; var NewPosInfo: TdxHeaderPosInfo; var Accept: Boolean); override;

    public
      FImgList: TImagelist;
      FImgIndex: Integer;
      procedure ShowColOptions;
      function  GetTitle: string;
      procedure AutoHideBands;

      constructor Create(AOwner: TComponent); override;
      procedure LoadFromRegistry(const ARegPath: string); override;
      procedure SaveToRegistry(const ARegPath: string); override;
      procedure Adjust(ACol: TdxDBTreeListColumn; NACols: array of const);

    published
      property AllowGrouping: Boolean read FAllowGrouping write FAllowGrouping default False;
      property AutoHideGroupPanel: Boolean read FAutoHideGroupPanel write SetAutoHideGroupPanel default True;
      property LangManager: TxLngManager read FLangManager write SetLangManager;
      property OnNeedAdjust: TNotifyEvent read FOnNeedAdjust write FOnNeedAdjust;
      property OnGetOptionsTitle: TssDBGridGetTitleEvent read FOnGetOptionsTitle write FOnGetOptionsTitle;
      property OnGetGroupNodeAddText: TssDBGridGetGroupNodeAddText read FOnGetGroupNodeAddText write FOnGetGroupNodeAddText;
  end;

  //----------------------------------------------------------------------
  TssDBTreeList = class(TdxDBTreeList)
    private
      FCurrCol, FCurrHeader: TdxDBTreeListColumn;
      FCurrNode: TdxTreeListNode;
      FLangManager: TxLngManager;
      FOnNeedAdjust: TNotifyEvent;
      FOnGetOptionsTitle: TssDBGridGetTitleEvent;
      procedure SetLangManager(const Value: TxLngManager);
      procedure WMOKNeedAdjust(var M: TMessage); message WM_OK_NEEDADJUST;

    protected
      procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;

    public
      FImgList: TImagelist;
      FImgIndex: Integer;
      procedure ShowColOptions;
      function GetTitle: string;

    published
      property LangManager: TxLngManager read FLangManager write SetLangManager;
      property OnNeedAdjust: TNotifyEvent read FOnNeedAdjust write FOnNeedAdjust;
      property OnGetOptionsTitle: TssDBGridGetTitleEvent read FOnGetOptionsTitle write FOnGetOptionsTitle;
  end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  {$IFNDEF PKG}
  fColOptions,
  {$ENDIF}
  ssRegUtils;

//==============================================================================================
procedure TssDBGrid.Adjust(ACol: TdxDBTreeListColumn; NACols: array of const);
  var
    AStyle: Integer;
    Offset, W, i: integer;

  function ItemInArr(AItem: Pointer; AArr: array of const): Boolean;
    var
      i: Integer;
  begin
    Result := False;
    for i := 0 to Length(AArr) - 1 do
      if AArr[i].VPointer = AItem then begin
        Result := True;
        Exit;
      end;
  end;

begin
  AStyle := GetWindowLong(Self.Handle, GWL_STYLE);

  if AStyle and WS_VSCROLL = WS_VSCROLL
    then Offset := 19
    else Offset := 2;

  W := Self.Width - Offset;

  if ACol = nil then begin
    for i := 0 to Self.VisibleColumnCount - 1 do
      if not ItemInArr(Pointer(Self.VisibleColumns[i]), NACols) then begin
        ACol := Self.VisibleColumns[i];
        Break;
      end;
  end;

  for i := 0 to Self.VisibleColumnCount - 1 do
    if Self.VisibleColumns[i] <> ACol
      then W := W - Self.VisibleColumns[i].Width;

  ACol.Width := W;
end;

//==============================================================================================
procedure TssDBGrid.AutoHideBands;
  {var
    i, j: Integer;
    FVis: Boolean;
  }
begin
  {for j := 0 to Bands.Count - 1 do begin
    FVis := False;
    for i := 1 to ColumnCount - 1 do
      if Columns[i].Visible and (Columns[i].BandIndex = j)
        then FVis := True;
    Bands.Items[j].Visible := FVis;
  end;
  Adjust(nil, []);
  }
end;

//==============================================================================================
constructor TssDBGrid.Create(AOwner: TComponent);
begin
  inherited;

  FAutoHideGroupPanel := True;
  FblockGNS := False;
end;

//==============================================================================================
procedure TssDBGrid.DoEndDragHeader(P: TPoint; AbsoluteIndex: Integer; var NewPosInfo: TdxHeaderPosInfo; var Accept: Boolean);
begin
  inherited;

  AutoHideBands;
end;

//==============================================================================================
procedure TssDBGrid.EndDragHeader(Flag: Boolean);
begin
  inherited;

  if FAllowGrouping and FAutoHideGroupPanel and (GroupColumnCount = 0)
    then ShowGroupPanel := False;
end;

//==============================================================================================
function TssDBGrid.GetNodeString(Node: TdxTreeListNode; Column: Integer): string;
  var
    DrawColumn: TdxDBGridColumn;
    AddText: string;
begin
  Result := '';

  if Node.HasChildren then begin
    DrawColumn := GroupColumns[Node.Level];

    // FblockGNS prevents looping
    if not FblockGNS and Assigned(OnGetGroupNodeAddText) then OnGetGroupNodeAddText(Self, Node, AddText);

    if not FblockGNS and Assigned(DrawColumn.OnGetText) then begin
      FblockGNS := True;
      DrawColumn.OnGetText(DrawColumn, Node, Result);
      FblockGNS := False;
      Result := DrawColumn.Caption + ' : ' + Result + ' ' + AddText;
    end
    else Result := TssDBGridColumn(DrawColumn).GetGroupText(inherited GetNodeString(Node, DrawColumn.Index)) + ' ' + AddText;
  end
  else Result := inherited GetNodeString(Node, Column);
end;

//==============================================================================================
function TssDBGrid.GetTitle: string;
begin
  Result := '';

  FImgList := nil;

  if Assigned(FOnGetOptionsTitle) then FOnGetOptionsTitle(Self, Result, FImgList, FImgIndex);
end;

//==============================================================================================
procedure TssDBGrid.MouseMove(Shift: TShiftState; X, Y: Integer);
  var
    FCol, FHeader: TdxDBTreeListColumn;
    FNode: TdxTreeListNode;
begin
  FHeader := Self.GetHeaderColumnAt(X, Y);
  FCol := Self.GetColumnAt(X, Y);
  FNode := Self.GetNodeAt(X, Y);

  if ((FCol <> nil) and (FNode <> nil)) or (FHeader <> nil) then begin
   if (FCol <> FCurrCol) or (FNode <> FCurrNode) or (FHeader <> FCurrHeader) then begin
     Application.CancelHint;

     if FNode <> nil then begin
       try
         if Self.Canvas.TextWidth(VarToStr(FNode.Values[FCol.Index])) > FCol.Width
           then Self.Hint := VarToStr(FNode.Values[FCol.Index])
           else Self.Hint := '';
       except
       end;
     end
     else if FHeader <> nil then begin
       Self.Hint := FHeader.Caption;
     end;

     FCurrCol := FCol;
     FCurrNode := FNode;
     FCurrHeader := FHeader;
   end;
  end
  else begin
    Self.Hint := '';
    FCurrCol := nil;
    FCurrNode := nil;
    Application.CancelHint;
  end;

  inherited;
end;

//==============================================================================================
procedure TssDBGrid.ReLoadGroupList;
begin
  inherited;

  if FAllowGrouping and FAutoHideGroupPanel
    then ShowGroupPanel := not (GroupColumnCount = 0);
end;

//==============================================================================================
procedure TssDBGrid.LoadFromRegistry(const ARegPath: string);
  {$IFNDEF PKG}
  var intTmp: Integer;
  {$ENDIF}
begin
  inherited;

  {$IFNDEF PKG}
  if ReadFromRegInt(ARegPath, 'AutoHideGroupPanel', intTmp) then FAutoHideGroupPanel := (intTmp = 1);
  {$ENDIF}
end;

//==============================================================================================
procedure TssDBGrid.SaveToRegistry(const ARegPath: string);
begin
  inherited;

  {$IFNDEF PKG}
  WriteToRegInt(ARegPath, 'AutoHideGroupPanel', Integer(FAutoHideGroupPanel));
  {$ENDIF}
end;

//==============================================================================================
procedure TssDBGrid.SetAutoHideGroupPanel(const Value: Boolean);
begin
  FAutoHideGroupPanel := Value;

  if Value and (GroupColumnCount > 0) then ShowGroupPanel := True;
end;

//==============================================================================================
procedure TssDBGrid.SetLangManager(const Value: TxLngManager);
begin
  if Value = FLangManager then Exit;

  FLangManager := Value;

  try
    if Assigned(Value) then Value.FreeNotification(Self);
  except
  end;
end;

//==============================================================================================
procedure TssDBGrid.ShowColOptions;
begin
  {$IFNDEF PKG}
  with TfrmColOptions.Create(nil) do
  try
    SetCaptions(Self.FLangManager);
    Grid := Self;
    ShowModal;

  finally
    Free;
  end;
  {$ENDIF}
end;

//==============================================================================================
procedure TssDBGrid.StartDragHeader(AbsoluteIndex: Integer);
begin
  if FAllowGrouping and FAutoHideGroupPanel and not ShowGroupPanel
    then ShowGroupPanel := True;

  inherited;
end;

//==============================================================================================
procedure TssDBGrid.WMOKNeedAdjust(var M: TMessage);
begin
  if Assigned(FOnNeedAdjust) then FOnNeedAdjust(Self);
end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
// TssDBTreeList
//==============================================================================================
//==============================================================================================
//==============================================================================================
function TssDBTreeList.GetTitle: string;
begin
  Result := '';
  FImgList := nil;

  if Assigned(FOnGetOptionsTitle) then FOnGetOptionsTitle(Self, Result, FImgList, FImgIndex);
end;

//==============================================================================================
procedure TssDBTreeList.MouseMove(Shift: TShiftState; X, Y: Integer);
  var
    FCol, FHeader: TdxDBTreeListColumn;
    FNode: TdxTreeListNode;
begin
  FHeader := Self.GetHeaderColumnAt(X, Y);
  FCol := Self.GetColumnAt(X, Y);
  FNode := Self.GetNodeAt(X, Y);

  if ((FCol <> nil) and (FNode <> nil)) or (FHeader <> nil) then begin
    if (FCol <> FCurrCol) or (FNode <> FCurrNode) or (FHeader <> FCurrHeader) then begin
      Application.CancelHint;

      if FNode <> nil then begin
        if Self.Canvas.TextWidth(VarToStr(FNode.Values[FCol.Index])) > FCol.Width
          then Self.Hint := VarToStr(FNode.Values[FCol.Index])
          else Self.Hint := '';
      end
      else if FHeader <> nil then Self.Hint := FHeader.Caption;

      FCurrCol := FCol;
      FCurrNode := FNode;
      FCurrHeader := FHeader;
    end;
  end
  else begin
    Self.Hint := '';
    FCurrCol := nil;
    FCurrNode := nil;
    Application.CancelHint;
  end;

  inherited;
end;

//==============================================================================================
procedure TssDBTreeList.SetLangManager(const Value: TxLngManager);
begin
  if Value = FLangManager then Exit;
  FLangManager := Value;

  try
    if Assigned(Value) then Value.FreeNotification(Self);
  except
  end;
end;

//==============================================================================================
procedure TssDBTreeList.ShowColOptions;
begin
  {$IFNDEF PKG}
  with TfrmColOptions.Create(nil) do
  try
    SetCaptions(Self.FLangManager);
    Grid := Self as TCustomdxDBTreeListControl;
    ShowModal;
  finally
    Free;
  end;
  {$ENDIF}
end;

//==============================================================================================
procedure TssDBTreeList.WMOKNeedAdjust(var M: TMessage);
begin
  if Assigned(FOnNeedAdjust) then FOnNeedAdjust(Self);
end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
// TssDBGridColumn
//==============================================================================================
//==============================================================================================
//==============================================================================================
function TssDBGridColumn.GetGroupText(const Value: string): string;
begin
  Result := inherited GetGroupText(Value);
end;

end.
