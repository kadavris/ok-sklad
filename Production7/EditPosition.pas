{$I ok_sklad.inc}
unit EditPosition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxCntner, dxEditor, StdCtrls,
  ActnList, ssBaseTypes, ssFormStorage, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxLookAndFeelPainters, cxCheckBox, cxButtons, ssBaseDlg,
  cxMemo, cxDBEdit, cxDropDownEdit, cxCalc, Buttons, cxMaskEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, ssDBComboBox, DB,
  DBClient, ssClientDataSet, Grids, DBGrids, cxListView, Mask,
  //dxTL, dxDBCtrl, dxDBGrid, dxCntner6, dxDBTLCl, dxGrClms, 
  ssBevel, ImgList, ssSpeedButton, ssPanel, ssGradientPanel,ssBaseConst, ssCalcEdit,
  ssLabel, ssDBLookupCombo, TB2Item, Menus, xButton, cxButtonEdit,
  okSearchEdit, cxCalendar;

type
  TfrmEditPosition = class(TBaseDlg)
    cdsWhouse: TssClientDataSet;
    cdsWhouseWID: TIntegerField;
    cdsWhouseNAME: TStringField;
    cdsWhouseADDR: TStringField;
    cdsWhouseNOTES: TStringField;
    cdsWhouseDELETED: TIntegerField;
    dsWhouse: TDataSource;
    cdsMeasure: TssClientDataSet;
    dsMeasure: TDataSource;
    ssBevel8: TssBevel;
    aAddMat: TAction;
    aAddWHouse: TAction;
    cdsWhouseDEF: TIntegerField;
    cdsFind: TssClientDataSet;
    aSN: TAction;
    aShowNDS: TAction;
    btnInfo: TssSpeedButton;
    btnMove: TssSpeedButton;
    btnRsv: TssSpeedButton;
    btnMC: TssSpeedButton;
    btnSetPanels: TssSpeedButton;
    aSetPanels: TAction;
    panMat: TPanel;
    bvlMat: TssBevel;
    edMat: TokMatSearchEdit;
    lWHouse: TssLabel;
    cbWHouse: TssDBLookupCombo;
    sbAddWHouse: TssSpeedButton;
    panPrice: TPanel;
    bvlPrice: TssBevel;
    lAmount: TssLabel;
    lPrice: TLabel;
    edPrice: TssCalcEdit;
    edAmount: TssCalcEdit;
    stMeasureName: TssBevel;
    stCurrShortName: TssBevel;
    lRemain: TLabel;
    stRemain: TssBevel;
    lPriceNoNDS: TssLabel;
    edPriceNoNDS: TssCalcEdit;
    stCurrShortNameOutNDS: TssBevel;
    lNDSRate: TssLabel;
    edNDS: TssCalcEdit;
    btnShowNDS: TssSpeedButton;
    panSN: TPanel;
    bvlSN: TssBevel;
    lSN: TLabel;
    edSN: TcxButtonEdit;
    panPriceInterval: TPanel;
    bvlPriceInterval: TssBevel;
    panSummary: TPanel;
    bvlSummary: TssBevel;
    PanAddProps: TPanel;
    bvlAddPrps: TssBevel;
    lProducer: TssLabel;
    lCertNum: TssLabel;
    lCertDate: TssLabel;
    lGTD: TssLabel;
    edCertNum: TcxTextEdit;
    edCertDate: TcxDateEdit;
    edGTD: TcxTextEdit;
    cbProducer: TcxComboBox;
    lRemainAll: TLabel;
    stRemainAll: TssBevel;
    stRsv: TssBevel;
    lRsv: TLabel;
    lPriceInterval: TssLabel;
    sbShowPriceIn: TssSpeedButton;
    panPriceIn: TPanel;
    lMinPrice: TLabel;
    stMinPrice: TssBevel;
    stMaxPrice: TssBevel;
    lMaxPrice: TLabel;
    lAvgPrice: TLabel;
    stAvgPrice: TssBevel;
    lSummary: TLabel;
    lAmountEx: TLabel;
    stAmountEx: TssBevel;
    txtSummAmount: TssBevel;
    lSummWONDS: TLabel;
    stSumm: TssBevel;
    txtSummWONDS: TssBevel;
    lNDS: TssLabel;
    stSummNDS: TssBevel;
    txtSummNDS: TssBevel;
    lSummWithNDS: TssLabel;
    stSummWithNDS: TssBevel;
    txtSummWithNDS: TssBevel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure DataModified(Sender: TObject);
    procedure edNamePropertiesChange(Sender: TObject);
    procedure edShortNamePropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbWhousePropertiesChange(Sender: TObject);
    procedure edAmountPropertiesChange(Sender: TObject);
    procedure edSummCurrPropertiesChange(Sender: TObject);
    procedure edPriceNondsPropertiesChange(Sender: TObject);
    procedure edSummCurrNoNdsPropertiesChange(Sender: TObject);
    procedure aAddMatExecute(Sender: TObject);
    procedure aAddWHouseExecute(Sender: TObject);
    procedure edPricePropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbWHouseKeyPress(Sender: TObject; var Key: Char);
    procedure edAmountKeyPress(Sender: TObject; var Key: Char);
    procedure edPriceKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
    procedure btnInfoClick(Sender: TObject);
    procedure btnMoveClick(Sender: TObject);
    procedure btnRsvClick(Sender: TObject);
    procedure edPricePropertiesEditValueChanged(Sender: TObject);
    procedure edPriceNoNDSPropertiesEditValueChanged(Sender: TObject);
    procedure sbShowPriceInClick(Sender: TObject);
    procedure btnMCClick(Sender: TObject);
    procedure aSNExecute(Sender: TObject);
    procedure edSNPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure edNDSPropertiesChange(Sender: TObject);
    procedure aShowNDSExecute(Sender: TObject);
    procedure edMatChange(Sender: TObject);
    procedure edMatRefButtonClick(Sender: TObject);
    procedure aSetPanelsExecute(Sender: TObject);
    procedure cbProducerPropertiesInitPopup(Sender: TObject);
  private
    FMode: Integer;
    FCurrShortName: string;
    FRealigned: Boolean;

    FPanSummaryVis, FPanSNVis, FPanPriceIntervalVis, FPanAddPropsVis: Boolean;
    FCurrName: string;
    procedure WMLayoutChanged(var M: TMessage); message WM_LAYOUTCHANGED;
    procedure WMRealignPanels(var M: TMessage); message WM_REALIGNPANELS;
    procedure SetMode(const Value: Integer);
    procedure SetCurrShortName(const Value: string);
    procedure RealignPanels;
    procedure SavePanVisibility;
    procedure LoadPanVisibility;
    procedure SetCurrName(const Value: string);
  private
    function SummCurr:Extended;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    procedure GetPrice(APrice: Extended);
    procedure SetCurrID(const Value: integer);
    procedure WMRecordChanged(var M: TMessage); message WM_RECORDCHANGED;
    function GetUDocCount(DS: TDataSet; WType: Integer): Integer;
    procedure GetProducers;
  protected
    FOldAmount: Extended;
    FOldSum: Extended;
    FWBillID: Integer;
    FKAID: Integer;
    FCanRefresh: boolean;
    FCurrID: integer;
    FKeyPressed: Boolean;
    LastInPrice: Extended;
    FModified: boolean;
    EdCanChange: Boolean;
    procedure CalcSummary;
    procedure setid(const Value: integer); override;
  public
    { Public declarations }
    PosNDS: Extended;
    CurrDefName: string;
    WbillType:Integer;
    Kurs: Extended;
    ParentHandle: HWND;
    property CurrID: integer read FCurrID write SetCurrID;
    property CurrName: string read FCurrName write SetCurrName;
    property Mode: Integer read FMode write SetMode;
    procedure SetCaptions; override;
    procedure LoadSkin; override;
    property CurrShortName: string read FCurrShortName write SetCurrShortName;
  end;

var
  frmEditPosition: TfrmEditPosition;

implementation
  var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';



uses prConst, ClientData, Login, prFun, ssFun, prTypes,
  dxmdaset,fMaterials,fWHouse, ssRegUtils, fMessageDlg, EditMaterials,
  MatMove, MatRsv, ssBaseIntfDlg, MCList, ssStrUtil, Serials, SetPanels;

{$R *.dfm}

procedure TfrmEditPosition.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.WMRefresh') else _udebug := nil;{$ENDIF}


  case TRefType(M.LParam) of
   rtMat:
     edMat.MatID := M.WParam;
   rtWHouse:
     begin
       DSRefresh(cdsWhouse, 'wid', M.WParam);
       cbWhouse.KeyValue := M.WParam;
     end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//Функция суммы в валюте
function TfrmEditPosition.SummCurr:Extended;
var res:Extended;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.SummCurr') else _udebug := nil;{$ENDIF}


  res:=edAmount.Value*edPrice.Value;
//  stSumm.Caption:=FormatFloat('0.00',res)+;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.setid(const Value: integer);
var
  FSumWONDS, FNDS: Extended;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.setid') else _udebug := nil;{$ENDIF}


  if Mode = 1 then begin
    FID := Value;
    with TssClientDataSet.Create(nil) do
    try
      RemoteServer := dmData.SConnection;
      ProviderName := 'pWaybillDet_GetPos';
      FetchParams;
      Params.ParamByName('posid').AsInteger := Value;
      Open;
      CurrID := FieldByName('currid').AsInteger;
      Kurs := FieldByName('onvalue').AsFloat;
      edMat.MatID := FieldByName('matid').AsInteger;
      cbWHouse.KeyValue := FieldByName('wid').AsInteger;
      PosNDS := FieldByName('nds').AsFloat;
      edAmount.Value := FieldByName('amount').AsFloat;
      FOldAmount := FieldByName('amount').AsFloat;
      edNDS.Value := FieldByName('nds').AsFloat;
      cbProducer.Text := FieldByName('producer').AsString;
      edGTD.Text := FieldByName('gtd').AsString;
      edCertNum.Text := FieldByName('certnum').AsString;
      edCertDate.Date := FieldByName('certdate').AsDateTime;
      if edCertDate.Date = 0 then edCertDate.EditText := '';
      Self.OnDate := FieldByName('ondate').AsDateTime;
      FWBillID := FieldByName('wbillid').AsInteger;
      FKAID := FieldByName('kaid').AsInteger;
      EdCanChange := True;
      edPrice.Value := FieldByName('price').AsFloat;
      edPricePropertiesChange(edPrice);
      CurrShortName := FieldByName('shortname').AsString;
      CurrName := FieldByName('shortname').AsString;
      NDSCalc(FieldByName('amount').AsFloat, FieldByName('price').AsFloat * Kurs,
        PosNDS, 1, FSumWONDS, FNDS);
      FOldSum := RoundToA(FSumWONDS + FNDS, -2);
      Close;
      CalcSummary;
      FModified := False;
      edMat.Enabled := False;
      cbWHouse.Enabled := False;
      lWHouse.Enabled := False;
      aAddWHouse.Enabled := False;
      edSN.Enabled := False;
    finally
      Free;
    end;
  end
  else begin
    PosNDS := NDS;
    if Value <> 0 then begin
      Fid := Value;
      with TdxMemData(pointer(Tag)) do begin
        edMat.MatID := FieldByName('matid').AsInteger;
        cbWhouse.KeyValue := FieldByName('wid').AsInteger;
        PosNDS := FieldByName('nds').AsFloat;
        edAmount.Value := FieldByName('amount').AsFloat;
        edPrice.Value := FieldByName('price').AsFloat;
        cbProducer.Text := FieldByName('producer').AsString;
        edGTD.Text := FieldByName('gtd').AsString;
        edCertNum.Text := FieldByName('certnum').AsString;
        edCertDate.Date := FieldByName('certdate').AsDateTime;
        if edCertDate.Date = 0 then edCertDate.EditText := '';
        if edMat.IsSerial and (not FieldByName('SN').IsNull) then begin
          edSN.Properties.LookupItems.Add(FieldByName('SN').AsString);
          edSN.Text := FieldByName('SN').AsString;
        end;
      end;
    end
    else begin
      edMat.MatID := 0;
      edAmount.Value := WBInDefAmount;
      edPrice.Value := 0;
  //    cbWHouse.KeyValue:=
  //    if cdsWHouse.Locate('def', 1, []) then cbWhouse.KeyValue:=cdsWHouse.fieldbyname('wid').AsInteger
  //    else cbWHouse.KeyValue:=cbWHouse.EmptyValue;
    end;//else
    edNDS.Value := PosNDS;
    edPricePropertiesChange(edPrice);
    EdCanChange := True;
    FModified := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  NewRecord: Boolean;
  NextId: Integer;
  i, FWBMID: Integer;
  FAmount, FSumWONDS, FNDS, FPrice, FSum, FCurrAmount, FDiff, FDiffSum: Extended;
  FNDS_Old, FSumWONDS_Old: Extended;
  cdsDocs: TssClientDataSet;
  FWBMCount, FRetOutCount, FWriteOffCount, FRetInCount, FWType: Integer;
  WBMRefresh: Boolean;
  strDocs: string;
  FCertDate: TDateTime;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.FormCloseQuery') else _udebug := nil;{$ENDIF}


  Screen.Cursor := crSQLWait;
  try
    if ModalResult in [mrOK, mrYes] then begin
      CanClose := False;
      if Mode = 0 then begin
        with TdxMemData(pointer(Tag)) do begin
          if not edMat.IsSerial then begin
            if ID = 0 then  begin
              NextID := dsNextPosID(Fields[0].DataSet);
              Append;
              FieldByName('posid').AsInteger := NextID;
            end else Edit;
            FieldByName('matid').AsInteger := edMat.MatID;
            FieldByName('matname').AsString := edMat.MatName;
            FieldByName('producer').AsString := edMat.Producer;
            FieldByName('wid').AsInteger:=cbWhouse.KeyValue;
            FieldByName('whname').AsString:=cbWhouse.EditText;
            FieldByName('amount').AsFloat:=StrToFloat(edAmount.EditingText);
            FieldByName('price').AsFloat:=StrToFloat(edPrice.EditingText);
            FieldByName('msrname').AsString:=stMeasureName.Caption;
            FieldByName('currid').AsInteger:=CurrID;
            FieldByName('NDS').AsFloat := PosNDS;
            FieldByName('onvalue').AsFloat := Kurs;
            FieldByName('artikul').AsString := edMat.Artikul;
            FieldByName('gtd').AsString := edGTD.EditingText;
            FieldByName('certnum').AsString := edCertNum.EditingText;
            FieldByName('producer').AsString := cbProducer.EditingText;
            try
              FCertDate := StrToDate(edCertDate.EditingText);
            except
              FCertDate := 0;
            end;
            if FCertDate = 0
              then FieldByName('certdate').Clear
              else FieldByName('certdate').AsDateTime := FCertDate;
            FieldByName('SN').Clear;
            Post;
          end
          else begin
            if (ID>0) and Locate('posid',ID,[]) then Delete;
            for i := 0 to Round(StrToFloat(edAmount.EditingText)) - 1 do begin
              NextID:=dsNextPosID(Fields[0].DataSet);
              if ID>0 then Insert else Append;
              FieldByName('posid').AsInteger := NextID;
              FieldByName('matid').AsInteger := edMat.MatID;
              FieldByName('matname').AsString := edMat.MatName;
              FieldByName('wid').AsInteger := cbWhouse.KeyValue;
              FieldByName('whname').AsString := cbWhouse.EditText;
              FieldByName('amount').AsFloat := 1;
              FieldByName('price').AsFloat := StrToFloat(edPrice.EditingText);
              FieldByName('msrname').AsString := stMeasureName.Caption;
              FieldByName('currid').AsInteger := CurrID;
              FieldByName('NDS').AsFloat := PosNDS;
              FieldByName('onvalue').AsFloat := Kurs;
              FieldByName('artikul').AsString := edMat.Artikul;
              FieldByName('SN').AsString := edSN.Properties.LookupItems[i];
              FieldByName('gtd').AsString := edGTD.EditingText;
              FieldByName('certnum').AsString := edCertNum.EditingText;
              FieldByName('producer').AsString := cbProducer.EditingText;
              try
                FCertDate := StrToDate(edCertDate.EditingText);
              except
                FCertDate := 0;
              end;
              if FCertDate = 0
                then FieldByName('certdate').Clear
                else FieldByName('certdate').AsDateTime := FCertDate;
              Post;
            end;//for
          end;//else
          SendMessage(ParentHandle, WM_REFRESH, 0, 9);
        end;//with TdxMemData(pointer(Tag))

        if ID = 0 then begin
          if ModalResult = mrYes then begin
            edMat.MatID := 0;
            edMat.Editor.SetFocus;
            stMinPrice.Caption := EmptyStr;
            stMaxPrice.Caption := EmptyStr;
            stAvgPrice.Caption := EmptyStr;
            stRemain.Caption := EmptyStr;
            if cbProducer.Properties.Items.IndexOf(cbProducer.EditingText) = -1
              then cbProducer.Properties.Items.Add(cbProducer.EditingText);
            ID := 0;
           {Очистить поля}
          end
          else CanClose := True;
        end//if ID=0
        else begin
          if ModalResult = mrOK then CanClose := True;
        end;
      end
      else begin
        try
          FAmount := StrToFloat(edAmount.EditingText);
        except
          FAmount := 0;
        end;
        try
          FPrice := StrToFloat(edPrice.EditingText);
        except
          FPrice := 0;
        end;

        NDSCalc(FAmount, FPrice * Kurs, PosNDS, 1, FSumWONDS, FNDS);
        FSum := RoundToA(FNDS + FSumWONDS, -2);

        with TssClientDataSet.Create(nil) do
        try
          cdsDocs := TssClientDataSet.Create(nil);
          cdsDocs.RemoteServer := dmData.SConnection;
          cdsDocs.ProviderName := 'pWaybill_GetRelDocs';
          cdsDocs.FetchParams;
          cdsDocs.Params.ParamByName('posid').AsInteger := FID;
          cdsDocs.Open;
          if not cdsDocs.IsEmpty then begin
            FWBMCount := GetUDocCount(cdsDocs, 4);
            FRetOutCount := GetUDocCount(cdsDocs, -6);
            FRetInCount := GetUDocCount(cdsDocs, 6);
            FWriteOffCount := GetUDocCount(cdsDocs, -5);
            strDocs := '';
            if FWBMCount > 0 then strDocs := strDocs + IntToStr(FWBMCount) + ' ' +
              LangMan.GetRS('fmWaybill', 'DocsWBM') + ', ';
            if FWriteOffCount > 0 then strDocs := strDocs + IntToStr(FWriteOffCount) + ' ' +
              LangMan.GetRS('fmWaybill', 'DocsWriteOff') + ', ';
            if FRetOutCount > 0 then strDocs := strDocs + IntToStr(FRetOutCount) + ' ' +
              LangMan.GetRS('fmWaybill', 'DocsRetOut') + ', ';
            if FRetInCount > 0 then strDocs := strDocs + IntToStr(FRetInCount) + ' ' +
              LangMan.GetRS('fmWaybill', 'DocsRetIn') + ', ';
            if strDocs <> '' then System.Delete(strDocs, Length(strDocs) - 1, 2);
            if ssMessageDlg(Format(LangMan.GetRS('fmWaybill', 'DocsToRecalc'), [strDocs]),
              ssmtWarning, [ssmbYes, ssmbNo]) <> mrYes then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

          end;

          TrStart;
          try
            RemoteServer := dmData.SConnection;

            cdsDocs.First;
            FDiffSum := 0;
            while not cdsDocs.Eof do begin
              NDSCalc(cdsDocs.FieldByName('amount').AsFloat,
                cdsDocs.FieldByName('price').AsFloat *
                cdsDocs.FieldByName('onvalue').AsFloat,
                cdsDocs.FieldByName('nds').AsFloat, 1, FSumWONDS_Old, FNDS_Old);
              FDiff := RoundToA(FSumWONDS_Old + FNDS_Old, -2);
              NDSCalc(cdsDocs.FieldByName('amount').AsFloat,
                FPrice * cdsDocs.FieldByName('onvalue').AsFloat,
                cdsDocs.FieldByName('nds').AsFloat, 1, FSumWONDS_Old, FNDS_Old);
              FDiff := RoundToA(FSumWONDS_Old + FNDS_Old, -2) - FDiff;
              FDiffSum := FDiffSum + FDiff;
              FWBMID := cdsDocs.FieldByName('wbillid').AsInteger;
              FWType := cdsDocs.FieldByName('wtype').AsInteger;

              ProviderName := 'pWaybillDet_UpdPrice';
              FetchParams;
              Params.ParamByName('posid').AsInteger := cdsDocs.FieldByName('posid').AsInteger;
              Params.ParamByName('price').AsFloat := FPrice;
              Params.ParamByName('nds').AsFloat := PosNDS;
              Execute;

              cdsDocs.Next;
              if cdsDocs.Eof or (cdsDocs.FieldByName('wbillid').AsInteger <> FWBMID) then
                if (FDiffSum <> 0) and (FWType <> 6) then begin
                  ProviderName := 'pWaybill_UpdSum';
                  FetchParams;
                  Params.ParamByName('wbillid').AsInteger := FWBMID;
                  Params.ParamByName('summpos').AsFloat := FDiffSum;
                  Execute;
                  WBMRefresh := True;
                end;
            end;

            ProviderName := 'pWMat_PosRemainGet';
            FetchParams;
            Params.ParamByName('posid').AsInteger := FID;
            Params.ParamByName('ondate').AsDateTime := MaxDateTime;
            Open;
            FCurrAmount := FieldByName('remain').AsFloat - FieldByName('rsv').AsFloat;
            Close;

            if (FOldAmount > FAmount) and ((FOldAmount - FAmount) > FCurrAmount) then begin
              TrRollback;
              ssMessageDlg(Format(LangMan.GetRS('fmWaybill', 'WrongAmount'), [FOldAmount - FCurrAmount]),
                ssmtError, [ssmbOk]);
                begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

            end;

            ProviderName := 'pWaybillDet_Upd';
            FetchParams;
            Params.ParamByName('posid').AsInteger := FID;
            Params.ParamByName('price').AsFloat := FPrice;
            Params.ParamByName('amount').AsFloat := FAmount;
            Params.ParamByName('nds').AsFloat := PosNDS;
            Execute;

            ProviderName := 'pWaybillDetAP_Del';
            FetchParams;
            Params.ParamByName('posid').AsInteger := FID;
            Execute;

            ProviderName := 'pWaybillDetAP_Ins';
            FetchParams;
            Params.ParamByName('posid').AsInteger := FID;
            Params.ParamByName('producer').AsString := cbProducer.EditingText;
            Params.ParamByName('certnum').AsString := edCertNum.EditingText;;
            Params.ParamByName('gtd').AsString := edGTD.EditingText;
            if Trim(edCertDate.EditingText) = EmptyStr then begin
              Params.ParamByName('certdate').DataType := ftDateTime;
              Params.ParamByName('certdate').Clear;
            end
            else Params.ParamByName('certdate').AsDateTime := edCertDate.Date;
            Execute;

            ProviderName := 'pWaybill_UpdSum';
            FetchParams;
            Params.ParamByName('wbillid').AsInteger := FWBillID;
            Params.ParamByName('summpos').AsFloat := FSum - FOldSum;
            Execute;

            ProviderName := 'pWMatTurn_UpdPos';
            FetchParams;
            Params.ParamByName('posid').AsInteger := FID;
            Params.ParamByName('amount').AsFloat := FAmount;
            Execute;

            TrCommit;

            DoRecalcKASaldo(dmData.SConnection, FKAID, Self.OnDate,
              LangMan.GetRS('fmKAgent', 'RecalcBallance'));
            SendMessage(ParentHandle, WM_REFRESH, 0, 0);
            frmMainForm.ExecRefresh('TfmWMat', 0);
            if FWBMCount > 0 then frmMainForm.ExecRefresh('TfmWaybillMov', 0);
            if FRetOutCount > 0 then frmMainForm.ExecRefresh('TfmWBReturnOut', 0);
            if FWriteOffCount > 0 then frmMainForm.ExecRefresh('TfmWriteOff', 0);
          except
            TrRollback;
            raise;
          end;
        finally
          Free;
          cdsDocs.Close;
          cdsDocs.Free;
        end;

        if ModalResult = mrOk then CanClose := True
          else FModified := False;
      end;  
    end
    else CanClose:=true;
    FModified:=false;
  finally
    Screen.Cursor := crDefault;
  end;  

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.ActionListUpdate') else _udebug := nil;{$ENDIF}


  edSN.Enabled := (edMat.IsSerial and (edMat.MatID > 0) and (Mode = 0));

  lNDSRate.Visible := btnShowNDS.Checked;
  edNDS.Visible := btnShowNDS.Checked;

  if edMat.Focused then aAddMat.ShortCut := TextToShortCut('Ctrl+Ins')
    else aAddMat.ShortCut := TextToShortCut('');
  if cbWhouse.Focused then aAddWHouse.ShortCut := TextToShortCut('Ctrl+Ins')
    else aAddWHouse.ShortCut := TextToShortCut('');

  try
    aOk.Enabled:= (edMat.MatID > 0) and
      (StrToFloat(edAmount.EditingText) > 0) and
      (((StrToFloat(edPrice.EditingText) > 0) and not WBInAllowZero) or WBInAllowZero)
      and ((edMat.IsSerial and (Round(StrToFloat(edAmount.EditingText))=edSN.Properties.LookupItems.Count)) or (not edMat.IsSerial))
      and (PosNDS >= 0) and FModified;

    aApply.Enabled := aOk.Enabled and FModified;
  except
    aOk.Enabled := False;
    aApply.Enabled := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.DataModified') else _udebug := nil;{$ENDIF}


  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.SetCaptions') else _udebug := nil;{$ENDIF}


  with LangMan do begin
    aOK.Caption := GetRS('Common', 'OK');
    aCancel.Caption := GetRS('Common', 'Cancel');
    aApply.Caption := GetRS('Common', 'Apply');
    lWhouse.Caption := GetRS('fmWaybill', 'WHouse') + ':';
    lAmount.Caption := GetRS('fmWaybill', 'Amount') + ':';
    lAmountEx.Caption := GetRS('fmWaybill', 'Amount') + ':';
    lSummary.Caption := GetRS('fmWaybill', 'Total') + ':';
    lSummWithNDS.Caption := GetRS('fmWaybill', 'Summ') + ' ' +
      GetRS(ParentNameEx, 'withNDS') + ':';
    btnSetPanels.Hint := GetRS('fmWaybill', 'SetPanels');

    sbShowPriceIn.Hint := GetRS('fmWaybill','ShowPriceIn');

    lMinPrice.Caption := GetRS('fmWaybill','MinPrice') + ':';
    lMaxPrice.Caption := GetRS('fmWaybill','MaxPrice') + ':';
    lAvgPrice.Caption := GetRS('fmWaybill','AvgPrice') + ':';
    lPriceInterval.Caption := GetRS('fmWaybill', 'InPriceInterval') + ':';

    aAddMat.Hint := GetRS('fmWaybill', 'MatAdd');
    aAddWHouse.Hint := GetRS('fmWaybill', 'WHouseRef');
    btnShowNDS.Hint := GetRS('fmWaybill', 'ShowNDS');

    lPrice.Caption := GetRS('fmWaybill', 'PriceWithNDS') + ':';
    lPriceNoNDS.Caption := GetRS('fmWaybill', 'PriceWONDS') + ':';
    lRsv.Caption := GetRS('fmWaybill', 'Rsv') + ':';
    lRemainAll.Caption := GetRS('fmWaybill', 'RemainAll') + ':';
    lRemain.Caption := GetRS('fmWaybill', 'WBInRemain') + ':';

    edMat.InitRes;
    edMat.SearchNames[0] := GetRS('fmInventory', 'NameShort') + ';name';
    if edMat.CurrentSearchIndex = 0
      then edMat.Caption.Caption := GetRS('fmInventory', 'NameShort') + ':';

    btnRsv.Hint := GetRS('fmWaybill','RsvInfo');
    btnMove.Hint := GetRS('fmWaybill','MoveInfo');
    btnInfo.Hint := GetRS('fmWaybill','MatInfo');
    btnMC.Hint := GetRS('fmWaybill','MCList');
    lSN.Caption := GetRS('fmWaybill', 'SNs') + ':';
    lNDSRate.Caption := GetRS('fmMaterials', 'NDSRate') + ':';
    lGTD.Caption := GetRS('fmWaybill', 'GTD') + ':';
    lCertNum.Caption := GetRS('fmWaybill', 'CertNum') + ':';
    lCertDate.Caption := GetRS('fmWaybill', 'CertDate') + ':';
    lProducer.Caption := GetRS('fmWaybill', 'Producer') + ':';
  end;//with

  inherited;
  

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.edNamePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edNamePropertiesChange') else _udebug := nil;{$ENDIF}


//     lWName.Visible:=Trim(edName.Text)=EmptyStr;
//     DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.edShortNamePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edShortNamePropertiesChange') else _udebug := nil;{$ENDIF}


     DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.FormCreate(Sender: TObject);
var
  Temp: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.FormCreate') else _udebug := nil;{$ENDIF}


  sbShowPriceIn.Checked := True;
  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'PriceVis', Temp) then begin
    sbShowPriceIn.Checked := Temp = 1;
    panPriceIn.Visible := Temp = 1;
  end;
  edMat.SetLng;

  SetCaptions;

{  dmData.i15.GetBitmap(0, edAmount.Properties.ButtonGlyph);
  dmData.i15.GetBitmap(0, edPrice.Properties.ButtonGlyph);
  dmData.i15.GetBitmap(0, edPriceNoNDS.Properties.ButtonGlyph);
  dmData.i15.GetBitmap(0, edNDS.Properties.ButtonGlyph);}

  btnShowNDS.ImageIndex := 104;
  sbAddWHouse.ImageIndex := 26;
  panSummary.Align := alTop;
  edAmount.DecimalPlaces := Trunc(Abs(MatDisplayDigits));

  cdsWhouse.Open;
  cdsMeasure.Open;

  FCanRefresh := True;

  edMat.LoadFromRegistry(MainRegKey + '\' + Self.Name + '\Find');
  edAmount.Value := WBInDefAmount;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.cbWhousePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.cbWhousePropertiesChange') else _udebug := nil;{$ENDIF}


  FModified:=true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.edAmountPropertiesChange(Sender: TObject);
var i:integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edAmountPropertiesChange') else _udebug := nil;{$ENDIF}


  CalcSummary;
  FModified:=true;
  if edMat.IsSerial then
  try
    while Round(StrToFloat(edAmount.EditingText))<edSN.Properties.LookupItems.Count do begin
      edSN.Properties.LookupItems.Delete(edSN.Properties.LookupItems.Count-1);
    end;//while
    edSN.Text:=EmptyStr;
    for i:=0 to edSN.Properties.LookupItems.Count-1 do begin
      edSN.Text:=edSN.Text+edSN.Properties.LookupItems[i]+'; ';
    end;//for
    if edSN.Text<>EmptyStr then edSN.Text:=System.Copy(edSN.Text,1,Length(edSN.Text)-2);
  except
    edSN.Properties.LookupItems.Clear;
    edSN.Text:=EmptyStr;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.edSummCurrPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edSummCurrPropertiesChange') else _udebug := nil;{$ENDIF}


//edsummdef.Value:=edSummCurr.Value*Kurs;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.edPriceNondsPropertiesChange(Sender: TObject);
var
  v: extended;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edPriceNondsPropertiesChange') else _udebug := nil;{$ENDIF}


  if edPriceNoNDS.Tag=0  then begin
   try
    edPrice.Tag:=1;
    if edPriceNoNDS.EditingText='' then v:=0
     else v:=NDSIn(StrToFloat(edPriceNoNDS.EditingText), PosNDS);
    edPrice.Value:=RoundToA(v, -6);
    edPrice.Tag:=0;
   except
    edPrice.Tag:=0;
    edPrice.Text:='';
   end;
   CalcSummary;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.edSummCurrNoNdsPropertiesChange(
  Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edSummCurrNoNdsPropertiesChange') else _udebug := nil;{$ENDIF}


// edSummDefNoNds.Value:=edSummCurrNoNds.Value*Kurs;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.aAddMatExecute(Sender: TObject);
var aid: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.aAddMatExecute') else _udebug := nil;{$ENDIF}


{  try  aid := FMatID; except  aid := 0; end;
  edMat.SetFocus;
  ShowModalRef(Self, rtMat, vtMat, 'TfmMaterials', Self.OnDate, aid);}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.aAddWHouseExecute(Sender: TObject);
var aid: integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.aAddWHouseExecute') else _udebug := nil;{$ENDIF}


  try aid:=cbWHouse.KeyValue; except aid:=0; end;
  cbWhouse.SetFocus;
  ShowModalRef(Self, rtWHouse, vtWHouse, 'TfmWHouse', Self.OnDate, aid);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.CalcSummary;
var
  FSumWONDS, FNDS, FSumWithNDS: Extended;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.CalcSummary') else _udebug := nil;{$ENDIF}


  stAmountEx.Caption:=edAmount.Text;
  try
   NDSCalc(StrToFloat(edAmount.EditText),StrToFloat(edPrice.EditText),PosNDS,1,FSumWONDS,FNDS);
   FSumWithNDS:=FSumWONDS+FNDS;
   if CurrID=BaseCurrID then begin
    FNDS := RoundToA(FNDS, -2);
    FSumWithNDS := RoundToA(FSumWithNDS, -2);
    FSumWONDS := FSumWithNDS - FNDS;
    stSummNDS.Caption:=FormatFloat(MoneyDisplayFormat, FNDS);
    stSumm.Caption:=FormatFloat(MoneyDisplayFormat, FSumWONDS);
    stSummWithNDS.Caption:=FormatFloat(MoneyDisplayFormat, FSumWithNDS);
   end
   else begin
    stSumm.Caption:=FormatFloat(MoneyDisplayFormat, RoundToA(StrToFloat(edPrice.EditText)*StrToFloat(edAmount.EditText), RoundSumm));
   end;
   stSumm.Hint:=stSumm.Caption;
   stSummNDS.Hint:=stSummNDS.Caption;
   stSummWithNDS.Hint:=stSummWithNDS.Caption;
   stAmountEx.Hint:=stAmountEx.Caption;
  except
   stSumm.Caption:='';
   stSummNDS.Caption:='';
   stSummWithNDS.Caption:='';
   stSumm.Hint:=stSumm.Caption;
   stSummNDS.Hint:=stSummNDS.Caption;
   stSummWithNDS.Hint:=stSummWithNDS.Caption;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.SetCurrID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.SetCurrID') else _udebug := nil;{$ENDIF}


  FCurrID := Value;
  if Value=BaseCurrID then begin
   lPrice.Caption := LangMan.GetRS('fmWaybill', 'PriceWithNDS') + ':';
   lSummWONDS.Caption := LangMan.GetRS('fmWaybill', 'Summ') + ' ' +
     LangMan.GetRS(ParentNameEx, 'outNDS') + ':';
  end
  else begin
   lPrice.Caption := LangMan.GetRS('fmWaybill', 'Price') + ':';
   lSummWONDS.Caption := LangMan.GetRS('fmWaybill', 'Summ') + ':';
   lPriceNoNDS.Enabled := False;
   edPriceNoNDS.Enabled := False;
   lNDS.Enabled := False;
   stSummNDS.Enabled := False;
   lSummWithNDS.Enabled := False;
   stSummWithNDS.Enabled := False;
   stSummWithNDS.Caption := '';
   stSummNDS.Caption := '';
   stCurrShortNameOutNDS.Font.Color := clBtnShadow;
   lNDSRate.Enabled := False;
   edNDS.Enabled := False;
  end

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.edPricePropertiesChange(Sender: TObject);
var
  v: extended;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edPricePropertiesChange') else _udebug := nil;{$ENDIF}


  if (edPrice.Tag=0) and edPriceNoNDS.Enabled then begin
    try
      edPriceNoNDS.Tag:=1;
      if edPrice.EditingText='' then v:=0
      else v:=NDSOut(StrToFloat(edPrice.EditingText),PosNDS);
      edPriceNoNDS.EditText := FloatToStr(RoundToA(v, -6));
      edPriceNoNDS.Tag:=0;
    except
      edPriceNoNDS.Tag:=0;
      edPriceNoNDS.Text:='';
    end;//try
  end;
  CalcSummary;
  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.FormShow') else _udebug := nil;{$ENDIF}


  inherited;

  if CurrID<>BaseCurrID then lNDS.Caption:=LangMan.GetRS('fmWaybill', 'NDS')
    else lNDS.Caption:=LangMan.GetRS('fmWaybill', 'NDS')+' '+FloatToStr(PosNDS)+'%';
  if edMat.Enabled
    then edMat.Editor.SetFocus
    else
  if edAmount.Enabled
    then edAmount.SetFocus
    else edPrice.SetFocus;

  if not FRealigned then begin
    RealignPanels;
    FRealigned := True;
  end
  else LoadPanVisibility;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.FormKeyDown') else _udebug := nil;{$ENDIF}


  if (ssCtrl in Shift) and (Key in [VK_DOWN, VK_UP]) then begin
   if btnCancel.Focused or btnOk.Focused or btnApply.Focused then begin
    case Key of
     VK_DOWN : Perform(WM_NEXTDLGCTL, 0, 0);
     VK_UP   : Perform(WM_NEXTDLGCTL, 1, 0);
    end;
    Key:=0;
   end else
   if cbWHouse.Focused and not cbWHouse.DroppedDown then begin
    case Key of
     VK_DOWN : Perform(WM_NEXTDLGCTL, 0, 0);
     VK_UP   : Perform(WM_NEXTDLGCTL, 1, 0);
    end;
    Key:=0;
   end;
//    else

  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.cbWHouseKeyPress(Sender: TObject;
  var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.cbWHouseKeyPress') else _udebug := nil;{$ENDIF}


 if lWhouse.Font.Color<>clRed then GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.edAmountKeyPress(Sender: TObject;
  var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edAmountKeyPress') else _udebug := nil;{$ENDIF}


 if lAmount.Font.Color<>clRed then GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.edPriceKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edPriceKeyPress') else _udebug := nil;{$ENDIF}


  if Key = '-' then Key := #0;
  GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.WMRecordChanged(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.WMRecordChanged') else _udebug := nil;{$ENDIF}


  case TRefType(M.LParam) of
    rtMat:
      begin
//        FMatID := PNewRecordInfo(M.WParam).ID;
//        txtMat.Caption := PNewRecordInfo(M.WParam).Name;
//        edMat.Text := PNewRecordInfo(M.WParam).Notes;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.FormDestroy') else _udebug := nil;{$ENDIF}


  edMat.SaveToRegistry(MainRegKey + '\' + Self.Name + '\Find');
  WriteToRegInt(MainRegKey + '\' + Self.Name, 'PriceVis', Integer(sbShowPriceIn.Checked));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.btnInfoClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.btnInfoClick') else _udebug := nil;{$ENDIF}


  if edMat.MatID = 0 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmEditMaterials.Create(nil) do
    try
      ParentNameEx := 'fmMaterials';
      OnDate := Self.OnDate;
      ID := edMat.MatID;
      CanModify := False;
      ShowModal;
    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.btnMoveClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.btnMoveClick') else _udebug := nil;{$ENDIF}


  if edMat.MatID = 0 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmMatMove.Create(nil) do
    try
      ParentNameEx := 'fmWMat';
      OnDate := Self.OnDate;
      WID := 0; //cbWHouse.KeyValue;
      ID := edMat.MatID;
      ShowModal;
    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.btnRsvClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.btnRsvClick') else _udebug := nil;{$ENDIF}


  if edMat.MatID = 0 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmMatRsv.Create(nil) do
    try
     ParentNameEx := 'fmWMat';
     OnDate := Self.OnDate;
     WID := 0;
     ID := edMat.MatID;
     ShowModal;
   finally
     Free;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.WMLayoutChanged(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.WMLayoutChanged') else _udebug := nil;{$ENDIF}


  edMat.SetLng;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.edPricePropertiesEditValueChanged(
  Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edPricePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}


  if edPrice.Value < 0 then edPrice.Value := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.edPriceNoNDSPropertiesEditValueChanged(
  Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edPriceNoNDSPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}


  if edPriceNoNDS.Value < 0 then edPriceNoNDS.Value := 0; 

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.sbShowPriceInClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.sbShowPriceInClick') else _udebug := nil;{$ENDIF}


//  sbShowPriceIn.Checked := not sbShowPriceIn.Checked;
  panPriceIn.Visible := not sbShowPriceIn.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.btnMCClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.btnMCClick') else _udebug := nil;{$ENDIF}


  if edMat.MatID <= 0 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmMCList.Create(nil) do
  try
    OnDate := Self.OnDate;
    ID := Self.edMat.MatID;
    CanModify := False;
    ShowModal;
  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.GetPrice(APrice: Extended);
var
  FPrice: Extended;
  WithNDS: Boolean;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.GetPrice') else _udebug := nil;{$ENDIF}


  if Kurs = 0 then Kurs = 1;
  FPrice := 0;
  if WBInAutoPrice then begin
    with TssClientDataSet.Create(nil) do
    try
      RemoteServer := dmData.SConnection;
      if WBInAutoPriceType <> 0 then begin
        ProviderName := 'pWayBill_GetDefPrice';
        FetchParams;
        Params.ParamByName('matid').AsInteger := edMat.MatID;
        Params.ParamByName('ptypeid').AsInteger := WBInPriceType;
        Params.ParamByName('ondate').AsDateTime := Self.OnDate;
        Params.ParamByName('price').AsFloat := APrice;
        Open;
        if not IsEmpty then begin
          FPrice := RoundToA(FieldByName('extra').AsFloat, -6);
          WithNDS := FieldByName('withnds').AsInteger = 1;
          if not WithNDS then FPrice := NDSIn(FPrice, PosNDS);
          FPrice := FPrice / Kurs;
        end
        else FPrice := 0;
        Close;
      end
      else begin
        ProviderName := 'pWaybill_GetLastPrice';
        FetchParams;
        Params.ParamByName('matid').AsInteger := edMat.MatID;
        Params.ParamByName('ondate').AsDateTime := Self.OnDate;
        Open;
        FPrice := FieldByName('price').AsFloat *
          CurrToCurr(dmData.SConnection, FieldByName('currid').AsInteger,
          CurrID, Self.OnDate);
        Close;
      end;

    finally
      Free;
    end;
    edPrice.Value := FPrice;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.aSNExecute(Sender: TObject);
var i:integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.aSNExecute') else _udebug := nil;{$ENDIF}


  with TfrmSerials.Create(nil) do
  try
    Screen.Cursor:=crSQLWait;
    mdSN.Open;
    while mdSN.RecordCount<Round(StrToFloat(edAmount.EditingText)) do begin
      mdSN.Append;
      mdSN.FieldByName('num').AsInteger:=mdSN.RecordCount + 1;
      if mdSN.RecNo <= edSN.Properties.LookupItems.Count then
        mdSN.FieldByName('sn').AsString:=edSN.Properties.LookupItems[mdSN.RecNo - 1];
      mdSN.Post;
    end;//while

    mdSN.First;
    Screen.Cursor:=crDefault;

    if ShowModal=mrOK then begin
      edSN.Text:=EmptyStr;
      edSN.Properties.LookupItems.Clear;
      mdSN.First;
      while not mdSN.Eof do begin
        if not mdSN.FieldByName('sn').IsNull then begin
          edSN.Properties.LookupItems.Add(mdSN.FieldByName('sn').AsString);
          edSN.Text:=edSN.Text+mdSN.FieldByName('sn').AsString+'; ';
        end;//if
        mdSN.Next;
      end;//while

      if edSN.Text<>EmptyStr then edSN.Text:=System.Copy(edSN.Text,1,Length(edSN.Text)-2);

      edAmount.Value:=edSN.Properties.LookupItems.Count;

      DataModified(Self);
    end;//if

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.edSNPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edSNPropertiesButtonClick') else _udebug := nil;{$ENDIF}


  aSN.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.edNDSPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edNDSPropertiesChange') else _udebug := nil;{$ENDIF}


  if EdCanChange then begin
    try
      PosNDS := StrToFloat(edNDS.EditText);
      if CurrID <> BaseCurrID
        then lNDS.Caption := LangMan.GetRS('fmWaybill', 'NDS')
        else lNDS.Caption := LangMan.GetRS('fmWaybill', 'NDS') + ' ' +
          FloatToStr(PosNDS) + '%';
    except
      PosNDS := 0;
    end;
  end;
  FModified := True;
  CalcSummary;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.aShowNDSExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.aShowNDSExecute') else _udebug := nil;{$ENDIF}


  aShowNDS.Checked := not aShowNDS.Checked;
  btnShowNDS.Checked := not aShowNDS.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.SetMode(const Value: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.SetMode') else _udebug := nil;{$ENDIF}


  FMode := Value;
  Caption := LangMan.GetRS('fmWaybill', 'PosEdit');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.edMatChange(Sender: TObject);
var
  MinPrice, MaxPrice, AvgPrice, Remain, Rsv: Extended;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edMatChange') else _udebug := nil;{$ENDIF}


  if edMat.IsSerial
    then begin
      edAmount.DecimalPlaces := 0;
      if Mode = 1 then begin
        edAmount.Enabled := False;
        lAmount.Enabled := False;
        stMeasureName.Font.Color := clBtnShadow;
      end;
    end
    else begin
      edAmount.DecimalPlaces := Trunc(Abs(MatDisplayDigits));
      edSN.Text := EmptyStr;
      edSN.Properties.LookupItems.Clear;
    end;

  GetMatPrices(dmData.SConnection, edMat.MatID, MinPrice, MaxPrice, AvgPrice,
    LastInPrice, Remain, Rsv);
  stMinPrice.Caption := FormatFloat(MoneyDisplayFormat, MinPrice / Kurs);
  stMaxPrice.Caption := FormatFloat(MoneyDisplayFormat, MaxPrice / Kurs);
  stAvgPrice.Caption := FormatFloat(MoneyDisplayFormat, AvgPrice / Kurs);
  stRemain.Caption := FormatFloat(MatDisplayFormat, RoundToA(Remain - Rsv, -5));
  edNDS.Value := edMat.NDS;
  GetPrice(AvgPrice);

{  if pmFind.Items.Items[0].Checked then edMat.Text:=FMatName;
  if pmFind.Items.Items[1].Checked then edMat.Text:=artikul;
  FArtikul := artikul;}

  stMeasureName.Caption := edMat.Measure;
  txtSummAmount.Caption := edMat.Measure;
  cbProducer.Text := edMat.Producer;
  if ID = 0 then begin
    if edMat.WID > 0 then begin
      if not cdsWhouse.Locate('wid', edMat.WID, [])
        then DSRefresh(cdsWhouse, 'wid', 0);
      cbWHouse.KeyValue := edMat.WID;
    end
    else cbWhouse.KeyValue := cdsWHouse.fieldbyname('wid').AsInteger;
  end;
  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.edMatRefButtonClick(Sender: TObject);
var
  AID: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.edMatRefButtonClick') else _udebug := nil;{$ENDIF}


  try
    AID := edMat.MatID;
  except
    AID := 0;
  end;
  edMat.Editor.SetFocus;
  ShowModalRef(Self, rtMat, vtMat, 'TfmMaterials', Self.OnDate, AID);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.SetCurrShortName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.SetCurrShortName') else _udebug := nil;{$ENDIF}


  FCurrShortName := Value;

//  stCurrShortName.Caption := Value;
//  stCurrShortNameOutNds.Caption := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

function TfrmEditPosition.GetUDocCount(DS: TDataSet;
  WType: Integer): Integer;
var
  FID: Integer;
  DoExec: Boolean;  
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.GetUDocCount') else _udebug := nil;{$ENDIF}


  Result := 0;
  with DS do begin
    Filter := 'wtype=' + IntToStr(WType);
    Filtered := True;
    First;
    FID := -1;
    while not Eof do begin
      FID := DS.FieldByName('wbillid').AsInteger;
      Next;
      if (DS.FieldByName('wbillid').AsInteger <> FID) or Eof
         then Inc(Result); 
    end;
    Filtered := False;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.aSetPanelsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.aSetPanelsExecute') else _udebug := nil;{$ENDIF}


  with TfrmSetPanels.Create(nil) do
  try
    MainHandle := Self.Handle;
    FList.AddObject(LangMan.GetRS('fmWaybill', 'PanMat'), panMat);
    FList.AddObject(LangMan.GetRS('fmWaybill', 'PanPrice'), panPrice);
    FList.AddObject(LangMan.GetRS('fmWaybill', 'PanSN'), panSN);
    FList.AddObject(LangMan.GetRS('fmWaybill', 'PanPriceInterval'), panPriceInterval);
    FList.AddObject(LangMan.GetRS('fmWaybill', 'PanAddProps'), panAddProps);
    FList.AddObject(LangMan.GetRS('fmWaybill', 'PanSummary'), panSummary);
    SetPanels;
    ShowModal;
  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.LoadPanVisibility;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.LoadPanVisibility') else _udebug := nil;{$ENDIF}


  panSN.Visible := FPanSNVis;
  panPriceInterval.Visible := FPanPriceIntervalVis;
  PanAddProps.Visible := FPanAddPropsVis;
  panSummary.Visible := FPanSummaryVis;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.SavePanVisibility;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.SavePanVisibility') else _udebug := nil;{$ENDIF}


  FPanSNVis := panSN.Visible;
  FPanPriceIntervalVis := panPriceInterval.Visible;
  FPanAddPropsVis := PanAddProps.Visible;
  FPanSummaryVis := panSummary.Visible;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.RealignPanels;
var
  FOffs: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.RealignPanels') else _udebug := nil;{$ENDIF}


  FOffs := 0;
  if not panSN.Visible then FOffs := FOffs - panSN.Height;
  if not panSummary.Visible then FOffs := FOffs - panSummary.Height;
  if not panPriceInterval.Visible then FOffs := FOffs - panPriceInterval.Height;
  if not panAddProps.Visible then FOffs := FOffs - panAddProps.Height;
  panSummary.Align := alClient;
  if not panSummary.Visible then FOffs := FOffs + 7;
  if FOffs <> 0 then Self.Height := Self.Height + FOffs;
  SavePanVisibility;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.WMRealignPanels(var M: TMessage);
var
  FList: TStringList;
  i: Integer;
  FVis: Boolean;
  FPan: TPanel;
  FOffs: Integer;
  Y: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.WMRealignPanels') else _udebug := nil;{$ENDIF}


  FList := TStringList(Pointer(M.WParam));
  FOffs := 0;
  panSummary.Align := alNone;
  for i := 0 to FList.Count - 1 do begin
    FVis := FList.Strings[i] = '1';
    FPan := TPanel(FList.Objects[i]);
    if FPan.Visible <> FVis then begin
      if FVis then FOffs := FOffs + FPan.Height
        else FOffs := FOffs - FPan.Height;
      FPan.Visible := FVis;
    end;
  end;
  panSummary.Align := alClient;
  if FOffs <> 0 then Self.Height := Self.Height + FOffs;

  Y := panPrice.Top + panPrice.Height - 1;
  if panSN.Visible then begin
    panSN.Top := Y;
    Y := Y + panSN.Height;
  end;
  if panPriceInterval.Visible then begin
    panPriceInterval.Top := Y;
    Y := Y + panPriceInterval.Height;
  end;
  if panAddProps.Visible then begin
    PanAddProps.Top := Y;
    Y := Y + PanAddProps.Height;
  end;
  SavePanVisibility;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.SetCurrName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.SetCurrName') else _udebug := nil;{$ENDIF}


  FCurrName := Value;

  stCurrShortName.Caption := Value;
  stCurrShortNameOutNDS.Caption := Value;
  txtSummNDS.Caption := Value;
  txtSummWithNDS.Caption := Value;
  txtSummWONDS.Caption := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.GetProducers;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.GetProducers') else _udebug := nil;{$ENDIF}


  Screen.Cursor := crSQLWait;
  with TssClientDataSet.Create(nil) do
    try
      RemoteServer := dmData.SConnection;
      ProviderName := 'p_Mat_GetProducers';
      Open;
      while not Eof do begin
        if FieldByName('producer').AsString <> EmptyStr
          then cbProducer.Properties.Items.Add(FieldByName('producer').AsString);
        Next;
      end;
      Close;
    finally
      Free;
      Screen.Cursor := crDefault;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.cbProducerPropertiesInitPopup(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.cbProducerPropertiesInitPopup') else _udebug := nil;{$ENDIF}


  if cbProducer.Properties.Items.Count = 0 then GetProducers;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmEditPosition.LoadSkin;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPosition.LoadSkin') else _udebug := nil;{$ENDIF}


  inherited;

  bvlMat.Color := clokDlgBk;
  bvlPrice.Color := clokDlgBk;
  bvlAddPrps.Color := clokDlgBk;
  bvlSN.Color := clokDlgBk;
  bvlSummary.Color := clokDlgBk;
  bvlPriceInterval.Color := clokDlgBk;
  edMat.Color := clokDlgBk;
  panPriceIn.Color := clokDlgBk;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditPosition', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
