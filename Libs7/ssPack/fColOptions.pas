unit fColOptions;

interface

uses
  Dialogs, ImgList, ssSpeedButton, ssPanel,
  dxTL6, dxDBCtrl6, dxDBGrid6, dxCntner6, dxDBTLCl6, dxGrClms6, 
  cxControls, cxContainer, cxEdit, cxCheckBox,
  ssDBGrid, ssMemDS, ssBevel, ssBaseSkinForm,
  ssGradientPanel, xButton, ActnList, xLngManager, 
  StdCtrls, ExtCtrls, DB, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms;

type
  TfrmColOptions = class(TfrmBaseSkin)
    aApply: TAction;
    aCancel: TAction;
    ActionList: TActionList;
    aHelp: TAction;
    aLockScreen: TAction;
    aOK: TAction;
    aSendErrMessage: TAction;
    btnApply: TxButton;
    btnCancel: TxButton;
    btnDown: TssSpeedButton;
    btnHelp: TssSpeedButton;
    btnLock: TssSpeedButton;
    btnOK: TxButton;
    btnSendErrMessage: TssSpeedButton;
    btnUp: TssSpeedButton;
    bvlMain: TssBevel;
    chbAllowGrouping: TcxCheckBox;
    colColName: TdxDBGridColumn;
    colIndex: TdxDBGridColumn;
    colName: TdxDBGridColumn;
    colVisible: TdxDBGridImageColumn;
    grdMain: TssDBGrid;
    imgFun: TImage;
    lName: TLabel;
    mdCols: TssMemoryData;
    mdColscolindex: TIntegerField;
    mdColscolname: TStringField;
    mdColsen: TIntegerField;
    mdColsname: TStringField;
    mdColsvis: TIntegerField;
    panButtons: TPanel;
    srcCols: TDataSource;

    procedure aCancelExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure aApplyExecute(Sender: TObject);
    procedure grdMainMouseDown(Sender: TObject; Button: TMouseButton;Shift: TShiftState; X, Y: Integer);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure colIndexGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure btnUpClick(Sender: TObject);
    procedure btnDownClick(Sender: TObject);
    procedure grdMainDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure aLockScreenExecute(Sender: TObject);
    procedure aSendErrMessageExecute(Sender: TObject);
    procedure aHelpExecute(Sender: TObject);
    procedure grdMainColumnSorting(Sender: TObject; Column: TdxDBTreeListColumn; var Allow: Boolean);
    procedure chbAllowGroupingPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    FGrid: TCustomdxDBTreeListControl;
    FModified: Boolean;
    procedure SetGrid(const Value: TCustomdxDBTreeListControl);

  public
    procedure SetCaptions(ALng: TxLngManager);
    property Grid: TCustomdxDBTreeListControl read FGrid write SetGrid;
  end;

var
  frmColOptions: TfrmColOptions;

implementation

{$R *.dfm}

{$IFNDEF PKG}
uses 
  prFun, prConst;
{$ENDIF}

//==============================================================================================
procedure TfrmColOptions.SetCaptions(ALng: TxLngManager);
begin
  if Assigned(ALng) then
    with ALng do begin
      aOK.Caption := GetRS('Common', 'OK');
      aCancel.Caption := GetRS('Common', 'Cancel');
      aApply.Caption := GetRS('Common', 'Apply');

      Self.Caption := GetRS('Common', 'ColOptions');
      colName.Caption := GetRS('Common', 'ColName');
      colVisible.Caption := GetRS('Common', 'ColVis');

      btnLock.Hint := GetRS('Common', 'Lock');
      btnHelp.Hint := GetRS('Common', 'Help');
      btnSendErrMessage.Hint := GetRS('Common', 'SendErrMessage');

      chbAllowGrouping.Properties.Caption := GetRS('Common', 'ColOptionsAG');
    end;
end;

//==============================================================================================
procedure TfrmColOptions.SetGrid(const Value: TCustomdxDBTreeListControl);
  var
    i: Integer;
begin
  FGrid := Value;

  if Assigned(Value) then begin
    if Value is TssDBGrid then begin
      lName.Caption := (Value as TssDBGrid).GetTitle;
      TssDBGrid(Value).FImgList.GetBitmap(TssDBGrid(Value).FImgIndex, imgFun.Picture.Bitmap);
      //colVisible.Images := TssDBGrid(Value).FImgList;
      //colVisible.Values[54] := '1';
    end
    else begin
      lName.Caption := (Value as TssDBTreeList).GetTitle;
      TssDBTreeList(Value).FImgList.GetBitmap(TssDBTreeList(Value).FImgIndex, imgFun.Picture.Bitmap);
    end;
  end;

  with mdCols do begin
    Close;
    Open;
    for i := 0 to Value.ColumnCount - 1 do begin
      if Value.Columns[i].Tag > 0 then begin
        Append;
        FieldByName('colname').AsString := Value.Columns[i].Name;
        FieldByName('name').AsString := Value.Columns[i].Caption;
        FieldByName('vis').AsInteger := Integer(Value.Columns[i].Visible);
        FieldByName('en').AsInteger := Integer(Value.Columns[i].Tag = 1);
        FieldByName('colindex').AsInteger := Value.Columns[i].Index;
        Post;
      end;
    end;
    First;
  end;

  if Value is TssDBGrid then begin
    chbAllowGrouping.Checked := (Value as TssDBGrid).AutoHideGroupPanel and (Value as TssDBGrid).AllowGrouping;
    chbAllowGrouping.Enabled := (Value as TssDBGrid).AllowGrouping;
  end
  else begin
    chbAllowGrouping.Checked := False;
    chbAllowGrouping.Enabled := False;
  end;
end;

//==============================================================================================
procedure TfrmColOptions.aCancelExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

//==============================================================================================
procedure TfrmColOptions.aOKExecute(Sender: TObject);
begin
  ModalResult := mrOk;
end;

//==============================================================================================
procedure TfrmColOptions.aApplyExecute(Sender: TObject);
begin
  ModalResult := mrYes;
end;

//==============================================================================================
procedure TfrmColOptions.grdMainMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  var
    FNode: TdxTreeListNode;
    FCol: TdxTreeListColumn;
begin
  if Button = mbLeft then begin
    FNode := grdMain.GetNodeAt(X, Y);
    FCol := grdMain.GetColumnAt(X, Y);
    if Assigned(FNode) and Assigned(FCol) and (FCol = colVisible) then begin
      if mdCols.Locate('colname', FNode.Values[colColName.Index], []) and
        (mdCols.FieldByName('en').AsInteger = 1) then begin
        mdCols.Edit;
        mdCols.FieldByName('vis').AsInteger := 1 - mdCols.FieldByName('vis').AsInteger;
        mdCols.Post;
        FModified := True;
      end;
    end;
  end;
end;

//==============================================================================================
procedure TfrmColOptions.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
begin
  aOk.Enabled := FModified;
  aApply.Enabled := aOk.Enabled;
end;

//==============================================================================================
procedure TfrmColOptions.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    BM: TBookmark;  
begin
  if ModalResult in [mrOk, mrYes] then begin
    CanClose := False;

    with Grid do begin
      BM := mdCols.GetBookmark;
      mdCols.DisableControls;

      try
        mdCols.First;
        while not mdCols.Eof do begin
          with ColumnByName(mdCols.FieldByName('colname').AsString) do begin
            Visible := mdCols.FieldByName('vis').AsInteger = 1;
            Index := mdCols.FieldByName('colindex').AsInteger;
          end;
          mdCols.Next;
        end;

      finally
        mdCols.GotoBookmark(BM);
        mdCols.FreeBookmark(BM);
        mdCols.EnableControls;
      end;

      if Grid is TssDBGrid then begin
        (Grid as TssDBGrid).AutoHideGroupPanel := chbAllowGrouping.Checked;
        if not chbAllowGrouping.Checked then begin
          Grid.ClearGroupColumns;
          (Grid as TssDBGrid).ShowGroupPanel := False;
        end;
      end;

      PostMessage(Grid.Handle, WM_OK_NEEDADJUST, 0, 0);
    end;

    if ModalResult = mrOk
      then CanClose := True
      else FModified := False;
  end;
end;

//==============================================================================================
procedure TfrmColOptions.colIndexGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
begin
  AText := IntToStr(ANode.Index + 1);
end;

//==============================================================================================
procedure TfrmColOptions.btnUpClick(Sender: TObject);
  var
    I1, I2: Integer;
begin
  with mdCols do begin
    if RecNo <> 0 then begin
      DisableControls;
      try
        I1 := FieldByName('colindex').AsInteger;
        Prior;
        I2 := FieldByName('colindex').AsInteger;
        Edit;
        FieldByName('colindex').AsInteger := I1;
        Post;
        Next;
        Edit;
        FieldByName('colindex').AsInteger := I2;
        Post;
        SortOnFields('colindex');

      finally
        EnableControls;
      end;
    end;

    FModified := True;
  end;
end;

//==============================================================================================
procedure TfrmColOptions.btnDownClick(Sender: TObject);
  var
    I1, I2: Integer;
begin
  with mdCols do begin
    if RecNo <> mdCols.RecordCount - 1 then begin
      DisableControls;
      try
        I1 := FieldByName('colindex').AsInteger;
        Next;
        I2 := FieldByName('colindex').AsInteger;
        Edit;
        FieldByName('colindex').AsInteger := I1;
        Post;
        Prior;
        Edit;
        FieldByName('colindex').AsInteger := I2;
        Post;
        SortOnFields('colindex');

      finally
        EnableControls;
      end;
    end;

    FModified := True; 
  end;
end;

//==============================================================================================
procedure TfrmColOptions.grdMainDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := True;
end;

//==============================================================================================
procedure TfrmColOptions.aLockScreenExecute(Sender: TObject);
begin
  {$IFNDEF PKG}
  LockScreen;
  {$ENDIF}
end;

//==============================================================================================
procedure TfrmColOptions.aSendErrMessageExecute(Sender: TObject);
begin
  {$IFNDEF PKG}
  SendMsg;
  {$ENDIF}
end;

//==============================================================================================
procedure TfrmColOptions.aHelpExecute(Sender: TObject);
begin
  {$IFNDEF PKG}
  ShowHelpTopic('colOptions');
  {$ENDIF}
end;

//==============================================================================================
procedure TfrmColOptions.grdMainColumnSorting(Sender: TObject; Column: TdxDBTreeListColumn; var Allow: Boolean);
begin
  Allow := False;
end;

//==============================================================================================
procedure TfrmColOptions.chbAllowGroupingPropertiesChange(Sender: TObject);
begin
  FModified := True;
end;

//==============================================================================================
procedure TfrmColOptions.FormCreate(Sender: TObject);
begin
  inherited;

  {$IFNDEF PKG}
  lName.Font.Name := Font_Main.Name;
  lName.Font.Charset := Font_Main.Charset;
  {$ENDIF}
end;

end.
