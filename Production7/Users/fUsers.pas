{$I ok_sklad.inc}
unit fUsers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrame, Menus, ActnList, dxTL6, dxDBCtrl6, dxDBGrid6, dxCntner6,
  DB, DBClient, ssBaseConst, dxDBTLCl6, dxGrClms6, ComCtrls, ExtCtrls,
  dxDBTL6, cxControls, cxSplitter, cxPC, TB2Item,
  ssClientDataSet, ssDBGrid, xLngDefs;

type
  TfmUsers = class(TssBaseFrame)
    cdsAccess: TssClientDataSet;
    cdsMembership: TClientDataSet;
    cdsRights: TssClientDataSet;
    cdsView: TssClientDataSet;
    cdsWHPerm: TssClientDataSet;
    colFullName: TdxDBGridColumn;
    colGType: TdxDBTreeListColumn;
    colID: TdxDBGridColumn;
    colMemberName: TdxDBGridColumn;
    colName: TdxDBGridColumn;
    colPic: TdxDBGridImageColumn;
    colRCanDelete: TdxDBTreeListImageColumn;
    colRCanInsert: TdxDBTreeListImageColumn;
    colRCanModify: TdxDBTreeListImageColumn;
    colRCanPost: TdxDBTreeListImageColumn;
    colRCanView: TdxDBTreeListImageColumn;
    colRFunID: TdxDBTreeListColumn;
    colRID: TdxDBTreeListColumn;
    colRightsName: TdxDBTreeListColumn;
    colRImageIndex: TdxDBTreeListColumn;
    colWHP_Allow: TdxDBTreeListImageColumn;
    colWHP_Name: TdxDBTreeListColumn;
    colWHP_WID: TdxDBTreeListColumn;
    grdMain: TdxDBGrid;
    grdMembership: TdxDBGrid;
    grdRights: TdxDBTreeList;
    pcMain: TcxPageControl;
    splMain: TSplitter;
    srcMembership: TDataSource;
    srcRights: TDataSource;
    srcView: TDataSource;
    srcWHPerm: TDataSource;
    tlWH: TssDBTreeList;
    tsMembership: TcxTabSheet;
    tsRights: TcxTabSheet;
    tsWH: TcxTabSheet;

    function colR_GetText(ANode: TdxTreeListNode; field: String): String;
    procedure cdsAccessBeforeOpen(DataSet: TDataSet);
    procedure cdsMembershipBeforeOpen(DataSet: TDataSet);
    procedure cdsRightsAfterOpen(DataSet: TDataSet);
    procedure cdsRightsBeforeOpen(DataSet: TDataSet);
    procedure cdsWHPermBeforeOpen(DataSet: TDataSet);
    procedure colPicGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colRCanDeleteGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colRCanInsertGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colRCanModifyGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colRCanPostGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colRCanViewGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colRightsNameCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure colRightsNameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colWHP_AllowGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure FrameResize(Sender: TObject);
    procedure grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure grdMainDblClick(Sender: TObject);
    procedure grdRightsCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure grdRightsMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure pcMain_Change(Sender: TObject);
    procedure srcViewDataChange(Sender: TObject; Field: TField);

  private
    FColIndex: integer;
    procedure RefreshDetail;

  protected
    function GetIDForUpdate: integer; override;
    procedure LocateAfterDel;

  public
    procedure UpdateActionList; override;
    procedure DoOpen(AParam: Variant); override;
    procedure DoClose; override;
    procedure DoDelete; override;
    procedure DoRefresh(const AID: integer; AParam: integer = 0); override;
    procedure SetCaptions; override;
    procedure DoInsert; override;
    procedure NotifyChanged; override;
  end;

var
  fmUsers: TfmUsers;

//==============================================================================================
implementation

uses
  ClientData, prFun, prConst, UsersEdit, fMessageDlg, prTypes, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

{ TfmMeasures }

const
     _ID_ = 'userid';

//==============================================================================================
procedure TfmUsers.DoClose;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUsers.DoClose') else _udebug := nil;{$ENDIF}


  cdsView.Close;
  cdsRights.Close;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUsers.DoDelete;
 var
   FErr: string;
   FSYSID: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUsers.DoDelete') else _udebug := nil;{$ENDIF}

  if mrYes = ssMessageDlg(LangMan.GetRS('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo])
  then with newDataSet do
    try
      TrStart;
      try
        ProviderName := 'pUserAccess_Del';
        FetchParams;
        Params.ParamByName(_ID_).AsInteger := cdsView.fieldbyname(_ID_).AsInteger;
        Execute;

        ProviderName := 'pUsers_Del';
        FetchParams;
        Params.ParamByName(_ID_).AsInteger := cdsView.fieldbyname(_ID_).AsInteger;
        Execute;

        {FSYSID := StrToInt(Copy(cdsView.FieldByName('sysname').AsString, 5, Length(cdsView.FieldByName('sysname').AsString) - 4));
        if dmData.SConnection.AppServer.usrs_Delete(FSYSID) <> 0
          then raise Exception.Create('');
        }

        TrCommit;

        LocateAfterDel;
        aRefresh.Execute;
        UpdateActionList;

      except
        on e:exception do begin
          TrRollback;

          if ShowErrorText
            then FErr := rs('common','NoDelete') + crlf + e.Message
            else FErr := rs('common','NoDelete');

          MessageDlg(FErr, mtError, [mbOk], 0);
        end;
      end;

    finally
      Free;
    end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUsers.DoOpen(AParam: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUsers.DoOpen') else _udebug := nil;{$ENDIF}


  EditingClass := TfrmUsersEdit;
  pcMain.ActivePage := tsRights;

  with grdRights do begin
    HighlightColor := GridHighlightColor;
    HighlightTextColor := clWindow;
    HideSelectionColor := GridHideSelColor;
    HideSelectionTextColor := clWindow;
    HideFocusRect := True;
  end;

  with tlWH do begin
    HighlightColor := GridHighlightColor;
    HighlightTextColor := clWindow;
    HideSelectionColor := GridHideSelColor;
    HideSelectionTextColor := clWindow;
    HideFocusRect := True;
  end;

  cdsView.Open;
  cdsView.Close;
  cdsView.Open;
  cdsRights.Open;

  inherited;

  {dmData.SmallImages.GetBitmap(1, colRCanInsert.HeaderGlyph);
  dmData.SmallImages.GetBitmap(3, colRCanModify.HeaderGlyph);
  dmData.SmallImages.GetBitmap(0, colRCanDelete.HeaderGlyph);
  dmData.SmallImages.GetBitmap(2, colRCanView.HeaderGlyph);
  }

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUsers.SetCaptions;
 var
   FTitle: string;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUsers.SetCaptions') else _udebug := nil;{$ENDIF}
   
  with LangMan do begin
    Self.Caption := GetRS(Self.Name, 'Title');
    FTitle := Self.Caption;
    colName.Caption := GetRS(Self.Name, 'Name');
    colFullName.Caption := GetRS(Self.Name, 'FullName');
    colRightsName.Caption := GetRS(Self.Name, 'Functions');

    tsMembership.Caption := GetRS(Self.Name, 'Membership');
    tsRights.Caption := GetRS(Self.Name, 'Rights');

    colRCanDelete.Caption := GetRS('Common', 'Del');
    colRCanInsert.Caption := GetRS('Common', 'Add');
    colRCanModify.Caption := GetRS('Common', 'Properties');
    colRCanView.Caption := GetRS('Common', 'Browse');
    colRCanPost.Caption := GetRS(Self.Name, 'CanPost');

    colWHP_Allow.Caption := GetRS('fmUsers', 'Access');
    colWHP_Name.Caption := GetRS('fmUsers', 'WH');
    tsWH.Caption := GetRS('fmUsers', 'WHPerm');

    SendMessage(ParentHandle, WM_SETPARENTCAPTION, integer(FTitle), 0);
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUsers.grdMainDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUsers.grdMainDblClick') else _udebug := nil;{$ENDIF}

  if grdMain.Count > 0 then aProperties.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUsers.UpdateActionList;
  var
    limited: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUsers.UpdateActionList') else _udebug := nil;{$ENDIF}

  {$IFDEF LIMITED}
    limited := cdsView.Active and (cdsView.recordCount >= limitUsersCount);
  {$ELSE}
    limited := False;
  {$ENDIF}

  aNew.Enabled := not limited;
  aProperties.Enabled := not cdsView.IsEmpty;
  aPatternInsert.Enabled := (not limited) and aProperties.Enabled;
  aRefresh.Enabled := True;

  aDel.Enabled := aProperties.Enabled
    and (cdsView.FieldByName('userid').AsInteger <> UserID)
    and (cdsView.FieldByName('userid').AsInteger <> 0) ;
    
  aDynamic.Enabled := False;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUsers.DoRefresh(const AID: integer; AParam: integer = 0);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUsers.DoRefresh') else _udebug := nil;{$ENDIF}

  DSRefresh(cdsView, _ID_, AID);
  srcViewDataChange(nil, nil);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmUsers.GetIDForUpdate: integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUsers.GetIDForUpdate') else _udebug := nil;{$ENDIF}
   
  Result := cdsView.fieldbyname(_ID_).AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUsers.grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUsers.grdMainCustomDrawCell') else _udebug := nil;{$ENDIF}
   
  if UseGridOddColor and not ASelected and Odd(ANode.AbsoluteIndex)
    then AColor := GridOddLinesColor;

  if (ANode.Values[colID.Index] = 0) and not ASelected
    then AFont.Color := clBtnShadow;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUsers.srcViewDataChange(Sender: TObject; Field: TField);
  var
    i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUsers.srcViewDataChange') else _udebug := nil;{$ENDIF}

  UpdateActionList;
  for i := 0 to pcMain.PageCount-1 do pcMain.Pages[i].Tag := 1;
  RefreshDetail;
  DSRefresh(cdsWHPerm, 'wid', 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUsers.RefreshDetail;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUsers.RefreshDetail') else _udebug := nil;{$ENDIF}

  if pcMain.ActivePage.Tag = 1 then begin
    if pcMain.ActivePage = tsMembership then begin
      DSRefresh(cdsMembership, 'grpid', 0);
    end
    else if pcMain.ActivePage = tsRights then begin
      DSRefresh(cdsAccess, 'funid', 0);
      grdRights.Invalidate;
    end;

    pcMain.ActivePage.Tag := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUsers.cdsMembershipBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUsers.cdsMembershipBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsMembership.Params.ParamByName('userid').AsInteger := cdsView.fieldbyname('userid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUsers.colPicGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUsers.colPicGetText') else _udebug := nil;{$ENDIF}

  AText := '1';

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUsers.pcMain_Change(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUsers.pcMain_Change') else _udebug := nil;{$ENDIF}

  RefreshDetail;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUsers.cdsRightsBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUsers.cdsRightsBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsRights.Params.ParamByName('profid').AsInteger := ProfID;
  cdsRights.Params.ParamByName('lang').AsString := LangName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUsers.cdsRightsAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUsers.cdsRightsAfterOpen') else _udebug := nil;{$ENDIF}

  ExpandAll(grdRights);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUsers.cdsAccessBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUsers.cdsAccessBeforeOpen') else _udebug := nil;{$ENDIF}
   
  if cdsView.FieldByName('userid').AsInteger = 0 // admin
    then cdsAccess.ProviderName := 'pUserAccess_GetAdmin'
    else begin
      cdsAccess.ProviderName := 'pUserAccess_Get';
      cdsAccess.FetchParams;
      cdsAccess.Params.ParamByName('userid').AsInteger := cdsView.fieldbyname('userid').AsInteger;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmUsers.colR_GetText(ANode: TdxTreeListNode; field: String): String;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUsers.colR_GetText('+field+')') else _udebug := nil;{$ENDIF}

  if ANode.Values[colRFunID.Index] > 0 then begin
    if cdsView.FieldByName('userid').AsInteger = 0
      then Result := '1'
      else begin
        if cdsAccess.Locate('funid', ANode.Values[colRFunID.Index], [])
          then Result := cdsAccess.fieldbyname(field).AsString;

        if Result = '' then Result := '0';
      end;

    if StrToInt(ANode.Values[colRID.Index]) in [62, 112] //finances root, RSS
      then Result := '-1';
  end
  else Result := '-1';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUsers.colRCanViewGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUsers.colRCanViewGetText') else _udebug := nil;{$ENDIF}

  Atext := colR_GetText(Anode, 'canview');

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUsers.colRCanInsertGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUsers.colRCanInsertGetText') else _udebug := nil;{$ENDIF}

  Atext := colR_GetText(Anode, 'caninsert');

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUsers.colRCanModifyGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUsers.colRCanModifyGetText') else _udebug := nil;{$ENDIF}

  Atext := colR_GetText(Anode, 'canmodify');

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUsers.colRCanDeleteGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUsers.colRCanDeleteGetText') else _udebug := nil;{$ENDIF}

  Atext := colR_GetText(Anode, 'candelete');

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUsers.colRCanPostGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUsers.colRCanDeleteGetText') else _udebug := nil;{$ENDIF}

  if ANode.Values[colRFunID.Index] > 0 then begin
    if cdsView.FieldByName('userid').AsInteger = 0 // admin
      then AText := '1'
      else Atext := '-1';

    if cdsAccess.Locate('funid', ANode.Values[colRFunID.Index], []) then begin
      if (cdsAccess.fieldbyname('flags').AsInteger and 1 = 1) // 'flags' from 'functions' table
        then Atext := colR_GetText(ANode, 'canpost')
        else AText := '2';
    end;
  end
  else AText := '-1';

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUsers.grdRightsMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  var
    FCol: TdxDBTreeListColumn;
    FHint: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUsers.grdRightsMouseMove') else _udebug := nil;{$ENDIF}

  FCol := grdRights.GetHeaderColumnAt(X,Y);
  if (FCol <> nil) then begin
    if (FColIndex <> FCol.Index) then begin
      FColIndex := FCol.Index;
      Application.CancelHint;
      FHint := FCol.Caption;
      grdRights.Hint := FHint;
    end;
  end
  else grdRights.Hint := EmptyStr;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUsers.FrameResize(Sender: TObject);
  var
   AStyle: integer;
   Offset: integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUsers.FrameResize') else _udebug := nil;{$ENDIF}

  inherited;
  AStyle := GetWindowLong(grdRights.Handle, GWL_STYLE);

  if AStyle and WS_VSCROLL = WS_VSCROLL
    then Offset := 19
    else Offset := 2;

  colRightsName.Width := grdRights.Width-colRCanView.Width*5-Offset;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUsers.grdRightsCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;   var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUsers.grdRightsCustomDrawCell') else _udebug := nil;{$ENDIF}

  if UseGridOddColor and not ASelected and Odd(ANode.AbsoluteIndex)
    then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUsers.DoInsert;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUsers.DoInsert') else _udebug := nil;{$ENDIF}

  {$IF defined(FREE) or defined(LITE)}
  if cdsView.RecordCount > limitUsersCount then begin
    ssMessageDlg(Format(rs('fmUsers', 'FreeLimit'), [limitUsersCount]), ssmtError, [ssmbOk]);
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;
  {$IFEND}

  with TfrmUsersEdit.Create(nil) do
    try
      MainHandle := Self.Handle;
      ParentNameEx := Self.Name;
      OnDate := Self.OnDate;
      ID := -1;
      ShowModal;
      UpdateActionList;

    finally
      Free;
    end;
  //{$I ASPROTECT\reg_crypt_end.inc}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUsers.colRightsNameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUsers.colRightsNameGetText') else _udebug := nil;{$ENDIF}

  AText := ' ' + AText;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUsers.colRightsNameCustomDrawCell(Sender: TObject;  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;  var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUsers.colRightsNameCustomDrawCell') else _udebug := nil;{$ENDIF}
   
  if not VarIsNull(ANode.Values[colGType.Index]) and (Integer(ANode.Values[colGType.Index]) in [1..5])
    then AFont.Style := [fsBold];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUsers.NotifyChanged;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUsers.NotifyChanged') else _udebug := nil;{$ENDIF}
   
  if not JumpFromBuffer
    then frmMainForm.AddToBuffer(vtService, FunID, Self.Caption, ClassName, Tag, FCurrentID, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUsers.cdsWHPermBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUsers.cdsWHPermBeforeOpen') else _udebug := nil;{$ENDIF}
   
  cdsWHPerm.Params.ParamByName('userid').AsInteger := cdsView.FieldByName('userid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUsers.colWHP_AllowGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUsers.colWHP_AllowGetText') else _udebug := nil;{$ENDIF}
   
  if AText = '' then AText := '0';

  if (AText <> '0') or (cdsView.FieldByName('userid').AsInteger = 0)
    then AText := '1';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUsers.LocateAfterDel;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUsers.LocateAfterDel') else _udebug := nil;{$ENDIF}

  with grdMain do
    if SelectedCount > 1 
    then cdsView.First
    else
      if (FocusedNode.Index = grdMain.Count - 1) and (FocusedNode.Index > 0)
        then cdsView.Locate(_ID_, FocusedNode.GetPrev.Values[ColumnByFieldName(KeyField).Index], [])
        else cdsView.Locate(_ID_, FocusedNode.GetNext.Values[ColumnByFieldName(KeyField).Index], []);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fUsers', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
