{$I ok_sklad.inc}
unit Rep14; // рейтинге продаж

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseRepWithPeriod, FR_DSet, FR_DBSet, DB, DBClient,
  ssClientDataSet, FR_Chart, FR_ChBox, FR_Class, ActnList, ssFormStorage,
  ImgList, xButton, ssPanel, ssGradientPanel, dxTL6, dxDBCtrl6, dxCntner6,
  dxDBTL6, ssPeriod, okPeriod, StdCtrls, ExtCtrls, ssBevel, ssSpeedButton,
  cxDropDownEdit, ssPopupTreeEdit, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, ssDBLookupCombo, cxSpinEdit, cxCheckBox,
  cxRadioGroup, cxTL, ssBaseConst, Grids, DBGrids, ssMemDS;

type
  TfrmRep14 = class(TfrmBaseRepWithPeriod)
    ActionList1: TActionList;
    aRef: TAction;
    btnAddMG: TssSpeedButton;
    btnAddWHouse: TssSpeedButton;
    btnDrillDown: TssSpeedButton;
    cdsMatGroup: TssClientDataSet;
    cdsWhouse: TssClientDataSet;
    cdsWhouseADDR: TStringField;
    cdsWhouseDELETED: TIntegerField;
    cdsWhouseNAME: TStringField;
    cdsWhouseNOTES: TStringField;
    cdsWhouseWID: TIntegerField;
    chbOnlyNull: TcxCheckBox;
    chbPosAmount: TcxCheckBox;
    dsMatGroup: TDataSource;
    dsWhouse: TDataSource;
    edMatGroup: TssPopupTreeEdit;
    edPosAmount: TcxSpinEdit;
    lcbWHouse: TssDBLookupCombo;
    lMatGroup: TLabel;
    lPosAmount: TLabel;
    lWhouse: TLabel;
    rgMats: TcxRadioGroup;
    rgSortDirect: TcxRadioGroup;
    rgSortType: TcxRadioGroup;

    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aRefExecute(Sender: TObject);
    procedure btnAddMGMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnAddWHouseMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnAddWHouseMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure cdsWhouseBeforeOpen(DataSet: TDataSet);
    procedure chbPosAmountClick(Sender: TObject);
    procedure edMatGroupGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
    procedure edMatGroupPropertiesChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure frReport1GetValue(const ParName: String; var ParValue: Variant);
    procedure lcbWHouseEnter(Sender: TObject);
    procedure lcbWHouseExit(Sender: TObject);

  private
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;

  public
    procedure SetCaptions; override;
  end;

var
  frmRep14: TfrmRep14;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  prConst, ClientData, ssFun, prFun, prTypes, ssDateUtils, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';
{$R *.dfm}

{ TfrmRep14 }

//==============================================================================================
procedure TfrmRep14.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep14.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    edMatGroup.Text := GetRS('fmAllReports', 'allselect');
    lWhouse.Caption := GetRS('fmAllReports', 'whouse') + ':';
    lMatGroup.Caption := GetRS('fmAllReports', 'matgrp') + ':';

    rgSortType.Caption := ' ' + GetRS('fmAllReports', 'Sort') + ' ';
    rgSortType.Properties.Items[0].Caption := GetRS('fmAllReports', 'SbyAmount');
    rgSortType.Properties.Items[1].Caption := GetRS('fmAllReports', 'SbyPr');
    rgSortType.Properties.Items[2].Caption := GetRS('fmAllReports', 'SbyPrR');
    rgSortDirect.Caption := ' ' + GetRS('fmAllReports', 'Direct') + ' ';
    rgSortDirect.Properties.Items[0].Caption := GetRS('fmAllReports', 'DirUp');
    rgSortDirect.Properties.Items[1].Caption := GetRS('fmAllReports', 'DirDown');
    rgMats.Caption := ' ' + GetRS('fmAllReports', 'IncludeInRep') + ' ';
    rgMats.Properties.Items[0].Caption := GetRS('fmAllReports', 'OnlySaledMats');
    rgMats.Properties.Items[1].Caption := GetRS('fmAllReports', 'OnlyNotSaledMats');
    rgMats.Properties.Items[2].Caption := GetRS('fmAllReports', 'OnlyAllMats');

    chbPosAmount.Properties.Caption := GetRS('fmAllReports', 'ShowTopOnly1');
    chbOnlyNull.Properties.Caption := GetRS('fmAllReports', 'OnlyNull');
    lPosAmount.Caption := GetRS('fmAllReports', 'ShowTopOnly2');

    btnAddMG.Hint := GetRS('fmMaterials', 'MatGroups');
    btnDrillDown.Hint := GetRS('fmAllReports', 'DrillDown');
    btnAddWHouse.Hint := GetRS('fmAllReports', 'WMat');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep14.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep14.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  cdsMatGroup.Open;
  cdsWhouse.Open;
  edMatGroup.Tag := 10;

  btnAddWHouse.ImageIndex := 26;
  btnAddMG.ImageIndex := 48;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep14.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    m, n: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep14.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult = mrOk then begin
    CanClose := False;
    Application.ProcessMessages;

    m := '';
    n := '';
    FromDate := prdMain.FromDate;
    ToDate := LastSecondInDay(prdMain.ToDate);

    if edMatGroup.Tag <> 10 then begin
      m := m + ' and mats.grpid in (';

      if btnDrillDown.Checked
        then m := m + GetDrillDownList(dmData.SConnection, 'matgroup', 'grpid', 'pid', edMatGroup.Value)
        else m := m + IntToStr(edMatGroup.Value);

      m := m + ') ';
    end;

    case rgSortType.ItemIndex of
      0: n := 'order by 9';
      1: n := 'order by 15';
      2: n := 'order by 16';
    end;

    case rgSortDirect.ItemIndex of
      1: n := n + ' desc';
    end;

    with cdsDetail do begin
      Close;
      case rgMats.ItemIndex of
        0: ProviderName := 'pRep_MatOut';
        1: ProviderName := 'pRep14_NotSaled';
        2: ProviderName := 'pRep14_All';
      end;
      FetchParams;
      FetchMacros;

      if lcbWHouse.KeyValue > 0 then m := m + ' and wmt.wid=' + IntToStr(lcbWHouse.KeyValue) + ' ';

      m := m + WHAccessMacro('wmt.wid');

      if chbOnlyNull.Checked then m := m + ' and mr.remain-mr.rsv=0 ';

      Macros.ParamByName('m').AsString := m;
      Macros.ParamByName('n').AsString := n;

      if chbPosAmount.Checked
        then Macros.ParamByName('f').AsString := 'first ' + IntToStr(edPosAmount.EditValue)
        else Macros.ParamByName('f').AsString := '';

      Params.ParamByName('fromdate').AsDateTime := prdMain.FromDate;
      Params.ParamByName('todate').AsDateTime := LastSecondInDay(prdMain.ToDate);
      Open;
      CopyDataSet(cdsMaster, cdsDetail);
      Close;
    end;

    SmartShowRep(frReport1, 'RepMatSelRank.frf');
  end
  else CanClose := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep14.frReport1GetValue(const ParName: String; var ParValue: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep14.frReport1GetValue') else _udebug := nil;{$ENDIF}

  inherited;

  if 0 = AnsiCompareText(ParName, 'matgrp') then ParValue := edMatGroup.EditingText else
  if 0 = AnsiCompareText(ParName, 'whname') then ParValue := lcbWHouse.Text else
  if 0 = AnsiCompareText(ParName, 'koef') then begin
    if RoundToA(cdsMaster.FieldByName('summin').AsFloat, -2) <> 0
      then ParValue := cdsMaster.FieldByName('koef').AsFloat
      else ParValue := Null;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep14.edMatGroupGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep14.edMatGroupGetNodeImageIndex') else _udebug := nil;{$ENDIF}

  if ANode.Expanded
    then AIndex := 49
    else AIndex := 48;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep14.edMatGroupPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep14.edMatGroupPropertiesChange') else _udebug := nil;{$ENDIF}

  if edMatGroup.EditingText = '' then begin
    edMatGroup.Text := rs('fmAllReports', 'allselect');
    edMatGroup.Value := 0;
    edMatGroup.Tag := 10;
  end
  else edMatGroup.Tag := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep14.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep14.ActionListUpdate') else _udebug := nil;{$ENDIF}

  inherited;

  btnDrillDown.Enabled := edMatGroup.Value > 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep14.aRefExecute(Sender: TObject);
  var
    FID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep14.aRefExecute') else _udebug := nil;{$ENDIF}

  if FCurCtrl = lcbWHouse then begin
    try
      FID := lcbWHouse.KeyValue;
    except
      FID := 0;
    end;

    lcbWHouse.SetFocus;
    ShowModalRef(Self, rtWHouse, vtWHouse, 'TfmWHouse', Self.OnDate, FID);
  end
  else if FCurCtrl = edMatGroup then begin
    try
      FID := edMatGroup.Value;
    except
      FID := 0;
    end;

    edMatGroup.SetFocus;
    ShowModalRef(Self, rtMatGroup, vtMatGroup, 'TfmMatGroup', Self.OnDate, FID);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep14.lcbWHouseEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep14.lcbWHouseEnter') else _udebug := nil;{$ENDIF}

  FCurCtrl := Sender as TControl;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep14.lcbWHouseExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep14.lcbWHouseExit') else _udebug := nil;{$ENDIF}

  FCurCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep14.btnAddWHouseMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep14.btnAddWHouseMouseDown') else _udebug := nil;{$ENDIF}

  FCurCtrl := lcbWHouse;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep14.btnAddWHouseMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep14.btnAddWHouseMouseUp') else _udebug := nil;{$ENDIF}
                                                        
  FCurCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep14.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep14.WMRefresh') else _udebug := nil;{$ENDIF}


  case TRefType(M.LParam) of
    rtWHouse:
      begin
        DSRefresh(cdsWhouse, 'wid', M.WParam);
        lcbWhouse.KeyValue := M.WParam;
      end;

    rtMatGroup:
      begin
        if M.WParam > 0 then begin
          DSRefresh(cdsMatGroup, 'grpid', M.WParam);
          edMatGroup.Value := M.WParam;
        end;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep14.btnAddMGMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep14.btnAddMGMouseDown') else _udebug := nil;{$ENDIF}


  FCurCtrl := edMatGroup;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep14.chbPosAmountClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep14.chbPosAmountClick') else _udebug := nil;{$ENDIF}

  edPosAmount.Enabled := chbPosAmount.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep14.cdsWhouseBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep14.cdsWhouseBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsWHouse.Macros.ParamByName('m').AsString := WHAccessMacro;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('Rep14', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
