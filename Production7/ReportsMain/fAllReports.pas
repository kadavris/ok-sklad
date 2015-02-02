{$I ok_sklad.inc}
unit fAllReports;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Menus, ActnList, DB, DBClient, DbChart, ExtCtrls, Grids, DBGrids, StdCtrls,

  BaseFrame, ssBaseConst, ssBaseTypes, ssClientDataSet, ssDataSource, ssBevel, ssMemDS,
  xLngDefs,

  dxTL6, dxDBCtrl6, dxDBGrid6, dxCntner6, dxDBTLCl6, dxGrClms6, dxmdaset, dxDBTL6,

  TB2Item, TeeProcs, TeEngine, Chart, Series,
  FR_ChBox, FR_E_TXT, FR_Chart, FR_Class, FR_DSet, FR_DBSet, frXMLExl, frOLEExl;

type
  TfmAllReports = class(TssBaseFrame)
    bvlTop: TssBevel;
    cdsDetail2: TssClientDataSet;
    cdsDetail: TssClientDataSet;
    cdsMaster2: TssMemoryData;
    cdsMaster: TssMemoryData;
    cdsReports: TssClientDataSet;
    cdsSubDetail: TssMemoryData;
    cdsSubDetailFetch: TssClientDataSet;
    colAmount: TdxDBTreeListColumn;
    colArtikul: TdxDBTreeListColumn;
    colDocImg: TdxDBGridImageColumn;
    colGrpId: TdxDBTreeListColumn;
    colKoef: TdxDBTreeListColumn;
    colKoefNDS: TdxDBTreeListColumn;
    colMatId: TdxDBTreeListColumn;
    colMatName: TdxDBTreeListColumn;
    colMsrName: TdxDBTreeListColumn;
    colNdsDif: TdxDBTreeListColumn;
    colNDSIn: TdxDBTreeListColumn;
    colNdsOut: TdxDBTreeListColumn;
    colPrib: TdxDBTreeListColumn;
    colPribNDS: TdxDBTreeListColumn;
    colProducer: TdxDBTreeListColumn;
    colRepName: TdxDBGridColumn;
    colRsv: TdxDBTreeListColumn;
    colSummdef: TdxDBTreeListColumn;
    colSummIn: TdxDBTreeListColumn;
    DBChart1: TDBChart;
    dbgRef: TdxDBTreeList;
    dbgReports: TdxDBGrid;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    dsDetail2: TDataSource;
    dsDetail: TDataSource;
    dsMaster2: TDataSource;
    dsMaster: TDataSource;
    dsReports: TssDataSource;
    dsSubDetail: TDataSource;
    frChartObject1: TfrChartObject;
    frCheckBoxObject1: TfrCheckBoxObject;
    frDBDSDetail2: TfrDBDataSet;
    frDBDSDetail: TfrDBDataSet;
    frDBDSMaster2: TfrDBDataSet;
    frDBDSMaster: TfrDBDataSet;
    frDBDSSubDetail: TfrDBDataSet;
    frReport1: TfrReport;
    PanMaster: TPanel;
    ssBevel4: TssBevel;
    ssBevel8: TssBevel;
    TBItem5: TTBItem;
    tmpDS: TssClientDataSet;

    procedure aRefreshExecute(Sender: TObject);
    procedure cdsReportsAfterOpen(DataSet: TDataSet);
    procedure cdsReportsBeforeOpen(DataSet: TDataSet);
    procedure cdsSubDetailFetchAfterOpen(DataSet: TDataSet);
    procedure colDocImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure dbgRefGetImageIndex(Sender: TObject; Node: TdxTreeListNode; var Index: Integer);
    procedure dbgReportsChangeNode(Sender: TObject; OldNode, Node: TdxTreeListNode);
    procedure dbgReportsCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure dbgReportsDblClick(Sender: TObject);
    procedure dsDetailDataChange(Sender: TObject; Field: TField);
    procedure dsMaster2DataChange(Sender: TObject; Field: TField);
    procedure dsMasterDataChange(Sender: TObject; Field: TField);
    procedure dsReportsDelayedDataChange(Sender: TObject; Field: TField);
    procedure frReport1BeforePrint(Memo: TStringList; View: TfrView);
    procedure frReport1BeginBand(Band: TfrBand);
    procedure frReport1GetValue(const ParName: String; var ParValue: Variant);

  private
    FromDate, ToDate: TDateTime;
    matgrp, whname, kaname, matnamestr, msrname, ctypename: string;
    matrest, summrest: Extended;
    FPrintArtikuls: Boolean;

    procedure SetDBChart;
    //procedure ShowRep(fname:string);

  protected
    FUseLogo, FUseDiagram: boolean;

  public
    function  HasMat(ANode: TdxTreeListNode): boolean; //Функция проверки Нода нп наличие в нём товара
    procedure DoClose; override;
    procedure DoDelete; override;
    procedure DoHelp; override;
    procedure DoOpen(AParam: Variant); override;
    procedure DoPatternInsert; override;
    procedure DoPrint(AParam: integer = 0); override;
    procedure DoRefresh(const AID: integer; AParam: integer = 0); override;
    procedure NotifyChanged; override;
    procedure SetCaptions; override;
    procedure SetDel0(ANode: TdxTreeListNode); //Установка del=0;
    procedure UpdateActionList; override;
    procedure WriteNode(ANode: TdxTreeListNode); //Запись Нода в DataSet
  end;

var
  fmAllReports: TfmAllReports;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  ClientData, prFun, prConst, ssFun, prTypes, EditReport,
  Math, ssBaseIntfDlg, ssDateUtils, StrUtils, ssBaseDlg, ssStrUtil,
  fMessageDlg, MatMove, Rep20, Rep17, Rep21, Rep14, RepPersons, RepMoney,
  BaseRep, Rep7, Rep3, Rep1, Rep10, Rep24, Rep9, Rep25, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

const
  _ID_ = 'repid';

//==============================================================================================
procedure TfmAllReports.WriteNode(ANode:TdxTreeListNode);
  var
    i:integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAllReports.WriteNode') else _udebug := nil;{$ENDIF}

  case cdsReports.FieldByName('repid').AsInteger of
    1:begin // Краткий отчёт о приходе
      cdsMaster.Append;
      cdsMaster.FieldByName('matid').AsInteger := ANode.Values[colMatId.Index];
      cdsMaster.FieldByName('grpid').AsInteger := ANode.Values[colGrpId.Index];

      if ANode.Values[colMatId.Index] < 0
        then  cdsMaster.FieldByName('matname').AsString := GetSpace(ANode.Level)+ANode.Values[colMatName.Index]
        else cdsMaster.FieldByName('matname').AsString := ANode.Values[colMatName.Index];

      cdsMaster.FieldByName('msrname').AsString := ANode.Values[colMsrName.Index];

      if ANode.Values[colAmount.Index] <> null then cdsMaster.FieldByName('amount').AsFloat := ssStrToFloat(ANode.Values[colAmount.Index]);

      if ANode.Values[colSummdef.Index] <> null then cdsMaster.FieldByName('summdef').AsFloat := ssStrToFloat(ANode.Values[colSummdef.Index]);

      cdsMaster.FieldByName('del').AsInteger := 0;
      cdsMaster.Post;
    end;//Краткий отчёт о приходе

    2:begin // Краткий отчёт о продажах товаров
      cdsMaster.Append;
      cdsMaster.FieldByName('matid').AsInteger := ANode.Values[colMatId.Index];
      cdsMaster.FieldByName('grpid').AsInteger := ANode.Values[colGrpId.Index];

      if ANode.Values[colMatId.Index] < 0
        then  cdsMaster.FieldByName('matname').AsString := GetSpace(ANode.Level)+ANode.Values[colMatName.Index]
        else cdsMaster.FieldByName('matname').AsString := ANode.Values[colMatName.Index];

      cdsMaster.FieldByName('msrname').AsString := ANode.Values[colMsrName.Index];

      if ANode.Values[colAmount.Index]<>null then cdsMaster.FieldByName('amountout').AsFloat := ssStrToFloat(ANode.Values[colAmount.Index]);

      if ANode.Values[colSummdef.Index]<>null then cdsMaster.FieldByName('summout').AsFloat := ssStrToFloat(ANode.Values[colSummdef.Index]);

      cdsMaster.FieldByName('del').AsInteger := 0;
      cdsMaster.Post;
    end;//Краткий отчёт о продажах товаров

    12, 13:begin // Отчёт о продажах с прибылью
      cdsMaster.Append;
      cdsMaster.FieldByName('matid').AsInteger := ANode.Values[colMatId.Index];
      cdsMaster.FieldByName('grpid').AsInteger := ANode.Values[colGrpId.Index];

      if ANode.Values[colMatId.Index] < 0
        then  cdsMaster.FieldByName('matname').AsString := GetSpace(ANode.Level)+ANode.Values[colMatName.Index]
        else cdsMaster.FieldByName('matname').AsString := ANode.Values[colMatName.Index];

      cdsMaster.FieldByName('msrname').AsString := ANode.Values[colMsrName.Index];
      cdsMaster.FieldByName('artikul').AsString := ANode.Values[colArtikul.Index];
      cdsMaster.FieldByName('producer').AsString := ANode.Values[colProducer.Index];

      if ANode.Values[colAmount.Index] <> null then cdsMaster.FieldByName('amountout').AsFloat := ssStrToFloat(ANode.Values[colAmount.Index]);

      if ANode.Values[colSummdef.Index] <> null then cdsMaster.FieldByName('summout').AsFloat := ssStrToFloat(ANode.Values[colSummdef.Index]);

      if ANode.Values[colSummIn.Index] <> null then cdsMaster.FieldByName('summin').AsFloat := ssStrToFloat(ANode.Values[colSummIn.Index]);

      if ANode.Values[colNDSIn.Index] <> null then cdsMaster.FieldByName('ndsin').AsFloat := ssStrToFloat(ANode.Values[colNDSIn.Index]);

      if ANode.Values[colNdsOut.Index] <> null then cdsMaster.FieldByName('ndsout').AsFloat := ssStrToFloat(ANode.Values[colNdsOut.Index]);

      if ANode.Values[colNdsDif.Index] <> null then cdsMaster.FieldByName('ndsdif').AsFloat := ssStrToFloat(ANode.Values[colNdsDif.Index]);

      if ANode.Values[colPrib.Index] <> null then cdsMaster.FieldByName('prib').AsFloat := ssStrToFloat(ANode.Values[colPrib.Index]);

      if ANode.Values[colKoef.Index] <> null then cdsMaster.FieldByName('koef').AsFloat := ssStrToFloat(ANode.Values[colKoef.Index]);

      cdsMaster.FieldByName('del').AsInteger := 0;
      cdsMaster.Post;
    end;//12,13 Отчёт о продажах с прибылью

    7: begin // Ведомость материальных остатков
      cdsMaster.Append;
      cdsMaster.FieldByName('matid').AsInteger := ANode.Values[colMatId.Index];
      cdsMaster.FieldByName('grpid').AsInteger := ANode.Values[colGrpId.Index];

      if ANode.Values[colMatId.Index]<0
        then cdsMaster.FieldByName('matname').AsString := GetSpace(ANode.Level)+ANode.Values[colMatName.Index]
        else cdsMaster.FieldByName('matname').AsString := ANode.Values[colMatName.Index];

      cdsMaster.FieldByName('msrname').AsString := ANode.Values[colMsrName.Index];
      cdsMaster.FieldByName('artikul').AsString := ANode.Values[colArtikul.Index];

      if ANode.Values[colAmount.Index] <> null then cdsMaster.FieldByName('rest').AsFloat := ssStrToFloat(ANode.Values[colAmount.Index]);

      if ANode.Values[colRsv.Index] <> null then cdsMaster.FieldByName('rsv').AsFloat := ssStrToFloat(ANode.Values[colRsv.Index]);

      if ANode.Values[colSummdef.Index] <> null then cdsMaster.FieldByName('summrest').AsFloat := ssStrToFloat(ANode.Values[colSummdef.Index]);

      cdsMaster.FieldByName('del').AsInteger := 0;
      cdsMaster.Post;
    end;// Ведомость материальных остатков

    10: begin // Оборотная ведомость
      cdsMaster.Append;
      cdsMaster.FieldByName('matid').AsInteger := ANode.Values[dbgRef.FindColumnByFieldName('matid').Index];
      cdsMaster.FieldByName('grpid').AsInteger := ANode.Values[dbgRef.FindColumnByFieldName('grpid').Index];

      if ANode.Values[colMatId.Index] < 0
        then  cdsMaster.FieldByName('matname').AsString := GetSpace(ANode.Level)+ANode.Values[dbgRef.FindColumnByFieldName('matname').Index]
        else cdsMaster.FieldByName('matname').AsString := ANode.Values[dbgRef.FindColumnByFieldName('matname').Index];

      cdsMaster.FieldByName('msrname').AsString  := ANode.Values[dbgRef.FindColumnByFieldName('msrname').Index];
      cdsMaster.FieldByName('rest1').AsFloat     := ssStrToFloat(ANode.Values[dbgRef.FindColumnByFieldName('rest1').Index]);
      cdsMaster.FieldByName('summrest1').AsFloat := ssStrToFloat(ANode.Values[dbgRef.FindColumnByFieldName('summrest1').Index]);
      cdsMaster.FieldByName('rest2').AsFloat     := ssStrToFloat(ANode.Values[dbgRef.FindColumnByFieldName('rest2').Index]);
      cdsMaster.FieldByName('summrest2').AsFloat := ssStrToFloat(ANode.Values[dbgRef.FindColumnByFieldName('summrest2').Index]);
      cdsMaster.FieldByName('rest3').AsFloat     := ssStrToFloat(ANode.Values[dbgRef.FindColumnByFieldName('rest3').Index]);
      cdsMaster.FieldByName('summrest3').AsFloat := ssStrToFloat(ANode.Values[dbgRef.FindColumnByFieldName('summrest3').Index]);
      cdsMaster.FieldByName('rest4').AsFloat     := ssStrToFloat(ANode.Values[dbgRef.FindColumnByFieldName('rest4').Index]);
      cdsMaster.FieldByName('summrest4').AsFloat := ssStrToFloat(ANode.Values[dbgRef.FindColumnByFieldName('summrest4').Index]);
      cdsMaster.FieldByName('del').AsInteger     := 0;
      cdsMaster.Post;
    end;// Оборотная ведомость

    18: begin // Отчёт о минимальных остатках
      cdsMaster.Append;
      cdsMaster.FieldByName('matid').AsInteger := ANode.Values[colMatId.Index];
      cdsMaster.FieldByName('grpid').AsInteger := ANode.Values[colGrpId.Index];

      if ANode.Values[colMatId.Index] < 0
        then cdsMaster.FieldByName('matname').AsString := GetSpace(ANode.Level) + ANode.Values[colMatName.Index]
        else cdsMaster.FieldByName('matname').AsString := ANode.Values[colMatName.Index];

      cdsMaster.FieldByName('msrname').AsString := ANode.Values[colMsrName.Index];

      if ANode.Values[colAmount.Index] <> null then cdsMaster.FieldByName('minreserv').AsFloat := ssStrToFloat(ANode.Values[colAmount.Index]);

      if ANode.Values[colRsv.Index] <> null then cdsMaster.FieldByName('accessible').AsFloat := ssStrToFloat(ANode.Values[colRsv.Index]);

      if ANode.Values[colSummdef.Index] <> null then cdsMaster.FieldByName('necessary').AsFloat := ssStrToFloat(ANode.Values[colSummdef.Index]);

      cdsMaster.FieldByName('del').AsInteger := 0;
      cdsMaster.Post;
    end;// Отчёт о минимальных остатках
  end;//case

  if ANode.Count > 0 then for i := 0 to ANode.Count - 1 do WriteNode(ANode.Items[i]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAllReports.SetDel0(ANode:TdxTreeListNode);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAllReports.SetDel0') else _udebug := nil;{$ENDIF}

  if (ANode.Values[colMatId.Index] < 0) and cdsMaster.Locate('matid', ANode.Values[colMatId.Index], []) then begin
    cdsMaster.Edit;
    cdsMaster.FieldByName('del').AsInteger := 0;
    cdsMaster.Post;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//Функция проверки Нода нп наличие в нём товара
//==============================================================================================
function TfmAllReports.HasMat(ANode:TdxTreeListNode):boolean;
  var
    i:integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
Begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAllReports.HasMat') else _udebug := nil;{$ENDIF}

  Result := false;

  if ANode.Values[colMatId.Index] > 0
  then Result := true
  else begin
    if ANode.Count > 0 then begin
      for i := 0 to ANode.Count - 1 do
        if HasMat(ANode.Items[i]) then begin
          SetDel0(ANode.Items[i]);
          Result := True;
        end;
    end//if ANode.Count>0
    else Result := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
End;

//==============================================================================================
procedure TfmAllReports.SetDBChart;
  var
     S: TPieSeries;
     L: TLineSeries;
     {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAllReports.SetDBChart') else _udebug := nil;{$ENDIF}

 case cdsReports.FieldByName('repid').AsInteger of
   5,6: begin // Список кредиторов/Список дебеторов
     S := TPieSeries.Create(nil);

     with DBChart1 do begin
       AddSeries(S);
       BottomAxis.LabelsAngle := 90;
       DBChart1.Title.Text.Clear;
       //DBChart1.Title.Text.Add(cdsReports.FieldByName('name').AsString);
       Legend.LegendStyle := lsValues;
     end;//with

     with S do begin
       XLabelsSource := 'name';
       YValues.DateTime := False;
       YValues.Order := loNone;
       YValues.ValueSource := 'summdef';
       DataSource := cdsMaster;
       ColorEachPoint := True;
       Marks.Style := smsPercent;
       Marks.Visible := True;
       Marks.Arrow.Color := clBlack;
     end;//with S

     DBChart1.Height := 800;
   end;//5,6 Список кредиторов/Список дебеторов

   15: begin // Динамика продаж
     L := TLineSeries.Create(nil);

     with DBChart1 do begin
       AddSeries(L);
       BottomAxis.DateTimeFormat := 'dd.MM.yy hh:mm';
       BottomAxis.LabelsAngle := 90;
       DBChart1.Title.Text.Clear;
       DBChart1.Title.Text.Add(cdsReports.FieldByName('name').AsString);
       Legend.Visible := true;
       Legend.LegendStyle := lsSeries;
     end;//with

     with L do begin
       Title := matgrp;
       XLabelsSource := 'ondate';
       XValues.DateTime := true;
       YValues.DateTime := False;
       YValues.Order := loNone;
       YValues.ValueSource := 'summout';

       cdsMaster.First;
       while not cdsMaster.Eof do begin
         AddXY(cdsMaster.FieldByName('ondate').AsDateTime,cdsMaster.FieldByName('summout').AsFloat,cdsMaster.FieldByName('ondate').AsString);
         cdsMaster.Next;
       end;//while

       ColorEachPoint := False;
       Marks.Style := smsPercent;
       Marks.Visible := False;
       Marks.Arrow.Color := clBlack;
     end;//with

     DBChart1.Height := 600;
   end;//15 Динамика продаж
 end;//case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAllReports.DoPatternInsert;
  (*var
    S:TBarSeries;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAllReports.DoPatternInsert') else _udebug := nil;{$ENDIF}

  S := TBarSeries.Create(nil);
  with DBChart1 do begin
    AddSeries(S);
    //BottomAxis.DateTimeFormat := 'dd.MM.yy hh:mm';
    //BottomAxis.Increment := 1/48;
    BottomAxis.LabelsAngle := 90;
    //LeftAxis.AxisValuesFormat := '#,##0.#######';
  end;//with

  with S do begin
    //XValues.DateTime := True;
    //XValues.Order := loAscending;

    XLabelsSource := 'name';
    YValues.DateTime := False;
    YValues.Order := loNone;
    YValues.ValueSource := 'summdef';
    DataSource := cdsMaster;
    ColorEachPoint := True;
    Marks.Visible := false;
    AutoBarSize := True;
  end;//with
  //DBChart1.AutoSize := True;
  DBChart1.Height := 800;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmAllReports.DoPrint;
  var
   addfields, m, n, artikul:string;
   i, wid, tmpmatid: integer;
   tmpam, tmpsum: Extended;
   FBySN: boolean;
   FRepDlg: TfrmBaseRep;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAllReports.DoPrint') else _udebug := nil;{$ENDIF}

  //Screen.Cursor := crSQLWait;
  if not cdsReports.IsEmpty then dbgReports.SetFocus;

  if cdsReports.FieldByName('fil').AsInteger = 1 then begin
    with TfrmEditReport.Create(nil) do
    try
      OnDate := Self.OnDate;
      RepID := cdsReports.FieldByName('repid').AsInteger;
      ParentNameEx := Self.Name;
      SetCaptions;
      Caption := cdsReports.FieldByName('name').AsString;
      lcbKAgent.DisplayEmpty := rs(Self.Name,'allselect');
      lcbWHouse.DisplayEmpty := rs(Self.Name,'allselect');

      case cdsReports.FieldByName('repid').AsInteger of
        13: begin//******** Отчёт о продажах c прибылью *************
          pcMain.ActivePage := p2;
          pcP2.ActivePage := p21;
          edToDate.Date := Date;
          cdsMatGroup.Open;
          edMatGroup.Text := rs('fmAllReports', 'allselect');
          edMatGroup.Tag := 10;
          cdsWhouse.Open;
          cdsEmployee.Open;
          pcMain.HideTabs := true;
          ActiveControl := edFromDate;

          while ShowModal = mrOK do begin
            Screen.Cursor := crSQLWait;
            FUseLogo := btnUseLogo.Checked;
            FUseDiagram := btnUseDiagram.Checked;
            Application.ProcessMessages;
            m := '';
            addfields := '';
            n := '';

            if cbEFilter.Checked then begin // filter by employee
              m := m + ' and wbls.personid=' + IntToStr(lcbEFilter.KeyValue);
              KAName := lcbEFilter.Text;
            end
            else KAName := '';

            if edFromDate.EditingText <> ''
              then FromDate := edFromDate.Date
              else FromDate := MinDateTime;

            if edToDate.EditingText <> ''
              then ToDate := LastSecondInDay(edToDate.Date)
              else ToDate := MaxDateTime;

            matgrp := edMatGroup.Text;
            whname := lcbWHouse.EditingText;

            with tmpDS do begin //Считываем позиции
              Close;
              if chbGrpBy.Checked
                then ProviderName := 'pRep_MatOut1'
                else ProviderName := 'pRep_MatOut';

              //Товарная группа и склад?
              if lcbWHouse.KeyValue > 0 then m := m + ' and wbds.wid=' + inttostr(lcbWHouse.KeyValue) + ' ';

              if edMatGroup.Tag <> 10 then  begin
                m := m + ' and mats.grpid in (';

                if  btnDrillDown.Checked
                  then m := m + GetDrillDownList(dmData.SConnection, 'matgroup', 'grpid', 'pid', edMatGroup.Value)
                  else m := m + inttostr(edMatGroup.Value);

                m := m + ') ';
              end;//if

              if not chbGrpBy.Checked then n := n + 'order by 2 ';

              FetchMacros;
              Macros.ParamByName('f').AsString := addfields;
              Macros.ParamByName('m').AsString := m;
              Macros.ParamByName('n').AsString := n;

              FetchParams;
              Params.ParamByName('fromdate').AsDateTime := FromDate;
              Params.ParamByName('todate').AsDateTime := ToDate;
              Open;
              CopyDataSet(cdsMaster, tmpDS);
              Close;
            end;//with tmpDS

            if chbGrpBy.Checked then begin
              colAmount.FieldName := 'amountout';
              colSummdef.FieldName := 'summout';
              colNDSIn.FieldName := 'ndsin';
              colSummIn.FieldName := 'summin';
              colNdsOut.FieldName := 'ndsout';
              colNdsDif.FieldName := 'NdsDif';
              colPribNDS.FieldName := 'PribNDS';
              colPrib.FieldName := 'Prib';
              colArtikul.FieldName := 'Artikul';
              colProducer.FieldName := 'Producer';

              dbgRef.DataSource := dsMaster;
              colMatName.Sorted := csUp;
              cdsMaster.DisableControls;

              for i := 0 to dbgRef.Count - 1 do begin
                if HasMat(dbgRef.Items[i]) then SetDel0(dbgRef.Items[i]);
              end;

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
            end;//if

            dbgRef.DataSource := nil;
            SmartShowRep(frReport1, 'RepMatSelPr.frf');
          end;//while ShowModal=mrOK
        end;//13:

        (*
        14:begin//********Рейтинг продаж *************
          pcMain.ActivePage := p2;
          pcP2.ActivePage := p21;
          edToDate.Date := Date;
          cdsMatGroup.Open;
          edMatGroup.Text := rs('fmAllReports','allselect');
          edMatGroup.Tag := 10;
          cdsWhouse.Open;
          panGrpBy.Hide;
          pcMain.HideTabs := true;
          PanRank.Show;
          ActiveControl := edFromDate;

          while ShowModal=mrOK do begin
            Screen.Cursor := crSQLWait;
            FUseLogo := btnUseLogo.Checked;
            FUseDiagram := btnUseDiagram.Checked;
            Application.ProcessMessages;
            m := '';
            n := '';

            if edFromDate.EditingText <> ''
              then FromDate := edFromDate.Date
              else FromDate := MinDateTime;

            if edToDate.EditingText <> ''
              then ToDate := LastSecondInDay(edToDate.Date)
              else ToDate := MaxDateTime;

            matgrp := edMatGroup.Text;
            whname := lcbWHouse.EditingText;

            if edMatGroup.Tag <> 10 then  begin
              m := m+' and mats.grpid in (';
              if  btnDrillDown.Checked
                then m := m+GetDrillDownList(dmData.SConnection, 'matgroup', 'grpid', 'pid', edMatGroup.Value)
                else m := m+inttostr(edMatGroup.Value);
              m := m+') ';
            end;//if

            case rgSortType.ItemIndex of
              0: n := 'order by 6';
              1: n := 'order by 13';
              2: n := 'order by 15';
            end;//case

            case rgSortDirect.ItemIndex of
              0: n := n+'';
              1: n := n+' desc';
            end;//case

            with cdsMaster do begin//Считываем позиции
              Close;
              ProviderName := 'pRep_MatOut';
              //Товарная группа и склад?
              if lcbWHouse.KeyValue > 0 then m := m + ' and  wbdet.wid=' + inttostr(lcbWHouse.KeyValue) + ' ';

              FetchMacros;
              Macros.ParamByName('m').AsString := m;
              Macros.ParamByName('n').AsString := n;

              if chbPosAmount.Checked
                then Macros.ParamByName('f').AsString := 'first '+inttostr(edPosAmount.EditValue)
                else Macros.ParamByName('f').AsString := '';

              FetchParams;
              Params.ParamByName('fromdate').AsDateTime := FromDate;
              Params.ParamByName('todate').AsDateTime := ToDate;
              Open;
            end;//with cdsMaster

            SmartShowRep(frReport1, 'RepMatSelRank.frf');
            end;//while ShowModal=mrOK
          end;//14:
          *)

          5:begin//Список кредиторов (мы должны)
            pcMain.ActivePage := p3;
            edToDate.Date := Date;
            pcMain.Hide;
            edFromDate.Hide;
            edToDate.Left := edFromDate.Left;
            lToDate.Hide;
            lFromDate.Caption := rs(Self.Name,'Date') + ':';
            ActiveControl := edToDate;
            btnUseDiagram.Visible := true;

            while ShowModal = mrOK do begin
              Screen.Cursor := crSQLWait;
              FUseLogo := btnUseLogo.Checked;
              FUseDiagram := btnUseDiagram.Checked;
              Application.ProcessMessages;
              m := '';

              if edToDate.EditingText <> ''
                then ToDate := LastSecondInDay(edToDate.Date)
                else ToDate := MaxDateTime;

              with tmpDS do begin//
                Close;
                ProviderName := 'pRep_KABalance';
                FetchMacros;
                Macros.ParamByName('m').AsString := '>';
                FetchParams;
                Params.ParamByName('ondate').AsDateTime := ToDate;
                Open;
                CopyDataSet(cdsMaster, tmpDS);
                Close;
              end;//with cdsMaster
              SetDBChart;
              SmartShowRep(frReport1, 'Kreditors.frf');
              //Удаление Series
              while DBChart1.SeriesCount>0 do DBChart1.Series[0].Free;
            end;//  while ShowModal=mrOK
          end;//5:

          6:begin////Список дебиторов (нам должны)
            pcMain.ActivePage := p3;
            edToDate.Date := Date;
            pcMain.Hide;
            edFromDate.Hide;
            edToDate.Left := edFromDate.Left;
            lToDate.Hide;
            lFromDate.Caption := rs(Self.Name,'Date') + ':';
            ActiveControl := edToDate;
            btnUseDiagram.Visible := true;

            while ShowModal = mrOK do begin
              Screen.Cursor := crSQLWait;
              FUseLogo := btnUseLogo.Checked;
              FUseDiagram := btnUseDiagram.Checked;
              Application.ProcessMessages;
              m := '';

              if edToDate.EditingText <> ''
                then ToDate := LastSecondInDay(edToDate.Date)
                else ToDate := MaxDateTime;

              with tmpDS do begin
                Close;
                ProviderName := 'pRep_KABalance';
                FetchMacros;
                Macros.ParamByName('m').AsString := '<';
                FetchParams;
                Params.ParamByName('ondate').AsDateTime := ToDate;
                Open;
                CopyDataSet(cdsMaster, tmpDS);
                Close;
              end;//with tmpDS

              SetDBChart;
              SmartShowRep(frReport1, 'Debitors.frf');

              //Удаление Series
              while DBChart1.SeriesCount>0 do DBChart1.Series[0].Free;
            end;//  while ShowModal=mrOK
          end;//6:

          (*
          7:begin//Ведомость материальных остатков
            pcMain.ActivePage := p2;
            pcP2.ActivePage := p21;
            edToDate.Date := Date;
            cdsWhouse.Open;
            pcMain.HideTabs := true;
            edFromDate.Hide;
            edToDate.Left := edFromDate.Left;
            lToDate.Hide;
            lFromDate.Caption := rs(Self.Name,'Date') + ':';
            ActiveControl := edToDate;
            PanRank.Visible := True;
            pc7.ActivePage := tsRep7;

            while ShowModal = mrOK do begin
              Screen.Cursor := crSQLWait;
              FUseLogo := btnUseLogo.Checked;
              FUseDiagram := btnUseDiagram.Checked;
              Application.ProcessMessages;
              m := '';

              if edToDate.EditingText <> ''
                then  ToDate := LastSecondInDay(edToDate.Date)
                else ToDate := MaxDateTime;

              matgrp := edMatGroup.Text;
              whname := lcbWHouse.EditingText;
              FPrintArtikuls := chbPrintArtikuls.Checked;

              with tmpDS do begin//Считываем остатки на дату
                Close;
                ProviderName := 'pRep_RestOnDateMaster1';
                Params.Clear;
                Macros.Clear;
                FetchParams;

                {Товарная группа и склад?}
                if lcbWHouse.KeyValue > 0
                  then Params.ParamByName('wid').AsInteger := lcbWHouse.KeyValue
                  else Params.ParamByName('wid').AsInteger := 0;

                if edMatGroup.Tag <> 10 then begin
                  if btnDrillDown.Checked
                    then Params.ParamByName('grp').AsString :=
                            GetDrillDownList(dmData.SConnection, 'matgroup', 'grpid', 'pid', edMatGroup.Value)
                    else Params.ParamByName('grp').AsString := IntToStr(edMatGroup.Value);
                end
                else Params.ParamByName('grp').AsString := '';

                if rbt7PriceType.Checked
                  then Params.ParamByName('ptypeid').AsInteger := lcbPriceTypes.KeyValue
                  else Params.ParamByName('ptypeid').AsInteger := 0;

                Params.ParamByName('ondate').AsDateTime := ToDate;
                Open;
                CopyDataSet(cdsMaster, tmpDS);
                Close;
              end;//with tmpDS

              if chbGrpBy.Checked then begin
                //Получаем список мат. групп
                with tmpDS do
                try
                  Close;
                  ProviderName := 'pRep_MGList';
                  Params.Clear;
                  Macros.Clear;
                  FetchParams;
                  Open;
                  First;
                  while not Eof do begin
                    cdsMaster.Append;
                    cdsMaster.FieldByName('matid').AsInteger := FieldByName('matid').AsInteger;
                    cdsMaster.FieldByName('grpid').AsInteger := FieldByName('grpid').AsInteger;
                    cdsMaster.FieldByName('matname').AsString := FieldByName('matname').AsString;
                    cdsMaster.FieldByName('del').AsInteger := 1;
                    cdsMaster.FieldByName('msrname').AsString := '*';
                    cdsMaster.Post;
                    Next;
                  end;

                finally
                  Close;
                end;

                colAmount.FieldName := 'rest';
                colRsv.FieldName := 'rsv';
                colSummdef.FieldName := 'summrest';
                colArtikul.FieldName := 'artikul';
                dbgRef.DataSource := dsMaster;

                colMatName.Sorted := csUp;
                cdsMaster.DisableControls;
                for i := 0 to dbgRef.Count - 1 do if HasMat(dbgRef.Items[i]) then SetDel0(dbgRef.Items[i]);

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
                for i := 0 to dbgRef.Count-1 do WriteNode(dbgRef.Items[i]);

                cdsMaster.EnableControls;
              end;//if chbGrpBy.Checked

              dbgRef.DataSource := nil;
              SmartShowRep(frReport1, 'RepMatRest.frf');
            end;//while ShowModal=mrOK do begin

            colArtikul.FieldName := '';
          end;//7:
          *)

          8: begin// Отчёт о по контрагенту
            Tag := 8;
            lKAgent.Caption := rs(Self.Name, 'ka') + ':';
            pcMain.ActivePage := p3;
            edToDate.Date := Date;
            lcbKAgent.DisplayEmpty := rs(Self.Name, 'notselect');
            cdsKAgent.Open;
            pcMain.HideTabs := true;
            ActiveControl := edFromDate;
            panKA.Height := 46;
            chbBOnly.Show;

            while ShowModal = mrOK do begin
              Screen.Cursor := crSQLWait;
              FUseLogo := btnUseLogo.Checked;
              FUseDiagram := btnUseDiagram.Checked;

              Application.ProcessMessages;
              m := '';

              if edFromDate.EditingText <> ''
                then FromDate := edFromDate.Date
                else FromDate := MinDateTime;

              if edToDate.EditingText <> ''
                then ToDate := LastSecondInDay(edToDate.Date)
                else ToDate := MaxDateTime;

              kaname := lcbKAgent.Text;

              with tmpDS do begin//Считываем приходные накладные
                Close;
                ProviderName := 'pRep_KAInDetail';
                FetchParams;
                Params.ParamByName('fromdate').AsDateTime := FromDate;
                Params.ParamByName('todate').AsDateTime := ToDate;
                Params.ParamByName('kaid').AsInteger := lcbKAgent.KeyValue;
                Open;
                CopyDataSet(cdsMaster, tmpDS);
                Close;

                //Считываем расходные накладные
                ProviderName := 'pRep_KAOutDetail';
                FetchParams;
                Params.ParamByName('fromdate').AsDateTime := FromDate;
                Params.ParamByName('todate').AsDateTime := ToDate;
                Params.ParamByName('kaid').AsInteger := lcbKAgent.KeyValue;
                Open;
                CopyDataSet(cdsMaster2, tmpDS);
                Close;
              end;//with tmpDS

              with cdsSubDetailFetch do begin//Считываем баланс
                Close;
                ProviderName := 'pRep_KABalanceAll';
                FetchParams;
                Params.ParamByName('fromdate').AsDateTime := FromDate;
                Params.ParamByName('todate').AsDateTime := ToDate;
                Params.ParamByName('kaid').AsInteger := lcbKAgent.KeyValue;
                Open;
              end;//with cdsSubDetailFetch

              if edFromDate.EditText <> '' then
                with newDataSet do
                try //finally
                  ProviderName := 'pKA_GetSaldo';
                  FetchParams;
                  Params.ParamByName('kaid').AsInteger := lcbKAgent.KeyValue;
                  Params.ParamByName('ondate').AsDateTime := edFromDate.Date;
                  Open;

                  if not IsEmpty then begin
                    cdsSubDetail.First;

                    if not cdsSubDetail.IsEmpty
                      then cdsSubDetail.Insert
                      else cdsSubDetail.Append;

                    cdsSubDetail.FieldByName('tp').AsInteger := -200;
                    cdsSubDetail.FieldByName('ondate').AsDateTime := edFromDate.Date;
                    cdsSubDetail.FieldByName('summdef').AsCurrency := Fields[0].AsCurrency;
                    cdsSubDetail.FieldByName('wb').AsInteger := 1;
                    cdsSubDetail.Post;

                    if cdsSubDetail.Locate('tp', 0, []) then cdsSubDetail.Delete;
                  end;

                  Close;

                finally
                  Free;
                end;

              if not chbBOnly.Checked
                then SmartShowRep(frReport1, 'RepKAAll.frf')
                else SmartShowRep(frReport1, 'RepKAAllBOnly.frf');
            end;//  while ShowModal = mrOK do begin
          end;

          19: begin//******** Оборотная ведомость товара *************
            Tag := 19;
            pcMain.ActivePage := p2;
            pcP2.ActivePage := p22;
            lMatGroup.Caption := rs(Self.Name,'Material') + ':';
            edToDate.Date := Date;
            cdsWhouse.Open;
            pcMain.HideTabs := true;
            chbGrpBy.Show;
            chbGrpBy.Properties.Caption := rs(Self.Name,'ShowPrices');
            ActiveControl := edFromDate;

            while ShowModal = mrOK do begin
               Screen.Cursor := crSQLWait;
               FUseLogo := btnUseLogo.Checked;
               FUseDiagram := btnUseDiagram.Checked;
               Application.ProcessMessages;
               m := '';

               if edFromDate.EditingText <> ''
                 then FromDate := edFromDate.Date
                 else FromDate := MinDateTime;

               if edToDate.EditingText <> ''
                 then ToDate := LastSecondInDay(edToDate.Date)
                 else ToDate := MaxDateTime;

               whname := lcbWHouse.EditingText;
               matnamestr := MatName(dmData.SConnection,edMat.Tag,msrname,artikul,wid,FBySN);

               with tmpDS do begin//Считываем позиции
                 Close;
                 //1) Получаем остаток на начало периода
                 if lcbWHouse.KeyValue > 0
                   then m := m + ' and pr.wid=' + inttostr(lcbWHouse.KeyValue)+' ';

                 ProviderName := 'pRep_MatRestOnDate';
                 FetchMacros;
                 Macros.ParamByName('m').AsString := m;
                 FetchParams;
                 Params.ParamByName('ondate').AsDateTime := FromDate;
                 Params.ParamByName('matid').AsInteger := edMat.Tag;
                 Open;

                 if not IsEmpty then begin
                   matrest := RoundToA(FieldByName('rest').AsFloat, MatDisplayDigits);
                   summrest := FieldByName('summ').AsFloat;
                 end
                 else begin
                   matrest := 0;
                   summrest := 0;
                 end;
                 Close;

                 m := '';
                 if lcbWHouse.KeyValue > 0
                   then m := m + ' and wmt.wid=' + inttostr(lcbWHouse.KeyValue) + ' ';

                 //2) Движение товара за период
                 ProviderName := 'pRep_MatDocsPeriod';
                 FetchMacros;
                 Macros.ParamByName('m').AsString := m;
                 FetchParams;
                 Params.ParamByName('fromdate').AsDateTime := FromDate;
                 Params.ParamByName('todate').AsDateTime := ToDate;
                 Params.ParamByName('matid').AsInteger := edMat.Tag;
                 Open;
                 CopyDataSet(cdsMaster, tmpDS);
                 Close;
               end;//with tmpDS

               if not chbGrpBy.Checked
                 then SmartShowRep(frReport1, 'RepMatTurnPeriod.frf')
                 else SmartShowRep(frReport1, 'RepMatTurnPeriod2.frf')
            end;//while ShowModal=mrOK
          end;//19:

         9999:begin//******** Отчёт о движении товара *************
            Tag := 9;
            pcMain.ActivePage := p2;
            pcP2.ActivePage := p22;
            lMatGroup.Caption := rs(Self.Name,'Material') + ':';
            edToDate.Date := Date;
            cdsWhouse.Open;
            pcMain.HideTabs := true;
            chbGrpBy.Hide;
            ActiveControl := edFromDate;
            while ShowModal = mrOK do begin
              if edMat.Tag = 0 then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

              n := edFromDate.EditingText;
              m := edToDate.EditingText;

              with TfrmMatMove.Create(nil) do
              try
                ParentNameEx := 'fmWMat';

                if n <> '' then begin
                  try
                    edFromDate.Date := StrToDate(n);
                  except
                    edFromDate.Date := MinDateTime;
                  end;
                end
                else edFromDate.EditText := n;

                edToDate.Text := m;
                try
                  OnDate := StrToDate(m);
                except
                  OnDate := MaxDateTime;
                end;

                if lcbWHouse.KeyValue > 0
                  then WID := lcbWHouse.KeyValue
                  else WID := 0; //cbWHouse.KeyValue;

                ID := edMat.Tag;
                aPrintMain.Execute;
                //ShowModal;

              finally
                Free;
              end;
            end;//while ShowModal=mrOK
          end;//9:

          11:begin//******** Реестр документов *************
            Tag := 11;
            pcMain.ActivePage := p1;
            edToDate.Date := Date;
            pcMain.HideTabs := true;
            cbChecked.Properties.Items[0].Description := rs(Self.Name,'all');
            cbChecked.Properties.Items[1].Description := rs(Self.Name,'Checked');
            cbChecked.Properties.Items[2].Description := rs(Self.Name,'NoChecked');
            ActiveControl := edFromDate;

            while ShowModal = mrOK do begin
              Screen.Cursor := crSQLWait;
              m := '';
              n := '';

              Application.ProcessMessages;

              if edFromDate.EditingText <> ''
                then FromDate := edFromDate.Date
                else FromDate := MinDateTime;

              if edToDate.EditingText <> ''
                then ToDate := LastSecondInDay(edToDate.Date)
                else ToDate := MaxDateTime;

              if chbWBIn.Checked then m := '1';

              if chbWBOut.Checked then       if m <> '' then m := m + ',-1' else m := '-1';
              if chbAccOut.Checked then      if m <> '' then m := m + ',2'  else m := '2';
              if chbRetIn.Checked then       if m <> '' then m := m + ',6'  else m := '6';
              if chbRetOut.Checked then      if m <> '' then m := m + ',-6' else m := '-6';
              if chbOrderIn.Checked then     if m <> '' then m := m + ',16' else m := '16';
              if chbOrderOut.Checked then    if m <> '' then m := m + ',-16' else m := '-16';
              if chbWaybillMove.Checked then if m <> '' then m := m + ',4'  else m := '4';

              if m <> ''
                then m := ' and wblist.wtype in (' + m + ')'
                else m := ' and wblist.wtype=0';

              if chbPayIn.Checked then n := '1';

              if chbPayOut.Checked then if n <> '' then n := n + ',-1' else n := '-1';

              if n <> ''
                then n := ' and pd.doctype in (' + n + ')'
                else n := ' and pd.doctype=0';

              case cbChecked.EditValue of
                1:begin
                    m := m + ' and wblist.checked=1';
                    n := n + ' and pd.checked=1';
                  end;

                2:begin
                  m := m + ' and wblist.checked=0';
                  n := n + ' and pd.checked=0';
                end;
              end;

              with tmpDS do begin//Считываем документы
                Close;
                ProviderName := 'pRep_DocRegistry';
                Params.Clear;
                Macros.Clear;
                FetchParams;
                FetchMacros;

                Macros.ParamByName('m').AsString := m;
                Macros.ParamByName('n').AsString := n;
                Params.ParamByName('fromdate').AsDateTime := FromDate;
                Params.ParamByName('todate').AsDateTime := ToDate;
                Open;
                CopyDataSet(cdsMaster, tmpDS);
                Close;
              end;//with tmpDS

              SmartShowRep(frReport1, 'Rep_DocRegistry.frf');
            end;//while ShowModal=mrOK
          end;//11:

          15:begin//******** Динамика продаж *************
            pcMain.ActivePage := p2;
            pcP2.ActivePage := p21;
            edToDate.Date := Date;
            cdsMatGroup.Open;
            edMatGroup.Text := rs('fmAllReports','allselect');
            edMatGroup.Tag := 10;
            cdsWhouse.Open;
            pcMain.HideTabs := true;
            ActiveControl := edFromDate;
            btnUseDiagram.Visible := true;
            btnUseDiagram.Checked := True;
            btnUseDiagram.Enabled := False;
            btnUseDiagram.Hide;

            while ShowModal = mrOK do begin
               Screen.Cursor := crSQLWait;
               FUseLogo := btnUseLogo.Checked;
               FUseDiagram := btnUseDiagram.Checked;
               Application.ProcessMessages;
               m := '';

               if edFromDate.EditingText<>''
                 then FromDate := edFromDate.Date
                 else FromDate := MinDateTime;

               if edToDate.EditingText<>''
                 then ToDate := LastSecondInDay(edToDate.Date)
                 else ToDate := MaxDateTime;

               whname := lcbWHouse.EditingText;
               if not chbGrpBy.Checked then begin
                 matgrp := edMatGroup.Text;

                 with tmpDS do begin//Считываем позиции
                   Close;
                   ProviderName := 'pRep_Dyn';
                   {Товарная группа и склад?}

                   if lcbWHouse.KeyValue > 0 then m := m+' and  wbdet.wid='+inttostr(lcbWHouse.KeyValue)+' ';

                   if edMatGroup.Tag <> 10 then  begin
                      m := m+' and mats.grpid in (';

                      if  btnDrillDown.Checked
                        then m := m + GetDrillDownList(dmData.SConnection, 'matgroup', 'grpid', 'pid', edMatGroup.Value)
                        else m := m + inttostr(edMatGroup.Value);

                      m := m + ') ';
                   end;//if

                   FetchMacros;
                   Macros.ParamByName('m').AsString := m;
                   FetchParams;
                   Params.ParamByName('fromdate').AsDateTime := FromDate;
                   Params.ParamByName('todate').AsDateTime := ToDate;
                   Open;
                   CopyDataSet(cdsMaster, tmpDS);
                   Close;
                 end;//with tmpDS

                 SetDBChart;
               end//if not chbGrpBy.Checked
               else begin
                 cdsMatGroup.DisableControls; //!!

                 if edMatGroup.Tag = 10 then begin//all selected

                   cdsMatGroup.First;
                   while not cdsMatGroup.Eof do begin
                     if cdsMatGroup.FieldByName('grpid').AsInteger=cdsMatGroup.FieldByName('pid').AsInteger
                     then begin
                       matgrp := cdsMatGroup.FieldByName('name').AsString;

                       with tmpDS do begin//Считываем позиции
                         Close;
                         ProviderName := 'pRep_Dyn';
                         {Товарная группа и склад?}
                         m := '';
                         if lcbWHouse.KeyValue > 0 then m := m + ' and  wbdet.wid=' + inttostr(lcbWHouse.KeyValue) + ' ';

                         m := m+' and mats.grpid in (';

                         if  btnDrillDown.Checked
                           then m := m+GetDrillDownList(dmData.SConnection, 'matgroup', 'grpid', 'pid', cdsMatGroup.FieldByName('grpid').AsInteger)
                           else m := m+inttostr(cdsMatGroup.FieldByName('grpid').AsInteger);

                         m := m+') ';
                         FetchMacros;
                         Macros.ParamByName('m').AsString := m;
                         FetchParams;
                         Params.ParamByName('fromdate').AsDateTime := FromDate;
                         Params.ParamByName('todate').AsDateTime := ToDate;
                         Open;
                         if not IsEmpty then begin
                           CopyDataSet(cdsMaster, tmpDS);
                           Close;
                           SetDBChart;
                         end;
                       end;//with tmpDS
                     end;//if

                     cdsMatGroup.Next;
                   end;
                 end //if edMatGroup.Tag=10
                 else begin
                   cdsMatGroup.First;

                   while not cdsMatGroup.Eof do begin
                     if cdsMatGroup.FieldByName('pid').AsInteger=edMatGroup.Value then begin
                       matgrp := cdsMatGroup.FieldByName('name').AsString;

                       with tmpDS do begin//Считываем позиции
                         Close;
                         ProviderName := 'pRep_Dyn';
                         {Товарная группа и склад?}
                         m := '';

                         if lcbWHouse.KeyValue > 0 then m := m+' and  wbdet.wid='+inttostr(lcbWHouse.KeyValue)+' ';

                         m := m+' and mats.grpid in (';
                         if  btnDrillDown.Checked
                           then m := m+GetDrillDownList(dmData.SConnection, 'matgroup', 'grpid', 'pid', cdsMatGroup.FieldByName('grpid').AsInteger)
                           else m := m+inttostr(cdsMatGroup.FieldByName('grpid').AsInteger);
                         m := m+') ';

                         FetchMacros;
                         Macros.ParamByName('m').AsString := m;
                         FetchParams;
                         Params.ParamByName('fromdate').AsDateTime := FromDate;
                         Params.ParamByName('todate').AsDateTime := ToDate;
                         Open;
                         if not IsEmpty then begin
                           CopyDataSet(cdsMaster, tmpDS);
                           Close;
                           SetDBChart;
                         end;
                       end;//with cdsMaster
                     end;//if

                     cdsMatGroup.Next;
                   end;//while not cdsMatGroup.Eof do begin
                 end;

                 cdsMatGroup.EnableControls;
               end;

              matgrp := edMatGroup.Text;
              SmartShowRep(frReport1, 'DynSel.frf');

              //Удаление всех Series
              while DBChart1.SeriesCount>0 do DBChart1.Series[0].Free;

            end;//while ShowModal=mrOK
          end;//15:

          16:begin//********** Отчёт о затратах ********
            pcMain.ActivePage := p3;
            lKAgent.Caption := rs('fmPayDoc', 'Receiver') + ':';
            edToDate.Date := Date;
            lcbKAgent.DisplayEmpty := rs(Self.Name,'allselect');
            cdsKAgent.Open;
            pcMain.HideTabs := true;
            panChargeType.Show;
            lcbChargeType.DisplayEmpty := rs('Common', 'All');
            lcbChargeType.KeyValue := 0;
            lcbChargeType.ItemIndex := 0;
            cdsChargeType.Open;
            ActiveControl := edFromDate;

            while ShowModal = mrOK do begin
               Screen.Cursor := crSQLWait;
               FUseLogo := btnUseLogo.Checked;
               FUseDiagram := btnUseDiagram.Checked;

               Application.ProcessMessages;
               m := '';

               if edFromDate.EditingText<>''
                 then FromDate := edFromDate.Date
                 else FromDate := MinDateTime;

               if edToDate.EditingText <> ''
                 then ToDate := LastSecondInDay(edToDate.Date)
                 else ToDate := MaxDateTime;

               kaname := lcbKAgent.Text;
               ctypename := lcbChargeType.Text;

               with tmpDS do begin//Считываем поставщиков
                 Close;
                 ProviderName := 'pRep_Expenses';

                 if chbExpAll.Checked
                   then m := m + ' and pd.doctype in (-1, -2)'
                   else m := m + ' and pd.doctype=-2';

                 if lcbKAgent.KeyValue <> lcbKAgent.EmptyValue then m := m+' and pd.kaid=' + IntToStr(lcbKAgent.KeyValue);

                 if lcbChargeType.KeyValue <> lcbChargeType.EmptyValue then m := m+' and pd.ctypeid=' + IntToStr(lcbChargeType.KeyValue);

                 FetchMacros;
                 Macros.ParamByName('m').AsString := m;
                 FetchParams;
                 Params.ParamByName('fromdate').AsDateTime := FromDate;
                 Params.ParamByName('todate').AsDateTime := ToDate;
                 Open;
                 CopyDataSet(cdsMaster, tmpDS);
                 Close;
               end;//with tmpDS

               SmartShowRep(frReport1, 'RepExpenses.frf');
            end;// while ShowModal=mrOK do
          end;//16:

          18:begin//Отчёт о минимальных остатках
            pcMain.ActivePage := p2;
            pcP2.ActivePage := p21;
            edToDate.Date := Date;
            cdsMatGroup.Open;
            edMatGroup.Text := rs('fmAllReports', 'allselect');
            edMatGroup.Tag := 10;
            cdsWhouse.Open;
            lcbWHouse.Enabled := False;
            aAddWHouse.Enabled := False;
            pcMain.HideTabs := true;
            edFromDate.Hide;
            edToDate.Left := edFromDate.Left;
            lToDate.Hide;
            lFromDate.Caption := rs(Self.Name, 'Date') + ':';
            ActiveControl := edToDate;

            while ShowModal = mrOK do begin
              Screen.Cursor := crSQLWait;
              FUseLogo := btnUseLogo.Checked;
              FUseDiagram := btnUseDiagram.Checked;
              Application.ProcessMessages;
              m := '';
              if edToDate.EditingText <> ''
                then ToDate := LastSecondInDay(edToDate.Date)
                else ToDate := MaxDateTime;

              matgrp := edMatGroup.Text;

              with tmpDS do begin//Считываем остатки на дату
                Close;
                ProviderName := 'pRep_MinRest';
                Params.Clear;
                Macros.Clear;
                FetchParams;
                FetchMacros;

                {if AllowedWH <> '*'
                  then Macros.ParamByName('w').AsString := ' and mr.wid in (' + AllowedWH + ') '
                  else Macros.ParamByName('w').AsString := '';
                }

                //Товарная группа и склад?
                if lcbWHouse.KeyValue > 0 then m := m + ' and wbdet.wid=' + inttostr(lcbWHouse.KeyValue) + ' ';

                if edMatGroup.Tag <> 10 then  begin
                  m := m + ' and mats.grpid in (';
                  if btnDrillDown.Checked
                    then m := m + GetDrillDownList(dmData.SConnection, 'matgroup', 'grpid', 'pid', edMatGroup.Value)
                    else m := m + inttostr(edMatGroup.Value);

                  m := m + ') ';
                end;//if
                Params.ParamByName('ondate').AsDateTime := ToDate;
                Macros.ParamByName('m').AsString := m;
                Open;
                CopyDataSet(cdsMaster, tmpDS);
                Close;
              end;//with tmpDS

              if chbGrpBy.Checked then begin
                //Получаем список мат. групп
                with tmpDS do
                try
                  Close;
                  ProviderName := 'pRep_MGList';
                  Params.Clear;
                  Macros.Clear;
                  FetchParams;
                  Open;
                  First;
                  while not Eof do begin
                    cdsMaster.Append;
                    cdsMaster.FieldByName('matid').AsInteger := FieldByName('matid').AsInteger;
                    cdsMaster.FieldByName('grpid').AsInteger := FieldByName('grpid').AsInteger;
                    cdsMaster.FieldByName('matname').AsString := FieldByName('matname').AsString;
                    cdsMaster.FieldByName('del').AsInteger := 1;
                    cdsMaster.FieldByName('msrname').AsString := '+';
                    cdsMaster.FieldByName('accessible').AsFloat := 0;
                    cdsMaster.Post;
                    Next;
                  end;

                finally
                  Close;
                end;

                colAmount.FieldName := 'minreserv';
                colRsv.FieldName := 'accessible';
                colSummdef.FieldName := 'necessary';
                dbgRef.DataSource := dsMaster;
                colMatName.Sorted := csUp;
                cdsMaster.DisableControls;
                for i := 0 to dbgRef.Count - 1 do if HasMat(dbgRef.Items[i]) then SetDel0(dbgRef.Items[i]);

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
                for i := 0 to dbgRef.Count-1 do WriteNode(dbgRef.Items[i]);

                cdsMaster.EnableControls;
              end;//if chbGrpBy.Checked

              dbgRef.DataSource := nil;
              SmartShowRep(frReport1, 'RepMatMinRest.frf');
            end;//while ShowModal=mrOK do begin
          end;//18
      end;//case;

    finally
      dbgRef.DataSource := nil;
      cdsKAgent.Close;
      cdsMatGroup.Close;
      cdsWhouse.Close;
      //cdsMaster.Close;
      cdsDetail.Close;
      cdsSubDetailFetch.Close;
      cdsMaster2.Close;
      cdsDetail2.Close;
      Screen.Cursor := crDefault;
      Free;

      //Удаление Series
      while DBChart1.SeriesCount > 0 do DBChart1.Series[0].Free;
    end;//finally

    FRepDlg := nil;
    case cdsReports.FieldByName('repid').AsInteger of
      1,2: FRepDlg := TfrmRep1.Create(nil);       // Краткий отчёт о приходе/продажах
      3,4: FRepDlg := TfrmRep3.Create(nil);       // Отчёт о продажах по клиентам/приходе по поставщикам
        7: FRepDlg := TfrmRep7.Create(nil);       // Ведомость материальных остатков
        9: FRepDlg := TfrmRep9.Create(nil);       // Отчёт о движении товара
       10: FRepDlg := TfrmRep10.Create(nil);      // Оборотная ведомость
       14: FRepDlg := TfrmRep14.Create(nil);      // Рейтинг продаж
       17: FRepDlg := TfrmRep17.Create(nil);      // отчёт о финансовом результате
       20: FRepDlg := TfrmRep20.Create(nil);      // краткий отчёт о продажах услуг
       21: FRepDlg := TfrmRep21.Create(nil);      // краткий отчёт о финансовом результате
       22: FRepDlg := TfrmRepPersons.Create(nil); // Отчёт о работе служащих
       23: FRepDlg := TfrmRepMoney.Create(nil);   // Отчёт об оборотах денежных средств
       24: FRepDlg := TfrmRep24.Create(nil);      // Краткий отчёт по договору
       25: FRepDlg := TfrmRep25.Create(nil);      // Развёрнутый отчёт о приходе
    end; //  case cdsReports.FieldByName('repid').AsInteger

    if Assigned(FRepDlg) then with FRepDlg do
      try
        Caption := cdsReports.FieldByName('name').AsString;
        RepID := cdsReports.FieldByName('repid').AsInteger;
        OnDate := Self.OnDate;
        ShowModal;

      finally
        Free;
      end;
  end; //if cdsReports.FieldByName('fil').AsInteger = 1

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAllReports.DoClose;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAllReports.DoClose') else _udebug := nil;{$ENDIF}

  cdsWHouse.Close;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmAllReports.DoDelete;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAllReports.DoDelete') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmAllReports.DoOpen(AParam: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAllReports.DoOpen') else _udebug := nil;{$ENDIF}

  UpdateActionList;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAllReports.SetCaptions;
  var
    s:string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAllReports.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    Self.Caption := GetRS(Self.Name,'TitleRep');
    colRepName.Caption := Self.Caption;
    //aPrint.Caption := GetRS('Common','Print');
  end;

  s := Self.Caption;
  SendMessage(ParentHandle, WM_SETPARENTCAPTION, integer(@S), 0);
  inherited;
  DoRefresh(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;


//==============================================================================================
procedure TfmAllReports.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAllReports.UpdateActionList') else _udebug := nil;{$ENDIF}

  aPrint.Enabled := not cdsReports.IsEmpty;
  aNew.Enabled := false;
  aPatternInsert.Enabled := false;
  aDel.Enabled := false;
  aDynamic.Enabled := false;
  aProperties.Enabled := false;
  aCheck.Enabled := false;
  aExcel.Enabled := false;
  aRefresh.Enabled := false;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAllReports.DoRefresh(const AID: integer; AParam: integer = 0);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAllReports.DoRefresh') else _udebug := nil;{$ENDIF}

  if AID <> 0 then GrpID := AID;
  DSRefresh(cdsReports, _ID_, AID);
  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAllReports.dbgReportsCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAllReports.dbgReportsCustomDrawCell') else _udebug := nil;{$ENDIF}

  try
    if odd(ANode.Index) and not ASelected then AColor := GridOddLinesColor;
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAllReports.dbgReportsDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAllReports.dbgReportsDblClick') else _udebug := nil;{$ENDIF}

  if dbgReports.Count > 0 then DoPrint;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAllReports.cdsReportsBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAllReports.cdsReportsBeforeOpen') else _udebug := nil;{$ENDIF}

  with cdsReports do begin
    ProviderName := 'pRep_List';
    FetchParams;
    Params.ParamByName('grpid').AsInteger := GrpID;
    Params.ParamByName('lang').AsString := LangName;
  end;//with cdsWaybill

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAllReports.dsMasterDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAllReports.dsMasterDataChange') else _udebug := nil;{$ENDIF}

  case cdsReports.FieldByName('repid').AsInteger of
    {3:begin// Отчёт о расходе по клиентам(Detail)
        with cdsDetail do begin
          Close;
          ProviderName := 'pRep_KAOutDetail';
          FetchParams;
          Params.ParamByName('fromdate').AsDateTime := FromDate;
          Params.ParamByName('todate').AsDateTime := ToDate;
          Params.ParamByName('kaid').AsInteger := cdsMaster.FieldByName('kaid').AsInteger;
          Open;
        end;//with cdsDetail
    end;//3:
    }

    4:begin// Отчёт о приходе по поставщикам(Detail)
        with cdsDetail do begin
          Close;
          ProviderName := 'pRep_KAInDetail';
          FetchParams;
          //Params.ParamByName('WTYPE').AsInteger := 1;//Приход
          Params.ParamByName('fromdate').AsDateTime := FromDate;
          Params.ParamByName('todate').AsDateTime := ToDate;
          Params.ParamByName('kaid').AsInteger := cdsMaster.FieldByName('kaid').AsInteger;
          Open;
        end;//with cdsDetail
    end;//4:

    8:begin// Отчёт по контрагенту приходные накладные(Detail)
        with cdsDetail do begin
          Close;
          ProviderName := 'pRep_KAOutSubDetail';
          FetchParams;
          Params.ParamByName('wbillid').AsInteger := cdsMaster.FieldByName('wbillid').AsInteger;
          Open;
        end;//with cdsDetail
    end;//8:

    {7:begin// Ведомость материальных остатков (Detail)//Сумма остатка
        with cdsDetail do begin
          Close;
          ProviderName := 'pRep_RestOnDateDetail';
          FetchParams;
          Params.ParamByName('matid').AsInteger := cdsMaster.FieldByName('matid').AsInteger;
          Params.ParamByName('ondate').AsDateTime := ToDate;
          Open;
        end;//with cdsDetail
    end;//7:
    }

  end;//case;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAllReports.dsDetailDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAllReports.dsDetailDataChange') else _udebug := nil;{$ENDIF}

  case cdsReports.FieldByName('repid').AsInteger of
    3:begin// Отчёт о расходе по клиентам(SubDetail)
        with cdsSubDetailFetch do begin
          Close;
          ProviderName := 'pRep_KAOutSubDetail';
          FetchParams;
          Params.ParamByName('wbillid').AsInteger := cdsDetail.FieldByName('wbillid').AsInteger;
          Open;
        end;//with cdsSubDetailFetch
    end;//3:

    4:begin// Отчёт о приходе по поставщикам (SubDetail)
        with cdsSubDetailFetch do begin
          Close;
          ProviderName := 'pRep_KAOutSubDetail';
          FetchParams;
          Params.ParamByName('wbillid').AsInteger := cdsDetail.FieldByName('wbillid').AsInteger;
          Open;
        end;//with cdsSubDetailFetch
    end;//4:

  end;//case;
  Application.ProcessMessages;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAllReports.frReport1GetValue(const ParName: String; var ParValue: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAllReports.frReport1GetValue') else _udebug := nil;{$ENDIF}

  if 0 = AnsiCompareText(ParName, 'usechart') then ParValue := integer(FUseDiagram)
  else if 0 = AnsiCompareText(ParName, 'BaseCurrID') then ParValue := BaseCurrID
  else if (0 = AnsiCompareText(ParName, 'fromdate')) then begin
    if FromDate > 0
      then ParValue := DateToStr(FromDate)
      else ParValue := '__________';
  end
  else if (0 = AnsiCompareText(ParName, 'todate')) then begin
    if ToDate <> MaxDateTime
      then ParValue := DateToStr(ToDate)
      else ParValue := '__________';
  end
  else if 0 = AnsiCompareText(ParName, 'matgrp') then ParValue := matgrp
  else if 0 = AnsiCompareText(ParName, 'pricedisplayformatex') then ParValue := PriceDisplayFormatEx
  else if 0 = AnsiCompareText(ParName, 'matname') then ParValue := matnamestr
  else if 0 = AnsiCompareText(ParName, 'msrname') then ParValue := msrname
  else if 0 = AnsiCompareText(ParName, 'whname') then ParValue := whname
  else if 0 = AnsiCompareText(ParName, 'kaname') then ParValue := kaname
  else if 0 = AnsiCompareText(ParName, 'rest') then ParValue := matrest
  else if 0 = AnsiCompareText(ParName, 'entname') then ParValue := EntName
  else if 0 = AnsiCompareText(ParName, 'ctypename') then ParValue := ctypename
  else if 0 = AnsiCompareText(ParName, 'restsumm') then ParValue := summrest
  else if 0 = AnsiCompareText(ParName, 'CLGRPCOLOR') then ParValue := PLGrpColor
  else if 0 = AnsiCompareText(ParName, 'printartikuls') then ParValue := Integer(FPrintArtikuls)
  else if 0 = AnsiCompareText(ParName, 'koefnds') then begin
    if RoundToA(cdsMaster.FieldByName('summin').AsFloat,-2)<>0
      then ParValue := cdsMaster.FieldByName('koefnds').AsFloat
      else ParValue := null;
  end
  else if 0 = AnsiCompareText(ParName, 'koef') then begin
    if RoundToA(cdsMaster.FieldByName('summin').AsFloat,-2)<>0
      then ParValue := cdsMaster.FieldByName('koef').AsFloat
      else ParValue := null;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAllReports.dsReportsDelayedDataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAllReports.dsReportsDelayedDataChange') else _udebug := nil;{$ENDIF}

  cdsMaster.Close;
  cdsDetail.Close;
  cdsSubDetailFetch.Close;
  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAllReports.dsMaster2DataChange(Sender: TObject; Field: TField);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAllReports.dsMaster2DataChange') else _udebug := nil;{$ENDIF}

  case cdsReports.FieldByName('repid').AsInteger of
    8:begin// Отчёт по контрагенту расходные накладные(Detail)
        with cdsDetail2 do begin
          Close;
          ProviderName := 'pRep_KAOutSubDetail';
          FetchParams;
          Params.ParamByName('wbillid').AsInteger := cdsMaster2.FieldByName('wbillid').AsInteger;
          Open;
        end;//with cdsDetail2
    end;//8:
  end;//case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAllReports.dbgReportsChangeNode(Sender: TObject; OldNode, Node: TdxTreeListNode);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAllReports.dbgReportsChangeNode') else _udebug := nil;{$ENDIF}

  OldNode.Values[colDocImg.Index] := 1;
  Node.Values[colDocImg.Index] := -1;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmAllReports.frReport1BeforePrint(Memo: TStringList; View: TfrView);
  var
    H:Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAllReports.frReport1BeforePrint') else _udebug := nil;{$ENDIF}

  case cdsReports.FieldByName('repid').AsInteger of
    1,2:begin
      if View.Name = 'mMatName' then begin
        if cdsMaster.FieldByName('matid').AsInteger < 0 then begin
          (View as TfrMemoView).x := 30;
          (View as TfrMemoView).dx := 696;
          (View as TfrMemoView).FillColor := PLGrpColor;
        end
        else begin
          (View as TfrMemoView).x := 68;
          (View as TfrMemoView).dx := 360;
          (View as TfrMemoView).FillColor := clWhite;
        end;
      end;//if
    end;//1,2

    12,17:begin
      case cdsReports.FieldByName('repid').AsInteger of
        12:begin//с НДС
          if cdsMaster.FieldByName('pribnds').AsFloat > 0 then begin
            if View.Name = 'nNo' then (View as TfrMemoView).FillColor := clWhite
            else if View.Name = 'mMatName' then (View as TfrMemoView).FillColor := clWhite
            else if View.Name = 'mAmountOut' then (View as TfrMemoView).FillColor := clWhite
            else if View.Name = 'mMsrName' then (View as TfrMemoView).FillColor := clWhite
            else if View.Name = 'mPriceDefIn' then (View as TfrMemoView).FillColor := clWhite
            else if View.Name = 'mSummIn' then (View as TfrMemoView).FillColor := clWhite
            else if View.Name = 'mNDSIn' then (View as TfrMemoView).FillColor := clWhite
            else if View.Name = 'mPriceDef' then (View as TfrMemoView).FillColor := clWhite
            else if View.Name = 'mSummOut' then (View as TfrMemoView).FillColor := clWhite
            else if View.Name = 'mNDSOut' then (View as TfrMemoView).FillColor := clWhite
            else if View.Name = 'mNDSDif' then (View as TfrMemoView).FillColor := clWhite
            else if View.Name = 'mPribNDS' then (View as TfrMemoView).FillColor := clWhite;
          end
          else begin
            if View.Name='nNo' then (View as TfrMemoView).FillColor := $E8E8FF
            else if View.Name = 'mMatName' then (View as TfrMemoView).FillColor := $E8E8FF
            else if View.Name = 'mAmountOut' then (View as TfrMemoView).FillColor := $E8E8FF
            else if View.Name = 'mMsrName' then (View as TfrMemoView).FillColor := $E8E8FF
            else if View.Name = 'mPriceDefIn' then (View as TfrMemoView).FillColor := $E8E8FF
            else if View.Name = 'mSummIn' then (View as TfrMemoView).FillColor := $E8E8FF
            else if View.Name = 'mNDSIn' then (View as TfrMemoView).FillColor := $E8E8FF
            else if View.Name = 'mPriceDef' then (View as TfrMemoView).FillColor := $E8E8FF
            else if View.Name = 'mSummOut' then (View as TfrMemoView).FillColor := $E8E8FF
            else if View.Name = 'mNDSOut' then (View as TfrMemoView).FillColor := $E8E8FF
            else if View.Name = 'mNDSDif' then (View as TfrMemoView).FillColor := $E8E8FF
            else if View.Name = 'mPribNDS' then (View as TfrMemoView).FillColor := $E8E8FF;
          end;
        end;//12

        17:begin
          if cdsMaster.FieldByName('prib').AsFloat>0 then begin
            if View.Name = 'nNo' then (View as TfrMemoView).FillColor := clWhite
            else if View.Name = 'mMatName' then (View as TfrMemoView).FillColor := clWhite
            else if View.Name = 'mAmountOut' then (View as TfrMemoView).FillColor := clWhite
            else if View.Name = 'mMsrName' then (View as TfrMemoView).FillColor := clWhite
            else if View.Name = 'mPriceDefIn' then (View as TfrMemoView).FillColor := clWhite
            else if View.Name = 'mSummIn' then (View as TfrMemoView).FillColor := clWhite
            else if View.Name = 'mNDSIn' then (View as TfrMemoView).FillColor := clWhite
            else if View.Name = 'mPriceDef' then (View as TfrMemoView).FillColor := clWhite
            else if View.Name = 'mSummOut' then (View as TfrMemoView).FillColor := clWhite
            else if View.Name = 'mNDSOut' then (View as TfrMemoView).FillColor := clWhite
            else if View.Name = 'mNDSDif' then (View as TfrMemoView).FillColor := clWhite
            else if View.Name = 'mPrib' then (View as TfrMemoView).FillColor := clWhite;
          end
          else begin
            if View.Name = 'nNo' then (View as TfrMemoView).FillColor := $E8E8FF
            else if View.Name = 'mMatName' then (View as TfrMemoView).FillColor := $E8E8FF
            else if View.Name = 'mAmountOut' then (View as TfrMemoView).FillColor := $E8E8FF
            else if View.Name = 'mMsrName' then (View as TfrMemoView).FillColor := $E8E8FF
            else if View.Name = 'mPriceDefIn' then (View as TfrMemoView).FillColor := $E8E8FF
            else if View.Name = 'mSummIn' then (View as TfrMemoView).FillColor := $E8E8FF
            else if View.Name = 'mNDSIn' then (View as TfrMemoView).FillColor := $E8E8FF
            else if View.Name = 'mPriceDef' then (View as TfrMemoView).FillColor := $E8E8FF
            else if View.Name = 'mSummOut' then (View as TfrMemoView).FillColor := $E8E8FF
            else if View.Name = 'mNDSOut' then (View as TfrMemoView).FillColor := $E8E8FF
            else if View.Name = 'mNDSDif' then (View as TfrMemoView).FillColor := $E8E8FF
            else if View.Name = 'mPrib' then (View as TfrMemoView).FillColor := $E8E8FF;
          end;
        end;//13
      end;//case

      if View.Name = 'mMatName' then begin
        if cdsMaster.FieldByName('matid').AsInteger<0 then begin
          (View as TfrMemoView).x := 28;
          (View as TfrMemoView).dx := 1013;
          (View as TfrMemoView).FillColor := PLGrpColor;
        end
        else begin
          (View as TfrMemoView).x := 68;
          case cdsReports.FieldByName('repid').AsInteger of
            12: (View as TfrMemoView).dx := 220;
            13, 17: (View as TfrMemoView).dx := 387;
          end;
          //(View as TfrMemoView).FillColor := clWhite;
        end;
      end;
    end;//12,13

    10:begin
      if View.Name = 'mMatName' then begin
        if cdsMaster.FieldByName('matid').AsInteger < 0 then begin
          (View as TfrMemoView).x := 21;
          (View as TfrMemoView).dx := 1021;
          (View as TfrMemoView).FillColor := PLGrpColor;
        end
        else begin
          (View as TfrMemoView).x := 51;
          (View as TfrMemoView).dx := 235;
          (View as TfrMemoView).FillColor := clWhite;
        end;//
      end;//if
    end;//10

    {18:begin
      if View.Name='mMatName' then begin
        if cdsMaster.FieldByName('matid').AsInteger < 0 then begin
          (View as TfrMemoView).x := 23;
          (View as TfrMemoView).dx := 711;
          (View as TfrMemoView).FillColor := PLGrpColor;
        end
        else begin
          (View as TfrMemoView).x := 53;
          (View as TfrMemoView).dx := 402;
          (View as TfrMemoView).FillColor := clWhite;
        end;
      end;
    end;
    }
  end;//case

  if (View.Name = 'Chart1') then begin
    TfrChartView(View).Visible := FUseDiagram;
    case cdsReports.FieldByName('repid').AsInteger of
      6,5: begin//Дебиторы
        H := DBChart1.Height;
        if H < 200
          then TfrChartView(View).dy := 200
          else TfrChartView(View).dy := H;
        TfrChartView(View).AssignChart(DBChart1);
      end;

      15:begin//Динамика продаж
        H := DBChart1.Height;
        if H < 200
          then TfrChartView(View).dy := 200
          else TfrChartView(View).dy := H;
        TfrChartView(View).AssignChart(DBChart1);
      end;
    end;//case
  end;

  if (View.Name = 'EntLogo') and FUseLogo and (EntLogo.Size > 0) then begin
    EntLogo.Position := 0;
    TfrPictureView(View).Picture.Bitmap.LoadFromStream(EntLogo);
  end;//if EntLogo

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAllReports.dbgRefGetImageIndex(Sender: TObject; Node: TdxTreeListNode; var Index: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAllReports.dbgRefGetImageIndex') else _udebug := nil;{$ENDIF}

  if Node.Values[colMatId.Index] < 0 then begin
    if Node.Expanded
      then Index := 49
      else Index := 48;
  end
  else index := 14;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAllReports.frReport1BeginBand(Band: TfrBand);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAllReports.frReport1BeginBand') else _udebug := nil;{$ENDIF}

  case cdsReports.FieldByName('repid').AsInteger of
    8: if (Band.Name='Child2')or(Band.Name='ReportSummary1') then frReport1.Pages.Pages[0].NewPage;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmAllReports.DoHelp;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAllReports.DoHelp') else _udebug := nil;{$ENDIF}

  case GrpID of
    35: ShowHelpTopic('RepSklad');
    36: ShowHelpTopic('RepFin');
    37: ShowHelpTopic('RepKontr');
    41: ShowHelpTopic('RepDoc');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAllReports.aRefreshExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAllReports.aRefreshExecute') else _udebug := nil;{$ENDIF}

  DoRefresh(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAllReports.cdsReportsAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAllReports.cdsReportsAfterOpen') else _udebug := nil;{$ENDIF}

  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAllReports.NotifyChanged;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAllReports.NotifyChanged') else _udebug := nil;{$ENDIF}

  if not JumpFromBuffer
    then frmMainForm.AddToBuffer(vtReports, FunID, Self.Caption, ClassName, Tag, FCurrentID, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAllReports.colDocImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmAllReports.colDocImgGetText') else _udebug := nil;{$ENDIF}

  AText := '1';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmAllReports.cdsSubDetailFetchAfterOpen(DataSet: TDataSet);
begin
  inherited;
  CopyDataSet(cdsSubDetail, cdsSubDetailFetch);
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fAllReports', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.


