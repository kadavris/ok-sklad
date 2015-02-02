{$I ok_sklad.inc}
unit Rep9; // Отчёт о движении товара

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseRepWithPeriod, FR_DSet, FR_DBSet, DB, DBClient,
  ssClientDataSet, FR_Chart, FR_ChBox, FR_Class, ActnList, ssFormStorage,
  ImgList, xButton, ssPanel, ssGradientPanel, ssPeriod, okPeriod, dxTL6,
  dxDBCtrl6, dxCntner6, dxDBTL6, StdCtrls, ExtCtrls, ssSpeedButton, ssBevel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  ssDBLookupCombo, okSearchEdit, cxRadioGroup, cxGroupBox, ssGroupBox,
  ssPopupTreeEdit, ssBaseConst, cxTL, Grids, DBGrids, ssMemDS;

type
  TfrmRep9 = class(TfrmBaseRepWithPeriod)
    aByGrp: TAction;
    aByMat: TAction;
    btnAddMG: TssSpeedButton;
    btnDrillDown: TssSpeedButton;
    cdsMatGroup: TssClientDataSet;
    cdsWhouse: TssClientDataSet;
    cdsWhouseADDR: TStringField;
    cdsWhouseDELETED: TIntegerField;
    cdsWhouseNAME: TStringField;
    cdsWhouseNOTES: TStringField;
    cdsWhouseWID: TIntegerField;
    cxRadioButton1: TcxRadioButton;
    cxRadioButton2: TcxRadioButton;
    dsMatGroup: TDataSource;
    dsWhouse: TDataSource;
    edMat: TokMatSearchEdit;
    edMatGroup: TssPopupTreeEdit;
    gbFiltType: TssGroupBox;
    lcbWHouse: TssDBLookupCombo;
    lWhouse: TLabel;
    sbAddWHouse: TssSpeedButton;

    procedure aByGrpExecute(Sender: TObject);
    procedure aByMatExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aCurActionExecute(Sender: TObject);
    procedure btnAddMGClick(Sender: TObject);
    procedure cdsWhouseBeforeOpen(DataSet: TDataSet);
    procedure edMatGroupGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
    procedure edMatRefButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
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
  frmRep9: TfrmRep9;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  prConst, xLngManager, prTypes, ssFun, MatMove, ssBaseIntfDlg, BaseRep,
  ClientData, ssDateUtils, prFun, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfrmRep9.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep9.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    lTextNotes.Caption := GetRS('fmAllReports', 'RepMatMoveText1') + #13#10 + GetRS('fmAllReports', 'RepWBInText2');
    aByMat.Caption := GetRS('fmWaybill', 'MatName');
    aByGrp.Caption := GetRS('fmAllReports','ByMatGrp');
    lWhouse.Caption := GetRS('fmAllReports','whouse') + ':';
    sbAddWHouse.Hint := GetRS('fmAllReports','WMat');
    btnAddMG.Hint := GetRS('fmMaterials','MatGroups');
    btnDrillDown.Hint := GetRS('fmAllReports','DrillDown');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep9.aByMatExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep9.aByMatExecute') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep9.aByGrpExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep9.aByGrpExecute') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep9.SetRepID(const Value: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep9.SetRepID') else _udebug := nil;{$ENDIF}

  inherited;

  cdsWhouse.Open;
  lcbWHouse.Text := '';
  cdsMatGroup.Open;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep9.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep9.ActionListUpdate') else _udebug := nil;{$ENDIF}

  inherited;

  edMat.Enabled := aByMat.Checked;
  edMatGroup.Enabled := aByGrp.Checked;
  btnAddMG.Enabled := aByGrp.Checked;
  btnDrillDown.Enabled := aByGrp.Checked;
  aOK.Enabled := ((aByMat.Checked and (edMat.MatID > 0)) or (aByGrp.Checked and (edMatGroup.EditValue <> '')));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep9.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep9.WMRefresh') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
    rtMat: edMat.MatID := M.WParam;

    rtMatGroup: begin
      if M.WParam > 0 then begin
        DSRefresh(cdsMatGroup, 'grpid', M.WParam);
        edMatGroup.Value := M.WParam;
      end;
    end;//rtmat

    rtWHouse: begin
      DSRefresh(cdsWhouse, 'wid', M.WParam);
      lcbWhouse.KeyValue := M.WParam;
    end;
  end;//case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep9.aCurActionExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep9.aCurActionExecute') else _udebug := nil;{$ENDIF}

  inherited;

  if FCurCtrl = edMat.Editor
    then ShowModalRef(Self, rtMat, vtMat, 'TfmMaterials', Self.OnDate, edMat.MatID)
  else if FCurCtrl = edMatGroup
       then ShowModalRef(Self, rtMatGroup, vtMatGroup, 'TfmMatGroup', Self.OnDate,edMatGroup.Value)
  else if FCurCtrl = lcbWHouse
       then ShowModalRef(Self, rtWHouse, vtWHouse, 'TfmWHouse', Self.OnDate,lcbWHouse.KeyValue);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep9.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep9.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;
  edMat.Editor.OnEnter := CtrlEnter;
  edMat.Editor.OnExit := CtrlExit;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep9.edMatGroupGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep9.edMatGroupGetNodeImageIndex') else _udebug := nil;{$ENDIF}

  inherited;

  if ANode.Expanded
    then AIndex := 49
    else AIndex := 48;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep9.btnAddMGClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep9.btnAddMGClick') else _udebug := nil;{$ENDIF}

  FCurCtrl := edMatGroup;
  aCurAction.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep9.edMatRefButtonClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep9.edMatRefButtonClick') else _udebug := nil;{$ENDIF}

  inherited;
  edMat.Editor.SetFocus;
  aCurAction.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep9.sbAddWHouseClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep9.sbAddWHouseClick') else _udebug := nil;{$ENDIF}

  inherited;
  FCurCtrl := lcbWHouse;
  aCurAction.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep9.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    n, m: String;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep9.FormCloseQuery') else _udebug := nil;{$ENDIF}

  inherited;

  if ModalResult = mrOK then begin
    CanClose := False;

    if aByMat.Checked then begin
      with TfrmMatMove.Create(nil) do
      try
        ParentNameEx := 'fmWMat';

        try
          OnDate := Self.prdMain.ToDate;

        except
          OnDate := MaxDateTime;
        end;

        prdMain.PeriodType := ptCustom;

        if (Self.prdMain.FromDate >= 0) then begin
          try
            prdMain.FromDate := Self.prdMain.FromDate;
          except
            prdMain.FromDate := MinDateTime;
          end;
        end
        else prdMain.FromDate := 0;

        prdMain.ToDate := Self.prdMain.ToDate;

        if lcbWHouse.Text<>''
          then WID := lcbWHouse.KeyValue
          else WID := 0; //cbWHouse.KeyValue;

        ID := edMat.MatID;
        aPrintMain.Execute;

      finally
        Free;
      end;
    end
    else if aByGrp.Checked then begin
      try
        Screen.Cursor := crSQLWait;
        Application.ProcessMessages;
        m := '';
        FromDate := prdMain.FromDate;
        ToDate := LastSecondInDay(prdMain.ToDate);

        with cdsDetail do begin
          Close;
          ProviderName := 'pRep9_G';
          FetchParams;
          Params.ParamByName('fromdate').AsDateTime := FromDate;
          Params.ParamByName('todate').AsDateTime := ToDate;

          if lcbWHouse.Text <> ''
            then Params.ParamByName('wid').AsInteger := lcbWHouse.KeyValue
            else Params.ParamByName('wid').AsInteger := 0;

          if btnDrillDown.Checked
            then Params.ParamByName('grplist').AsString := GetDrillDownList(dmData.SConnection, 'matgroup', 'grpid', 'pid', edMatGroup.Value)
            else Params.ParamByName('grplist').AsString := IntToStr(edMatGroup.Value);

          Open;
          CopyDataSet(cdsMaster, cdsDetail);
          Close;
        end;

        SmartShowRep(frReport1, 'grpmove.frf');

      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end
  else CanClose := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep9.frReport1GetValue(const ParName: String; var ParValue: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep9.frReport1GetValue') else _udebug := nil;{$ENDIF}

  if 0 = AnsiCompareText(ParName, 'wname') then ParValue := lcbWHouse.Text
  else if 0 = AnsiCompareText(ParName, 'grpname') then ParValue := edMatGroup.Text;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep9.cdsWhouseBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep9.cdsWhouseBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsWhouse.Macros.ParamByName('m').AsString := WHAccessMacro;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('Rep9', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
