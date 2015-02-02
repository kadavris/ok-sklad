{$I ok_sklad.inc}
unit Rep20; //   –¿“ »… Œ“◊®“ Œ œ–Œƒ¿∆¿’ ”—À”√

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseRep, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, StdCtrls, FR_DSet, FR_DBSet, DB,
  DBClient, ssClientDataSet, FR_Chart, FR_ChBox, FR_Class, ActnList,
  ssFormStorage, ImgList, xButton, ssPanel, ssGradientPanel, ssBevel,
  ssSpeedButton, ExtCtrls, cxCheckBox, ssPopupTreeEdit, ssPeriod,
  okPeriod, ClientData, cxTL, ssBaseConst, dxTL6, dxDBCtrl6, dxCntner6,
  dxDBTL6, BaseRepWithPeriod, ssMemDS;

type
  TfrmRep20 = class(TfrmBaseRepWithPeriod)
    aAddSG: TAction;
    btnAddMG: TssSpeedButton;
    btnDrillDown: TssSpeedButton;
    cdsSvcGroup: TssClientDataSet;
    chbGrpByS: TcxCheckBox;
    dsSvcGroup: TDataSource;
    edSGroup: TssPopupTreeEdit;
    lSGroup: TLabel;

    procedure aAddSGExecute(Sender: TObject);
    procedure edSGroupGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
    procedure edSGroupPropertiesChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure frReport1BeforePrint(Memo: TStringList; View: TfrView);
    procedure frReport1GetValue(const ParName: String; var ParValue: Variant);

  private
    sgrp: string;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;

  public
    procedure SetCaptions; override;
  end;

var
  frmRep20: TfrmRep20;

implementation

uses
  prTypes, ssFun, prConst, prFun, fMessageDlg, ssDateUtils, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}

//==============================================================================================
procedure TfrmRep20.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep20.WMRefresh') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
    rtSvcGroup: begin
      DSRefresh(cdsSvcGroup,'svcid',M.WParam);
      edSGroup.Value := M.WParam;
    end;//rtSvcGroup
  end;//case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep20.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep20.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    lSGroup.Caption := GetRS('fmServices','Grp')+':';
    aAddSG.Hint := GetRS('fmServices','Grp');
    chbGrpByS.Properties.Caption := GetRS('fmAllReports','GprByS');
    lTextNotes.Caption := GetRS('fmAllReports','Rep20Notes');
    btnDrillDown.Hint := GetRS('fmAllReports','DrillDown');
  end;//with

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


//==============================================================================================
procedure TfrmRep20.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    m: String;
    i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep20.FormCloseQuery') else _udebug := nil;{$ENDIF}

  CanClose := False;
  if ModalResult = mrOk then begin
    try
      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      m := '';
      FromDate := prdMain.FromDate;
      ToDate := LastSecondInDay(prdMain.ToDate);
      sgrp := edSGroup.EditingText;

      with cdsDetail do begin
        Close;
        if chbGrpByS.Checked
          then ProviderName := 'pRep_SvcOut1'
          else ProviderName := 'pRep_SvcOut';

        if edSGroup.Value > 0 then  begin
          m := m + ' and svc.pid in (';
          if  btnDrillDown.Checked
            then m := m + GetDrillDownList(dmData.SConnection, 'services', 'svcid', 'pid', edSGroup.Value)
            else m := m + inttostr(edSGroup.Value);
          m := m + ') ';
        end;//if
        FetchMacros;
        Macros.ParamByName('m').AsString := m;

        if not chbGrpByS.Checked then Macros.ParamByName('n').AsString := 'order by 3';

        FetchParams;
        Params.ParamByName('fromdate').AsDateTime := FromDate;
        Params.ParamByName('todate').AsDateTime := ToDate;
        Open;
        CopyDataSet(cdsMaster, cdsDetail);
        Close;
      end;//with cdsDetail

      if chbGrpByS.Checked then begin
        colAmount.FieldName := 'amountout';
        colSummdef.FieldName := 'summout';
        dbgRef.DataSource := dsMaster;
        colMatName.Sorted := csUp;
        cdsMaster.DisableControls;

        for i := 0 to dbgRef.Count-1 do begin
          if HasMat(dbgRef.Items[i]) then SetDel0(dbgRef.Items[i]);
        end;//for

        //”‰‡ÎÂÌËÂ "ÎË¯ÌËı" ÔÓÁËˆËÈ
        cdsMaster.First;
        while not cdsMaster.Eof do begin
          if cdsMaster.FieldByName('del').AsInteger=1 then cdsMaster.Delete
          else cdsMaster.Next;
        end;
        cdsMaster.EnableControls;//ƒÎˇ treelista
        cdsMaster.DisableControls;

        while not cdsMaster.IsEmpty do cdsMaster.Delete;

        //«‡ÔËÒ¸ ‚ cdsMaster
        for i := 0 to dbgRef.Count-1 do WriteNode(dbgRef.Items[i]);

        cdsMaster.EnableControls;
      end;//if chbGrpByS.Checked

      dbgRef.DataSource := nil;
      SmartShowRep(frReport1, 'RepMatSelSvc.frf');

    finally
      Screen.Cursor := crDefault;
    end;
  end
  else CanClose := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep20.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep20.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  cdsSvcGroup.Open;
  edSGroup.Text := LangMan.GetRS('fmAllReports','allselect');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep20.edSGroupGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep20.edSGroupGetNodeImageIndex') else _udebug := nil;{$ENDIF}

  if ANode.Expanded
    then AIndex := 49
    else AIndex := 48;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep20.aAddSGExecute(Sender: TObject);
  var
    aid: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep20.aAddSGExecute') else _udebug := nil;{$ENDIF}

  try  aid := edSGroup.Value; except  aid := 0; end;

  ShowModalRef(Self,rtSvcGroup,vtSvcGroup, 'TfmSvcGroup', Self.OnDate, aid);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep20.edSGroupPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep20.edSGroupPropertiesChange') else _udebug := nil;{$ENDIF}

  if edSGroup.EditingText = '' then begin
    edSGroup.Text := LangMan.GetRS('fmAllReports','allselect');
    edSGroup.Value := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep20.frReport1GetValue(const ParName: String; var ParValue: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep20.frReport1GetValue') else _udebug := nil;{$ENDIF}

  inherited;

  if 0 = AnsiCompareText(ParName, 'sgrp') then ParValue := sgrp;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep20.frReport1BeforePrint(Memo: TStringList; View: TfrView);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep20.frReport1BeforePrint') else _udebug := nil;{$ENDIF}

  if (View.Name = 'EntLogo') and btnUseLogo.Checked and (EntLogo.Size > 0) then begin
    EntLogo.Position := 0;
    TfrPictureView(View).Picture.Bitmap.LoadFromStream(EntLogo);
  end;//if EntLogo

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('Rep20', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
