{$I ok_sklad.inc}
unit RepPersons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseRepWithPeriod, FR_DSet, FR_DBSet, DB, DBClient, ssBaseConst,
  ssClientDataSet, FR_Chart, FR_ChBox, FR_Class, ActnList, ssFormStorage,
  ImgList, xButton, ssPanel, ssGradientPanel, dxTL6, dxDBCtrl6, dxCntner6,
  dxDBTL6, ssPeriod, okPeriod, StdCtrls, ExtCtrls, ssBevel, ssSpeedButton,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, ssDBComboBox,
  ssDBLookupCombo, cxCheckBox, ssCheckBox, cxGroupBox, ssGroupBox, ssMemDS,
  okSearchEdit, cxRadioGroup;

type
  TfrmRepPersons = class(TfrmBaseRepWithPeriod)
    aPersonsRef: TAction;
    btnPersons: TssSpeedButton;
    cdsPersons: TssClientDataSet;
    cdsWBIn: TssClientDataSet;
    cdsWBInDet: TssClientDataSet;
    cdsWBOut: TssClientDataSet;
    cdsWBOutDet: TssClientDataSet;
    chbAccOut: TssCheckBox;
    chbInv: TssCheckBox;
    chbPrintDocs: TssCheckBox;
    chbPrintPos: TssCheckBox;
    chbRetIn: TssCheckBox;
    chbRetOut: TssCheckBox;
    chbWBIn: TssCheckBox;
    chbWBMove: TssCheckBox;
    chbWBOut: TssCheckBox;
    chbWBRest: TssCheckBox;
    chbWriteOff: TssCheckBox;
    edMat: TokMatSearchEdit;
    edSvc: TokSvcSearchEdit;
    fsrcWBIn: TfrDBDataSet;
    fsrcWBInDet: TfrDBDataSet;
    fsrcWBOut: TfrDBDataSet;
    fsrcWBOutDet: TfrDBDataSet;
    gbDocs: TssGroupBox;
    gbMatSvc: TssGroupBox;
    lcbPersons: TssDBLookupCombo;
    lPersons: TLabel;
    rbtMSAll: TcxRadioButton;
    rbtMSMat: TcxRadioButton;
    rbtMSSvc: TcxRadioButton;
    srcPersons: TDataSource;
    srcWBIn: TDataSource;
    srcWBInDet: TDataSource;
    srcWBOut: TDataSource;
    srcWBOutDet: TDataSource;

    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aPersonsRefExecute(Sender: TObject);
    procedure cdsWBInBeforeOpen(DataSet: TDataSet);
    procedure cdsWBInDetBeforeOpen(DataSet: TDataSet);
    procedure cdsWBOutBeforeOpen(DataSet: TDataSet);
    procedure cdsWBOutDetBeforeOpen(DataSet: TDataSet);
    procedure edMatRefButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure frReport1GetValue(const ParName: String; var ParValue: Variant);
    procedure rbtMSAllClick(Sender: TObject);
    procedure srcWBInDataChange(Sender: TObject; Field: TField);
    procedure srcWBOutDataChange(Sender: TObject; Field: TField);

  private
    FWBOUTSUMM, FWBINSUMM : Extended;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;

  public
    procedure SetCaptions; override;
  end;

var
  frmRepPersons: TfrmRepPersons;

implementation

uses
  prConst, ssFun, prFun, prTypes, ssRegUtils, BaseRep, ssDateUtils,
  ClientData, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}

//==============================================================================================
procedure TfrmRepPersons.FormCreate(Sender: TObject);
 var
  intTmp: Integer;
  {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRepPersons.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  cdsPersons.Open;

  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'WBIn', intTmp) then chbWBIn.Checked := intTmp = 1;
  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'WBOut', intTmp) then chbWBOut.Checked := intTmp = 1;
  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'AccOut', intTmp) then chbAccOut.Checked := intTmp = 1;
  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'RetIn', intTmp) then chbRetIn.Checked := intTmp = 1;
  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'RetOut', intTmp) then chbRetOut.Checked := intTmp = 1;
  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'WBMove', intTmp) then chbWBMove.Checked := intTmp = 1;
  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'WBRest', intTmp) then chbWBRest.Checked := intTmp = 1;
  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'WriteOff', intTmp) then chbWriteOff.Checked := intTmp = 1;
  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'Inv', intTmp) then chbInv.Checked := intTmp = 1;
  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'PrintDocs', intTmp) then chbPrintDocs.Checked := intTmp = 1;
  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'PrintPos', intTmp) then chbPrintPos.Checked := intTmp = 1;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRepPersons.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRepPersons.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    lPersons.Caption := GetRS('fmAllReports', 'Person') + ':';
    btnPersons.Hint := GetRS('fmAllReports', 'PersonsRef');

    chbWBIn.Properties.Caption := GetRS('frmOptions', 'WBIn');
    chbWBOut.Properties.Caption := GetRS('frmOptions', 'WBOut');
    chbAccOut.Properties.Caption := GetRS('frmOptions', 'AccOut');
    chbWBMove.Properties.Caption := GetRS('frmOptions', 'WBMove');
    chbRetIn.Properties.Caption := GetRS('frmOptions', 'WBRetIn');
    chbRetOut.Properties.Caption := GetRS('frmOptions', 'WBRetOut');
    chbInv.Properties.Caption := GetRS('frmOptions', 'Inv');
    chbWBRest.Properties.Caption := GetRS('frmOptions', 'WBRest');
    chbWriteOff.Properties.Caption := GetRS('frmOptions', 'WriteOff');

    gbDocs.Caption := ' ' + GetRS('fmAllReports', 'Docs') + ' ';
    chbPrintDocs.Properties.Caption := GetRS('fmAllReports', 'PrintDocs');
    chbPrintPos.Properties.Caption := GetRS('fmAllReports', 'PrintPos');

    gbMatSvc.Caption := ' ' + GetRS('fmAllReports', 'MatSvc') + ' ';
    rbtMSAll.Caption := GetRS('fmAllReports', 'MSAll');
    rbtMSMat.Caption := GetRS('fmAllReports', 'OnlyMat') + ':';
    rbtMSSvc.Caption := GetRS('fmAllReports', 'OnlySvc') + ':';

    edMat.InitRes;
    edSvc.InitRes;
    edMat.SearchNames[0] := GetRS('fmMaterials', 'Mat') + ';name';

    if edMat.CurrentSearchIndex = 0 then edMat.Caption.Caption := GetRS('fmMaterials', 'Mat') + ':';

  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRepPersons.aPersonsRefExecute(Sender: TObject);
 var
   AID: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRepPersons.aPersonsRefExecute') else _udebug := nil;{$ENDIF}

  try AID := lcbPersons.KeyValue; except AID := 0; end;
  ShowModalRef(Self, rtPersons, vtKAgent, 'TfmKAgent', Self.OnDate, AID);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRepPersons.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRepPersons.WMRefresh') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
    rtMat: edMat.MatID := M.WParam;
    rtPersons: begin
      DSRefresh(cdsPersons, 'KAID', M.WParam);
      lcbPersons.KeyValue := M.WParam;
    end;
  end;//case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRepPersons.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRepPersons.FormDestroy') else _udebug := nil;{$ENDIF}

  inherited;

  WriteToRegInt(MainRegKey + '\' + Self.Name, 'WBIn', Integer(chbWBIn.Checked));
  WriteToRegInt(MainRegKey + '\' + Self.Name, 'WBOut', Integer(chbWBOut.Checked));
  WriteToRegInt(MainRegKey + '\' + Self.Name, 'AccOut', Integer(chbAccOut.Checked));
  WriteToRegInt(MainRegKey + '\' + Self.Name, 'RetIn', Integer(chbRetIn.Checked));
  WriteToRegInt(MainRegKey + '\' + Self.Name, 'RetOut', Integer(chbRetOut.Checked));
  WriteToRegInt(MainRegKey + '\' + Self.Name, 'WBMove', Integer(chbWBMove.Checked));
  WriteToRegInt(MainRegKey + '\' + Self.Name, 'WBRest', Integer(chbWBRest.Checked));
  WriteToRegInt(MainRegKey + '\' + Self.Name, 'Inv', Integer(chbInv.Checked));
  WriteToRegInt(MainRegKey + '\' + Self.Name, 'WriteOff', Integer(chbWriteOff.Checked));
  WriteToRegInt(MainRegKey + '\' + Self.Name, 'PrintDocs', Integer(chbPrintDocs.Checked));
  WriteToRegInt(MainRegKey + '\' + Self.Name, 'PrintPos', Integer(chbPrintPos.Checked));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRepPersons.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRepPersons.ActionListUpdate') else _udebug := nil;{$ENDIF}

  aOk.Enabled := (lcbPersons.EditText <> '') and (lcbPersons.KeyValue > 0)
    and (chbWBIn.Checked or chbWBOut.Checked or chbAccOut.Checked or chbRetIn.Checked
         or chbRetOut.Checked or chbWBMove.Checked or chbWBRest.Checked or chbInv.Checked
         or chbWriteOff.Checked);

  chbPrintPos.Enabled := chbPrintDocs.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRepPersons.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRepPersons.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult = mrOk then begin
    CanClose := False;

    FromDate := prdMain.FromDate;
    ToDate := LastSecondInDay(prdMain.ToDate);

    cdsWBIn.Close;
    cdsWBOut.Close;
    cdsWBInDet.Close;
    cdsWBOutDet.Close;

    if chbWBIn.Checked then DSRefresh(cdsWBIn, 'wbillid', 0);
    if chbWBOut.Checked then DSRefresh(cdsWBOut, 'wbillid', 0);

    if cdsWBOut.Active
      then FWBOUTSUMM := GetDSSumm(cdsWBOut, 'summall')
      else FWBOUTSUMM := 0;

    if cdsWBIn.Active
      then FWBINSUMM := GetDSSumm(cdsWBIn, 'summall')
      else FWBINSUMM := 0;

    SmartShowRep(frReport1, 'RepPersons.frf');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRepPersons.cdsWBInBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRepPersons.cdsWBInBeforeOpen') else _udebug := nil;{$ENDIF}

  with cdsWBIn do begin
    if rbtMSAll.Checked then begin
      ProviderName := 'pRepPers_WBList';
      FetchParams;
    end
    else if rbtMSMat.Checked then begin
      ProviderName := 'pRepPers_WBListM';
      FetchParams;
      FetchMacros;

      if edMat.MatID > 0
        then Macros.ParamByName('m').AsString := ' and wbd.matid=' + IntToStr(edMat.MatID)
        else Macros.ParamByName('m').AsString := '';
    end
    else if rbtMSSvc.Checked then begin
      ProviderName := 'pRepPers_WBListS';
      FetchParams;
      FetchMacros;

      if edSvc.SvcID > 0
        then Macros.ParamByName('m').AsString := ' and wbs.svcid=' + IntToStr(edSvc.SvcID)
        else Macros.ParamByName('m').AsString := '';
    end;

    Params.ParamByName('personid').AsInteger := lcbPersons.KeyValue;

    if chbWBIn.Checked
      then Params.ParamByName('wtype').AsInteger := 1
      else Params.ParamByName('wtype').AsInteger := 0;

    Params.ParamByName('fromdate').AsDateTime := FromDate;
    Params.ParamByName('todate').AsDateTime := ToDate;
  end;//with

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRepPersons.frReport1GetValue(const ParName: String; var ParValue: Variant);
  var
    F1, F2, F: Extended;
    FNorm: Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRepPersons.frReport1GetValue') else _udebug := nil;{$ENDIF}

  inherited;

  if 0 = AnsiCompareText(ParName, 'WBINAMOUNT')  then ParValue := cdsWBIn.RecordCount
  else if 0 = AnsiCompareText(ParName, 'WBOUTAMOUNT')  then ParValue := cdsWBOut.RecordCount
  else if 0 = AnsiCompareText(ParName, 'WBINSUMM')  then ParValue := FWBINSUMM
  else if 0 = AnsiCompareText(ParName, 'WBOUTSUMM')  then ParValue := FWBOUTSUMM
  else if 0 = AnsiCompareText(ParName, 'PRINTDOCS') then ParValue := Integer(chbPrintDocs.Checked)
  else if 0 = AnsiCompareText(ParName, 'MATNAME') then begin
    if edMat.MatID > 0
      then ParValue := edMat.MatName
      else ParValue := '';
  end
  else if 0 = AnsiCompareText(ParName, 'MATID') then begin
    if edMat.MatID > 0
      then ParValue := edMat.MatID
      else ParValue := 0;
  end
  else if 0 = AnsiCompareText(ParName, 'PersonName') then ParValue := lcbPersons.EditText
  else if 0 = AnsiCompareText(ParName, 'WBInPosSumm') then begin
    NDSCalc(cdsWBInDet.FieldByName('amount').AsFloat, cdsWBInDet.FieldByName('price').AsFloat * cdsWBInDet.FieldByName('onvalue').AsFloat,
            cdsWBInDet.FieldByName('nds').AsFloat, 1, F1, F2);
    F := RoundToA(F1 + F2, -2);
    ParValue := F;
  end
  else if 0 = AnsiCompareText(ParName, 'WBOutPosSumm') then begin
    FNorm := RoundToA(cdsWBOutDet.FieldByName('norm').AsFloat, -6);
    if FNorm = 0 then FNorm := 1;
    NDSCalc(cdsWBOutDet.FieldByName('amount').AsFloat, cdsWBOutDet.FieldByName('price').AsFloat * FNorm * cdsWBOutDet.FieldByName('onvalue').AsFloat,
            cdsWBOutDet.FieldByName('nds').AsFloat, 1, F1, F2);
    F := RoundToA(F1 + F2, -2);
    ParValue := F;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRepPersons.cdsWBInDetBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRepPersons.cdsWBInDetBeforeOpen') else _udebug := nil;{$ENDIF}

  if chbPrintPos.Checked and chbPrintPos.Enabled
    then cdsWBInDet.Params.ParamByName('wbillid').AsInteger := cdsWBIn.FieldByName('wbillid').AsInteger
    else cdsWBInDet.Params.ParamByName('wbillid').AsInteger := -1;

  cdsWBInDet.FetchMacros;

  if edMat.MatID > 0
    then cdsWBInDet.Macros.ParamByName('m').AsString := 'and wbd.matid=' + IntToStr(edMat.MatID)
    else cdsWBInDet.Macros.ParamByName('m').AsString := '';


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRepPersons.srcWBInDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRepPersons.srcWBInDataChange') else _udebug := nil;{$ENDIF}

  if chbPrintPos.Checked and chbPrintPos.Enabled then DSRefresh(cdsWBInDet, 'posid', 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRepPersons.cdsWBOutBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRepPersons.cdsWBOutBeforeOpen') else _udebug := nil;{$ENDIF}

  with cdsWBOut do begin
    if rbtMSAll.Checked then begin
      ProviderName := 'pRepPers_WBList';
      FetchParams;
    end
    else if rbtMSMat.Checked then begin
      ProviderName := 'pRepPers_WBListM';
      FetchParams;
      FetchMacros;

      if edMat.MatID > 0
        then Macros.ParamByName('m').AsString := ' and wbd.matid=' + IntToStr(edMat.MatID)
        else Macros.ParamByName('m').AsString := '';
    end
    else if rbtMSSvc.Checked then begin
      ProviderName := 'pRepPers_WBListS';
      FetchParams;
      FetchMacros;

      if edSvc.SvcID > 0
        then Macros.ParamByName('m').AsString := ' and wbs.svcid=' + IntToStr(edSvc.SvcID)
        else Macros.ParamByName('m').AsString := '';
    end;

    Params.ParamByName('personid').AsInteger := lcbPersons.KeyValue;

    if chbWBOut.Checked
      then Params.ParamByName('wtype').AsInteger := -1
      else Params.ParamByName('wtype').AsInteger := 0;

    Params.ParamByName('fromdate').AsDateTime := FromDate;
    Params.ParamByName('todate').AsDateTime := ToDate;
  end;//with

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRepPersons.cdsWBOutDetBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRepPersons.cdsWBOutDetBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsWBOutDet.FetchParams;
  
  if chbPrintPos.Checked and chbPrintPos.Enabled
    then cdsWBOutDet.Params.ParamByName('wbillid').AsInteger := cdsWBOut.FieldByName('wbillid').AsInteger
    else cdsWBOutDet.Params.ParamByName('wbillid').AsInteger := -1;

  cdsWBOutDet.FetchMacros;

  if edMat.MatID>0 then begin
    cdsWBOutDet.Macros.ParamByName('m').AsString := 'and wbd.matid=' + IntToStr(edMat.MatID);
    cdsWBOutDet.Macros.ParamByName('s').AsString := 'and wbs.svcid=-1';
  end
  else begin
    cdsWBOutDet.Macros.ParamByName('m').AsString := '';
    cdsWBOutDet.Macros.ParamByName('s').AsString := '';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRepPersons.srcWBOutDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRepPersons.srcWBOutDataChange') else _udebug := nil;{$ENDIF}

  if chbPrintPos.Checked and chbPrintPos.Enabled then DSRefresh(cdsWBOutDet, 'posid', 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

{procedure TfrmRepPersons.GetDocs;
var
  s: string;
begin
  mdDocs.Close;
  mdDocs.Open;

  with newDataSet do
  try
    ProviderName := 'pRepPers_Docs';
    FetchParams;
    FetchMacros;

    s := '';
    if chbWBIn.Checked then s := s + '1,';
    if chbWBOut.Checked then s := s + '-1,';
    if s <> '' then System.Delete(s, Length(s), 1);

    Params.ParamByName('personid').AsInteger := lcbPersons.KeyValue;
    Params.ParamByName('fromdate').AsDateTime := FromDate;
    Params.ParamByName('todate').AsDateTime := ToDate;
    Macros.ParamByName('wtype').AsString := s;
    Open;
    if Locate('wtype', 1, []) then begin
      mdDocs.Append;
      mdDocs.FieldByName('name').AsString := chbWBIn.Properties.Caption;
      mdDocs.FieldByName('summ').AsFloat := FieldByName('summall').AsFloat;
      mdDocs.FieldByName('amount').AsInteger := FieldByName('amount').AsInteger;
      mdDocs.Post;
    end;
    if Locate('wtype', -1, []) then begin
      mdDocs.Append;
      mdDocs.FieldByName('name').AsString := chbWBOut.Properties.Caption;
      mdDocs.FieldByName('summ').AsFloat := FieldByName('summall').AsFloat;
      mdDocs.FieldByName('amount').AsInteger := FieldByName('amount').AsInteger;
      mdDocs.Post;
    end;
    Close;
  finally
    Free;
  end;

end;
}
//==============================================================================================
procedure TfrmRepPersons.edMatRefButtonClick(Sender: TObject);
  var
    AID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRepPersons.edMatRefButtonClick') else _udebug := nil;{$ENDIF}

  try
    AID := edMat.MatID;
  except
    AID := 0;
  end;
  edMat.Editor.SetFocus;
  ShowModalRef(Self, rtMat, vtMat, 'TfmMaterials', Self.OnDate, AID);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRepPersons.rbtMSAllClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRepPersons.rbtMSAllClick') else _udebug := nil;{$ENDIF}

  edMat.Enabled := rbtMSMat.Checked;
  edSvc.Enabled := rbtMSSvc.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('RepPersons', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
