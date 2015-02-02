{$I ok_sklad.inc}
unit EditWebShop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxCntner6, dxEditor6, StdCtrls,
  ActnList, ssBaseTypes, DB, DBClient, dxExEdtr6, Buttons,
  ComCtrls, Mask, ssFormStorage, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxPC, cxMaskEdit, cxDropDownEdit,
  cxDBEdit, ssClientDataSet, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, ssDBComboBox, cxMemo, cxCheckBox, cxCurrencyEdit,
  cxLookAndFeelPainters, cxButtons, cxRadioGroup, ssBaseDlg, ssBaseConst,
  cxGraphics, cxCustomData, cxStyles, cxTL, ssImagePanel,
  cxInplaceContainer, cxCalc, ssPopupTreeEdit, cxTreeView,
  ssDBTreeView, Menus, ssSpeedButton, ssPanel, ssGradientPanel, ssBevel,
  ssDBLookupCombo, ssLabel, dxTL6, dxDBCtrl6, dxDBGrid6, ssMemDS,
  xButton, cxGroupBox, ssGroupBox, dxDBTLCl6, dxGrClms6, TB2Item,
  ImgList, okLabel, ExtDlgs, ssPageControl, cxSplitter, cxImage,
  cxCheckListBox, CheckLst, TB2ExtItems, cxLabel,
  apTree, ssPopupMenu, cxProgressBar, ssCheckBox, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, xmldom,
  msxmldom;

type
  TTransferMode = (transferModeIO, transferModeIn, transferModeOut);

  TfrmEditWebShop = class(TBaseDlg)
    Animate1: TAnimate;
    aMCDel: TAction;
    aMCNew: TAction;
    aMCProps: TAction;
    aMIns: TAction;
    aMatMove: TAction;
    aMatRsv: TAction;
    aPricesAdd: TAction;
    aPricesDel: TAction;
    aPricesProps: TAction;
    butTransfer: TssSpeedButton;
    butWWWcopyDown: TssSpeedButton;
    cbGrpCustomAlias: TcxCheckBox;
    cbXMLUseDefURL: TcxCheckBox;
    clbLanguages: TcxCheckListBox;
    cxSplitter1: TcxSplitter;
    edDescription: TcxMemo;
    edDocPrefix: TcxTextEdit;
    edDocSuffix: TcxTextEdit;
    edGrpAlias: TcxTextEdit;
    edGrpDescription: TcxTextEdit;
    edGrpMTitle: TcxTextEdit;
    edGrpName: TcxTextEdit;
    edSiteName: TcxTextEdit;
    edXMLLogin: TcxTextEdit;
    edXMLPassword: TcxTextEdit;
    edXMLSecKey: TcxTextEdit;
    edXMLURL: TcxTextEdit;
    gbGroups: TcxGroupBox;
    gbGrpMETA: TcxGroupBox;
    gbGrpMain: TcxGroupBox;
    gbLanguages: TssGroupBox;
    gbMainInfo: TssGroupBox;
    gbTransfer: TssGroupBox;
    gbTransferProcess: TssGroupBox;
    gbXML: TssGroupBox;
    lDescription: TssLabel;
    lDocPrefix: TssLabel;
    lDocSuffix: TssLabel;
    lGroupsInfo: TLabel;
    lGrpDescription: TssLabel;
    lGrpMDescription: TssLabel;
    lGrpMKeywords: TssLabel;
    lGrpMTitle: TssLabel;
    lGrpName: TssLabel;
    lGrpPosition: TssLabel;
    lLangListInfo: TcxLabel;
    lSiteName: TssLabel;
    lTransferLog: TcxLabel;
    lXMLLogin: TssLabel;
    lXMLPassword: TssLabel;
    lXMLSecKey: TssLabel;
    lXMLURL: TssLabel;
    memoGrpMDescription: TcxMemo;
    memoGrpMKeywords: TcxMemo;
    memoTransferLog: TMemo;
    miGroupsAdd: TTBEditItem;
    miGroupsDelete: TTBItem;
    miGroupsNoLangsWarn: TTBItem;
    miTransferIO: TMenuItem;
    miTransferIn: TMenuItem;
    miTransferOut: TMenuItem;
    panGroupsRight: TPanel;
    pbCurrent: TcxProgressBar;
    pbTotal: TcxProgressBar;
    pcMain: TcxPageControl;
    pmGroups: TTBPopupMenu;
    pmTransfer: TssPopupMenu;
    tsGroups: TcxTabSheet;
    tsLanguages: TcxTabSheet;
    tsMain: TcxTabSheet;
    tsTransfer: TcxTabSheet;
    tvGroups: TcxTreeView;
    tvMain: TcxTreeView;
    tvTransferList: TcxTreeView;

    //procedure miGroupsRenameAcceptText(Sender: TObject; var NewText: String; var Accept: Boolean);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure DataModified(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure HTTPWork(Sender: TObject; AWorkMode: TWorkMode; const AWorkCount: Integer);
    procedure aApplyExecute(Sender: TObject);
    procedure butTransferClick(Sender: TObject);
    procedure butWWWcopyDownClick(Sender: TObject);
    procedure cbGrpCustomAliasPropertiesChange(Sender: TObject);
    procedure cbXMLUseDefURLPropertiesChange(Sender: TObject);
    procedure clbLanguagesClickCheck(Sender: TObject; const AIndex: Integer; const OldState, NewState: TcxCheckBoxState);
    procedure cxSplitter1Moved(Sender: TObject);
    procedure edGrpNamePropertiesChange(Sender: TObject);
    procedure miGroupsAddAcceptText(Sender: TObject; var NewText: String; var Accept: Boolean);
    procedure miGroupsDeleteClick(Sender: TObject);
    procedure pmTransferChange(Sender: TObject; Source: TMenuItem; Rebuild: Boolean);
    procedure tvGroupsKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tvGroupsMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure tvMainSelectionChanged(Sender: TObject);
    procedure tvTransferListDblClick(Sender: TObject);

  private
    FCanModify, FMCModified: Boolean;
    FTransferMode: TtransferMode;

    EdCanChange: Boolean;

    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    procedure WMLayoutChanged(var M: TMessage); message WM_LAYOUTCHANGED;

    procedure MakeGroupsTree; // check categories data and construct visual component's tree
    procedure MakeTransferTree; // transfer page settings list
    procedure ExportGroups;
    procedure ExportProducts;
    function  CheckGroupsTree: Boolean;

    function getOrders: Boolean;

  protected
    procedure setid(const Value: integer); override;

  public
    ParentHandle: HWND;

    procedure SetCaptions; override;
    //property CanModify: Boolean read FCanModify write SetCanModify;
    procedure SetParentName(const Value: string); override;
  end;

//----------------------------------------------------------------------------------------------
var
  frmEditWebShop: TfrmEditWebShop;

//----------------------------------------------------------------------------------------------
// public one. used also in CCmain to add new categories on the fly
//  VisualTree = nil when you do not want to update visual tree (used in CCMain)
procedure addWebCatData(node: TapTreeNode; tvNode: TTreeNode; VisualTree: TObject);

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  prConst, prFun, ClientData, Login, ssFun, Udebug, DBTables, xStrUtils,
  prTypes, ssCallbackConst, synacode, Protection,
  MetaProduct, MetaOrder, MetaBusinessPartner,
  StrUtils, ssBaseIntfDlg, fMessageDlg, ssStrUtil, StdConvs,
  XMLDoc, XMLIntf, Regexpr, WebReq, CommonConstants;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';
  prodTree, // product's data used for exporting to the web stores
  groupsTree,// this web shop categories tree. NOTE! it is a ref to global member of wsGroupTrees: TapWoods
  transferTree: TapTree;

{$R *.dfm}
//==============================================================================================
procedure TfrmEditWebShop.FormCreate(Sender: TObject);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWebShop.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  FCanModify := True;
  Screen.Cursor := crSQLWait;

  Application.ProcessMessages;
  pcMain.ActivePage := tsMain;

  FTransferMode := transferModeIO;

  gbGrpMeta.Visible := False;
  gbGrpMain.Enabled := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWebShop.setid(const Value: integer);
  var
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
    Node: TapTreeNode;
    i: Integer;
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditWebShop.setid') else _udebug := nil;{$ENDIF}

  FID := Value;

  try
    butTransfer.Enabled := (StrToInt(RegInfo.Values['webshops']) > 0);

  except
    butTransfer.Enabled := False;
  end;

  fProgress.Show; // let's entertain the user ;)
  fProgress.ProgressMain.Max := 4;
  fProgress.ProgressMain.Position := 0;
  fProgress.Caption := 'Loading';
  fProgress.InfoText := 'Loading main data';

  with newDataSet do
  try
    // checking if somehow ws count is more than allowed (maybe license downgrade or free version db)
    if butTransfer.Enabled then begin
      ProviderName := 'pWebShops_List';
      Open;
      try
        butTransfer.Enabled := (RecordCount <= StrToInt(RegInfo.Values['webshops']));

      except
        butTransfer.Enabled := False;
      end;
      Close;
    end;

    if Value <> 0 then begin
      ProviderName := 'pWebShop_Get';
      FetchParams;
      Params.ParamByName('id').AsInteger := Value;

      Open;
      if not IsEmpty then begin
        edSiteName.Text := FieldByName('name').AsString;
        edDocPrefix.Text := FieldByName('docprefix').AsString;
        edDocSuffix.Text := FieldByName('docsuffix').AsString;
        edDescription.Lines.Text := FieldByName('description').AsString;
        edXMLURL.Text := FieldByName('xmlurl').AsString;
        edXMLLogin.Text := FieldByName('xmllogin').AsString;
        edXMLPassword.Text := FieldByName('xmlpass').AsString;
        edXMLSecKey.Text := FieldByName('xmlseckey').AsString;
      end;

      Close;
    end // if Value <> 0
    else begin
      edSiteName.EditingText := 'www.YourSite.com';
    end;

    try // in case of newly created tree
      fProgress.InfoText := 'Loading languages tree'; fProgress.ProgressMain.StepIt;

      if WebCatsLangTree = nil
        then WebCatsLangTree := TapTree.Create(tree_wwwLangs, cfOwnerTypeWebShop, Value) // loading just ours data
        else WebCatsLangTree.LoadData(Value);

    except
      on e: Exception do debugInstantLog('EditWebShop: WebCatsLangTree load/create exception: ' + e.Message);
    end;

    try
      fProgress.InfoText := 'Loading products tree'; fProgress.ProgressMain.StepIt;
      prodTree := TapTree.Create(tree_wwwProps, cfOwnerTypeProduct); // no data loading as we need tree only

    except
      on e: Exception do debugInstantLog('EditWebShop: product Tree create exception: ' + e.Message);
    end;

    ProviderName := 'pLangList';
    Open;
    while not eof do begin
      {$IFDEF GOLD}if FieldByName('shortname').asString <> 'ENG' then begin Next; Continue; end;{$ENDIF}

      clbLanguages.AddItem(FieldByName('name').AsString);

      // adding branch FullName -> ShortName
      node := WebCatsLangTree.FindFirst(FieldByName('name').asString);
      if node = nil then begin
        node := WebCatsLangTree.AddChild(FieldByName('name').asString);
        node.NodeData := FieldByName('langid').asInteger;
        node.AddChild(FieldByName('shortname').asString);
      end
      else if node.Items[0] = nil then node.AddChild(FieldByName('shortname').asString)
      else if node.Items[0].Name <> FieldByName('shortname').asString
           then node.Items[0].Name := FieldByName('shortname').asString; // brute force fix ;)

      if node.isNew then node.isModified := True; // all items should be saved to ensure the correct product editing behaviour
      if node.Items[0].isNew then node.Items[0].isModified := True;

      {$IFDEF GOLD} // english here is always enabled
        node.FindData(Value, 0, True).asInteger := 1;
      {$ELSE}
        if nil = node.FindData(Value, 0) // set new to disabled
          then node.FindData(Value, 0, True).asInteger := 0;
      {$ENDIF}

      if 1 = node.FindData(Value, 0).asInteger
        then clbLanguages.Items[clbLanguages.Items.Count - 1].State := cbsChecked
        else clbLanguages.Items[clbLanguages.Items.Count - 1].State := cbsUnchecked;

      Next;
    end;
    Close;

    MakeWebProductTree(prodTree, WebCatsLangTree); // see MetaProduct unit
    // OwnerID=0 for group nodes exportable data
    fProgress.InfoText := 'Loading categories tree'; fProgress.ProgressMain.StepIt;

    groupsTree := wsGroupTrees.byName(tree_wwwGroups + IntToStr(FID));
    // creating and loading new if not found. loading all data for products belonging to categories (this is to fix them if needed)
    if groupsTree = nil then groupsTree := wsGroupTrees.Add(tree_wwwGroups + IntToStr(FID), cfOwnerTypeWebShop, apTreeLoadOIDAll);

    MakeGroupsTree;
    MakeTransferTree;

  finally
    Free;
    Screen.Cursor := crDefault;
    fProgress.Hide;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWebShop.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    NewRecord: Boolean;
    m,s: string;
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWebShop.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult in [mrOK, mrYes] then begin
    CanClose := False;

    CheckGroupsTree; // just warn if something is missing

    Screen.Cursor := crSQLWait;

    fProgress.Show; // let's entertain the user ;)
    fProgress.ProgressMain.Max := 4;
    fProgress.ProgressMain.Position := 0;
    fProgress.Caption := 'Saving';
    fProgress.InfoText := 'Saving main data';

    with newDataSet do
    try
      TrStart;

      try
        NewRecord := (ID = 0);

        if NewRecord then begin
          ProviderName := 'pWebShop_Ins';
          FetchParams;
        end
        else begin
          ProviderName := 'pWebShop_Upd';
          FetchParams;
          Params.ParamByName('id').AsInteger := ID;
        end;

        Params.ParamByName('name').AsString := trim(edSiteName.Text);
        Params.ParamByName('docprefix').AsString := trim(edDocPrefix.Text);
        Params.ParamByName('docsuffix').AsString := trim(edDocSuffix.Text);
        Params.ParamByName('description').AsString := trim(edDescription.Lines.Text);
        Params.ParamByName('xmlurl').AsString := trim(edXMLURL.Text);
        Params.ParamByName('xmllogin').AsString := trim(edXMLLogin.Text);
        Params.ParamByName('xmlpass').AsString := trim(edXMLPassword.Text);
        Params.ParamByName('xmlseckey').AsString := trim(edXMLSecKey.Text);

        Execute;

        // setting ID for tree data
        if NewRecord then begin
          ProviderName := 'pWebShop_GetByName';
          FetchParams;
          Params.ParamByName('name').AsString := trim(edSiteName.Text);
          Open;
          FID := FieldByName('id').AsInteger;
          Close;

          prodTree.ChangeOID(0, FID);
          transferTree.ChangeOID(0, FID);
          WebCatsLangTree.ChangeOID(0, FID);
          groupsTree.Name := tree_wwwGroups + IntToStr(FID);
        end;

        // for the case of rollback
        WebCatsLangTree.MCSaveState;
        prodTree.MCSaveState;
        groupsTree.MCSaveState;
        transferTree.MCSaveState;

        fProgress.InfoText := 'Saving language tree'; fProgress.ProgressMain.StepIt;
        if not WebCatsLangTree.Save(True) then raise Exception.Create(rs(Self.Name, 'err_save_langtree', 1) + WebCatsLangTree.lastErrorText);
        if not WebCatsLangTree.SaveData(FID, True) then raise Exception.Create(rs(Self.Name, 'err_save_langtreedata', 1) + WebCatsLangTree.lastErrorText);

        fProgress.InfoText := 'Saving product tree'; fProgress.ProgressMain.StepIt;
        if not prodTree.Save(True) then raise Exception.Create(rs(Self.Name, 'err_save_prodtree', 1) + prodTree.lastErrorText);

        // this should refresh all visual trees on other forms. we do it before saving in case of weird error ruin it. but changes already here.
        processCommand(cltIcmdWebCatRefresh, VarArrayOF([FID, 0]));

        fProgress.InfoText := 'Saving categories tree'; fProgress.ProgressMain.StepIt;
        fProgress.ShowDetail; fProgress.ProgressDet.Position := 0;
        // for fixed tree we'll try to load products assignments and then re-saving that complete tree as new, deleting old one
        if groupsTree.BrokenItems <> 0 then begin
          fProgress.ProgressDet.Max := 3;
          fProgress.InfoDet := 'Fixing: Preloading product data';
          if not groupsTree.LoadData(-1) then raise Exception.Create(rs(Self.Name, 'err_save_cat_pre_fix', 1) + groupsTree.lastErrorText);
          fProgress.ProgressDet.StepIt; fProgress.InfoDet := 'Fixing: Saving new tree';

          if not groupsTree.SaveAs(True) then raise Exception.Create(rs(Self.Name, 'err_save_cat_post_fix', 1) + groupsTree.lastErrorText);
          fProgress.ProgressDet.StepIt; fProgress.InfoDet := 'Fixing: Saving tree data';

          if not groupsTree.SaveData(-1, True) then raise Exception.Create(rs(Self.Name, 'err_save_cat_pf_data', 1) + groupsTree.lastErrorText);
        end
        else begin
          fProgress.ProgressDet.Max := 2;
          fProgress.InfoDet := 'Saving tree';
          if not groupsTree.Save(True) then raise Exception.Create(rs('Common', 'err_save_webcat', 1) + groupsTree.lastErrorText);
          groupsTree.Sweep(TRue, True); // physically remove deleted nodes from tree
          fProgress.ProgressDet.StepIt; fProgress.InfoDet := 'Saving tree data';

          if not groupsTree.SaveData(0, True) then raise Exception.Create(rs('Common', 'err_save_webcatdata', 1) + groupsTree.lastErrorText);
        end;
        fProgress.ProgressDet.StepIt;
        fProgress.HideDetail;

        fProgress.InfoText := 'Saving transfer tree'; fProgress.ProgressMain.StepIt;
        if not transferTree.Save(True) then raise Exception.Create(rs('Common', 'err_save_transf', 1) + transferTree.lastErrorText);

        if not transferTree.FindFirst('transferNotSaveSettings').FindData(FID).asBoolean
          then transferTree.SaveData(FID, True);

        Close;

        if ModalResult = mrYes then begin
          if NewRecord then begin
            if not IsPattern then begin
              edSiteName.Clear;
              edDocPrefix.Clear;
              edDocSuffix.Clear;
              edDescription.Lines.Clear;
              edXMLURL.Clear;
              edXMLLogin.Clear;
              edXMLPassword.Clear;
              edXMLSecKey.Clear;
            end;

            edSiteName.SetFocus;
            FID := 0;
          end
        end
        else CanClose := True;

        TrCommit;

        WebCatsLangTree.MCClearState;
        prodTree.MCClearState;
        groupsTree.MCClearState;
        transferTree.MCClearState;

        FModified := False;

      finally
        Free;
        Screen.Cursor := crDefault;
        fProgress.Hide;
      end;

    except
      on e:exception do begin
        fProgress.Hide;

        TrRollback;

        WebCatsLangTree.MCrestoreState;
        prodTree.MCrestoreState;
        groupsTree.MCrestoreState;
        transferTree.MCrestoreState;

        ssMessageDlg(e.Message, ssmtError, [ssmbOk], '', False, True);
      end;
    end;
  end; //if ModalResult in [mrOK, mrYes]

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWebShop.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWebShop.ActionListUpdate') else _udebug := nil;{$ENDIF}

  if cbType.ItemIndex = 0 then begin
    aOk.Enabled := ((((Trim(edName.Text) <> '') and
      (Trim(edArtikul.Text) <> '') and
      (lcbMeasure.Text <> '') and
      (trim(lcbParent.EditingText) <> '')) or (IDs <> '')) and
      (((cbType.ItemIndex = 0) and
      (lcbCurrency.Text>''))) and FModified) or not CanModify;
  end
  else begin
    aOk.Enabled := (Trim(edName.Text) <> '') and FModified;
  end;
  aApply.Enabled := aOk.Enabled and FModified;

  aMCNew.Enabled := True and CanModify;
  aMCProps.Enabled := not mdMC.IsEmpty and CanModify and
    (tvMain.FocusedNode.Parent <> FMatChangeNode);
  aMCDel.Enabled := not mdMC.IsEmpty and CanModify;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditWebShop.DataModified(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWebShop.DataModified') else _udebug := nil;{$ENDIF}
  FModified := True;
  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWebShop.aApplyExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWebShop.aApplyExecute') else _udebug := nil;{$ENDIF}
  ModalResult := mrYes;
  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWebShop.SetCaptions;
  var
    node: TTreeNode;
    clbitem: TcxCheckListBoxItem;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWebShop.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    panTitleBar.Caption := GetRS(ParentNameEx, 'Title');
    tsMain.Caption := GetRS(ParentNameEx, 'tsMain');
    tsLanguages.Caption := GetRS(ParentNameEx, 'tsLanguages');
    tsTransfer.Caption := GetRS(ParentNameEx, 'tsTransfer');

    gbMainInfo.Caption := ' ' + GetRS(ParentNameEx, 'gbMainInfo') + ' ';
    gbXML.Caption := ' ' + GetRS(ParentNameEx, 'gbXML') + ' ';
    gbLanguages.Caption := ' ' + GetRS(ParentNameEx, 'gbLanguages') + ' ';
    gbTransfer.Caption := ' ' + GetRS(ParentNameEx, 'gbTransfer') + ' ';
    gbTransferProcess.Caption := ' ' + GetRS(ParentNameEx, 'gbTransferProcess') + ' ';
    gbGroups.Caption := ' ' + GetRS(ParentNameEx, 'gbGroups') + ' ';
    gbGrpMETA.Caption := ' ' + GetRS(ParentNameEx, 'gbGrpMETA') + ' ';
    gbGrpMain.Caption := ' ' + GetRS(ParentNameEx, 'gbGrpMain') + ' ';

    butWWWcopyDown.Hint := GetRS(ParentNameEx, 'butWWWcopyDown');

    lSiteName.Caption := GetRS(ParentNameEx, 'lSiteName') + ':';
    lDocPrefix.Caption := GetRS(ParentNameEx, 'lDocPrefix') + ':';
    lDocSuffix.Caption := GetRS(ParentNameEx, 'lDocSuffix') + ':';
    lDescription.Caption := GetRS(ParentNameEx, 'lDescription') + ':';

    lXMLURL.Caption := GetRS(ParentNameEx, 'lXMLURL') + ':';
    lXMLLogin.Caption := GetRS(ParentNameEx, 'lXMLLogin') + ':';
    lXMLPassword.Caption := GetRS(ParentNameEx, 'lXMLPassword') + ':';
    lXMLSecKey.Caption := GetRS(ParentNameEx, 'lXMLSecKey') + ':';
    cbXMLUseDefURL.Properties.Caption := GetRS(ParentNameEx, 'cbXMLUseDefURL');

    lLangListInfo.Caption := GetRS(ParentNameEx, 'lLangListInfo');

    lGroupsInfo.Caption := GetRS(ParentNameEx, 'lGroupsInfo');
    lGrpName.Caption := GetRS(ParentNameEx, 'lGrpName');
    lGrpDescription.Caption := GetRS(ParentNameEx, 'lGrpDescription');
    cbGrpCustomAlias.Properties.Caption := GetRS(ParentNameEx, 'cbGrpCustomAlias');
    lGrpMTitle.Caption := GetRS(ParentNameEx, 'lGrpMTitle');
    lGrpMKeywords.Caption := GetRS(ParentNameEx, 'lGrpMKeywords');
    lGrpMDescription.Caption := GetRS(ParentNameEx, 'lGrpMDescription');
    miGroupsNoLangsWarn.Caption := GetRS(ParentNameEx, 'miGroupsNoLangsWarn');
    miGroupsAdd.Caption := GetRS(ParentNameEx, 'miGroupsAdd');
    miGroupsDelete.Caption := GetRS(ParentNameEx, 'miGroupsDelete');

    lTransferLog.Caption := GetRS(ParentNameEx, 'lTransferLog') + ':';

    butTransfer.Caption := GetRS(ParentNameEx, 'miTransferIO');
    miTransferIO.Caption := GetRS(ParentNameEx, 'miTransferIO');
    miTransferIn.Caption := GetRS(ParentNameEx, 'miTransferIn');
    miTransferOut.Caption := GetRS(ParentNameEx, 'miTransferOut');

    with tvMain.Items do begin
      Clear;
      node := Add(nil, rs(ParentNameEx, 'tsMain'));
      node.Data := Pointer(0);
      node.SelectedIndex := 210;
      node.ImageIndex := 210;

      node := Add(nil, rs(ParentNameEx, 'tsGroups'));
      node.Data := Pointer(3);
      node.SelectedIndex := 60;
      node.ImageIndex := 60;

      node := Add(nil, rs(ParentNameEx, 'tsLanguages'));
      node.Data := Pointer(1);
      node.SelectedIndex := 4;
      node.ImageIndex := 4;

      node := Add(nil, rs(ParentNameEx, 'tsTransfer'));
      node.Data := Pointer(2);
      node.SelectedIndex := 20;
      node.ImageIndex := 20;
    end;
    tvMain.Selected := tvMain.Items[0];

  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWebShop.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWebShop.SetParentName') else _udebug := nil;{$ENDIF}

  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWebShop.WMRefresh(var M: TMessage);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWebShop.WMRefresh') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditWebShop.tvMainSelectionChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWebShop.tvMainSelectionChanged') else _udebug := nil;{$ENDIF}

  if tvMain.Selected = nil then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  pcMain.ActivePageIndex := Integer(tvMain.Selected.Data);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWebShop.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWebShop.FormShow') else _udebug := nil;{$ENDIF}

  inherited;

  tvMainSelectionChanged(tvMain);
  FModified := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWebShop.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWebShop.FormKeyDown') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWebShop.WMLayoutChanged(var M: TMessage);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWebShop.WMLayoutChanged') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditWebShop.FormDestroy(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWebShop.FormDestroy') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditWebShop.cxSplitter1Moved(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWebShop.cxSplitter1Moved') else _udebug := nil;{$ENDIF}

  inherited;
  tvMain.Repaint;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWebShop.FormResize(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWebShop.FormResize') else _udebug := nil;{$ENDIF}

  inherited;
  tvMain.Repaint;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWebShop.cbXMLUseDefURLPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWebShop.cbXMLUseDefURLPropertiesChange') else _udebug := nil;{$ENDIF}

  inherited;
  edXMLURL.Enabled := not cbXMLUseDefURL.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWebShop.clbLanguagesClickCheck(Sender: TObject; const AIndex: Integer; const OldState, NewState: TcxCheckBoxState);
  var
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
    node: TapTreeNode;
    langID: Integer;
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWebShop.clbLanguagesClickCheck') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF GOLD}
    clbLanguages.Items[Aindex].State := cbsChecked; // english is the only and always ON

  {$ELSE}
    node := WebCatsLangTree.FindFirst(clbLanguages.Items[AIndex].Text);
    node.FindData(ID, 0).asInteger := BoolToInt(NewState = cbsChecked);
    langID := node.nodeData;

    (*if (OldState = cbsChecked)
       and (WebCatsLangTree.FindFirst(clbLanguages.Items[AIndex].Text).FindData(ID, 0).asInteger = 1)
       and (mrYes <> ssMessageDlg(rs('Common', 'Warn_DataLost'), ssmtWarning, [ssmbYes, ssmbNo]))
    then begin
      clbLanguages.Items[Aindex].State := cbsChecked;
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;
    *)

    {node := groupstree.FirstNode;
    while node <> nil do begin
      if node.pos = -LangID then node.isDeleted := not node.isDeleted;
      node := node.Nextnode;
    end;
    }

    MakeGroupsTree;
  {$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWebShop.ExportGroups;
  {$IFNDEF FREE}
  var
    node, langNode: TapTreeNode;
    s, add, prods: String;
    i, cnt, packsize: Integer;
    stream: TStringStream;
  {$ENDIF}
begin
  {$IFNDEF FREE}
  packsize := 5; // max items in one XML packet
  pbCurrent.Properties.Max := packSize + 1; // +1 to send
  pbCurrent.Position := 0;

  groupsTree.LoadData(-1); // loading all products membership

  node := groupsTree.FirstNode;
  if node = groupsTree then Exit; // nothing there

  stream := TStringStream.Create('');
  stream.WriteString('<Categories>' + crlf);

  // getting count for progress bar
  cnt := 0;
  while node <> nil do begin
    if not node.isDeleted then inc(cnt);
    node := node.NextNode;
  end;
  pbTotal.Properties.Max := cnt;

  // main loop
  cnt := 0;
  node := groupsTree.FirstNode;
  while node <> nil do begin
    if (not node.isDeleted) and (node.FindData(0, 0).asInteger = 0) then begin  // skip lang nodes

      s := s + '<Category>' + crlf
        + '  <Id>' + IntToStr(node.id) + '</Id>' + crlf
        + '  <ParentId>';

      if node.Parent <> groupsTree
        then s := s + IntToStr(node.Parent.ID)
        else s := s + '0';

      s := s + '</ParentId>' + crlf
        + '  <Name>' + node.Name + '</Name>' + crlf
        + '  <Description>' + node.FindData(0, 1).asString + '</Description>' + crlf
        + '  <Position>' + node.FindData(0, 2).asString + '</Position>' + crlf;

      add := '';

      // collecting languages info
      langNode := node.nextNode;

      while langNode <> nil do begin
        if not langNode.isDeleted and (langNode.FindData(0, 0).asInteger > 0) then
          add := add + '  <Text>' + crlf
            + '    <LangId>' + WebCatsLangTree.findFirst(-langNode.pos).Items[0].Name + '</LangId>' + crlf
            + '    <Name>' + langNode.FindData(0, 2).asString + '</Name>' + crlf
            + '    <Descr>' + langNode.FindData(0, 1).asString + '</Descr>' + crlf
            + '    <MetaCharset>' + langNode.FindData(0, 3).asString + '</MetaCharset>' + crlf
            + '    <MetaKeywords>' + langNode.FindData(0, 4).asString + '</MetaKeywords>' + crlf
            + '    <MetaTitle>' + langNode.FindData(0, 5).asString + '</MetaTitle>' + crlf
            + '    <MetaDescr>' + langNode.FindData(0, 6).asString + '</MetaDescr>' + crlf
            + '    <Alias>' + crlf
            + '        <Name>' + langNode.FindData(0, 8).asString + '</Name>' + crlf
            + '    </Alias>' + crlf
            + '    </Text>' + crlf;

        langNode := langNode.NextSibling;
      end; // while langNode <> nil

      if add <> '' then s := s + '  <Texts>' + crlf + add + '  </Texts>' + crlf;

      s := s + '</Category>' + crlf + crlf;
      add := '';
      stream.WriteString(s);
      s := '';

      inc(cnt);
      pbCurrent.Position := cnt;
    end; // if (not node.isDeleted) and (node.FindData(0, 0).asInteger = 0)

    node := node.NextNode;

    if (node = nil) or (cnt = packsize) then begin
      stream.WriteString(crlf + '</Categories>');
      memoTransferLog.Lines.Add(rs(ParentNameEx, 'xml_cat_inserting'));
      XMLshowServerResponse(XMLpost(FID, 'InsertCategories', Stream, memoTransferLog), True, memoTransferLog);
      if cmdLineDebugLevel > 5 then memoTransferLog.Lines.Add('Cats out: ' + crlf + stream.dataString + crlf + '---------------------------');

      stream.Size := 0;
      stream.WriteString('<Categories>' + crlf);

      pbTotal.Position := pbTotal.Position + cnt;
      cnt := 0;
      pbCurrent.Position := 0;
    end
    else begin
      //memoTransferLog.Lines.Add(rs(ParentNameEx, 'xml_cat_error'));
    end
  end; // while node <> nil

  stream.Free;
  {$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWebShop.ExportProducts;
  {$IFNDEF FREE}
  var
    tree: TapTree;
    node: TapTreeNode;
    data: TapTreeNodeData;
    prod: TMetaProduct;
    toLog: String;
    status: boolean;
    i: Integer;
    Stream: TStringStream;
  {$ENDIF}
begin
  {$IFNDEF FREE}
  Stream := nil;
  prod := nil;
  tree := nil;

  try // finally
    try //except
      memoTransferLog.Lines.Add(rs(ParentNameEx, 'xml_prod_deleting'));
      XMLshowServerResponse(XMLpost(FID, 'DeleteAllProducts', nil, memoTransferLog), True, memoTransferLog);

      Stream := TStringStream.Create('');
      prod := TMetaProduct.Create(nil);

      // getting tree to know in advance which prods to look for
      tree := TapTree.Create( tree_wwwProps, cfOwnerTypeProduct );
      node := tree.FindFirst('Post');
      node.LoadData(-1, False); // loading everything for this node

      pbTotal.Position := 0;
      pbTotal.Properties.Max := node.DataCount;
      pbTotal.Properties.OverloadValue := ((node.DataCount * 80) div 100) + 1; // ~ 80%

      for i := 0 to node.DataCount - 1 do begin
        data := node.Data[i];

        if (data.CID = FID) and data.asBoolean then begin // does this prod marked for export to this website?
          pbCurrent.Position := 0;

          status := prod.XMLForWeb(stream, FID, data.OwnerID);

          if prod.ID = -1
            then toLog := '*** ' + rs(ParentNameEx, 'Export_ProductID') + IntTostr(data.OwnerID) + ': '
            else toLog := '*** ' + rs(ParentNameEx, 'Export_ProductID') + IntTostr(prod.ID) + ' (' + prod.Name + '): ';

          if status then begin
            memoTransferLog.Lines.add(toLog);
            XMLshowServerResponse(
              XMLpost(FID, 'InsertProducts', Stream, memoTransferLog{, HTTPWork}),
              True, memoTransferLog
            );
          end
          else memoTransferLog.Lines.add(toLog + prod.StatusMessage);
        end;

        pbTotal.Position := pbTotal.Position + 1;
        Application.ProcessMessages;
        if butTransfer.Tag = 2 then Break; // user cancelled
      end; // for i := 0 to node.DataCount - 1

    except
      on e: exception do begin
        debugInstantLog('! ERROR: TfrmEditWebShop.ExportProducts except: ' + e.Message);
      end;
    end;

  finally
    pbCurrent.Position := pbCurrent.Properties.Max;
    prod.Free;
    tree.Free;
    Stream.Free;
  end;
  {$ENDIF}
end;

//==============================================================================================
function TfrmEditWebShop.getOrders: Boolean;
  {$IFNDEF FREE}
  var
    order: TMetaOrder;
    send: TStringStream;
    resp, webID: String;
    orderXML, respXML: iXMLDocument;
    Node, oNode: IXMLNode;
    i: Integer;
  {$ENDIF}
begin
  Result := False;
  
  {$IFNDEF FREE}
  if butTransfer.Tag = 2 then Exit; // user cancelled

  send := TStringStream.Create('');

  order := TMetaOrder.Create(nil);

  //orderXML := TXMLDocument.Create(nil);

  orderXML := LoadXMLData(XMLPost(FID, 'GetNewOrders', nil, memoTransferLog));

  while True do begin
    try
      Node := orderXML.DocumentElement.ChildNodes.First;
      while AnsiLowerCase(Node.NodeName) <> 'data' do Node := Node.NextSibling; // skipping specials
      Node := Node.ChildNodes.First;
      while AnsiLowerCase(Node.NodeName) <> 'orders' do Node := Node.NextSibling; // finding <Orders>

    except
      memoTransferLog.Lines.Add(rs(ParentNameEx, 'xml_error_no_more_orders'));
      Break;
    end;

    if Node.ChildNodes.Count = 0 then begin // no <Order> tags
      memoTransferLog.Lines.Add(rs(ParentNameEx, 'xml_error_no_more_orders'));
      Break;
    end;

    node := Node.ChildNodes.First; // descending to first <Order>

    repeat
      if butTransfer.Tag = 2 then Break; // user cancelled

      if not order.LoadXML(orderXML, Node) then memoTransferLog.Lines.Add(rs(ParentNameEx, 'xml_error_order_load') + order.lastErrorText)
      else if not order.BusPar.saveData    then memoTransferLog.Lines.Add(rs(ParentNameEx, 'xml_error_buspar_save'))
      else if not order.SaveData           then memoTransferLog.Lines.Add(rs(ParentNameEx, 'xml_error_order_save') + TrError)
      else begin // sending ACK
        send.Position := 0;
        send.Size := 0;

        for i := 0 to Node.ChildNodes.Count - 1 do // finding site's order id
          if AnsiLowerCase(Node.ChildNodes[i].NodeName) = 'id' then begin
            webID := Node.ChildNodes[i].Text;
            send.WriteString('<Orders><Order><WebsiteId>' + WebID + '</WebsiteId>');
            send.WriteString('<ProgramId>' + IntToStr(order.ID) + '</ProgramId>');
            send.WriteString('<Status>1</Status><Notes>ãû-ãû</Notes></Order></Orders>');
            Break;
          end;

        resp := XMLPost(FID, 'DocumentsStatus', send, memoTransferLog);
        memoTransferLog.Lines.Add(Format(rs(ParentNameEx, 'xml_order_ACK_sent'), [order.ID, order.Num, webID, order.Positions.Count]));
        XMLshowServerResponse(rs(ParentNameEx, 'xml_order_ACK_resp') + resp, True, memoTransferLog);

        if cmdLineDebugLevel > 5 then memoTransferLog.Lines.Add('XML:' + resp);
      end;

      order.Clear;
      try
        node := Node.NextSibling;
      except
        node := nil;
      end;
    until Node = nil;

    break;
  end; // while TRue

  try
    send.Free;
    order.Free;
    orderXML := nil;
  except
  end;

  memoTransferLog.Lines.Add('Orders transfer done');
  {$ENDIF}
end;

//==============================================================================================
procedure TfrmEditWebShop.butTransferClick(Sender: TObject);
  var
    i, n: Integer;
    s: String;
    Stream, Response: TStringStream;
    mds: TssClientDataSet;
begin
  {$IFNDEF FREE}
  case butTransfer.Tag of
    0:
      butTransfer.Tag := 1; // start

    1:
      begin // cancel requested
        butTransfer.Tag := 2;
        Exit;
      end;

    2:
      Exit;
  end;

  butTransfer.Caption := rs('Common', 'Cancel');
  butTransfer.Repaint;
  Application.ProcessMessages;

  Stream := TStringStream.Create('');

  memoTransferLog.Clear;
  Animate1.Active := True;
  pbTotal.Position := 0;
  pbTotal.Properties.Max := 100;

  with transferTree do begin
    // Categories ***************************************************
    if (butTransfer.Tag <> 2) and FindFirst('transferGroups').FindData(FID).asBoolean and CheckGroupsTree
    then begin
      memoTransferLog.Lines.Add(stream.DataString);
      memoTransferLog.Lines.Add('-------------------------------------');

      memoTransferLog.Lines.Add(rs(ParentNameEx, 'xml_cat_deleting'));
      XMLshowServerResponse(XMLpost(FID, 'DeleteAllCategories', nil, memoTransferLog), True, memoTransferLog);

      ExportGroups;

    end; // Categories

    // Products ***************************************************
    if (butTransfer.Tag <> 2) and FindFirst('transferProd').FindData(FID).asBoolean then begin
      ExportProducts;

    end; // Products

    // Orders ***************************************************
    if (butTransfer.Tag <> 2) and FindFirst('transferOrders').FindData(FID).asBoolean then begin
      getOrders;

    end;

    pbCurrent.Position := pbCurrent.Properties.Max;
  end; // with transferTree

  pbTotal.Position := pbTotal.Properties.Max;;
  Animate1.Active := False;
  Stream.Free;
  //Response.Free;

  case FTransferMode of
    transferModeIO:  butTransfer.Caption := miTransferIO.Caption;
    transferModeIn:  butTransfer.Caption := miTransferIn.Caption;
    transferModeOut: butTransfer.Caption := miTransferOut.Caption;
  end;
  butTransfer.Tag := 0;
  {$ENDIF}
end;

//==============================================================================================
// checking web data sanity before saving
function TfrmEditWebShop.CheckGroupsTree: Boolean;
  var
    m, s: String;
    n, errcount: Integer;
    node: TapTreeNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditWebShop.CheckGroupsTree') else _udebug := nil;{$ENDIF}
  Result := False;

  try // finally
    if groupsTree.Count = 0 then Exit; // should be at least one

    m := '';
    errcount := 0;

    node := groupsTree.FirstNode;

    while node <> nil do try
      if node.isDeleted then begin
        node := node.Nextnode;
        Continue;
      end;

      s := '';

      case node.FindData(0, 0).asInteger of
        0: // main node
          begin
            if node.Name = '' then s := s + lGrpName.Caption + ', ';
          end;

        1: // lang node
          if WebCatsLangTree.FindFirst(node.Name, False).FindData(FID, 0).asInteger = 1 // checked
          then begin
            if node.FindData(0, 2).asString = '' // name
              then s := s + lGrpName.Caption + ', ';

            if node.FindData(0, 7).asBoolean and (node.FindData(0, 8).asString = '') // custom alias
              then s := s + cbGrpCustomAlias.Properties.Caption + ', ';
          end; // lang node
      end; // case

      if s <> '' then begin
        inc(errcount);

        if errcount < 6 then begin // display not more than 5 error places to not flood the error message
          n := length(s);
          if n > 2 then setlength(s, n - 2); // strip last delimiter

          case node.FindData(0, 0).asInteger of
            1: m := m + node.Parent.Name + '/';
          end;

          m := m + node.Name + ': (' + s + ')' + crlf;
        end
        else if errcount = 6 then m := m + '...';
      end;

      node := node.NextNode;

    except
      ssMessageDlg('Hmmm... CheckGroupsTree puked at node: ' + node.classTechDetails, ssmtError, [ssmbOK]);
      Exit;
    end; // while node <> nil do try

    if m <> ''
      then ssMessageDlg(format(rs(ParentNameEx, 'groups_data_bad'), [errcount, m]), ssmtError, [ssmbOK])
      else Result := True;

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
// groups custom sorting comparator
function grpSortProc(a1, a2: TTreeNode; Data: Longint): Integer; stdcall;
  var
    na1, na2: TapTreeNode;
    p1, p2: Integer;
begin
  if a1.Parent <> a2.Parent then begin
    Result := 0;
    Exit;
  end;

  na1 := a1.Data;
  na2 := a2.Data;

  if na1.isDeleted or na2.isDeleted then begin
    Result := Integer(na1.isDeleted) - Integer(na2.isdeleted);
    Exit;
  end;

  if na1.FindData(0, 0).asInteger = 1 then begin // language nodes
    Result := AnsiCompareText(a1.Text, a2.Text);
    Exit;
  end;

  p1 := na1.FindData(0, 2).asInteger;
  if p1 = -1 then p1 := MaxInt;
  p2 := na2.FindData(0, 2).asInteger;
  if p2 = -1 then p2 := MaxInt;

  Result := p1 - p2;

  if Result = 0 then Result := AnsiCompareText(a1.Text, a2.Text);
end;

//==============================================================================================
// filling the visual tree and checking/updating internal structure also
procedure TfrmEditWebShop.MakeGroupsTree;
  var
    node, newnode, langNode: TapTreeNode;
    tn, tnl: TTreeNode;
    i, n: Integer;
begin
  if groupsTree.Count = 0 then begin
    panGroupsRight.Enabled := False; // disabling editing fields
    Exit;
  end;

  i := FixGroupsTree(groupsTree, WebCatsLangTree);

  if i > 0 then ssMessageDlg(Format(rs(Self.ParentNameEx, 'err_bad_cats'), [i]), ssmtError, [ssmbOK]);

  with tvGroups.Items do begin
    Clear;
    BeginUpdate;
    node := groupsTree.FirstNode;
    while (node <> groupsTree) and (node <> nil) do begin
      if node.isDeleted or (node.FindData(0, 0).asInteger = 1) then begin // skip deleted and language nodes
        node := node.NextNode;
        Continue;
      end;

      if node.Parent = groupsTree
        then tn := AddObject(nil, node.name, node) // make it topmost nodes
        else tn := AddChildObject(TTreenode(node.Parent.NodeData), node.Name, node);

      node.NodeData := Integer(tn);

      // instantly adding _existing_ language nodes
      for i := 0 to node.Count - 1 do begin
        if node[i].isDeleted or (node[i].FindData(0, 0).asInteger <> 1) then Continue; // skip non-language nodes

        langNode := WebCatsLangTree.findFirst(-node[i].pos);
        if langNode.Data[0].asInteger = 1 then begin // lang is available here
          tnl := AddChildObject(tn, '* ' + Node[i].Name, node[i]);
          node[i].NodeData := Integer(tnl);
          // making some visual
          if (node[i].FindData(0, 2).asString <> '')
             and (not node[i].FindData(0, 7).asBoolean or (node[i].FindData(0, 7).asBoolean and (node[i].FindData(0, 8).asString <> '')))
          then tnl.StateIndex := -1
          else tnl.StateIndex := 2;
        end;
      end;

      node := node.NextNode;
    end;

    CustomSort(@grpSortProc, 0, True);
    EndUpdate;
  end; // with tvGroups.Items
end;

//==============================================================================================
procedure TfrmEditWebShop.MakeTransferTree;
  var
    node: TapTreeNode;
    tn: TTreeNode;

  function MakeNode(parentNode: TapTreeNode; name: String; selectable: Boolean = True): TapTreeNode;
    var
      node: TapTreeNode;
      tn: TTreeNode;
  begin
    node := parentNode.FindFirst(name, False, True);
      if parentNode = transferTree
        then tn := tvTransferList.Items.AddObject(nil, rs(ParentNameEx, Name), node)
        else tn := tvTransferList.Items.AddChildObject(TTreeNode(parentNode.NodeData), rs(ParentNameEx, Name), node);

      if selectable then begin
        if node.FindData(FID) = nil then node.addData(FID).asBoolean := False;
        tn.ImageIndex := 32 - node.FindData(FID).asInteger;
      end
      else begin
        tn.ImageIndex := 48;
      end;
      node.NodeData := Integer(tn);
      tn.SelectedIndex := tn.ImageIndex;
      Result := node;
  end;

begin
  transferTree := TapTree.Create('webShop_transfer', cfOwnerTypeWebShop, FID);
  with tvTransferList.Items do begin
    Clear;
    BeginUpdate;

    node := MakeNode(transferTree, 'transferNotSaveSettings');
    node.FindData(FID).asBoolean := False;
    tvTransferList.Selected := pointer(node.NodeData);
    tvTransferListDblClick(pointer(node.NodeData));

    MakeNode(transferTree, 'transferOrders');
    MakeNode(transferTree, 'transferGroups');
    node := MakeNode(transferTree, 'transferProd');
      MakeNode(node, 'transferEmpty');

    EndUpdate;
  end;
end;

//==============================================================================================
procedure addWebCatData(node: TapTreeNode; tvNode: TTreeNode; VisualTree: TObject);
  var
    i: Integer;
    s: String;
    nkid: TapTreeNode;
begin
  // !!!! if the structure changes it should be reflected in CCMain/GetMatLevel() which displays web shop tree for viewing and editing

  // tvNode = nil for just adding new languages
  if tvNode <> nil then begin
    node.addData(0, 0).asInteger := 0; // type-master
    node.addData(0, 1).asString  := ''; // <Description>
    node.addData(0, 2).asInteger := -1; // <Position>
    node.pos := 1972; //another master node marker
  end;

  // adding stubs for available languages
  for i := 0 to WebCatsLangTree.Count - 1 do begin
    // todo: data[0] will fuckup if more than 1 webshop used
    if WebCatsLangTree[i].Data[0].asInteger = 0 then Continue; // unchecked. this language is not available here

    if nil <> node.FindFirst(WebCatsLangTree[i].Name, False) then Continue; // this lang node is already exists

    nkid := node.AddChild(WebCatsLangTree[i].Name);
    nkid.Pos := -WebCatsLangTree[i].NodeData; // remember lang ID. minus is for lang nodes to come before subcats
    if (VisualTree <> nil) and (tvNode <> nil) then begin
      if VisualTree is TTreeView
        then nkid.NodeData := Integer(TTreeView(VisualTree).Items.AddChildObject(tvNode, '* ' + nkid.Name, nkid))
      else if VisualTree is TcxTreeView
        then nkid.NodeData := Integer(TcxTreeView(VisualTree).Items.AddChildObject(tvNode, '* ' + nkid.Name, nkid))
      else raise Exception.Create('addWebCatData: What is this kind of tree you passed here?');
    end;

    nkid.AddData(0, 0).asInteger := 1; // type-lang
    nkid.addData(0, 1).asString := ''; // <Description>
    nkid.addData(0, 2).asString := node.Name; // <Name>
    nkid.addData(0, 3).asString := ''; // <MetaCharset>
    nkid.addData(0, 4).asString := ''; // <MetaKeywords>
    nkid.addData(0, 5).asString := ''; // <MetaTitle>
    nkid.addData(0, 6).asString := ''; // <MetaDescr>
    nkid.addData(0, 7).asBoolean := False; // custom Alias
    nkid.addData(0, 8).asString := ''; // <Alias>
  end;
end;

//==============================================================================================
procedure TfrmEditWebShop.miGroupsAddAcceptText(Sender: TObject; var NewText: String; var Accept: Boolean);
  var
    tvnode: TTreeNode;
    Node: TapTreeNode;
    s: String;
begin
  inherited;
  Accept := False;
  s := trim(NewText);
  if s = '' then exit;

  if tvGroups.Selected = nil
    then node := GroupsTree
    else begin
      node := TapTreeNode(tvGroups.Selected.Data);

      if node.FindData(0, 0).asInteger > 0 // data node
        then begin
          node := node.Parent;
          tvGroups.Selected := TTreeNode(node.NodeData);
        end;
    end;

  if nil <> Node.FindFirst(s, False) then Exit; // some child has this name

  Node := Node.AddChild(s);
  tvnode := tvGroups.Items.AddChildObject(tvGroups.Selected, s, node);
  Node.NodeData := Integer(tvNode);
  addWebCatData(node, tvNode, tvGroups);

  if not panGroupsRight.Enabled then panGroupsRight.Enabled := True;

  tvGroups.Selected := tvNode;
  tvGroupsMouseDown(nil, mbLeft, [], 0,0); // switch to new node data

  Accept := True;
end;

//==============================================================================================
procedure TfrmEditWebShop.miGroupsDeleteClick(Sender: TObject);
  var
    Node: TapTreeNode;
begin
  inherited;
  if tvGroups.Selected = nil then Exit;

  node := TapTreeNode(tvGroups.Selected.Data);
  if node.pos < 0 then begin
    node := node.Parent;
    tvGroups.Selected := tvGroups.Selected.Parent;
  end;

  if mrNo = ssMessageDlg(rs(ParentNameEx, 'GroupsNodeDelConf', 1) + node.Name + '?', ssmtWarning, [ssmbYes, ssmbNo])
    then Exit;

  tvGroups.Selected.DeleteChildren;
  tvGroups.Selected.Delete;

  node.Delete;
end;

//==============================================================================================
procedure TfrmEditWebShop.tvGroupsKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  inherited;
  if not (Key in [VK_LBUTTON, VK_RBUTTON, VK_MBUTTON])
    then tvGroupsMouseDown(nil, mbLeft, Shift, 0, 0);
end;

//==============================================================================================
procedure TfrmEditWebShop.tvGroupsMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  var
    tvnode: TTreeNode;
    node: TapTreeNode;
    APoint: TPoint;
    i: Integer;
begin
  inherited;

  case Button of
    mbLeft:
      begin
        if Sender = nil
          then tvNode := tvGroups.Selected // when manually called from extrenal events
          else tvNode := TcxTreeView(Sender).GetNodeAt(x,y);

        gbGrpMain.Enabled := (tvNode <> nil) or (tvGroups.Selected <> nil);

        if tvNode = nil then Exit;
        
        tvGroups.Selected := tvNode;
        node := TapTreeNode(tvNode.Data);
        panGroupsRight.Tag := 1; // prevent onChange event on controls

        case node.FindData(0, 0).asInteger of
          0: // master
            begin
              edGrpName.EditingText := node.Name;
              edGrpDescription.EditingText := node.FindData(0, 1).asString;
              // position settings
              cbGrpCustomAlias.Visible := False;
              lGrpPosition.Visible := True;
              edGrpAlias.Enabled := True;
              if -1 = node.FindData(0, 2).asInteger // position is not set?
                then edGrpAlias.EditingText := ''
                else edGrpAlias.EditingText := node.FindData(0, 2).asString;

              edGrpMTitle.EditingText := '';
              memoGrpMKeywords.Text := '';
              memoGrpMDescription.Text := '';
              gbGrpMeta.Visible := False;
            end;

          1: // lang
            begin
              gbGrpMeta.Visible := True;
              edGrpName.EditingText := node.FindData(0, 2).asString;
              edGrpDescription.EditingText := node.FindData(0, 1).asString;
              cbGrpCustomAlias.Visible := True;
              cbGrpCustomAlias.Checked := node.FindData(0, 7).asBoolean;
              lGrpPosition.Visible := False;
              edGrpAlias.EditingText := node.FindData(0, 8).asString;
              edGrpAlias.Enabled := cbGrpCustomAlias.Checked;
              edGrpMTitle.EditingText := node.FindData(0, 5).asString;
              memoGrpMKeywords.Text := node.FindData(0, 4).asString;
              memoGrpMDescription.Text := node.FindData(0, 6).asString;
            end;
        end; // case node.FindData(0, 0).asInteger
        panGroupsRight.Tag := 0;
      end;

    mbRight:
      begin
        miGroupsAdd.Enabled := True;

        Apoint.x := x; apoint.y := y;

        tvNode := TcxTreeView(Sender).GetNodeAt(x,y);
        if (tvnode = nil) or (tvNode.Data = nil)
        then begin
          if tvnode <> nil then begin
            //miGroupsRename.Visible := True; // allow editing of language node
            // leaving only usertext
            //miGroupsRename.Text := AnsiMidStr(tvNode.Text, AnsiPos(':', tvNode.Text) + 2, Length(tvNode.Text));
            tvGroups.Selected := tvNode;
          end
          else begin
            //miGroupsRename.Visible := False; // allow editing of language node
            tvGroups.Selected := nil;
          end;
          miGroupsDelete.Visible := False;
        end
        else begin
          tvGroups.Selected := tvNode;
          miGroupsDelete.Visible := True;
          //miGroupsRename.Visible := True;
          //miGroupsRename.Text := tvnode.Text;
        end;

        miGroupsAdd.Text := '';

        // checking if there is selected laguages
        miGroupsNoLangsWarn.Visible := True;
        node := WebCatsLangTree.FirstNode;
        while node <> nil do begin
          if node.FindData(ID, 0).asInteger = 1 then begin
            miGroupsNoLangsWarn.Visible := False;
            Break;
          end;
          node := node.NextSibling;
        end;

        if miGroupsNoLangsWarn.Visible = True then begin // no languages
          miGroupsAdd.Enabled := False;
        end;

        pmGroups.Popup(Mouse.CursorPos.X, Mouse.CursorPos.y);
      end; // mbRight
    end; //case Button
end;

//==============================================================================================
procedure TfrmEditWebShop.pmTransferChange(Sender: TObject; Source: TMenuItem; Rebuild: Boolean);
begin
  inherited;
  if Source = nil then begin // it's nil when form initializes and calls .Load for every component
    butTransfer.Caption := miTransferIO.Caption;
    FTransferMode := transferModeIO;
    Exit;
  end;

  if butTransfer.Tag > 0 then Exit; // transfer/cancel operation is in progress

  butTransfer.Caption := Source.Caption;
  if Source = miTransferIO then FTransferMode := transferModeIO
  else if Source = miTransferIn then FTransferMode := transferModeIn
  else if Source = miTransferOut then FTransferMode := transferModeOut;

  butTransferClick(butTransfer);
end;

//==============================================================================================
procedure TfrmEditWebShop.tvTransferListDblClick(Sender: TObject);
begin
  if nil = TapTreeNode(tvTransferList.Selected.Data).FindData(FID) then Exit;

  if tvTransferList.Selected.ImageIndex = 31
    then tvTransferList.Selected.ImageIndex := 32
    else tvTransferList.Selected.ImageIndex := 31;
    
  tvTransferList.Selected.SelectedIndex := tvTransferList.Selected.ImageIndex;
  TapTreeNode(tvTransferList.Selected.Data).FindData(FID).asBoolean := (31 = tvTransferList.Selected.ImageIndex);
end;

//==============================================================================================
procedure TfrmEditWebShop.edGrpNamePropertiesChange(Sender: TObject);
  var
    node: TapTreeNode;
    s: String;
    re: TRegExpr;
    oldpos: Integer;
begin
  if panGroupsRight.Tag = 1 then Exit;

  inherited;
  node := TapTreeNode(tvGroups.Selected.Data);

  if Sender = edGrpName
    then if node.FindData(0, 0).asInteger = 0 then begin // master. internal name
      if trim(edGrpName.EditingText) = '' then begin // category name can't be empty
        edGrpName.EditingText := node.Name;
        Exit;
      end;

      node.Name := trim(edGrpName.EditingText);
      TTreeNode(node.NodeData).Text := node.Name;
    end
    else begin // lang specific name
      node.FindData(0, 2).asString := trim(edGrpName.EditingText);
      if not cbGrpCustomAlias.Checked
      then begin
        s := edGrpName.EditingText;
        re := TregExpr.Create;
        re.Expression := '\W+';
        edGrpAlias.EditingText := re.Replace(s, '_', False);
        re.Destroy;
      end;
    end

  else if Sender = edGrpDescription
    then node.FindData(0, 1).asString := trim(edGrpDescription.EditingText)

  else if Sender = edGrpAlias
    then if node.FindData(0, 0).asInteger = 0 // master. position data
         then begin
           oldpos := -1;
           try
             oldpos := node.FindData(0, 2).asInteger;
             node.FindData(0, 2).asInteger := StrToInt(trim(edGrpAlias.EditingText));
           except
             node.FindData(0, 2).asInteger := oldpos;
             panGroupsRight.Tag := 1;
             if oldpos <> -1
               then edGrpAlias.EditingText := IntToStr(oldpos)
               else edGrpAlias.EditingText := '';
             panGroupsRight.Tag := 0;
           end
         end
         else node.FindData(0, 8).asString := trim(edGrpAlias.EditingText) // lang node alias

  else if Sender = edGrpMTitle
    then  node.FindData(0, 5).asString := trim(edGrpMTitle.EditingText)

  else if Sender = memoGrpMKeywords
    then  node.FindData(0, 4).asString := trim(memoGrpMKeywords.Text)

  else if Sender = memoGrpMDescription
    then  node.FindData(0, 6).asString := trim(memoGrpMDescription.Text);

  // making some visual
  if node.FindData(0, 0).asInteger = 1 then begin
    if (node.FindData(0, 2).asString <> '')
       and (not node.FindData(0, 7).asBoolean or (node.FindData(0, 7).asBoolean and (node.FindData(0, 8).asString <> '')))
    then tvGroups.Selected.StateIndex := -1
    else tvGroups.Selected.StateIndex := 2;
  end;
end;

//==============================================================================================
procedure TfrmEditWebShop.cbGrpCustomAliasPropertiesChange(Sender: TObject);
begin
  inherited;
  edGrpAlias.Enabled := cbGrpCustomAlias.Checked;
  TapTreeNode(tvGroups.Selected.Data).FindData(0, 7).asInteger := BoolToInt(cbGrpCustomAlias.Checked);
  if not cbGrpCustomAlias.Checked then edGrpNamePropertiesChange(edGrpName); // redo alias from name
end;

//==============================================================================================
procedure TfrmEditWebShop.HTTPWork(Sender: TObject; AWorkMode: TWorkMode; const AWorkCount: Integer);
begin
  inherited;
  Application.ProcessMessages;

  {memoTransferLog.Lines.Add('HTTP work: write mode: ' + BoolTostr(AworkMode = wmWrite, True));
  memoTransferLog.Lines.Add('clen: ' + IntToStr(idHTTP1.Request.ContentLength));
  memoTransferLog.Lines.Add('count: ' + IntToStr(AWorkCount));
  }
  if AWorkMode <> wmWrite then Exit;
  pbCurrent.Properties.Max := TidHTTP(Sender).Request.ContentLength;
  pbCurrent.Properties.OverloadValue := TidHTTP(Sender).Request.ContentLength;
  pbCurrent.Position := AWorkCount;
end;

//==============================================================================================
procedure TfrmEditWebShop.butWWWcopyDownClick(Sender: TObject);
  var
    node: TapTreeNode;
begin
  node := TapTreeNode(tvGroups.Selected.Data);

  if trim(edGrpName.EditingText) = '' then edGrpName.EditingText := node.Parent.Name; // only lang node name could be empty

  if trim(edGrpDescription.EditingText) = ''
    then edGrpDescription.EditingText := edGrpName.EditingText;

  if not gbGrpMeta.Visible then Exit;

  if trim(edGrpMTitle.EditingText) = ''
    then edGrpMTitle.EditingText := edGrpName.EditingText;

  if trim(memoGrpMKeywords.Text) = ''
    then memoGrpMKeywords.Text := edGrpName.EditingText;

  if trim(memoGrpMDescription.Text) = ''
    then memoGrpMDescription.Text := edGrpName.EditingText;
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditWebShop', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization

end.
