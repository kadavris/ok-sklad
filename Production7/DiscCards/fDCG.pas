{$I ok_sklad.inc}
unit fDCG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrame, Menus, ActnList, DB, DBClient, ssBaseConst, ssBaseTypes,
  ssClientDataSet, ssBevel, cxControls, cxContainer,
  cxTreeView, ssDBTreeView, ComCtrls, TB2Item, dxDBGrid6, dxTL6, dxDBCtrl6,
  dxDBTLCl6, dxGrClms6, dxCntner6, ExtCtrls;

type
  TfmDCG = class(TssBaseFrame)
    cdsList: TssClientDataSet;
    colID: TdxDBGridColumn;
    colImg: TdxDBGridColumn;
    colName: TdxDBGridColumn;
    colNum: TdxDBGridColumn;
    grdMat: TdxDBGrid;
    panMat: TPanel;
    panTree: TPanel;
    Splitter1: TSplitter;
    srcMat: TDataSource;
    ssBevel1: TssBevel;
    ssBevel2: TssBevel;
    ssBevel3: TssBevel;
    ssBevel4: TssBevel;
    ssBevel5: TssBevel;
    ssBevel6: TssBevel;
    ssBevel7: TssBevel;
    ssBevel9: TssBevel;
    tvMain: TTreeView;

    procedure tvMainGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure tvMainExpanding(Sender: TObject; Node: TTreeNode; var AllowExpansion: Boolean);
    procedure tvMainMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure tvMainChange(Sender: TObject; Node: TTreeNode);
    procedure tvMainKeyPress(Sender: TObject; var Key: Char);
    procedure tvMainDblClick(Sender: TObject);
    procedure cdsListBeforeOpen(DataSet: TDataSet);
    procedure colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure grdMatCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);

  private
    grMat: TBitmap;
    PopupNode: TTreeNode;

    procedure RefreshTree(ANode: TTreeNode);
    procedure LocateMatGroup(ANode: TTreeNode; AID: integer; APID: integer = -1; ANew: boolean = False);

  protected
    function GetIDForUpdate: integer; override;
    procedure SetCurrentID(const Value: integer); override;

  public
    procedure UpdateActionList; override;
    procedure DoOpen(AParam: Variant); override;
    procedure DoClose; override;
    procedure DoDelete; override;
    procedure DoRefresh(const AID: integer; AParam: integer = 0); override;
    procedure SetCaptions; override;
    procedure DoShow; override;
    procedure DoInsert; override;
    procedure DoProperties; override;
    procedure DoActivate; override;
  end;

var
  fmDCG: TfmDCG;

implementation

uses 
  ClientData, prFun, prConst, ssFun, Export, prTypes, ssCallbackConst,
  EditMaterials, ssStrUtil, fMessageDlg, ImgList, EditDiscCards, Udebug;

var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

const
     _ID_ = 'GrpID';

//==============================================================================================
procedure TfmDCG.DoClose;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDCG.DoClose') else _udebug := nil;{$ENDIF}


  grMat.Free;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDCG.DoDelete;
  var
    id_: integer;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDCG.DoDelete') else _udebug := nil;{$ENDIF}

  if ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes then

  with newDataSet do
  try
    TrStart;

    try
      ProviderName := 'pMatGroup_GetChild';
      FetchParams;
      Params.ParamByName('pid').AsInteger := Integer(tvMain.Selected.Data);
      Open;
      if Fields[0].AsInteger > 0 then begin
        Close;
        TrRollback;
        ssMessageDlg(rs('Common', 'DeleteError'), ssmtError, [ssmbOk]);
      end;
      Close;

      if not DeleteData(dmData.SConnection, 'disccardgrp', Integer(tvMain.Selected.Data)) then
      begin
        TrRollback;
        ssMessageDlg(rs('Common', 'DeleteError'), ssmtError, [ssmbOk]);
      end;

      if not DelToRecycleBin
        then TrCommit
        else begin
          TrRollback;
          if not AddToRecycleBin(dmData.SConnection, Self.ClassName, Integer(tvMain.Selected.Data), tvMain.Selected.Text, False, Self.FunID) then begin
            ssMessageDlg(rs('Common', 'ErrorInsToRecycleBin'), ssmtError, [ssmbOk]);
            {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
            Exit;
          end;
        end;

      tvMain.Selected.Free;
      UpdateActionList;
      //if RefreshAllClients
      //  then dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_ACCOUNTTYPE);

    except
      on E: Exception do begin
        TrRollback;
        ssMessageDlg(rs('Common', 'NoDelete') + #10#13 + e.Message, ssmtError, [ssmbOk]);
      end;
    end;
    
  finally
    Free;
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDCG.DoOpen(AParam: Variant);
var
   i: integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDCG.DoOpen') else _udebug := nil;{$ENDIF}


  grMat := TBitmap.Create;
  dmData.Images.GetBitmap(II_DISC_CARDS_DIS, grMat);
  grMat.Transparent := True;
  RefType := rtDiscCardGroup;
  CanRefresh := False;
  RefreshTree(nil);
  CanRefresh := True;
  tvMainChange(tvMain, tvMain.Selected);

  inherited;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDCG.SetCaptions;
var
  FTitle: string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDCG.SetCaptions') else _udebug := nil;{$ENDIF}


  with LangMan do begin
    Self.Caption := GetRS('fmDiscCards', 'DCG');
    FTitle := Self.Caption;

    colName.Caption := GetRS('fmDiscCards', 'Holder');
    colNum.Caption := GetRS('fmDiscCards', 'Num');

    SendMessage(ParentHandle, WM_SETPARENTCAPTION, Integer(@FTitle), 0);

    FindList.Clear;
    FindList.AddObject(GetRS('fmMaterials', 'Name') + ';' + 'name', pointer(1));
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDCG.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDCG.UpdateActionList') else _udebug := nil;{$ENDIF}


  aNew.Enabled := True;
  aPatternInsert.Enabled := False;
  aProperties.Enabled := tvMain.Selected <> nil;
  aDel.Enabled := aProperties.Enabled;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDCG.DoRefresh(const AID: integer; AParam: integer = 0);
var
  FID: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDCG.DoRefresh') else _udebug := nil;{$ENDIF}


  Screen.Cursor := crHourGlass;
  tvMain.Items.BeginUpdate;
  try
    case AParam of
      0: begin
           if tvMain.Selected <> nil
             then FID := Integer(tvMain.Selected.Data)
             else FID := 0;
           RefreshTree(nil);
           LocateMatGroup(nil, FID, -1, True);
         end;
      else begin
        RefreshTree(nil);
        LocateMatGroup(tvMain.Selected, PGrpInfo(AID).ID, PGrpInfo(AID).PID, True);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
    tvMain.Items.EndUpdate;
  end;
  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmDCG.GetIDForUpdate: integer;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDCG.GetIDForUpdate') else _udebug := nil;{$ENDIF}

  Result := -1;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDCG.DoShow;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDCG.DoShow') else _udebug := nil;{$ENDIF}

  inherited;

  try
    tvMain.SetFocus;
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDCG.SetCurrentID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDCG.SetCurrentID') else _udebug := nil;{$ENDIF}


  inherited;

  LocateMatGroup(nil, Value, -1, True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDCG.tvMainGetImageIndex(Sender: TObject; Node: TTreeNode);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDCG.tvMainGetImageIndex') else _udebug := nil;{$ENDIF}


  if Node.Expanded then begin
    Node.ImageIndex := 49;
    Node.SelectedIndex := 49;
  end
  else begin
    Node.ImageIndex := 48;
    Node.SelectedIndex := 48;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDCG.RefreshTree(ANode: TTreeNode);
  var FNode: TTreeNode;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDCG.RefreshTree') else _udebug := nil;{$ENDIF}

  tvMain.Items.BeginUpdate;

  try
    if ANode = nil then tvMain.Items.Clear
      else ANode.DeleteChildren;

    with newDataSet do
    try
      if ANode = nil
        then ProviderName := 'pDCGroup_GetRootLevel'
        else begin
          ProviderName := 'pDCGroup_GetLevel';
          FetchParams;
          Params.ParamByName('pid').AsInteger := Integer(ANode.Data);
        end;
      Open;
      while not Eof do begin
        if ANode <> nil
          then FNode := tvMain.Items.AddChild(ANode, FieldByName('name').AsString)
          else FNode := tvMain.Items.Add(nil, FieldByName('name').AsString);
        FNode.Data := Pointer(FieldByName('grpid').AsInteger);
        tvMain.Items.AddChild(FNode, '');
        Next;
      end;
      Close;
    finally
      Free;
    end;

  finally
    tvMain.Items.EndUpdate;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDCG.tvMainExpanding(Sender: TObject; Node: TTreeNode; var AllowExpansion: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDCG.tvMainExpanding') else _udebug := nil;{$ENDIF}


  if (Node.Count > 0) and (Node.Item[0].Text = EmptyStr) then begin
    Screen.Cursor := crHourGlass;
    try
      RefreshTree(Node);
    finally
      Screen.Cursor := crDefault;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDCG.DoInsert;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDCG.DoInsert') else _udebug := nil;{$ENDIF}


//  if PopupNode = nil then Exit;
  if PopupNode <> nil then tvMain.Selected := PopupNode;
  with TfrmEditDiscCards.Create(nil) do
  try
    MainHandle := Self.Handle;
    ParentNameEx := 'fmDiscCards';
    OnDate := Self.OnDate;
    tsGroup.Show;
    lcbParent.Enabled := False;
    btnGrp.Enabled := False;
    ID := 0;//Integer(tvMain.Selected.Data);
    ShowModal;
    UpdateActionList;
  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDCG.DoProperties;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDCG.DoProperties') else _udebug := nil;{$ENDIF}


  if PopupNode = nil then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  if PopupNode <> nil then tvMain.Selected := PopupNode;
  with TfrmEditDiscCards.Create(nil) do
  try
    MainHandle := Self.Handle;
    ParentNameEx := 'fmDiscCards';
    OnDate := Self.OnDate;
    tsGroup.Show;
    lcbParent.Enabled := False;
    btnGrp.Enabled := False;
    ID := Integer(tvMain.Selected.Data);
    ShowModal;
    UpdateActionList;
  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDCG.tvMainMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  var FPos: TPoint;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDCG.tvMainMouseUp') else _udebug := nil;{$ENDIF}


  if Button = mbRight then begin
    PopupNode := tvMain.GetNodeAt(X, Y);
    FPos := tvMain.ClientToScreen(Point(X, Y));
    pmMain.Popup(FPos.X, FPos.Y);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDCG.LocateMatGroup(ANode: TTreeNode; AID: integer; APID: integer = -1; ANew: boolean = False);
var
  s: string;
  FRootNode: TTreeNode;
  FRootID, FPID: Integer;

  procedure ExpandToParent(ANode: TTreeNode);
  begin
    if not ANode.Parent.Expanded then begin
      ANode.Parent.Expand(False);
      ExpandToParent(ANode.Parent);
    end;
  end;

  function LocateNode(AValue: Integer): Boolean;
  var
    i: Integer;
  begin
    Result := False;
    for i := 0 to tvMain.Items.Count - 1 do begin
      if (tvMain.Items[i].Text <> EmptyStr) and (Integer(tvMain.Items[i].Data) = AValue) then begin
        ExpandToParent(tvMain.Items[i]);
        tvMain.Selected := tvMain.Items[i];
        if ANew then begin
          tvMain.Selected.DeleteChildren;
        end;
        Result := True;
        Exit;
      end
      else if (tvMain.Items[i].Text <> EmptyStr) and (Integer(tvMain.Items[i].Data) = APID) and ANew
        then RefreshTree(tvMain.Items[i]);
    end;
  end;

  procedure GetParent(AID: integer; var S: string; DS: TDataSet);
  var
    BM: TBookmark;
  begin
    BM := DS.GetBookmark;
    try
      DS.First;
      while not DS.Eof do begin
        if (DS.FieldByName('grpid').AsInteger = AID) then
          if (DS.FieldByName('pid').AsInteger <> AID) then begin
            S := DS.FieldByName('pid').AsString + ',' + s;
            GetParent(DS.FieldByName('pid').AsInteger, S, DS);
          end
          else FRootID := DS.FieldByName('pid').AsInteger;
        DS.Next;
      end;
    finally
      DS.GotoBookmark(BM);
      DS.FreeBookmark(BM);
    end;
  end;

  function GetParentSeq(AID: Integer): string;
  begin
    Result := IntToStr(AID);
    with newDataSet do
    try
      ProviderName := 'pDCG_List';
      Open;
      GetParent(AID, Result, Fields[0].DataSet);
      Close;
    finally
      Free;
    end;
  end;

  function SetTreeItem(ANode: TTreeNode; const AValue: Integer; ASelect: Boolean = True): TTreeNode;
    var
      i: Integer;
  begin
    Result := nil;
    if ((ANode.Count > 0) and (ANode.Item[0].Text = EmptyStr)) or ((Integer(ANode.Data) = FPID) and ANew)
      then RefreshTree(ANode);

    for i := 0 to ANode.Count - 1 do
      if Integer(ANode.Item[i].Data) = AValue then begin
        if not ANode.Expanded then ANode.Expand(False);
        if ASelect then tvMain.Selected := ANode.Item[i];
        Result := ANode.Item[i];
        Exit;
      end;
  end;

  function GetRootNode(AID: Integer): TTreeNode;
  var
    i: Integer;
  begin
    Result := nil;
    for i := 0 to tvMain.Items.Count - 1 do
      if (tvMain.Items[i].Text <> '') and (Integer(tvMain.Items[i].Data) = FRootID) then begin
        Result := tvMain.Items[i];
        Exit;
      end;
  end;

  procedure ExpandSeq(S: string);
  var
    i: Integer;
    FNode: TTreeNode;
    wc: Integer;
  begin
    FRootNode := GetRootNode(FRootID);
    FNode := FRootNode;
    wc := WordCount(s, [',']);
    try
      if (wc = 1) and (FRootNode <> nil) then tvMain.Selected := FRootNode;
    except
    end;
    for i := 2 to wc do begin
      if i = wc - 1 then FPID := StrToInt(ExtractWord(i, s, [',']));
      if i < wc
        then FNode := SetTreeItem(FNode, StrToInt(ExtractWord(i, S, [','])), False)
        else FNode := SetTreeItem(FNode, StrToInt(ExtractWord(i, S, [','])));
    end;
  end;

  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDCG.LocateMatGroup') else _udebug := nil;{$ENDIF}


  tvMain.Items.BeginUpdate;
  try
    S := GetParentSeq(AID);
    ExpandSeq(S);
  finally
    tvMain.Items.EndUpdate;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDCG.tvMainChange(Sender: TObject; Node: TTreeNode);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDCG.tvMainChange') else _udebug := nil;{$ENDIF}


  if not CanRefresh then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  if Node <> nil
    then FCurrentID := Integer(Node.Data)
    else FCurrentID := -1;
  if Node <> nil then PopupNode := Node;
  UpdateActionList;
  DSRefresh(cdsList, 'cardid', 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDCG.tvMainKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDCG.tvMainKeyPress') else _udebug := nil;{$ENDIF}


  if (Key = #13) and (tvMain.Selected <> nil) then begin
    Key := #0;
    if ModalView then SendMessage(ParentHandle, WM_SELECTITEM, 0, 0);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDCG.tvMainDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDCG.tvMainDblClick') else _udebug := nil;{$ENDIF}


  with tvMain do
    if Items.Count > 0 then begin
      if ModalView
        then SendMessage(ParentHandle, WM_SELECTITEM, 0, 0)
        else DoProperties;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDCG.cdsListBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDCG.cdsListBeforeOpen') else _udebug := nil;{$ENDIF}


  cdsList.Params.ParamByName('pid').AsInteger := FCurrentID;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDCG.colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDCG.colImgGetText') else _udebug := nil;{$ENDIF}


//  AText := '1';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDCG.grdMatCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var
  R: TRect;
  w: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDCG.grdMatCustomDrawCell') else _udebug := nil;{$ENDIF}


  if not ASelected then AFont.Color := clBtnShadow;

  if AColumn = colImg then begin
    w := 14;
    R.Left := ARect.Left + 5;
    R.Right := R.Left + w;
    R.Top := ARect.Top + 1;
    R.Bottom := R.Top + w;
    with ACanvas do begin
      if ASelected
        then if grdMat.Focused
          then Brush.Color := grdMat.HighlightColor
          else Brush.Color := grdMat.HideSelectionColor
        else Brush.Color := grdMat.Color;
      FillRect(ARect);
      StretchDraw(R, grMat);
      ADone := True;
    end;
  end;  
  if Odd(ANode.Index) and not ASelected then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmDCG.DoActivate;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmDCG.DoActivate') else _udebug := nil;{$ENDIF}


  {}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fDCG', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
