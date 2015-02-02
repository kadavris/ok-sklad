{$I ok_sklad.inc}
unit Rep1; // Краткий отчёт о приходе / Краткий отчёт о продажах

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseRepWithPeriod, FR_DSet, FR_DBSet, DB, DBClient,
  ssClientDataSet, FR_Chart, FR_ChBox, FR_Class, ActnList, ssFormStorage,
  ImgList, xButton, ssPanel, ssGradientPanel, ssPeriod, okPeriod, dxTL6,
  dxDBCtrl6, dxCntner6, dxDBTL6, StdCtrls, ExtCtrls, ssSpeedButton, ssBevel,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  ssDBLookupCombo, ssBaseConst, ssPopupTreeEdit, okSearchEdit, cxCheckBox,
  Grids, DBGrids, cxTL, ssMemDS;

type
  TfrmRep1 = class(TfrmBaseRepWithPeriod)
    btnAddMG: TssSpeedButton;
    btnDrillDown: TssSpeedButton;
    cdsMatGroup: TssClientDataSet;
    cdsWhouse: TssClientDataSet;
    cdsWhouseADDR: TStringField;
    cdsWhouseDELETED: TIntegerField;
    cdsWhouseNAME: TStringField;
    cdsWhouseNOTES: TStringField;
    cdsWhouseWID: TIntegerField;
    chbGrpBy: TcxCheckBox;
    chbIsMove: TcxCheckBox;
    dsMatGroup: TDataSource;
    dsWhouse: TDataSource;
    edKA: TokKASearchEdit;
    edMatGroup: TssPopupTreeEdit;
    lcbWHouse: TssDBLookupCombo;
    lMatGroup: TLabel;
    lWhouse: TLabel;
    sbAddWHouse: TssSpeedButton;

    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aCurActionExecute(Sender: TObject);
    procedure btnAddMGClick(Sender: TObject);
    procedure cdsWhouseBeforeOpen(DataSet: TDataSet);
    procedure edKARefButtonClick(Sender: TObject);
    procedure edMatGroupGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
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
  frmRep1: TfrmRep1;

implementation

uses
  prConst, BaseRep, prTypes, prFun, ClientData, ssFun, ssDateUtils, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}
//==============================================================================================
procedure TfrmRep1.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep1.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    lWhouse.Caption := GetRS('fmAllReports','whouse') + ':';
    sbAddWHouse.Hint := GetRS('fmAllReports','WMat');
    lMatGroup.Caption := GetRS('fmAllReports','matgrp') + ':';
    btnAddMG.Hint := GetRS('fmMaterials','MatGroups');
    btnDrillDown.Hint := GetRS('fmAllReports','DrillDown');
    edKA.InitRes;
    edKA.Caption.Caption := GetRS('fmWaybill', 'KAgent') + ':';
    chbGrpBy.Properties.Caption := GetRS('fmAllReports','GprBy');
    chbIsMove.Properties.Caption := GetRS('fmAllReports','IsWBM');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep1.SetRepID(const Value: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep1.SetRepID') else _udebug := nil;{$ENDIF}

  inherited;
  cdsWhouse.Open;
  cdsMatGroup.Open;
  lcbWHouse.Text := '';

  with LangMan do
    case RepID of
      1: lTextNotes.Caption := GetRS('fmAllReports', 'RepWBInText3') + #13#10 +
           GetRS('fmAllReports', 'RepWBInText4') + #13#10 +
           GetRS('fmAllReports', 'RepWBInText2');

      2: lTextNotes.Caption := GetRS('fmAllReports', 'RepWBOutText3') + #13#10 +
           GetRS('fmAllReports', 'RepWBInText4') + #13#10 +
           GetRS('fmAllReports', 'RepWBInText2');
    end;//case

  chbIsMove.Visible := (RepID=1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep1.sbAddWHouseClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep1.sbAddWHouseClick') else _udebug := nil;{$ENDIF}

  inherited;

  FCurCtrl := lcbWHouse;
  aCurAction.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep1.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep1.WMRefresh') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
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

    rtKAgent: edKA.KAID := M.WParam;
  end;//case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep1.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep1.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;
  edKA.Editor.OnEnter := CtrlEnter;
  edKA.Editor.OnExit := CtrlExit;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep1.btnAddMGClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep1.btnAddMGClick') else _udebug := nil;{$ENDIF}

  inherited;
  FCurCtrl := edMatGroup;
  aCurAction.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep1.edKARefButtonClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep1.edKARefButtonClick') else _udebug := nil;{$ENDIF}

  inherited;
  edKA.Editor.SetFocus;
  aCurAction.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    m, n, w: string;
    tmpmatid, i: integer;
    tmpam, tmpsum: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep1.FormCloseQuery') else _udebug := nil;{$ENDIF}

  inherited;

  if ModalResult = mrOK then begin
    CanClose := False;
    Screen.Cursor := crSQLWait;
    try
      with cdsDetail do begin//Считываем позиции
        Close;
        ProviderName := 'pRep' + inttostr(RepID) + '_Master';
        FetchMacros;

        w := WHAccessMacro('wmt.wid');

        if chbGrpBy.Checked
          then Macros.ParamByName('o').AsString := '4,'
          else Macros.ParamByName('o').AsString := '';

        if (lcbWHouse.Text <> '') and (lcbWHouse.KeyValue > 0) then begin
          if (RepID = 1) then begin
            if chbIsMove.Checked
              then Macros.ParamByName('t').AsString := ',4'
              else Macros.ParamByName('t').AsString := '';
          end;

          Macros.ParamByName('w').AsString := 'and wmt.wid=' + inttostr(lcbWHouse.KeyValue) + w;
        end
        else begin
          if (RepID = 1) then Macros.ParamByName('t').AsString := '';
          Macros.ParamByName('w').AsString := w;
        end;

        if (edMatGroup.Value > 0) and (edMatGroup.Text <> '') then begin
          if btnDrillDown.Checked
            then Macros.ParamByName('g').AsString := ' and mats.grpid in ('
                 + GetDrillDownList(dmData.SConnection, 'matgroup', 'grpid', 'pid', edMatGroup.Value) + ')'
          else Macros.ParamByName('g').AsString := ' and mats.grpid='+inttostr(edMatGroup.Value)
        end
        else Macros.ParamByName('g').AsString := '';

        if (edKA.KAID > 0) and (edKA.Editor.Text <> '') then begin
          case RepID of
            1: Macros.ParamByName('k').AsString := ' and wbl.kaid=' + inttostr(edKA.KAID);
            2: Macros.ParamByName('k').AsString := ' and wbls.kaid=' + inttostr(edKA.KAID);
          end
        end
        else Macros.ParamByName('k').AsString := '';

        FetchParams;
        Params.ParamByName('fromdate').AsDateTime := prdMain.FromDate;
        Params.ParamByName('todate').AsDateTime := LastSecondInDay(prdMain.ToDate);

        Open;
        CopyDataSet(cdsMaster, cdsDetail);
        Close;

        if chbGrpBy.Checked
          then SmartShowRep(frReport1, 'Rep1_1.frf')
          else SmartShowRep(frReport1, 'Rep1.frf');
      end;//with cdsDetail

    finally
      Screen.Cursor := crDefault;
    end;
  end
  else CanClose := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep1.frReport1GetValue(const ParName: String; var ParValue: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep1.frReport1GetValue') else _udebug := nil;{$ENDIF}

  inherited;
  
  try
    if 0 = AnsiCompareText(ParName, 'MATGRP') then ParValue := edMatGroup.Text
    else if 0 = AnsiCompareText(ParName, 'WHNAME') then ParValue := lcbWHouse.Text
    else if 0 = AnsiCompareText(ParName, 'KANAME') then ParValue := edKA.Editor.Text
    else if 0 = AnsiCompareText(ParName, 'GRPCOLOR') then ParValue := PLGrpColor;

  except
    ParValue := '--ERR--';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep1.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep1.ActionListUpdate') else _udebug := nil;{$ENDIF}

  inherited;
  chbIsMove.Enabled := (lcbWHouse.KeyValue > 0)and(lcbWHouse.Text <> '');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep1.edMatGroupGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex); {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep1.edMatGroupGetNodeImageIndex') else _udebug := nil;{$ENDIF}

  inherited;

  if ANode.Expanded
    then AIndex := 49
    else AIndex := 48;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep1.aCurActionExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep1.aCurActionExecute') else _udebug := nil;{$ENDIF}

  inherited;

  if FCurCtrl = edKA.Editor then ShowModalRef(Self, rtKAgent,vtKAgent,'TfmKAgent',Self.OnDate,edKA.KAID,1)
  else if FCurCtrl = edMatGroup then ShowModalRef(Self, rtMatGroup, vtMatGroup, 'TfmMatGroup', Self.OnDate,edMatGroup.Value)
  else if FCurCtrl = lcbWHouse then ShowModalRef(Self, rtWHouse, vtWHouse, 'TfmWHouse', Self.OnDate,lcbWHouse.KeyValue)
  else if (FCurCtrl is TcxCheckBox) then with (FCurCtrl as TcxCheckBox) do Checked := not Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep1.cdsWhouseBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep1.cdsWhouseBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsWHouse.Macros.ParamByName('m').AsString := WHAccessMacro;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('Rep1', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
