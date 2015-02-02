unit ProvMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, dxTL, dxDBCtrl, DB, DBClient, dxCntner, dxDBTL,
  ExtCtrls, ComCtrls,
  xmldom, Provider, Xmlxform, Grids, DBGrids, dxBar, ActnList, Menus,
  ActnMan, ToolWin, ActnCtrls, ActnMenus, XPStyleActnCtrls,
  ssActionMainMenuBar, SConnect,
  ssSocketConnection, ssClientDataSet, dxExEdtr, dxInspct, dxInspRw,
  StdCtrls, cxLookAndFeelPainters, cxButtons
  {
  RXSplit, mwCustomEdit, mwHighlighter, wmSQLSyn, Placemnt, ssFormStorage,
  ActnPopupCtrl,
  }
  ;

type
  TxServers = class
  private
    FList: TList;
    FIndex: integer;

  public
    constructor Create;
    Destructor Destroy; override;
    function Add(const AHost: string): TssSocketConnection;
    procedure Delete(const AHost: string);
    function ServerByName(const AHost: string): TssSocketConnection;
  end;

  TfrmProvMain = class(TForm)
    //edProv: TmwCustomEdit;
    {
    btnApply: TdxBarButton;
    btnDelDB: TdxBarButton;
    btnDelete: TdxBarButton;
    btnNewDB: TdxBarButton;
    btnNewGroup: TdxBarButton;
    btnProvNew: TdxBarButton;
    btnRefresh: TdxBarButton;
    btnUndo: TdxBarButton;
    btnUp: TdxBarButton;

    BarManager: TdxBarManager;
    }

    panLeft: TPanel;
    panRight: TPanel;
    srcGroups: TDataSource;
    Images: TImageList;
    //wmSQLSyn1: TwmSQLSyn;
    tlMain: TTreeView;
    ActionList1: TActionList;
    aDelete: TAction;
    Panel1: TPanel;
    pcMain: TPageControl;
    tsProvText: TTabSheet;
    tsView: TTabSheet;
    lvMain: TListView;
    LargeImages: TImageList;
    cdsText: TClientDataSet;
    aUp: TAction;
    aRefresh: TAction;
    pmView: TPopupMenu;
    mnuLargeIcons: TMenuItem;
    mnuSmallIcons: TMenuItem;
    mnuList: TMenuItem;
    mnuTable: TMenuItem;
    cdsGroups: TClientDataSet;
    amMain: TActionManager;
    aExit: TAction;
    splMain: TSplitter;
    barMainMenu: TssActionMainMenuBar;
    aScan: TAction;
    aConnect: TAction;
    aDisconnect: TAction;
    tsDBInfo: TTabSheet;
    inspDB: TdxInspector;
    irDB: TdxInspectorTextRow;
    irParams: TdxInspectorTextRow;
    irPath: TdxInspectorTextButtonRow;
    aNewDB: TAction;
    sbMain: TStatusBar;
    aUndo: TAction;
    aApply: TAction;
    irDef: TdxInspectorTextPickRow;
    cdsDB: TClientDataSet;
    aDelDB: TAction;
    pmTree: TPopupMenu;
    mnuNewDB: TMenuItem;
    mnuDelDB: TMenuItem;
    sepDB: TMenuItem;
    mnuScan: TMenuItem;
    mnuConnect: TMenuItem;
    mnuDisconnect: TMenuItem;
    test1: TMenuItem;
    test2: TMenuItem;
    sepProv: TMenuItem;
    aNewGroup: TAction;
    aNewProv: TAction;
    aDelProv: TAction;
    mnuDelProv: TMenuItem;
    edProv: TMemo;
    FindDialog1: TFindDialog;
    aFind: TAction;
    aFindNext: TAction;

    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tlMainExpanding(Sender: TObject; Node: TTreeNode; var AllowExpansion: Boolean);
    procedure tlMainCollapsed(Sender: TObject; Node: TTreeNode);
    procedure tlMainExpanded(Sender: TObject; Node: TTreeNode);
    procedure tlMainEdited(Sender: TObject; Node: TTreeNode; var S: String);
    procedure aNewProvExecute(Sender: TObject);
    procedure aNewGroupExecute(Sender: TObject);
    procedure cdsGroupsAfterOpen(DataSet: TDataSet);
    procedure ActionList1Update(Action: TBasicAction; var Handled: Boolean);
    procedure tlMainChange(Sender: TObject; Node: TTreeNode);
    procedure lvMainDblClick(Sender: TObject);
    procedure aApplyExecute(Sender: TObject);
    procedure edProvChange(Sender: TObject);
    procedure aUpExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure tlMainChanging(Sender: TObject; Node: TTreeNode; var AllowChange: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mnuLargeIconsClick(Sender: TObject);
    procedure mnuSmallIconsClick(Sender: TObject);
    procedure mnuListClick(Sender: TObject);
    procedure mnuTableClick(Sender: TObject);
    procedure cdsTextAfterOpen(DataSet: TDataSet);
    {
    procedure FormStorageStoredValues0Save(Sender: TStoredValue;
      var Value: Variant);
    procedure FormStorageStoredValues0Restore(Sender: TStoredValue;
      var Value: Variant);
    }
    procedure tlMainEditing(Sender: TObject; Node: TTreeNode; var AllowEdit: Boolean);
    procedure aExitExecute(Sender: TObject);
    procedure aScanExecute(Sender: TObject);
    procedure tlMainMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pmTreePopup(Sender: TObject);
    procedure aConnectExecute(Sender: TObject);
    procedure aDisconnectExecute(Sender: TObject);
    procedure cdsGroupsBeforeOpen(DataSet: TDataSet);
    procedure irDBDrawCaption(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
    procedure inspDBDrawCaption(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
    procedure tsDBInfoShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure irParamsDrawCaption(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
    procedure irDBChange(Sender: TObject);
    procedure irPathChange(Sender: TObject);
    procedure irPathButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure amMainUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aNewDBExecute(Sender: TObject);
    procedure aUndoExecute(Sender: TObject);
    procedure tlMainGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure aDelDBExecute(Sender: TObject);
    procedure aDelProvExecute(Sender: TObject);
    procedure mnuDelProvClick(Sender: TObject);
    procedure mnuConnectClick(Sender: TObject);
    procedure mnuDisconnectClick(Sender: TObject);
    procedure aFindExecute(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);

  private
    CurrText: string;
    FHostsList: TStringList;
    NeedToScan: boolean;
    PopupNode: TTreeNode;
    FServers: TxServers;
    FServerNode: TTreeNode;
    FDBNameModified,
    FNewDBAdded,
    FDBParamsModified,
    FSQLModified: boolean;
    FDeleting: boolean;
    FNewNode, FLastFoundNode: TTreeNode;
    FChangeNode_: boolean;

    procedure RefreshTree(const AID: integer);
    procedure RefreshDBInfo;
    function AddNewDB: boolean;
    procedure TreeLocate(const AID: integer);
    procedure GetLevel(ANode: TTreeNode);
    procedure ReloadView(ANode: TTreeNode);
    procedure LoadProvText(const AID: integer);
    procedure SortByObj(AList: TStringList);
    procedure SaveProvText;
    procedure SaveDBName;
    procedure SaveDBParams;
    function GetDBParams: string;
    function TestConn(const AHost: string): boolean;
    procedure LoadHostsFromRegistry;
    procedure SaveHostsToRegistry;
    procedure CheckRegistry;
    procedure ScanNetwork;
    function ConnectToServer(const AHost: string): boolean;
    procedure DisconnectFromServer(const AHost: string);
    function GetServerNode(ANode: TTreeNode): TTreeNode;
    procedure EraseStateIndexes;
    procedure SelectPopupNode;
    function DoFind(Anode: TTreeNode): Boolean;
  end;

var
  frmProvMain: TfrmProvMain;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  xFun, xNetUtils, xStrUtils, ActiveX, ssServer_TLB,
  MConnect, ComObj, Registry, ssaConst, strUtils;

{$R *.dfm}

//==============================================================================================
procedure TfrmProvMain.FormCreate(Sender: TObject);
begin
  //FormStorage.Active := True;
  FServers := TxServers.Create;
  FHostsList := TStringList.Create;
  CheckRegistry;
  LoadHostsFromRegistry;

  //cdsGroups.Open;
  //DSRefresh(cdsGroups, 'id', 0);
  RefreshTree(0);
  FSQLModified := False;
  FDBParamsModified := False;
end;

//==============================================================================================
procedure TfrmProvMain.FormDestroy(Sender: TObject);
begin
  cdsGroups.Close;
  FServers.Free;
  FHostsList.Free;
end;

//==============================================================================================
procedure TfrmProvMain.RefreshTree(const AID: integer);
begin
  GetLevel(nil);
  //TreeLocate(AID);
end;

//==============================================================================================
procedure TfrmProvMain.GetLevel(ANode: TTreeNode);
  var
    FNode: TTreeNode;
    BM: TBookmark;
    FPType: integer;
    i: integer;
begin
  if ANode <> nil then FServerNode := GetServerNode(ANode);

  BM := cdsGroups.GetBookmark;

  try
    if ANode <> nil
      then ANode.DeleteChildren
      else tlMain.Items.Clear;

    if ANode = nil then begin
      FNode := tlMain.Items.AddObject(nil, 'Сервера', pointer(-1));
      tlMain.Items.AddChild(FNode, '');
      FNode.ImageIndex := 17;
      FNode.SelectedIndex := 17;
      FNode.StateIndex := 0;
    end
    else begin
      FPType := Integer(ANode.Data);

      case FPType of
        -1: begin
              if NeedToScan then ScanNetwork;

              for i := 0 to FHostsList.Count - 1 do begin
                FNode := tlMain.Items.AddChildObject(ANode, DelChars(FHostsList[i], '\'), pointer(-2));
                tlMain.Items.AddChild(FNode, '');
                FNode.ImageIndex := 16;
                FNode.SelectedIndex := 16;
              end;
            end;

        -2: begin
              if not ConnectToServer(ANode.Text) then begin
                MessageDlg('Error connecting to server ' + ANode.Text + '!', mtError, [mbOk], 0);
                Exit;
              end;

              ANode.SelectedIndex := 15;
              ANode.ImageIndex := 15;

              FNode := tlMain.Items.AddChildObject(ANode, 'Базы данных', pointer(-3));
              tlMain.Items.AddChild(FNode, '');
              FNode.ImageIndex := 20;
              FNode.SelectedIndex := 20;

              FNode := tlMain.Items.AddChildObject(ANode, 'Провайдеры', pointer(-4));
              tlMain.Items.AddChild(FNode, '');
              FNode.ImageIndex := 23;
              FNode.SelectedIndex := 23;

              FNode := tlMain.Items.AddChildObject(ANode, 'Пользователи', pointer(-5));
              tlMain.Items.AddChild(FNode, '');
              FNode.ImageIndex := 21;
              FNode.SelectedIndex := 21;
            end;

        -4: begin // providers
              if cdsGroups.Active = False then begin
                cdsGroups.Open;
                DSRefresh(cdsGroups, 'id', 0);
              end;

              cdsGroups.First;
              while not cdsGroups.Eof do begin
                if (Integer(ANode.Data) = -4) and (cdsGroups.fieldbyname('id').AsInteger = cdsGroups.FieldByName('pid').AsInteger)
                then begin
                  FNode := tlMain.Items.AddChildObject(ANode, cdsGroups.fieldbyname('name').AsString, pointer(cdsGroups.fieldbyname('id').AsInteger));

                  if cdsGroups.fieldbyname('isgroup').AsInteger = 1 then begin
                    tlMain.Items.AddChild(FNode, '');
                    FNode.ImageIndex := 12;
                    FNode.SelectedIndex := 12;
                  end
                  else FNode.ImageIndex := 0;
                end;

                cdsGroups.Next;
              end;
            end; // -4 - providers

        -3: begin // databases
              if cdsDB.Active then cdsDB.Close;

              cdsDB.RemoteServer := FServers.ServerByName(FServerNode.Text);
              cdsDB.Open;

              while not cdsDB.Eof do begin
                FNode := tlMain.Items.AddChildObject(ANode, cdsDB.fieldbyname('desc').AsString, pointer(cdsDB.fieldbyname('dbid').AsInteger));

                if cdsDB.FieldByName('def').AsInteger = 0 then begin
                  FNode.ImageIndex := 24;
                  FNode.SelectedIndex := 24;
                end
                else begin
                  FNode.ImageIndex := 27;
                  FNode.SelectedIndex := 27;
                end;

                cdsDb.Next;
              end;

              cdsDb.Close;
            end // case -3 - databases

        else begin// case
          if (Integer(ANode.Data) > 0) then begin
            cdsGroups.First;
            while not cdsGroups.Eof do begin
              if (Integer(ANode.Data) > 0) and (cdsGroups.fieldbyname('id').AsInteger <> Integer(ANode.Data))
                 and (cdsGroups.fieldbyname('pid').AsInteger = Integer(ANode.Data))
              then begin
                FNode := tlMain.Items.AddChildObject(ANode, cdsGroups.fieldbyname('name').AsString, pointer(cdsGroups.fieldbyname('id').AsInteger));

                if cdsGroups.fieldbyname('isgroup').AsInteger = 1 then begin
                  tlMain.Items.AddChild(FNode, '');
                  FNode.ImageIndex := 12;
                  FNode.SelectedIndex := 12;
                end
                else FNode.ImageIndex := 0;
              end;
              cdsGroups.Next;
            end; // while not cdsGroups.Eof
          end; // if (Integer(ANode.Data)>0)
        end; // case else
      end; // case FPType of
    end; // if ANode = nil else

    cdsGroups.GotoBookmark(BM);

  finally
    cdsGroups.FreeBookmark(BM);
  end;
end;

//==============================================================================================
procedure TfrmProvMain.tlMainExpanding(Sender: TObject; Node: TTreeNode; var AllowExpansion: Boolean);
begin
  if Node.Item[0].Text = '' then GetLevel(Node);

  tlMain.AlphaSort(True);
  tlMain.SortType := stText;

  if tlMain.Selected = FServerNode then tlMainChange(tlMain, FServerNode);
end;

//==============================================================================================
procedure TfrmProvMain.tlMainCollapsed(Sender: TObject; Node: TTreeNode);
begin
  //Node.ImageIndex := 12;
  //Node.SelectedIndex := 12;
end;

//==============================================================================================
procedure TfrmProvMain.tlMainExpanded(Sender: TObject; Node: TTreeNode);
begin
  //Node.ImageIndex := 13;
  //Node.SelectedIndex := 13;
end;

//==============================================================================================
procedure TfrmProvMain.tlMainEdited(Sender: TObject; Node: TTreeNode; var S: String);
  var
    pid, res: integer;
begin
  Node.Text := S;

  if Integer(Node.Parent.Data) = -3 then begin
    if mrYes <> MessageDlg('Переименовать базу данных <' + CurrText + '> в <' + S + '>?', mtConfirmation, [mbYes, mbNo], 0) then begin
      S := CurrText;
      Exit;
    end
    else begin
      irDB.EditText := S;
      FDBNameModified := True;
      aApply.Execute;
    end;
  end
  else if (Integer(Node.Parent.Data) = -4) or (Integer(Node.Parent.Data) > 0) then begin

    if Integer(Node.Parent.Data) = -4
      then pid := Integer(Node.Data)
      else pid := Integer(Node.Parent.Data);

    res := FServers.ServerByName(FServerNode.Text).AppServer.AddProvider(Integer(Node.Data), S, pid, -1, 0);

    case res of
      -1: MessageDlg('Could not modify provider or group!', mtError, [mbOk], 0);
      -2: MessageDlg('Provider with this name already exist!', mtError, [mbOk], 0);
       0: DSRefresh(cdsGroups, 'id', 0);
    end;

    if res < 0 then S := CurrText;
  end;
end;

//==============================================================================================
procedure TfrmProvMain.aNewProvExecute(Sender: TObject);
  var
    maxx, pid, res: integer;
    FNode: TTreeNode;
begin
  maxx := FServers.ServerByName(FServerNode.Text).AppServer.GetMaxProvID+1;

  if Integer(PopupNode.Data) = -4
    then pid := maxx
    else if (PopupNode.ImageIndex = 0)
      then if Integer(PopupNode.Parent.Data) <> -4
        then pid := Integer(PopupNode.Parent.Data)
        else pid := maxx;

  res := FServers.ServerByName(FServerNode.Text).AppServer.AddProvider(maxx, 'New Provider', pid, 0, 1);

  if res < 0 then begin
    case res of
      -1:MessageDlg('Could not add provider!', mtError, [mbOk], 0);
      -2:MessageDlg('Provider with this name already exist!', mtError, [mbOk], 0);
    end;
  end
  else begin
    if Integer(PopupNode.Data) = -4
      then FNode := tlMain.Items.AddChildObject(PopupNode, 'New Provider', pointer(maxx))
      else if PopupNode.ImageIndex = 0
        then FNode := tlMain.Items.AddChildObject(PopupNode.Parent, 'New Provider', pointer(maxx))
        else FNode := tlMain.Items.AddChildObject(PopupNode, 'New Provider', pointer(maxx));

    FNode.ImageIndex := 0;
    FNode.SelectedIndex := 0;
    DSRefresh(cdsGroups, 'id', 0);
    tlMain.Selected := FNode;
    FNode.EditText;
  end;
end;

//==============================================================================================
procedure TfrmProvMain.aNewGroupExecute(Sender: TObject);
  var
    FNode: TTreeNode;
    maxx, pid: integer;
begin
     maxx := FServers.ServerByName(FServerNode.Text).AppServer.GetMaxProvID+1;

     if Integer(PopupNode.Data)<0
       then pid := maxx
       else if (PopupNode.ImageIndex=0)
         then if Integer(PopupNode.Parent.Data)<>-4
           then pid := Integer(PopupNode.Parent.Data)
           else pid := maxx;

     if FServers.ServerByName(FServerNode.Text).AppServer.AddProvider(maxx, 'New Group', pid, 1, 1)<0 then begin
       MessageDlg('Could not add group!', mtError, [mbOk], 0);
     end
     else begin
       if Integer(PopupNode.Data)=-4
         then FNode := tlMain.Items.AddChildObject(PopupNode, 'New Group', pointer(maxx))
         else if tlMain.Selected.ImageIndex=0
           then FNode := tlMain.Items.AddChildObject(PopupNode.Parent, 'New Group', pointer(maxx))
           else FNode := tlMain.Items.AddChildObject(PopupNode, 'New Group', pointer(maxx));

       FNode.ImageIndex := 12;
       FNode.SelectedIndex := 13;
       DSRefresh(cdsGroups, 'id', 0);
       tlMain.Items.AddChild(FNode, '');
       tlMain.Selected := FNode;
       FNode.EditText;
     end;
end;

//==============================================================================================
procedure TfrmProvMain.cdsGroupsAfterOpen(DataSet: TDataSet);
begin
  cdsGroups.LogChanges := False;
  if cdsText.Active then cdsText.Close;
  cdsText.Open;
end;

//==============================================================================================
procedure TfrmProvMain.ActionList1Update(Action: TBasicAction; var Handled: Boolean);
 var
   id_: integer;
begin
  if tlMain.Selected <> nil
    then id_ := Integer(tlMain.Selected.Data)
    else id_ := 0;

  aNewProv.Enabled := True;
  aNewGroup.Enabled := aNewProv.Enabled;
  aUp.Enabled := (tlMain.Selected<>nil) and (tlMain.Selected.Level<>0);
end;

//==============================================================================================
procedure TfrmProvMain.tlMainChange(Sender: TObject; Node: TTreeNode);
  var
    id_: integer;
begin
  id_ := Integer(Node.Data);

  if (Integer(Node.Data) <> -1) and (Integer(Node.Data) <> -2) and (Node.Count = 1) and (Node.Item[0].Text = '')
    then GetLevel(Node);

  case id_ of
    -1:
      begin
        FServerNode := nil;
        pcMain.ActivePage := tsView;
        ReloadView(Node);
      end;

    -2:
      begin
        FServerNode := GetServerNode(Node);
        pcMain.ActivePage := tsView;
        ReloadView(Node);
      end;

    -3, -4:
      begin
        FServerNode := GetServerNode(Node);
        pcMain.ActivePage := tsView;
        ReloadView(Node);
      end

    else begin
      if (Integer(Node.Data) > 0) and (Integer(Node.Parent.Data) = -3) then begin
        FServerNode := GetServerNode(Node);
        pcMain.ActivePage := tsDBInfo;
        RefreshDBInfo;
      end
      else if Integer(Node.Data) > 0 then begin
        if cdsGroups.Locate('id', id_, []) then begin
          if cdsGroups.FieldByName('isgroup').AsInteger = 1 then begin
            pcMain.ActivePage := tsView;
            ReloadView(Node);
          end
          else begin
            pcMain.ActivePage := tsProvText;
            LoadProvText(id_);
          end;
        end;
      end; // if (Integer(Node.Data)>0) and (Integer(Node.Parent.Data)=-3)

    end;  // case else
  end; // case

  tlMain.AlphaSort(True);
end;

//==============================================================================================
procedure TfrmProvMain.ReloadView(ANode: TTreeNode);
 var
   i: integer;
   li: TListItem;
begin
     lvMain.Clear;

     if (ANode.Level = 0) and (ANode.Count > 0) and (ANode.Item[0].Text = '') and (FHostsList.Count > 0)
       then GetLevel(ANode);

     if (ANode = FServerNode) and (ANode.Item[0].Text = '') then begin
       li := lvMain.Items.Add;
       li.Caption := aConnect.Caption;
       li.ImageIndex := aConnect.ImageIndex;
     end
     else with lvMain do begin
       if (ANode.Count = 1) and (ANode.Item[0].Text = '') then Exit;
       for i := 0 to ANode.Count - 1 do begin
         li := Items.Add;
         li.Caption := ANode.Item[i].Text;
         li.ImageIndex := ANode.Item[i].ImageIndex;
         li.Data := ANode.Item[i];
      end;
     end;
end;

//==============================================================================================
procedure TfrmProvMain.lvMainDblClick(Sender: TObject);
begin
  if (lvMain.Selected <> nil) then begin
    if lvMain.Selected.ImageIndex = aConnect.ImageIndex then begin
      GetLevel(FServerNode);
      FServerNode.Expand(False);
      tlMainChange(tlMain, FServerNode);
    end
    else begin
      tlMain.Selected := lvMain.Selected.Data;
      tlMain.Selected.Expand(False);
    end;
  end;
end;

//==============================================================================================
procedure TfrmProvMain.LoadProvText(const AID: integer);
begin
  edProv.Text := FServers.ServerByName(FServerNode.Text).AppServer.GetProvText(AID);
  FSQLModified := False;
end;

//==============================================================================================
procedure TfrmProvMain.SortByObj(AList: TStringList);
 var
   i: integer;
   f: boolean;
begin
    f := true;
    while f do begin
      f := false;
      for i := 0 to AList.Count-2 do
        if Integer(AList.Objects[i]) > Integer(AList.Objects[i+1]) then begin
          f := True;
          AList.Exchange(i, i+1);
        end;
    end;
end;

//==============================================================================================
procedure TfrmProvMain.aApplyExecute(Sender: TObject);
begin
  inspDB.Perform(CM_EXIT, 0, 0);

  if FSQLModified then begin
    SaveProvText;
    FSQLModified := False;
  end;

  if FNewDBAdded then begin
    if AddNewDB
      then FNewDBAdded := False
      else Exit;
  end
  else begin
    if FDBNameModified then begin
      SaveDBName;
      FDBNameModified := False;
    end;

    if FDBParamsModified then begin
      SaveDBParams;
      FDBParamsModified := False;
    end;
  end;

  EraseStateIndexes;
end;

//==============================================================================================
procedure TfrmProvMain.edProvChange(Sender: TObject);
begin
  FSQLModified := True;
end;

//==============================================================================================
procedure TfrmProvMain.aUpExecute(Sender: TObject);
begin
  if tlMain.Selected.Level <> 0 then tlMain.Selected := tlMain.Selected.Parent;
end;

//==============================================================================================
procedure TfrmProvMain.aRefreshExecute(Sender: TObject);
begin
  DSRefresh(cdsGroups, 'id', 0);

  if tlMain.Selected<>nil
    then RefreshTree(Integer(tlMain.Selected.Data))
    else RefreshTree(0);
end;

//==============================================================================================
procedure TfrmProvMain.tlMainChanging(Sender: TObject; Node: TTreeNode; var AllowChange: Boolean);
begin
  if aApply.Enabled and not FDeleting then begin
    if FSQLModified and (MessageDlg('Текст провайдера был изменён! Сохранить?', mtWarning, [mbYes, mbNo], 0)=mrYes)
      then aApply.Execute;

    if FNewDBAdded then
      if (MessageDlg('Была добавлена новая база данных! Сохранить?', mtWarning, [mbYes, mbNo], 0)<>mrYes)
        then aUndo.Execute
        else aApply.Execute;

    if FDBNameModified or FDBParamsModified then
      if (MessageDlg('Параметры базы данных были изменены! Сохранить?', mtWarning, [mbYes, mbNo], 0)<>mrYes)
        then aUndo.Execute
        else aApply.Execute;
  end;
end;

//==============================================================================================
procedure TfrmProvMain.SaveProvText;
begin
  if -1 = FServers.ServerByName(FServerNode.Text).AppServer.ModifyProvText(Integer(tlMain.Selected.Data), edProv.Text)
    then MessageDlg('Could not modify provider text!', mtError, [mbOk], 0);
end;

//==============================================================================================
procedure TfrmProvMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
 var
  a: boolean;
begin
  tlMainChanging(tlMain, tlMain.Selected, a);
end;

//==============================================================================================
procedure TfrmProvMain.mnuLargeIconsClick(Sender: TObject);
begin
  lvMain.ViewStyle := vsIcon;
  mnuLargeIcons.Checked := True;
end;

//==============================================================================================
procedure TfrmProvMain.mnuSmallIconsClick(Sender: TObject);
begin
  lvMain.ViewStyle := vsSmallIcon;
  mnuSmallIcons.Checked := True;
end;

//==============================================================================================
procedure TfrmProvMain.mnuListClick(Sender: TObject);
begin
  lvMain.ViewStyle := vsList;
  mnuList.Checked := True;
end;

//==============================================================================================
procedure TfrmProvMain.mnuTableClick(Sender: TObject);
begin
  lvMain.ViewStyle := vsReport;
  mnuTable.Checked := True;
end;

//==============================================================================================
procedure TfrmProvMain.TreeLocate(const AID: integer);
  var
   i: integer;

  function TreeChildLocate(ANode: TTreeNode; const AID: integer): boolean;
    var i: integer;
  begin
    Result := False;

    for i := 0 to ANode.Count-1 do
      if Integer(ANode.Item[i].Data)=AID then begin
        ANode.Expand(False);
        Result := True;
        Exit;
      end
      else if TreeChildLocate(ANode.Item[i], AID) then Exit;

    ANode.Collapse(False);
  end;

begin
  for i := 0 to tlMain.Items.Count - 1 do begin
    if 0 = tlMain.Items.Item[i].Level then begin
      if AID = Integer(tlMain.Items.Item[i].Data) then begin
        tlMain.Selected := tlMain.Items.Item[i];
        Exit;
      end
      else if TreeChildLocate(tlMain.Items[i], AID) then Exit;//tlMain.Items[i].Expand(False);
    end;
  end;
end;

//==============================================================================================
procedure TfrmProvMain.cdsTextAfterOpen(DataSet: TDataSet);
begin
  cdsText.LogChanges := False;
end;

//==============================================================================================
{procedure TfrmProvMain.FormStorageStoredValues0Save(Sender: TStoredValue;
  var Value: Variant);
begin
  case lvMain.ViewStyle of
    vsSmallIcon: Value := 0;
    vsIcon     : Value := 1;
    vsList     : Value := 2;
    vsReport   : Value := 3;
  end;
end;

//==============================================================================================
procedure TfrmProvMain.FormStorageStoredValues0Restore(Sender: TStoredValue; var Value: Variant);
begin
  if Value <> EmptyStr then
    case Value of
     0:begin
        lvMain.ViewStyle := vsSmallIcon;
        mnuSmallIcons.Checked := True;
       end;

     1:begin
        lvMain.ViewStyle := vsIcon;
        mnuLargeIcons.Checked := True;
       end;

     2:begin
        lvMain.ViewStyle := vsList;
        mnuList.Checked := True;
       end;

     3:begin
        lvMain.ViewStyle := vsReport;
        mnuTable.Checked := True;
       end;
    end;
end;
}
//==============================================================================================
procedure TfrmProvMain.tlMainEditing(Sender: TObject; Node: TTreeNode; var AllowEdit: Boolean);
begin
  AllowEdit := Integer(Node.Data)>0;
  if not AllowEdit then Exit;
  CurrText := Node.Text;
end;

//==============================================================================================
procedure TfrmProvMain.aExitExecute(Sender: TObject);
begin
  Close;
end;

//==============================================================================================
function TfrmProvMain.TestConn(const AHost: string): boolean;
begin
  Result := False;

  with TssSocketConnection.Create(nil) do
  try
    try
      Host := DelChars(AHost, '\');
      LoginPrompt := False;
      DBID := -1;
      ServerGUID := GUIDToString(CLASS_ssSrv);
      Open;
      Close;
      Result := True;

    finally
      Free;
    end;

  except
  end;
end;

//==============================================================================================
procedure TfrmProvMain.LoadHostsFromRegistry;
  var
    h: string;
begin
  with TRegistry.Create do
  try
    RootKey := HKEY_CURRENT_USER;
    if OpenKey(RegKey, False) then begin
      h := ReadString('Hosts');
      CloseKey;

      if h <> ''
        then StrToList(h, FHostsList, [';'])
        else NeedToScan := True;
    end;

  finally
    Free;
  end;
end;

//==============================================================================================
procedure TfrmProvMain.CheckRegistry;
begin
  with TRegistry.Create do
   try
     RootKey := HKEY_CURRENT_USER;
     if not KeyExists(RegKey) then CreateKey(RegKey);

   finally
     Free;
   end;
end;

//==============================================================================================
procedure TfrmProvMain.ScanNetwork;
 var
   FHosts: TStringList;
   i: integer;
begin
  Screen.Cursor := crHourGlass;
  FHostsList.Clear;
  FHosts := GetNetHosts;

  try
    for i := 0 to FHosts.Count-1 do if TestConn(FHosts[i]) then FHostsList.Add(FHosts[i]);
    SaveHostsToRegistry;
    NeedToScan := False;
    tlMainChange(tlMain, FServerNode);

  finally
    Screen.Cursor := crDefault;
    FHosts.Free;
  end;
end;

//==============================================================================================
procedure TfrmProvMain.SaveHostsToRegistry;
  var
    h: string;
begin
  with TRegistry.Create do
  try
    RootKey := HKEY_CURRENT_USER;

    if OpenKey(RegKey, False) then begin
      h := ListToStr(FHostsList, ';');
      WriteString('Hosts', h);
      CloseKey;
    end
    else CreateKey(RegKey);

  finally
    Free;
  end;
end;

//==============================================================================================
procedure TfrmProvMain.aScanExecute(Sender: TObject);
begin
  if PopupNode<>nil then tlMain.Selected := PopupNode;
  ScanNetwork;
  tlMain.Selected.Expand(False);
  //GetLevel(tlMain.Selected);
end;

//==============================================================================================
procedure TfrmProvMain.tlMainMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
 var
   FPos: TPoint;
begin
  if Button=mbRight then begin
    PopupNode := tlMain.GetNodeAt(X, Y);
    FPos := tlMain.ClientToScreen(Point(X, Y));
    pmTree.Popup(FPos.X, FPos.Y);
  end;
end;

//==============================================================================================
procedure TfrmProvMain.pmTreePopup(Sender: TObject);
  var
    FNode: TTreeNode;
    h: boolean;
begin
  mnuScan.Visible := (PopupNode<>nil) and (Integer(PopupNode.Data)=-1);

  if (PopupNode <> nil)
    then FNode := GetServerNode(PopupNode)
    else FNode := nil;

  mnuConnect.Visible := (PopupNode<>nil) and (FNode<>nil) and (FNode.ImageIndex=16);
  mnuDisconnect.Visible := (PopupNode<>nil) and (FNode<>nil) and (FNode.ImageIndex=15);

  amMainUpdate(aDelDB, h);
end;

//==============================================================================================
procedure TfrmProvMain.aConnectExecute(Sender: TObject);
begin
  with FServerNode do begin
    ConnectToServer(Text);
    ImageIndex := 15;
    SelectedIndex := 15;
    Expand(False);
    tlMainChange(tlMain, FServerNode);
  end;
end;

//==============================================================================================
procedure TfrmProvMain.aDisconnectExecute(Sender: TObject);
begin
  DisconnectFromServer(FServerNode.Text);
  tlMainChange(tlMain, FServerNode);
end;

//==============================================================================================
function TfrmProvMain.ConnectToServer(const AHost: string): boolean;
  var
    Conn: TssSocketConnection;
begin
 Screen.Cursor := crHourGlass;

 try
   Result := False;
   Conn := FServers.ServerByName(AHost);

   if Conn = nil then Conn := FServers.Add(AHost);

   if Conn <> nil then begin
     if Conn.Connected then Conn.Connected := False;
     try
       Conn.Connected := True;
       Result := True;

     except
       Exit;
     end;
   end;

 finally
   Screen.Cursor := crDefault;
 end;
end;

{ TServers }

//==============================================================================================
function TxServers.Add(const AHost: string): TssSocketConnection;
  var
    Conn: TssSocketConnection;
begin
  Result := nil;

  if ServerByName(AHost)=nil then begin
    Conn := TssSocketConnection.Create(nil);

    with Conn do begin
      Host := AHost;
      DBConnectAtOnce := False;
      ServerGUID := GUIDToString(CLASS_ssSrv);
      LoginPrompt := False;
    end;

    FList.Add(Conn);
    Result := Conn;
  end;
end;

//==============================================================================================
constructor TxServers.Create;
begin
  inherited;

  FList := TList.Create;
end;

//==============================================================================================
procedure TxServers.Delete(const AHost: string);
  var
    Conn: TssSocketConnection;
begin
  Conn := ServerByName(AHost);
  if Conn <> nil then begin
    if Conn.Connected then Conn.Connected := False;
    Conn.Free;
    FList.Delete(FIndex);
  end;
end;

//==============================================================================================
destructor TxServers.Destroy;
  var
    i: integer;
begin
  for i := 0 to FList.Count-1 do
    with TssSocketConnection(FList[i]) do begin
      if Connected then Connected := False;
      Free;
    end;

  FList.Free;

  inherited;
end;

//==============================================================================================
function TxServers.ServerByName(const AHost: string): TssSocketConnection;
  var
    i: integer;
begin
  Result := nil;

  for i := 0 to FList.Count-1 do
    with TssSocketConnection(FList[i]) do begin
      if Host = AHost then begin
        FIndex := i;
        Result := TssSocketConnection(FList[i]);
        Exit;
     end;
   end;
end;

//==============================================================================================
procedure TfrmProvMain.DisconnectFromServer(const AHost: string);
  var
    Conn: TssSocketConnection;
begin
  Conn := FServers.ServerByName(AHost);

  if (Conn <> nil) and Conn.Connected then Conn.Connected := False;

  FServerNode.SelectedIndex := 16;
  FServerNode.ImageIndex := 16;
  FServerNode.DeleteChildren;
  tlMain.Items.AddChild(FServerNode, '');
end;

//==============================================================================================
function TfrmProvMain.GetServerNode(ANode: TTreeNode): TTreeNode;
begin
  Result := nil;

  if ANode.Parent = nil then Exit;

  if Integer(ANode.Data) = -2
    then Result := ANode
    else Result := GetServerNode(ANode.Parent);
end;

//==============================================================================================
procedure TfrmProvMain.cdsGroupsBeforeOpen(DataSet: TDataSet);
begin
  cdsGroups.RemoteServer := FServers.ServerByName(FServerNode.Text);
end;

//==============================================================================================
procedure TfrmProvMain.irDBDrawCaption(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;  var AColor: TColor; var ADone: Boolean);
begin
  AFont.Style := [fsBold];
end;

//==============================================================================================
procedure TfrmProvMain.inspDBDrawCaption(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
begin
  AColor := clWindow;
  AFont.Color := clWindowText;
end;

//==============================================================================================
procedure TfrmProvMain.tsDBInfoShow(Sender: TObject);
begin
  //ins
end;

//==============================================================================================
procedure TfrmProvMain.FormResize(Sender: TObject);
begin
  if inspDB.DividerPos <> 190 then inspDB.DividerPos := 190;
end;

//==============================================================================================
procedure TfrmProvMain.RefreshDBInfo;
 var
   FParams, FParam: string;
   i, j: integer;
   FRow: TdxInspectorRowNode;
begin
  irDB.Text := tlMain.Selected.Text;
  irPath.Text := '';

  if tlMain.Selected.ImageIndex = 27
    then irDef.Text := 'True'
    else irDef.Text := 'False';

  irParams.Node.DeleteChildren;
  FParams := FServers.ServerByName(FServerNode.Text).AppServer.GetDBParams(Integer(tlMain.Selected.Data));

  for i := 1 to WordCount(FParams, [';']) do begin
    FParam := ExtractWord(i, FParams, [';']);

    if FParam <> '' then begin
      if LowerCase(ExtractWord(1, FParam, ['='])) = 'data source'
        then irPath.Text := ExtractWord(2, FParam, ['='])
        else begin
          FRow := irParams.Node.AddChildEx(TdxInspectorTextRow);
          FRow.Row.Caption := ExtractWord(1, FParam, ['=']);
          TdxInspectorTextRow(FRow.Row).Text := ExtractWord(2, FParam, ['=']);
          FRow.Row.OnChange := irPath.OnChange;
        end;
    end;

    irParams.Node.Expand(False);
  end;

  FDBParamsModified := False;
  FDBNameModified := False;
end;

//==============================================================================================
procedure TfrmProvMain.irParamsDrawCaption(Sender: TdxInspectorRow;
  ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont;
  var AColor: TColor; var ADone: Boolean);
begin
  AFont.Style := [];
end;

//==============================================================================================
procedure TfrmProvMain.irDBChange(Sender: TObject);
begin
  if not FNewDBAdded then begin
    FDBNameModified := True;
    tlMain.Selected.StateIndex := 26;
    FServerNode.StateIndex := 26;
  end;
end;

//==============================================================================================
procedure TfrmProvMain.SaveDBName;
 var
  res: integer;
  FDef: integer;
begin
    if irDef.EditText = 'True'
      then FDef := 1
      else FDef := 0;

    res := FServers.ServerByName(FServerNode.Text).AppServer.AddDB(Integer(tlMain.Selected.Data), irDB.EditText, FDef, 0);

    case res of
      -1: MessageDlg('Could not modify database name!', mtError, [mbOk], 0);
      //0: RefreshDBInfo;
    end;

    if res < 0 then begin
      irDB.Text := tlMain.Selected.Text;
      if tlMain.Selected.ImageIndex = 27
        then irDef.Text := 'True'
        else irDef.Text := 'False';
    end
    else begin
      tlMain.Selected.Text := irDB.EditText;
      if irDef.Text='True' then begin
        tlMain.Selected.ImageIndex := 27;
        tlMain.Selected.SelectedIndex := 27;
      end
      else begin
        tlMain.Selected.ImageIndex := 24;
        tlMain.Selected.SelectedIndex := 24;
      end;
    end;
end;

//==============================================================================================
procedure TfrmProvMain.SaveDBParams;
 var
   DBParams: string;
   res: integer;
begin
  DBParams := GetDBParams;
  res := FServers.ServerByName(FServerNode.Text).AppServer.AddDBParams(Integer(tlMain.Selected.Data), DBParams, 0);
  if res < 0 then ShowMessage('error');
  FDBParamsModified := False;
end;

//==============================================================================================
procedure TfrmProvMain.irPathChange(Sender: TObject);
begin
  if not FNewDBAdded then begin
    FDBParamsModified := True;
    tlMain.Selected.StateIndex := 26;
    FServerNode.StateIndex := 26;
  end;
end;

//==============================================================================================
procedure TfrmProvMain.irPathButtonClick(Sender: TObject; AbsoluteIndex: Integer);
begin
  with TOpenDialog.Create(nil) do
   try
     DefaultExt := 'gdb';
     Filter := 'Interbase Database (*.gdb)|*.gdb,*.fdb';
     if Execute then begin
       irPath.Text := FileName;
       FDBParamsModified := True;
     end;

   finally
     Free;
   end;
end;

//==============================================================================================
procedure TfrmProvMain.amMainUpdate(Action: TBasicAction; var Handled: Boolean);
  var
    FNode: TTreeNode;
begin
  if (PopupNode<>nil)
    then FNode := GetServerNode(PopupNode)
    else FNode := nil;

  aApply.Enabled := FDBNameModified or FDBParamsModified or FSQLModified or FNewDBAdded;
  aUndo.Enabled := aApply.Enabled;

  aNewDB.Enabled := (PopupNode<>nil) and (FNode<>nil) and ((Integer(PopupNode.Data)=-3) or (Integer(PopupNode.Parent.Data)=-3));
  mnuNewDB.Visible := aNewDB.Enabled;

  aDelDB.Enabled := (PopupNode<>nil) and (FNode<>nil) and (PopupNode.Parent<>nil) and (Integer(PopupNode.Parent.Data)=-3);
  mnuDelDB.Visible := aDelDB.Enabled;
  sepDB.Visible := mnuNewDB.Visible or mnuDelDB.Visible;

  aScan.Visible := (PopupNode<>nil) and (Integer(PopupNode.Data)=-1);

  aNewGroup.Visible := (PopupNode<>nil) and (FNode<>nil) and (PopupNode.Parent<>nil) and ((Integer(PopupNode.Parent.Data)=-4) or (Integer(PopupNode.Data)=-4) or (Integer(PopupNode.Parent.Data)>0));
  aNewProv.Visible := aNewGroup.Visible;
  aDelProv.Enabled := (PopupNode<>nil) and (FNode<>nil) and (Integer(PopupNode.Parent.Data)<>-3) and ((Integer(PopupNode.Parent.Data)=-4) or (Integer(PopupNode.Data)>0));
  mnuDelProv.Visible := aDelProv.Enabled;
  sepProv.Visible := aNewGroup.Visible or aNewProv.Visible or mnuDelProv.Visible;
end;

//==============================================================================================
procedure TfrmProvMain.aNewDBExecute(Sender: TObject);
  var
    FNode, FDBNode: TTreeNode;
    FRow: TdxInspectorRowNode;
begin
  FDBNode := PopupNode;
  if Integer(FDBNode.Data) <> -3 then FDBNode := FDBNode.Parent;

  if not FDBNode.Expanded then FDBNode.Expand(False);

  FNode := tlMain.Items.AddChild(FDBNode, 'New Database');
  FNewNode := FNode;
  FNode.ImageIndex := 24;
  FNode.SelectedIndex := 24;
  FNode.StateIndex := 26;
  FServerNode.StateIndex := 26;
  pcMain.ActivePage := tsDBInfo;
  irDB.Text := 'New Database';
  irPath.Text := '';
  irDef.Text := 'False';
  irParams.Node.DeleteChildren;

  FRow := irParams.Node.AddChildEx(TdxInspectorTextRow);
  FRow.Row.Caption := 'PROVIDER';
  TdxInspectorTextRow(FRow.Row).Text := 'LCPI.IBProvider.1';
  FRow.Row.OnChange := irPath.OnChange;

  FRow := irParams.Node.AddChildEx(TdxInspectorTextRow);
  FRow.Row.Caption := 'User ID';
  TdxInspectorTextRow(FRow.Row).Text := 'SYSDBA';
  FRow.Row.OnChange := irPath.OnChange;

  FRow := irParams.Node.AddChildEx(TdxInspectorTextRow);
  FRow.Row.Caption := 'Password';
  TdxInspectorTextRow(FRow.Row).Text := 'masterkey';
  FRow.Row.OnChange := irPath.OnChange;

  FRow := irParams.Node.AddChildEx(TdxInspectorTextRow);
  FRow.Row.Caption := 'Persist Security Info';
  TdxInspectorTextRow(FRow.Row).Text := 'True';
  FRow.Row.OnChange := irPath.OnChange;

  FRow := irParams.Node.AddChildEx(TdxInspectorTextRow);
  FRow.Row.Caption := 'ctype';
  TdxInspectorTextRow(FRow.Row).Text := 'WIN1251';
  FRow.Row.OnChange := irPath.OnChange;

  FRow := irParams.Node.AddChildEx(TdxInspectorTextRow);
  FRow.Row.Caption := 'auto_commit';
  TdxInspectorTextRow(FRow.Row).Text := 'True';
  FRow.Row.OnChange := irPath.OnChange;

  irParams.Node.Expand(False);

  inspDB.SetFocus;
  inspDB.FocusedNumber := 1;
  inspDB.FocusedNumber := 0;

  tlMain.Selected := FNode;
  FNewDbAdded := True;
  //FChangeNode_ := True;
end;

//==============================================================================================
procedure TfrmProvMain.aUndoExecute(Sender: TObject);
  var
    FNode: TTreeNode;
begin
  FDeleting := True;

  if FDBNameModified then begin
    irDB.Text := tlMain.Selected.Text;
    FDBNameModified := False;
  end;

  if FNewDBAdded then begin
    FNode := tlMain.Selected;
    tlMain.Selected := tlMain.FindNextToSelect;
    FNode.Free;
    FNewDBAdded := False;
  end;

  EraseStateIndexes;
  FDeleting := False;
end;

//==============================================================================================
procedure TfrmProvMain.tlMainGetImageIndex(Sender: TObject; Node: TTreeNode);
begin
  {if FDBNameModified or FDBParamsModified then begin
   if (Node=FServerNode) or ((Node.Parent<>nil) and (Integer(Node.Parent.Data)=-3))
    then Node.StateIndex := 26;
  end
  else Node.StateIndex := -1;
  }
end;

//==============================================================================================
procedure TfrmProvMain.EraseStateIndexes;
  var
    i: integer;
begin
  for i := 0 to tlMain.Items.Count-1 do tlMain.Items[i].StateIndex := -1;
end;

//==============================================================================================
function TfrmProvMain.AddNewDB: boolean;
  var
    Res: integer;
    FDef: integer;
    a: boolean;
begin
    Result := False;

    if irDef.Text = 'True'
      then FDef := 1
      else FDef := 0;

    Application.ProcessMessages;
    Screen.Cursor := crHourGlass;

    try
      a := FServers.ServerByName(FServerNode.Text).AppServer.NewDB(irPath.EditText, GetDBParams);
    finally
      Screen.Cursor := crDefault;
    end;

    if not a then begin
      MessageDlg('Ошибка при создании файла базы данных!', mtError, [mbOk], 0);
      Exit;
    end;

    Res := FServers.ServerByName(FServerNode.Text).AppServer.AddDB(Integer(tlMain.Selected.Data), irDB.EditText, FDef, 1);

    case res of
      -1: MessageDlg('Невозможно создать базу данных!', mtError, [mbOk], 0);
      //0: RefreshDBInfo;

      else begin
        tlMain.Selected.Data := pointer(Res);
        SaveDBParams;
        tlMain.Selected.Text := irDB.Text;
        Result := True;
      end;
    end;
end;

//==============================================================================================
procedure TfrmProvMain.aDelDBExecute(Sender: TObject);
  var
    Res: integer;
    FNode: TTreeNode;
begin
  Res := FServers.ServerByName(FServerNode.Text).AppServer.DropDB(Integer(tlMain.Selected.Data));

  case res of
    -1: MessageDlg('Database execution timeout!', mtError, [mbOk], 0);
    -2: MessageDlg('Error dropping database!', mtError, [mbOk], 0);
     0: begin
          FNode := tlMain.Selected;
          tlMain.Selected := FNode.GetNext;
          if FNode = PopupNode then PopupNode := nil;
          FNode.Free;
        end;
  end;
end;

//==============================================================================================
procedure TfrmProvMain.aDelProvExecute(Sender: TObject);
begin
  if MessageDlg('Вы уверены?', mtWarning, [mbYes, mbNo], 0) = mrYes then begin
    if tlMain.Selected.Count > 0 then begin
      MessageDlg('Сначала удалите подчинённые провайдеры и группы!', mtError, [mbOk], 0);
      Exit;
    end;

    if FServers.ServerByName(FServerNode.Text).AppServer.DropProvider(Integer(tlMain.Selected.Data))=-1 then begin
      MessageDlg('Could not drop provider or group!', mtError, [mbOk], 0);
    end
    else begin
      tlMain.Items.Delete(tlMain.Selected);
      PopupNode := tlMain.Selected;
      DSRefresh(cdsGroups, 'id', 0);
    end;
  end;
end;

//==============================================================================================
procedure TfrmProvMain.mnuDelProvClick(Sender: TObject);
begin
  SelectPopupNode;
  aDelProv.Execute;
end;

//==============================================================================================
procedure TfrmProvMain.SelectPopupNode;
begin
  if tlMain.Selected<>PopupNode then tlMain.Selected := PopupNode;
end;

//==============================================================================================
procedure TfrmProvMain.mnuConnectClick(Sender: TObject);
begin
  SelectPopupNode;
  aConnect.Execute;
end;

//==============================================================================================
procedure TfrmProvMain.mnuDisconnectClick(Sender: TObject);
begin
  SelectPopupNode;
  aDisconnect.Execute;
end;

//==============================================================================================
function TfrmProvMain.GetDBParams: string;
  var i: integer;
begin
  Result := 'Data Source=' + irPath.EditText + ';';

  for i := 0 to irParams.Node.Count - 1 do begin
    Result := Result + TdxInspectorTextRow(TdxInspectorRowNode(irParams.Node.Items[i]).Row).Caption + '='
      + TdxInspectorTextRow(TdxInspectorRowNode(irParams.Node.Items[i]).Row).EditText+';';
  end;

  if Result <> '' then System.Delete(Result, Length(Result), 1);
end;

//==============================================================================================
procedure TfrmProvMain.aFindExecute(Sender: TObject);
begin
  FindDialog1.Execute;
end;

//==============================================================================================
function TfrmProvMain.DoFind(Anode: TTreeNode): Boolean;
  var
    n: TTreeNode;
begin
  Result := False;

  if Anode = nil then exit;

  if Anode = FLastFoundNode then begin // finding next
    Result := DoFind(Anode.GetNext);
    Exit;
  end;

  // looking if topmost parent is provider's sub-tree root
  n := Anode;
  while n.Data <> pointer(-4) do begin
    n := n.Parent;
    if n = nil then Exit;
  end;

  n := Anode;

  while n <> nil do begin
    if not n.Expanded then n.Expand(False);// this should automatically load missing sub-providers

    if AnsiContainsText(n.Text, FindDialog1.FindText) then begin
      n.Selected := True;
      FLastFoundNode := n;
      Result := True;
      Exit;
    end;

    n := n.GetNext;
  end;

  Anode.Collapse(True); // nothing found here - cleaning up
end;

//==============================================================================================
procedure TfrmProvMain.FindDialog1Find(Sender: TObject);
begin
  DoFind(tlMain.Selected);
end;

end.
