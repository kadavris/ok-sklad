{$I ok_sklad.inc}
unit fOperLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrame, TB2Item, Menus, ActnList, StdCtrls, cxDropDownEdit,
  ssDBLookupCombo, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxCalendar, ssBevel, ExtCtrls, dxDBTLCl6, dxGrClms6, dxTL6, dxDBCtrl6,
  dxDBGrid6, dxCntner6, DB, DBClient, ssClientDataSet, ssBaseTypes,
  ssPeriod, okPeriod, xLngDefs;

type
  TfmOperLog = class(TssBaseFrame)
    aClear: TAction;
    bvlRight: TssBevel;
    bvlTop: TssBevel;
    cdsFunctions: TssClientDataSet;
    cdsMain: TssClientDataSet;
    cdsUsers: TssClientDataSet;
    colAfter: TdxDBGridColumn;
    colBefore: TdxDBGridColumn;
    colDocType: TdxDBGridImageColumn;
    colFunction: TdxDBGridColumn;
    colID: TdxDBGridColumn;
    colNum: TdxDBGridColumn;
    colOnDate: TdxDBGridColumn;
    colState: TdxDBGridColumn;
    colUser: TdxDBGridColumn;
    grdMain: TdxDBGrid;
    lcbFunctions: TssDBLookupCombo;
    lcbUsers: TssDBLookupCombo;
    lFunction: TLabel;
    lUser: TLabel;
    panFilter: TPanel;
    prdMain: TokPeriod;
    srcFunctions: TDataSource;
    srcMain: TDataSource;
    srcUsers: TDataSource;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;

    procedure aClearExecute(Sender: TObject);
    procedure aSelectAllExecute(Sender: TObject);
    procedure cdsFunctionsBeforeOpen(DataSet: TDataSet);
    procedure cdsMainAfterOpen(DataSet: TDataSet);
    procedure cdsMainBeforeOpen(DataSet: TDataSet);
    procedure colStateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colUserGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure edFromDatePropertiesEditValueChanged(Sender: TObject);
    procedure FrameResize(Sender: TObject);
    procedure grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure grdMainDblClick(Sender: TObject);
    procedure grdMainSelectedCountChange(Sender: TObject);
    procedure lcbFunctionsPropertiesChange(Sender: TObject);
    procedure lcbUsersPropertiesChange(Sender: TObject);
    procedure lcbUsersPropertiesEditValueChanged(Sender: TObject);
    procedure prdMainChange(Sender: TObject);

  private
    CanRefresh, f: Boolean;
    FromTime, ToTime: Cardinal;

  protected
    function GetIDForUpdate: integer; override;
    procedure SetOnDate(const Value: TDateTime); override;
    procedure LocateAfterDel;

  public
    procedure DoOpen(AParam: Variant); override;
    procedure DoClose; override;
    procedure DoShow; override;
    procedure DoDelete; override;
    procedure SetCaptions; override;
    procedure DoRefresh(const AID: integer; AParam: integer = 0); override;
    procedure DoFind(const AFName, AStr: string; ALocateType: TLocateType; AFwd: Boolean = True); override;
    procedure UpdateActionList; override;
    procedure DoPrint(AParam: integer = 0); override;
    procedure NotifyChanged; override;
  end;

var
  fmOperLog: TfmOperLog;

implementation

uses
  ClientData, prConst, xLngManager, prFun, ssFun, ssRegUtils,
  ssBaseConst, DateUtils, ssDateUtils, OperProps, fMessageDlg, prRep,
  prTypes, udebug;

var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}

//==============================================================================================
procedure TfmOperLog.DoOpen(AParam: Variant);
  var
    Temp: string;
    intTmp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOperLog.DoOpen') else _udebug := nil;{$ENDIF}

  EditingClass := TfrmOperProps;
  CanRefresh := False;
  try
    inherited;

    Temp := '';
    {if ReadFromRegStr(MainRegKey + '\' + Self.ClassName, 'FromDate', Temp)
      then begin
        if Trim(Temp) = ''
          then edFromDate.Text := ''
          else edFromDate.Date := StrToDate(Temp);
      end
      else edFromDate.Text := '';
    }
    prdMain.PeriodType := ptCustom;
    prdMain.ToDate := Self.OnDate;
    prdMain.FromDate := IncDay(Self.OnDate, -7);

    cdsFunctions.Open;
    cdsUsers.Open;
    if ReadFromRegInt(MainRegKey + '\' + Self.ClassName, 'Function', intTmp)
      then lcbFunctions.KeyValue := intTmp;

    cdsMain.Open;

  finally
    CanRefresh := True;
  end;

  with grdMain do
    if FocusedNode <> nil
      then FocusedNode.Selected := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOperLog.DoShow;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOperLog.DoShow') else _udebug := nil;{$ENDIF}

  inherited;

  lcbUsers.Left := panFilter.Width - lcbUsers.Width - 4;
  lcbUsers.Anchors := lcbUsers.Anchors + [akRight];
  lUser.Left := lcbUsers.Left - 4 - lUser.Width;
  lcbFunctions.Width := lUser.Left - 18 - lcbFunctions.Left;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOperLog.SetCaptions;
  var
    FFunID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOperLog.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    Self.Caption := GetRS(Self.Name, 'Title');

    //lFromDate.Caption := GetRS(Self.Name, 'From') + ':';
    //lToDate.Caption := GetRS(Self.Name, 'To') + ':';
    prdMain.InitRes;
    prdMain.CapFrom := GetRS('fmPayDoc', 'FromDate') + ':';

    lFunction.Caption := GetRS(Self.Name, 'Function') + ':';
    lUser.Caption := GetRS(Self.Name, 'User') + ':';

    lcbFunctions.DisplayEmpty := GetRS('Common', 'All');
    lcbUsers.DisplayEmpty := GetRS('Common', 'All');
    lcbFunctions.Text := GetRS('Common', 'All');
    lcbUsers.Text := GetRS('Common', 'All');

    colDocType.Caption := '';
    colNum.Caption := GetRS(Self.Name, 'DocNum');
    colOnDate.Caption := GetRS(Self.Name, 'OperDate');
    colFunction.Caption := GetRS(Self.Name, 'Function');
    colUser.Caption := GetRS(Self.Name, 'User');

    FindList.Clear;
    FindList.AddObject(GetRS(Self.Name, 'NumD') + ';' + 'docnum', pointer(1));

  end;

  inherited;

  FFunID := lcbFunctions.KeyValue;
  cdsFunctions.Close;
  cdsFunctions.Open;
  lcbFunctions.KeyValue := FFunID;
  if CanRefresh then aRefresh.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOperLog.colUserGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOperLog.colUserGetText') else _udebug := nil;{$ENDIF}

  if cdsUsers.Locate('sysname', AText, [])
    then AText := cdsUsers.FieldByName('name').AsString
    else AText := '?';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOperLog.FrameResize(Sender: TObject);
  var
    AStyle: integer;
    Offset, W, i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOperLog.FrameResize') else _udebug := nil;{$ENDIF}

  inherited;
  AStyle := GetWindowLong(grdMain.Handle, GWL_STYLE);

  if AStyle and WS_VSCROLL = WS_VSCROLL
    then Offset := 19
    else Offset := 2;

  W := grdMain.Width - Offset;

  for i := 0 to grdMain.VisibleColumnCount - 1 do
    if grdMain.VisibleColumns[i] <> colFunction
      then W := W - grdMain.VisibleColumns[i].Width;

  colFunction.Width := W;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOperLog.cdsMainBeforeOpen(DataSet: TDataSet);
  var
    m: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOperLog.cdsMainBeforeOpen') else _udebug := nil;{$ENDIF}

  FromTime := GetTickCount;
  if not panFilter.Visible
    then cdsMain.Params.ParamByName('fromdate').AsDateTime := 0
    else cdsMain.Params.ParamByName('fromdate').AsDateTime := prdMain.FromDate;
  if not panFilter.Visible
    then cdsMain.Params.ParamByName('todate').AsDateTime := MaxDateTime
    else cdsMain.Params.ParamByName('todate').AsDateTime := LastSecondInDay(prdMain.ToDate);

  cdsMain.Params.ParamByName('shortname').AsString := LangName;

  m := '';
  if lcbUsers.KeyValue <> lcbUsers.EmptyValue then begin
    m := m + ' and ol.username=''' + cdsUsers.FieldByName('sysname').AsString + '''';
  end;

  if lcbFunctions.KeyValue <> lcbFunctions.EmptyValue
    then m := m + ' and f.funid=' + IntToStr(lcbFunctions.KeyValue);

  cdsMain.Macros.ParamByName('m').AsString := m;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOperLog.lcbUsersPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOperLog.lcbUsersPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if CanRefresh then DoRefresh(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOperLog.DoRefresh(const AID: integer; AParam: integer);
  var
    FLastIndex: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOperLog.DoRefresh') else _udebug := nil;{$ENDIF}

  FLastIndex := grdMain.TopIndex;
  DSRefresh(cdsMain, 'opid', 0);
  grdMain.TopIndex := FLastIndex;

  UpdateActionList;
  with grdMain do begin
    ClearSelection;
    if FocusedNode <> nil then FocusedNode.Selected := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOperLog.lcbFunctionsPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOperLog.lcbFunctionsPropertiesChange') else _udebug := nil;{$ENDIF}

  if lcbFunctions.Text = '' then lcbFunctions.ItemIndex := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOperLog.lcbUsersPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOperLog.lcbUsersPropertiesChange') else _udebug := nil;{$ENDIF}

  if lcbUsers.Text = '' then lcbUsers.ItemIndex := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOperLog.DoClose;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOperLog.DoClose') else _udebug := nil;{$ENDIF}

  cdsMain.Close;

  //WriteToRegDate(MainRegKey + '\' + Self.ClassName, 'FromDate', edFromDate.Date);
  WriteToRegInt(MainRegKey + '\' + Self.ClassName, 'Function', lcbFunctions.KeyValue);

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOperLog.edFromDatePropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOperLog.edFromDatePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if CanRefresh then DoRefresh(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOperLog.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOperLog.UpdateActionList') else _udebug := nil;{$ENDIF}

  aNew.Enabled := False;
  aPatternInsert.Enabled := False;
  aDel.Enabled := grdMain.SelectedCount > 0;
  aProperties.Enabled := grdMain.SelectedCount = 1;
  aCheck.Enabled := False;
  aPrint.Enabled := grdMain.SelectedCount = 1;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOperLog.cdsMainAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOperLog.cdsMainAfterOpen') else _udebug := nil;{$ENDIF}

  FrameResize(Self);
  cdsMain.Last;
  if grdMain.FocusedNode <> nil then grdMain.FocusedNode.Selected := True;
  ToTime := GetTickCount;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmOperLog.GetIDForUpdate: integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOperLog.GetIDForUpdate') else _udebug := nil;{$ENDIF}

  Result := cdsMain.FieldByName('opid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOperLog.DoDelete;
  var
    id_, i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOperLog.DoDelete') else _udebug := nil;{$ENDIF}

  if ((grdMain.SelectedCount = 1) and (ssMessageDlg(LangMan.GetRS('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes))
     or
     ((grdMain.SelectedCount > 1) and
     (ssMessageDlg(Format(LangMan.GetRS('Common', 'DelConfirmEx'), [grdMain.SelectedCount]), ssmtWarning, [ssmbYes, ssmbNo]) = mrYes))
  then begin
   fProgress.Show;

   with newDataSet do
   try
     Application.ProcessMessages;
     fProgress.Caption := LangMan.GetRS('Common', 'Deleting');
     fProgress.UpDate;
     fProgress.pbMain.Max := grdMain.SelectedCount;
     ProviderName := 'pOperLog_Del';
     FetchParams;

     for i := 0 to grdMain.SelectedCount - 1 do begin
       TrStart;

       try
         fProgress.pbMain.StepIt;
         fProgress.lText.Caption := VarToStr(grdMain.SelectedNodes[i].Values[colFunction.Index]);
         Application.ProcessMessages;
         Params.ParamByName('opid').AsInteger := grdMain.SelectedNodes[i].Values[colID.Index];
         Execute;

         TrCommit;

       except
         on e:exception do begin
           TrRollback;

           if (grdMain.SelectedCount = 1)
             then ssMessageDlg(LangMan.GetRS('Common', 'NoDelete') + #10#13 + e.Message, ssmtError, [ssmbOk])
             else if mrYes <> ssMessageDlg(Format(LangMan.GetRS('Common', 'NoDeleteEx'), [grdMain.SelectedNodes[i].Values[colFunction.Index] + ' (' +
                  VarToStr(grdMain.SelectedNodes[i].Values[colOnDate.Index]) + ')']), ssmtError, [ssmbYes, ssmbNo])
             then begin
               TrRollback;
               Break;
             end;
         end;
       end;
     end;

     LocateAfterDel;
     aRefresh.Execute;
     UpdateActionList;

    finally
      fProgress.Hide;
      Free;
    end;
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOperLog.grdMainSelectedCountChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOperLog.grdMainSelectedCountChange') else _udebug := nil;{$ENDIF}

  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOperLog.aSelectAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOperLog.aSelectAllExecute') else _udebug := nil;{$ENDIF}

  grdMain.SelectAll;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOperLog.grdMainDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOperLog.grdMainDblClick') else _udebug := nil;{$ENDIF}

  if grdMain.FocusedNode <> nil then aProperties.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOperLog.colStateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOperLog.colStateGetText') else _udebug := nil;{$ENDIF}

  if (ANode.Values[colDocType.Index] = 'U') and (VarToStr(ANode.Values[colBefore.Index]) <> VarToStr(ANode.Values[colAfter.Index]))
    then AText := LangMan.GetRS(Self.Name, 'Changed');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOperLog.DoFind(const AFName, AStr: string; ALocateType: TLocateType; AFwd: Boolean = True);
  var
    FNode: TdxTreeListNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOperLog.DoFind') else _udebug := nil;{$ENDIF}

  inherited;

  if FindStr <> AStr then FindIndex := -1;
  FindStr := AStr;
  if AStr = '' then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  FNode := FindNode(grdMain, AFName, AStr, ALocateType, FindIndex, AFwd);

  if FNode <> nil then begin
    FindIndex := FNode.Index;
    cdsMain.Locate('opid', FNode.Values[colID.Index], []);
    grdMain.ClearSelection;

    if grdMain.FocusedNode <> nil then grdMain.FocusedNode.Selected := True;
  end
  else ssMessageDlg(LangMan.GetRS('Common', 'FindError') + ', ' + LangMan.GetRS('Common', 'DSEnd'), ssmtInformation, [ssmbOk]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOperLog.DoPrint(AParam: integer);
  var
    FOpCode: string;
    FClassName: string;
    FDocID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOperLog.DoPrint') else _udebug := nil;{$ENDIF}

  FOpCode :=  cdsMain.FieldByName('opcode').AsString;
  FClassName := cdsMain.FieldByName('classname').AsString;
  FDocID := cdsMain.FieldByName('id').AsInteger;

  if FOpCode <> 'D' then begin
    if (FClassName = 'TfmWaybillOut') then xRep.ShowRep(prRep.rtWBOut, FDocID)
    else if (FClassName = 'TfmWaybill') then xRep.ShowRep(prRep.rtWBIn, FDocID)
    else if (FClassName = 'TfmAccOut') then xRep.ShowRep(prRep.rtAccOut, FDocID)
    else if (FClassName = 'TfmWaybillMov') then xRep.ShowRep(prRep.rtWBMove, FDocID)
    else if (FClassName = 'TfmTaxWB') then xRep.ShowRep(prRep.rtTaxWB, FDocID);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOperLog.grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOperLog.grdMainCustomDrawCell') else _udebug := nil;{$ENDIF}

  if Odd(ANode.Index) and not ASelected then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOperLog.cdsFunctionsBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOperLog.cdsFunctionsBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsFunctions.Params.ParamByName('shortname').AsString := LangName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOperLog.aClearExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOperLog.aClearExecute') else _udebug := nil;{$ENDIF}

  if ssMessageDlg(LangMan.GetRS(Self.Name, 'ClearLog'), ssmtWarning, [ssmbYes, ssmbNo]) <> mrYes
    then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with newDataSet do
    try
      ProviderName := 'pOperLog_Clear';
      Execute;
      aRefresh.Execute;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOperLog.NotifyChanged;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOperLog.NotifyChanged') else _udebug := nil;{$ENDIF}

  if not JumpFromBuffer
    then frmMainForm.AddToBuffer(vtService, FunID, Self.Caption, ClassName, Tag, FCurrentID, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOperLog.prdMainChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOperLog.prdMainChange') else _udebug := nil;{$ENDIF}

  if CanRefresh then DoRefresh(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOperLog.SetOnDate(const Value: TDateTime);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOperLog.SetOnDate') else _udebug := nil;{$ENDIF}

  inherited;

  prdMain.BaseDate := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmOperLog.LocateAfterDel;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmOperLog.LocateAfterDel') else _udebug := nil;{$ENDIF}

  with grdMain do
    if SelectedCount > 1 then begin
      cdsMain.First;
    end
    else
    if cdsMain.RecordCount > 1 then
      if (FocusedNode.Index = Count - 1) and (FocusedNode.Index > 0)
        then cdsMain.Locate('opid', FocusedNode.GetPrev.Values[ColumnByFieldName(KeyField).Index], [])
        else cdsMain.Locate('opid', FocusedNode.GetNext.Values[ColumnByFieldName(KeyField).Index], []);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fOperLog', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
