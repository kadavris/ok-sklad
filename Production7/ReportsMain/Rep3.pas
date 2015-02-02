{$I ok_sklad.inc}
unit Rep3; // Отчёт о продажах по клиентам

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseRepWithPeriod, FR_DSet, FR_DBSet, DB, DBClient,
  ssClientDataSet, FR_Chart, FR_ChBox, FR_Class, ActnList, ssFormStorage,
  ImgList, xButton, ssPanel, ssGradientPanel, ssPeriod, okPeriod, dxTL6,
  dxDBCtrl6, dxCntner6, dxDBTL6, StdCtrls, ExtCtrls, ssSpeedButton, ssBevel,
  ClientData, okSearchEdit, ssBaseConst, cxControls, cxContainer, cxEdit,
  cxCheckBox, cxRadioGroup, cxGroupBox, ssGroupBox, ssMemDS;

type
  TfrmRep3 = class(TfrmBaseRepWithPeriod)
    aByAll: TAction;
    aByMat: TAction;
    aBySvc: TAction;
    chbWithProfit: TcxCheckBox;
    cxRadioButton1: TcxRadioButton;
    cxRadioButton2: TcxRadioButton;
    cxRadioButton3: TcxRadioButton;
    edKA: TokKASearchEdit;
    edMat: TokMatSearchEdit;
    edSvc: TokSvcSearchEdit;
    gbFiltType: TssGroupBox;

    procedure aByAllExecute(Sender: TObject);
    procedure aByMatExecute(Sender: TObject);
    procedure aBySvcExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aCurActionExecute(Sender: TObject);
    procedure dsMasterDataChange(Sender: TObject; Field: TField);
    procedure edKARefButtonClick(Sender: TObject);
    procedure edMatRefButtonClick(Sender: TObject);
    procedure edSvcRefButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure frReport1GetValue(const ParName: String; var ParValue: Variant);

  private
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;

  protected
    procedure SetRepID(const Value: Integer); override;

  public
    procedure SetCaptions; override;
  end;

var
  frmRep3: TfrmRep3;

implementation

uses
  prConst, BaseRep, prTypes, ssFun, ssBaseIntfDlg, ssDateUtils, udebug, prFun;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}
{ TfrmRep3 }

//==============================================================================================
procedure TfrmRep3.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep3.SetCaptions') else _udebug := nil;{$ENDIF}


  inherited;
  with LangMan do begin
    chbWithProfit.Properties.Caption := GetRS('fmAllReports','WithProfit');
    edKA.InitRes;
    edKA.Caption.Caption := GetRS('fmWaybill', 'KAgent') + ':';

    edMat.InitRes;
    edMat.SearchNames[0] := GetRS('fmMaterials', 'Mat') + ';name';
    if edMat.CurrentSearchIndex = 0
      then edMat.Caption.Caption := GetRS('fmMaterials', 'Mat') + ':';
    edSvc.InitRes;
    gbFiltType.Caption := '';
    aByAll.Caption := GetRS('Common', 'All');
    aBySvc.Caption := GetRS('fmServices', 'Svc');
    aByMat.Caption := GetRS('fmWaybill', 'MatName');
  end;//

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep3.SetRepID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep3.SetRepID') else _udebug := nil;{$ENDIF}


  inherited;
  with LangMan do
  case RepID of
    3: lTextNotes.Caption := GetRS('fmAllReports', 'RepWBOutText1') + #13#10 +
         GetRS('fmAllReports', 'RepWBOutText2');
    4: lTextNotes.Caption := GetRS('fmAllReports', 'RepWBInText1') + #13#10 +
         GetRS('fmAllReports', 'RepWBInText2');
  end;//case
  if RepID=4 then begin
    aByMat.Checked := True;
    aByMat.Enabled := False;
    aBySvc.Enabled := False;
    aByAll.Enabled := False;
  end;
  chbWithProfit.Visible := (RepID=3);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep3.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep3.ActionListUpdate') else _udebug := nil;{$ENDIF}


  edMat.Enabled := aByMat.Checked;
  edSvc.Enabled := aBySvc.Checked;
  inherited;
//  aOK.Enabled := (edKA.KAID>0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep3.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep3.FormCreate') else _udebug := nil;{$ENDIF}


  inherited;
  edMat.Caption.Hide;
  edSvc.Caption.Hide;

  edKA.Editor.OnEnter := CtrlEnter;
  edKA.Editor.OnExit := CtrlExit;
  edMat.Editor.OnEnter := CtrlEnter;
  edMat.Editor.OnExit := CtrlExit;
  edSvc.Editor.OnEnter := CtrlEnter;
  edSvc.Editor.OnExit := CtrlExit;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep3.aCurActionExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep3.aCurActionExecute') else _udebug := nil;{$ENDIF}


  inherited;
  if FCurCtrl = edKA.Editor then
    ShowModalRef(Self, rtKAgent,vtKAgent,'TfmKAgent',Self.OnDate,edKA.KAID,1)
  else
  if FCurCtrl = edMat.Editor then
    ShowModalRef(Self, rtMat, vtMat, 'TfmMaterials', Self.OnDate, edMat.MatID)
  else
  if FCurCtrl = edSvc.Editor then
    ShowModalRef(Self, rtServices, vtServices, 'TfmServices', Self.OnDate, edSvc.SvcID, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep3.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep3.WMRefresh') else _udebug := nil;{$ENDIF}


  case TRefType(M.LParam) of
    rtKAgent: edKA.KAID := M.WParam;
    rtMat: edMat.MatID := M.WParam;
    rtServices: edSvc.SvcID := M.WParam;
  end;//case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep3.edKARefButtonClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep3.edKARefButtonClick') else _udebug := nil;{$ENDIF}


  inherited;
  edKA.Editor.SetFocus;
  aCurAction.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep3.edMatRefButtonClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep3.edMatRefButtonClick') else _udebug := nil;{$ENDIF}


  inherited;
  edMat.Editor.SetFocus;
  aCurAction.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep3.edSvcRefButtonClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep3.edSvcRefButtonClick') else _udebug := nil;{$ENDIF}


  inherited;
  edSvc.Editor.SetFocus;
  aCurAction.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep3.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    m:String;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep3.FormCloseQuery') else _udebug := nil;{$ENDIF}

  inherited;

  if ModalResult = mrOK then begin
    CanClose := False;

    try
      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      m := '';
      FromDate := prdMain.FromDate;
      ToDate := LastSecondInDay(prdMain.ToDate);

      with cdsDetail do begin//Считываем клиентов
        Close;
        ProviderName := 'pRep' + IntToStr(RepID) + '_Master';
         if aByMat.Checked then begin
           if edMat.MatID > 0 then ProviderName := 'pRep' + IntToStr(RepID) + '_MasterM';
         end
         else if aBySvc.Checked then begin
           if edSvc.SvcID > 0 then ProviderName := 'pRep' + IntToStr(RepID) + '_MasterS';
         end;

        if edKA.KAID<>0 then m := m + ' and wbl.kaid=' + IntToStr(edKA.KAID);
        FetchMacros;
        Macros.ParamByName('m').AsString := m;

        if Macros.FindParam('j')<>nil then begin
          Macros.ParamByName('j').AsString := '';

          if aByMat.Checked then begin
            Macros.ParamByName('j').AsString := ' join waybilldet wbd on wbd.wbillid=wbl.wbillid';
          end
          else if aBySvc.Checked then begin
            Macros.ParamByName('j').AsString := ' join waybillsvc wbs on wbs.wbillid=wbl.wbillid';
          end;
        end;
        FetchParams;
        Params.ParamByName('fromdate').AsDateTime := FromDate;
        Params.ParamByName('todate').AsDateTime := ToDate;

        if  aByMat.Checked and(edMat.MatID>0)
        then Params.ParamByName('matid').AsInteger := edMat.MatID
        else if aBySvc.Checked and(edSvc.SvcID>0)
             then Params.ParamByName('svcid').AsInteger := edSvc.SvcID;

        Open;
        CopyDataSet(cdsMaster, cdsDetail);
        Close;
      end;//with cdsDetail

      if chbWithProfit.Checked and (RepID = 3)
        then SmartShowRep(frReport1, 'Rep3_1.frf')
        else SmartShowRep(frReport1, 'Rep3.frf');

    finally
      Screen.Cursor := crDefault;
    end;
  end
  else CanClose := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep3.frReport1GetValue(const ParName: String; var ParValue: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep3.frReport1GetValue') else _udebug := nil;{$ENDIF}

  inherited;

  if 0 = AnsiCompareText(ParName, 'repid') then ParValue := RepID
  else if 0 = AnsiCompareText(ParName, 'kaname') then ParValue := edKA.Editor.Text
  else if 0 = AnsiCompareText(ParName, 'matname') then begin
    ParValue := '';
    if aByMat.Checked then ParValue := edMat.Editor.Text
    else if aBySvc.Checked then ParValue := edSvc.Editor.Text;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep3.dsMasterDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep3.dsMasterDataChange') else _udebug := nil;{$ENDIF}

  inherited;

  case RepID of
    3,4:begin// Отчёт о расходе по клиентам(SubDetail)
        with cdsDetail do begin
          Close;
          ProviderName := 'pRep'+IntToStr(RepID)+'_Detail';
          FetchParams;
          Params.ParamByName('wbillid').AsInteger := cdsMaster.FieldByName('wbillid').AsInteger;
          FetchMacros;
          Macros.ParamByName('m').AsString := '';
          Macros.ParamByName('s').AsString := '';

          if aByMat.Checked then begin
            if (edMat.MatID>0) then begin
              Macros.ParamByName('m').AsString := 'and wbdet.matid='+IntToStr(edMat.MatID);
              Macros.ParamByName('s').AsString := 'and wbs.svcid=0';
            end else begin
              Macros.ParamByName('m').AsString := '';
              Macros.ParamByName('s').AsString := 'and wbs.svcid=0';
            end;
          end
          else if aBySvc.Checked then begin
            if (edSvc.SvcID>0) then begin
              Macros.ParamByName('m').AsString := 'and wbdet.matid=0';
              Macros.ParamByName('s').AsString := 'and wbs.svcid='+IntToStr(edSvc.SvcID);
            end
            else begin
              Macros.ParamByName('m').AsString := 'and wbdet.matid=0';
              Macros.ParamByName('s').AsString := '';
            end;
          end;
          Open;
        end;//with cdsSubDetail
    end;//3:
  end;//case;
  Application.ProcessMessages;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep3.aByMatExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep3.aByMatExecute') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep3.aBySvcExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep3.aBySvcExecute') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep3.aByAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep3.aByAllExecute') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('Rep3', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
