{$I ok_sklad.inc}
unit fRecycleBin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrame, Menus, ActnList, dxTL6, dxDBCtrl6, dxDBGrid6, dxCntner6,
  DB, DBClient, ssBaseConst, ssClientDataSet, dxDBTLCl6, dxGrClms6, dxEditor6,
  dxExEdtr6, dxDBEdtr6, dxDBTL6, ssMemDS, ssDBGrid, xLngDefs,
  TB2Item, StdCtrls, cxDropDownEdit, ssDBLookupCombo,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxImageComboBox,
  ssSpeedButton, ssBevel, ExtCtrls, cxCalendar, ssLabel;

type
  TfmRecycleBin = class(TssBaseFrame)
    aEmpty: TAction;
    aEmptyAll: TAction;
    aLocateAfterRestore: TAction;
    aRestore: TAction;
    aRestoreAll: TAction;
    aTree: TAction;
    bvlRight: TssBevel;
    bvlTop: TssBevel;
    cdsFunctions: TssClientDataSet;
    cdsUsers: TssClientDataSet;
    cdsUsersFULLNAME: TStringField;
    cdsUsersNAME: TStringField;
    cdsUsersPASS: TStringField;
    cdsUsersSYSNAME: TStringField;
    cdsUsersUSERID: TIntegerField;
    cdsView: TssClientDataSet;
    colClassName: TdxDBGridColumn;
    colDelID: TdxDBGridColumn;
    colFunID: TdxDBGridColumn;
    colGType: TdxDBGridColumn;
    colID: TdxDBGridColumn;
    colImageIndex: TdxDBGridImageColumn;
    colName: TdxDBGridColumn;
    colOnTime: TdxDBGridColumn;
    colRID: TdxDBTreeListColumn;
    colRImageIndex: TdxDBTreeListColumn;
    colROnTime: TdxDBTreeListColumn;
    colTabID: TdxDBGridColumn;
    colTClassName: TdxDBTreeListColumn;
    colTDelID: TdxDBTreeListColumn;
    colTFun: TdxDBTreeListColumn;
    colTFunID: TdxDBTreeListColumn;
    colTGType: TdxDBTreeListColumn;
    colTTabID: TdxDBTreeListColumn;
    colTUserName: TdxDBTreeListColumn;
    colUserName: TdxDBGridColumn;
    edFromDate: TcxDateEdit;
    edToDate: TcxDateEdit;
    grdMain: TssDBGrid;
    grdTree: TdxDBTreeList;
    lcbFunctions: TssDBLookupCombo;
    lcbUsers: TssDBLookupCombo;
    lFromDate: TssLabel;
    lFun: TLabel;
    lToDate: TssLabel;
    lUser: TLabel;
    mdTree: TssMemoryData;
    mdTreeclassname: TStringField;
    mdTreedelid: TIntegerField;
    mdTreefunid: TIntegerField;
    mdTreegtype: TIntegerField;
    mdTreeid: TIntegerField;
    mdTreeimageindex: TIntegerField;
    mdTreename: TStringField;
    mdTreeontime: TDateTimeField;
    mdTreepid: TIntegerField;
    mdTreetabid: TIntegerField;
    mdTreetextstr: TStringField;
    mdTreeusername: TStringField;
    panFilter: TPanel;
    srcFunctions: TDataSource;
    srcTree: TDataSource;
    srcUsers: TDataSource;
    srcView: TDataSource;
    ssBevel2: TssBevel;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;

    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aEmptyAllExecute(Sender: TObject);
    procedure aLocateAfterRestoreExecute(Sender: TObject);
    procedure aRestoreAllExecute(Sender: TObject);
    procedure aRestoreExecute(Sender: TObject);
    procedure aTreeExecute(Sender: TObject);
    procedure aViewExecute(Sender: TObject);
    procedure cdsFunctionsBeforeOpen(DataSet: TDataSet);
    procedure cdsViewAfterOpen(DataSet: TDataSet);
    procedure cdsViewBeforeOpen(DataSet: TDataSet);
    procedure colImageIndexGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure FrameResize(Sender: TObject);
    procedure grdMainClick(Sender: TObject);
    procedure grdMainDblClick(Sender: TObject);
    procedure grdTreeCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure grdTreeGetImageIndex(Sender: TObject; Node: TdxTreeListNode; var Index: Integer);
    procedure grdTreeSelectedCountChange(Sender: TObject);
    procedure lcbFunctionsPropertiesChange(Sender: TObject);
    procedure lcbFunctionsPropertiesEditValueChanged(Sender: TObject);
    procedure lcbUsersPropertiesChange(Sender: TObject);
    procedure lcbUsersPropertiesEditValueChanged(Sender: TObject);

  private
    procedure AdjustFilter;
    procedure AdjustGrids;
    procedure LoadTree;
    procedure RestoreItems(All, ADel: boolean);

  protected
    procedure LocateAfterDel;
    procedure SetCurrentSearchID(const Value: Integer); override;

  public
    procedure DoClose; override;
    procedure DoDelete; override;
    procedure DoHelp; override;
    procedure DoOpen(AParam: Variant); override;
    procedure DoRefresh(const AID: integer; AParam: integer = 0); override;
    procedure DoShow; override;
    procedure NotifyChanged; override;
    procedure SetCaptions; override;
    procedure UpdateActionList; override;
  end;

var
  fmRecycleBin: TfmRecycleBin;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  Registry, ClientData, prFun, prConst, ssFun, ssRegUtils, fMessageDlg, prTypes, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

const
  _ID_ = 'delid';

//==============================================================================================
procedure TfmRecycleBin.DoClose;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.DoClose') else _udebug := nil;{$ENDIF}

  cdsView.Close;

  WriteToRegInt(MainRegKey + '\' + Self.Name, 'ShowInTree', Integer(aTree.Checked));
  WriteToRegInt(MainRegKey + '\' + Self.Name, 'LocateAfterRestore', Integer(aLocateAfterRestore.Checked));

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmRecycleBin.DoDelete;
  var
    FCount: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.DoDelete') else _udebug := nil;{$ENDIF}

  if grdTree.Visible
    then FCount := grdTree.SelectedCount
    else FCount := grdMain.SelectedCount;

  if mrYes <> ssMessageDlg(Format(LangMan.GetRS(Self.Name, 'DelFromBin'), [FCount]),  ssmtWarning, [ssmbYes, ssmbNo])
  then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  RestoreItems(False, True);
  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmRecycleBin.DoOpen(AParam: Variant);
  var
    Tmp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.DoOpen') else _udebug := nil;{$ENDIF}

  CanRefresh := False;
  CurrentSearchID := -1;

  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'LocateAfterRestore', Tmp)
    then aLocateAfterRestore.Checked := (Tmp = 1);

  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'ShowInTree', Tmp) then begin
    aTree.Checked := (Tmp = 1);
    grdTree.Visible := aTree.Checked;
    UpdateActionList;
    AdjustGrids;
  end;

  cdsFunctions.Open;
  cdsUsers.Open;
  cdsView.Open;

  with grdMain do
    if FocusedNode <> nil then FocusedNode.Selected := True;

  colImageIndex.Values.Assign(colImageIndex.ImageIndexes);

  CanRefresh := True;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmRecycleBin.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    Self.Caption := GetRS(Self.Name, 'Title');
    colName.Caption := GetRS(Self.Name, 'Name');
    colOnTime.Caption := GetRS(Self.Name, 'DelTime');
    colImageIndex.Caption := '';

    colTFun.Caption := GetRS(Self.Name, 'Name');
    colROnTime.Caption := GetRS(Self.Name, 'DelTime');
    colUserName.Caption := GetRS(Self.Name, 'UserName');
    colTUserName.Caption := GetRS(Self.Name, 'UserName');
    lFun.Caption := GetRS(Self.Name, 'Fun');
    lUser.Caption := GetRS(Self.Name, 'UserName');

    lFromDate.Caption := GetRS('fmWaybill', 'FromDate');
    lToDate.Caption := GetRS('fmWaybill', 'ToDate');

    aTree.Caption := GetRS(Self.Name, 'ViewInTree');
    aLocateAfterRestore.Caption := GetRS(Self.Name, 'LocateAfterRestore');
    aRestore.Caption := GetRS(Self.Name, 'Restore');
    aRestoreAll.Caption := GetRS(Self.Name, 'RestoreAll');
    aEmptyAll.Caption := GetRS(Self.Name, 'EmptyAll');

    //SendMessage(ParentHandle, WM_SETPARENTCAPTION, integer(@rs_Title), 0);
  end;

  AdjustFilter;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmRecycleBin.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.UpdateActionList') else _udebug := nil;{$ENDIF}

  aNew.Enabled := False;
  aPatternInsert.Enabled := False;
  aProperties.Enabled := False;
  aDel.Enabled := (grdMain.SelectedCount > 0) or (grdTree.SelectedCount > 0);
  aEmptyAll.Enabled := not cdsView.IsEmpty;
  aRestoreAll.Enabled := not cdsView.IsEmpty;
  aRestore.Enabled := aDel.Enabled;
  aDynamic.Enabled := False;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmRecycleBin.DoRefresh(const AID: integer; AParam: integer = 0);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.DoRefresh') else _udebug := nil;{$ENDIF}

  DSRefresh(cdsView, _ID_, AID);

  with grdMain do begin
    ClearSelection;

    if FocusedNode <> nil then FocusedNode.Selected := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmRecycleBin.cdsViewBeforeOpen(DataSet: TDataSet);
  var
    M: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.cdsViewBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsView.Params.ParamByName('shortname').AsString := LangName;
  case ViewType of
    vtRefs: M := ' and utv.pid in (8, 50)';
    vtDocs: M := ' and utv.pid in (45, 31, 21, 32, 55, 106)';
    vtWMat: M := ' and f.funid in (53, 44, 41, 36)';
    else M := '';
  end;

  if UserID > 0 then M := M + ' and u.userid=' + IntToStr(UserID);

  if lcbFunctions.EmptyValue <> lcbFunctions.KeyValue
    then M := M + ' and f.funid=' + IntToStr(lcbFunctions.KeyValue);

  if lcbUsers.EmptyValue <> lcbUsers.KeyValue
    then M := M + ' and rb.userid=' + IntToStr(lcbUsers.KeyValue);

  cdsView.Macros.ParamByName('m').AsString := M;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmRecycleBin.colImageIndexGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.colImageIndexGetText') else _udebug := nil;{$ENDIF}

  AText := ANode.Values[colImageIndex.Index];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmRecycleBin.aRestoreExecute(Sender: TObject);
  var
    FCount: Integer;
    CanLocate: Boolean;
    FID, FGType: Integer;
    FClassName: string;
    FTabID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.aRestoreExecute') else _udebug := nil;{$ENDIF}

  if grdTree.Visible
    then FCount := grdTree.SelectedCount
    else FCount := grdMain.SelectedCount;

  if ssMessageDlg(Format(LangMan.GetRS(Self.Name, 'RestoreFromBin'), [FCount]), ssmtWarning, [ssmbYes, ssmbNo]) <> mrYes
  then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  FID := -1;
  FGType := -1;
  FTabID := -1;

  CanLocate := False;

  if aTree.Checked and (grdTree.SelectedCount = 1) then begin
    CanLocate := aLocateAfterRestore.Checked;
    FID := grdTree.SelectedNodes[0].Values[colTDelID.Index];
    FTabID := grdTree.SelectedNodes[0].Values[colTTabID.Index];
    FClassName := grdTree.SelectedNodes[0].Values[colTClassName.Index];
    
    if not VarIsNull(grdTree.SelectedNodes[0].Values[colTGType.Index])
      then FGType := grdTree.SelectedNodes[0].Values[colTGType.Index]
      else FGType := 0;
        
  end 
  else if not aTree.Checked and (grdMain.SelectedCount = 1) then begin
    CanLocate := aLocateAfterRestore.Checked;
    FID := grdMain.SelectedNodes[0].Values[colDelID.Index];
    FTabID := grdMain.SelectedNodes[0].Values[colTabID.Index];
    FClassName := grdMain.SelectedNodes[0].Values[colClassName.Index];
    
    if not VarIsNull(grdMain.SelectedNodes[0].Values[colGType.Index])
      then FGType := grdMain.SelectedNodes[0].Values[colGType.Index]
      else FGType := 0;
  end;

  RestoreItems(False, False);

  if CanLocate then begin
    if FTabID = 24 then begin
      with newDataSet do
      try
        ProviderName := 'pWaybill_Get';
        FetchParams;
        Params.ParamByName('wbillid').AsInteger := FID;
        Open;
        FID := FieldByName('docid').AsInteger;
        Close;

      finally
        Free;
      end;
    end;

    frmMainForm.ExecLocate(Self.ViewType, FClassName, FID, FGType);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmRecycleBin.aRestoreAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.aRestoreAllExecute') else _udebug := nil;{$ENDIF}

  if mrYes <> ssMessageDlg(LangMan.GetRS(Self.Name, 'RestoreAllFromBin'), ssmtWarning, [ssmbYes, ssmbNo])
  then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  RestoreItems(True, False);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmRecycleBin.aEmptyAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.aEmptyAllExecute') else _udebug := nil;{$ENDIF}

  if mrYes <> ssMessageDlg(LangMan.GetRS(Self.Name, 'DeleteAllFromBin'), ssmtWarning, [ssmbYes, ssmbNo])
  then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  RestoreItems(True, True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmRecycleBin.grdMainClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.grdMainClick') else _udebug := nil;{$ENDIF}

  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmRecycleBin.LoadTree;
  var
    FID: Integer;
    BM: TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.LoadTree') else _udebug := nil;{$ENDIF}

  BM := cdsView.GetBookmark;
  cdsView.DisableControls;
  FID := 0;

  with mdTree do try
    if Active then FID := mdTree.FieldByName('id').AsInteger;

    Close;
    Open;
    cdsView.First;

    while not cdsView.Eof do begin
      if not Locate('id', -cdsView.fieldbyname('funid').AsInteger, []) then begin
        cdsFunc.Locate('funid', cdsView.fieldbyname('funid').AsInteger, []);

        Append;
        FieldByName('id').AsInteger := -cdsView.fieldbyname('funid').AsInteger;
        FieldByName('pid').AsInteger := -cdsView.fieldbyname('funid').AsInteger;
        FieldByName('textstr').AsString := cdsView.fieldbyname('name').AsString;
        FieldByName('funid').AsInteger := cdsView.fieldbyname('funid').AsInteger;
        FieldByName('tabid').AsInteger := cdsFunc.fieldbyname('tabid').AsInteger;
        FieldByName('imageindex').AsInteger := cdsView.fieldbyname('imageindex').AsInteger;
        Post;
      end;

      Append;
      FieldByName('id').AsInteger := cdsView.fieldbyname('id').AsInteger;
      FieldByName('pid').AsInteger := -cdsView.fieldbyname('funid').AsInteger;
      FieldByName('textstr').AsString := cdsView.fieldbyname('textstr').AsString;
      FieldByName('funid').AsInteger := cdsView.fieldbyname('funid').AsInteger;
      FieldByName('tabid').AsInteger := cdsView.fieldbyname('tabid').AsInteger;
      FieldByName('delid').AsInteger := cdsView.fieldbyname('delid').AsInteger;
      FieldByName('gtype').AsInteger := cdsView.fieldbyname('gtype').AsInteger;
      FieldByName('ontime').AsDateTime := cdsView.fieldbyname('ontime').AsDateTime;
      FieldByName('imageindex').AsInteger := cdsView.fieldbyname('imageindex').AsInteger;
      FieldByName('classname').AsString := cdsView.fieldbyname('classname').AsString;
      FieldByName('username').AsString := cdsView.fieldbyname('username').AsString;
      Post;

      cdsView.Next;
    end;

    Locate('id', FID, []);

  finally
    cdsView.GotoBookmark(BM);
    cdsView.FreeBookmark(BM);
    cdsView.EnableControls;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmRecycleBin.cdsViewAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.cdsViewAfterOpen') else _udebug := nil;{$ENDIF}

  LoadTree;
  AdjustGrids;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmRecycleBin.aViewExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.aViewExecute') else _udebug := nil;{$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmRecycleBin.aTreeExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.aTreeExecute') else _udebug := nil;{$ENDIF}

  aTree.Checked := not aTree.Checked;
  grdTree.Visible := aTree.Checked;
  UpdateActionList;
  AdjustGrids;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmRecycleBin.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.ActionListUpdate') else _udebug := nil;{$ENDIF}

  inherited;

  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmRecycleBin.grdTreeCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.grdTreeCustomDrawCell') else _udebug := nil;{$ENDIF}

  if UseGridOddColor and not ASelected and Odd(ANode.AbsoluteIndex)
    then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmRecycleBin.AdjustGrids;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.AdjustGrids') else _udebug := nil;{$ENDIF}

  AdjustGrid(grdTree, colTFun);
  AdjustGrid(grdMain, colName);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmRecycleBin.FrameResize(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.FrameResize') else _udebug := nil;{$ENDIF}

  inherited;
  AdjustGrids;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmRecycleBin.grdTreeSelectedCountChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.grdTreeSelectedCountChange') else _udebug := nil;{$ENDIF}

  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmRecycleBin.grdMainDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.grdMainDblClick') else _udebug := nil;{$ENDIF}

  aRestore.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmRecycleBin.aLocateAfterRestoreExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.aLocateAfterRestoreExecute') else _udebug := nil;{$ENDIF}

  aLocateAfterRestore.Checked := not aLocateAfterRestore.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmRecycleBin.grdTreeGetImageIndex(Sender: TObject; Node: TdxTreeListNode; var Index: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.grdTreeGetImageIndex') else _udebug := nil;{$ENDIF}

  if Node.Level = 1 then
    case Node.Values[colRImageIndex.Index] of
      II_AccOut:    Index := II_AccOutDis;
      II_WBIN:      Index := II_WBINDis;
      II_WBOUT:     Index := II_WBOUTDis;
      II_TaxWB:     Index := II_TaxWBDis;
      II_PDIN:      Index := II_PDINDis;
      II_PDOUT:     Index := II_PDOUTDis;
      II_PDCHARGE:  Index := II_PDCHARGEDis;
      II_CONTRIN:   Index := II_CONTRINDis;
      II_CONTROUT:  Index := II_CONTROUTDis;

      II_WBREST:    Index := II_WBRESTDis;
      II_INVENTORY: Index := II_INVENTORYDis;

      II_MAT:       Index := II_MATDis;
      II_KA:        Index := II_KADis;
      II_WH:        Index := II_WHDis;
      II_MEASURES:  Index := II_MEASURESDis;
      II_CURRENCY:  Index := II_CURRENCYDis;
      II_COUNTRIES: Index := II_COUNTRIESDis;
      II_PRICETYPES:Index := II_PRICETYPESDis;
      II_BANKS:     Index := II_BANKSDis;
      II_ACCTYPE:   Index := II_ACCTYPEDis;
      II_ORDERIN:   Index := II_ORDERINDis;
      II_ORDEROUT:  Index := II_ORDEROUTDis;

      else Index := Node.Values[colRImageIndex.Index];
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmRecycleBin.cdsFunctionsBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.cdsFunctionsBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsFunctions.Params.ParamByName('shortname').AsString := LangName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmRecycleBin.lcbFunctionsPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.lcbFunctionsPropertiesChange') else _udebug := nil;{$ENDIF}

  if lcbFunctions.Text = '' then lcbFunctions.ItemIndex := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmRecycleBin.lcbUsersPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.lcbUsersPropertiesChange') else _udebug := nil;{$ENDIF}

  if lcbUsers.Text = '' then lcbUsers.ItemIndex := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmRecycleBin.AdjustFilter;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.AdjustFilter') else _udebug := nil;{$ENDIF}

  lcbUsers.Left := panFilter.Width - lcbUsers.Width - 6;
  lUser.Left := lcbUsers.Left - lUser.Width - 4;
  lcbFunctions.Width := lUser.Left - lcbFunctions.Left - 6;
  lcbFunctions.Anchors := lcbFunctions.Anchors + [akRight];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmRecycleBin.DoShow;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.DoShow') else _udebug := nil;{$ENDIF}

  inherited;

  AdjustFilter;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmRecycleBin.lcbFunctionsPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.lcbFunctionsPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if CanRefresh then DoRefresh(0);
  lcbFunctions.SelStart := 0;
  lcbFunctions.SelLength := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmRecycleBin.lcbUsersPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.lcbUsersPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if CanRefresh then DoRefresh(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmRecycleBin.SetCurrentSearchID(const Value: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.SetCurrentSearchID') else _udebug := nil;{$ENDIF}

  inherited SetCurrentSearchID(-1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmRecycleBin.NotifyChanged;
  // {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.NotifyChanged') else _udebug := nil;{$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmRecycleBin.DoHelp;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.DoHelp') else _udebug := nil;{$ENDIF}

  ShowHelpTopic('Title');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmRecycleBin.LocateAfterDel;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.LocateAfterDel') else _udebug := nil;{$ENDIF}

  with grdMain do
    if SelectedCount > 1 then begin
      cdsView.First;
    end
    else if cdsView.RecordCount > 1 then
      if (FocusedNode.Index = Count - 1) and (FocusedNode.Index > 0)
        then cdsView.Locate(_ID_, FocusedNode.GetPrev.Values[ColumnByFieldName(KeyField).Index], [])
        else cdsView.Locate(_ID_, FocusedNode.GetNext.Values[ColumnByFieldName(KeyField).Index], []);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmRecycleBin.RestoreItems(All, ADel: boolean);
  var
    i: Integer;
    FTableName: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmRecycleBin.RestoreItems') else _udebug := nil;{$ENDIF}

  //{$I ASPROTECT\reg_crypt_begin.inc}
  Application.ProcessMessages;
  cdsView.DisableControls;

  with newDataSet do try

    if not aTree.Checked then begin
      if not All then begin
        for i := 0 to grdMain.SelectedCount - 1 do
          if cdsFunc.Locate('tabid', grdMain.SelectedNodes[i].Values[colTabID.Index], [])
          then begin
            TrStart;

            try
              if ADel then begin
                if cdsFunc.FieldByName('funid').AsInteger = 37 then begin
                  ProviderName := 'pPL_GetTable';
                  FetchParams;
                  Params.ParamByName('plid').AsInteger := grdMain.SelectedNodes[i].Values[colDelID.Index];
                  Open;
                  FTableName := Fields[0].AsString;
                  Close;

                  ProviderName := 'pTable_Exists';
                  FetchParams;
                  Params.ParamByName('TableName').AsString := FTableName;
                  Open;
                  if not IsEmpty then begin
                    //Удаление таблицы PL_X
                    Close;
                    ProviderName := 'pPL_X_Drop';
                    FetchMacros;
                    Macros.ParamByName('m').AsString := FTableName;
                    Execute;
                  end
                  else Close;

                  if not DeleteDataEx(dmData.SConnection, cdsFunc.fieldbyname('tablename').AsString,
                                     cdsFunc.fieldbyname('keyname').AsString, grdMain.SelectedNodes[i].Values[colDelID.Index])
                  then raise Exception.Create(rs('common','DeleteError'));

                end // if cdsFunc.FieldByName('funid').AsInteger = 37
                else begin
                  if not DeleteDataEx(dmData.SConnection, cdsFunc.fieldbyname('tablename').AsString,
                                      cdsFunc.fieldbyname('keyname').AsString, grdMain.SelectedNodes[i].Values[colDelID.Index])
                  then raise Exception.Create(rs('common','DeleteError'));
                end;

                ProviderName := 'pRBin_Del';
                FetchParams;
                Params.ParamByName('delid').AsInteger := grdMain.SelectedNodes[i].Values[colDelID.Index];
                Params.ParamByName('tabid').AsInteger := cdsFunc.fieldbyname('tabid').AsInteger;
                Execute;
                frmMainForm.ExecRefresh(grdMain.SelectedNodes[i].Values[colClassName.Index], 0);
              end // if ADel
              else begin
                //if Integer(grdMain.SelectedNodes[i].Values[colFunID.Index]) in [36] then Continue;
                ProviderName := 'pRBin_ResetDeleted';
                FetchParams;
                FetchMacros;
                Params.ParamByName('id').AsInteger := grdMain.SelectedNodes[i].Values[colDelID.Index];
                Macros.ParamByName('tablename').AsString := cdsFunc.fieldbyname('tablename').AsString;
                Macros.ParamByName('keyname').AsString := cdsFunc.fieldbyname('keyname').AsString;
                Execute;
  
                {$IFDEF CBL}
                if Integer(grdMain.SelectedNodes[i].Values[colFunID.Index]) = 21 then begin
                  ProviderName := 'pWMatTurn_Ins_Cbl';
                  FetchParams;
                  Params.ParamByName('WBILLID').AsInteger := grdMain.SelectedNodes[i].Values[colDelID.Index];
                  Params.ParamByName('wtype').AsInteger := 3;
                  Execute;
                end;
                {$ENDIF}
  
                if Integer(grdMain.SelectedNodes[i].Values[colFunID.Index]) = 65 then begin
                  ProviderName := 'pWMatTurn_Ins_Cbl';
                  FetchParams;
                  Params.ParamByName('WBILLID').AsInteger := grdMain.SelectedNodes[i].Values[colDelID.Index];
                  Params.ParamByName('wtype').AsInteger := 3;
                  Execute;
                end;

                ProviderName := 'pRBin_Del';
                FetchParams;
                Params.ParamByName('delid').AsInteger := grdMain.SelectedNodes[i].Values[colDelID.Index];
                Params.ParamByName('tabid').AsInteger := grdMain.SelectedNodes[i].Values[colTabID.Index];
                Execute;
                frmMainForm.ExecRefresh(grdMain.SelectedNodes[i].Values[colClassName.Index], 0);
                //SendMessage(ParentHandle, WM_RESTOREFROMBIN, cdsFunc.fieldbyname('funid').AsInteger, 0);
              end; // if ADel else

              TrCommit;

            except
              TrRollback;
              raise;
            end;
          end; // if cdsFunc.Locate('tabid', grdMain.SelectedNodes[i].Values[colTabID.Index], [])
      end // if not All
      else begin
        cdsView.First;

        while not cdsView.Eof do begin
          if cdsFunc.Locate('funid', cdsView.fieldbyname('funid').AsInteger, []) then begin
            TrStart;

            try
              if ADel then begin
                if cdsFunc.FieldByName('funid').AsInteger = 37
                then begin
                  ProviderName := 'pPL_GetTable';
                  FetchParams;
                  Params.ParamByName('plid').AsInteger := cdsView.fieldbyname('delid').AsInteger;
                  Open;
                  FTableName := Fields[0].AsString;
                  Close;                                  
                  
                  ProviderName := 'pTable_Exists';
                  FetchParams;
                  Params.ParamByName('TableName').AsString := FTableName;
                  Open;
   
                  if not IsEmpty then begin
                    //Удаление таблицы PL_X
                    Close;
                    ProviderName := 'pPL_X_Drop';
                    FetchMacros;
                    Macros.ParamByName('m').AsString := FTableName;
                    Execute;
                  end
                  else Close;
   
                  if not DeleteDataEx(dmData.SConnection,
                      cdsFunc.fieldbyname('tablename').AsString,
                      cdsFunc.fieldbyname('keyname').AsString,
                      cdsView.fieldbyname('delid').AsInteger)
                  then raise Exception.Create(rs('common','DeleteError'));
                end // if cdsFunc.FieldByName('funid').AsInteger = 37
                else begin
                  if not DeleteDataEx(dmData.SConnection, cdsFunc.fieldbyname('tablename').AsString, cdsFunc.fieldbyname('keyname').AsString, cdsView.fieldbyname('delid').AsInteger)
                    then raise Exception.Create(rs('common','DeleteError'));
                end;   
                
                ProviderName := 'pRBin_Del';
                FetchParams;
                Params.ParamByName('delid').AsInteger := cdsView.fieldbyname('delid').AsInteger;
                Params.ParamByName('tabid').AsInteger := cdsFunc.fieldbyname('tabid').AsInteger;
                Execute;
                frmMainForm.ExecRefresh(cdsView.FieldByName('classname').AsString, 0);
              end // if ADel
              else begin
                //if cdsView.FieldByName('funid').AsInteger in [36] then Continue;
                ProviderName := 'pRBin_ResetDeleted';
                FetchParams;
                FetchMacros;
                Params.ParamByName('id').AsInteger := cdsView.fieldbyname('delid').AsInteger;
                Macros.ParamByName('tablename').AsString := cdsFunc.fieldbyname('tablename').AsString;
                Macros.ParamByName('keyname').AsString := cdsFunc.fieldbyname('keyname').AsString;
                Execute;
   
                {$IFDEF CBL}
                if cdsView.FieldByName('funid').AsInteger = 21 then begin
                  ProviderName := 'pWMatTurn_Ins_Cbl';
                  FetchParams;
                  Params.ParamByName('WBILLID').AsInteger := cdsView.fieldbyname('delid').AsInteger;
                  Params.ParamByName('wtype').AsInteger := 3;
                  Execute;
                end;
                {$ENDIF}
   
                if cdsView.FieldByName('funid').AsInteger = 65 then begin
                  ProviderName := 'pWMatTurn_Ins_Cbl';
                  FetchParams;
                  Params.ParamByName('WBILLID').AsInteger := cdsView.fieldbyname('delid').AsInteger;
                  Params.ParamByName('wtype').AsInteger := 3;
                  Execute;
                end;
   
                ProviderName := 'pRBin_Del';
                FetchParams;
                Params.ParamByName('delid').AsInteger := cdsView.fieldbyname('delid').AsInteger;
                Params.ParamByName('tabid').AsInteger := cdsView.fieldbyname('tabid').AsInteger;
                Execute;
                //frmMainForm.ExecRefresh(grdMain.SelectedNodes[i].Values[colClassName.Index], 0);
              end; // if ADel else
  
              TrCommit;
  
            except
              TrRollback;
              raise;
            end;
          end; // if cdsFunc.Locate('funid', cdsView.fieldbyname('funid').AsInteger, [])

          cdsView.Next;
        end; // while not cdsView.Eof
      end; // if not All else
    end // if not aTree.Checked
    else begin
      if not All then begin
        for i := 0 to grdTree.SelectedCount-1 do
          if (grdTree.SelectedNodes[i].Values[colRID.Index] > 0)
             and cdsFunc.Locate('tabid', grdTree.SelectedNodes[i].Values[colTTabID.Index], [])
          then begin
            TrStart;

            try
              if ADel then begin
                if cdsFunc.FieldByName('funid').AsInteger = 37 then begin
                  ProviderName := 'pPL_GetTable';
                  FetchParams;
                  Params.ParamByName('plid').AsInteger := grdTree.SelectedNodes[i].Values[colTDelID.Index];
                  Open;
                  FTableName := Fields[0].AsString;
                  Close;

                  ProviderName := 'pTable_Exists';
                  FetchParams;
                  Params.ParamByName('TableName').AsString := FTableName;
                  Open;
                  if not IsEmpty then begin
                    //Удаление таблицы PL_X
                    Close;
                    ProviderName := 'pPL_X_Drop';
                    FetchMacros;
                    Macros.ParamByName('m').AsString := FTableName;
                    Execute;
                  end
                  else Close;
                 
                  if not DeleteDataEx(dmData.SConnection,
                    cdsFunc.fieldbyname('tablename').AsString,
                    cdsFunc.fieldbyname('keyname').AsString,
                    grdTree.SelectedNodes[i].Values[colTDelID.Index])
                    then raise Exception.Create(rs('common','DeleteError'));
                end // if cdsFunc.FieldByName('funid').AsInteger = 37
                else begin
                  if not DeleteDataEx(dmData.SConnection, cdsFunc.fieldbyname('tablename').AsString,
                                      cdsFunc.fieldbyname('keyname').AsString, grdTree.SelectedNodes[i].Values[colTDelID.Index])
                    then raise Exception.Create(rs('common','DeleteError'));
                end;

                ProviderName := 'pRBin_Del';
                FetchParams;
                Params.ParamByName('delid').AsInteger := grdTree.SelectedNodes[i].Values[colTDelID.Index];
                Params.ParamByName('tabid').AsInteger := cdsFunc.fieldbyname('tabid').AsInteger;
                Execute;
                frmMainForm.ExecRefresh(grdTree.SelectedNodes[i].Values[colTClassName.Index], 0);
              end // if ADel
              else begin
                //if Integer(grdTree.SelectedNodes[i].Values[colTFunID.Index]) in [36] then Continue;
                ProviderName := 'pRBin_ResetDeleted';
                FetchParams;
                FetchMacros;
                Params.ParamByName('id').AsInteger := grdTree.SelectedNodes[i].Values[colTDelID.Index];
                Macros.ParamByName('tablename').AsString := cdsFunc.fieldbyname('tablename').AsString;
                Macros.ParamByName('keyname').AsString := cdsFunc.fieldbyname('keyname').AsString;
                Execute;

                {$IFDEF CBL}
                if Integer(grdTree.SelectedNodes[i].Values[colTFunID.Index]) = 21 then begin
                  ProviderName := 'pWMatTurn_Ins_Cbl';
                  FetchParams;
                  Params.ParamByName('WBILLID').AsInteger := grdTree.SelectedNodes[i].Values[colTDelID.Index];
                  Params.ParamByName('wtype').AsInteger := 3;
                  Execute;
                end;
                {$ENDIF}

                if Integer(grdTree.SelectedNodes[i].Values[colTFunID.Index]) = 65 then begin
                  ProviderName := 'pWMatTurn_Ins_Cbl';
                  FetchParams;
                  Params.ParamByName('WBILLID').AsInteger := grdTree.SelectedNodes[i].Values[colTDelID.Index];
                  Params.ParamByName('wtype').AsInteger := 3;
                  Execute;
                end;

                ProviderName := 'pRBin_Del';
                FetchParams;
                Params.ParamByName('delid').AsInteger := grdTree.SelectedNodes[i].Values[colTDelID.Index];
                Params.ParamByName('tabid').AsInteger := grdTree.SelectedNodes[i].Values[colTTabID.Index];
                Execute;
                frmMainForm.ExecRefresh(grdTree.SelectedNodes[i].Values[colTClassName.Index], 0);
                //SendMessage(ParentHandle, WM_RESTOREFROMBIN, cdsFunc.fieldbyname('funid').AsInteger, 0);
              end;

              TrCommit;

            except
              TrRollback;
              raise;
            end;
        end;
      end
      else begin
       cdsView.First;

       while not cdsView.Eof do begin
        if cdsFunc.Locate('funid', cdsView.fieldbyname('funid').AsInteger, []) then begin
          TrStart;

          try
            if ADel then begin
              if cdsFunc.FieldByName('funid').AsInteger = 37 then begin
                ProviderName := 'pPL_GetTable';
                FetchParams;
                Params.ParamByName('plid').AsInteger := cdsView.fieldbyname('delid').AsInteger;
                Open;
                FTableName := Fields[0].AsString;
                Close;

                ProviderName := 'pTable_Exists';
                FetchParams;
                Params.ParamByName('TableName').AsString := FTableName;
                Open;
                if not IsEmpty then begin
                  //Удаление таблицы PL_X
                  Close;
                  ProviderName := 'pPL_X_Drop';
                  FetchMacros;
                  Macros.ParamByName('m').AsString := FTableName;
                  Execute;
                end
                else Close;

                if not DeleteDataEx(dmData.SConnection, cdsFunc.fieldbyname('tablename').AsString,
                                    cdsFunc.fieldbyname('keyname').AsString, cdsView.fieldbyname('delid').AsInteger)
                then raise Exception.Create(rs('common','DeleteError'));
              end
              else begin
                if not DeleteDataEx(dmData.SConnection, cdsFunc.fieldbyname('tablename').AsString, cdsFunc.fieldbyname('keyname').AsString,
                                    cdsView.fieldbyname('delid').AsInteger)
                  then raise Exception.Create(rs('common','DeleteError'));
              end;

              ProviderName := 'pRBin_Del';
              FetchParams;
              Params.ParamByName('delid').AsInteger := cdsView.fieldbyname('delid').AsInteger;
              Params.ParamByName('tabid').AsInteger := cdsFunc.fieldbyname('tabid').AsInteger;
              Execute;
            end // if ADEl
            else begin
              //if cdsView.FieldByName('funid').AsInteger in [36] then Continue;
              ProviderName := 'pRBin_ResetDeleted';
              FetchParams;
              FetchMacros;
              Params.ParamByName('id').AsInteger := cdsView.fieldbyname('delid').AsInteger;
              Macros.ParamByName('tablename').AsString := cdsFunc.fieldbyname('tablename').AsString;
              Macros.ParamByName('keyname').AsString := cdsFunc.fieldbyname('keyname').AsString;
              Execute;

              {$IFDEF CBL}
              if cdsView.FieldByName('funid').AsInteger = 21 then begin
                ProviderName := 'pWMatTurn_Ins_Cbl';
                FetchParams;
                Params.ParamByName('WBILLID').AsInteger := cdsView.fieldbyname('delid').AsInteger;
                Params.ParamByName('wtype').AsInteger := 3;
                Execute;
              end;
              {$ENDIF}

              if cdsView.FieldByName('funid').AsInteger = 65 then begin
                ProviderName := 'pWMatTurn_Ins_Cbl';
                FetchParams;
                Params.ParamByName('WBILLID').AsInteger := cdsView.fieldbyname('delid').AsInteger;
                Params.ParamByName('wtype').AsInteger := 3;
                Execute;
              end;

              ProviderName := 'pRBin_Del';
              FetchParams;
              Params.ParamByName('delid').AsInteger := cdsView.fieldbyname('delid').AsInteger;
              Params.ParamByName('tabid').AsInteger := cdsView.fieldbyname('tabid').AsInteger;
              Execute;
              SendMessage(ParentHandle, WM_RESTOREFROMBIN, cdsFunc.fieldbyname('funid').AsInteger, 0);
            end;

            TrCommit;

          except
            TrRollback;
            raise;
          end;
        end;

        cdsView.Next;
       end;
      end;
     end; // if not aTree.Checked else

     LocateAfterDel;
     aRefresh.Execute;

   finally
     Free;
     cdsView.EnableControls;
   end; // with newDataSet do try
   UpdateActionList;

  //{$I ASPROTECT\reg_crypt_end.inc}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fRecycleBin', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
