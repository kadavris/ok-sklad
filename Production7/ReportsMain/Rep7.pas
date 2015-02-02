{$I ok_sklad.inc}
unit Rep7; // ведомость материальных остатков

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseRepWithPeriod, FR_DSet, FR_DBSet, DB, DBClient,
  ssClientDataSet, FR_Chart, FR_ChBox, FR_Class, ActnList, ssFormStorage,
  ImgList, xButton, ssPanel, ssGradientPanel, dxTL6, dxDBCtrl6, dxCntner6,
  dxDBTL6, ssPeriod, okPeriod, StdCtrls, ExtCtrls, ssBevel, ssSpeedButton,
  cxDropDownEdit, ssPopupTreeEdit, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, ssDBLookupCombo, cxSpinEdit, cxCheckBox,
  cxRadioGroup, cxTL, ssBaseConst, Grids, DBGrids, cxGroupBox, ssGroupBox,
  cxCalendar, BaseRep, ssMemDS;

type
  TfrmRep7 = class(TfrmBaseRep)
    ActionList1: TActionList;
    aRef: TAction;
    btnAddMG: TssSpeedButton;
    btnAddWHouse: TssSpeedButton;
    btnDrillDown: TssSpeedButton;
    cdsMatGroup: TssClientDataSet;
    cdsPriceTypes: TssClientDataSet;
    cdsWhouse: TssClientDataSet;
    cdsWhouseADDR: TStringField;
    cdsWhouseDELETED: TIntegerField;
    cdsWhouseNAME: TStringField;
    cdsWhouseNOTES: TStringField;
    cdsWhouseWID: TIntegerField;
    chbPrintArtikuls: TcxCheckBox;
    chbShowAcc: TcxCheckBox;
    dsMatGroup: TDataSource;
    dsWhouse: TDataSource;
    edMatGroup: TssPopupTreeEdit;
    edOnDate: TcxDateEdit;
    gb7PriceTypes: TssGroupBox;
    gbGrp: TssGroupBox;
    lcbPriceTypes: TssDBLookupCombo;
    lcbWHouse: TssDBLookupCombo;
    lMatGroup: TLabel;
    lOnDate: TLabel;
    lWhouse: TLabel;
    rbt7DefPrice: TcxRadioButton;
    rbt7PriceType: TcxRadioButton;
    rbtByGrp: TcxRadioButton;
    rbtByProducer: TcxRadioButton;
    rbtNoGrp: TcxRadioButton;
    srcPriceTypes: TDataSource;

    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aRefExecute(Sender: TObject);
    procedure btnAddMGMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnAddWHouseMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnAddWHouseMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure cdsPriceTypesAfterOpen(DataSet: TDataSet);
    procedure cdsWhouseBeforeOpen(DataSet: TDataSet);
    procedure edMatGroupGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
    procedure edMatGroupPropertiesChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure frReport1GetValue(const ParName: String; var ParValue: Variant);
    procedure lcbWHouseEnter(Sender: TObject);
    procedure lcbWHouseExit(Sender: TObject);
    procedure rbt7DefPriceClick(Sender: TObject);

  protected
    procedure SetOnDate(const Value: TDateTime); override;

  private
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;

  public
    procedure SetCaptions; override;

  end;

var
  frmRep7: TfrmRep7;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  prConst, ClientData, ssFun, prFun, prTypes, ssDateUtils, ssRegUtils, udebug, StrUtils, MetaProduct;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}

{ TfrmRep14 }

//==============================================================================================
procedure TfrmRep7.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep7.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    edMatGroup.Text := GetRS('fmAllReports', 'allselect');
    lWhouse.Caption := GetRS('fmAllReports', 'whouse') + ':';
    lMatGroup.Caption := GetRS('fmAllReports', 'matgrp') + ':';
    lOnDate.Caption := GetRS('fmPayDoc', 'Date') + ':';

    btnAddMG.Hint := GetRS('fmMaterials', 'MatGroups');
    btnDrillDown.Hint := GetRS('fmAllReports', 'DrillDown');
    btnAddWHouse.Hint := GetRS('fmAllReports', 'WMat');

    chbPrintArtikuls.Properties.Caption := GetRS('fmAllReports', 'PrintArtikuls');
    chbShowAcc.Properties.Caption := GetRS('fmAllReports', 'ShowAcc');

    rbt7DefPrice.Caption := GetRS('fmAllReports', 'PutInPrices');
    rbt7PriceType.Caption := GetRS('fmAllReports', 'PutOutPrices');
    gb7PriceTypes.Caption := ' ' + GetRS('fmAllReports', 'Prices') + ' ';

    gbGrp.Caption := ' ' + GetRS('fmAllReports', 'Grp') + ' ';
    rbtByGrp.Caption := GetRS('fmAllReports', 'ByGrp');
    rbtByProducer.Caption := GetRS('fmAllReports', 'ByProducer');
    rbtNoGrp.Caption := GetRS('fmAllReports', 'NoGrp');

  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep7.FormCreate(Sender: TObject);
  var
    intTmp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep7.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  cdsMatGroup.Open;
  cdsWhouse.Open;
  cdsPriceTypes.Open;
  edMatGroup.Tag := 10;

  if ReadFromRegInt(MainRegKey + '\' + Self.Name + '\' + edMatGroup.Name, 'Value', intTmp) then begin
    edMatGroup.Value := intTmp;

    if intTmp = 0 then begin
      edMatGroup.Text := rs('Common', 'All');
      edMatGroup.Tag := 10;
    end;
  end;

  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'PrintArtikuls', intTmp)
    then chbPrintArtikuls.Checked := intTmp = 1;

  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'ShowAcc', intTmp)
    then chbShowAcc.Checked := intTmp = 1;

  btnAddWHouse.ImageIndex := 26;
  btnAddMG.ImageIndex := 48;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep7.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    m, n: string;
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep7.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult = mrOk then begin
    CanClose := False;

    Application.ProcessMessages;

    m := '';

    if edOnDate.EditingText <> ''
      then ToDate := LastSecondInDay(edOnDate.Date)
      else ToDate := MaxDateTime;

    with cdsDetail do begin //Считываем остатки на дату
      Close;
      ProviderName := 'pRep_RestOnDateMaster1';
      Params.Clear;
      Macros.Clear;
      FetchParams;

      {Товарная группа и склад?}
      if lcbWHouse.KeyValue > 0
        then Params.ParamByName('wid').AsInteger := lcbWHouse.KeyValue
        else Params.ParamByName('wid').AsInteger := 0;

      Params.ParamByName('wh').AsString := AllowedWH;

      if edMatGroup.Tag <> 10 then begin
        if btnDrillDown.Checked
          then Params.ParamByName('grp').AsString := GetDrillDownList(dmData.SConnection, 'matgroup', 'grpid', 'pid', edMatGroup.Value)
          else Params.ParamByName('grp').AsString := IntToStr(edMatGroup.Value);
      end
      else Params.ParamByName('grp').AsString := '';

      if rbt7PriceType.Checked
        then Params.ParamByName('ptypeid').AsInteger := lcbPriceTypes.KeyValue
        else Params.ParamByName('ptypeid').AsInteger := 0;

      Params.ParamByName('ondate').AsDateTime := ToDate;
      Params.ParamByName('getacc').AsInteger := Integer(chbShowAcc.Checked);
      Open;
      CopyDataSet(cdsMaster, cdsDetail);
      Close;
    end;//with cdsMaster

    if rbtByGrp.Checked or rbtByProducer.Checked then begin
      //Получаем список мат. групп
      with newDataSet do
      try
        if rbtByGrp.Checked
          then ProviderName := 'pRep_MGList'
          else ProviderName := 'pRep7_Producers';

        FetchParams;
        Open;
        while not Eof do begin
          cdsMaster.Append;

          if rbtByProducer.Checked then begin
            //cdsMaster.FieldByName('matid').AsInteger := FieldByName('matid').AsInteger;
            cdsMaster.FieldByName('matid').AsInteger := -(RecNo + 1);
            cdsMaster.FieldByName('grpid').AsInteger := -(RecNo + 1);
          end
          else begin
            cdsMaster.FieldByName('matid').AsInteger := FieldByName('matid').AsInteger;
            cdsMaster.FieldByName('grpid').AsInteger := FieldByName('grpid').AsInteger;
          end;

          cdsMaster.FieldByName('matname').AsString := FieldByName('matname').AsString;
          cdsMaster.FieldByName('del').AsInteger := 1;
          cdsMaster.FieldByName('msrname').AsString := '*';
          cdsMaster.Post;
          Next;
        end;

        if rbtByProducer.Checked then begin
          cdsMaster.First;

          while not cdsMaster.Eof do begin
            if cdsMaster.FieldByName('del').AsInteger = 0 then begin
              if Locate('matname', cdsMaster.FieldByName('producer').AsString, []) then begin
                cdsMaster.Edit;
                cdsMaster.FieldByName('grpid').AsInteger := -(RecNo + 1);//FieldByName('matid').AsInteger;
                cdsMaster.Post;
              end;
            end;

            cdsMaster.Next;
          end;
        end;

      finally
        Close;
        Free;
      end;

      colAmount.FieldName := 'rest';
      colRsv.FieldName := 'rsv';
      colSummdef.FieldName := 'summrest';
      colArtikul.FieldName := 'artikul';
      colPrib.FieldName := 'accsum';
      colProducer.FieldName := 'producer';

      {$IFDEF CBL}
      colNotes.FieldName := 'notes';
      colGTD.FieldName := 'gtd';
      colCertNum.FieldName := 'certnum';
      colPosDate.FieldName := 'posdate';
      colWRNum.FieldName := 'wrnum';
      {$ENDIF}

      dbgRef.DataSource := dsMaster;

      colMatName.Sorted := csUp;
      cdsMaster.DisableControls;

      for i := 0 to dbgRef.Count - 1 do
        if HasMat(dbgRef.Items[i]) then SetDel0(dbgRef.Items[i]);

      //Удаление "лишних" позиций
      cdsMaster.First;
      while not cdsMaster.Eof do begin
        if cdsMaster.FieldByName('del').AsInteger = 1
          then cdsMaster.Delete
          else cdsMaster.Next;
      end;

      cdsMaster.EnableControls;//Для treelista
      cdsMaster.DisableControls;

      while not cdsMaster.IsEmpty do cdsMaster.Delete;

      //Запись в cdsMaster
      for i := 0 to dbgRef.Count - 1 do WriteNode(dbgRef.Items[i]);

      cdsMaster.EnableControls;
    end;//if chbGrpBy.Checked

    dbgRef.DataSource := nil;

    SmartShowRep(frReport1, 'RepMatRest.frf');
  end
  else CanClose := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep7.frReport1GetValue(const ParName: String; var ParValue: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep7.frReport1GetValue') else _udebug := nil;{$ENDIF}

  inherited;

  if 0 = AnsiCompareText(ParName, 'matgrp') then ParValue := edMatGroup.EditingText
  else if 0 = AnsiCompareText(ParName, 'whname') then ParValue := lcbWHouse.Text
  else if 0 = AnsiCompareText(ParName, 'printartikuls') then ParValue := Integer(chbPrintArtikuls.Checked)
  else if 0 = AnsiCompareText(ParName, 'showacc') then ParValue := Integer(chbShowAcc.Checked)
  else if AnsiStartsText('ProdCustAttr', ParName) then ParValue := getProdCustAttr(cdsMaster.fieldbyname('matid').AsInteger, ParName)
  else if 0 = AnsiCompareText(ParName, 'koef') then begin
    if RoundToA(cdsMaster.FieldByName('summin').AsFloat, -2) <> 0
      then ParValue := cdsMaster.FieldByName('koef').AsFloat
      else ParValue := Null;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep7.edMatGroupGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep7.edMatGroupGetNodeImageIndex') else _udebug := nil;{$ENDIF}

  if ANode.Expanded
    then AIndex := 49
    else AIndex := 48;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep7.edMatGroupPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep7.edMatGroupPropertiesChange') else _udebug := nil;{$ENDIF}

  if edMatGroup.EditingText = '' then begin
    edMatGroup.Text := rs('fmAllReports', 'allselect');
    edMatGroup.Value := 0;
    edMatGroup.Tag := 10;
  end
  else edMatGroup.Tag := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep7.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep7.ActionListUpdate') else _udebug := nil;{$ENDIF}

  inherited;

  btnDrillDown.Enabled := edMatGroup.Value > 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep7.aRefExecute(Sender: TObject);
  var
    FID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep7.aRefExecute') else _udebug := nil;{$ENDIF}

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
procedure TfrmRep7.lcbWHouseEnter(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep7.lcbWHouseEnter') else _udebug := nil;{$ENDIF}

  FCurCtrl := Sender as TControl;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep7.lcbWHouseExit(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep7.lcbWHouseExit') else _udebug := nil;{$ENDIF}

  FCurCtrl := nil;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep7.btnAddWHouseMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep7.btnAddWHouseMouseDown') else _udebug := nil;{$ENDIF}

  FCurCtrl := lcbWHouse;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep7.btnAddWHouseMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep7.btnAddWHouseMouseUp') else _udebug := nil;{$ENDIF}

  FCurCtrl := nil;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep7.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep7.WMRefresh') else _udebug := nil;{$ENDIF}

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
procedure TfrmRep7.btnAddMGMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep7.btnAddMGMouseDown') else _udebug := nil;{$ENDIF}

  FCurCtrl := edMatGroup;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep7.SetOnDate(const Value: TDateTime);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep7.SetOnDate') else _udebug := nil;{$ENDIF}

  inherited;

  edOnDate.Date := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep7.rbt7DefPriceClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep7.rbt7DefPriceClick') else _udebug := nil;{$ENDIF}

  lcbPriceTypes.Enabled := rbt7PriceType.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep7.cdsPriceTypesAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep7.cdsPriceTypesAfterOpen') else _udebug := nil;{$ENDIF}

  cdsPriceTypes.Locate('def', 1, []);
  lcbPriceTypes.KeyValue := cdsPriceTypes.FieldByName('ptypeid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep7.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep7.FormDestroy') else _udebug := nil;{$ENDIF}

  WriteToRegInt(MainRegKey + '\' + Self.Name + '\' + edMatGroup.Name, 'Value', edMatGroup.Value);
  WriteToRegInt(MainRegKey + '\' + Self.Name, 'PrintArtikuls', Integer(chbPrintArtikuls.Checked));
  WriteToRegInt(MainRegKey + '\' + Self.Name, 'ShowAcc', Integer(chbShowAcc.Checked));

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep7.cdsWhouseBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep7.cdsWhouseBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsWHouse.Macros.ParamByName('m').AsString := WHAccessMacro;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('Rep7', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
