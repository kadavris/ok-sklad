{$I ok_sklad.inc}
unit Bundles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseRef, DB, ssDataSource, DBClient, ssClientDataSet, TB2Item,
  Menus, ActnList, dxCntner6, dxTL6, dxDBCtrl6, dxDBGrid6, ssBevel, ExtCtrls,
  cxImageComboBox, cxDropDownEdit, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxCalendar, ssSpeedButton,
  dxExEdtr6, dxInspRw, dxInspct, cxPC,
  dxDBTLCl6, dxGrClms6, ssDBGrid, ssPeriod, okPeriod, ssDBLookupCombo,
  prTypes, StdCtrls, ssMemDS, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxInplaceContainer, cxTLData, cxDBTL, cxCalc, dxExEdtr, dxCntner;

type
  TfmBundles = class(TfmBaseRef)
    aAddPayDoc: TAction;
    aDetColParams: TAction;
    aDRPrint: TAction;
    aFindAtMats: TAction;
    aFindAtSvc: TAction;
    aFindAtWH: TAction;
    aGotoDoc: TAction;
    aMatInfo: TAction;
    aMatMove: TAction;
    aMatRsv: TAction;
    aMC: TAction;
    aShowNullBallance: TAction;
    aSvcInfo: TAction;
    btnKagent: TssSpeedButton;
    bvlMainListTop: TssBevel;
    bvlRight: TssBevel;
    bvlTop: TssBevel;
    cbChecked: TcxImageComboBox;
    cdsDetail: TssMemoryData;
    cdsDetailFetch: TssClientDataSet;
    cdsDocRel: TssClientDataSet;
    cdsKAgent: TssClientDataSet;
    cdsRel: TssClientDataSet;
    colChecked: TdxDBGridImageColumn;
    colDRID: TdxDBGridColumn;
    colDRNum: TdxDBGridColumn;
    colDROnDate: TdxDBGridColumn;
    colDRShortName: TdxDBGridColumn;
    colDRSummAll: TdxDBGridColumn;
    colDRType: TdxDBGridImageColumn;
    colDRTypeName: TdxDBGridColumn;
    colID: TdxDBGridColumn;
    colImg: TdxDBGridImageColumn;
    colNotes: TdxDBGridColumn;
    colNum: TdxDBGridColumn;
    colOnDate: TdxDBGridColumn;
    colRChecked: TdxDBGridImageColumn;
    grdDocRel: TssDBGrid;
    inspMain: TdxInspector;
    irAmount: TdxInspectorTextRow;
    irCurr: TdxInspectorTextRow;
    irEmail: TdxInspectorTextHyperLinkRow;
    irFax: TdxInspectorTextRow;
    irKAAdress: TdxInspectorTextMemoRow;
    irKAFullName: TdxInspectorTextMemoRow;
    irKAgent: TdxInspectorTextButtonRow;
    irKAPhone: TdxInspectorTextRow;
    irNotes: TdxInspectorTextRow;
    irNum: TdxInspectorTextRow;
    irPerson: TdxInspectorTextRow;
    irReason: TdxInspectorTextRow;
    irStatus: TdxInspectorTextRow;
    irWWW: TdxInspectorTextHyperLinkRow;
    itmColParams: TTBItem;
    itmDetColParams: TTBItem;
    itmDRPrint: TTBItem;
    itmFindAtMats: TTBItem;
    itmFindAtSvc: TTBItem;
    itmMatInfo: TTBItem;
    itmMatMove: TTBItem;
    itmMatRsv: TTBItem;
    itmMC: TTBItem;
    itmPatternIns: TTBItem;
    lDocsCount: TLabel;
    lStatus: TLabel;
    mnuGotoDoc: TTBItem;
    PanDetFooter: TPanel;
    panFilter: TPanel;
    panFooter: TPanel;
    pcMain: TcxPageControl;
    pmDet: TTBPopupMenu;
    pmDocRel: TTBPopupMenu;
    prdMain: TokPeriod;
    sepDetColOptions: TTBSeparatorItem;
    Splitter1: TSplitter;
    srcDetail: TDataSource;
    srcKAgent: TDataSource;
    srcMainEx: TDataSource;
    srcRel: TDataSource;
    ssBevel10: TssBevel;
    ssBevel14: TssBevel;
    ssBevel15: TssBevel;
    ssBevel16: TssBevel;
    ssBevel17: TssBevel;
    ssBevel19: TssBevel;
    ssBevel1: TssBevel;
    ssBevel21: TssBevel;
    ssBevel22: TssBevel;
    ssBevel2: TssBevel;
    ssBevel4: TssBevel;
    ssBevel5: TssBevel;
    stCount: TssBevel;
    TBItem19: TTBItem;
    TBItem20basewbdoc: TTBItem;
    TBItem23: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBSeparatorItem10: TTBSeparatorItem;
    TBSeparatorItem11: TTBSeparatorItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBSeparatorItem6: TTBSeparatorItem;
    TBSeparatorItem7: TTBSeparatorItem;
    tsDocRel: TcxTabSheet;
    tsInfo: TcxTabSheet;
    tsPositions: TcxTabSheet;
    tsTemp: TcxTabSheet;
    tlDetails: TcxDBTreeList;

    procedure cdsDetailFetchAfterOpen(DataSet: TDataSet);
    procedure cdsDetailFetchBeforeOpen(DataSet: TDataSet);
    procedure cdsMainAfterOpen(DataSet: TDataSet);
    procedure colOnDateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colRecNoGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure FrameResize(Sender: TObject);
    procedure grdMainDblClick(Sender: TObject);
    procedure inspMainDrawCaption(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
    procedure inspMainDrawValue(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
    procedure pcMainChange(Sender: TObject);
    procedure prdMainChange(Sender: TObject);
    procedure srcMainDelayedDataChange(Sender: TObject; Field: TField);
    procedure srcMainExDataChange(Sender: TObject; Field: TField);
    procedure cdsDetailBeforeOpen(DataSet: TDataSet);

  private
    F: Boolean;

  protected
    FCurrRate: Extended;
    FShowNullBallanceStr: string;
    WBType: Integer;

    function GetDelStr(AID: Integer): string; virtual;
    procedure RealignControls; virtual;
    procedure RefreshDetail; virtual;
    procedure UpdatePos; virtual;
    function GetByDocID(ADocID: Integer): Integer;
    procedure SetOnDate(const Value: TDateTime); override;

  public
    procedure SetCaptions; override;
    procedure DoOpen(AParam: Variant); override;
    procedure DoClose; override;
    procedure DoShow; override;
    procedure DoDelete; override;
    procedure DoShowFilter; override;
    procedure DoLocate(const AID: Integer; ASubID: Integer = 0); override;
    procedure UpdateActionList; override;
    procedure DoRefresh(const AID: integer; AParam: Integer = 0); override;
    procedure LoadSkin; override;
    procedure DoCopy; override;
    procedure DoExcel(Grid: TdxDBGrid); override;
  end;

var
  fmBundles: TfmBundles;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  prConst, prFun, ssRegUtils, ssBaseConst, ssFun, ssDateUtils,
  ClientData, BaseFrame, EditMaterials, MatMove, MatRsv, fMessageDlg,
  ssClntCallback, ssCallbackConst, MCList, KATurnover, EditServices, prRep,
  ssStrUtil, Udebug;

var
  FcdsDetailOpening: Boolean = False;
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfmBundles.DoOpen(AParam: Variant);
 var
   dtTmp: TDateTime;
   intHeight, i, intTmp: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBundles.DoOpen') else _udebug := nil;{$ENDIF}

  CanRefresh := False;

  prdMain.RegistryPath := MainRegKey + '\' + Self.ClassName;

  for i := 0 to pcMain.PageCount - 1 do pcMain.Pages[i].Tag := 1;

  if ReadFromRegInt(MainRegKey + '\' + Self.ClassName + '\' + panClient.Name, 'Height', intHeight)
    then if intHeight > 0 then panClient.Height := intHeight;

  if ReadFromRegInt(MainRegKey + '\' + Self.ClassName, 'ActivePage', intTmp)
    then pcMain.ActivePageIndex := intTmp
    else pcMain.ActivePageIndex := 0;

  inherited;

  prdMain.LoadFromRegistry;
  colRChecked.Visible := True;
  colRChecked.Index := 1;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBundles.DoShow;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBundles.DoShow') else _udebug := nil;{$ENDIF}

  RealignControls;
  DoShowFilter;
  CanRefresh := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBundles.DoShowFilter;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBundles.DoShowFilter') else _udebug := nil;{$ENDIF}

  inherited;

  panFilter.Visible := aShowFilter.Checked;
  Application.ProcessMessages;
  DoRefresh(0);
  FrameResize(Self);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBundles.RealignControls;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBundles.RealignControls') else _udebug := nil;{$ENDIF}

  cbChecked.Left := panFilter.Width - cbChecked.Width - 6;
  lStatus.Left := cbChecked.Left - lStatus.Width - 4;

  stCount.Left := panFooter.Width - stCount.Width - 6;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBundles.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBundles.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    aAddPayDoc.Caption := GetRS('fmWaybill', 'AddPayDoc');
    aDetColParams.Caption := GetRS('Common', 'ColOptions') + '...';
    aDRPrint.Caption := GetRS('Common', 'Print');
    aFindAtMats.Caption := GetRS('fmWaybill', 'FindAtMats') + '...';
    aFindAtSvc.Caption := GetRS('fmWaybill', 'FindAtSvc') + '...';
    aFindAtWH.Caption := GetRS('fmWaybill', 'FindAtWH') + '...';
    aGotoDoc.Caption := GetRS('Common', 'Jump');
    aMatInfo.Caption := GetRS('fmWaybill', 'MatInfo');
    aMatMove.Caption := GetRS('fmWaybill', 'MoveInfo');
    aMatRsv.Caption := GetRS('fmWaybill', 'RsvInfo');
    aMC.Caption := GetRS('fmWMat', 'ShowMCList');
    aShowNullBallance.Caption := GetRS('fmWaybill', 'ShowNullBallance');
    aSvcInfo.Caption := GetRS('fmWaybill', 'SvcInfo');

    cbChecked.Properties.Items[0].Description := GetRS('Common', 'All');
    cbChecked.Properties.Items[1].Description := GetRS('fmWaybill', 'Checked');
    cbChecked.Properties.Items[2].Description := GetRS('fmWaybill', 'NoChecked');

    colImg.Caption := '';

    irAmount.Caption := GetRS('fmWaybill', 'TotalAmount');
    irCurr.Caption := GetRS('fmWaybill', 'Summ');
    irFax.Caption := GetRS('fmWaybill', 'KAFax');
    irNotes.Caption := GetRS('fmWaybill', 'Notes');
    irNum.Caption := amountPrefix(False);
    irPerson.Caption := GetRS('fmWaybill', 'PersonnameIn');
    irReason.Caption := GetRS('fmWaybill', 'Reason');
    irStatus.Caption := GetRS('fmWaybill', 'DocStatus');

    lDocsCount.Caption := GetRS('fmWaybill', 'DocsCount') + ':';
    lStatus.Caption := GetRS('fmWaybill', 'Status');

    prdMain.CapFrom := GetRS('fmPayDoc', 'FromDate') + ':';
    prdMain.InitRes;

    tsDocRel.Caption := GetRS('fmWaybill', 'DocRel');
    tsInfo.Caption := GetRS('fmWaybill', 'DocInfo');
    tsPositions.Caption := GetRS('fmWaybill', 'Positions') + ' ';
  end;

  RealignControls;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBundles.FrameResize(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBundles.FrameResize') else _udebug := nil;{$ENDIF}
  inherited;
  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBundles.DoRefresh(const AID: integer; AParam: integer = 0);
  var
    FFirst: Boolean;
    FLastIndex: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBundles.DoRefresh') else _udebug := nil;{$ENDIF}

  FLastIndex := grdMain.TopIndex;
  cdsMain.DisableControls;
  FFirst := not cdsMain.Active;
  case AParam of
      0: DSRefresh(cdsMain, _ID_, AID);

    100: DSRefresh(cdsMain, _ID_, 0);
  end;

  if FFirst then begin
    try
      if grdMain.Count > 0 then cdsMain.Locate(_ID_, grdMain.Items[0].Values[colID.Index], []);

    except
    end;
  end;

  grdMain.TopIndex := FLastIndex;
  cdsMain.EnableControls;

  SelectFocusedNode;
  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBundles.DoClose;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBundles.DoClose') else _udebug := nil;{$ENDIF}

  if not ModalView then WriteToRegInt(MainRegKey + '\' + Self.ClassName + '\' + panClient.Name, 'Height', panClient.Height);

  prdMain.SaveToRegistry;
  WriteToRegInt(MainRegKey + '\' + Self.ClassName, 'ActivePage', pcMain.ActivePageIndex);

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBundles.colOnDateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBundles.colOnDateGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatDateTime(ReplaceStr('dd.mm.yyyy', '.', DateSeparator), ANode.Values[colOnDate.Index]);

  except
    AText := '';
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBundles.cdsMainAfterOpen(DataSet: TDataSet);
  var
    i: Integer;
    FSum: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBundles.cdsMainAfterOpen') else _udebug := nil;{$ENDIF}

  DataSet.EnableControls;
  stCount.Caption := IntToStr(grdMain.Count);
  FrameResize(Self);
  NeedRefresh := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBundles.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBundles.UpdateActionList') else _udebug := nil;{$ENDIF}

  if not ModalView then begin
    aNew.Enabled := True;

    aProperties.Enabled := (grdMain.SelectedCount > 0)
      and (not grdMain.FocusedNode.HasChildren)
      and (VarToInt(grdMain.FocusedNode.Values[colChecked.Index]) = 0);

    aDel.Enabled := aProperties.Enabled;

    if Self.RefType <> prTypes.rtAccOut then aCheck.Enabled := (grdMain.SelectedCount > 0);
  end;

  aRefresh.Enabled := True;
  aPrint.Enabled := (grdMain.SelectedCount > 0);

  aPatternInsert.Enabled :=
    (grdMain.SelectedCount > 0) and (RefType <> prTypes.rtInv)
    and not grdMain.FocusedNode.HasChildren and not ModalView;

  aMatInfo.Enabled := not cdsDetail.IsEmpty;
  aMatMove.Enabled := aMatInfo.Enabled;
  aMatRsv.Enabled := aMatInfo.Enabled;
  aMC.Enabled := aMatInfo.Enabled;

  aGotoDoc.Enabled := not cdsRel.IsEmpty;
  aDRPrint.Enabled := not cdsRel.IsEmpty;
  aFindAtWH.Enabled := not cdsDetail.IsEmpty;
  aAddPayDoc.Enabled := not cdsMain.IsEmpty;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBundles.srcMainExDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBundles.srcMainExDataChange') else _udebug := nil;{$ENDIF}

  with grdMain do
    if not cdsMain.IsEmpty and (cdsMain.FieldByName('checked').AsInteger = 0)
      then aCheck.Caption := rs('Common', 'Check')
      else aCheck.Caption := rs('Common', 'UnCheck');

  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBundles.srcMainDelayedDataChange(Sender: TObject; Field: TField);
  var
    i, FPosID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBundles.srcMainDelayedDataChange') else _udebug := nil;{$ENDIF}

  for i := 0 to pcMain.PageCount - 1 do pcMain.Pages[i].Tag := 1;
  UpdateActionList;

  with cdsMain do begin
    if not IsEmpty then begin
      irNum.Text := FieldByName('num').AsString + rs('fmWaybill', 'From', 3)
        + ssDateToStr(FieldByName('ondate').AsDateTime) + ' ' + TimeToStr(FieldByName('ondate').AsDateTime);

      irFax.Text := FieldByName('fax').AsString;

      if Trim(FieldByName('email').AsString) <> ''
        then irEmail.Text := 'mailto:' + FieldByName('email').AsString
        else irEmail.Text := '';

      irWWW.Text := FieldByName('www').AsString;

      if FindField('currrate') <> nil then FCurrRate := FieldByName('currrate').AsFloat;

      if FindField('reason') <> nil then irReason.Text := FieldByName('reason').AsString;

      irNotes.Text := FieldByName('notes').AsString;
      irPerson.Text := FieldByName('personname').AsString;

      if FieldByName('checked').AsInteger = 1
        then irStatus.Text := rs('fmWaybill', 'DocChecked')
        else irStatus.Text := rs('fmWaybill', 'DocUnChecked');
    end // if not isEmpty
    else begin
      irNum.Text := '';
      irCurr.Text := '';
      irReason.Text := '';
      irPerson.Text := '';
      irFax.Text := '';
      irEmail.Text := '';
      irWWW.Text := '';
      irStatus.Text := '';
      irNotes.Text := '';
    end;
  end;

  RefreshDetail;

  if cdsDetail.IsEmpty
    then FPosID := 0
    else FPosID := cdsDetail.FieldByName('posid').AsInteger;

  SetCurrIDToBuffer(cdsMain.FieldByName('docid').AsInteger, FPosID);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBundles.RefreshDetail;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  if not pcMain.Visible or not cdsMain.Active then Exit;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBundles.RefreshDetail') else _udebug := nil;{$ENDIF}

  if pcMain.ActivePage.Tag = 1 then begin
    if pcMain.ActivePage = tsInfo then begin
      DSRefresh(cdsDetail, 'posid', 0);
    end
    else if pcMain.ActivePage = tsPositions then begin
      DSRefresh(cdsDetail, 'posid', 0);
    end
    else if pcMain.ActivePage = tsDocRel then begin
      if tsDocRel.TabVisible then DSRefresh(cdsRel, 'docid', 0);
      AdjustGrid(grdDocRel, colDRTypeName);
    end;

    pcMain.ActivePage.Tag := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBundles.pcMainChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBundles.pcMainChange') else _udebug := nil;{$ENDIF}

  RefreshDetail;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBundles.cdsDetailFetchBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBundles.cdsDetailFetchBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsDetailFetch.Params.ParamByName(_ID_).AsInteger := cdsMain.fieldbyname(_ID_).AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBundles.colRecNoGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBundles.colRecNoGetText') else _udebug := nil;{$ENDIF}

  if (ANode <> nil) and (Atext <> '') then AText := IntToStr(ANode.Index + 1);

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBundles.inspMainDrawCaption(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBundles.inspMainDrawCaption') else _udebug := nil;{$ENDIF}

  if UseGridOddColor and Odd(Sender.Node.AbsoluteIndex)
    then AColor := GridOddLinesColor
    else AColor := clWindow;

  AFont.Color := clWindowText;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBundles.inspMainDrawValue(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBundles.inspMainDrawValue') else _udebug := nil;{$ENDIF}

  if UseGridOddColor and Odd(Sender.Node.AbsoluteIndex)
    then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBundles.cdsDetailFetchAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBundles.cdsDetailFetchAfterOpen') else _udebug := nil;{$ENDIF}

  CopyDataSet(cdsDetail, cdsDetailFetch);

  with cdsDetail do begin
    DisableControls;
    First;

    while not Eof do begin
      UpdatePos;
      Next;
    end;

    First;
    EnableControls;
  end;
  
  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmBundles.GetDelStr(AID: Integer): string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBundles.GetDelStr') else _udebug := nil;{$ENDIF}

  case FunID of
    21: Result := rs('fmWaybill', 'DocWBIn');
    23: Result := rs('fmWaybill', 'DocWBOut');
    30: Result := rs('fmWaybill', 'DocAccOut');
    33: Result := rs('fmWaybill', 'DocTaxWB');
    36: Result := rs('fmWaybill', 'DocWBMove');
    44: Result := rs('fmWaybill', 'DocWBRest');
    41: Result := rs('fmWaybill', 'DocWriteOff');
    42: Result := rs('fmWaybill', 'DocWBRetIn');
    43: Result := rs('fmWaybill', 'DocWBRetOut');
    53: Result := rs('fmWaybill', 'DocInv');
    62: Result := rs('fmWaybill', 'DocInvoice');
    64: Result := rs('fmWaybill', 'DocOrderOut');
    65: Result := rs('fmWaybill', 'DocOrderIn');
  end;

  Result := Result + amountPrefix + cdsMain.FieldByName('num').AsString +
    RS('fmWaybill', 'From', 3) +
    DateToStr(cdsMain.FieldByName('ondate').AsDateTime) + ' ' +
    AnsiLowerCase(RS('fmWaybill', 'DocsSumm')) + ' ' +
    FormatFloat(MoneyDisplayFormat, cdsMain.FieldByName('summall').AsFloat) +
    BaseCurrName;

  if not (FunID in [44, 53, 41, 36])
    then Result := Result + ' (' + cdsMain.FieldByName('kaname').AsString + ')';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBundles.DoDelete;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBundles.DoDelete') else _udebug := nil;{$ENDIF}

  if ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes
  then try
    Application.ProcessMessages;

    if DelToRecycleBin then begin
      if not AddToRecycleBin(dmData.SConnection, Self.ClassName, cdsMain.fieldbyname(_ID_).AsInteger, GetDelStr(cdsMain.fieldbyname(_ID_).AsInteger), False, Self.FunID)
      then begin
        ssMessageDlg(rs('Common','ErrorInsToRecycleBin'), ssmtError, [ssmbOk]);
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;
    end
    else
      if not DeleteDataEx(dmData.SConnection, 'waybilllist', 'wbillid', cdsMain.fieldbyname(_ID_).AsInteger)
        then raise Exception.Create(rs('Common','DeleteError'));

    LocateAfterDel;
    DoRefresh(0);
    RefreshFun('TfmWMat', 0);
    UpdateActionList;

    {if RefreshAllClients then begin
      dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WBIN);
      dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_WMAT);
    end;
    }

  except
    on e:exception do ssMessageDlg(rs('Common', 'NoDelete'), ssmtError, [ssmbOk]);
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBundles.grdMainDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBundles.grdMainDblClick') else _udebug := nil;{$ENDIF}

  UpdateActionList;
  if grdMain.Count > 0 then begin
    if aProperties.Enabled
      then DoProperties
      else begin
        if aCheck.Enabled then DoCheck(True);
        UpdateActionList;
        if aProperties.Enabled then DoProperties;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBundles.DoLocate(const AID: Integer; ASubID: Integer = 0);
  var
    FFrom, FTo, FDocDate: TDateTime;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBundles.DoLocate') else _udebug := nil;{$ENDIF}

  grdMain.ClearSelection;
  srcMain.ChangeDelay := 0;
  if not cdsMain.Locate('docid', AID, []) then
    with newDataSet do
    try
      if Self.RefType = prTypes.rtTaxWB
        then ProviderName := 'pTaxWB_Get_Doc'
        else ProviderName := 'pWaybill_Get_Doc';

      FetchParams;
      Params.ParamByName('docid').AsInteger := AID;
      Open;

      if IsEmpty
        then begin
          if AID <> 0
            then ssMessageDlg(rs('fmWaybill', 'DocNotFound'), ssmtError, [ssmbOK])
            else SelectFocusedNode;
        end
        else begin
          CanRefresh := False;

          if prdMain.FromDate = 0
            then FFrom := MinDateTime
            else FFrom := prdMain.FromDate;

          if prdMain.ToDate = 0
            then FTo := MaxDateTime
            else FTo := LastSecondInDay(prdMain.ToDate);

          FDocDate := FieldByName('ondate').AsDateTime;
          if (FDocDate < FFrom) or (FDocDate > FTo) then begin
            prdMain.PeriodType := ptCustom;
            prdMain.FromDate := Int(FDocDate);
            prdMain.ToDate := Int(FDocDate);
          end;
          
          if cbChecked.EditValue > 0 then cbChecked.EditValue := 2 - FieldByName('checked').AsInteger;

          CanRefresh := True;
          DSRefresh(cdsMain, 'docid', AID);
        end;

      Close;

    finally
      Free;
    end;

  if (ASubID > 0) and (cdsDetail.Active) then cdsDetail.Locate('posid', ASubID, []);

  srcMain.ChangeDelay := 250;
  SelectFocusedNode;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBundles.LoadSkin;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBundles.LoadSkin') else _udebug := nil;{$ENDIF}

  inherited;

  panFilter.Color := clokFilter;
  panFooter.Color := clokFooter;
  panDetFooter.Color := clokFooter;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmBundles.GetByDocID(ADocID: Integer): Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBundles.GetByDocID') else _udebug := nil;{$ENDIF}

  Result := 0;

  with newDataSet do
  try
    ProviderName := 'pWaybill_GetByDocID';
    FetchParams;
    Params.ParamByName('docid').AsInteger := ADocID;
    Open;
    Result := FieldByName('wbillid').AsInteger;
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBundles.prdMainChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBundles.prdMainChange') else _udebug := nil;{$ENDIF}

  if CanRefresh then DoRefresh(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBundles.SetOnDate(const Value: TDateTime);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBundles.SetOnDate') else _udebug := nil;{$ENDIF}

  inherited;

  prdMain.BaseDate := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBundles.UpdatePos;
  var
    FAmount, FNorm, FSummCurr, FPriceCurr, FNDS, FCurrRate: Extended;
    FPriceWithNDS, FPriceWONDS, FSummWONDS, FSummNDS, FSummWithNDS: Extended;
    s: String;
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  if cdsDetail.IsEmpty then Exit;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBundles.UpdatePos') else _udebug := nil;{$ENDIF}

  with cdsDetail do begin
    try
      FAmount := FieldByName('amount').AsFloat;
      FPriceCurr := FieldByName('price').AsFloat;
      FNDS := FieldByName('nds').AsFloat;
      FCurrRate := FieldByName('onvalue').AsFloat;

    except
      raise;  // wtf???
    end;

    NDSCalc(1, FPriceCurr * FCurrRate, FNDS, 1, FSummWONDS, FSummNDS);
    FPriceWithNDS := RoundToA(FSummWONDS + FSummNDS, -2);
    FPriceWONDS := RoundToA(FSummWONDS + FSummNDS, -2) - RoundToA(FSummNDS, -2);

    NDSCalc(FAmount, FPriceCurr * FCurrRate, FNDS, 1, FSummWONDS, FSummNDS);
    FSummWithNDS := RoundToA(FSummWONDS + FSummNDS, -2);
    FSummNDS := RoundToA(FSummNDS, -2);
    FSummWONDS := FSummWithNDS - FSummNDS;

    //if FNorm > 0 then FAmount := FAmount * FNorm;

    FSummCurr := RoundToA(FAmount * FPriceCurr, -2);

    try
      Edit;
      FieldByName('sumcurr').AsCurrency := FSummCurr;
      FieldByName('pricewithnds').AsFloat := FPriceWithNDS;
      FieldByName('pricewonds').AsFloat := FPriceWONDS;
      FieldByName('sumwithnds').AsFloat := FSummWithNDS;
      FieldByName('sumnds').AsFloat := FSummNDS;
      FieldByName('sumwonds').AsFloat := FSummWONDS;
      FieldByName('onvalue').AsFloat := FCurrRate;
      Post;

    except
      on e: Exception do begin
        //very possible DB corruption. appears when already null-ed 'required' field(s) was fetched from DB.
        // also happens when there is no positions in the document what does not allowed
        if pos('Field value required', e.Message) > 0 then begin
          s := e.Message + '\n';

          {$IFDEF DEBUG}
          s := s + 'fields: \n';

          for i := 0 to FieldCount - 1 do begin
            s := s + Fields[i].Name + ' (' + Fields[i].FieldName + '): ';

            if Fields[i].Required then s := s + 'Required, ';
            if Fields[i].ReadOnly then s := s + 'ReadOnly, ';
            if Fields[i].FieldKind <> fkData then s := s + 'not fkData, ';
            if Fields[i].IsNull then s := s + 'NULL, ';

            s := s + '\n';
          end;
          {$ENDIF}

          ssMessageDlg(s + rs('Common', 'Err_DBFixReq'), ssmtError, [ssmbOK])
        end;
      end;
    end;

  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBundles.DoCopy;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBundles.DoCopy') else _udebug := nil;{$ENDIF}


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBundles.DoExcel(Grid: TdxDBGrid);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBundles.DoExcel') else _udebug := nil;{$ENDIF}


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmBundles.cdsDetailBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  if FcdsDetailOpening then Exit;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmBundles.cdsDetailBeforeOpen') else _udebug := nil;{$ENDIF}

  FcdsDetailOpening := True;

  inherited;

  try
    try
      cdsDetailFetch.Close;
      cdsDetailFetch.Open;
      //CopyDataSet(cdsDetail, cdsDetailFetch);

    except
      raise;
    end;

  finally
    FcdsDetailOpening := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('Bundles', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
