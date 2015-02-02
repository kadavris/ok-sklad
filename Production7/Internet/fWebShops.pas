{$I ok_sklad.inc}
unit fWebShops;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrame, Menus, ActnList, dxTL6, dxDBCtrl6, dxDBGrid6, dxCntner6,
  DB, DBClient, ssBaseConst, ssBaseTypes, prTypes,
  ssClientDataSet, dxDBTLCl6, dxGrClms6, ssBevel, TB2Item, BaseRef, ComCtrls,
  StdCtrls, ExtCtrls, ssDataSource, ssDBGrid, dxExEdtr6, cxContainer,
  cxEdit, cxTextEdit, cxMemo, dxInspct, cxPC, cxControls,
  ssMemDS, dxExEdtr, dxCntner;

type
  TfmWebShops = class(TfmBaseRef)
    aNewGrp: TAction;
    colDescription: TdxDBGridColumn;
    colID: TdxDBGridColumn;
    colImg: TdxDBGridImageColumn;
    colName: TdxDBGridColumn;
    inspMain: TdxInspector;
    irName: TdxInspectorTextRow;
    lCount: TLabel;
    panFooter: TPanel;
    pcMain: TcxPageControl;
    pmAdd: TTBPopupMenu;
    ssBevel11: TssBevel;
    ssBevel1: TssBevel;
    ssBevel2: TssBevel;
    ssBevel4: TssBevel;
    ssBevel5: TssBevel;
    ssBevel6: TssBevel;
    stCount: TssBevel;
    TBItem19: TTBItem;
    TBItem20: TTBItem;
    TBItem21: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBSeparatorItem7: TTBSeparatorItem;
    tsMain: TcxTabSheet;

    procedure aNewGrpExecute(Sender: TObject);
    procedure cdsMainAfterOpen(DataSet: TDataSet);
    procedure cdsMainBeforeOpen(DataSet: TDataSet);
    procedure colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure FrameResize(Sender: TObject);
    procedure grdMainDblClick(Sender: TObject);
    procedure grdMainKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure grdMainStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure inspMainDrawCaption(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
    procedure inspMainDrawValue(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
    procedure srcMainDelayedDataChange(Sender: TObject; Field: TField);

  private
    DI: TDragInfo;
    procedure WMLocateID(var M: TMessage); message WM_LOCATEID;

  protected
    procedure SetCurrentID(const Value: integer); override;

  public
    procedure DoCut; override;
    procedure DoDrillDown; override;
    procedure DoPaste; override;
    procedure DoOpen(AParam: Variant); override;
    procedure DoInsert; override;
    procedure DoDelete; override;
    procedure SetCaptions; override;
    procedure DoShow; override;
    procedure UpdateActionList; override;
    procedure DoRefresh(const AID: integer; AParam: integer = 0); override;
    procedure DoSomething; override;
    procedure DoSetFocus; override;
    procedure NotifyChanged; override;
    procedure SetParam(const Value: Integer); override;
  end;

var
  fmWebShops: TfmWebShops;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  Udebug, ClientData, prFun, prConst, ssFun, Clipbrd, Protection,
  Export, ssCallbackConst, fMessageDlg, EditWebShop, ssStrUtil;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfmWebShops.DoDelete;
  var
    id_, i: integer;
    ResetDef: boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWebShops.DoDelete') else _udebug := nil;{$ENDIF}

{$IF not defined(GOLD)}
(*
  if ((grdMain.SelectedCount = 1) and (ssMessageDlg(LangMan.GetRS('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes))
   or
     ((grdMain.SelectedCount > 1) and
     (ssMessageDlg(Format(LangMan.GetRS('Common', 'DelConfirmEx'),
       [grdMain.SelectedCount]), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes)) then begin
     fProgress.Show;
     with newDataSet do
      try
       Application.ProcessMessages;
       fProgress.Caption := LangMan.GetRS('Common', 'Deleting');
       fProgress.UpDate;
       fProgress.pbMain.Max := grdMain.SelectedCount;
       ResetDef := False;
       for i := 0 to grdMain.SelectedCount - 1 do begin
         TrStart;
         fProgress.lText.Caption := grdMain.SelectedNodes[i].Values[colName.Index];
         try
           if not DeleteDataEx(dmData.SConnection, 'services', 'svcid', grdMain.SelectedNodes[i].Values[colID.Index])
             then raise Exception.Create(dmData.Lng.GetRS('Common', 'DeleteError'));
           if not DelToRecycleBin
             then TrCommit
             else begin
               TrRollback;
               if not AddToRecycleBin(dmData.SConnection, Self.ClassName, grdMain.SelectedNodes[i].Values[colID.Index], grdMain.SelectedNodes[i].Values[colName.Index], False, Self.FunID) then begin
                 ssMessageDlg(LangMan.GetRS('Common', 'ErrorInsToRecycleBin'), ssmtError, [ssmbOk]);
                   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

               end;
             end;
         except
           on e:exception do begin
             TrRollback;
             if (grdMain.SelectedCount = 1)
               then ssMessageDlg(LangMan.GetRS('Common', 'NoDelete') + #10#13 +
                 e.Message, ssmtError, [ssmbOk])
               else if ssMessageDlg(Format(LangMan.GetRS('Common', 'NoDeleteEx'),
                   [grdMain.SelectedNodes[i].Values[colName.Index]]), ssmtError,
                   [ssmbYes, ssmbNo]) <> mrYes then begin
                    TrRollback;
                    Break;
                  end;
           end;
         end;
         fProgress.pbMain.StepIt;
         Application.ProcessMessages;
       end;

       LocateAfterDel;
       aRefresh.Execute;
       UpdateActionList;
       //if RefreshAllClients then dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_ACCOUNTTYPE);

      finally
        fProgress.Hide;
        Free;
      end;
  end;

  inherited;
*)
{$IFEND}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWebShops.DoOpen(AParam: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWebShops.DoOpen') else _udebug := nil;{$ENDIF}

  _ID_ := 'ID';
  RefType := rtWebShops;
  EditingClass := TfrmEditWebShop;

  pcMain.ActivePageIndex := 0;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWebShops.DoInsert;
  var
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
    maxws: Integer;
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWebShops.DoInsert') else _udebug := nil;{$ENDIF}

  {$IFDEF FREE}
    maxws := 1;
  {$ELSE}
    try
      maxws := StrToInt(RegInfo.Values['webshops']);
    except
      maxws := 0;
    end;
  {$ENDIF}

  if maxws <= grdMain.Count then begin
    ssMessageDlg(Format(rs('Common', 'Err_TooManyItems'), [maxws]), ssmtError, [ssmbOK]);
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  with TfrmEditWebShop.Create(nil) do
    try
      MainHandle := Self.Handle;
      ParentNameEx := Self.Name;

      ID := 0;

      UpdateActionList;
      ShowModal;
      
    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWebShops.SetCaptions;
  var
    FTitle: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWebShops.SetCaptions') else _udebug := nil;{$ENDIF}

  (*
  with dmData.Lng do begin
    Self.Caption := GetRS(Self.Name, 'Title');
    FTitle := Self.Caption;
    colName.Caption := GetRS(Self.Name, 'Name');
    colDescription.Caption := GetRS(Self.Name, 'Artikul');
    lCount.Caption := GetRS(Self.Name, 'TotalCount') + ':';
    tsMain.Caption := GetRS(Self.Name, 'MainInfo');

    aAddDel.Caption := GetRS('Common', 'Del');
    aAddSelectAll.Caption := GetRS('Common', 'SelectAll');
    aAddColOptions.Caption := GetRS('Common', 'ColOptions') + '...';

    SendMessage(ParentHandle, WM_SETPARENTCAPTION, Integer(@FTitle), 0);

    FindList.Clear;
    FindList.AddObject(GetRS(Self.Name, 'NameD') + ';' + 'name', Pointer(1));
    FindList.AddObject(GetRS(Self.Name, 'ArtikulD') + ';' + 'artikul', Pointer(2));

    DoRefreshFindParams;
  end;
  *)
  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWebShops.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWebShops.UpdateActionList') else _udebug := nil;{$ENDIF}

  {$IF defined(GOLD)}
    aNew.Enabled := False;
    aPatternInsert.Enabled := False;
    aDel.Enabled := False;
  {$ELSE}
    aNew.Enabled := True;
    aPatternInsert.Enabled := True;
    aDel.Enabled := not cdsMain.IsEmpty;
  {$IFEND}

  aProperties.Enabled := not cdsMain.IsEmpty and (grdMain.SelectedCount = 1);
  aDrillDown.Enabled := True;

  aPaste.Enabled := (GrpID > 0);
  aCut.Enabled := aDel.Enabled;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWebShops.colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWebShops.colImgGetText') else _udebug := nil;{$ENDIF}

  AText := '1';

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWebShops.DoShow;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWebShops.DoShow') else _udebug := nil;{$ENDIF}

  inherited;
  try grdMain.SetFocus; except end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWebShops.SetCurrentID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWebShops.SetCurrentID') else _udebug := nil;{$ENDIF}

  inherited;

  if Value > 0 then cdsMain.Locate(_ID_, Value, []);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWebShops.grdMainKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWebShops.grdMainKeyDown') else _udebug := nil;{$ENDIF}

  if Key = 13 then begin
    grdMainDblClick(grdMain);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWebShops.cdsMainBeforeOpen(DataSet: TDataSet);
 (*var
   m: string;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
   *)
begin
  (*if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWebShops.cdsMainBeforeOpen') else _udebug := nil;{$ENDIF}

  m := '';
  if FDrillDown and (GrpID > 0)
    then m := ' and s.pid in (' + GetDrillDownList(dmData.SConnection, 'services', 'svcid', 'pid', GrpID) + ')'
    else if GrpID > 0 then m := ' and s.pid=' + IntToStr(GrpID);
  cdsMain.Macros.ParamByName('m').AsString := m;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmWebShops.DoRefresh(const AID: integer; AParam: integer);
 var
   FLastIndex: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWebShops.DoRefresh') else _udebug := nil;{$ENDIF}

  FLastIndex := grdMain.TopIndex;
  //cdsMain.DisableControls;
  case AParam of
    -1:
      begin
        GrpID := AID;
        SendMessage(ParentHandle, WM_SETTREEITEM, PGrpInfo(pointer(AID))^.ID, PGrpInfo(pointer(AID))^.PID);
        DSRefresh(cdsMain, _ID_, 0);
      end;

    else
      begin
        GrpID := AID;
        DSRefresh(cdsMain, _ID_, 0);
      end;
  end;

  UpdateActionList;
  cdsMain.Locate(_ID_, AID, []);
  grdMain.TopIndex := FLastIndex;
  //cdsMain.EnableControls;
  SelectFocusedNode;
  grdMain.Update;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWebShops.FrameResize(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWebShops.FrameResize') else _udebug := nil;{$ENDIF}

  inherited;
  grdMain.Adjust(nil, [colImg]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWebShops.cdsMainAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWebShops.cdsMainAfterOpen') else _udebug := nil;{$ENDIF}

  stCount.Caption := IntToStr(cdsMain.RecordCount);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWebShops.srcMainDelayedDataChange(Sender: TObject; Field: TField);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
(*  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWebShops.srcMainDelayedDataChange') else _udebug := nil;{$ENDIF}

  FCurrentID := cdsMain.FieldByName(_ID_).AsInteger;
  if not cdsMain.IsEmpty then begin
    irName.Text := cdsMain.FieldByName('name').AsString;
    irArtikul.Text := cdsMain.FieldByName('artikul').AsString;
    irGrp.Text := cdsMain.FieldByName('grpname').AsString;

    irPrice.Text := FormatFloat(MoneyDisplayFormat,
      cdsMain.FieldByName('price').AsFloat) + ' ' +
      cdsMain.FieldByName('shortname').AsString;

    if cdsMain.FieldByName('istransport').AsInteger = 0
      then irIsTrans.Text := LangMan.GetRS('Common', 'No')
      else irIsTrans.Text := LangMan.GetRS('Common', 'Yes');

    if cdsMain.FieldByName('isnormed').AsInteger = 0 then begin
      irType.Text := LangMan.GetRS(Self.Name, 'SvcNotNormed');
      irNorm.Text := EmptyStr;
    end
    else begin
      irType.Text := LangMan.GetRS(Self.Name, 'SvcNormed');
      irNorm.Text := cdsMain.FieldByName('norm').AsString;
    end;

    irMeasure.Text := cdsMain.FieldByName('msrname').AsString;
    memNotes.Text := cdsMain.FieldByName('notes').AsString;
  end
  else begin
    irName.Text := EmptyStr;
    irArtikul.Text := EmptyStr;
    irGrp.Text := EmptyStr;
    irPrice.Text := EmptyStr;
    irIsTrans.Text := EmptyStr;
    irType.Text := EmptyStr;
    irMeasure.Text := EmptyStr;
    irNorm.Text := EmptyStr;
    memNotes.Text := EmptyStr;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmWebShops.aNewGrpExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWebShops.aNewGrpExecute') else _udebug := nil;{$ENDIF}

  with TfrmEditServices.Create(nil) do
  try
    MainHandle := Self.Handle;
    ParentNameEx := 'fmWebShops';
    OnDate := Self.OnDate;
    GrpID := Self.GrpID;
    cbType.ItemIndex := 1;
    cbType.Enabled := False;
    ID := 0;
    ShowModal;
  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmWebShops.grdMainStartDrag(Sender: TObject; var DragObject: TDragObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWebShops.grdMainStartDrag') else _udebug := nil;{$ENDIF}

  DI.ID := grdMain.FocusedNode.Values[colID.Index];
  DI.GrpID := GrpID;

  if grdMain.SelectedCount = 1
    then DI.Name := grdMain.FocusedNode.Values[colName.Index]
    else DI.Name := IntToStr(grdMain.SelectedCount) + ' ' + LangMan.GetRS(Self.Name, 'MatREx');

  DI.IsGrp := 0;
  DI.Sender := grdMain;
  DI.RefType := Self.RefType;
  grdMain.Tag := Integer(@DI);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmWebShops.WMLocateID(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWebShops.WMLocateID') else _udebug := nil;{$ENDIF}

  cdsMain.Locate(_ID_, M.WParam, []);
  with grdMain do begin
    ClearSelection;
    FocusedNode.Selected := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWebShops.DoCut;
  var
   i: Integer;
   strClip: string;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWebShops.DoCut') else _udebug := nil;{$ENDIF}

  (*
  inherited;

  with Clipboard do begin
    Open;
    Clear;
    strClip := ClipText + 'webshop:';

    for i := 0 to grdMain.SelectedCount - 1 do begin
      strClip := strClip + VarToStr(grdMain.SelectedNodes[i].Values[colID.Index]) + ';'
    end;

    Delete(strClip, Length(strClip), 1);
    SetTextBuf(PAnsiChar(strClip));
    Close;
  end;
  *)

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWebShops.DoPaste;
 var
   strClip: string;
   i, FCount, FID: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWebShops.DoPaste') else _udebug := nil;{$ENDIF}

(*
  inherited;

  with Clipboard do begin
    strClip := AsText;
    if Pos(ClipText + 'svc:', strClip) <> 1 then begin
      ssMessageDlg(LangMan.GetRS('Common', 'ClipboardError'), ssmtError, [ssmbOk]);
        begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

    end;
  end;
  Delete(strClip, 1, Length(ClipText + 'svc:'));
  FCount := WordCount(strClip, [';']);
  fProgress.Caption := LangMan.GetRS('Common', 'Moving');
  fProgress.pbMain.Max := FCount;
  try
    fProgress.Show;
    fProgress.Update;
    for i := 1 to FCount do begin
      FID := StrToInt(ExtractWord(i, strClip, [';']));
      if SetNewSvcGroupParent(FID, GrpID) <> 0 then begin
        ssMessageDlg('Error!', ssmtError, [ssmbOk]);
          begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

      end;
      fProgress.pbMain.StepIt;
      Application.ProcessMessages;
    end;
    DoRefresh(FID);
  finally
    fProgress.Hide;
  end;
*)

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWebShops.DoSomething;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWebShops.DoSomething') else _udebug := nil;{$ENDIF}

  inherited;

  if Param = 0 then pcMain.Visible := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWebShops.DoSetFocus;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWebShops.DoSetFocus') else _udebug := nil;{$ENDIF}

  inherited;

  if grdMain.Visible then grdMain.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWebShops.inspMainDrawCaption(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWebShops.inspMainDrawCaption') else _udebug := nil;{$ENDIF}

  if UseGridOddColor and Odd(Sender.Node.AbsoluteIndex)
    then AColor := GridOddLinesColor
    else AColor := clWindow;
  AFont.Color := clWindowText;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWebShops.inspMainDrawValue(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWebShops.inspMainDrawValue') else _udebug := nil;{$ENDIF}

  if UseGridOddColor and Odd(Sender.Node.AbsoluteIndex) then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWebShops.NotifyChanged;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWebShops.NotifyChanged') else _udebug := nil;{$ENDIF}

  if not JumpFromBuffer then frmMainForm.AddToBuffer(vtRefs, FunID, Self.Caption, ClassName, Tag, FCurrentID, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWebShops.SetParam(const Value: Integer);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWebShops.SetParam') else _udebug := nil;{$ENDIF}

  inherited;
  (*
  FParam := Value;
  pcMain.Visible := not (ModalView and (Value = 0));

  if Value <> 0 then begin
    for i := 0 to pcMain.PageCount - 1 do
      if pcMain.Pages[i] = tsAdd
        then tsAdd.TabVisible := True
        else pcMain.Pages[i].TabVisible := False;

    pcMain.ActivePage := tsAdd;

    case DocInfo.Tag of
      0: tsAdd.ImageIndex := II_WBIN;
      1: tsAdd.ImageIndex := II_WBOUT;
      2: tsAdd.ImageIndex := II_ACCOUT;
      3: tsAdd.ImageIndex := II_ORDEROUT;
    end;
  end;

  mdAdd.Open;
  *)
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWebShops.grdMainDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWebShops.grdMainDblClick') else _udebug := nil;{$ENDIF}

  with grdMain do
    if Count > 0 then begin
      DoProperties;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWebShops.DoDrillDown;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWebShops.DoDrillDown') else _udebug := nil;{$ENDIF}

  inherited;

  DoRefresh(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fWebShops', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
