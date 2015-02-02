{$I ok_sklad.inc}
unit fWBReestr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseWBDoc, dxExEdtr6, DB, ssDataSource, DBClient,
  ssClientDataSet, TB2Item, Menus, ActnList, dxInspRw, dxInspct, dxCntner6,
  dxDBTLCl6, dxGrClms6, cxPC, cxDropDownEdit, ssDBLookupCombo,
  cxImageComboBox, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxCalendar, ssSpeedButton, StdCtrls, dxDBGrid6, dxTL6, dxDBCtrl6, 
  prTypes, ssDBGrid, ssBevel, ExtCtrls, ssPeriod, okPeriod, ssMemDS,
  dxExEdtr, dxCntner;

type
  TfmWBReestr = class(TfmBaseWBDoc)
    cdsMainATTDATE: TDateTimeField;
    cdsMainATTNUM: TStringField;
    cdsMainCHECKED: TIntegerField;
    cdsMainCURRID: TIntegerField;
    cdsMainDEFNUM: TIntegerField;
    cdsMainDELETED: TIntegerField;
    cdsMainDOCID: TIntegerField;
    cdsMaindocsaldo: TFloatField;
    cdsMainKAID: TIntegerField;
    cdsMainKANAME: TStringField;
    cdsMainNDS: TFloatField;
    cdsMainNOTES: TStringField;
    cdsMainNUM: TStringField;
    cdsMainONDATE: TDateTimeField;
    cdsMainPERSONID: TIntegerField;
    cdsMainREASON: TStringField;
    cdsMainRECEIVED: TStringField;
    cdsMainSUMMALL: TFloatField;
    cdsMainSUMMPAY: TFloatField;
    cdsMainTODATE: TDateTimeField;
    cdsMainWBILLID: TIntegerField;
    cdsMainWTYPE: TIntegerField;
    TBItem7: TTBItem;

    procedure cdsMainBeforeOpen(DataSet: TDataSet);
    procedure cdsMainCalcFields(DataSet: TDataSet);
    procedure colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure grdMainDblClick(Sender: TObject);
    procedure grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure grdMainKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lcbKAgentPropertiesEditValueChanged(Sender: TObject);
    procedure srcMainDelayedDataChange(Sender: TObject; Field: TField);

  private
    Opened: Boolean;
    FWType: Integer;
    FKAID: Integer;

  public
    procedure DoPrint(AParam: integer = 0); override;
    procedure DoOpen(AParam: Variant); override;
    procedure SetParam(const Value: Integer); override;
    procedure DoShowFilter; override;
    procedure SetCaptions; override;
    procedure UpdateActionList; override;
    procedure DoShow; override;
    procedure DoActivate; override;
  end;

var
  fmWBReestr: TfmWBReestr;

implementation

uses
  prConst, ssBaseConst, ssDateUtils, BaseFrame, ClientData,
  BaseRef, prRep, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfmWBReestr.DoOpen(AParam: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReestr.DoOpen') else _udebug := nil;{$ENDIF}


  RefType := rtWBReestr;
  panClient.Align := alClient;
  inherited;
  _ID_ := 'wbillid';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReestr.SetCaptions;
  var
    FTitle: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReestr.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    FTitle := LangMan.GetRS('fmWaybill', 'DocReestr');
    Self.Caption := FTitle;
    SendMessage(ParentHandle, WM_SETPARENTCAPTION, integer(@FTitle), 0);

    FindList.Clear;
    FindList.AddObject(GetRS('fmWaybill', 'FiltNum') + ';' + 'num', pointer(1));
    FindList.AddObject(GetRS('fmWaybill', 'FiltDate') + ';' + 'ondate', pointer(2));
    FindList.AddObject(GetRS('fmPayDoc', 'KAgentD') + ';' + 'kaname', pointer(3));
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReestr.srcMainDelayedDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReestr.srcMainDelayedDataChange') else _udebug := nil;{$ENDIF}

  FCurrentID := cdsMain.FieldByName('wbillid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReestr.cdsMainBeforeOpen(DataSet: TDataSet);
  var
    M: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReestr.cdsMainBeforeOpen') else _udebug := nil;{$ENDIF}

  M := '';
  with cdsMain do begin
    if (lcbKAgent.KeyValue <> lcbKAgent.EmptyValue) and panFilter.Visible
      then M := M + ' and wbl.kaid=' + IntToStr(lcbKAgent.KeyValue);

    if cbChecked.EditValue = 1 then M := M + ' and wbl.checked=1' else
    if cbChecked.EditValue = 2 then M := M + ' and wbl.checked=0';
    if FWType <> 0 then M := M + ' and wbl.wtype=' + IntToStr(FWType);

    Macros.ParamByName('m').AsString := M;

    if panFilter.Visible
      then Params.ParamByName('fromdate').AsDateTime := prdMain.FromDate
      else Params.ParamByName('fromdate').AsDateTime := 0;

    if panFilter.Visible
      then Params.ParamByName('todate').AsDateTime := LastSecondInDay(prdMain.ToDate)
      else Params.ParamByName('todate').AsDateTime := MaxDateTime;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReestr.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReestr.UpdateActionList') else _udebug := nil;{$ENDIF}

  inherited;

  aNew.Enabled := False;
  aProperties.Enabled := False;
  aPatternInsert.Enabled := False;
  aDel.Enabled := False;
  aExcel.Enabled := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReestr.colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReestr.colImgGetText') else _udebug := nil;{$ENDIF}
  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReestr.grdMainGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReestr.grdMainGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := LangMan.GetRS('fmWaybill', 'DocReestr');
  ImgList := dmData.Images;
  AIndex := II_WBDOCS;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReestr.cdsMainCalcFields(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReestr.cdsMainCalcFields') else _udebug := nil;{$ENDIF}

  cdsMain.FieldByName('docsaldo').AsCurrency := cdsMain.FieldByName('summall').AsCurrency - cdsMain.FieldByName('summpay').AsCurrency;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReestr.SetParam(const Value: Integer);
  var
    S: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReestr.SetParam') else _udebug := nil;{$ENDIF}

  if Value = 0 then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with PGrpInfo(Value)^ do begin
    FKAID := PID;
    FWType := ID;
  end;

  if FKAID <> 0 then begin
    cdsKAgent.Open;
    lcbKAgent.KeyValue := FKAID;
  end;

  S := LangMan.GetRS('fmWaybill', 'DocReestr');
  case FWType of
    1: S := S + ' (' + LangMan.GetRS('frmOptions', 'WBIn') + ')';
   -1: S := S + ' (' + LangMan.GetRS('frmOptions', 'WBOut') + ')';
    2: S := S + ' (' + LangMan.GetRS('frmOptions', 'AccOut') + ')';
    6: S := S + ' (' + LangMan.GetRS('frmOptions', 'WBRetIn') + ')';
   -6: S := S + ' (' + LangMan.GetRS('frmOptions', 'WBRetOut') + ')';
    8: S := S + ' (' + LangMan.GetRS('frmOptions', 'WBRetOut') + ')';
   -8: S := S + ' (' + LangMan.GetRS('frmOptions', 'WBRetOut') + ')';
  -16: S := S + ' (' + LangMan.GetRS('frmOptions', 'OrdersOut') + ')';
   16: S := S + ' (' + LangMan.GetRS('frmOptions', 'OrdersIn') + ')';
  end;

  SendMessage(ParentHandle, WM_SETPARENTCAPTION, Integer(@S), 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReestr.DoShowFilter;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReestr.DoShowFilter') else _udebug := nil;{$ENDIF}

  panFilter.Visible := aShowFilter.Checked;
  Application.ProcessMessages;
  if Opened then DoRefresh(0);
  FrameResize(Self);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReestr.lcbKAgentPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReestr.lcbKAgentPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if CanRefresh and Opened then DoRefresh(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReestr.DoShow;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReestr.DoShow') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReestr.DoActivate;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReestr.DoActivate') else _udebug := nil;{$ENDIF}

  inherited;

  if not Opened then begin
    grdMain.ClearSelection;
    cdsMain.Locate(_ID_, FCurrentID, []);

    if grdMain.FocusedNode <> nil then grdMain.FocusedNode.Selected := True;
  end;

  Opened := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReestr.grdMainDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReestr.grdMainDblClick') else _udebug := nil;{$ENDIF}

  if grdMain.Count > 0 then begin
    FCurrentID := cdsMain.FieldByName(_ID_).AsInteger;
    SendMessage(ParentHandle, WM_SELECTITEM, 0, 0);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReestr.grdMainKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReestr.grdMainKeyDown') else _udebug := nil;{$ENDIF}

  if Key = 13 then grdMainDblClick(grdMain);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmWBReestr.DoPrint(AParam: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmWBReestr.DoPrint') else _udebug := nil;{$ENDIF}

  case cdsMain.FieldByName('wtype').AsInteger of
      1: xRep.ShowRep(rtWBIn, cdsMain.FieldByName(_ID_).AsInteger);
     -1: xRep.ShowRep(rtWBOut, cdsMain.FieldByName(_ID_).AsInteger);
      2: xRep.ShowRep(rtAccOut, cdsMain.FieldByName(_ID_).AsInteger);
      6: xRep.ShowRep(rtReturnIn, cdsMain.FieldByName(_ID_).AsInteger);
     -6: xRep.ShowRep(rtReturnOut, cdsMain.FieldByName(_ID_).AsInteger);
    -16: xRep.ShowRep(rtOrderOut, cdsMain.FieldByName(_ID_).AsInteger);
     16: xRep.ShowRep(rtOrderIn, cdsMain.FieldByName(_ID_).AsInteger);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fWBReestr', @Debugging, DEBUG_group_ID);{$ENDIF}

finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
