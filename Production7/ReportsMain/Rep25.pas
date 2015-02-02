{$I ok_sklad.inc}
unit Rep25; // Развёрнутый отчёт о приходе

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseRepWithPeriod, FR_DSet, FR_DBSet, DB, DBClient,
  ssClientDataSet, FR_Chart, FR_ChBox, FR_Class, ActnList, ssFormStorage,
  ImgList, xButton, ssPanel, ssGradientPanel, ssPeriod, okPeriod, dxTL6,
  dxDBCtrl6, dxCntner6, dxDBTL6, StdCtrls, ExtCtrls, ssSpeedButton, ssBevel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  ssDBLookupCombo, ssBaseConst, ssPopupTreeEdit, okSearchEdit, cxCheckBox,
  Grids, DBGrids, cxTL, cxRadioGroup, cxGroupBox, ssGroupBox, ssMemDS;

type
  TfrmRep25 = class(TfrmBaseRepWithPeriod)
    btnAddMG: TssSpeedButton;
    btnDrillDown: TssSpeedButton;
    cdsMatGroup: TssClientDataSet;
    cdsPriceTypes: TssClientDataSet;
    cdsWhouse: TssClientDataSet;
    cdsWhouseADDR: TStringField;
    cdsWhouseDELETED: TIntegerField;
    cdsWhouseNAME: TStringField;
    cdsWhouseNOTES: TStringField;
    cdsWhouseWID: TIntegerField;
    chbIsMove: TcxCheckBox;
    chbShowOnlySummary: TcxCheckBox;
    dsMatGroup: TDataSource;
    dsWhouse: TDataSource;
    edKA: TokKASearchEdit;
    edMatGroup: TssPopupTreeEdit;
    gbGrp: TssGroupBox;
    lcbPTOut: TssDBLookupCombo;
    lcbWHouse: TssDBLookupCombo;
    lMatGroup: TLabel;
    lPTOut: TLabel;
    lWhouse: TLabel;
    rbtByGrp: TcxRadioButton;
    rbtBySupplier: TcxRadioButton;
    rbtNoGrp: TcxRadioButton;
    sbAddWHouse: TssSpeedButton;
    srcPriceTypes: TDataSource;

    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aCurActionExecute(Sender: TObject);
    procedure btnAddMGClick(Sender: TObject);
    procedure cdsWhouseBeforeOpen(DataSet: TDataSet);
    procedure dsMasterDataChange(Sender: TObject; Field: TField);
    procedure edKARefButtonClick(Sender: TObject);
    procedure edMatGroupGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure frReport1GetValue(const ParName: String; var ParValue: Variant);
    procedure sbAddWHouseClick(Sender: TObject);

  private
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;

  protected
     procedure SetRepID(const Value: Integer); override;

  public
    procedure SetCaptions; override;
  end;

var
  frmRep25: TfrmRep25;

implementation

uses
  prConst, BaseRep, prTypes, prFun, ClientData, ssFun, ssDateUtils, ssRegUtils, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}
//==============================================================================================
procedure TfrmRep25.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep25.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    lWhouse.Caption := GetRS('fmAllReports', 'whouse') + ':';
    sbAddWHouse.Hint := GetRS('fmAllReports', 'WMat');
    lMatGroup.Caption := GetRS('fmAllReports','matgrp') + ':';
    btnAddMG.Hint := GetRS('fmMaterials', 'MatGroups');
    btnDrillDown.Hint := GetRS('fmAllReports', 'DrillDown');
    edKA.InitRes;
    edKA.Caption.Caption := GetRS('fmWaybill', 'Supplier') + ':';
    chbIsMove.Properties.Caption := GetRS('fmAllReports', 'IsWBM');

    lPTOut.Caption := GetRS('fmAllReports', 'PriceTypeFor') + ':';
    chbShowOnlySummary.Properties.Caption := GetRS('fmAllReports', 'ShowOnlySummary');

    gbGrp.Caption := ' ' + GetRS('fmAllReports', 'Grp') + ' ';
    rbtByGrp.Caption := GetRS('fmAllReports', 'ByGrp');
    rbtBySupplier.Caption := GetRS('fmAllReports', 'BySupplier');
    rbtNoGrp.Caption := GetRS('fmAllReports', 'NoGrp');

  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep25.SetRepID(const Value: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep25.SetRepID') else _udebug := nil;{$ENDIF}

  inherited;

  cdsWhouse.Open;
  cdsMatGroup.Open;
  lcbWHouse.Text := '';
  //cdsWhouse.Locate('def',1,[]);
  //lcbWhouse.KeyValue := cdsWhouse.fieldByName('wid').AsInteger;
  with LangMan do
    case RepID of
      1: lTextNotes.Caption := GetRS('fmAllReports', 'RepWBInText3') + #13#10 +
           GetRS('fmAllReports', 'RepWBInText4') + #13#10 + GetRS('fmAllReports', 'RepWBInText2');

      2: lTextNotes.Caption := GetRS('fmAllReports', 'RepWBOutText3') + #13#10 +
           GetRS('fmAllReports', 'RepWBInText4') + #13#10 + GetRS('fmAllReports', 'RepWBInText2');
    end;
  //chbIsMove.Visible := (RepID=1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep25.sbAddWHouseClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep25.sbAddWHouseClick') else _udebug := nil;{$ENDIF}

  inherited;
  FCurCtrl := lcbWHouse;
  aCurAction.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep25.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep25.WMRefresh') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
    rtWHouse: begin
      DSRefresh(cdsWhouse, 'wid', M.WParam);
      lcbWhouse.KeyValue := M.WParam;
    end;

    rtMatGroup: begin
      if M.WParam>0 then begin
        DSRefresh(cdsMatGroup, 'grpid', M.WParam);
        edMatGroup.Value := M.WParam;
      end;
    end;

    rtKAgent: edKA.KAID := M.WParam;

    //rtMat: edMat.MatID := M.WParam;

    //rtServices: edSvc.SvcID := M.WParam;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep25.FormCreate(Sender: TObject);
  var
    intTmp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep25.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  edKA.Editor.OnEnter := CtrlEnter;
  edKA.Editor.OnExit := CtrlExit;

  cdsPriceTypes.Open;

  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'PT', intTmp)
    then lcbPTOut.KeyValue := intTmp;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep25.btnAddMGClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep25.btnAddMGClick') else _udebug := nil;{$ENDIF}

  inherited;

  FCurCtrl := edMatGroup;
  aCurAction.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep25.edKARefButtonClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep25.edKARefButtonClick') else _udebug := nil;{$ENDIF}

  inherited;
  edKA.Editor.SetFocus;
  aCurAction.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep25.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    m, n, w: string;
    tmpmatid, i: integer;
    tmpam, tmpsum: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep25.FormCloseQuery') else _udebug := nil;{$ENDIF}

  inherited;

  if ModalResult = mrOK then begin
    CanClose := False;
    Screen.Cursor := crSQLWait;

    try
      with cdsDetail do begin //Считываем позиции
        Close;
        ProviderName := 'pRep25';
        FetchParams;

        if edMatGroup.EditText <> '' then begin
          if btnDrillDown.Checked
            then Params.ParamByName('grpid').AsString := GetDrillDownList(dmData.SConnection, 'matgroup', 'grpid', 'pid', edMatGroup.Value)
            else Params.ParamByName('grpid').AsString := IntToStr(edMatGroup.Value)
        end
        else Params.ParamByName('grpid').AsString := '';

        Params.ParamByName('kaid').AsInteger := edKA.KAID;
        Params.ParamByName('wh').AsString := AllowedWH;

        if lcbWHouse.EditText = ''
          then Params.ParamByName('wid').AsInteger := 0
          else Params.ParamByName('wid').AsInteger := lcbWHouse.KeyValue;

        Params.ParamByName('ptypeid').AsInteger := lcbPTOut.KeyValue;
        Params.ParamByName('fromdate').AsDateTime := prdMain.FromDate;
        Params.ParamByName('todate').AsDateTime := LastSecondInDay(prdMain.ToDate);

        if rbtByGrp.Checked then Params.ParamByName('grpby').AsInteger := 2
        else if rbtBySupplier.Checked then Params.ParamByName('grpby').AsInteger := 3
        else Params.ParamByName('grpby').AsInteger := 0;

        Open;
        CopyDataSet(cdsMaster, cdsDetail);
        Close;

        SmartShowRep(frReport1, 'Rep25.frf');

      end;//with cdsMaster

    finally
      Screen.Cursor := crDefault;
    end;
  end
  else CanClose := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep25.frReport1GetValue(const ParName: String; var ParValue: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep25.frReport1GetValue') else _udebug := nil;{$ENDIF}

  inherited;

  if 0 = AnsiCompareText(ParName, 'matgrp') then ParValue := edMatGroup.Text
  else if 0 = AnsiCompareText(ParName, 'whname') then ParValue := lcbWHouse.Text
  else if 0 = AnsiCompareText(ParName, 'kaname') then ParValue := edKA.Editor.Text
  else if 0 = AnsiCompareText(ParName, 'GRPCOLOR') then ParValue := PLGrpColor
  else if 0 = AnsiCompareText(ParName, 'onlysummary') then ParValue := Integer(chbShowOnlySummary.Checked)
  else if 0 = AnsiCompareText(ParName, 'tamount') then ParValue := GetDSSumm(cdsMaster, 'amount')
  else if 0 = AnsiCompareText(ParName, 'tsummin') then ParValue := GetDSSumm(cdsMaster, 'summ')
  else if 0 = AnsiCompareText(ParName, 'tsummout') then ParValue := GetDSSumm(cdsMaster, 'summout')
  else if 0 = AnsiCompareText(ParName, 'grpcon') then begin
    if rbtNoGrp.Checked then ParValue := 0
    //else if rbtByWH.Checked then ParValue := 1 else
    else if rbtByGrp.Checked then ParValue := 2
    else if rbtBySupplier.Checked then ParValue := 3;
  end
  else if 0 = AnsiCompareText(ParName, 'pricein') then ParValue := '';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep25.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep25.ActionListUpdate') else _udebug := nil;{$ENDIF}

  inherited;

  chbIsMove.Enabled := (lcbWHouse.KeyValue>0)and(lcbWHouse.Text<>'');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep25.edMatGroupGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep25.edMatGroupGetNodeImageIndex') else _udebug := nil;{$ENDIF}

  inherited;

  if ANode.Expanded
    then AIndex := 49
    else AIndex := 48;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep25.aCurActionExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep25.aCurActionExecute') else _udebug := nil;{$ENDIF}

  inherited;

  if FCurCtrl=edKA.Editor then ShowModalRef(Self, rtKAgent,vtKAgent,'TfmKAgent',Self.OnDate,edKA.KAID,1)
  else if FCurCtrl=edMatGroup then ShowModalRef(Self, rtMatGroup, vtMatGroup, 'TfmMatGroup', Self.OnDate,edMatGroup.Value)
  else if FCurCtrl=lcbWHouse then ShowModalRef(Self, rtWHouse, vtWHouse, 'TfmWHouse', Self.OnDate,lcbWHouse.KeyValue)
  else if (FCurCtrl is TcxCheckBox) then with (FCurCtrl as TcxCheckBox) do Checked := not Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep25.cdsWhouseBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep25.cdsWhouseBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsWHouse.Macros.ParamByName('m').AsString := WHAccessMacro;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep25.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep25.FormDestroy') else _udebug := nil;{$ENDIF}

  WriteToRegInt(MainRegKey + '\' + Self.Name, 'PT', lcbPTOut.KeyValue);

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep25.dsMasterDataChange(Sender: TObject; Field: TField);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep25.dsMasterDataChange') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('Rep25', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
