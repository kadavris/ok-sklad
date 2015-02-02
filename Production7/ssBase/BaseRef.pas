{$I ok_sklad.inc}
unit BaseRef;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrame, TB2Item, Menus, ActnList, ExtCtrls, ssBevel,
  dxDBGrid6, dxTL6, dxDBCtrl6, dxDBTLCl6, dxGrClms6, dxCntner6, DB, DBClient,
  ssClientDataSet, ComCtrls, StdCtrls, ssBaseTypes, ssBaseConst,
  ssDataSource, ssDBGrid, cxPC, cxControls;

type
  TfmBaseRef = class(TssBaseFrame)
    aExportCSV: TAction;
    aImportCSV: TAction;
    cdsMain: TssClientDataSet;
    grdMain: TssDBGrid;
    panClient: TPanel;
    pcMainList: TcxPageControl;
    srcMain: TssDataSource;
    ssBevel12: TssBevel;
    ssBevel3: TssBevel;
    ssBevel8: TssBevel;
    ssBevel9: TssBevel;
    tsMainList: TcxTabSheet;

    procedure aSelectAllExecute(Sender: TObject);
    procedure cdsMainAfterOpen(DataSet: TDataSet);
    procedure grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure grdMainDblClick(Sender: TObject);
    procedure grdMainKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grdMainSelectedCountChange(Sender: TObject);
    procedure srcMainDelayedDataChange(Sender: TObject; Field: TField);

  protected
    function GetIDForUpdate: integer; override;
    procedure LocateAfterDel; virtual;

  public
    _ID_: string;

    procedure buildExpList(Grid: TdxDBGrid);   // Filling ExportList with fields from Grid
    procedure DoClose; override;
    procedure DoExcel(Grid: TdxDBGrid); override;
    procedure DoFind(const AFName, AStr: string; ALocateType: TLocateType; AFwd: Boolean = True); override;
    procedure DoLocate(const AID: Integer; ASubID: Integer = 0); override;
    procedure DoOpen(AParam: Variant); override;
    procedure DoRefresh(const AID: integer; AParam: integer = 0); override;
    procedure DoSetFocus; override;
    procedure DoShow; override;

    procedure SelectFocusedNode;
    procedure SetCaptions; override;
  end;

var
  fmBaseRef: TfmBaseRef;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  {$IFDEF UDEBUG}Udebug,{$ENDIF}
  prFun, ssFun, prConst, Export, fMessageDlg;

{$IFDEF UDEBUG}
var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';
{$ENDIF}

{$R *.dfm}

//==============================================================================================
procedure TfmBaseRef.DoClose;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseRef.DoClose') else _udebug := nil;{$ENDIF}

  inherited;
  cdsMain.Close;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseRef.DoShow;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseRef.DoShow') else _udebug := nil;{$ENDIF}

  inherited;

  CanRefresh := True;
  aRefresh.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseRef.grdMainSelectedCountChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseRef.grdMainSelectedCountChange') else _udebug := nil;{$ENDIF}

  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseRef.DoOpen(AParam: Variant);
 var
   i: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseRef.DoOpen') else _udebug := nil;{$ENDIF}

  inherited;

  if not LoadExpParams
    then with ExportList do
      for i := 0 to grdMain.ColumnCount - 1 do
        if grdMain.Columns[i].Tag = 1
          then AddObject(grdMain.Columns[i].Name, pointer(1));

  with grdMain do
    if FocusedNode <> nil
      then FocusedNode.Selected := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseRef.buildExpList(Grid: TdxDBGrid);   // Filling ExportList with fields from Grid
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseRef.buildExpList') else _udebug := nil;{$ENDIF}

  if not LoadExpParams
    then with ExportList do
      for i := 0 to Grid.ColumnCount - 1 do
        if Grid.Columns[i].Tag = 1
          then AddObject(Grid.Columns[i].Name, pointer(1));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmBaseRef.GetIDForUpdate: integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseRef.GetIDForUpdate') else _udebug := nil;{$ENDIF}

  Result := cdsMain.FieldByName(_ID_).AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseRef.DoRefresh(const AID: integer; AParam: integer);
 var
   FLastIndex: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseRef.DoRefresh') else _udebug := nil;{$ENDIF}

  if not CanRefresh then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  FLastIndex := grdMain.TopIndex;
  Application.ProcessMessages;

  try
    DSRefresh(cdsMain, _ID_, AID);
    grdMain.TopIndex := FLastIndex;

    with grdMain do
      if FocusedNode <> nil then FocusedNode.Selected := True;

  finally
    //if fLoading.Visible then fLoading.Hide;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseRef.DoFind(const AFName, AStr: string; ALocateType: TLocateType; AFwd: Boolean = True);
  var
    FNode: TdxTreeListNode;
    FChar: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseRef.DoFind') else _udebug := nil;{$ENDIF}

  inherited;

  SearchInfo.Failed := False;
  if FindStr <> AStr then begin
    if FilterOnSearch then begin
      case ALocateType of
        ltSubstr: FChar := '%';
        else FChar := '';
      end;

      if AStr = ''
        then cdsMain.Filter := ''
        else begin
          if cdsMain.FieldByName(AFName) is TDateTimeField
            then cdsMain.Filter := ''
            else cdsMain.Filter := AFName + ' like ''' + FChar + AStr + '%''';
        end;
      cdsMain.Filtered := True;
    end;
    //else cdsMain.Filtered := True;
    FindIndex := -1;
  end;

  FindStr := AStr;

  if AStr = '' then begin
    if FilterOnSearch then cdsMain.Filtered := False;
    SearchInfo.PrevFindStr := '';
    DoRefreshFindParams;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  FNode := FindNode(grdMain, AFName, AStr, ALocateType, FindIndex, AFwd);
  if FNode <> nil then begin
    FindIndex := FNode.Index;
    grdMain.ClearSelection;
    grdMain.TopIndex := FNode.AbsoluteIndex;
    grdMain.FocusedAbsoluteIndex := FNode.AbsoluteIndex;
    FNode.Focused := True;

    if grdMain.FocusedNode <> nil
      then grdMain.FocusedNode.Selected := True;

    SearchInfo.PrevFindStr := FindStr;
  end
  else begin
    SearchInfo.Failed := True;
    if FilterOnSearch then cdsMain.Filtered := False;
    SendMessage(ParentHandle, WM_SEARCHFAILED, 0, 0);
    //ssMessageDlg(LangMan.GetRS('Common', 'FindError') + ', ' +
    //LangMan.GetRS('Common', 'DSEnd'), ssmtInformation, [ssmbOk]);
  end;
  DoRefreshFindParams;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseRef.DoExcel(Grid: TdxDBGrid);
  var
    FShowExcel: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseRef.DoExcel') else _udebug := nil;{$ENDIF}

  inherited;

  with TfrmExport.Create(nil) do
    try
      if cdsFunc.Locate('classname', Self.ClassName, [])
        then FunID := cdsFunc.fieldbyname('funid').AsInteger
        else FunID := 0;

      if Grid = nil
        then grdExp:=grdMain
        else grdExp:=Grid;
        
      lName.Caption := Self.Caption;
      buildExpList(grdExp);
      FList := ExportList;

      if ShowModal <> mrOk then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

      FShowExcel := chbShowExcel.Checked;

    finally
      Free;
    end;

  if Grid = nil
    then ExportToExcel(grdMain, ExportList, FShowExcel)
    else ExportToExcel(Grid, ExportList, FShowExcel);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseRef.srcMainDelayedDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseRef.srcMainDelayedDataChange') else _udebug := nil;{$ENDIF}

  FCurrentID := cdsMain.fieldbyname(_ID_).AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseRef.aSelectAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseRef.aSelectAllExecute') else _udebug := nil;{$ENDIF}

  grdMain.SelectAll;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseRef.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseRef.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseRef.DoSetFocus;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseRef.DoSetFocus') else _udebug := nil;{$ENDIF}

  if grdMain.Visible
    then grdMain.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseRef.grdMainDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseRef.grdMainDblClick') else _udebug := nil;{$ENDIF}

  with grdMain do
    if Count > 0 then begin
      if ModalView then begin
        FCurrentID := cdsMain.FieldByName(_ID_).AsInteger;
        SendMessage(ParentHandle, WM_SELECTITEM, 0, 0);
      end
      else DoProperties;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseRef.grdMainKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseRef.grdMainKeyDown') else _udebug := nil;{$ENDIF}

  if Key = 13 then begin
    grdMainDblClick(grdMain);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseRef.DoLocate(const AID: Integer; ASubID: Integer = 0);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseRef.DoLocate') else _udebug := nil;{$ENDIF}

  grdMain.ClearSelection;
  cdsMain.Locate(_ID_, AID, []);

  if grdMain.FocusedNode <> nil
    then grdMain.FocusedNode.Selected := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseRef.cdsMainAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseRef.cdsMainAfterOpen') else _udebug := nil;{$ENDIF}

  {$IFDEF LIMITED}
    limited := cdsMain.Active and (cdsMain.recordCount > limitDocumentsCount);
  {$ELSE}
    limited := False;
  {$ENDIF}

  NeedRefresh := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseRef.grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseRef.grdMainCustomDrawCell') else _udebug := nil;{$ENDIF}

  if UseGridOddColor and not ASelected and Odd(ANode.AbsoluteIndex)
    then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseRef.SelectFocusedNode;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseRef.SelectFocusedNode') else _udebug := nil;{$ENDIF}

  with grdMain do begin
    ClearSelection;
    if FocusedNode <> nil then FocusedNode.Selected := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBaseRef.LocateAfterDel;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBaseRef.LocateAfterDel') else _udebug := nil;{$ENDIF}

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
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('BaseRef', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
