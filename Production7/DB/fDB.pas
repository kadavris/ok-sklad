{$I ok_sklad.inc}
unit fDB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrame, Menus, ActnList, dxTL6, dxDBCtrl6, dxDBGrid6, dxCntner6,
  DB, DBClient, ssBaseConst, ssBaseTypes, EditDB,
  ssClientDataSet, dxDBTLCl6, dxGrClms6, ssBevel, TB2Item, Grids, DBGrids;

type
  TfmDB = class(TssBaseFrame)
    aReconnect: TAction;
    cdsMain: TssClientDataSet;
    cdsParams: TssClientDataSet;
    colDef: TdxDBGridColumn;
    colID: TdxDBGridColumn;
    colImg: TdxDBGridImageColumn;
    colName: TdxDBGridColumn;
    colPath: TdxDBGridColumn;
    grdMain: TdxDBGrid;
    srcMain: TDataSource;
    ssBevel12: TssBevel;
    ssBevel3: TssBevel;
    ssBevel8: TssBevel;
    ssBevel9: TssBevel;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    colCurrent: TdxDBGridCheckColumn;

    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aReconnectExecute(Sender: TObject);
    procedure cdsMainAfterOpen(DataSet: TDataSet);
    procedure cdsMainBeforeOpen(DataSet: TDataSet);
    procedure colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPathGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure grdMainDblClick(Sender: TObject);
    procedure grdMainKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure srcMainDataChange(Sender: TObject; Field: TField);
    procedure colCurrentGetText(Sender: TObject; ANode: TdxTreeListNode;
      var AText: String);

  private
    FInfo: TDBInfo;
    FDBID: Integer;
    limited: Boolean;

  protected
    function  GetIDForUpdate: integer; override;
    procedure SetCurrentID(const Value: integer); override;
    procedure LocateAfterDel;

  public
    procedure DoOpen(AParam: Variant); override;
    procedure DoClose; override;
    procedure DoDelete; override;
    procedure DoRefresh(const AID: integer; AParam: integer = 0); override;
    procedure SetCaptions; override;
    procedure DoFind(const AFName, AStr: string; ALocateType: TLocateType; AFwd: Boolean = True); override;
    procedure DoExcel(Grid: TdxDBGrid); override;
    procedure DoShow; override;
    procedure UpdateActionList; override;
    procedure NotifyChanged; override;
  end;

var
  fmDB: TfmDB;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  ClientData, prFun, prConst, ssFun, StrUtils,
  Export, prTypes, ssCallbackConst, fMessageDlg, Login, Main, CCMain, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

const
  _ID_ = 'dbid';

//==============================================================================================
procedure TfmDB.DoClose;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDB.DoClose') else _udebug := nil;{$ENDIF}

  cdsMain.Close;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDB.DoDelete;
  var
    id_: integer;
    ResetDef: boolean;
    FDelDBFile: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDB.DoDelete') else _udebug := nil;{$ENDIF}

  try //finally
    case ssMessageDlg(LangMan.GetRS(Self.Name, 'DelDBFile'), ssmtWarning, [ssmbYes, ssmbNo]) of
      mrYes: FDelDBFile := 1;
      //mrNo: FDelDBFile := 0
      else Exit;
    end;

    if (cdsMain.FieldByName(_ID_).AsInteger = dmData.SConnection.DBID)
       or ((cdsMain.FieldByName(_ID_).AsInteger = FDBID) and (dmData.SConnection.DBID = -1))
    then begin
      ssMessageDlg(LangMan.GetRS(Self.Name, 'DBDeleteError'), ssmtError, [ssmbOk]);
      Exit;
    end;

    Application.ProcessMessages;

    if dmData.SConnection.AppServer.DropDB(cdsMain.FieldByName(_ID_).AsInteger, FDelDBFile) <> 0
    then begin
      ssMessageDlg(LangMan.GetRS('Common', 'DeleteError'), ssmtError, [ssmbOk]);
      Exit;
    end;

    LocateAfterDel;
    aRefresh.Execute;
    UpdateActionList;

    inherited;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure TfmDB.DoOpen(AParam: Variant);
  var
    i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDB.DoOpen') else _udebug := nil;{$ENDIF}

  RefType := rtAccountType;
  EditingClass := TfrmEditDB;
  cdsParams.Open;
  cdsMain.Open;
  cdsMain.Close;
  cdsMain.Open;

  if cdsMain.Locate('def', 1, []) and (dmData.SConnection.DBID = -1)
    then FDBID := cdsMain.FieldByName('dbid').AsInteger
    else FDBID := -1;

  inherited;

  if not LoadExpParams
    then with ExportList do
      for i := 0 to grdMain.VisibleColumnCount - 1 do
        AddObject(grdMain.VisibleColumns[i].Name, pointer(1));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDB.SetCaptions;
  var
    FTitle: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDB.SetCaptions') else _udebug := nil;{$ENDIF}

  with dmData.Lng do begin
    Self.Caption := GetRS(Self.Name, 'Title');
    FTitle := Self.Caption;
    colName.Caption := GetRS(Self.Name, 'Name');
    colPath.Caption := GetRS(Self.Name, 'Path');
    aReconnect.Caption := GetRS(Self.Name, 'Reconnect');

    SendMessage(ParentHandle, WM_SETPARENTCAPTION, integer(@FTitle), 0);

    FindList.Clear;
    FindList.AddObject(GetRS(Self.Name, 'NameD') + ';' + 'name', pointer(1));
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDB.grdMainDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDB.grdMainDblClick') else _udebug := nil;{$ENDIF}

  with grdMain do
    if Count > 0 then begin
     if ModalView
       then SendMessage(ParentHandle, WM_SELECTITEM, 0, 0)
       else DoProperties;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDB.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDB.UpdateActionList') else _udebug := nil;{$ENDIF}

  aNew.Enabled := not limited;
  aPatternInsert.Enabled := False;
  aProperties.Enabled := not cdsMain.IsEmpty;
  aDel.Enabled := aProperties.Enabled;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDB.DoRefresh(const AID: integer; AParam: integer = 0);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDB.DoRefresh') else _udebug := nil;{$ENDIF}

  DSRefresh(cdsMain, _ID_, AID);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmDB.GetIDForUpdate: integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDB.GetIDForUpdate') else _udebug := nil;{$ENDIF}

  with FInfo do begin
    DBID := cdsMain.fieldbyname(_ID_).AsInteger;
    Def := cdsMain.fieldbyname('def').AsInteger;
    DBName := cdsMain.fieldbyname('desc').AsString;

    if cdsParams.Locate('dbid;parname', VarArrayOf([DBID, 'Data Source']), [])
      then DBPath := cdsParams.fieldbyname('parvalue').AsString;
  end;

  Result := Integer(@FInfo);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDB.grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont;  var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDB.grdMainCustomDrawCell') else _udebug := nil;{$ENDIF}

  if (ANode.Values[colDef.Index] = 1) and not ASelected
    then AFont.Color := DefaultColor;

  if (ANode.Values[colID.Index] = dmdata.SConnection.DBID) and not ASelected
    then AFont.Color := clRed
  else if UseGridOddColor and not ASelected and Odd(ANode.AbsoluteIndex)
    then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDB.DoFind(const AFName, AStr: string; ALocateType: TLocateType; AFwd: Boolean = True);
 var
   FNode: TdxTreeListNode;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDB.DoFind') else _udebug := nil;{$ENDIF}

   inherited;

   if FindStr <> AStr then FindIndex := -1;
   FindStr := AStr;
   if AStr = '' then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

   FNode := FindNode(grdMain, AFName, AStr, ALocateType, FindIndex, AFwd);

   if FNode <> nil then begin
     FindIndex := FNode.Index;
     cdsMain.Locate(_ID_, FNode.Values[colID.Index], []);
   end
   else ssMessageDlg(rs('common','FindError') + ',' + #13#10 + rs('common','DSEnd'), ssmtInformation, [ssmbOk]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDB.DoExcel(Grid: TdxDBGrid);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDB.DoExcel') else _udebug := nil;{$ENDIF}

  inherited;

  with TfrmExport.Create(nil) do
    try
      if cdsFunc.Locate('classname', Self.ClassName, [])
        then FunID := cdsFunc.fieldbyname('funid').AsInteger
        else FunID := 0;

       if Grid = nil
         then grdExp := Self.grdMain
         else grdExp := Grid;

      lName.Caption := Self.Caption;
      FList := ExportList;

      if ShowModal <> mrOk then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

    finally
      Free;
    end;

  if Grid = nil
    then ExportToExcel(grdMain, ExportList)
    else ExportToExcel(Grid, ExportList);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDB.colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDB.colImgGetText') else _udebug := nil;{$ENDIF}

  AText := '1';

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDB.DoShow;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDB.DoShow') else _udebug := nil;{$ENDIF}

  inherited;

  try
    grdMain.SetFocus;
  except
  end;

  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDB.SetCurrentID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDB.SetCurrentID') else _udebug := nil;{$ENDIF}

  inherited;
  cdsMain.Locate(_ID_, Value, []);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDB.srcMainDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDB.srcMainDataChange') else _udebug := nil;{$ENDIF}

  FCurrentID := cdsMain.fieldbyname(_ID_).AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDB.grdMainKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDB.grdMainKeyDown') else _udebug := nil;{$ENDIF}

  if Key = 13 then grdMainDblClick(grdMain);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDB.cdsMainBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDB.cdsMainBeforeOpen') else _udebug := nil;{$ENDIF}

  DSRefresh(cdsParams, 'dbid', 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDB.colPathGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDB.colPathGetText') else _udebug := nil;{$ENDIF}

  if cdsParams.Locate('dbid;parname', VarArrayOf([ANode.Values[colID.Index], 'Data Source']), [])
    then AText := cdsParams.fieldbyname('parvalue').AsString;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDB.aReconnectExecute(Sender: TObject);
  var
    i: Integer;
    FParent: TfrmCCMain;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDB.aReconnectExecute') else _udebug := nil;{$ENDIF}

  with TokLoginClass.Create(nil) do
    try
      lHost.Enabled := False;
      EdHost.Enabled := False;
      ldb.Enabled := False;
      cbDB.Enabled := False;
      btnHost.Enabled := False;
      btnDBWiz.Enabled := False;
      chbSingleMode.Checked := SingleUserMode;

      cbDB.ItemIndex := cbDB.Properties.Items.AddObject(cdsMain.fieldbyname('desc').AsString, Pointer(cdsMain.fieldbyname('dbid').AsInteger));

      LoginType := ltProduction;
      SConn := dmData.SConnection;
      btnParamsClick(btnParams);

      if ShowModal = mrOk then begin
        EntName := '';
        InitProfile(dmData.SConnection, UserID, ProfID, TreeID, dmData.scMain);

        FParent := nil;
        with frmMainForm do begin
          for i := 0 to MDIChildCount - 1 do
            if MDIChildren[i].Handle <> Self.ParentHandle
              then MDIChildren[i].Close
              else FParent := TfrmCCMain(MDIChildren[i]);

          for i := 0 to FParent.FrameList.FramesCount - 1 do
            if FParent.FrameList.Items[i] <> Self
              then FParent.FrameList.Items[i].Free;

          ReloadRes;
        end;
      end;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDB.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDB.ActionListUpdate') else _udebug := nil;{$ENDIF}

  inherited;

  aReconnect.Enabled := not ((cdsMain.FieldByName(_ID_).AsInteger = dmData.SConnection.DBID)
    or ((cdsMain.FieldByName(_ID_).AsInteger = FDBID) and (dmData.SConnection.DBID = -1)));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDB.NotifyChanged;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDB.NotifyChanged') else _udebug := nil;{$ENDIF}

  if not JumpFromBuffer
    then frmMainForm.AddToBuffer(vtService, FunID, Self.Caption, ClassName, Tag, FCurrentID, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDB.LocateAfterDel;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDB.LocateAfterDel') else _udebug := nil;{$ENDIF}

  with grdMain do
    if SelectedCount > 1 then begin
      cdsMain.First;
    end
    else if cdsMain.RecordCount > 1 then
         if (FocusedNode.Index = Count - 1) and (FocusedNode.Index > 0)
           then cdsMain.Locate(_ID_, FocusedNode.GetPrev.Values[ColumnByFieldName(KeyField).Index], [])
           else cdsMain.Locate(_ID_, FocusedNode.GetNext.Values[ColumnByFieldName(KeyField).Index], []);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDB.cdsMainAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDB.LocateAfterDel') else _udebug := nil;{$ENDIF}

  inherited;
  {$IFDEF LIMITED}
    limited := cdsMain.Active and (cdsMain.recordCount > limitDatabasesCount);
  {$ELSE}
    limited := False;
  {$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDB.colCurrentGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
begin
  inherited;
  AText := ifThen(ANode.Values[colID.Index] = dmdata.SConnection.DBID, '1', '0');
end;


//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fDB', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
