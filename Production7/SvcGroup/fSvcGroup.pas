{$I ok_sklad.inc}
unit fSvcGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrame, Menus, ActnList, DB, DBClient, ssBaseConst, ssBaseTypes,
  ssClientDataSet, ssBevel, cxControls, cxContainer,
  cxTreeView, ssDBTreeView, ComCtrls, TB2Item, dxDBGrid6, dxTL6, dxDBCtrl6,
  dxDBTLCl6, dxGrClms6, dxCntner6, ExtCtrls;

type
  TfmSvcGroup = class(TssBaseFrame)
    cdsSvc: TssClientDataSet;
    colArtikul: TdxDBGridColumn;
    colID: TdxDBGridColumn;
    colImg: TdxDBGridColumn;
    colName: TdxDBGridColumn;
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

    procedure cdsSvcBeforeOpen(DataSet: TDataSet);
    procedure colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure dbgAccountTypeDblClick(Sender: TObject);
    procedure grdMatCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure tvMainChange(Sender: TObject; Node: TTreeNode);
    procedure tvMainDblClick(Sender: TObject);
    procedure tvMainExpanding(Sender: TObject; Node: TTreeNode; var AllowExpansion: Boolean);
    procedure tvMainGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure tvMainKeyPress(Sender: TObject; var Key: Char);
    procedure tvMainMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

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
  end;

var
  fmSvcGroup: TfmSvcGroup;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  ClientData, prFun, prConst, ssFun, Export, prTypes, ssCallbackConst,
  EditServices, ssStrUtil, fMessageDlg, ImgList, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

const
  _ID_ = 'SvcID';

//==============================================================================================
procedure TfmSvcGroup.DoClose;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmSvcGroup.DoClose') else _udebug := nil;{$ENDIF}

  grMat.Free;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmSvcGroup.DoDelete;
 var
   id_: integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmSvcGroup.DoDelete') else _udebug := nil;{$ENDIF}

  try // finally
    if mrYes <> ssMessageDlg(LangMan.GetRS('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo])
    then Exit;

    with newDataSet do
      try
        TrStart;

        try
         ProviderName := 'pSvcGroup_ChildCount';
         FetchParams;
         Params.ParamByName('svcid').AsInteger := Integer(tvMain.Selected.Data);
         Open;
         if Fields[0].AsInteger > 0 then begin
           Close;
           TrRollback;
           ssMessageDlg(LangMan.GetRS('Common', 'DeleteError'), ssmtError, [ssmbOk]);
           Exit;
         end;
         Close;

         if not DeleteDataEx(dmData.SConnection, 'services', 'svcid', Integer(tvMain.Selected.Data))
         then begin
           TrRollback;
           ssMessageDlg(LangMan.GetRS('Common', 'DeleteError'), ssmtError, [ssmbOk]);
           Exit;
         end;

         if True {not DelToRecycleBin}
          then TrCommit
          else begin
            TrRollback;

            if not AddToRecycleBin(dmData.SConnection, Self.ClassName, Integer(tvMain.Selected.Data), tvMain.Selected.Text, False, Self.FunID)
            then begin
              ssMessageDlg(LangMan.GetRS('Common', 'ErrorInsToRecycleBin'), ssmtError, [ssmbOk]);
              Exit;
            end;
          end;

         tvMain.Selected.Free;
         UpdateActionList;
         //if RefreshAllClients then dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_ACCOUNTTYPE);

        except
          on E:Exception do begin
            TrRollback;
            ssMessageDlg(LangMan.GetRS('Common', 'NoDelete') + #10#13 + e.Message, ssmtError, [ssmbOk]);
          end;
        end;

     finally
       Free;
     end;

   inherited;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure TfmSvcGroup.DoOpen(AParam: Variant);
  var
    i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmSvcGroup.DoOpen') else _udebug := nil;{$ENDIF}
   
  grMat := TBitmap.Create;
  dmData.Images.GetBitmap(132, grMat);
  grMat.Transparent := True;
  RefType := rtSvcGroup;
  CanRefresh := False;
  RefreshTree(nil);
  CanRefresh := True;
  tvMainChange(tvMain, tvMain.Selected);
  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmSvcGroup.SetCaptions;
  var
    FTitle: string;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmSvcGroup.SetCaptions') else _udebug := nil;{$ENDIF}
  
  with LangMan do begin
    Self.Caption := GetRS('fmServices', 'SvcGroups');
    FTitle := Self.Caption;

    colName.Caption := GetRS('fmServices', 'Title');

    SendMessage(ParentHandle, WM_SETPARENTCAPTION, integer(@FTitle), 0);

    FindList.Clear;
    FindList.AddObject(GetRS('fmServices', 'Name') + ';' + 'name', pointer(1));

  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmSvcGroup.dbgAccountTypeDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmSvcGroup.dbgAccountTypeDblClick') else _udebug := nil;{$ENDIF}

  with dbgAccountType do
    if Count>0 then begin
     if ModalView
       then SendMessage(ParentHandle, WM_SELECTITEM, 0, 0)
       else DoProperties;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmSvcGroup.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmSvcGroup.UpdateActionList') else _udebug := nil;{$ENDIF}


  aNew.Enabled := True;
  aPatternInsert.Enabled := False;
  aProperties.Enabled := tvMain.Selected <> nil;
  aDel.Enabled := aProperties.Enabled;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmSvcGroup.DoRefresh(const AID: integer; AParam: integer = 0);
  var
    FID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmSvcGroup.DoRefresh') else _udebug := nil;{$ENDIF}
   
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
    end; //case

  finally
    Screen.Cursor := crDefault;
    tvMain.Items.EndUpdate;
  end;

  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmSvcGroup.GetIDForUpdate: integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  Result := -1;//stub

  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmSvcGroup.GetIDForUpdate') else _udebug := nil;{$ENDIF}

  Result := cdsView.fieldbyname(_ID_).AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmSvcGroup.DoShow;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmSvcGroup.DoShow') else _udebug := nil;{$ENDIF}

  inherited;
  
  try
    tvMain.SetFocus; 
  except 
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmSvcGroup.SetCurrentID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmSvcGroup.SetCurrentID') else _udebug := nil;{$ENDIF}


  inherited;
  LocateMatGroup(nil, Value, -1, True);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmSvcGroup.tvMainGetImageIndex(Sender: TObject; Node: TTreeNode);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmSvcGroup.tvMainGetImageIndex') else _udebug := nil;{$ENDIF}

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
procedure TfmSvcGroup.RefreshTree(ANode: TTreeNode);
  var
    FNode: TTreeNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmSvcGroup.RefreshTree') else _udebug := nil;{$ENDIF}

  tvMain.Items.BeginUpdate;

  try
    if ANode = nil
      then tvMain.Items.Clear
      else ANode.DeleteChildren;

    with newDataSet do
      try
        if ANode = nil
          then ProviderName := 'pSvcGroup_GetRootLevel'
          else begin
            ProviderName := 'pSvcGroup_GetLevel';
            FetchParams;
            Params.ParamByName('pid').AsInteger := Integer(ANode.Data);
          end;

        Open;

        while not Eof do begin
          if ANode <> nil
            then FNode := tvMain.Items.AddChild(ANode, fieldbyname('name').AsString)
            else FNode := tvMain.Items.Add(nil, fieldbyname('name').AsString);

          FNode.Data := Pointer(fieldbyname('svcid').AsInteger);
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
procedure TfmSvcGroup.tvMainExpanding(Sender: TObject; Node: TTreeNode; var AllowExpansion: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmSvcGroup.tvMainExpanding') else _udebug := nil;{$ENDIF}

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
procedure TfmSvcGroup.DoInsert;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmSvcGroup.DoInsert') else _udebug := nil;{$ENDIF}

  //if PopupNode = nil then Exit;

  if PopupNode <> nil then tvMain.Selected := PopupNode;

  with TfrmEditServices.Create(nil) do
    try
      if Self.tvMain.Selected <> nil 
        then GrpID := Integer(Self.tvMain.Selected.Data)
        else GrpID := 0;

      MainHandle := Self.Handle;
      ParentNameEx := 'fmServices';
      btnGrpParent.Enabled := False;
      lcbParent.OnEnter := nil;
      OnDate := Self.OnDate;
      ID := 0;
      cbType.ItemIndex := 1;
      cbType.Enabled := False;
      ShowModal;
      UpdateActionList;
    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmSvcGroup.DoProperties;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmSvcGroup.DoProperties') else _udebug := nil;{$ENDIF}

  if PopupNode = nil then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  tvMain.Selected := PopupNode;

  with TfrmEditServices.Create(nil) do
    try
      MainHandle := Self.Handle;
      ParentNameEx := 'fmServices';
      OnDate := Self.OnDate;
      lcbParent.OnEnter := nil;
      cbType.ItemIndex := 1;
      cbType.Enabled := False;
      btnGrpParent.Enabled := False;
      ID := Integer(Self.tvMain.Selected.Data);
      ShowModal;
      UpdateActionList;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmSvcGroup.tvMainMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  var
    FPos: TPoint;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmSvcGroup.tvMainMouseUp') else _udebug := nil;{$ENDIF}
   
  if Button = mbRight then begin
    PopupNode := tvMain.GetNodeAt(X, Y);
    FPos := tvMain.ClientToScreen(Point(X, Y));
    pmMain.Popup(FPos.X, FPos.Y);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmSvcGroup.LocateMatGroup(ANode: TTreeNode; AID: integer; APID: integer = -1; ANew: boolean = False);
  var
    s: string;
    FRootNode: TTreeNode;
    FRootID, FPID: Integer;
    {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}

  procedure ExpandToParent(ANode: TTreeNode);
  begin
    if not ANode.Parent.Expanded then begin
      ANode.Parent.Expand(False);
      ExpandToParent(ANode.Parent);
    end;
  end;

  function LocateNode(AValue: integer): boolean;
    var i: integer;
  begin
   Result:=False;

   for i:=0 to tvMain.Items.Count-1 do begin
     if (tvMain.Items[i].Text<>EmptyStr) and (Integer(tvMain.Items[i].Data)=AValue) then begin
       ExpandToParent(tvMain.Items[i]);
       tvMain.Selected:=tvMain.Items[i];
  
       if ANew then tvMain.Selected.DeleteChildren;

       Result:=True;

       Exit;
     end
     else if (tvMain.Items[i].Text<>EmptyStr) and (Integer(tvMain.Items[i].Data)=APID) and ANew
      then RefreshTree(tvMain.Items[i]);
    end;
  end;

  procedure GetParent(AID: integer; var s: string; DS: TDataSet);
    var BM: TBookmark;
  begin

   BM:=DS.GetBookmark;

   try
     DS.First;

     while not DS.Eof do begin
      if (DS.FieldByName('svcid').AsInteger=AID) then
        if (DS.FieldByName('pid').AsInteger<>AID) then begin
          s:=DS.FieldByName('pid').AsString+','+s;
          GetParent(DS.FieldByName('pid').AsInteger, s, DS);
        end
        else FRootID:=DS.FieldByName('pid').AsInteger;

      DS.Next;
     end;

     DS.GotoBookmark(BM);

   finally
     DS.FreeBookmark(BM);
   end;
  end;

  function GetParentSeq(AID: integer): string;
  begin
    Result := IntToStr(AID);

    with newDataSet do
    try
      ProviderName:='pSvcGroup_List';
      Open;
      GetParent(AID, Result, Fields[0].DataSet);
      Close;

    finally
      Free;
    end;
  end;

  function SetTreeItem(ANode: TTreeNode; const AValue: Integer; ASelect: boolean = True): TTreeNode;
    var i: integer;
  begin
      Result:=nil;

      if ((ANode.Count>0) and (ANode.Item[0].Text=EmptyStr)) or ((Integer(ANode.Data)=FPID) and ANew) then RefreshTree(ANode);

      for i:=0 to ANode.Count-1 do
        if Integer(ANode.Item[i].Data)=AValue then begin
          if not ANode.Expanded then ANode.Expand(False);

          if ASelect then tvMain.Selected:=ANode.Item[i];

          Result := ANode.Item[i];

          Exit;
        end;
  end;

  function GetRootNode(AID: Integer): TTreeNode;
    var i: Integer;
  begin
    Result := nil;
    for i := 0 to tvMain.Items.Count - 1 do
      if Integer(tvMain.Items[i].Data) = FRootID then begin
        Result := tvMain.Items[i];
        Exit;
      end;
  end;

  procedure ExpandSeq(s: string);
    var
      i: integer;
      FNode: TTreeNode;
      wc: integer;
  begin
   FRootNode := GetRootNode(FRootID);
   FNode := FRootNode;
   wc := WordCount(s, [',']);

   try
     if wc = 1 then tvMain.Selected:=FRootNode;
   except
   end;  

   for i:=2 to wc do begin
    if i = wc-1 then FPID:=StrToInt(ExtractWord(i, s, [',']));

    if i < wc 
      then FNode:=SetTreeItem(FNode, StrToInt(ExtractWord(i, s, [','])), False)
      else FNode:=SetTreeItem(FNode, StrToInt(ExtractWord(i, s, [','])));
   end;
  end;

//--------------------------------------------------------------------------------------------
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmSvcGroup.LocateMatGroup') else _udebug := nil;{$ENDIF}
 
  tvMain.Items.BeginUpdate;

  try
    {if (APID<>0) and not ANew and (ANode.Count > 0) and (ANode.Item[0].Text = EmptyStr)
      then RefreshTree(ANode);
    }

    //if not LocateNode(AID) then begin
      s := GetParentSeq(AID);
      ExpandSeq(s);
    //end;

  finally
    tvMain.Items.EndUpdate;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmSvcGroup.tvMainChange(Sender: TObject; Node: TTreeNode);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmSvcGroup.tvMainChange') else _udebug := nil;{$ENDIF}

  if not CanRefresh then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  if Node <> nil
    then FCurrentID := Integer(Node.Data)
    else FCurrentID := -1;

  if Node <> nil then PopupNode := Node;

  UpdateActionList;
  DSRefresh(cdsSvc, 'svcid', 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmSvcGroup.tvMainKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmSvcGroup.tvMainKeyPress') else _udebug := nil;{$ENDIF}

  if (Key = #13) and (tvMain.Selected <> nil) then begin
    Key := #0;
    if ModalView then SendMessage(ParentHandle, WM_SELECTITEM, 0, 0);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmSvcGroup.tvMainDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmSvcGroup.tvMainDblClick') else _udebug := nil;{$ENDIF}

  with tvMain do
    if Items.Count > 0 then begin
     if ModalView 
       then SendMessage(ParentHandle, WM_SELECTITEM, 0, 0)
       else DoProperties;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmSvcGroup.cdsSvcBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmSvcGroup.cdsSvcBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsSvc.Params.ParamByName('pid').AsInteger := FCurrentID;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmSvcGroup.colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmSvcGroup.colImgGetText') else _udebug := nil;{$ENDIF}

  AText := '1';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmSvcGroup.grdMatCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  var
    R: TRect;
    w: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmSvcGroup.grdMatCustomDrawCell') else _udebug := nil;{$ENDIF}
    
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
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fSvcGroup', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
