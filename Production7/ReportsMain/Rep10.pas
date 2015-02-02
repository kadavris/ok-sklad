{$I ok_sklad.inc}
unit Rep10; // оборотная ведомость товара

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseRepWithPeriod, FR_DSet, FR_DBSet, DB, DBClient,
  ssClientDataSet, FR_Chart, FR_ChBox, FR_Class, ActnList, ssFormStorage,
  ImgList, xButton, ssPanel, ssGradientPanel, ssPeriod, okPeriod, dxTL6,
  dxDBCtrl6, dxCntner6, dxDBTL6, StdCtrls, ExtCtrls, ssSpeedButton, ssBevel,
  cxDropDownEdit, ssPopupTreeEdit, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, ssDBLookupCombo, cxCheckBox, ssBaseConst, Grids,
  DBGrids, cxTL, ssMemDS;

type
  TfrmRep10 = class(TfrmBaseRepWithPeriod)
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
    chbGrpBy: TcxCheckBox;
    chbPriceType: TcxCheckBox;
    chbShowNullMats: TcxCheckBox;
    dsMatGroup: TDataSource;
    dsWhouse: TDataSource;
    edMatGroup: TssPopupTreeEdit;
    lcbPriceTypes: TssDBLookupCombo;
    lcbWHouse: TssDBLookupCombo;
    lMatGroup: TLabel;
    lWhouse: TLabel;
    sbAddWHouse: TssSpeedButton;
    srcPriceTypes: TDataSource;

    procedure aCurActionExecute(Sender: TObject);
    procedure btnAddMGClick(Sender: TObject);
    procedure cdsWhouseBeforeOpen(DataSet: TDataSet);
    procedure chbPriceTypePropertiesChange(Sender: TObject);
    procedure edMatGroupGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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
  frmRep10: TfrmRep10;

implementation

uses
  prConst, prTypes, prFun, ssFun, ClientData, BaseRep, ssDateUtils, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

{ TfrmRep10 }
//==============================================================================================
procedure TfrmRep10.SetRepID(const Value: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep10.SetRepID') else _udebug := nil;{$ENDIF}

  inherited;

  cdsWhouse.Open;
  cdsMatGroup.Open;
  lcbWHouse.Text := '';
  cdsPriceTypes.Open;

  with LangMan do begin
    lTextNotes.Caption := GetRS('fmAllReports', 'RepMatTurnText1') + #13#10 +
          GetRS('fmAllReports', 'RepWBInText4') + #13#10 + GetRS('fmAllReports', 'RepWBInText2');
  end;//with

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep10.sbAddWHouseClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep10.sbAddWHouseClick') else _udebug := nil;{$ENDIF}

  inherited;

  FCurCtrl := lcbWHouse;
  aCurAction.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep10.btnAddMGClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep10.btnAddMGClick') else _udebug := nil;{$ENDIF}

  inherited;

  FCurCtrl := edMatGroup;
  aCurAction.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep10.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep10.WMRefresh') else _udebug := nil;{$ENDIF}

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
        end;//if
      end;//rtmat
  end;//case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep10.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep10.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    lWhouse.Caption := GetRS('fmAllReports', 'whouse') + ':';
    sbAddWHouse.Hint := GetRS('fmAllReports', 'WMat');
    lMatGroup.Caption := GetRS('fmAllReports', 'matgrp') + ':';
    btnAddMG.Hint := GetRS('fmMaterials', 'MatGroups');
    btnDrillDown.Hint := GetRS('fmAllReports', 'DrillDown');
    chbShowNullMats.Properties.Caption := GetRS('fmAllReports', 'ShowNullMats');
    chbGrpBy.Properties.Caption := GetRS('fmAllReports', 'GprBy');
    chbPriceType.Properties.Caption := GetRS('fmAllReports', 'PutOutPrices');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep10.aCurActionExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep10.aCurActionExecute') else _udebug := nil;{$ENDIF}

  inherited;

  if FCurCtrl = edMatGroup then ShowModalRef(Self, rtMatGroup, vtMatGroup, 'TfmMatGroup', Self.OnDate,edMatGroup.Value)
  else if FCurCtrl = lcbWHouse then ShowModalRef(Self, rtWHouse, vtWHouse, 'TfmWHouse', Self.OnDate,lcbWHouse.KeyValue)
  else if (FCurCtrl is TcxCheckBox)
  then with (FCurCtrl as TcxCheckBox) do Checked := not Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep10.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    w: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep10.FormCloseQuery') else _udebug := nil;{$ENDIF}

  inherited;

  if ModalResult = mrOK then begin
    CanClose := False;
    Screen.Cursor := crSQLWait;

    //Остаток на начало периода
    with newDataSet do try
      Close;
      ProviderName := 'pRep10_1';
      FetchMacros;

      w := WHAccessMacro('pr.wid');

      if not chbShowNullMats.Checked
        then Macros.ParamByName('p').AsString := 'having sum(pr.remain) > 0'
        else Macros.ParamByName('p').AsString := '';

      if (lcbWHouse.KeyValue > 0) and (lcbWHouse.Text <> '')
        then Macros.ParamByName('w').AsString := ' and pr.wid=' + IntToStr(lcbWHouse.KeyValue) + ' ' + w
        else Macros.ParamByName('w').AsString := w;

      if (edMatGroup.Value > 0) and (edMatGroup.Text <> '') then begin
        if btnDrillDown.Checked
        then Macros.ParamByName('g').AsString := ' and mats.grpid in (' +
             GetDrillDownList(dmData.SConnection, 'matgroup', 'grpid', 'pid', edMatGroup.Value) + ')'
        else Macros.ParamByName('g').AsString := ' and mats.grpid=' + IntToStr(edMatGroup.Value)
      end
      else Macros.ParamByName('g').AsString := '';

      Macros.ParamByName('e').AsString := '';
      FetchParams;

      if (chbPriceType.Checked)and(lcbPriceTypes.KeyValue > 0)
        then Params.ParamByName('ptype').AsInteger := lcbPriceTypes.KeyValue
        else Params.ParamByName('ptype').AsInteger := 0;

      Params.ParamByName('ondate').AsDateTime := prdMain.FromDate;
      Open;

      CopyDataSet(cdsMaster, Fields[0].DataSet);

      Close;
      Free;
      
    except
      Free;
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;//with newDataset do try

    try
      with cdsDetail do begin
        //Приход за период
        Close;
        ProviderName := 'pRep10_2';
        FetchMacros;

        w := WHAccessMacro('wmt.wid');

        if (edMatGroup.Value > 0) and (edMatGroup.Text <> '') then begin
          if btnDrillDown.Checked
          then Macros.ParamByName('g').AsString := ' and mats.grpid in (' +
               GetDrillDownList(dmData.SConnection, 'matgroup', 'grpid', 'pid', edMatGroup.Value) + ')'
          else Macros.ParamByName('g').AsString := ' and mats.grpid='+inttostr(edMatGroup.Value)
        end
        else Macros.ParamByName('g').AsString := '';

        if (lcbWHouse.KeyValue > 0) and (lcbWHouse.Text <> '') then begin
          Macros.ParamByName('w').AsString := ' and wmt.wid='+inttostr(lcbWHouse.KeyValue)+' ' + w;
          Macros.ParamByName('s').AsString := '';
        end
        else begin
          Macros.ParamByName('w').AsString := w;
          Macros.ParamByName('s').AsString := ' and wbls.wtype<>4 ';
        end;

        FetchParams;

        if (chbPriceType.Checked) and (lcbPriceTypes.KeyValue > 0)
          then Params.ParamByName('ptype').AsInteger := lcbPriceTypes.KeyValue
          else Params.ParamByName('ptype').AsInteger := 0;

        Params.ParamByName('turntype').AsInteger := 1;//приход
        Params.ParamByName('fromdate').AsDateTime := prdMain.FromDate;
        Params.ParamByName('todate').AsDateTime := LastSecondInDay(prdMain.ToDate);

        Open;
        First;
        while not Eof do begin
          if cdsMaster.Locate('matid',FieldByName('matid').AsInteger,[]) then begin
            cdsMaster.Edit;
            cdsMaster.FieldByName('rest2').AsFloat := FieldByName('rest').AsFloat;
            cdsMaster.FieldByName('summrest2').AsFloat := FieldByName('summrest').AsFloat;
          end
          else begin
            cdsMaster.Append;
            cdsMaster.FieldByName('matid').AsInteger := FieldByName('matid').AsInteger;
            cdsMaster.FieldByName('matname').AsString := FieldByName('matname').AsString;
            cdsMaster.FieldByName('grpid').AsInteger := FieldByName('grpid').AsInteger;
            cdsMaster.FieldByName('grpname').AsString := FieldByName('grpname').AsString;
            cdsMaster.FieldByName('msrname').AsString := FieldByName('msrname').AsString;
            cdsMaster.FieldByName('rest1').AsFloat := 0;
            cdsMaster.FieldByName('summrest1').AsFloat := 0;
            cdsMaster.FieldByName('rest2').AsFloat := FieldByName('rest').AsFloat;
            cdsMaster.FieldByName('summrest2').AsFloat := FieldByName('summrest').AsFloat;
            cdsMaster.FieldByName('rest3').AsFloat := 0;
            cdsMaster.FieldByName('summrest3').AsFloat := 0;
            cdsMaster.FieldByName('rest4').AsFloat := 0;
            cdsMaster.FieldByName('summrest4').AsFloat := 0;
            cdsMaster.FieldByName('pricein').AsFloat := 0;
            cdsMaster.FieldByName('priceout').AsFloat := 0;
            cdsMaster.FieldByName('summin').AsFloat := 0;
          end;

          cdsMaster.FieldByName('priceout').AsFloat :=
            (cdsMaster.FieldByName('summrest1').AsFloat + cdsMaster.FieldByName('summrest2').AsFloat) /
            (cdsMaster.FieldByName('rest1').AsFloat + cdsMaster.FieldByName('rest2').AsFloat);

          cdsMaster.FieldByName('pricein').AsFloat :=
            (cdsMaster.FieldByName('summin').AsFloat + FieldByName('summin').AsFloat) /
            (cdsMaster.FieldByName('rest1').AsFloat + cdsMaster.FieldByName('rest2').AsFloat);

          cdsMaster.Post;
          Next;
        end;//while not Eof do begin

        Close;

        //Расход за период
        ProviderName := 'pRep10_2';
        FetchMacros;

        if (edMatGroup.Value > 0) and (edMatGroup.Text <> '') then begin
          if btnDrillDown.Checked
          then Macros.ParamByName('g').AsString := ' and mats.grpid in ('
               + GetDrillDownList(dmData.SConnection, 'matgroup', 'grpid', 'pid', edMatGroup.Value) + ')'
          else Macros.ParamByName('g').AsString := ' and mats.grpid=' + inttostr(edMatGroup.Value)
        end
        else Macros.ParamByName('g').AsString := '';

        if (lcbWHouse.KeyValue > 0) and (lcbWHouse.Text <> '') then begin
          Macros.ParamByName('w').AsString := ' and wmt.wid=' + inttostr(lcbWHouse.KeyValue) + ' ' + w;
          Macros.ParamByName('s').AsString := '';
        end
        else begin
          Macros.ParamByName('w').AsString := w;
          Macros.ParamByName('s').AsString := ' and wbls.wtype<>4 ';
        end;

        FetchParams;

        if (chbPriceType.Checked)and(lcbPriceTypes.KeyValue > 0)
          then Params.ParamByName('ptype').AsInteger := lcbPriceTypes.KeyValue
          else Params.ParamByName('ptype').AsInteger := 0;

        Params.ParamByName('turntype').AsInteger := -1;//Расход
        Params.ParamByName('fromdate').AsDateTime := prdMain.FromDate;
        Params.ParamByName('todate').AsDateTime := LastSecondInDay(prdMain.ToDate);

        Open;
        First;
        while not Eof do begin
          if cdsMaster.Locate('matid',FieldByName('matid').AsInteger,[]) then begin
            cdsMaster.Edit;
            cdsMaster.FieldByName('rest3').AsFloat := FieldByName('rest').AsFloat;
            cdsMaster.FieldByName('summrest3').AsFloat := FieldByName('summrest').AsFloat;
          end
          else begin
            cdsMaster.Append;
            cdsMaster.FieldByName('matid').AsInteger := FieldByName('matid').AsInteger;
            cdsMaster.FieldByName('matname').AsString := FieldByName('matname').AsString;
            cdsMaster.FieldByName('grpid').AsInteger := FieldByName('grpid').AsInteger;
            cdsMaster.FieldByName('grpname').AsString := FieldByName('grpname').AsString;
            cdsMaster.FieldByName('msrname').AsString := FieldByName('msrname').AsString;
            cdsMaster.FieldByName('rest1').AsFloat := 0;
            cdsMaster.FieldByName('summrest1').AsFloat := 0;
            cdsMaster.FieldByName('rest2').AsFloat := 0;
            cdsMaster.FieldByName('summrest2').AsFloat := 0;
            cdsMaster.FieldByName('rest3').AsFloat := FieldByName('rest').AsFloat;
            cdsMaster.FieldByName('summrest3').AsFloat := FieldByName('summrest').AsFloat;
            cdsMaster.FieldByName('rest4').AsFloat := 0;
            cdsMaster.FieldByName('summrest4').AsFloat := 0;
            cdsMaster.FieldByName('pricein').AsFloat := 0;
            cdsMaster.FieldByName('priceout').AsFloat := 0;
            cdsMaster.FieldByName('summin').AsFloat := 0;

          end;
          cdsMaster.Post;
          Next;
        end;//while not Eof do begin
        Close;

        //Остаток на конец периода
        ProviderName := 'pRep10_1';
        FetchMacros;
        w := WHAccessMacro('pr.wid');

        if not chbShowNullMats.Checked
          then Macros.ParamByName('p').AsString := 'having sum(pr.remain)>0'
          else Macros.ParamByName('p').AsString := '';

        if (lcbWHouse.KeyValue > 0) and (lcbWHouse.Text <> '')
          then Macros.ParamByName('w').AsString := ' and pr.wid=' + inttostr(lcbWHouse.KeyValue)+' '+w
          else Macros.ParamByName('w').AsString := w;

        if (edMatGroup.Value > 0) and (edMatGroup.Text <> '') then begin
          if btnDrillDown.Checked
          then Macros.ParamByName('g').AsString := ' and mats.grpid in ('+
               GetDrillDownList(dmData.SConnection, 'matgroup', 'grpid', 'pid', edMatGroup.Value)+ ')'
          else Macros.ParamByName('g').AsString := ' and mats.grpid='+inttostr(edMatGroup.Value)
        end
        else Macros.ParamByName('g').AsString := '';

        Macros.ParamByName('e').AsString := '=';
        FetchParams;

        if (chbPriceType.Checked)and(lcbPriceTypes.KeyValue>0)
          then Params.ParamByName('ptype').AsInteger := lcbPriceTypes.KeyValue
          else Params.ParamByName('ptype').AsInteger := 0;

        Params.ParamByName('ondate').AsDateTime := prdMain.ToDate;
        Open;
        First;
        while not Eof do begin
          if cdsMaster.Locate('matid',FieldByName('matid').AsInteger,[]) then begin
            cdsMaster.Edit;
            cdsMaster.FieldByName('rest4').AsFloat := FieldByName('rest1').AsFloat;
            cdsMaster.FieldByName('summrest4').AsFloat := FieldByName('summrest1').AsFloat;
            cdsMaster.FieldByName('priceout').AsFloat := FieldByName('priceout').AsFloat;
            cdsMaster.FieldByName('pricein').AsFloat := FieldByName('pricein').AsFloat;
          end
          else begin
            cdsMaster.Append;
            cdsMaster.FieldByName('matid').AsInteger := FieldByName('matid').AsInteger;
            cdsMaster.FieldByName('matname').AsString := FieldByName('matname').AsString;
            cdsMaster.FieldByName('grpid').AsInteger := FieldByName('grpid').AsInteger;
            cdsMaster.FieldByName('grpname').AsString := FieldByName('grpname').AsString;
            cdsMaster.FieldByName('msrname').AsString := FieldByName('msrname').AsString;
            cdsMaster.FieldByName('rest1').AsFloat := 0;
            cdsMaster.FieldByName('summrest1').AsFloat := 0;
            cdsMaster.FieldByName('rest2').AsFloat := 0;
            cdsMaster.FieldByName('summrest2').AsFloat := 0;
            cdsMaster.FieldByName('rest3').AsFloat := 0;
            cdsMaster.FieldByName('summrest3').AsFloat := 0;
            cdsMaster.FieldByName('rest4').AsFloat := FieldByName('rest1').AsFloat;
            cdsMaster.FieldByName('summrest4').AsFloat := FieldByName('summrest1').AsFloat;
            cdsMaster.FieldByName('priceout').AsFloat := FieldByName('priceout').AsFloat;
            cdsMaster.FieldByName('pricein').AsFloat := FieldByName('pricein').AsFloat;
          end;
          cdsMaster.Post;
          Next;
        end;//while not Eof do begin
        Close;
      end;//with cdsDetail

      with TssMemoryData.Create(nil) do
      try
        CopyStructure(cdsMaster.Fields[0].DataSet);
        LoadFromDataSet(cdsMaster.Fields[0].DataSet, 0,lmAppend);

        if chbGrpBy.Checked
          then SortOnFields('grpname;grpid')
          else SortOnFields('matname;matid');

        cdsMaster.EmptyTable;
        First;
        while not eof do begin
          cdsMaster.Append;
          cdsMaster.FieldByName('matid').AsInteger   := FieldByName('matid').AsInteger;
          cdsMaster.FieldByName('matname').AsString  := FieldByName('matname').AsString;
          cdsMaster.FieldByName('grpid').AsInteger   := FieldByName('grpid').AsInteger;
          cdsMaster.FieldByName('grpname').AsString  := FieldByName('grpname').AsString;
          cdsMaster.FieldByName('msrname').AsString  := FieldByName('msrname').AsString;
          cdsMaster.FieldByName('rest1').AsFloat     := FieldByName('rest1').AsFloat;
          cdsMaster.FieldByName('summrest1').AsFloat := FieldByName('summrest1').AsFloat;
          cdsMaster.FieldByName('rest2').AsFloat     := FieldByName('rest2').AsFloat;
          cdsMaster.FieldByName('summrest2').AsFloat := FieldByName('summrest2').AsFloat;
          cdsMaster.FieldByName('rest3').AsFloat     := FieldByName('rest3').AsFloat;
          cdsMaster.FieldByName('summrest3').AsFloat := FieldByName('summrest3').AsFloat;
          cdsMaster.FieldByName('rest4').AsFloat     := FieldByName('rest4').AsFloat;
          cdsMaster.FieldByName('summrest4').AsFloat := FieldByName('summrest4').AsFloat;
          cdsMaster.FieldByName('pricein').AsFloat   := FieldByName('pricein').AsFloat;
          cdsMaster.FieldByName('priceout').AsFloat  := FieldByName('priceout').AsFloat;
          cdsMaster.Post;
          Delete;
        end;
        Close;

      finally
        Free;
      end;

      if chbGrpBy.Checked
        then SmartShowRep(frReport1, 'Rep10_1.frf')
        else SmartShowRep(frReport1, 'Rep10.frf');

      cdsMaster.Close;

    finally
      Screen.Cursor := crDefault;
    end;
  end
  else CanClose := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep10.frReport1GetValue(const ParName: String; var ParValue: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep10.frReport1GetValue') else _udebug := nil;{$ENDIF}

  inherited;
  if 0 = AnsiCompareText(ParName, 'MATGRP') then ParValue := edMatGroup.Text
  else if 0 = AnsiCompareText(ParName, 'WHNAME') then ParValue := lcbWHouse.Text
  else if 0 = AnsiCompareText(ParName, 'GRPCOLOR') then ParValue := PLGrpColor
  else if 0 = AnsiCompareText(ParName, 'PRICETYPE') then begin
   if (chbPriceType.Checked) and (lcbPriceTypes.KeyValue > 0) and (lcbPriceTypes.Text <> '')
     then ParValue := lcbPriceTypes.Text
     else ParValue := '';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep10.chbPriceTypePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep10.chbPriceTypePropertiesChange') else _udebug := nil;{$ENDIF}

  inherited;
  lcbPriceTypes.Enabled := (chbPriceType.Checked);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep10.edMatGroupGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep10.edMatGroupGetNodeImageIndex') else _udebug := nil;{$ENDIF}

  inherited;

  if ANode.Expanded
    then AIndex := 49
    else AIndex := 48;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep10.cdsWhouseBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep10.cdsWhouseBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsWHouse.Macros.ParamByName('m').AsString := WHAccessMacro;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('Rep10', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
