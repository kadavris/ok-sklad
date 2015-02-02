{$I ok_sklad.inc}
unit UsersEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxCntner6, dxEditor6, StdCtrls, xLngDefs,
  ActnList, ssBaseTypes, ComCtrls, dxDBTLCl6, dxGrClms6, dxTL6, dxDBCtrl6,
  dxDBGrid6, DB, Menus, CheckLst, dxDBTL6, DBClient, ssFormStorage,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxCheckListBox,
  cxPC, cxLookAndFeelPainters, cxButtons, ssBaseDlg, cxGraphics,
  cxCustomData, cxStyles, cxTL, cxInplaceContainer, ssImagePanel, ImgList,
  ssSpeedButton, ssPanel, ssGradientPanel, xButton, cxGroupBox, ssGroupBox,
  cxLabel, ssClientDataSet, TB2Item, cxCheckBox, ssDBGrid, cxSplitter;

type
  TfrmUsersEdit = class(TBaseDlg)
    aCheckAll: TAction;
    aCheckGroup: TAction;
    aUnCheckAll: TAction;
    aUnCheckGroup: TAction;
    aWHP_CheckAll: TAction;
    aWHP_UncheckAll: TAction;
    cdsRights: TssClientDataSet;
    cdsWHPerm: TssClientDataSet;
    chbShowBallance: TcxCheckBox;
    chbShowPrices: TcxCheckBox;
    colGType: TdxDBTreeListColumn;
    colNAme: TcxTreeListColumn;
    colRCanDelete: TdxDBTreeListImageColumn;
    colRCanInsert: TdxDBTreeListImageColumn;
    colRCanModify: TdxDBTreeListImageColumn;
    colRCanPost: TdxDBTreeListImageColumn;
    colRCanView: TdxDBTreeListImageColumn;
    colRFuncFlags: TdxDBTreeListColumn;
    colRFunID: TdxDBTreeListColumn;
    colRID: TdxDBTreeListColumn;
    colRightsName: TdxDBTreeListColumn;
    colRImageIndex: TdxDBTreeListColumn;
    colWHP_Allow: TdxDBTreeListImageColumn;
    colWHP_Name: TdxDBTreeListColumn;
    colWHP_WID: TdxDBTreeListColumn;
    cxSplitter1: TcxSplitter;
    edConfirm: TcxTextEdit;
    edFullName: TcxTextEdit;
    edName: TcxTextEdit;
    edPassword: TcxTextEdit;
    gbMain: TssGroupBox;
    gbRights: TssGroupBox;
    grdRights: TssDBTreeList;
    Image1: TImage;
    imgMain: TImage;
    lbGroups: TcxCheckListBox;
    lConfirm: TLabel;
    lFullName: TLabel;
    lName: TLabel;
    lPassword: TLabel;
    lText1: TcxLabel;
    lText: TcxLabel;
    lWConf: TLabel;
    lWName: TLabel;
    pcAccess: TcxPageControl;
    pcMain: TcxPageControl;
    pmCheck: TTBPopupMenu;
    pmWHPerm: TTBPopupMenu;
    srcRights: TDataSource;
    srcWHPerm: TDataSource;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    tlWH: TssDBTreeList;
    tsAdditional: TcxTabSheet;
    tsGeneral: TcxTabSheet;
    tsMainInfo: TcxTabSheet;
    tsMembership: TcxTabSheet;
    tsRights: TcxTabSheet;
    tsWH: TcxTabSheet;
    tvMain: TcxTreeList;

    procedure aCheckAllExecute(Sender: TObject);
    procedure aCheckGroupExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aUnCheckAllExecute(Sender: TObject);
    procedure aUncheckGroupExecute(Sender: TObject);
    procedure aWHP_CheckAllExecute(Sender: TObject);
    procedure cdsRightsAfterOpen(DataSet: TDataSet);
    procedure cdsRightsBeforeOpen(DataSet: TDataSet);
    procedure cdsWHPermBeforeOpen(DataSet: TDataSet);
    procedure colPicGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colRCanPostGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colRCanViewGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colRightsNameCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure colRightsNameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colWHP_AllowGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure DataModified(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdRightsClick(Sender: TObject);
    procedure grdRightsCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure tlWHClick(Sender: TObject);
    procedure tlWHGetImageIndex(Sender: TObject; Node: TdxTreeListNode; var Index: Integer);
    procedure tsRightsShow(Sender: TObject);
    procedure tvMainSelectionChanged(Sender: TObject);

  private
    FGroups: TStringList;
    FColIndex: integer;
    FSYSID: Integer;
    procedure LoadMembership;
    procedure LoadGroups;
    procedure LoadRights;
    procedure LoadWHPerm;
    procedure SetChecked(const AChecked: boolean; const AColIndex: integer; ANode: TdxTreeListNode);
    function GetGrpIndex(const AID, AType: integer): integer;

  protected
    procedure setid(const Value: integer); override;
    procedure SetParentName(const Value: string); override;

  public
    ParentHandle: HWND;
    procedure SetCaptions; override;
    procedure setFullName(s: String);
    function getLogin: String;
  end;

var
  frmUsersEdit: TfrmUsersEdit;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  StrUtils, ssBaseConst, prConst, ClientData, prFun, ssStrUtil, ssFun,
  fMessageDlg, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}
//==============================================================================================
procedure TfrmUsersEdit.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  pcMain.ActivePageIndex := 0;
  pcAccess.ActivePageIndex := 0;

  //dmData.SmallImages.GetBitmap(1, colRCanInsert.HeaderGlyph);
  //dmData.SmallImages.GetBitmap(3, colRCanModify.HeaderGlyph);
  //dmData.SmallImages.GetBitmap(0, colRCanDelete.HeaderGlyph);
  //dmData.SmallImages.GetBitmap(2, colRCanView.HeaderGlyph);

  cdsRights.Open;

  //LoadGroups;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUsersEdit.setid(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmUsersEdit.setid') else _udebug := nil;{$ENDIF}

  Fid := Value;
  DSRefresh(cdsWHPerm, 'wid', 0);

  with newDataSet do
    try
      if Value <> -1 then begin
        if not IsPattern
          then Self.Caption := LangMan.GetRS(ParentNameEx, 'TitleEdit')
          else Self.Caption := LangMan.GetRS(ParentNameEx, 'TitleAdd');

        ProviderName := 'pUsers_GetByID';
        FetchParams;
        Params.ParamByName('userid').AsInteger := Value;

        Open;
        edName.Text := fieldbyname('name').AsString;
        if Value = 0 then edName.Enabled := False;

        edFullName.Text := fieldbyname('fullname').AsString;
        edPassword.Text := fieldbyname('pass').asstring;
        edConfirm.Text := fieldbyname('pass').AsString;

        try
          if Value = 0
            then FSYSID := 0
            else FSYSID := StrToInt(Copy(FieldByName('sysname').AsString, 5, Length(FieldByName('sysname').AsString) - 4));

        except
          FSYSID := 0;
        end;

        Close;

        LoadRights;
        LoadWHPerm;
        btnApply.Enabled := False;

        if IsPattern then FID := -1;

      end // existing user
      else begin // new user
        LoadRights;
        Self.Caption := rs(ParentNameEx, 'TitleAdd');
      end;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUsersEdit.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
 var
   NewRecord: boolean;
   i, Maxx: integer;
   cdsTemp: TClientDataSet;

  procedure SaveAccess(ADS: TClientDataSet; ANode: TdxTreeListNode);
    var i: integer;
  begin
    if ANode.Values[colRFunID.Index] > 0 then begin
      ADS.FetchParams;
      ADS.Params.ParamByName('userid').AsInteger := Maxx;
      ADS.Params.ParamByName('funid').AsInteger := ANode.Values[colRFunID.Index];
      ADS.Params.ParamByName('canview').AsInteger := ANode.Values[colRCanView.Index];
      ADS.Params.ParamByName('caninsert').AsInteger := ANode.Values[colRCanInsert.Index];
      ADS.Params.ParamByName('canmodify').AsInteger := ANode.Values[colRCanModify.Index];
      ADS.Params.ParamByName('candelete').AsInteger := ANode.Values[colRCanDelete.Index];
      ADS.Params.ParamByName('canpost').AsInteger := ANode.Values[colRCanPost.Index];
      ADS.Execute;
    end
    else for i := 0 to ANode.Count - 1 do SaveAccess(ADS, ANode.Items[i]);
  end;

  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmUsersEdit.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult in [mrOK, mrYes] then begin
    CanClose := False;
    cdsTemp := newDataSet;

    Screen.Cursor := crSQLWait;

    with cdsTemp do
     try
       TrStart;

       try
        NewRecord := (ID = -1);

        if NewRecord then begin
          FSYSID := 0;
          {FSYSID := dmData.SConnection.AppServer.usrs_Add(edName.Text, edPassword.Text, edFullName.Text);
          if FSYSID < 0 then raise Exception.Create('Error');
          }

          Maxx := GetMaxID(dmData.SConnection, 'users', 'userid');
          ProviderName := 'pUsers_Ins';
        end
        else begin // updating
          {if (ID <> 0) and (dmData.SConnection.AppServer.usrs_Update(FSYSID, edName.Text, edPassword.Text, edFullName.Text) < 0)
            then raise Exception.Create('Error');
          }

          Maxx := ID;
          ProviderName := 'pUsers_Upd';
        end;

        FetchParams;
        Params.ParamByName('userid').AsInteger := Maxx;
        Params.ParamByName('name').AsString := edName.Text;
        Params.ParamByName('fullname').AsString := edFullName.Text;
        Params.ParamByName('pass').AsString := edPassword.Text;

        if NewRecord then Params.ParamByName('sysname').AsString := 'USER' + IntToStr(FSYSID);

        Execute;

        if not NewRecord then begin
          ProviderName := 'pUserAccess_Del';
          FetchParams;
          Params.ParamByName('userid').AsInteger := FID;
          Execute;
        end;

        ProviderName := 'pUserAccess_Ins';

        for i := 0 to grdRights.Count - 1 do SaveAccess(cdsTemp, grdRights.Items[i]);

        // saving 'Show Prices' state
        FetchParams;
        Params.ParamByName('userid').AsInteger := Maxx;
        Params.ParamByName('funid').AsInteger := 45;
        Params.ParamByName('canview').AsInteger := Integer(chbShowPrices.Checked);
        Params.ParamByName('caninsert').AsInteger := 0;
        Params.ParamByName('canmodify').AsInteger := 0;
        Params.ParamByName('candelete').AsInteger := 0;
        Params.ParamByName('canpost').AsInteger := 0;
        Execute;

        // saving 'Show Ballance' state
        Params.ParamByName('funid').AsInteger := 46;
        Params.ParamByName('canview').AsInteger := Integer(chbShowBallance.Checked);
        Execute;

        ProviderName := 'pWHPerm_Del';
        FetchParams;
        Params.ParamByName('userid').AsInteger := Maxx;
        Execute;

        ProviderName := 'pWHPerm_Ins';
        FetchParams;
        Params.ParamByName('userid').AsInteger := Maxx;

        for i := 0 to tlWH.Count - 1 do
          if VarToInt(tlWH.Items[i].Values[colWHP_Allow.Index]) <> 0 then begin
            Params.ParamByName('wid').AsInteger := tlWH.Items[i].Values[colWHP_WID.Index];
            Execute;
          end;

        TrCommit;

        SendMessage(MainHandle, WM_REFRESH, Maxx, 0);

        if FID = UserID then InitUserAccess(dmData.SConnection, UserID);

        if (ModalResult = mrYes) then begin
          if NewRecord then begin
            edName.Text := '';
            edName.SetFocus;
            edPassword.Text := '';
            edConfirm.Text := '';
            edFullName.Text := '';
            FID := -1;
            FSYSID := -1;
          end;
        end
        else CanClose := True;

        FModified := False;

       finally
         Free;
         Screen.Cursor := crDefault;
       end;

     except
       on e:exception do begin
         TrRollback;
         ssMessageDlg(rs(ParentNameEx, 'SameUserError') + '. ' + e.message, ssmtError, [ssmbOk]);
       end;
     end;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUsersEdit.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.ActionListUpdate') else _udebug := nil;{$ENDIF}

  aOk.Enabled := (Trim(edName.Text) <> '') and (edPassword.Text = edConfirm.Text);
  aApply.Enabled := aOk.Enabled and FModified;

  aCheckAll.Enabled := (grdRights.FocusedColumn > 0);
  aUnCheckAll.Enabled := aCheckAll.Enabled;
  aUnCheckGroup.Enabled := aCheckAll.Enabled;
  aCheckGroup.Enabled := aCheckAll.Enabled;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUsersEdit.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.DataModified') else _udebug := nil;{$ENDIF}

  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUsersEdit.SetCaptions;
  var
    FItem: TcxTreeListNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    lName.Caption := GetRS(ParentNameEx, 'Name') + ':';
    lFullName.Caption := GetRS(ParentNameEx, 'FullName') + ':';
    lPassword.Caption := GetRS(ParentNameEx, 'Password') + ':';
    lConfirm.Caption := GetRS(ParentNameEx, 'Confirm') + ':';
    tsMainInfo.Caption := GetRS(ParentNameEx, 'MainInfo');
    gbMain.Caption := ' ' + GetRS(ParentNameEx, 'MainInfo') + ' ';
    gbRights.Caption := ' ' + GetRS(ParentNameEx, 'Rights') + ' ';
    tsMembership.Caption := GetRS(ParentNameEx, 'Membership');
    tsRights.Caption := GetRS(ParentNameEx, 'Rights');
    lText.Caption := GetRS(ParentNameEx, 'WarningText');
    lText1.Caption := GetRS(ParentNameEx, 'WarningText1');
    chbShowPrices.Properties.Caption := GetRS(ParentNameEx, 'ShowPrices');
    chbShowBallance.Properties.Caption := GetRS(ParentNameEx, 'ShowBallance');

    tsGeneral.Caption := GetRS('fmUsers', 'General');

    aCheckAll.Caption := GetRS(ParentNameEx, 'CheckAll');
    aUnCheckAll.Caption := GetRS(ParentNameEx, 'UnCheckAll');
    aCheckGroup.Caption := GetRS(ParentNameEx, 'CheckGroup');
    aUnCheckGroup.Caption := GetRS(ParentNameEx, 'UnCheckGroup');
    aWHP_CheckAll.Caption := GetRS(ParentNameEx, 'CheckAll');
    aWHP_UnCheckAll.Caption := GetRS(ParentNameEx, 'UnCheckAll');

    colRightsName.Caption := GetRS(ParentNameEx, 'Functions');
    colRCanDelete.Caption := GetRS('Common', 'Del');
    colRCanModify.Caption := GetRS('Common', 'Properties');
    colRCanInsert.Caption := GetRS('Common', 'Add');
    colRCanView.Caption := GetRS('Common', 'Browse');
    colRCanPost.Caption := GetRS(ParentNameEx, 'CanPost');

    colWHP_Allow.Caption := GetRS('fmUsers', 'Access');
    colWHP_Name.Caption := GetRS('fmUsers', 'WH');
    tsWH.Caption := GetRS('fmUsers', 'WHPerm');

    with tvMain do begin
      Clear;
      FItem := Add;
      FItem.Values[0] := GetRS(ParentNameEx, 'MainInfo');
      FItem.Data := pointer(0);
      FItem.SelectedIndex := 117;
      FItem.ImageIndex := 117;

      {FItem := Add;
      FItem.Data := pointer(1);
      FItem.Values[0] := GetRS(ParentNameEx, 'Membership');
      FItem.SelectedIndex := 30;
      FItem.ImageIndex := 30;
      }

      FItem := Add;
      FItem.Data := pointer(2);
      FItem.Values[0] := GetRS(ParentNameEx, 'Rights');
      FItem.SelectedIndex := 41;
      FItem.ImageIndex := 41;
      FocusedNode := Items[0];
    end;
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUsersEdit.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.SetParentName') else _udebug := nil;{$ENDIF}

  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUsersEdit.colPicGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.colPicGetText') else _udebug := nil;{$ENDIF}

  AText := '1';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUsersEdit.LoadMembership;
  var
    cdsTemp: TClientDataSet;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.LoadMembership') else _udebug := nil;{$ENDIF}

  cdsTemp := TClientDataSet.Create(nil);
  try
    cdsTemp.RemoteServer := dmData.SConnection;
    cdsTemp.ProviderName := 'pUserRel_Get';
    cdsTemp.FetchParams;
    cdsTemp.Params.ParamByName('userid').AsInteger := FID;
    cdsTemp.Open;
    while not cdsTemp.Eof do begin
      lbGroups.Items[GetGrpIndex(cdsTemp.FieldByName('grpid').AsInteger, 0)].Checked := True;
      cdsTemp.Next;
    end;
    cdsTemp.Close;

  finally
    cdsTemp.Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUsersEdit.LoadGroups;
  var
    FItem: TcxCheckListBoxItem;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.LoadGroups') else _udebug := nil;{$ENDIF}

  with TClientDataSet.Create(nil) do
    try
      RemoteServer := dmData.SConnection;
      ProviderName := 'pUserGroups_List';
      Open;
      lbGroups.Clear;
      FGroups.Clear;

      while not Eof do begin
        FItem := lbGroups.Items.Add;
        FItem.Text := fieldbyname('name').AsString;
        FGroups.Add(IntToStr(FItem.Index)+','+fieldbyname('grpid').AsString);
        //lbGroups.AddItem(fieldbyname('name').AsString, TObject(pointer(fieldbyname('grpid').AsInteger)));
        Next;
      end;
      Close;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUsersEdit.cdsRightsBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.cdsRightsBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsRights.Params.ParamByName('profid').AsInteger := ProfID;
  cdsRights.Params.ParamByName('lang').AsString := LangName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUsersEdit.cdsRightsAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.cdsRightsAfterOpen') else _udebug := nil;{$ENDIF}

  grdRights.FullExpand;
  AdjustGrid(grdRights, colRightsName);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUsersEdit.colRCanViewGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  if AText = '' then Atext := '0';

  (*
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.colRCanViewGetText') else _udebug := nil;{$ENDIF}


  if FID = 0 then begin
    if ANode.Values[colRFunID.Index] > 0
      then AText := '1'
      else Atext := '-1';
  end
  else if AText = '' then AText := '0';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmUsersEdit.colRCanPostGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
begin
  if AText = '' then Atext := '0';

  {
  if ANode.Values[colRFunID.Index] > 0 then begin
    if FID <= 0 // admin or new user
      then AText := '1'
      else Atext := '0';

    //try
      if (ANode.Values[colRFuncFlags.Index] and 1) = 0 // 'flags' from 'functions' table
        then AText := '2';
    //except
    //end;
  end
  else AText := '-1';
  }
end;

//==============================================================================================
procedure TfrmUsersEdit.grdRightsClick(Sender: TObject);
  var
    colsstart: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.grdRightsClick') else _udebug := nil;{$ENDIF}

  with grdRights do begin
     colsstart := colRCanView.Index - 1; //  column number -> values[] index shift amount

     if (FocusedNode.Values[colRFunID.Index] > 0) and (FocusedColumn > 0)
     then begin
       if FocusedNode.Values[FocusedColumn + colsstart] = 1
       then begin
         FocusedNode.Values[FocusedColumn + colsstart] := 0;

         if FocusedColumn = 1 then begin // dropping all rights on CanView disabled
           FocusedNode.Values[colRCanView.Index] := 0;
           FocusedNode.Values[colRCanInsert.Index] := 0;
           FocusedNode.Values[colRCanModify.Index] := 0;
           FocusedNode.Values[colRCanDelete.Index] := 0;

           if (FocusedNode.Values[colRFuncFlags.Index] and 1) = 1
             then FocusedNode.Values[colRCanPost.Index] := 0;
         end;
         
         FModified := True;
       end
       else if FocusedNode.Values[FocusedColumn + colsstart] = 0 then begin // -1 value should not affect anything
         FocusedNode.Values[FocusedColumn + colsstart] := 1;
         FocusedNode.Values[colRCanView.Index] := 1; // adding CanView also
         FModified := True;
       end;
     end;
  end; // with

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUsersEdit.SetChecked(const AChecked: boolean; const AColIndex: integer; ANode: TdxTreeListNode);
  var
    i: integer;

 procedure SetChildChecked(const AChecked: boolean; const AColIndex: integer; ANode: TdxTreeListNode);
   var i: integer; v: string;
 begin
   if AChecked then v := '1' else v := '0';

   if ANode.Values[colRFunID.Index] > 0 then begin
     if (AColIndex = colRightsName.Index) or (AColIndex = colRCanView.Index) then begin
       ANode.Values[colRCanView.Index] := v;
       ANode.Values[colRCanInsert.Index] := v;
       ANode.Values[colRCanModify.Index] := v;
       ANode.Values[colRCanDelete.Index] := v;

       if (ANode.Values[colRCanPost.Index] = '0') or (ANode.Values[colRCanPost.Index] = '1')
         then ANode.Values[colRCanPost.Index] := v;
     end
     else if AColIndex = colRCanPost.Index then begin
       if ((ANode.Values[colRCanPost.Index] = '0') or (ANode.Values[colRCanPost.Index] = '1'))
         then ANode.Values[AColIndex] := v;
     end
     else ANode.Values[AColIndex] := v;
   end;

   for i := 0 to ANode.Count - 1 do SetChildChecked(AChecked, AColIndex, ANode.Items[i]);
 end;

  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.SetChecked') else _udebug := nil;{$ENDIF}

  if ANode = nil then begin
    for i := 0 to grdRights.Count - 1 do SetChildChecked(AChecked, AColIndex, grdRights.Items[i]);
  end
  else SetChildChecked(AChecked, AColIndex, ANode);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUsersEdit.aCheckAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.aCheckAllExecute') else _udebug := nil;{$ENDIF}

  SetChecked(True, grdRights.FocusedColumn, nil);
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUsersEdit.aUnCheckAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.aUnCheckAllExecute') else _udebug := nil;{$ENDIF}

  SetChecked(False, grdRights.FocusedColumn, nil);
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUsersEdit.aCheckGroupExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.aCheckGroupExecute') else _udebug := nil;{$ENDIF}

  if grdRights.FocusedNode.Values[colRFunID.Index] > 0
    then SetChecked(True, grdRights.FocusedColumn, grdRights.FocusedNode.Parent)
    else SetChecked(True, grdRights.FocusedColumn, grdRights.FocusedNode);

  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUsersEdit.aUncheckGroupExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.aUncheckGroupExecute') else _udebug := nil;{$ENDIF}

  if grdRights.FocusedNode.Values[colRFunID.Index] > 0
    then SetChecked(False, grdRights.FocusedColumn, grdRights.FocusedNode.Parent)
    else SetChecked(False, grdRights.FocusedColumn, grdRights.FocusedNode);

  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUsersEdit.LoadRights;
  var
    i: integer;
    cdsTemp: TClientDataSet;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}

 function GetR(funcID: Integer; funcIDfound: Boolean; val: String; ID: String): String;
 begin
   if funcIDfound then begin
     if FID <= 0 // admin
       then Result := '1'
       else if funcID > 0 then Result := ifThen(val = '', '0', val);
    end
    else Result := '-1';

    if StrToInt(ID) in [62, 112] //finances root, RSS
      then Result := '-1';
  end;

 //-----------------------------------------------------------------
 procedure GetAccess(ADS: TClientDataSet; ANode: TdxTreeListNode);
   var
     i,funcID: integer;
     funcIDFound: Boolean;
     s: String;
 begin
   funcIDfound := ADS.Locate('funid', ANode.Values[colRFunID.Index], []);

   if VarisNull(ANode.Values[colRFunID.Index])
     then funcID := -1
     else funcID := ANode.Values[colRFunID.Index];

   ANode.Values[colRCanView.Index]   := GetR(funcID, funcIDfound, ADS.fieldbyname('canview').AsString, ANode.Values[colRID.Index]);
   ANode.Values[colRCanInsert.Index] := GetR(funcID, funcIDfound, ADS.fieldbyname('caninsert').AsString, ANode.Values[colRID.Index]);
   ANode.Values[colRCanModify.Index] := GetR(funcID, funcIDfound, ADS.fieldbyname('canmodify').AsString, ANode.Values[colRID.Index]);
   ANode.Values[colRCanDelete.Index] := GetR(funcID, funcIDfound, ADS.fieldbyname('candelete').AsString, ANode.Values[colRID.Index]);

   if funcIDfound
     then ANode.Values[colRFuncFlags.Index] := ADS.fieldbyname('flags').AsString
     else ANode.Values[colRFuncFlags.Index] := '0';

   // researching right vals for CanPost
   if funcID > 0 then begin
     if (ADS.fieldbyname('flags').AsInteger and 1 = 1) // 'flags' from 'functions' table
       then s := GetR(funcID, funcIDfound, ADS.fieldbyname('canpost').AsString, '0')
       else s := '2';
   end
   else s := '-1';

   ANode.Values[colRCanPost.Index] := s;

   if (funcID <= 0) or not funcIDfound or (funcID in [58]) // make it also descend into finances sub-tree
     then for i := 0 to ANode.Count - 1 do GetAccess(ADS, ANode.Items[i]);
 end;

begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.LoadRights') else _udebug := nil;{$ENDIF}

  cdsTemp := newDataSet;

  with cdsTemp do
    try
//todo: should we make some default profiles for usability???

      if FID <= 0 // new user gets Admin privileges by default
        then ProviderName := 'pUserAccess_GetAdmin'
        else begin
          ProviderName := 'pUserAccess_Get';
          FetchParams;
          Params.ParamByName('userid').AsInteger := FID;
        end;

      Open;

      if not IsEmpty then
        for i := 0 to grdRights.Count - 1 do GetAccess(cdsTemp, grdRights.Items[i]);

      if FID > 0 then begin
        if Locate('classname', 'f_ShowPrices', [])
          then chbShowPrices.Checked := (FieldByName('canview').AsInteger = 1);

        if Locate('classname', 'f_ShowBallance', [])
          then chbShowBallance.Checked := (FieldByName('canview').AsInteger = 1);
      end
      else begin
        chbShowPrices.Checked := True;
        chbShowBallance.Checked := True;
      end;

      Close;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUsersEdit.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.FormShow') else _udebug := nil;{$ENDIF}

  try
    edName.SetFocus;

  except
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUsersEdit.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.FormDestroy') else _udebug := nil;{$ENDIF}

  FGroups.Free;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmUsersEdit.GetGrpIndex(const AID, AType: integer): integer;
  var
    i, grpindex, iindex: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.GetGrpIndex') else _udebug := nil;{$ENDIF}

  if AType = 0 then begin
    grpindex := 2;
    iindex := 1;
  end
  else begin
    grpindex := 1;
    iindex := 2;
  end;

  Result := 0;

  for i := 0 to FGroups.Count-1 do
    if StrToInt(ExtractWord(grpindex, FGroups[i], [','])) = AID then begin
      Result := StrToInt(ExtractWord(iindex, FGroups[i], [',']));
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUsersEdit.tvMainSelectionChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.tvMainSelectionChanged') else _udebug := nil;{$ENDIF}

  pcMain.ActivePageIndex := Integer(tvMain.FocusedNode.Data);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUsersEdit.grdRightsCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.grdRightsCustomDrawCell') else _udebug := nil;{$ENDIF}

  if UseGridOddColor and not ASelected and Odd(ANode.AbsoluteIndex) then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUsersEdit.colRightsNameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.colRightsNameGetText') else _udebug := nil;{$ENDIF}

  AText := ' ' + AText;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUsersEdit.colRightsNameCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.colRightsNameCustomDrawCell') else _udebug := nil;{$ENDIF}

  if not VarIsNull(ANode.Values[colGType.Index]) and  (Integer(ANode.Values[colGType.Index]) in [1..5])
    then AFont.Style := [fsBold];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUsersEdit.tsRightsShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.tsRightsShow') else _udebug := nil;{$ENDIF}

  pcAccess.Height := gbRights.Height - pcAccess.Top - 10;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUsersEdit.cdsWHPermBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.cdsWHPermBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsWHPerm.Params.ParamByName('userid').AsInteger := FID;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUsersEdit.tlWHGetImageIndex(Sender: TObject; Node: TdxTreeListNode; var Index: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.tlWHGetImageIndex') else _udebug := nil;{$ENDIF}

  Index := II_WH;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUsersEdit.colWHP_AllowGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.colWHP_AllowGetText') else _udebug := nil;{$ENDIF}

  if AText = '' then AText := '0';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUsersEdit.tlWHClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.tlWHClick') else _udebug := nil;{$ENDIF}

  with tlWH do
    if (FocusedColumn = colWHP_Allow.ColIndex) then begin
      //FocusedNode.Values[0] := 1 - VarToInt(FocusedNode.Values[0]);
      if VarToInt(FocusedNode.Values[colWHP_Allow.Index]) <> 0
        then FocusedNode.Values[colWHP_Allow.Index] := 0
        else FocusedNode.Values[colWHP_Allow.Index] := 1;

      FModified := True;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUsersEdit.LoadWHPerm;
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.LoadWHPerm') else _udebug := nil;{$ENDIF}

  for i := 0 to tlWH.Count - 1 do begin
    if (cdsWHPerm.Locate('wid', tlWH.Items[i].Values[colWHP_WID.Index], []) and
      (cdsWHPerm.FieldByName('allow').AsInteger > 0)) or (FID <= 0)
    then tlWH.Items[i].Values[colWHP_Allow.Index] := 1;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUsersEdit.aWHP_CheckAllExecute(Sender: TObject);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.aWHP_CheckAllExecute') else _udebug := nil;{$ENDIF}

  for i := 0 to tlWH.Count - 1 do
    if (Sender as TComponent).Tag = 0
      then tlWH.Items[i].Values[colWHP_Allow.Index] := 1
      else tlWH.Items[i].Values[colWHP_Allow.Index] := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmUsersEdit.FormResize(Sender: TObject);
  var
    AStyle: integer;
    Offset: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.FormResize') else _udebug := nil;{$ENDIF}

  inherited;

  AStyle := GetWindowLong(grdRights.Handle, GWL_STYLE);

  if AStyle and WS_VSCROLL = WS_VSCROLL
    then Offset := 19
    else Offset := 2;

  colRightsName.Width := grdRights.Width - colRCanView.Width * 5 - Offset;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}

end;

//==============================================================================================
procedure TfrmUsersEdit.setFullName(s: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.setFullName') else _udebug := nil;{$ENDIF}

  edFullName.Text := s;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmUsersEdit.getLogin: String;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmUsersEdit.getLogin') else _udebug := nil;{$ENDIF}

  Result := trim(edName.Text);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('UsersEdit', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
