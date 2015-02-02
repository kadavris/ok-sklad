{$I ok_sklad.inc}
unit fCurrency;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrame, Menus, ActnList, dxTL6, dxDBCtrl6, dxDBGrid6, dxCntner6,
  DB, DBClient, ssBaseConst, ExtCtrls, dxDBTLCl6, dxGrClms6,
  ComCtrls, StdCtrls, ssBaseTypes, ssBaseDlg,
  TB2Item, cxPC, cxControls, ssClientDataSet;

type
  TfmCurrency = class(TssBaseFrame)
      cdsRate: TClientDataSet;
      cdsValue: TClientDataSet;
      cdsView: TClientDataSet;
      colBaseCurr: TdxDBGridColumn;
      colDef: TdxDBGridColumn;
      colID: TdxDBGridColumn;
      colName: TdxDBGridColumn;
      colOndate: TdxDBGridColumn;
      colRate: TdxDBGridCurrencyColumn;
      colRateID: TdxDBGridColumn;
      colRateIDEx: TdxDBGridColumn;
      colRepFracName: TdxDBGridColumn;
      colRepShortName: TdxDBGridColumn;
      colShortName: TdxDBGridColumn;
      colVBase: TdxDBGridColumn;
      colVDef: TdxDBGridColumn;
      colVName: TdxDBGridColumn;
      colVOnDate: TdxDBGridColumn;
      colVOnValue: TdxDBGridColumn;
      colVShortName: TdxDBGridColumn;
      dbgView: TdxDBGrid;
      grdMain: TdxDBGrid;
      grdRate: TdxDBGrid;
      pcMain: TcxPageControl;
      splMain: TSplitter;
      srcRate: TDataSource;
      srcView: TDataSource;
      TBItem5: TTBItem;
      TBItem6: TTBItem;
      TBItem7: TTBItem;
      TBSeparatorItem3: TTBSeparatorItem;
      TBSeparatorItem4: TTBSeparatorItem;
      tsDetail: TcxTabSheet;
      tsMain: TcxTabSheet;

      procedure aSelectAllExecute(Sender: TObject);
      procedure cdsRateBeforeOpen(DataSet: TDataSet);
      procedure cdsValueBeforeOpen(DataSet: TDataSet);
      procedure cdsViewAfterOpen(DataSet: TDataSet);
      procedure colBaseCurrCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
      procedure colRateIDGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
      procedure colVBaseGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
      procedure colVOnDateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
      procedure colVOnValueGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
      procedure dbgViewCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
      procedure dbgViewDblClick(Sender: TObject);
      procedure FrameResize(Sender: TObject);
      procedure grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
      procedure grdMainDblClick(Sender: TObject);
      procedure grdMainSelectedCountChange(Sender: TObject);
      procedure grdRateCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
      procedure grdRateDblClick(Sender: TObject);
      procedure pcMainChange(Sender: TObject);
      procedure srcViewDataChange(Sender: TObject; Field: TField);

    private
      PID: integer;
      limited: Boolean;
      function GetDefaultValue(const ATable, AKeyName: string): integer;

    protected
      function GetIDForUpdate: integer; override;
      function GetSubID(EdClass: TBaseDlg; AAction: TActionType): integer; override;

    public
      procedure DoClose; override;
      procedure DoDelete; override;
      procedure DoDetRefresh(const APID, AID: integer); override;
      procedure DoDown; override;
      procedure DoDynamic; override;
      procedure DoExcel(Grid: TdxDBGrid); override;
      procedure DoFind(const AFName, AStr: string; ALocateType: TLocateType; AFwd: Boolean = True); override;
      procedure DoInsert; override;
      procedure DoOpen(AParam: Variant); override;
      procedure DoRefresh(const AID: integer; AParam: integer = 0); override;
      procedure DoUp; override;
      procedure NotifyChanged; override;
      procedure SetCaptions; override;
      procedure SetOnDate(const Value: TDateTime); override;
      procedure UpdateActionList; override;
  end;

var
  fmCurrency: TfmCurrency;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  ClientData, prFun, prConst, CurrencyEdit, prTypes, ssFun, Export,
  ssCallbackConst, fMessageDlg, ssRegUtils, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

const
     _ID_ = 'currid';

//==============================================================================================
procedure TfmCurrency.DoClose;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.DoClose') else _udebug := nil;{$ENDIF}

  cdsView.Close;

  WriteToRegInt(MainRegKey + '\' + Self.ClassName, 'DynChecked', Integer(aDynamic.Checked));
  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCurrency.DoDelete;
  var
   id_: integer;
   Err, FName: string;
   idd, i: integer;
   Info: TssInfo;
   CurrGrid: TdxDbGrid;
   ResetDef: Boolean;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.DoDelete') else _udebug := nil;{$ENDIF}

  idd := 0; // init

  if pcMain.ActivePage = tsMain
    then CurrGrid := grdMain
    else CurrGrid := grdRate;

  if ((CurrGrid.SelectedCount = 1)
      and (mrYes = ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo])))
     or
     ((CurrGrid.SelectedCount > 1)
      and (mrYes = ssMessageDlg(Format(rs('Common', 'DelConfirmEx'), [CurrGrid.SelectedCount]), ssmtWarning, [ssmbYes, ssmbNo])))
  then begin
    fProgress.Show;
    with newDataSet do
    try
      Application.ProcessMessages;
      fProgress.Caption := rs('Common', 'Deleting');
      fProgress.UpDate;
      fProgress.pbMain.Max := CurrGrid.SelectedCount;
      ResetDef := False;

      for i := 0 to CurrGrid.SelectedCount -1 do begin
        TrStart;

        try
          idd := CurrGrid.SelectedNodes[i].Values[0];
          FName := '[' + cdsView.fieldbyname('shortname').AsString + '] ' +cdsView.fieldbyname('name').AsString;
          fProgress.lText.Caption := FName;

          if pcMain.ActivePage = tsMain then begin
            if not DeleteData(dmData.SConnection, 'currency', idd)
              then raise Exception.Create(rs('Common', 'DeleteError'));

            if cdsView.FieldByName('def').AsInteger = 1 then ResetDef := True;
          end
          else begin
            ProviderName := 'pCurrency_RateDelByID';
            FetchParams;
            Params.ParamByName('rateid').AsInteger := idd;
            Execute;

            TrCommit;
          end;

          if not DelToRecycleBin or (pcMain.ActivePage = tsDetail)
            then TrCommit
            else begin
              TrRollback;

              if not AddToRecycleBin(dmData.SConnection, Self.ClassName, idd, FName, ResetDef, Self.FunID) then begin
                ssMessageDlg(rs('Common', 'ErrorInsToRecycleBin'), ssmtError, [ssmbOk]);
                {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
                Exit;
              end;
            end;

        except
          on e:exception do begin
            TrRollback;

            if (CurrGrid.SelectedCount = 1) then begin
              ssMessageDlg(rs('Common', 'NoDelete') + #10#13 + e.Message, ssmtError, [ssmbOk]);
              {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
              Exit;
            end
            else if mrYes <> ssMessageDlg(Format(rs('Common', 'NoDeleteEx'),
                 [CurrGrid.SelectedNodes[i].Values[colVName.Index]]), ssmtError, [ssmbYes, ssmbNo])
            then begin
              TrRollback;
              {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
              Exit;
            end;
          end;
        end; //try

        fProgress.pbMain.StepIt;
        Application.ProcessMessages;
      end; //for i := 0 to CurrGrid.SelectedCount -1

      if ResetDef then begin
        ProviderName := 'pCurrency_Min';
        Params.Clear;
        Open;
        if not IsEmpty then begin
          id_ := Fields[0].AsInteger;
          Close;
          ProviderName := 'pCurrency_SetDef1';
          FetchParams;
          Params.ParamByName('currid').AsInteger := id_;
          Execute;
        end
        else Close;
      end;

      with grdMain do begin
        if (FocusedNode.Index = grdMain.Count - 1) and (FocusedNode.Index > 0)
          then cdsView.Locate(_ID_, FocusedNode.GetPrev.Values[ColumnByFieldName(KeyField).Index], [])
          else cdsView.Locate(_ID_, FocusedNode.GetNext.Values[ColumnByFieldName(KeyField).Index], []);
      end;

      aRefresh.Execute;

      if pcMain.ActivePage = tsMain then begin
        Info.ID := idd;
        Info.Param := 3;
        SendMessage(ParentHandle, WM_ADDTREEITEM, Integer(@Info), 0);
      end;

      UpdateActionList;

      if RefreshAllClients
        then dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_CURRENCY);

    finally
      Free;
      fProgress.Hide;
    end;
  end;
  
  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCurrency.DoOpen(AParam: Variant);
  var
    i: integer;
    DynChecked: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.DoOpen') else _udebug := nil;{$ENDIF}

  EditingClass := TfrmCurrencyEdit;
  AllowUp := True;

  DynChecked := 0;
  if ReadFromRegInt(MainRegKey + '\' + Self.ClassName, 'DynChecked', DynChecked)
    then aDynamic.Checked := DynChecked <> 0;

  if AParam=1 then begin
    dbgView.Visible := False;
    splMain.Visible := False;
  end
  else begin
    cdsView.Open;
    DoDown;
  end;

  cdsView.Locate(_ID_, GetDefaultValue('currency', 'currid'), []);

  inherited;

  if not LoadExpParams
    then with ExportList do
      for i := 0 to grdMain.ColumnCount - 1 do
        if grdMain.Columns[i].Tag = 1
          then AddObject(grdMain.Columns[i].Name, pointer(1));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCurrency.SetCaptions;
  var
    FTitle: String;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    FTitle := GetRS(Self.Name, 'TitleCurrency');
    Self.Caption := FTitle;
    colName.Caption := GetRS(Self.Name, 'Name');
    colShortName.Caption := GetRS(Self.Name, 'ShortName');
    colDef.Caption := GetRS(Self.Name, 'Base');
    colOndate.Caption := GetRS(Self.Name, 'Date');
    colRate.Caption := GetRS(Self.Name, 'CurValue');
    colBaseCurr.Caption := GetRS(Self.Name, 'Base');
    colVName.Caption := GetRS(Self.Name, 'Name');
    colVShortName.Caption := GetRS(Self.Name, 'ShortName');
    colVDef.Caption := GetRS(Self.Name, 'Base');
    colVOnDate.Caption := GetRS(Self.Name, 'Date');
    colVOnValue.Caption := GetRS(Self.Name, 'CurValue');
    colVBase.Caption := GetRS(Self.Name, 'Base');
    colRepShortName.Caption := GetRS(Self.Name, 'RepShortName');
    colRepFracName.Caption := GetRS(Self.Name, 'RepFracName');

    grdMain.Bands[0].Caption := GetRS(Self.Name, 'TitleCurrency');
    grdMain.Bands[1].Caption := GetRS(Self.Name, 'Rep');

    SendMessage(ParentHandle, WM_SETPARENTCAPTION, integer(@FTitle), 0);

    FindList.Clear;
    FindList.AddObject(GetRS(Self.Name, 'Name') + ';' + 'name', pointer(1));
    FindList.AddObject(GetRS(Self.Name, 'ShortName') + ';' + 'shortname', pointer(2));
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCurrency.dbgViewDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.dbgViewDblClick') else _udebug := nil;{$ENDIF}

  if dbgView.Count > 0 then DoProperties;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCurrency.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.UpdateActionList') else _udebug := nil;{$ENDIF}

  aNew.Enabled := not limited;
  aPatternInsert.Enabled := aNew.Enabled and (pcMain.ActivePage <> tsDetail);
  aDynamic.Enabled := pcMain.ActivePage = tsDetail;
  aExcel.Enabled := pcMain.ActivePage <> tsDetail;
  //aFind.Enabled := pcMain.ActivePage <> tsDetail;

  try
    aProperties.Enabled := not cdsView.IsEmpty;
    aDel.Enabled := aProperties.Enabled;

  except
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCurrency.DoRefresh(const AID: integer; AParam: integer = 0);
  var
    I: TssInfo;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.DoRefresh') else _udebug := nil;{$ENDIF}

  //if pcMain.ActivePage=tsDetail
  DSRefresh(cdsRate, 'rateid', 0);
  DSRefresh(cdsView, _ID_, AID);
  if AParam > 0 then begin
    I.ID := AID;
    I.Param := AParam;
    I.Name := cdsView.fieldbyname('shortname').AsString;
    I.AddInfo := cdsView.fieldbyname('name').AsString;
    SendMessage(ParentHandle, WM_ADDTREEITEM, Integer(@I), mtCurrency);
  end;

  if grdRate.FocusedNode <> nil then grdRate.FocusedNode.Selected := True;
  if grdMain.FocusedNode <> nil then grdMain.FocusedNode.Selected := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmCurrency.GetIDForUpdate: integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.GetIDForUpdate') else _udebug := nil;{$ENDIF}

  Result := cdsView.fieldbyname(_ID_).AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCurrency.dbgViewCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.dbgViewCustomDrawCell') else _udebug := nil;{$ENDIF}

  if (ANode.Values[2] = 1) and not ASelected then AFont.Color := DefaultColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCurrency.cdsRateBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.cdsRateBeforeOpen') else _udebug := nil;{$ENDIF}

  if aDynamic.Checked
    then cdsRate.ProviderName := 'pCurrency_RateDyn'
    else cdsRate.ProviderName := 'pCurrency_RateEx';

  cdsRate.FetchParams;
  cdsRate.Params.ParamByName('currid').AsInteger := PID;
  cdsRate.Params.ParamByName('ondate').AsDateTime := OnDate;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCurrency.srcViewDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.srcViewDataChange') else _udebug := nil;{$ENDIF}

  PID := cdsView.fieldbyname('currid').AsInteger;

  if dbgView.Visible then begin
    DSRefresh(cdsRate, 'rateid', 0);
    if grdRate.FocusedNode <> nil then grdRate.FocusedNode.Selected := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCurrency.DoDynamic;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.DoDynamic') else _udebug := nil;{$ENDIF}

  inherited;

  aRefresh.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmCurrency.GetDefaultValue(const ATable, AKeyName: string): integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.GetDefaultValue') else _udebug := nil;{$ENDIF}

  Result := 0;
  with newDataSet do
    try
      ProviderName := 'pCurrency_GetDef';
      Open;
      Result := FieldByName('currid').AsInteger;
      Close;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCurrency.DoDetRefresh(const APID, AID: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.DoDetRefresh') else _udebug := nil;{$ENDIF}

  if PID<>APID then begin
    PID := APID;
    DSRefresh(cdsView, 'currid', APID);
    if grdMain.FocusedNode <> nil then grdMain.FocusedNode.Selected := True;
    DSRefresh(cdsRate, 'rateid', AID);
    if grdRate.FocusedNode <> nil then grdRate.FocusedNode.Selected := True;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCurrency.DoDown;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.DoDown') else _udebug := nil;{$ENDIF}

  pcMain.ActivePage := tsDetail;
  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCurrency.DoUp;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.DoUp') else _udebug := nil;{$ENDIF}

  pcMain.ActivePage := tsMain;
  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCurrency.colBaseCurrCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.colBaseCurrCustomDrawCell') else _udebug := nil;{$ENDIF}

  AText := ' ' + BaseCurrName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCurrency.cdsValueBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.cdsValueBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsValue.Params.ParamByName('ondate').AsDateTime := OnDate;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCurrency.colVOnDateGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.colVOnDateGetText') else _udebug := nil;{$ENDIF}

  try
    if cdsValue.Locate('currid', Integer(ANode.Values[0]), [])
      then AText := cdsValue.fieldbyname('ondate').AsString;
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCurrency.cdsViewAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.cdsViewAfterOpen') else _udebug := nil;{$ENDIF}

  DSRefresh(cdsValue, 'currid', 0);

  {$IFDEF LIMITED}
    limited := cdsView.Active and (pcMain.ActivePage = tsMain) and (cdsView.recordCount > limitCurrenciesCount);
  {$ELSE}
    limited := False;
  {$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCurrency.colVOnValueGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.colVOnValueGetText') else _udebug := nil;{$ENDIF}

  try
    if cdsValue.Locate('currid', Integer(ANode.Values[0]), [])
      then AText := FormatFloat(',0.000', cdsValue.fieldbyname('onvalue').AsFloat);
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCurrency.colVBaseGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.colVBaseGetText') else _udebug := nil;{$ENDIF}

  try
    if cdsValue.Locate('currid', Integer(ANode.Values[0]), [])
      then AText := ' ' + BaseCurrName;
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCurrency.grdMainDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.grdMainDblClick') else _udebug := nil;{$ENDIF}

  //DSRefresh(cdsRate, 'rateid', 0);
  SendMessage(ParentHandle, WM_SETTREEITEM, cdsView.fieldbyname('currid').AsInteger, 0);
  DoDown;
  aRefresh.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCurrency.pcMainChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.pcMainChange') else _udebug := nil;{$ENDIF}

  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCurrency.SetOnDate(const Value: TDateTime);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.SetOnDate') else _udebug := nil;{$ENDIF}

  inherited;

  DSRefresh(cdsView, _ID_, 0);
  DSRefresh(cdsRate, 'rateid', 0);
  if grdMain.FocusedNode <> nil then grdMain.FocusedNode.Selected := True;
  if grdRate.FocusedNode <> nil then grdRate.FocusedNode.Selected := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCurrency.colRateIDGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.colRateIDGetText') else _udebug := nil;{$ENDIF}

  try
    if cdsValue.Locate('currid', Integer(ANode.Values[0]), [])
      then AText := cdsValue.fieldbyname('rateid').AsString;
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmCurrency.GetSubID(EdClass: TBaseDlg; AAction: TActionType): integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.GetSubID') else _udebug := nil;{$ENDIF}

  Result := 0;

  try
    if (pcMain.ActivePage = tsDetail) and (AAction = atInsert)
      then EdClass.ID := PID;

    if AAction = atUpdate then begin
      if pcMain.ActivePage = tsMain
        then Result := grdMain.FocusedNode.Values[7]
        else Result := cdsRate.fieldbyname('rateid').AsInteger;
    end;

  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCurrency.DoInsert;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.DoInsert') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCurrency.grdRateDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.grdRateDblClick') else _udebug := nil;{$ENDIF}

  if grdRate.Count > 0 then aProperties.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCurrency.grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.grdMainCustomDrawCell') else _udebug := nil;{$ENDIF}

  if (ANode.Values[3] = 1) and not ASelected then AFont.Color := DefaultColor;
  if UseGridOddColor and not ASelected and Odd(ANode.AbsoluteIndex) then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCurrency.DoFind(const AFName, AStr: string; ALocateType: TLocateType; AFwd: Boolean = True);
  var
    FNode: TdxTreeListNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.DoFind') else _udebug := nil;{$ENDIF}

  try //finally
    inherited;

    if FindStr <> AStr then FindIndex := -1;
    FindStr := AStr;
    if AStr = '' then Exit;

    FNode := FindNode(grdMain, AFName, AStr, ALocateType, FindIndex, AFwd);
    if FNode <> nil then begin
      FindIndex := FNode.Index;
      cdsView.Locate(_ID_, FNode.Values[0], []);
    end
    else ssMessageDlg(rs('Common', 'FindError') + ','#13#10 + rs('Common', 'DSEnd') , ssmtInformation, [ssmbOk]);

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure TfmCurrency.DoExcel(Grid: TdxDBGrid);
  var
    FShowExcel: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.DoExcel') else _udebug := nil;{$ENDIF}

  try // finally
    inherited;

    with TfrmExport.Create(nil) do
      try
        if cdsFunc.Locate('classname', Self.ClassName, [])
          then FunID := cdsFunc.fieldbyname('funid').AsInteger
          else FunID := 0;

        grdExp := grdMain;
        lName.Caption := Self.Caption;
        FList := ExportList;

        if ShowModal <> mrOk then Exit;

        FShowExcel := chbShowExcel.Checked;

     finally
       Free;
     end;

    ExportToExcel(grdMain, ExportList, FShowExcel);

  finally
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure TfmCurrency.grdRateCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.grdRateCustomDrawCell') else _udebug := nil;{$ENDIF}

  if UseGridOddColor and not ASelected and Odd(ANode.AbsoluteIndex) then AColor := GridOddLinesColor;

  if not ASelected and (((colOnDate.Sorted = csDown) and (ANode.AbsoluteIndex = 0))
        or ((colOnDate.Sorted = csUp) and (ANode.AbsoluteIndex = grdRate.Count - 1)))
  then AFont.Color := DefaultColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCurrency.FrameResize(Sender: TObject);
  var
    AStyle: Integer;
    Offset: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.FrameResize') else _udebug := nil;{$ENDIF}

  inherited;
  AStyle := GetWindowLong(grdMain.Handle, GWL_STYLE);

  if AStyle and WS_VSCROLL = WS_VSCROLL
    then Offset := 19
    else Offset := 2;

  colVName.Width := grdMain.Width - colVShortName.Width - colVOnDate.Width
    - Offset - colVOnValue.Width - colRepShortName.Width - colRepFracName.Width - colVBase.Width;

  grdMain.Bands[0].Width := grdMain.Width - grdMain.Bands[1].Width;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCurrency.aSelectAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.aSelectAllExecute') else _udebug := nil;{$ENDIF}

  if pcMain.ActivePage = tsMain
    then grdMain.SelectAll
    else grdRate.SelectAll;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCurrency.grdMainSelectedCountChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.grdMainSelectedCountChange') else _udebug := nil;{$ENDIF}

  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmCurrency.NotifyChanged;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmCurrency.NotifyChanged') else _udebug := nil;{$ENDIF}

  if not JumpFromBuffer
    then frmMainForm.AddToBuffer(vtRefs, FunID, Self.Caption, ClassName, Tag, FCurrentID, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fCurrency', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
