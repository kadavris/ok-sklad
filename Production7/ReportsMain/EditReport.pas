{$I ok_sklad.inc}
unit EditReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ExtCtrls, Buttons, DB, DBClient, Grids, DBGrids, StdCtrls, ActnList,
  Mask, ImgList, ComCtrls, Menus,
  xButton,

  dxEditor6, dxExEdtr6, dxTL6, dxDBCtrl6, dxDBGrid6, dxCntner6, dxDBTLCl6, dxGrClms6,

  cxControls, cxContainer, cxEdit, cxTextEdit, cxLookAndFeelPainters, cxCheckBox, cxButtons,
  cxListView, cxCalendar, cxPC, cxInplaceContainer, cxTreeView, cxGroupBox,
  cxMemo, cxDBEdit, cxDropDownEdit, cxCalc, cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxImageComboBox, cxRadioGroup, cxSpinEdit, cxCurrencyEdit, cxGraphics, cxCustomData, cxStyles, cxTL,

  ssBaseTypes, ssFormStorage, ssBaseDlg,
  ssDBComboBox, ssClientDataSet, ssBevel, ssSpeedButton, ssPanel, ssGradientPanel,ssBaseConst, ssCalcEdit,
  ssDBLookupCombo, ssPopupTreeEdit, ssImagePanel, ssDBTreeView, ssLabel, ssMemDS, ssGroupBox;

type
  TfrmEditReport = class(TBaseDlg)
    aAddCType: TAction;
    aAddKA: TAction;
    aAddMat: TAction;
    aAddMG: TAction;
    aAddWHouse: TAction;
    aDrillDown: TAction;
    aExp: TAction;
    aPrint: TAction;
    aUseLogo: TAction;
    btnAddMG: TssSpeedButton;
    btnDrillDown: TssSpeedButton;
    btnUseDiagram: TssSpeedButton;
    btnUseLogo: TssSpeedButton;
    cbChecked: TcxImageComboBox;
    cbEFilter: TcxCheckBox;
    cdsChargeType: TssClientDataSet;
    cdsEmployee: TssClientDataSet;
    cdsKAgent: TssClientDataSet;
    cdsMatGroup: TssClientDataSet;
    cdsPriceTypes: TssClientDataSet;
    cdsWhouse: TssClientDataSet;
    cdsWhouseADDR: TStringField;
    cdsWhouseDELETED: TIntegerField;
    cdsWhouseNAME: TStringField;
    cdsWhouseNOTES: TStringField;
    cdsWhouseWID: TIntegerField;
    chbAccOut: TcxCheckBox;
    chbBOnly: TcxCheckBox;
    chbExpAll: TcxCheckBox;
    chbGrpBy: TcxCheckBox;
    chbOrderIn: TcxCheckBox;
    chbOrderOut: TcxCheckBox;
    chbPayIn: TcxCheckBox;
    chbPayOut: TcxCheckBox;
    chbPosAmount: TcxCheckBox;
    chbPrintArtikuls: TcxCheckBox;
    chbRetIn: TcxCheckBox;
    chbRetOut: TcxCheckBox;
    chbWaybillMove: TcxCheckBox;
    chbWBIn: TcxCheckBox;
    chbWBOut: TcxCheckBox;
    dsMatGroup: TDataSource;
    dsWhouse: TDataSource;
    edFromDate: TcxDateEdit;
    edMat: TcxTextEdit;
    edMatGroup: TssPopupTreeEdit;
    edPosAmount: TcxSpinEdit;
    edToDate: TcxDateEdit;
    gb7PriceTypes: TssGroupBox;
    Image1: TImage;
    Image2: TImage;
    imgMain: TImage;
    lcbChargeType: TssDBLookupCombo;
    lcbEFilter: TssDBLookupCombo;
    lcbKAgent: TssDBLookupCombo;
    lcbPriceTypes: TssDBLookupCombo;
    lcbWHouse: TssDBLookupCombo;
    lChargeType: TLabel;
    lFromDate: TLabel;
    lKAgent: TLabel;
    lMatGroup: TLabel;
    lPosAmount: TLabel;
    lStatus: TLabel;
    lText1: TLabel;
    lText2: TLabel;
    lText3: TLabel;
    lText4: TLabel;
    lToDate: TLabel;
    lWhouse: TLabel;
    p1: TcxTabSheet;
    p21: TcxTabSheet;
    p22: TcxTabSheet;
    p2: TcxTabSheet;
    p3: TcxTabSheet;
    panChargeType: TPanel;
    panDates: TPanel;
    panEFilter: TPanel;
    panGrpBy: TPanel;
    panKA: TPanel;
    PanRank: TPanel;
    pc7: TcxPageControl;
    pcMain: TcxPageControl;
    pcP2: TcxPageControl;
    rbt7DefPrice: TcxRadioButton;
    rbt7PriceType: TcxRadioButton;
    rgSortDirect: TcxRadioGroup;
    rgSortType: TcxRadioGroup;
    sbAddKa: TssSpeedButton;
    sbAddMat: TssSpeedButton;
    sbAddWHouse: TssSpeedButton;
    sbChargeType: TssSpeedButton;
    srcChargeType: TDataSource;
    srcEmployee: TDataSource;
    srcKAgent: TDataSource;
    srcPriceTypes: TDataSource;
    ssBevelLeft: TssBevel;
    tsMain: TcxTabSheet;
    tsRep7: TcxTabSheet;

    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure DataModified(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure aAddMatExecute(Sender: TObject);
    procedure aAddKAExecute(Sender: TObject);
    procedure aDrillDownExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lcbKAgentPropertiesEditValueChanged(Sender: TObject);
    procedure pcMainEnter(Sender: TObject);
    procedure aAddWHouseExecute(Sender: TObject);
    procedure aUseLogoExecute(Sender: TObject);
    procedure aExpExecute(Sender: TObject);
    procedure aAddMGExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aPrintExecute(Sender: TObject);
    procedure edMatGroupGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
    procedure edMatGroupPropertiesChange(Sender: TObject);
    procedure aSendErrMessageExecute(Sender: TObject);
    procedure aAddCTypeExecute(Sender: TObject);
    procedure lcbChargeTypePropertiesChange(Sender: TObject);
    procedure rbt7DefPriceClick(Sender: TObject);
    procedure cdsWhouseBeforeOpen(DataSet: TDataSet);
    procedure cbEFilterPropertiesChange(Sender: TObject);

  private
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;

  protected
    procedure setid(const Value: integer); override;
    procedure SetParentName(const Value: string); override;

  public
    ParentHandle: HWND;
    RepID: Integer;

    procedure SetCaptions; override;
    procedure DoHelp; override;
  end;

var
  frmEditReport: TfrmEditReport;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  prConst, ClientData, Login, prFun, ssFun, prTypes,
  dxmdaset,Math, ssBaseIntfDlg, ssRegUtils, xLngManager, fMessageDlg, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfrmEditReport.WMRefresh(var M: TMessage);
  var
     msrname, artikul:String;
     wid:integer; FBySN:boolean;
     {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditReport.WMRefresh') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
    rtKAgent: begin
      DSRefresh(cdsKAgent, 'KAID', M.WParam);
      lcbKAgent.KeyValue := M.WParam;
    end;

    rtMat: begin
      edMat.Tag := M.WParam;
      edMat.Text := MatName(dmData.SConnection,edMat.Tag,msrname,artikul,wid,FBySN);
    end;

    rtWHouse: begin
      DSRefresh(cdsWhouse, 'wid', M.WParam);
      lcbWhouse.KeyValue := M.WParam;
    end;

    rtMatGroup: begin
      if M.WParam>0 then begin
        DSRefresh(cdsMatGroup, 'grpid', M.WParam);
        edMatGroup.Value := M.WParam;
      end;//if
    end;//rtmat

    rtChargeType: begin
      DSRefresh(cdsChargeType, 'ctypeid', M.WParam);
      lcbChargeType.KeyValue := M.WParam;
    end;//rtChargeType
  end;//case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditReport.setid(const Value: integer);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditReport.setid') else _udebug := nil;{$ENDIF}
  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditReport.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditReport.ActionListUpdate') else _udebug := nil;{$ENDIF}

  if lcbKAgent.Focused
    then aAddKA.ShortCut := TextToShortCut('Ctrl+Ins')
    else aAddKA.ShortCut := TextToShortCut(EmptyStr);

  if lcbChargeType.Focused
    then aAddCType.ShortCut := TextToShortCut('Ctrl+Ins')
    else aAddCType.ShortCut := TextToShortCut(EmptyStr);

  if edMatGroup.Focused
    then aAddMG.ShortCut := TextToShortCut('Ctrl+Ins')
    else aAddMG.ShortCut := TextToShortCut(EmptyStr);

  if edMat.Focused
    then aAddMat.ShortCut := TextToShortCut('Ctrl+Ins')
    else aAddMat.ShortCut := TextToShortCut(EmptyStr);

  if lcbWHouse.Focused
    then aAddWHouse.ShortCut := TextToShortCut('Ctrl+Ins')
    else aAddWHouse.ShortCut := TextToShortCut(EmptyStr);

  edPosAmount.Enabled := chbPosAmount.Checked;

  case Tag of
    8:
      begin
       if lcbKAgent.KeyValue > 0
         then lKAgent.Font.Color := clBlack
         else lKAgent.Font.Color := clRed;
      end;//8

    9,19:
      begin
        if edMat.Tag > 0
          then lMatGroup.Font.Color := clBlack
          else lMatGroup.Font.Color := clRed;
      end;
  end;//case

  aDrillDown.Enabled := edMatGroup.Value > 0;

  if tag <> 11
    then aOk.Enabled := (lKAgent.Font.Color<>clRed)and(lMatGroup.Font.Color<>clRed)
    else aOk.Enabled := chbAccOut.Checked or chbPayIn.Checked or
        chbPayOut.Checked or chbWBIn.Checked or chbWBOut.Checked or
        chbWaybillMove.Checked or chbRetIn.Checked or chbRetOut.Checked or
        chbOrderIn.Checked or chbOrderOut.Checked;

  aApply.Enabled := aOk.Enabled and FModified;
  aPrint.Enabled := aOK.Enabled;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditReport.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditReport.DataModified') else _udebug := nil;{$ENDIF}

  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditReport.DoHelp;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditReport.DoHelp') else _udebug := nil;{$ENDIF}

  ShowHelpTopic('Rep' + IntToStr(RepID));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


//==============================================================================================
procedure TfrmEditReport.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditReport.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    aAddKA.Hint := GetRS(ParentNameEx, 'KAAdd');
    aDrillDown.Hint := GetRS(ParentNameEx,'DrillDown');
    aAddWHouse.Hint := GetRS(ParentNameEx,'WMat');
    aAddMat.Hint := GetRS(ParentNameEx,'Mats');
    lFromDate.Caption := GetRS(ParentNameEx,'fromdate') + ':';
    lToDate.Caption := GetRS(ParentNameEx,'todate') + ':';
    lWhouse.Caption := GetRS(ParentNameEx,'whouse') + ':';
    lMatGroup.Caption := GetRS(ParentNameEx,'matgrp') + ':';
    aUseLogo.Hint := GetRS('fmPriceList', 'UseLogo');
    rgSortType.Caption := ' ' + GetRS(ParentNameEx,'Sort') + ' ';
    rgSortType.Properties.Items[0].Caption := GetRS(ParentNameEx,'SbyAmount');
    rgSortType.Properties.Items[1].Caption := GetRS(ParentNameEx,'SbyPr');
    rgSortType.Properties.Items[2].Caption := GetRS(ParentNameEx,'SbyPrR');
    rgSortDirect.Caption := ' ' + GetRS(ParentNameEx,'Direct') + ' ';
    rgSortDirect.Properties.Items[0].Caption := GetRS(ParentNameEx,'DirUp');
    rgSortDirect.Properties.Items[1].Caption := GetRS(ParentNameEx,'DirDown');
    //chbUseNds.Properties.Caption := GetRS(ParentNameEx,'UseNDS');
    chbPosAmount.Properties.Caption := GetRS(ParentNameEx,'ShowTopOnly1');
    lPosAmount.Caption := GetRS(ParentNameEx,'ShowTopOnly2');
    lStatus.Caption := GetRS(ParentNameEx,'Status') + ':';
    chbWBIn.Properties.Caption := GetRS(ParentNameEx,'WBIn');
    chbWBOut.Properties.Caption := GetRS(ParentNameEx,'WBOut');
    chbAccOut.Properties.Caption := GetRS(ParentNameEx,'AccOut');
    chbPayIn.Properties.Caption := GetRS(ParentNameEx,'PayIn');
    chbPayOut.Properties.Caption := GetRS(ParentNameEx,'PayOut');
    chbWaybillMove.Properties.Caption := GetRS('frmOptions','WBMove');
    chbRetIn.Properties.Caption := GetRS(ParentNameEx,'RetIn');
    chbRetOut.Properties.Caption := GetRS(ParentNameEx,'RetOut');
    chbOrderOut.Properties.Caption := GetRS('frmOptions', 'OrdersOut');
    chbOrderIn.Properties.Caption := GetRS('frmOptions', 'OrdersIn');

    chbExpAll.Properties.Caption := GetRS('fmPayDoc', 'ExpAll');

    chbGrpBy.Properties.Caption := GetRS(ParentNameEx,'GprBy');
    lChargeType.Caption := GetRS('fmPayDoc','ChargeTypeOut')+':';

    aOK.Caption := GetRS(ParentNameEx, 'ShowRep');
    aPrint.Hint := GetRS(ParentNameEx, 'ShowRep');
    aExp.Hint := GetRS(ParentNameEx,'Exp');
    aAddMG.Hint := GetRS('fmMaterials','MatGroups');
    btnUseDiagram.Hint := GetRS(ParentNameEx,'UseChart');
    chbPrintArtikuls.Properties.Caption := GetRS(ParentNameEx, 'PrintArtikuls');

    rbt7DefPrice.Caption := GetRS(ParentNameEx, 'PutInPrices');
    rbt7PriceType.Caption := GetRS(ParentNameEx, 'PutOutPrices');
    gb7PriceTypes.Caption := ' ' + GetRS(ParentNameEx, 'Prices') + ' ';

    cbChecked.Properties.Items[0].Description := GetRS('Common', 'All');
    cbChecked.Properties.Items[1].Description := GetRS('fmWaybill', 'Checked');
    cbChecked.Properties.Items[2].Description := GetRS('fmWaybill', 'NoChecked');
    chbBOnly.Properties.Caption := GetRS(ParentNameEx,'RepBOnly');

    case RepID of
      3: lText1.Caption := GetRS(ParentNameEx, 'RepWBOutText1') + #13#10 + GetRS(ParentNameEx, 'RepWBOutText2');
      4: lText1.Caption := GetRS(ParentNameEx, 'RepWBInText1') + #13#10 + GetRS(ParentNameEx, 'RepWBInText2');
      1: lText2.Caption := GetRS(ParentNameEx, 'RepWBInText3') + #13#10 + GetRS(ParentNameEx, 'RepWBInText4') + #13#10 + GetRS(ParentNameEx, 'RepWBInText2');
      2: lText2.Caption := GetRS(ParentNameEx, 'RepWBOutText3') + #13#10 + GetRS(ParentNameEx, 'RepWBInText4') + #13#10 + GetRS(ParentNameEx, 'RepWBInText2');
      7: lText2.Caption := GetRS(ParentNameEx, 'RepMRText1') + #13#10 + GetRS(ParentNameEx, 'RepWBInText4');
      9: lText2.Caption := GetRS(ParentNameEx, 'RepMatMoveText1') + #13#10 + GetRS(ParentNameEx, 'RepWBInText2');
      11: lText4.Caption := GetRS(ParentNameEx, 'RepDocReestrText1') + #13#10 + GetRS(ParentNameEx, 'RepWBInText2');
      10: lText2.Caption := GetRS(ParentNameEx, 'RepMatTurnText1') + #13#10 + GetRS(ParentNameEx, 'RepWBInText4') + #13#10 + GetRS(ParentNameEx, 'RepWBInText2');
      12,13: lText2.Caption := GetRS(ParentNameEx, 'RepProfit') + #13#10 + GetRS(ParentNameEx, 'RepWBInText4') + #13#10 + GetRS(ParentNameEx, 'RepWBInText2');
      8: lText1.Caption := GetRS(ParentNameEx, 'RepKAText1') + #13#10 + GetRS(ParentNameEx, 'RepWBInText2');
      5: lText3.Caption := GetRS(ParentNameEx, 'RepKACreditText1');
      6: lText3.Caption := GetRS(ParentNameEx, 'RepKADebtText1');

      14:
        begin
          lText2.Visible := False;
          Image1.Visible := False;
        end;
      18:
        begin
          lText2.Visible := True;
          lText2.Caption := GetRS(ParentNameEx, 'RepMinRestText2');
        end;
      15:
        begin
          lText2.Visible := True;
          lText2.Caption := GetRS(ParentNameEx, 'RepDyn');
        end;
      16:
        begin
          lText1.Visible := True;
          lText1.Caption := GetRS(ParentNameEx, 'RepExpenses');
        end;
      17:
        begin
          lText3.Visible := True;
          lText3.Caption := GetRS(ParentNameEx, 'ReplPRvsEx');
        end;
      19:
        begin
          lText2.Visible := True;
          lText2.Caption := GetRS(ParentNameEx, 'Rep19Info');
        end;
    end;//case
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditReport.FormKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditReport.FormKeyPress') else _udebug := nil;{$ENDIF}

  if (Key = #13) then begin
    Key := #0;
    Perform(WM_NEXTDLGCTL,0,0);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditReport.aAddMatExecute(Sender: TObject);
  var
    aid: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditReport.aAddMatExecute') else _udebug := nil;{$ENDIF}

  try
    aid := edMat.Tag;
  except
    aid := 0;
  end;

  edMat.SetFocus;
  ShowModalRef(Self, rtMat, vtMat, 'TfmMaterials', Self.OnDate, aid);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditReport.aAddKAExecute(Sender: TObject);
  var
    aid: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditReport.aAddKAExecute') else _udebug := nil;{$ENDIF}

  try aid := lcbKAgent.KeyValue; except aid := 0; end;
  lcbKAgent.SetFocus;
  ShowModalRef(Self, rtKAgent, vtKAgent, 'TfmKAgent', Self.OnDate, aid);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditReport.aDrillDownExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditReport.aDrillDownExecute') else _udebug := nil;{$ENDIF}

  btnDrillDown.Checked := not btnDrillDown.Checked;
  aDrillDown.Checked := not aDrillDown.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditReport.FormCreate(Sender: TObject);
  var
    tmp: TDateTime;
    tmpInt: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditReport.FormCreate') else _udebug := nil;{$ENDIF}

  cdsMatGroup.Open;
  if ReadFromRegInt(MainRegKey + '\' + Self.ClassName + '\' + edMatGroup.Name, 'Value', tmpInt)
  then begin
    edMatGroup.Value := tmpInt;
    if tmpInt = 0 then begin
      edMatGroup.Text := rs('Common', 'All');
      edMatGroup.Tag := 10;
    end;
  end;

  if ReadFromRegDate(MainRegKey + '\' + Self.ClassName + '\' + edFromDate.Name, 'Date', tmp)
    then try
      edFromDate.Date := tmp;
    except
      edFromDate.EditValue := Null;
    end
  else edFromDate.EditValue := Null;

  // SetCaptions; // must be called explicitly as ParentNameEx is not set at this time

  inherited;

  lKAgent.Font.Color := clBlack;
  cdsPriceTypes.Open;
  pc7.ActivePageIndex := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditReport.lcbKAgentPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditReport.lcbKAgentPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  case Tag of
    8:begin
      if lcbKAgent.KeyValue > 0
        then aOK.Enabled := true
        else aOK.Enabled := false;
    end;//8
  end;//case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditReport.pcMainEnter(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditReport.pcMainEnter') else _udebug := nil;{$ENDIF}

  Perform(WM_NEXTDLGCTL,0,0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditReport.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditReport.SetParentName') else _udebug := nil;{$ENDIF}

  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditReport.aAddWHouseExecute(Sender: TObject);
  var
    aid: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditReport.aAddWHouseExecute') else _udebug := nil;{$ENDIF}

  try aid := lcbWHouse.KeyValue; except aid := 0; end;
  lcbWHouse.SetFocus;
  ShowModalRef(Self, rtWHouse, vtWHouse, 'TfmWHouse', Self.OnDate, aid);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditReport.aUseLogoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditReport.aUseLogoExecute') else _udebug := nil;{$ENDIF}

  aUseLogo.Checked := not aUseLogo.Checked;
  btnUseLogo.Checked := not btnUseLogo.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditReport.aExpExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditReport.aExpExecute') else _udebug := nil;{$ENDIF}
  ssMessageDlg('Exp!', ssmtInformation, [ssmbOK]);
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmEditReport.aAddMGExecute(Sender: TObject);
  var
    aid: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditReport.aAddMGExecute') else _udebug := nil;{$ENDIF}

  try  aid := edMatGroup.Value; except  aid := 0; end;
  ShowModalRef(Self, rtMatGroup, vtMatGroup, 'TfmMatGroup', Self.OnDate, aid);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditReport.FormClose(Sender: TObject; var Action: TCloseAction);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditReport.FormClose') else _udebug := nil;{$ENDIF}

  WriteToRegDate(MainRegKey + '\' + Self.ClassName + '\' + edFromDate.Name, 'Date', edFromDate.Date);
  WriteToRegInt(MainRegKey + '\' + Self.ClassName + '\' + edMatGroup.Name, 'Value', edMatGroup.Value);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditReport.aPrintExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditReport.aPrintExecute') else _udebug := nil;{$ENDIF}

  ModalResult := mrOk;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditReport.edMatGroupGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditReport.edMatGroupGetNodeImageIndex') else _udebug := nil;{$ENDIF}

  if ANode.Expanded
    then AIndex := 49
    else AIndex := 48;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditReport.edMatGroupPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditReport.edMatGroupPropertiesChange') else _udebug := nil;{$ENDIF}

  if edMatGroup.EditingText=EmptyStr then begin
    edMatGroup.Text := rs('fmAllReports','allselect');
    edMatGroup.Value := 0;
    edMatGroup.Tag := 10;
  end
  else edMatGroup.Tag := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditReport.aSendErrMessageExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditReport.aSendErrMessageExecute') else _udebug := nil;{$ENDIF}

  SendMsg;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditReport.aAddCTypeExecute(Sender: TObject);
  var
    aid: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditReport.aAddCTypeExecute') else _udebug := nil;{$ENDIF}

  try aid := lcbChargeType.KeyValue; except aid := 0; end;
  lcbChargeType.SetFocus;
  ShowModalRef(Self, rtChargeType, vtChargeType, 'TfmChargeType', Self.OnDate, aid);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditReport.lcbChargeTypePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditReport.lcbChargeTypePropertiesChange') else _udebug := nil;{$ENDIF}

  if lcbChargeType.Text = '' then lcbChargeType.ItemIndex := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditReport.rbt7DefPriceClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditReport.rbt7DefPriceClick') else _udebug := nil;{$ENDIF}

  lcbPriceTypes.Enabled := rbt7PriceType.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditReport.cdsWhouseBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditReport.cdsWhouseBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsWhouse.Macros.ParamByName('m').AsString := WHAccessMacro;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditReport.cbEFilterPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditReport.cbEFilterPropertiesChange') else _udebug := nil;{$ENDIF}

  lcbEFilter.Enabled := cbEFilter.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditReport', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.

