unit treeSelector;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TB2Item, Menus, ActnList, cxGraphics, cxCustomData,
  cxStyles, cxTL, cxControls,
  //dxCntner6, dxTL, dxDBCtrl, dxDBGrid, 
  cxInplaceContainer, cxTLData, cxDBTL, DB, ssDataSource, DBClient,
  ssClientDataSet, ComCtrls, cxMaskEdit, ssBaseConst, clientdata, BaseFrame,
  ImgList, ssSpeedButton, ssPanel, ExtCtrls, ssGradientPanel, cxTextEdit,
  cxLabel, cxImageComboBox, Grids, DBGrids, ssMemDS, StdCtrls;

type
  TfmTreeSelector = class(TFrame)
    cdsMain: TssClientDataSet;
    srcMain: TssDataSource;
    mdMain: TssMemoryData;
    ilTitleBar: TImageList;
    Panel1: TPanel;
    pcMain: TPageControl;
    tsTree: TTabSheet;
    Tree: TcxDBTreeList;
    treeColID: TcxDBTreeListColumn;
    treeColPID: TcxDBTreeListColumn;
    treeColType: TcxDBTreeListColumn;
    tsList: TTabSheet;
    List: TDBGrid;
    panTitleBar: TssGradientPanel;
    panTitleButtons: TssPanel;
    btnTBMinimize: TssSpeedButton;
    btnTBMaximize: TssSpeedButton;
    btnTBClose: TssSpeedButton;
    ActionList1: TActionList;
    aClose: TAction;
    lHint: TLabel;

    procedure TreeDblClick(Sender: TObject);
    procedure TreeGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
    procedure ListDblClick(Sender: TObject);
    procedure panTitleBarMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnTBCloseClick(Sender: TObject);

  private
    FHandle: THandle; // parent control handle to send messages
    FSelectableSet: Array of Integer; // array of item types that can be selected or dragged
    FSessionID: Integer; // used to prevent the wrong list to reappear if calling form changes it's mind about the params or something

    procedure setTreeMode(Amode: Boolean);
    procedure setListMode(Amode: Boolean);
    function  getTreeMode: Boolean;
    function  getListMode: Boolean;
    procedure setCurrentID(AValue: Integer);
    function  getCurrentID: Integer;
    function  getdsParams: TParams;
    function  getdsMacros: TParams;
    procedure setProvider(AProvName: String);
    function  getProvider: string;
    procedure SetSessionID(AID: Integer);

  public
    procedure Clear; // clears columns in tree and grid
    procedure sql(ASQL: String);
    procedure addColumn(AField, ACaption: String; AVisible: Boolean = True; AWidth: Integer = 100);
    procedure Refresh;
    procedure Close;
    procedure Open(AParent: TWinControl; SortFields: String = ''; Desc: Boolean = False);
    procedure SelectableType(AType: Integer);

    property DataSet: TssMemoryData read mdMain;
    property treeMode: Boolean read getTreeMode write setTreeMode;
    property listMode: Boolean read getListMode write setListMode;
    property CurrentID: Integer read getCurrentID write setCurrentID;
    property dsParams: TParams read getdsParams;
    property dsMacros: TParams read getdsMacros;
    property provider: String read getProvider write setProvider;
    property SessionID: Integer read FSessionID write setSessionID;
  end;

var
  fmTreeSelector: TfmTreeSelector;

//==================================================================================================
//==================================================================================================
//==================================================================================================
implementation

uses
  prFun, udebug;

{$R *.dfm}
//==================================================================================================
procedure TfmTreeSelector.Clear; // clears columns in tree and grid
  var
    tcol: TcxDBTreeListColumn;
    lcol: TColumn;
begin
  cdsMain.Close;
  mdMain.Close;

  Tree.Clear;
  List.Columns.Clear;
  setLength(FSelectableSet, 0);

  tcol := TcxDBTreeListColumn(Tree.CreateColumn(Tree.Bands.Items[0])); tcol.Visible := False; tcol.DataBinding.FieldName := 'id';
  tcol := TcxDBTreeListColumn(Tree.CreateColumn(Tree.Bands.Items[0])); tcol.Visible := False; tcol.DataBinding.FieldName := 'pid';
  tcol := TcxDBTreeListColumn(Tree.CreateColumn(Tree.Bands.Items[0])); tcol.Visible := False; tcol.DataBinding.FieldName := 'type';

  lcol := list.Columns.Add; lcol.Visible := False; lcol.FieldName := 'id';
  lcol := list.Columns.Add; lcol.Visible := False; lcol.FieldName := 'pid';
  lcol := list.Columns.Add; lcol.Visible := False; lcol.FieldName := 'type';
end;

//==================================================================================================
procedure TfmTreeSelector.SetSessionID(AID: Integer);
begin
  if AID = FSessionID then Exit;
  Clear;
  FSessionID := AID;
end;

//==================================================================================================
procedure TfmTreeSelector.setTreeMode(Amode: Boolean);
begin
  if Amode
    then pcMain.ActivePage := tsTree
    else pcMain.ActivePage := tsList;
end;

//==================================================================================================
procedure TfmTreeSelector.setListMode(Amode: Boolean);
begin
  if Amode
    then pcMain.ActivePage := tsList
    else pcMain.ActivePage := tsTree;
end;

//==================================================================================================
function  TfmTreeSelector.getTreeMode: Boolean;
begin
  Result := (pcMain.ActivePage = tsTree);
end;

//==================================================================================================
function  TfmTreeSelector.getListMode: Boolean;
begin
  Result := (pcMain.ActivePage = tsList);
end;

//==================================================================================================
procedure TfmTreeSelector.setProvider(AProvName: String);
begin
  cdsMain.ProviderName := AProvName;
  cdsMain.FetchParams;
  cdsMain.FetchMacros;
end;

//==================================================================================================
function TfmTreeSelector.getProvider: String;
begin
  Result := cdsMain.ProviderName;
end;

//==================================================================================================
function  TfmTreeSelector.getdsParams: TParams;
begin
  Result := cdsMain.Params;
end;

//==================================================================================================
function  TfmTreeSelector.getdsMacros: TParams;
begin
  Result := cdsMain.Macros;
end;

//==================================================================================================
procedure TfmTreeSelector.sql(ASQL: String);
begin
  with cdsMain do begin
    Close;
    ProviderName := 'pSQL';
    FetchMacros;
    Macros.ParamByName('sql').asString := ASQL;
  end;
end;

//==================================================================================================
procedure TfmTreeSelector.addColumn(AField, ACaption: String; AVisible: Boolean = True; AWidth: Integer = 100);
  var
    tcol: TcxDBTreeListColumn;
    lcol: TColumn;
begin
  if TreeMode then begin
    tcol := TcxDBTreeListColumn(Tree.CreateColumn);
    tcol.Visible := Avisible;
    tcol.DataBinding.FieldName := AField;
    tcol.Caption.Text := ACaption;
    tcol.Options.Editing := False;
    tcol.Width := AWidth;
    //tcol.Properties := TcxCustomLabelProperties.Create(tcol);
  end
  else begin
    lcol := list.Columns.Add;
    lcol.Title.Caption := ACaption;
    {lcol := list.CreateColumn(TdxDBGridColumn);
    lcol.Caption := ACaption;
    }
    lcol.Visible := AVisible;
    lcol.FieldName := AField;
    lcol.Width := AWidth;
  end;
end;

//==================================================================================================
procedure TfmTreeSelector.Refresh;
begin
  cdsMain.Refresh;
  mdMain.Close;
  CopyDataSet(mdMain, cdsMain);
  Self.Show;
end;

//==================================================================================================
procedure TfmTreeSelector.Close;
begin
  cdsMain.Close;
  Self.Hide;
end;

//==================================================================================================
procedure TfmTreeSelector.Open(AParent: TWinControl; SortFields: String = ''; Desc: Boolean = False);
  var
    w, i: Integer;
begin
  Parent := AParent;

  FHandle := AParent.handle;

  Self.Height := 100;
  Self.Width := 100;
  Self.Top := 1;
  Self.Left := 1;

  i := GetWindowLong(Handle, GWL_STYLE);
  i := i or WS_THICKFRAME;// or WS_CAPTION;
  SetWindowLong(Handle, GWL_STYLE, i);

  // try to make it wider for more columns
  w := 20;
  if TreeMode then begin
    for i := 0 to Tree.VisibleColumnCount - 1
      do w := w + Tree.VisibleColumns[i].Width;
  end
  else begin
    for i := 0 to list.Columns.Count - 1
      do if list.Columns[i].Visible then w := w + list.Columns[i].Width;
  end;

  if (Self.Height < 300) or (Self.Height > AParent.Height - 50) then Self.Height := AParent.Height - 50;
  if (w < 300)  or (w > AParent.Width - 50) then w := AParent.Width - 50;

  if Self.Height > 500 then Self.Height := 500;
  if w > 500 then w := 500;

  Self.Width := w;

  Self.Top := AParent.Height div 2 - Self.Height div 2;
  Self.Left := AParent.Width div 2 - Self.Width div 2;

  if not cdsMain.Active then begin
    cdsMain.Open;
    CopyDataSet(mdMain, cdsMain);
    if SortFields <> '' then mdMain.SortOnFields(SortFields, True, Desc);
  end;

  lhint.caption := rs(Self.Name, 'lhint');

  Self.Show;
end;

//==================================================================================================
procedure TfmTreeSelector.SelectableType(AType: Integer);
begin
  setlength(FSelectableSet, length(FSelectableSet) + 1);
  FSelectableSet[High(FSelectableSet)] := AType;
end;

//==================================================================================================
procedure TfmTreeSelector.TreeDblClick(Sender: TObject);
  var
    i: Integer;
begin
  for i := 0 to High(FSelectableSet) do
    if mdMain.FieldByName('type').asInteger = FSelectableSet[i] then begin
      SendMessage(FHandle, WM_TREESELECT, cdsMain.RecNo, 0);
      //Self.Hide; // let user add multipple items and close it then manually 
      Exit;
    end;
end;

//==================================================================================================
procedure TfmTreeSelector.setCurrentID(AValue: Integer);
begin
  if not mdMain.Active then Exit;

  mdMain.Locate('id', AValue, [])
end;

//==================================================================================================
function  TfmTreeSelector.getCurrentID: Integer;
begin
  try
    Result := mdMain.FieldByName('id').AsInteger;

  except
    Result := -1;
  end;
end;

//==================================================================================================
procedure TfmTreeSelector.TreeGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
begin
  inherited;
  Aindex := Anode.Values[2];
end;

//==================================================================================================
procedure TfmTreeSelector.ListDblClick(Sender: TObject);
  var
    i: Integer;
begin
  for i := 0 to High(FSelectableSet) do
    if mdMain.FieldByName('type').asInteger = FSelectableSet[i] then begin
      SendMessage(FHandle, WM_TREESELECT, mdMain.RecNo, 0);
      //Self.ModalResult := mrOK;
      //Self.Hide;
      Exit;
    end;
end;

//==================================================================================================
procedure TfmTreeSelector.panTitleBarMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then begin
    ReleaseCapture;
    Self.Perform(WM_SYSCOMMAND, $F012, 0);
  end;
end;

//==================================================================================================
procedure TfmTreeSelector.btnTBCloseClick(Sender: TObject);
begin
  Self.Close;
end;

end.

