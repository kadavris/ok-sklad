{$I ok_sklad.inc}
unit EditBank;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ActnList, DB, Menus, ComCtrls, 

  dxEditor6, dxExEdtr6, dxTL6, dxDBCtrl6, dxDBGrid6, dxCntner6, 

  ssBaseTypes,ssBaseDlg, ssFormStorage, ssMemDS, ssImagePanel, ssSpeedButton, ssPanel, ssGradientPanel, ssBevel, ssGroupBox, 

  cxMemo, cxCheckBox, cxControls, cxContainer, cxEdit, cxTextEdit, cxLookAndFeelPainters, cxButtons, cxPC, cxGroupBox, 
  cxTreeView, cxListView, cxDBEdit, cxGraphics, cxCustomData, cxStyles, cxTL, cxInplaceContainer, cxMaskEdit, cxButtonEdit, 

  Buttons, ImgList, xButton, TB2Item;

type
  TfrmEditBank = class(TBaseDlg)
    aCDel: TAction;
    aCIns: TAction;
    aCUpd: TAction;
    btnAddPerson: TssSpeedButton;
    btnDelPerson: TssSpeedButton;
    btnEMail: TssSpeedButton;
    btnLevelUp: TssSpeedButton;
    btnPersonLevelUp: TssSpeedButton;
    btnPropsPerson: TssSpeedButton;
    btnWWW: TssSpeedButton;
    bvlPersonSep: TssBevel;
    chbDefault: TcxCheckBox;
    colFIO: TdxDBGridColumn;
    colJob: TdxDBGridColumn;
    colNAme: TcxTreeListColumn;
    edCorAcc: TcxTextEdit;
    edEMail: TcxDBTextEdit;
    edFIO: TcxDBTextEdit;
    edJob: TcxDBTextEdit;
    edMFO: TcxTextEdit;
    edName: TcxTextEdit;
    edPhone: TcxDBTextEdit;
    edWWW: TcxButtonEdit;
    gbContact: TssGroupBox;
    gbMain: TssGroupBox;
    gbPerson: TssGroupBox;
    grdPersons: TdxDBGrid;
    lAddress: TLabel;
    lCorAcc: TLabel;
    lEMail: TLabel;
    lFIO: TLabel;
    lJob: TLabel;
    lMFO: TLabel;
    lName: TLabel;
    lNotes: TLabel;
    lPhone: TLabel;
    lWWW: TLabel;
    mdContact: TssMemoryData;
    mdContactemail: TStringField;
    mdContactfnode: TIntegerField;
    mdContactjob: TStringField;
    mdContactname: TStringField;
    mdContactnotes: TStringField;
    mdContactpersonid: TIntegerField;
    mdContactphone: TStringField;
    memAddr: TcxMemo;
    memNotes: TcxDBMemo;
    Panel3: TPanel;
    panPersonButtons: TPanel;
    pcMain: TcxPageControl;
    pmPersons: TTBPopupMenu;
    pmTree: TTBPopupMenu;
    srcContact: TDataSource;
    ssSpeedButton4: TssSpeedButton;
    ssSpeedButton5: TssSpeedButton;
    ssSpeedButton6: TssSpeedButton;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    tsContact: TcxTabSheet;
    tsMain: TcxTabSheet;
    tsPerson: TcxTabSheet;
    tvMain: TcxTreeList;

    procedure aCDelExecute(Sender: TObject);
    procedure aCInsExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure btnEMailClick(Sender: TObject);
    procedure btnLevelUpClick(Sender: TObject);
    procedure btnWWWClick(Sender: TObject);
    procedure DataModified(Sender: TObject);
    procedure edFIOPropertiesChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure gbPersonMouseEnter(Sender: TObject);
    procedure gbPersonMouseLeave(Sender: TObject);
    procedure grdPersonsDblClick(Sender: TObject);
    procedure grdPersonsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lvContactDblClick(Sender: TObject);
    procedure lvContactSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure tvMainEditing(Sender: TObject; Node: TTreeNode; var AllowEdit: Boolean);
    procedure tvMainSelectionChanged(Sender: TObject);

  private
    FContactItem: TcxTreeListNode;
    function CheckContacts: boolean;

  protected
    procedure setid(const Value: integer); override;
    procedure SetParentName(const Value: string); override;

  public
    ParentHandle: HWND;
    procedure SetCaptions; override;
  end;

var
  frmEditBank: TfrmEditBank;

implementation

uses
  ssBaseConst, prConst, DbClient, ClientData, Login, prFun,
  BankPersonsEdit, ssFun, ShellAPI, prTypes, ssCallbackConst, ssClientDataSet,
  fMessageDlg, Udebug, xLngdefs;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}
//==============================================================================================
procedure TfrmEditBank.setid(const Value: integer);
  var
    FItem: TcxTreeListNode;
    LI: TListItem;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditBank.setid') else _udebug := nil;{$ENDIF}

  if not IsPattern then FID := Value;

  with newDataSet do
   try
    if Value <> 0 then begin
     if not IsPattern
       then Self.Caption := rs(ParentNameEx, 'TitleEdit')
       else Self.Caption := rs(ParentNameEx, 'TitleAdd');

     ProviderName := 'pBanks_Get';
     FetchParams;
     Params.ParamByName('BankID').AsInteger := Value;
     Open;
     if not IsEmpty then begin
       edName.Text := fieldbyname('Name').asstring;
       edMFO.Text := fieldbyname('MFO').asstring;
       memAddr.Text := fieldbyname('Address').AsString;
       edWWW.Text := fieldbyname('WWW').AsString;
       edCorAcc.Text := fieldbyname('coracc').AsString;
       chbDefault.Checked := FieldByName('def').AsInteger=1;
     end;
     Close;

     ProviderName := 'pBankPersons_List';
     FetchParams;
     Params.ParamByName('bankid').AsInteger := Value;
     Open;
     mdContact.Close;
     mdContact.Open;
     while not Eof do begin
       FItem := tvMain.AddChild(FContactItem);
       mdContact.Append;
       mdContact.FieldByName('personid').AsInteger := FieldByName('personid').AsInteger;
       mdContact.FieldByName('fnode').AsInteger := Integer(FItem);
       mdContact.FieldByName('name').AsString := FieldByName('name').AsString;
       mdContact.FieldByName('phone').AsString := FieldByName('phone').AsString;
       mdContact.FieldByName('job').AsString := FieldByName('job').AsString;
       mdContact.FieldByName('email').AsString := FieldByName('email').AsString;
       mdContact.FieldByName('notes').AsString := FieldByName('notes').AsString;
       mdContact.Post;

       FItem.Values[0] := FieldByName('name').AsString;
       FItem.Data := pointer(FieldByName('personid').AsInteger);
       FItem.ImageIndex := 41;
       FItem.SelectedIndex := 41;

       Next;
     end;

     mdContact.First;

     if not FContactItem.Expanded then FContactItem.Expand(False);

     Close;

     if not IsPattern then begin
       chbDefault.Enabled := not chbDefault.Checked;
       btnApply.Enabled := False;
     end;

    end
    else Self.Caption := rs(ParentNameEx, 'TitleAdd');

   finally
    Free;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditBank.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
 var
   NewRecord: boolean;
   maxx: integer;
   Err: string;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditBank.FormCloseQuery') else _udebug := nil;{$ENDIF}


  if ModalResult in [mrOK, mrYes] then begin
    CanClose := False;
    if not CheckContacts then begin
      ssMessageDlg(rs(ParentNameEx, 'ErrorContacts'), ssmtError, [ssmbOk]);
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    with newDataSet do
    try
      TrStart;

      try
        NewRecord := (ID = 0);

        if NewRecord then FID := GetMaxID(dmData.SConnection, 'banks', 'bankid');

        if chbDefault.Checked then begin
          ProviderName := 'pBanks_SetDef';
          Execute;
          chbDefault.Enabled := false;
        end;

        if NewRecord
          then ProviderName := 'pBanks_Ins'
          else ProviderName := 'pBanks_Upd';

        FetchParams;
        Params.ParamByName('BankId').AsInteger := ID;
        Params.ParamByName('name').AsString := edName.Text;
        Params.ParamByName('coracc').AsString := edCorAcc.Text;
        Params.ParamByName('mfo').AsString := edMFO.Text;

        Params.ParamByName('Address').AsString := memAddr.Text;
        Params.ParamByName('WWW').AsString := Trim(edWWW.Text);
        Params.ParamByName('def').AsInteger := Integer(chbDefault.Checked);
        Execute;

        if not NewRecord then begin
          ProviderName := 'pBankPersons_Del';
          FetchParams;
          Params.ParamByName('bankid').AsInteger := ID;
          Execute;
        end;

        ProviderName := 'pBankPersons_Max';
        Params.Clear;
        Open;
        maxx := Fields[0].AsInteger+1;
        Close;
        ProviderName := 'pBankPersons_Ins';
        FetchParams;
        mdContact.First;
        while not mdContact.Eof do begin
          Params.ParamByName('bankid').AsInteger := ID;
          Params.ParamByName('personid').AsInteger := maxx;
          Params.ParamByName('name').AsString := mdContact.fieldbyname('name').AsString;
          Params.ParamByName('phone').AsString := mdContact.fieldbyname('phone').AsString;
          Params.ParamByName('email').AsString := mdContact.fieldbyname('email').AsString;
          Params.ParamByName('job').AsString := mdContact.fieldbyname('job').AsString;
          Params.ParamByName('notes').AsString := mdContact.fieldbyname('notes').AsString;
          Execute;
          Inc(Maxx);
          mdContact.Next;
        end;

        TrCommit;

        SendMessage(MainHandle, WM_REFRESH, ID, Integer(rtBank));

        if RefreshAllClients
          then dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_BANKS);

        if (ModalResult = mrYes) then begin
          if NewRecord then begin
            if not IsPattern then begin
              edName.Text := '';
              edMFO.Text := '';
              memAddr.Text := '';
              edWWW.Text := '';
              chbDefault.Checked := False;
              chbDefault.Enabled := True;
              mdContact.Close;
              mdContact.Open;
            end;

            pcMain.ActivePage := tsMain;
            edName.SetFocus;
            FID := 0;
          end
        end
        else CanClose := True;

        FModified := False;

      finally
        Free;
      end;

    except
      on e:exception do begin
        TrRollback;
        if ShowErrorText
          then Err := rs(ParentNameEx, 'ErrorMFO') + #10#13 + e.Message
          else Err := rs(ParentNameEx, 'ErrorMFO');
        ssMessageDlg(Err, ssmtError, [ssmbOk]);
      end;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditBank.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditBank.ActionListUpdate') else _udebug := nil;{$ENDIF}

  aOk.Enabled := (Trim(edName.Text)<>'') and (Trim(edMFO.Text)<>'');
  aApply.Enabled := aOk.Enabled and FModified;

  aCIns.Enabled := True; //((Integer(tvMain.FocusedNode.Data)>0) or (tvMain.FocusedNode.Count>0));
  aCDel.Enabled := aCIns.Enabled and (not mdContact.IsEmpty) and (Integer(tvMain.FocusedNode.Data)>0);
  aCUpd.Enabled := aCDel.Enabled and (pcMain.ActivePage <> tsPerson);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditBank.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditBank.DataModified') else _udebug := nil;{$ENDIF}


     FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditBank.SetCaptions;
 var
   FItem: TcxTreeListNode;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditBank.SetCaptions') else _udebug := nil;{$ENDIF}


  with LangMan do begin
    tsMain.Caption := rs(ParentNameEx, 'MainInfo');
    tsContact.Caption := rs(ParentNameEx, 'gbKontakt');

    lName.Caption := rs(ParentNameEx, 'Name') + ':';

    case CountryRules.AR of
      accRul_RU: lMFO.Caption := rs(ParentNameEx, 'BIC') + ':';
      accRul_UA: lMFO.Caption := rs(ParentNameEx, 'MFO') + ':';
      else lMFO.Caption := rs(ParentNameEx, 'ABA') + ':';
    end;

    lAddress.Caption := GetRS(ParentNameEx, 'Address') + ':';
    lWWW.Caption := GetRS(ParentNameEx, 'WWW') + ':';
    lCorAcc.Caption := GetRS(ParentNameEx, 'CorAcc') + ':';
    chbDefault.Properties.Caption := rs('Common', 'Default');
    gbMain.Caption := ' ' + rs(ParentNameEx, 'MainInfo') + ' ';
    gbContact.Caption := ' ' + rs(ParentNameEx, 'Contacts') + ' ';

    aOK.Caption := rs('Common', 'OK');
    aCancel.Caption := rs('Common', 'Cancel');
    aApply.Caption := rs('Common', 'Apply');

    aCIns.Caption := rs('Common', 'Add');
    aCUpd.Caption := rs('Common', 'Properties');
    aCDel.Caption := rs('Common', 'Del');

    lEMail.Caption := rs(ParentNameEx, 'EMail') + ':';
    lJob.Caption := rs(ParentNameEx, 'Job') + ':';
    lFIO.Caption := rs(ParentNameEx, 'FIO') + ':';
    lNotes.Caption := rs(ParentNameEx, 'Notes') + ':';
    lPhone.Caption := rs(ParentNameEx, 'Phone') + ':';

    colFIO.Caption := rs(ParentNameEx, 'FIO');
    colJob.Caption := rs(ParentNameEx, 'Job');

    btnLevelUp.Hint := rs(ParentNameEx, 'PersonsList');

    with tvMain do begin
      Clear;
      FItem := Add;
      FItem.Values[0] := rs(ParentNameEx, 'MainInfo');
      FItem.Data := pointer(-1);
      FItem.SelectedIndex := 117;
      FItem.ImageIndex := 117;
      FItem := Add;
      FItem.Data := pointer(-2);
      FItem.Values[0] := rs(ParentNameEx, 'Contacts');
      FItem.SelectedIndex := 67;
      FItem.ImageIndex := 67;
      FContactItem := FItem;
      FocusedNode := tvMain.Items[0];
     end;
  end;
  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditBank.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditBank.SetParentName') else _udebug := nil;{$ENDIF}


  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditBank.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditBank.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;
  pcMain.ActivePage := tsMain;
  mdContact.Open;

  if CountryRules.AR = accRul_UA then edMFO.Properties.MaxLength := 6;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditBank.aCInsExecute(Sender: TObject);
  var
   FNode: TcxTreeListNode;
   LI: TListItem;
   maxx: integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditBank.aCInsExecute') else _udebug := nil;{$ENDIF}

  if (Sender as TComponent).Tag = 0 then begin
    FNode := tvMain.AddChild(FContactItem);
    if not FContactItem.Expanded then FContactItem.Expand(False);
    maxx := GetMax(mdContact, 'personid')+1;
    FNode.Data := pointer(maxx);
    FNode.ImageIndex := 41;
    FNode.SelectedIndex := 41;
    FNode.Values[0] := '';
    tvMain.FocusedNode := FNode;

    mdContact.Append;
    mdContact.FieldByName('personid').AsInteger := maxx;
    mdContact.FieldByName('fnode').AsInteger := Integer(FNode);
    mdContact.Post;
    edFIO.SetFocus;
  end
  else grdPersonsDblClick(grdPersons);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditBank.aCDelExecute(Sender: TObject);
  var
    FNode: TcxTreeListNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditBank.aCDelExecute') else _udebug := nil;{$ENDIF}

  if ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo]) <> mrYes then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  FNode := TcxTreeListNode(mdContact.FieldByName('fnode').AsInteger);
  mdContact.Delete;
  FNode.Free;
  tvMainSelectionChanged(tvMain);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditBank.lvContactDblClick(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditBank.lvContactDblClick') else _udebug := nil;{$ENDIF}

  if not TcxTreeListNode(lvContact.Selected.Data).Parent.Expanded
      then TcxTreeListNode(lvContact.Selected.Data).Parent.Expand(False);
     tvMain.FocusedNode := lvContact.Selected.Data;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditBank.tvMainEditing(Sender: TObject; Node: TTreeNode; var AllowEdit: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditBank.tvMainEditing') else _udebug := nil;{$ENDIF}

  AllowEdit := (Integer(Node.Data)<>-1) and (Integer(Node.Data)<>-2);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditBank.tvMainSelectionChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditBank.tvMainSelectionChanged') else _udebug := nil;{$ENDIF}

    case Integer(tvMain.FocusedNode.Data) of
      -1: pcMain.ActivePageIndex := 0;
      -2: pcMain.ActivePageIndex := 1;
      else begin
        pcMain.ActivePageIndex := 2;
        mdContact.Locate('personid', Integer(tvMain.FocusedNode.Data), []);
        //lvContact.Selected := lvContact.Items[tvMain.FocusedNode.Index];
        //lvContact.Selected.Caption := ' '+tvMain.FocusedNode.Values[0];
      end;
    end;

    //panTitle.Caption := '  '+tvMain.FocusedNode.Values[0];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditBank.edFIOPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditBank.edFIOPropertiesChange') else _udebug := nil;{$ENDIF}

  if (tvMain.FocusedNode<>nil) and (Integer(tvMain.FocusedNode.Data)>0) then begin
    tvMain.FocusedNode.Values[0] := edFIO.Text;
    gbPerson.Caption := '  ' + edFIO.Text + ' ';
    //lvContact.Selected := lvContact.Items[tvMain.FocusedNode.Index];
    //lvContact.Selected.Caption := ' '+edFIO.Text;
  end;

  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditBank.lvContactSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditBank.lvContactSelectItem') else _udebug := nil;{$ENDIF}

  if Item.Data<>nil then
  mdContact.Locate('personid', Integer(TcxTreeListNode(Item.Data).Data), []);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
function TfrmEditBank.CheckContacts: boolean;
  var
    BM: TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditBank.CheckContacts') else _udebug := nil;{$ENDIF}

  Result := True;

  with mdContact do begin
   BM := GetBookmark;

   try
     First;

     while not Eof do begin
       if FieldByName('name').AsString='' then begin
         Result := False;
         {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
         Exit;
       end;
       Next;
     end;

     GotoBookmark(BM);

   finally
     FreeBookmark(BM);
   end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditBank.btnWWWClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditBank.btnWWWClick') else _udebug := nil;{$ENDIF}

  if trim(edWWW.Text)<>'' then
   ShellExecute(Application.Handle, nil, PChar(edWWW.Text),nil, nil, SW_SHOWNORMAL);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditBank.btnEMailClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditBank.btnEMailClick') else _udebug := nil;{$ENDIF}

  if trim(edEMail.Text)<>'' then
   ShellExecute(Application.Handle, nil, PChar('mailto:'+edEMail.Text),nil, nil, SW_SHOWNORMAL);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditBank.grdPersonsDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditBank.grdPersonsDblClick') else _udebug := nil;{$ENDIF}

  if not mdContact.IsEmpty then begin
    tvMain.FocusedNode := TcxTreeListNode(mdContact.FieldByName('fnode').AsInteger);
    edFIO.SetFocus;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditBank.btnLevelUpClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditBank.btnLevelUpClick') else _udebug := nil;{$ENDIF}

  tvMain.FocusedNode := tvMain.FocusedNode.Parent;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditBank.gbPersonMouseEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditBank.gbPersonMouseEnter') else _udebug := nil;{$ENDIF}


  if gbPerson.HotTrack then bvlPersonSep.ColorInner := gbPerson.HotTrackColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditBank.gbPersonMouseLeave(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditBank.gbPersonMouseLeave') else _udebug := nil;{$ENDIF}

  if gbPerson.HotTrack then bvlPersonSep.ColorInner := clBtnShadow;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditBank.grdPersonsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditBank.grdPersonsKeyDown') else _udebug := nil;{$ENDIF}

  if Key = 13 then grdPersonsDblClick(grdPersons);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditBank', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
