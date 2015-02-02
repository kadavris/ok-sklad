{$I ok_sklad.inc}
unit EditPositionMov;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ExtCtrls, dxCntner6, dxEditor6, StdCtrls,
  ActnList, ssBaseTypes, ssFormStorage, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxLookAndFeelPainters, cxCheckBox, cxButtons, ssBaseDlg,
  cxMemo, cxDBEdit, cxDropDownEdit, cxCalc, Buttons, cxMaskEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, ssDBComboBox, DB,
  DBClient, ssClientDataSet, Grids, DBGrids, cxListView, Mask,
  dxTL6, dxDBCtrl6, dxDBGrid6, dxDBTLCl6, dxGrClms6, ssBevel,
  ImgList, ssSpeedButton, ssPanel, ssGradientPanel,ssBaseConst, ssCalcEdit,
  ssLabel, ssMemDS, dxmdaset, ssDBLookupCombo, xButton, prTypes, TB2Item,
  Menus, cxButtonEdit, okSearchEdit;

type
  TfrmEditPositionMov = class(TBaseDlg)
    aAddMatR: TAction;
    aAddWHouse: TAction;
    aPartysSelect: TAction;
    aSetPanels: TAction;
    aShowSN: TAction;
    btnInfo: TssSpeedButton;
    btnMC: TssSpeedButton;
    btnMove: TssSpeedButton;
    btnRsv: TssSpeedButton;
    btnSetPanels: TssSpeedButton;
    bvlMat: TssBevel;
    bvlPrice: TssBevel;
    bvlSN: TssBevel;
    bvlSummary: TssBevel;
    cbWHouse: TssDBLookupCombo;
    cdsWhouse: TssClientDataSet;
    cdsWhouseADDR: TStringField;
    cdsWhouseDEF: TIntegerField;
    cdsWhouseDELETED: TIntegerField;
    cdsWhouseNAME: TStringField;
    cdsWhouseNOTES: TStringField;
    cdsWhouseWID: TIntegerField;
    chbRsv: TcxCheckBox;
    dsmdPosition: TDataSource;
    dsmdRsv: TDataSource;
    dsWhouse: TDataSource;
    edAmount: TssCalcEdit;
    edFindMat: TokMatSearchEdit;
    edSN: TcxButtonEdit;
    FloatField1: TFloatField;
    IntegerField3: TIntegerField;
    lAmount: TLabel;
    lAmountEx: TLabel;
    lMatEx: TLabel;
    lNDS: TssLabel;
    lonsumm: TLabel;
    lRemain: TssLabel;
    lRsv: TssLabel;
    lSN: TssLabel;
    lSummary: TLabel;
    lSummWithNDS: TssLabel;
    lSummWONDS: TLabel;
    lTitle: TLabel;
    lWhouse: TssLabel;
    mdPosition: TssMemoryData;
    mdPositionamount: TFloatField;
    mdPositioncertdate: TDateTimeField;
    mdPositioncertnum: TStringField;
    mdPositioncurrid: TIntegerField;
    mdPositioncurrname: TStringField;
    mdPositionDiscount: TFloatField;
    mdPositiondocdate: TDateTimeField;
    mdPositiondocnum: TStringField;
    mdPositiondocnumtxt: TStringField;
    mdPositiongtd: TStringField;
    mdPositionmatid: TIntegerField;
    mdPositionNDS: TFloatField;
    mdPositionondate: TDateTimeField;
    mdPositiononvalue: TFloatField;
    mdPositionposid: TIntegerField;
    mdPositionpostype: TIntegerField;
    mdPositionprice: TFloatField;
    mdPositionpricetxt: TStringField;
    mdPositionproducer: TStringField;
    mdPositionrsv: TFloatField;
    mdPositionSN: TStringField;
    mdPositionwbillid: TIntegerField;
    mdPositionwhname: TStringField;
    mdPositionwid: TIntegerField;
    mdPositionwtype: TIntegerField;
    mdRsv: TssMemoryData;
    mdRsvcertdate: TDateField;
    mdRsvcertnum: TStringField;
    mdRsvcurrid: TIntegerField;
    mdRsvcurrname: TStringField;
    mdRsvdiscount: TFloatField;
    mdRsvgtd: TStringField;
    mdRsvnds: TFloatField;
    mdRsvondate: TDateTimeField;
    mdRsvonvalue: TFloatField;
    mdRsvpricein: TFloatField;
    mdRsvproducer: TStringField;
    mdRsvSN: TStringField;
    panMat: TPanel;
    panPrice: TPanel;
    panSN: TPanel;
    panSummary: TPanel;
    sbAddWHouse: TssSpeedButton;
    sbPartysSelect: TssSpeedButton;
    ssBevel8: TssBevel;
    stAmountEx: TssBevel;
    stMeasureName: TssBevel;
    stRemain: TssBevel;
    stRsv: TssBevel;
    stSumm: TssBevel;
    stSummEx: TssBevel;
    stSummNDS: TssBevel;
    stSummWithNDS: TssBevel;
    txtSummAmount: TssBevel;
    txtSummNDS: TssBevel;
    txtSummWithNDS: TssBevel;
    txtSummWONDS: TssBevel;

    procedure aAddMatRExecute(Sender: TObject);
    procedure aAddWHouseExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aPartysSelectExecute(Sender: TObject);
    procedure aSetPanelsExecute(Sender: TObject);
    procedure aShowSNExecute(Sender: TObject);
    procedure btnInfoClick(Sender: TObject);
    procedure btnMCClick(Sender: TObject);
    procedure btnMoveClick(Sender: TObject);
    procedure btnRsvClick(Sender: TObject);
    procedure cbWHouseKeyPress(Sender: TObject; var Key: Char);
    procedure cbWHousePropertiesChange(Sender: TObject);
    procedure cdsWhouseAfterOpen(DataSet: TDataSet);
    procedure cdsWhouseBeforeOpen(DataSet: TDataSet);//Функция суммы в валюте
    procedure chbRsvPropertiesEditValueChanged(Sender: TObject);
    procedure CtrlEnter(Sender: TObject);
    procedure CtrlExit(Sender: TObject);
    procedure DataModified(Sender: TObject);
    procedure edAmountKeyPress(Sender: TObject; var Key: Char);
    procedure edAmountPropertiesChange(Sender: TObject);
    procedure edFindMatChange(Sender: TObject);
    procedure edFindMatRefButtonClick(Sender: TObject);
    procedure edNamePropertiesChange(Sender: TObject);
    procedure edPriceKeyPress(Sender: TObject; var Key: Char);
    procedure edPriceNoNDSKeyPress(Sender: TObject; var Key: Char);
    procedure edPriceNondsPropertiesChange(Sender: TObject);
    procedure edShortNamePropertiesChange(Sender: TObject);
    procedure edSNPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure edSummCurrNoNdsPropertiesChange(Sender: TObject);
    procedure edSummCurrPropertiesChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mdPositionCalcFields(DataSet: TDataSet);

  private
    FBySN:boolean;
    FCurrCtrl: TControl;
    FMatID: Integer;
    FMatName,FMsrName,FArtikul:string;
    FPanSummaryVis, FPanSNVis: Boolean;
    FRealigned: Boolean;
    FRsv, FRemain, FSumm : Extended;
    LockFind: Boolean;

    function CheckRest:boolean;
    procedure LoadPanVisibility;
    procedure RealignPanels;
    procedure SavePanVisibility;
    procedure WMDelete(var M: TMessage); message WM_DELETE;
    procedure WMLayoutChanged(var M: TMessage); message WM_LAYOUTCHANGED;
    procedure WMRealignPanels(var M: TMessage); message WM_REALIGNPANELS;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    procedure WMSetText(var M: TMessage); message WM_SETTEXT;

  protected
    procedure setid(const Value: integer); override;

  public
    FDocType:TDocType;
    FWID,FKAID:integer;
    ParentHandle: HWND;
    procedure SetCaptions; override;
  end;

var frmEditPositionMov: TfrmEditPositionMov;

//=============================================================
//=============================================================
//=============================================================
implementation

uses
  prConst, ClientData, Login, prFun, ssFun,
  fMaterials,fWHouse, ssBaseIntfDlg, fMessageDlg, MatRsv, MatMove,
  EditMaterials, ssRegUtils, MCList, PartySelect, Serials, SetPanels, udebug;

var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}
//=============================================================
procedure TfrmEditPositionMov.WMRefresh(var M: TMessage);
  var
    FSumm:Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.WMRefresh') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
    rtMat, rtMC: begin
      LockFind := True;

      try
        if edFindMat.MatID<>M.WParam then begin
          edFindMat.Tag := 1;
          edFindMat.MatID := M.WParam;
          edFindMat.Tag := 0;
        end;

        FMatID := edFindMat.MatID;
        FMatName := edFindMat.MatName;
        FArtikul := edFindMat.Artikul;
        FMsrName := edFindMat.Measure;
        FBySN := edFindMat.IsSerial;

        if FBySN
          then edAmount.DecimalPlaces := 0
          else edAmount.DecimalPlaces := Trunc(Abs(MatDisplayDigits));

        stMeasureName.Caption := FMsrName;
        txtSummAmount.Caption := FMsrName;
        GetMatRestsByKAorWID(dmData.SConnection, FMatID, FKAID, FWID, MaxDateTime, integer(mdPosition),ChargeType);
        FRemain := 0;
        FSumm := 0;
        FRsv := 0;

        with mdPosition do begin
          mdPosition.First;
          while not Eof do begin
            FRemain := FRemain+FieldByName('amount').AsFloat;
            FRsv := FRsv+FieldByName('rsv').AsFloat;
            FSumm := FSumm+FieldByName('amount').AsFloat*FieldByName('price').AsFloat*FieldByName('onvalue').AsFloat;
            Next;
          end;
        end;

        FRemain := RoundToA(FRemain, MatDisplayDigits);
        FRsv := RoundToA(FRsv, MatDisplayDigits);
        stRemain.Caption := FormatFloat(MatDisplayFormat, FRemain);
        stRsv.Caption := FormatFloat(MatDisplayFormat, FRsv);
        edAmountPropertiesChange(nil);
        FModified := true;

      finally
        LockFind := False;
      end;
    end;//rtMat, rtMC: begin

    rtWHouse: begin
      cbWHouse.Tag := 1;
      DSRefresh(cdsWhouse, 'wid', M.WParam);
      cbWHouse.Tag := 0;
      FWID := M.WParam;
      cbWhouse.Tag := 1;
      cbWhouse.KeyValue := FWID;
      cbWhouse.Tag := 0;
    end;//rtWHouse

    rtWMat: begin
      Application.ProcessMessages;
      FWid := PPosInfo(M.WParam)^.wid;
      cbWHouse.Tag := 1;
      cbWHouse.KeyValue := FWID;
      cbWHouse.Tag := 0;
      SendMessage(Self.Handle, WM_REFRESH,PPosInfo(M.WParam)^.matid,integer(rtMat));

      if (PPosInfo(M.WParam)^.posid > 0) and mdPosition.Locate('posid',PPosInfo(M.WParam)^.posid,[]) then begin
        mdRsv.Close;
        mdRsv.Open;
        mdRsv.Append;
        mdRsv.FieldByName('posid').AsInteger := mdPosition.FieldByName('posid').AsInteger;
        mdRsv.FieldByName('pricein').AsFloat := strtofloat(mdPosition.FieldByName('price').AsString);
        mdRsv.FieldByName('currid').AsInteger := mdPosition.FieldByName('currid').AsInteger;
        mdRsv.FieldByName('discount').AsFloat := mdPosition.FieldByName('discount').AsFloat;
        mdRsv.FieldByName('nds').AsFloat := mdPosition.FieldByName('nds').AsFloat;
        mdRsv.FieldByName('ondate').AsDateTime := mdPosition.FieldByName('ondate').AsDateTime;
        mdRsv.FieldByName('onvalue').AsFloat := mdPosition.FieldByName('onvalue').AsFloat;
        mdRsv.FieldByName('currname').AsString := mdPosition.FieldByName('currname').AsString;

        if not mdPosition.FieldByName('SN').IsNull then begin
          mdRsv.FieldByName('SN').AsString := mdPosition.FieldByName('SN').AsString;
          edSN.Text := mdPosition.FieldByName('SN').AsString;
        end//if
        else mdRsv.FieldByName('SN').Clear;
        if not mdPosition.FieldByName('gtd').IsNull then
          mdRsv.FieldByName('gtd').AsString := mdPosition.FieldByName('gtd').AsString
        else mdRsv.FieldByName('gtd').Clear;
        if not mdPosition.FieldByName('producer').IsNull then
          mdRsv.FieldByName('producer').AsString := mdPosition.FieldByName('producer').AsString
        else mdRsv.FieldByName('producer').Clear;
        if not mdPosition.FieldByName('certnum').IsNull then
          mdRsv.FieldByName('certnum').AsString := mdPosition.FieldByName('certnum').AsString
        else mdRsv.FieldByName('certnum').Clear;
        if not mdPosition.FieldByName('certdate').IsNull then
          mdRsv.FieldByName('certdate').AsDateTime := mdPosition.FieldByName('certdate').AsDateTime
        else mdRsv.FieldByName('certdate').Clear;

        if RoundToA(edAmount.Value, MatDisplayDigits)>RoundToA(mdPosition.FieldByName('amount').AsFloat,MatDisplayDigits) then begin
          mdRsv.FieldByName('amount').AsFloat := mdPosition.FieldByName('amount').AsFloat;
          edAmount.Tag := 1;
          edAmount.Value := mdRsv.FieldByName('amount').AsFloat;
          edAmount.Tag := 0;
        end//if
        else begin mdRsv.FieldByName('amount').AsFloat := RoundToA(edAmount.Value, MatDisplayDigits);
        mdRsv.Post;
        end;
        edAmount.Tag := 1;
        edAmountPropertiesChange(nil);
        edAmount.Tag := 0;
      end;//if
    end;//rtWMat:
  end;//case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.setid(const Value: integer);
 var
    FNeedWH:boolean;
    FDefAmount, AAmount:Extended;
    BM:TBookmark;
    ASourceId,APosId,ATmpId:integer;
    APosInfo:TPosInfo;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditPositionMov.setid') else _udebug := nil;{$ENDIF}


  FID := Value;
  FNeedWH := False;
  FDefAmount := 0;
  
  cbWHouse.Tag := 1;
  cdsWhouse.Close;
  cdsWhouse.Open;
  cbWHouse.Tag := 0;

  case FDocType of
    dtWBMove:begin
      FNeedWH := WBMoveAutoWH;
      FDefAmount := WBMoveDefAmount;
    end;

    dtReturnOut:begin
      FNeedWH := ReturnOutAutoWH;
      FDefAmount := ReturnOutDefAmount;
    end;

    dtWriteOff:begin
      FNeedWH := WriteOffAutoWH;
      FDefAmount := WriteOffDefAmount;
    end;
  end;//case

  if Value <> 0 then begin
    Self.Caption := rs('fmWaybill','PosEdit');
    //Освобождение редактируемых позиций (старых)
    TdxMemData(pointer(stMeasureName.Tag)).First;

    while not TdxMemData(pointer(stMeasureName.Tag)).Eof do begin
      if ID = TdxMemData(pointer(stMeasureName.Tag)).FieldByName('sourceid').AsInteger
      then begin
        with newDataSet do
        try
          ProviderName := 'pWayBill_GetMatID_WID';
          FetchParams;
          Params.ParamByName('posId').AsInteger := TdxMemData(pointer(stMeasureName.Tag)).FieldByName('posid').AsInteger;
          Open;
          if not IsEmpty then begin
            TdxMemData(pointer(stRemain.Tag)).Append;
            TdxMemData(pointer(stRemain.Tag)).FieldByName('sourceid').AsInteger := TdxMemData(pointer(stMeasureName.Tag)).FieldByName('sourceid').AsInteger;
            TdxMemData(pointer(stRemain.Tag)).FieldByName('amount').AsFloat := RoundToA(strtofloat(TdxMemData(pointer(stMeasureName.Tag)).fieldbyname('amount').AsString)*-1, MatDisplayDigits);
            TdxMemData(pointer(stRemain.Tag)).FieldByName('posid').AsInteger := TdxMemData(pointer(stMeasureName.Tag)).FieldByName('posid').AsInteger;
            TdxMemData(pointer(stRemain.Tag)).FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(TdxMemData(pointer(stMeasureName.Tag)).FieldByName('posid').AsInteger,Fields[0].AsInteger,Fields[1].AsInteger,0,strtofloat(TdxMemData(pointer(stMeasureName.Tag)).fieldbyname('amount').AsString)*-1);
            TdxMemData(pointer(stRemain.Tag)).FieldByName('free').AsInteger := 1;
            TdxMemData(pointer(stRemain.Tag)).FieldByName('forall').AsInteger := 0;
            TdxMemData(pointer(stRemain.Tag)).Post;
          end;//if not IsEmpty
          Close;
        finally
          Free;
        end;
      end;//if

      TdxMemData(pointer(stMeasureName.Tag)).Next;
    end;//while not mdWMatTurnOld.Eof

    //Освобождение редактируемых позиций (новых)
    TdxMemData(pointer(stRemain.Tag)).First;

    while not TdxMemData(pointer(stRemain.Tag)).Eof do begin
      if (TdxMemData(pointer(stRemain.Tag)).FieldByName('sourceid').AsInteger = ID)
         and (TdxMemData(pointer(stRemain.Tag)).FieldByName('free').AsInteger <> 1)
      then begin
        with newDataSet do
        try
          ProviderName := 'pWayBill_GetMatID_WID';
          FetchParams;
          Params.ParamByName('posId').AsInteger := TdxMemData(pointer(stRemain.Tag)).FieldByName('posid').AsInteger;
          Open;

          if not IsEmpty then begin
            BM := TdxMemData(pointer(stRemain.Tag)).GetBookmark;  //Сохранение текщей позиции
            ASourceId := TdxMemData(pointer(stRemain.Tag)).FieldByName('sourceid').AsInteger;
            AAmount := TdxMemData(pointer(stRemain.Tag)).FieldByName('amount').AsFloat;
            APosId := TdxMemData(pointer(stRemain.Tag)).FieldByName('posid').AsInteger;
            ATmpId := TdxMemData(pointer(stRemain.Tag)).FieldByName('tmpid').AsInteger;

            try
              TdxMemData(pointer(stRemain.Tag)).Append;
              TdxMemData(pointer(stRemain.Tag)).FieldByName('sourceid').AsInteger := ASourceId;
              TdxMemData(pointer(stRemain.Tag)).FieldByName('amount').AsFloat := AAmount*-1;
              TdxMemData(pointer(stRemain.Tag)).FieldByName('posid').AsInteger := APosId;
              TdxMemData(pointer(stRemain.Tag)).FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(APosId,Fields[0].AsInteger,Fields[1].AsInteger,0,AAmount*-1);
              TdxMemData(pointer(stRemain.Tag)).FieldByName('free').AsInteger := 1;
              TdxMemData(pointer(stRemain.Tag)).FieldByName('forall').AsInteger := 0;
              TdxMemData(pointer(stRemain.Tag)).Post;

            finally
              TdxMemData(pointer(stRemain.Tag)).GotoBookmark(BM);
              TdxMemData(pointer(stRemain.Tag)).FreeBookmark(BM);
            end;
          end;//if not IsEmpty

          Close;

        finally
          Free;
        end;
      end;//if

      TdxMemData(pointer(stRemain.Tag)).Next;
    end;//while not mdTmpIds.Eof

    FWID := TdxMemData(pointer(Tag)).fieldbyname('wid').AsInteger;
    cbWHouse.Tag := 1;cbWHouse.KeyValue := FWID;cbWHouse.Tag := 0;
    FMatID := TdxMemData(pointer(Tag)).fieldbyname('matid').AsInteger;
    edFindMat.Tag := 1;
    edFindMat.MatID := FMatID;
    edFindMat.Tag := 0;

    edAmount.Tag := 1;
    edAmount.Value := StrToFloat(TdxMemData(pointer(Tag)).fieldbyname('amount').AsString);
    edAmount.Tag := 0;
    //запись в mdRsv
    chbRsv.Tag := 1;
    chbRsv.Checked := TdxMemData(pointer(Tag)).FieldByName('status').AsInteger=1;
    chbRsv.Tag := 0;

    if chbRsv.Checked and TdxMemData(pointer(panMain.Tag)).Locate('sourceid',Value,[])
    then begin
      APosInfo.MatID := FMatID;
      APosInfo.PosID := TdxMemData(pointer(panMain.Tag)).FieldByName('posid').AsInteger;
      APosInfo.WID := FWID;
      SendMessage(Self.Handle, WM_REFRESH,integer(@APosInfo),integer(rtWMat))
    end
    else SendMessage(Self.Handle,WM_REFRESH,FMatID,integer(rtMat));

    edSN.Text := TdxMemData(Pointer(Tag)).FieldByName('sn').AsString;
  end//if Value<>0
  else begin
    Self.Caption := rs('fmWaybill','PosAdd');
    cbWHouse.Tag := 1; cbWHouse.KeyValue := FWID; cbWHouse.Tag := 0;
    edAmount.Tag := 1; edAmount.Value := FDefAmount; edAmount.Tag := 0;

    if FNeedWH and WBOutAutoWH then begin
      FCurrCtrl := edFindMat;
      aAddMatRExecute(nil);
    end;
  end;//if Value=0

  aAddWHouse.Enabled := (FDocType=dtReturnOut);
  cbWHouse.Enabled := aAddWHouse.Enabled;

  if not Self.Visible then ShowModal;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

function TfrmEditPositionMov.CheckRest:boolean;
  var
     mdTmpPosition : TssMemoryData;
     {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.CheckRest') else _udebug := nil;{$ENDIF}

  if chbRsv.Checked then begin
    CheckRest := false;
    mdTmpPosition := TssMemoryData.Create(nil);

    try
      mdTmpPosition.CopyStructure(mdPosition);
      GetMatRestsByKAorWID(dmData.SConnection,FMatID,FKAID,FWID,MaxDateTime,integer(mdTmpPosition));

      with mdRsv do begin
        First;
        while not Eof do begin
          if (mdTmpPosition.Locate('posid',FieldByName('posid').AsInteger,[])
             and
             (RoundToA(mdTmpPosition.FieldByName('amount').AsFloat, MatDisplayDigits)
              >= RoundToA(FieldByName('amount').AsFloat,MatDisplayDigits)))
          then Result := True
          else begin
            Result := False;
            {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
            Exit;
          end;

          Next;
        end;//while
      end;//with

    finally
      mdTmpPosition.Free;
    end;
  end
  else Result := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    TmpAmount: Extended;
    NextID: Integer;
    fCheck: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.FormCloseQuery') else _udebug := nil;{$ENDIF}

  while LockFind do;

  //Удаление освобождённых позиций
  if (ID <> 0) and (ModalResult = mrCancel) then begin
    with TdxMemData(Pointer(stRemain.Tag)) do begin
      First;
      while not Eof do begin
        if (FieldByName('sourceid').AsInteger=ID)and(FieldByName('free').AsInteger=1) then begin
          dmData.SConnection.AppServer.Rsv_Delete(FieldByName('tmpid').AsInteger);
          Delete;
        end//if
        else Next;
      end;//while not eof
    end;//with
  end;//if ID<>0

  if ModalResult in [mrOK, mrYes] then begin
    CanClose := False;
    fCheck := CheckRest;

    if (ID<>0) and fCheck then begin
      //Удаление освобождённых позиций
      with TdxMemData(pointer(stRemain.Tag)) do begin
        First;
        while not Eof do begin
          if (FieldByName('sourceid').AsInteger=ID) and (FieldByName('free').AsInteger=1) then begin
            dmData.SConnection.AppServer.Rsv_Delete(FieldByName('tmpid').AsInteger);
            Delete;
          end//if
          else Next;
        end;//while not eof
      end;//with
    end;//if id<>0

    if fCheck then begin
      if ID<>0 then begin
        //Удаление всего резерва для текущего sourceid
        with TdxMemData(pointer(stRemain.Tag)) do begin
          First;
          while not Eof do begin
            if (FieldByName('sourceid').AsInteger=id) then begin
              dmData.SConnection.AppServer.Rsv_Delete(FieldByName('tmpid').AsInteger);
              Delete;
            end//if
            else Next;
          end;//while not eof
        end;//with

        //Удаление всех записей из mdWMatTurn для текущего sourceid
        with TdxMemData(pointer(panMain.Tag)) do begin
          First;
          while not Eof do begin
            if  (FieldByName('sourceid').AsInteger=id) then Delete
            else Next;
          end;//while
        end;//with
      end;//if ID<>0 then begin

      //Запись в mdDet с ценами NULL
      if not chbRsv.Checked then begin
        with TdxMemData(pointer(Tag)) do begin
          if ID<>0 then begin
            NextID := ID;
            Edit;
          end
          else begin
            NextID := dsNextPosID(Fields[0].DataSet);
            Append;
          end;

          FieldByName('posid').AsInteger := NextID;
          FieldByName('postype').AsInteger := 0;
          FieldByName('matid').AsInteger := FMatID;
          FieldByName('matname').AsString := FMatName;
          FieldByName('artikul').AsString := FArtikul;
          FieldByName('barcode').AsString := edFindMat.BarCode;
          FieldByName('wid').AsInteger := FWid;
          FieldByName('whname').AsString := cbWHouse.Text;
          FieldByName('amount').AsFloat := StrToFloat(edAmount.EditingText);
          FieldByName('msrname').AsString := stMeasureName.Caption;
          FieldByName('status').Clear;
          FieldByName('norm').Clear;
          FieldByName('currid').Clear;
          FieldByName('currname').Clear;
          FieldByName('ptypeid').Clear;
          FieldByName('price').Clear;
          FieldByName('discount').Clear;
          FieldByName('onvalue').Clear;
          FieldByName('ondate').Clear;
          FieldByName('nds').Clear;
          FieldByName('num').Clear;
          FieldByName('personid').Clear;
          FieldByName('SN').Clear;
          FieldByName('producer').Clear;
          FieldByName('gtd').Clear;
          FieldByName('certnum').Clear;
          FieldByName('certdate').Clear;
          Post;
          //SendMessage(ParentHandle, WM_REFRESH, 0, 9);
        end;//with TdxMemData(pointer(Tag))
      end//if not chbRsv.Checked
      else begin
        mdRsv.First;

        while not mdRsv.Eof do begin
          //Запись в mdDet
          with TdxMemData(pointer(Tag)) do begin
            if (ID <> 0) and (mdRsv.RecNo = 1) then begin
              NextID := ID;
              Edit;
            end else begin
              NextID := dsNextPosID(Fields[0].DataSet);

              if ID <> 0
                then Insert
                else Append;
            end;

            FieldByName('posid').AsInteger := NextID;
            FieldByName('postype').AsInteger := 0;
            FieldByName('matid').AsInteger := FMatID;
            FieldByName('matname').AsString := FMatName;
            FieldByName('artikul').AsString := FArtikul;
            FieldByName('barcode').AsString := edFindMat.BarCode;
            FieldByName('wid').AsInteger := FWID;
            FieldByName('whname').AsString := cbWHouse.Text;
            FieldByName('amount').AsFloat := StrToFloat(mdRsv.FieldByName('amount').AsString);
            FieldByName('msrname').AsString := stMeasureName.Caption;
            FieldByName('price').AsFloat := mdRsv.FieldByName('pricein').AsFloat;
            FieldByName('currid').AsInteger := mdRsv.FieldByName('currid').AsInteger;
            FieldByName('discount').AsFloat := mdRsv.FieldByName('discount').AsFloat;
            FieldByName('NDS').AsFloat := mdRsv.FieldByName('NDS').AsFloat;
            FieldByName('ondate').AsDateTime := mdRsv.FieldByName('ondate').AsDateTime;
            FieldByName('onvalue').AsFloat := mdRsv.FieldByName('onvalue').AsFloat;
            FieldByName('currname').AsString := mdRsv.FieldByName('currname').AsString;
            FieldByName('sn').AsString := edSN.Text;

//            if not mdRsv.FieldByName('sn').IsNull then FieldByName('sn').AsString := mdRsv.FieldByName('sn').AsString
//              else FieldByName('sn').Clear;

            if not mdRsv.FieldByName('producer').IsNull
              then FieldByName('producer').AsString := mdRsv.FieldByName('producer').AsString
              else FieldByName('producer').Clear;

            if not mdRsv.FieldByName('gtd').IsNull
              then FieldByName('gtd').AsString := mdRsv.FieldByName('gtd').AsString
              else FieldByName('gtd').Clear;

            if not mdRsv.FieldByName('certnum').IsNull
              then FieldByName('certnum').AsString := mdRsv.FieldByName('certnum').AsString
              else FieldByName('certnum').Clear;

            if not mdRsv.FieldByName('certdate').IsNull
              then FieldByName('certdate').AsDateTime := mdRsv.FieldByName('certdate').AsDateTime
              else FieldByName('certdate').Clear;

            Post;
          end;//with TdxMemData(pointer(Tag))

          //************* Запись в mdWMatturn новых позиций
          with TdxMemData(pointer(panMain.Tag)) do begin
            Append;
            FieldByName('posid').AsInteger := mdRsv.FieldByName('posid').AsInteger;
            FieldByName('matid').AsInteger := FMatID;
            FieldByName('wid').AsInteger := FWid;
            FieldByName('sourceid').AsInteger := NextID;
            FieldByName('amount').AsFloat := mdRsv.FieldByName('amount').AsFloat;
            FieldByName('ondate').AsDateTime := 0;
            //if not mdRsv.FieldByName('sn').IsNull then FieldByName('sn').AsString := mdRsv.FieldByName('sn').AsString;
            FieldByName('sn').AsString := edSN.Text;
            Post;
          end;


          //Запись в таблицу временного резерва
          with TdxMemData(pointer(stRemain.Tag)) do begin
            //Получить сумму для текущего posid в mdTmpIds
            First;
            TmpAmount := 0;
            while not Eof do begin
              if (FieldByName('posid').AsInteger=mdRsv.FieldByName('posid').AsInteger) then
              TmpAmount := RoundToA(TmpAmount+RoundToA(strtofloat(FieldByName('amount').AsString), MatDisplayDigits), MatDisplayDigits);
              Next;
            end;

            if TdxMemData(pointer(stMeasureName.Tag)).Locate('posid;sourceid',VarArrayOf([mdRsv.FieldByName('posid').AsInteger,NextID]),[]) then begin
              TdxMemData(pointer(stMeasureName.Tag)).Edit;
              TdxMemData(pointer(stMeasureName.Tag)).FieldByName('flag').AsInteger := 1;
              TdxMemData(pointer(stMeasureName.Tag)).Post;
              if RoundToA(mdRsv.FieldByName('amount').AsFloat,MatDisplayDigits)>RoundToA(TdxMemData(pointer(stMeasureName.Tag)).FieldByName('amount').AsFloat,MatDisplayDigits) then begin
                if TmpAmount < 0 then begin
                  if RoundToA(-TmpAmount, MatDisplayDigits)
                     > RoundToA(mdRsv.fieldbyname('amount').AsFloat
                       - TdxMemData(pointer(stMeasureName.Tag)).FieldByName('amount').AsFloat, MatDisplayDigits) then begin
                    Append;
                    FieldByName('sourceid').AsInteger := NextID;
                    FieldByName('posid').AsInteger := mdRsv.FieldByName('posid').AsInteger;
                    //Разница для себя
                    FieldByName('amount').AsFloat := RoundToA(mdRsv.fieldbyname('amount').AsFloat-TdxMemData(pointer(stMeasureName.Tag)).FieldByName('amount').AsFloat,MatDisplayDigits);
                    FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.FieldByName('posid').AsInteger,FMatID,FWID,0,FieldByName('amount').AsFloat);
                    FieldByName('free').AsInteger := 0;
                    FieldByName('forall').AsInteger := 0;
                    Post;
                  end
                  else begin
                    Append;
                    FieldByName('sourceid').AsInteger := NextID;
                    FieldByName('posid').AsInteger := mdRsv.FieldByName('posid').AsInteger;
                    //Доступное кол-во для себя TmpAmount*-1
                    FieldByName('amount').AsFloat := RoundToA(TmpAmount*-1,MatDisplayDigits);
                    FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.FieldByName('posid').AsInteger,FMatID,FWID,0,FieldByName('amount').AsFloat);
                    FieldByName('free').AsInteger := 0;
                    FieldByName('forall').AsInteger := 0;
                    Post;
                    if RoundToA(mdRsv.fieldbyname('amount').AsFloat - TdxMemData(pointer(stMeasureName.Tag)).FieldByName('amount').AsFloat-(TmpAmount*-1),MatDisplayDigits)<>0 then begin
                      Append;
                      FieldByName('sourceid').AsInteger := NextID;
                      FieldByName('posid').AsInteger := mdRsv.FieldByName('posid').AsInteger;
                      //Разницу для всех strtofloat(mdRsv.fieldbyname('amount').AsString)-TmpAmount*-1
                      FieldByName('amount').AsFloat := RoundToA(mdRsv.FieldByName('amount').AsFloat-TdxMemData(pointer(stMeasureName.Tag)).FieldByName('amount').AsFloat-(TmpAmount*-1),MatDisplayDigits);
                      FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.FieldByName('posid').AsInteger,FMatID,FWID,1,FieldByName('amount').AsFloat);
                      FieldByName('free').AsInteger := 0;
                      FieldByName('forall').AsInteger := 1;
                      Post;
                    end;//if RoundToA...
                  end;//else
                end//if TmpAmount<0
                else begin
                  Append;
                  FieldByName('sourceid').AsInteger := NextID;
                  FieldByName('posid').AsInteger := mdRsv.FieldByName('posid').AsInteger;
                  //Разница для всех
                  FieldByName('amount').AsFloat := RoundToA(mdRsv.FieldByName('amount').AsFloat-TdxMemData(pointer(stMeasureName.Tag)).FieldByName('amount').AsFloat,MatDisplayDigits);
                  FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.FieldByName('posid').AsInteger,FMatID,FWID,1,FieldByName('amount').AsFloat);
                  FieldByName('free').AsInteger := 0;
                  FieldByName('forall').AsInteger := 1;
                  Post;
                end;//else
              end//if
              else begin
                if RoundToA(mdRsv.fieldbyname('amount').AsFloat-TdxMemData(pointer(stMeasureName.Tag)).FieldByName('amount').AsFloat,MatDisplayDigits)<>0 then begin
                  Append;
                  FieldByName('sourceid').AsInteger := NextID;
                  FieldByName('posid').AsInteger := mdRsv.FieldByName('posid').AsInteger;
                  //Разница для себя
                  FieldByName('amount').AsFloat := RoundToA(mdRsv.FieldByName('amount').AsFloat-TdxMemData(pointer(stMeasureName.Tag)).FieldByName('amount').AsFloat,MatDisplayDigits);
                  FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.fieldbyname('posid').AsInteger,FMatID,FWID,0,FieldByName('amount').AsFloat);
                  FieldByName('free').AsInteger := 0;
                  FieldByName('forall').AsInteger := 0;
                  Post;
                end;
              end;
            end
            else begin
              if TmpAmount<0 then begin
                if RoundToA(-TmpAmount, MatDisplayDigits)>RoundToA(mdRsv.FieldByName('amount').AsFloat,MatDisplayDigits) then begin
                  Append;
                  FieldByName('sourceid').AsInteger := NextID;
                  FieldByName('posid').AsInteger := mdRsv.FieldByName('posid').AsInteger;
                  //Всё кол-во для себя
                  FieldByName('amount').AsFloat := RoundToA(mdRsv.fieldbyname('amount').AsFloat,MatDisplayDigits);
                  FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.FieldByName('posid').AsInteger,FMatID,FWID,0,FieldByName('amount').AsFloat);
                  FieldByName('free').AsInteger := 0;
                  FieldByName('forall').AsInteger := 0;
                  Post;
                end
                else begin
                  Append;
                  FieldByName('sourceid').AsInteger := NextID;
                  FieldByName('posid').AsInteger := mdRsv.FieldByName('posid').AsInteger;
                  //Доступное кол-во для себя TmpAmount*-1
                  FieldByName('amount').AsFloat := RoundToA(TmpAmount*-1,MatDisplayDigits);
                  FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.FieldByName('posid').AsInteger,FMatID,FWID,0,FieldByName('amount').AsFloat);
                  FieldByName('free').AsInteger := 0;
                  FieldByName('forall').AsInteger := 0;
                  Post;

                  if RoundToA(mdRsv.fieldbyname('amount').AsFloat-(TmpAmount*-1),MatDisplayDigits)<>0 then begin
                    Append;
                    FieldByName('sourceid').AsInteger := NextID;
                    FieldByName('posid').AsInteger := mdRsv.FieldByName('posid').AsInteger;
                    //Разницу для всех strtofloat(mdRsv.fieldbyname('amount').AsString)-TmpAmount*-1
                    FieldByName('amount').AsFloat := RoundToA(mdRsv.FieldByName('amount').AsFloat-(TmpAmount*-1),MatDisplayDigits);
                    FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.FieldByName('posid').AsInteger,FMatID,FWID,1,FieldByName('amount').AsFloat);
                    FieldByName('free').AsInteger := 0;
                    FieldByName('forall').AsInteger := 1;
                    Post;
                  end;
                end;//else
              end
              else begin
                Append;
                FieldByName('sourceid').AsInteger := NextID;
                FieldByName('posid').AsInteger := mdRsv.FieldByName('posid').AsInteger;
                //Всё кол-во для всех
                FieldByName('amount').AsFloat := RoundToA(mdRsv.FieldByName('amount').AsFloat,MatDisplayDigits);
                FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(mdRsv.FieldByName('posid').AsInteger,FMatID,FWID,1,FieldByName('amount').AsFloat);
                FieldByName('free').AsInteger := 0;
                FieldByName('forall').AsInteger := 1;
                Post;
              end;//else
            end;//else
          end;//with TdxMemData(pointer(stRemain.Tag)) do begin
          mdRsv.Next;
        end;//while not mdRsv.Eof do begin
      end;////else if not chbRsv.Checked

      //Освобождение оставшихся позиций, старых
      with TdxMemData(pointer(stMeasureName.Tag)) do begin
        First;
        while not Eof do begin
          if (FieldByName('sourceid').AsInteger=ID) and (FieldByName('flag').AsInteger<>1) then begin
            Edit;
            FieldByName('flag').AsInteger := 1;
            Post;
            //Освобождение для себя
            TdxMemData(pointer(stRemain.Tag)).Append;
            TdxMemData(pointer(stRemain.Tag)).FieldByName('sourceid').AsInteger := FieldByName('sourceid').AsInteger;
            TdxMemData(pointer(stRemain.Tag)).FieldByName('posid').AsInteger := FieldByName('posid').AsInteger;
            TdxMemData(pointer(stRemain.Tag)).FieldByName('amount').AsFloat := RoundToA(FieldByName('amount').AsFloat,MatDisplayDigits)*-1;
            TdxMemData(pointer(stRemain.Tag)).FieldByName('tmpid').AsInteger := dmData.SConnection.AppServer.Rsv_Add(FieldByName('posid').AsInteger,FieldByName('matid').AsInteger,FieldByName('wid').AsInteger,0,RoundToA(FieldByName('amount').AsFloat,MatDisplayDigits)*-1);
            TdxMemData(pointer(stRemain.Tag)).FieldByName('free').AsInteger := 0;
            TdxMemData(pointer(stRemain.Tag)).FieldByName('forall').AsInteger := 0;
            TdxMemData(pointer(stRemain.Tag)).Post;
          end;//if
          Next;
        end;//while not Eof

        First;

        while not Eof do begin
         Edit;
         FieldByName('flag').AsInteger := 0;
         Post;
         Next;
        end;//while not eof
      end;//with TdxMemData(pointer(stMeasureName.Tag))

      if ID = 0 then begin
        if ModalResult = mrYes then begin
          LockFind := True;

          try
            edFindMat.MatID := 0;
          finally
            LockFind := False;
          end;

          edAmount.Value := WBOutDefAmount;
          stRemain.Caption := '0';
          ID := 0;
          edFindMat.SetFocus;
        end
        else CanClose := true;
      end//if ID=0
      else begin
        if ModalResult=mrOK then CanClose := true
        else begin
          FModified := False;
          id := ID;
          SendMessage(ParentHandle, WM_REFRESH, 0, -1);
        end;
      end;//else
    end//if CheckRest
    else begin
      CanClose := false;
      SendMessage(Self.Handle, WM_REFRESH, FMatID,integer(rtMat));
      ssMessageDlg(rs('fmWaybill','WMatChange'),ssmtError,[ssmbOk]);
    end;

    SendMessage(ParentHandle, WM_REFRESH, 0, 9);
  end//if ModalResult in [mrOK, mrYes]
  else CanClose := true;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.ActionListUpdate') else _udebug := nil;{$ENDIF}

  edSN.Enabled := (FBySN and (FMatID>0));
  lSN.Enabled := edSN.Enabled;
  aPartysSelect.Enabled := (mdPosition.Active)and(not mdPosition.IsEmpty)and chbRsv.Checked;

  try
    if (strtofloat(edAmount.EditingText)<=0)
         or (RoundToA(strtofloat(edAmount.EditingText),MatDisplayDigits) > FRemain)
    then begin
      if RoundToA(strtofloat(edAmount.EditingText),MatDisplayDigits) > FRemain
        then stRemain.Font.Color := clRed
        else stRemain.Font.Color := clMaroon;
    end
    else stRemain.Font.Color := clMaroon;

  except
     stRemain.Font.Color := clMaroon;
  end;

  try
    aOk.Enabled := (edAmount.EditingText <> '')
      and (StrToFloat(edAmount.EditingText) > 0)
      and (((stRemain.Font.Color<>clRed) and chbRsv.Checked) or (not chbRsv.Checked));

  except
    aOk.Enabled := false;
  end;

  aApply.Enabled := aOk.Enabled and FModified;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.DataModified') else _udebug := nil;{$ENDIF}

   FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.SetCaptions') else _udebug := nil;{$ENDIF}


  with LangMan do begin
    aShowSN.Caption := GetRS('fmWaybill','SNs');
    aPartysSelect.Caption := GetRS('fmWaybill','Partys');
    aPartysSelect.Hint := aPartysSelect.Caption;
    aAddWHouse.Caption := GetRS('fmWaybill','WHouseRef');
    aAddWHouse.Hint := aAddWHouse.Caption;

    btnSetPanels.Hint := GetRS('fmWaybill', 'SetPanels');

    aOK.Caption := GetRS('Common','OK');
    aCancel.Caption := GetRS('Common','Cancel');
    aApply.Caption := GetRS('Common','Apply');

    lWhouse.Caption := GetRS('fmWaybill','WHouse') + ':';
    lAmount.Caption := GetRS('fmWaybill','Amount') + ':';
    lRemain.Caption := GetRS('fmWaybill','RemainWH') + ':';
    lRsv.Caption := GetRS('fmWaybill', 'Rsv') + ':';
    lonsumm.Caption := GetRS('fmWaybill','OnSumm') + ':';
    lAmountEx.Caption := GetRS('fmWaybill', 'Amount') + ':';
    lSummary.Caption := GetRS('fmWaybill', 'Total') + ':';
    lNDS.Caption := GetRS('fmWaybill', 'NDS') + ':';
    lSummWithNDS.Caption := GetRS('fmWaybill', 'Summ') + ' ' + GetRS('fmWaybill', 'withNDS') + ':';
    lSummWONDS.Caption := GetRS('fmWaybill', 'Summ') + ':';

    chbRsv.Properties.Caption := GetRS('fmWaybill', 'RsvMat');
    btnRsv.Hint := GetRS('fmWaybill','RsvInfo');
    btnMove.Hint := GetRS('fmWaybill','MoveInfo');
    btnInfo.Hint := GetRS('fmWaybill','MatInfo');
    btnMC.Hint := GetRS('fmWaybill','MCList');
    edFindMat.InitRes;
    edFindMat.SearchNames[0] := GetRS('fmInventory', 'NameShort') + ';name';

    if edFindMat.CurrentSearchIndex = 0 then edFindMat.Caption.Caption := GetRS('fmInventory', 'NameShort') + ':';

    lSN.Caption := GetRS('fmWaybill','SNs') + ':';
    sbPartysSelect.Hint := GetRS('fmWaybill', 'PartySelectHint');

    txtSummWONDS.Caption := BaseCurrName;
    txtSummNDS.Caption := BaseCurrName;
    txtSummWithNDS.Caption := BaseCurrName;
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.edNamePropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.edNamePropertiesChange') else _udebug := nil;{$ENDIF}

  lWName.Visible := Trim(edName.Text)='';
  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//=============================================================
procedure TfrmEditPositionMov.edShortNamePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.edShortNamePropertiesChange') else _udebug := nil;{$ENDIF}

  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.FormCreate(Sender: TObject);
  var
    Temp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  FBySN := False;
  //FWriteOffMode := False;
  SetCaptions;
  panSummary.Align := alTop;
  edAmount.DecimalPlaces := Trunc(Abs(MatDisplayDigits));
  edFindMat.LoadFromRegistry(MainRegKey + '\' + Self.Name + '\' + edFindMat.Name);
  {
  cdsPriceTypes.Open;
  cdsWhouse.Open;
  if cdsWHouse.Locate('def', 1, [])  then cbWhouse.KeyValue := cdsWHouse.fieldbyname('wid').AsInteger;
  cdsMeasure.Open;
  txtLang.Caption := keyboardIndicator;
  FCanRefresh := True;

  if ReadFromRegInt(MainRegKey + '\' + Self.ClassName, 'FindField', Temp) then
    case Temp of
      0: begin
           lMat.Caption := rs('fmWaybill', 'NameShort') + ':';
           mnuName.Checked := True;
         end;
      1: begin
           lMat.Caption := rs('fmWaybill', 'Artikul') + ':';
           mnuArtikul.Checked := True;
         end;
    end;

  if ReadFromRegInt(MainRegKey + '\' + Self.ClassName, 'FindCriteria', Temp) then
    case Temp of
      0: aFindBegin.Checked := True;
      1: aFindSubstr.Checked := True;
      2: aFindConcurr.Checked := True;
    end;

  if ReadFromRegInt(MainRegKey + '\' + Self.ClassName, 'ContextFind', Temp)
    then aContextFind.Checked := Temp <> 0;

  edAmount.Value := WBMoveDefAmount;}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.edAmountPropertiesChange(Sender: TObject);
  var
    tmpremain: Extended;
    SOutNDS, SNDS, SWNDS:Extended;
    AllSOutNDS, AllSNDS, AllSWNDS:Extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.edAmountPropertiesChange') else _udebug := nil;{$ENDIF}

  FModified := true;
  tmpremain := 0;

  if chbRsv.Checked then begin
    if edAmount.Tag=0 then begin
      //Резерв позиций
      try
        edSN.Text := '';
        tmpremain := strtofloat(edAmount.EditingText);
        mdRsv.Close;
        mdRsv.Open;

        with mdPosition do begin
          First;

          while not Eof and (tmpremain>0) do begin
            if (tmpremain<=strtofloat(fieldbyname('amount').AsString))
                and (strtofloat(fieldbyname('amount').AsString) > 0)
            then begin
              mdRsv.Append;
              mdRsv.FieldByName('posid').AsInteger := FieldByName('posid').AsInteger;
              mdRsv.FieldByName('pricein').AsFloat := strtofloat(FieldByName('price').AsString);
              mdRsv.FieldByName('amount').AsFloat := tmpremain;
              mdRsv.FieldByName('currid').AsInteger := FieldByName('currid').AsInteger;
              mdRsv.FieldByName('discount').AsFloat := FieldByName('discount').AsFloat;
              mdRsv.FieldByName('nds').AsFloat := FieldByName('nds').AsFloat;
              mdRsv.FieldByName('ondate').AsDateTime := FieldByName('ondate').AsDateTime;
              mdRsv.FieldByName('onvalue').AsFloat := FieldByName('onvalue').AsFloat;
              mdRsv.FieldByName('currname').AsString := FieldByName('currname').AsString;

              if not FieldByName('SN').IsNull then begin
                mdRsv.FieldByName('SN').AsString := FieldByName('SN').AsString;
                edSN.Text := edSN.Text+mdRsv.FieldByName('SN').AsString+'; ';
              end
              else mdRsv.FieldByName('SN').Clear;

              if not FieldByName('gtd').IsNull
                then mdRsv.FieldByName('gtd').AsString := FieldByName('gtd').AsString
                else mdRsv.FieldByName('gtd').Clear;

              if not FieldByName('producer').IsNull
                then mdRsv.FieldByName('producer').AsString := FieldByName('producer').AsString
                else mdRsv.FieldByName('producer').Clear;

              if not FieldByName('certnum').IsNull
                then mdRsv.FieldByName('certnum').AsString := FieldByName('certnum').AsString
                else mdRsv.FieldByName('certnum').Clear;

              if not FieldByName('certdate').IsNull
                then mdRsv.FieldByName('certdate').AsDateTime := FieldByName('certdate').AsDateTime
                else mdRsv.FieldByName('certdate').Clear;

              mdRsv.Post;
            end
            else if strtofloat(fieldbyname('amount').AsString) > 0
            then begin
              mdRsv.Append;
              mdRsv.FieldByName('posid').AsInteger := FieldByName('posid').AsInteger;
              mdRsv.FieldByName('pricein').AsFloat := strtofloat(FieldByName('price').AsString);
              mdRsv.FieldByName('amount').AsFloat := strtofloat(FieldByName('amount').AsString);
              mdRsv.FieldByName('currid').AsInteger := FieldByName('currid').AsInteger;
              mdRsv.FieldByName('discount').AsFloat := FieldByName('discount').AsFloat;
              mdRsv.FieldByName('nds').AsFloat := FieldByName('nds').AsFloat;
              mdRsv.FieldByName('ondate').AsDateTime := FieldByName('ondate').AsDateTime;
              mdRsv.FieldByName('onvalue').AsFloat := FieldByName('onvalue').AsFloat;
              mdRsv.FieldByName('currname').AsString := FieldByName('currname').AsString;

              if not FieldByName('SN').IsNull then begin
                mdRsv.FieldByName('SN').AsString := FieldByName('SN').AsString;
                edSN.Text := edSN.Text+mdRsv.FieldByName('SN').AsString+'; ';
              end
              else mdRsv.FieldByName('SN').Clear;

              if not FieldByName('gtd').IsNull
                then mdRsv.FieldByName('gtd').AsString := FieldByName('gtd').AsString
                else mdRsv.FieldByName('gtd').Clear;

              if not FieldByName('producer').IsNull
                then mdRsv.FieldByName('producer').AsString := FieldByName('producer').AsString
                else mdRsv.FieldByName('producer').Clear;

              if not FieldByName('certnum').IsNull
                then mdRsv.FieldByName('certnum').AsString := FieldByName('certnum').AsString
                else mdRsv.FieldByName('certnum').Clear;

              if not FieldByName('certdate').IsNull
                then mdRsv.FieldByName('certdate').AsDateTime := FieldByName('certdate').AsDateTime
                else mdRsv.FieldByName('certdate').Clear;

              mdRsv.Post;
            end;//if
            tmpremain := tmpremain-fieldbyname('amount').AsFloat;
            Next;
          end;//while
        end;//with
        if edSN.Text<>'' then edSN.Text := System.Copy(edSN.Text,1,Length(edSN.Text)-2);

      Except
        mdRsv.Close;
      end;
    end;//if edAmount.Tag=0
  end//if chbRsv.Checked then begin
  else begin
    mdRsv.Close;
    mdRsv.Open;
  end;

  AllSOutNDS := 0;AllSNDS := 0;AllSWNDS := 0;
  //Подсчёт суммы

  if mdRsv.Active then
  with mdRsv do begin
    First;
    while not Eof do begin
      NDSCalc(FieldByName('amount').AsFloat,FieldByName('pricein').AsFloat*FieldByName('onvalue').AsFloat,
              FieldByName('nds').AsFloat,1,SOutNDS,SNDS);

      AllSNDS := AllSNDS+RoundToA(SNDS,-2);
      AllSWNDS := AllSWNDS+RoundToA(SOutNDS+SNDS,-2);

      Next;
    end;//while
  end;//with

  AllSOutNDS := AllSWNDS - AllSNDS;
  stAmountEx.Caption := edAmount.EditText;
  lNDS.Caption := rs('fmWaybill', 'NDS') + ' ' + mdRsv.FieldByName('nds').AsString + '%:';
  stSummEx.Caption := FormatFloat(MoneyDisplayFormat, RoundToA(AllSOutNDS, -2));
  stSummNDS.Caption := FormatFloat(MoneyDisplayFormat, RoundToA(AllSNDS, -2));
  stSummWithNDS.Caption := FormatFloat(MoneyDisplayFormat, RoundToA(AllSWNDS, -2));
  stSumm.Caption := stSummWithNDS.Caption;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.edSummCurrPropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.edSummCurrPropertiesChange') else _udebug := nil;{$ENDIF}

  edsummdef.Value := edSummCurr.Value*Kurs;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//=============================================================
procedure TfrmEditPositionMov.edPriceNondsPropertiesChange(Sender: TObject);
  (*var
    v: extended;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.edPriceNondsPropertiesChange') else _udebug := nil;{$ENDIF}

  if edPriceNoNDS.Tag=0  then begin
   try
    edPrice.Tag := 1;
    if edPriceNoNDS.EditingText='' then v := 0
     else v := NDSIn(StrToFloat(edPriceNoNDS.EditingText), PosNDS);
    edPrice.Value := v;
    edPrice.Tag := 0;
   except
    edPrice.Tag := 0;
    edPrice.Text := '';
   end;
   CalcSummary;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//=============================================================
procedure TfrmEditPositionMov.edSummCurrNoNdsPropertiesChange(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.edSummCurrNoNdsPropertiesChange') else _udebug := nil;{$ENDIF}

  edSummDefNoNds.Value := edSummCurrNoNds.Value*Kurs;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//=============================================================
procedure TfrmEditPositionMov.cdsWhouseAfterOpen(DataSet: TDataSet);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.cdsWhouseAfterOpen') else _udebug := nil;{$ENDIF}

  if cdsWHouse.Locate('def', 1, [])
    then cbWhouse.EditValue := cdsWHouse.fieldbyname('wid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//=============================================================
procedure TfrmEditPositionMov.edAmountKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.edAmountKeyPress') else _udebug := nil;{$ENDIF}

  if lAmount.Font.Color<>clRed then GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.edPriceKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.edPriceKeyPress') else _udebug := nil;{$ENDIF}

  // if lPrice.Font.Color<>clRed then GoNext(Sender,Key);
  GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.edPriceNoNDSKeyPress(Sender: TObject; var Key: Char);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.edPriceNoNDSKeyPress') else _udebug := nil;{$ENDIF}

  if lPrice.Font.Color<>clRed then GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//=============================================================
procedure TfrmEditPositionMov.cbWHouseKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.cbWHouseKeyPress') else _udebug := nil;{$ENDIF}

  if lWhouse.Font.Color<>clRed then GoNext(Sender,Key);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.btnRsvClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.btnRsvClick') else _udebug := nil;{$ENDIF}

  if FMatID = 0 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmMatRsv.Create(nil) do
    try
     ParentNameEx := 'fmWMat';
     OnDate := Self.OnDate;
     WID := 0;
     ID := FMatID;
     ShowModal;

   finally
     Free;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.btnMoveClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.btnMoveClick') else _udebug := nil;{$ENDIF}

  if FMatID = 0 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmMatMove.Create(nil) do
    try
      ParentNameEx := 'fmWMat';
      OnDate := Self.OnDate;
      WID := 0; //cbWHouse.KeyValue;
      ID := FMatID;
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.btnInfoClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.btnInfoClick') else _udebug := nil;{$ENDIF}


  if FMatID = 0 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmEditMaterials.Create(nil) do
    try
      ParentNameEx := 'fmMaterials';
      OnDate := Self.OnDate;
      ID := FMatID;
      CanModify := False;
      ShowModal;
    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.WMLayoutChanged(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.WMLayoutChanged') else _udebug := nil;{$ENDIF}

  edFindMat.SetLng;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.btnMCClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.btnMCClick') else _udebug := nil;{$ENDIF}

  if FMatID <= 0 then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmMCList.Create(nil) do
  try
    OnDate := Self.OnDate;
    MainHandle := Self.Handle;
    ID := FMatID;
    CanModify := False;
    ShowModal;
  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.edFindMatChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.edFindMatChange') else _udebug := nil;{$ENDIF}

  FMatID := edFindMat.MatID;
  if edFindMat.Tag = 0 then SendMessage(Self.Handle, WM_REFRESH, FMatID, Integer(rtMat));

  if edFindMat.MatID = 0
    then lMatEx.Caption := ''
    else begin
      lMatEx.Left := lTitle.Left + lTitle.Width;
      lMatEx.Width := panTitleButtons.Left - 2 - lMatEx.Left;
      lMatEx.Caption := ': ' + edFindMat.MatName;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.edFindMatRefButtonClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.edFindMatRefButtonClick') else _udebug := nil;{$ENDIF}

  FCurrCtrl := edFindMat;
  edFindMat.SetFocus;
  aAddMatR.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.aPartysSelectExecute(Sender: TObject);
  var
    tmpamount:Extended;
    str:string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.aPartysSelectExecute') else _udebug := nil;{$ENDIF}

  tmpamount := 0;
  if (not mdPosition.Active) or (mdPosition.IsEmpty) then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmPartySelect.Create(nil) do
  try
    FBySN := Self.FBySN;
    mdSN.Open;
    FAmount := Round(StrToFloat(edAmount.EditingText));
    //FChkAmount := FInAcc;
    MatName := Self.FMatName;

    {if FBySN then begin
      colAsel.Precision := 0;
      colAsel.DisableEditor := true;
      colAsel.ReadOnly := True;
    end;
    else colAsel.Precision := 3;
  }

    if True {GetDSCount(mdPosition, 'postype', 0) > 0} then begin
      mdSN.Append;
      mdSN.FieldByName('posid').AsInteger := 0;
      mdSN.FieldByName('pid').AsInteger := 0;

      if GetDSCount(mdPosition, 'postype', 0) > 0
        then mdSN.FieldByName('docnumtxt').AsString := rs('fmWaybill', 'MatAtWH')
        else mdSN.FieldByName('docnumtxt').AsString := rs('fmWaybill', 'NoMatAtWH');

      mdSN.Post;
    end;

    {if GetDSCount(mdPosition, 'postype', 1) > 0 then begin
      mdSN.Append;
      mdSN.FieldByName('posid').AsInteger := -1;
      mdSN.FieldByName('pid').AsInteger := -1;
      mdSN.FieldByName('docnumtxt').AsString := rs('fmWaybill', 'MatOrdered');
      mdSN.Post;
    end;}

    with mdPosition do begin
      First;
      while not Eof do begin
        if FieldByName('postype').AsInteger = 0 then begin
          mdSN.Append;
          mdSN.FieldByName('num').AsInteger := mdSN.RecNo;

          if FBySN then mdSN.FieldByName('SN').AsString := FieldByName('SN').AsString;

          mdSN.FieldByName('docnumtxt').AsString := FieldByName('docnumtxt').AsString;
          mdSN.FieldByName('wbillid').AsInteger := FieldByName('wbillid').AsInteger;
          mdSN.FieldByName('pid').AsInteger := -FieldByName('postype').AsInteger;
          mdSN.FieldByName('wtype').AsInteger := FieldByName('wtype').AsInteger;
          mdSN.FieldByName('posid').AsInteger := FieldByName('posid').AsInteger;
          mdSN.FieldByName('ondate').AsDateTime := FieldByName('ondate').AsDateTime;
          mdSN.FieldByName('amount').AsFloat := FieldByName('amount').AsFloat;
          mdSN.FieldByName('price').AsFloat := FieldByName('price').AsFloat;
          mdSN.FieldByName('currname').AsString := FieldByName('currname').AsString;
          mdSN.FieldByName('gtd').AsString := FieldByName('gtd').AsString;
          mdSN.FieldByName('certnum').AsString := FieldByName('certnum').AsString;
          mdSN.FieldByName('producer').AsString := FieldByName('producer').AsString;

          if FieldByName('certdate').IsNull
            then mdSN.FieldByName('certdate').Clear
            else mdSN.FieldByName('certdate').AsDateTime := FieldByName('certdate').AsDateTime;


          if mdRsv.Active and mdRsv.Locate('posid',FieldByName('posid').AsInteger,[]) then begin
            mdSN.FieldByName('checked').AsBoolean := true;
            mdSN.FieldByName('asel').AsFloat := mdRsv.FieldByName('amount').AsFloat;
          end//if
          else begin
            mdSN.FieldByName('checked').AsBoolean := false;
            mdSN.FieldByName('asel').AsFloat := 0
          end;//else

          mdSN.Post;
        end;

        Next;
      end;//while not eof
    end;//with mdPosition

    mdSN.First;

    if ShowModal = mrOk then begin
      mdRsv.Close;
      mdRsv.Open;
      edSN.Text := '';

      with mdSN do begin
        First;
        tmpamount := 0;
        while not Eof do begin
          if (FieldByName('checked').AsBoolean)
             and (RoundToA(FieldByName('asel').AsFloat,MatDisplayDigits) > 0)
             and mdPosition.Locate('posid',FieldByName('posid').AsInteger,[])
          then begin
            mdRsv.Append;
            mdRsv.FieldByName('posid').AsInteger := mdPosition.FieldByName('posid').AsInteger;
            mdRsv.FieldByName('currid').AsInteger := mdPosition.FieldByName('currid').AsInteger;
            mdRsv.FieldByName('discount').AsFloat := mdPosition.FieldByName('discount').AsFloat;
            mdRsv.FieldByName('nds').AsFloat := mdPosition.FieldByName('nds').AsFloat;
            mdRsv.FieldByName('ondate').AsDateTime := mdPosition.FieldByName('ondate').AsDateTime;
            mdRsv.FieldByName('onvalue').AsFloat := mdPosition.FieldByName('onvalue').AsFloat;
            mdRsv.FieldByName('currname').AsString := mdPosition.FieldByName('currname').AsString;
            mdRsv.FieldByName('pricein').AsFloat := strtofloat(mdPosition.FieldByName('price').AsString);
            mdRsv.FieldByName('amount').AsFloat := RoundToA(FieldByName('asel').AsFloat,MatDisplayDigits);
            tmpamount := tmpamount+mdRsv.FieldByName('amount').AsFloat;

            if not mdPosition.FieldByName('SN').IsNull then begin
              mdRsv.FieldByName('SN').AsString := mdPosition.FieldByName('SN').AsString;
              edSN.Text := edSN.Text+mdPosition.FieldByName('SN').AsString+'; ';
            end//if
            else mdRsv.FieldByName('SN').Clear;

            if not mdPosition.FieldByName('gtd').IsNull 
              then mdRsv.FieldByName('gtd').AsString := mdPosition.FieldByName('gtd').AsString
              else mdRsv.FieldByName('gtd').Clear;

            if not mdPosition.FieldByName('producer').IsNull
              then mdRsv.FieldByName('producer').AsString := mdPosition.FieldByName('producer').AsString
              else mdRsv.FieldByName('producer').Clear;

            if not mdPosition.FieldByName('certnum').IsNull
              then mdRsv.FieldByName('certnum').AsString := mdPosition.FieldByName('certnum').AsString
              else mdRsv.FieldByName('certnum').Clear;

            if not mdPosition.FieldByName('certdate').IsNull
              then mdRsv.FieldByName('certdate').AsDateTime := mdPosition.FieldByName('certdate').AsDateTime
              else mdRsv.FieldByName('certdate').Clear;

            mdRsv.Post;
          end;

          Next;
        end;//while
      end;//with

      if edSN.Text <> '' then edSN.Text := System.Copy(edSN.Text,1,Length(edSN.Text)-2);

      edAmount.Tag := 1;
      edAmount.Value := RoundToA(tmpamount,MatDisplayDigits);
      edAmount.Tag := 0;
    end;//if

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.aShowSNExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.aShowSNExecute') else _udebug := nil;{$ENDIF}

  if FBySN then with TfrmSerials.Create(nil) do try
    colSN.DisableEditor := true;
    mdSN.Open;

    with mdRsv do begin
      First;

      while not Eof do begin
        if mdPosition.Locate('posid',FieldByName('posid').AsInteger,[])
           and not mdPosition.FieldByName('SN').IsNull
        then begin
          mdSN.Append;
          mdSN.FieldByName('num').AsInteger := mdSN.RecNo;
          mdSN.FieldByName('sn').AsString := mdPosition.FieldByName('SN').AsString;
          mdSN.Post;
        end;//if
        Next;
      end;//while
    end;//with

    if not mdSN.IsEmpty then begin
      mdSN.First;
      ShowModal;
    end;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.edSNPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.edSNPropertiesButtonClick') else _udebug := nil;{$ENDIF}

  aShowSN.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.aAddMatRExecute(Sender: TObject);
  var
    aid:integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.aAddMatRExecute') else _udebug := nil;{$ENDIF}

  if FCurrCtrl = edAmount then aPartysSelect.Execute
  else if FCurrCtrl = cbWHouse then aAddWHouse.Execute
  else begin
    if not chbRsv.Checked then begin
      try
        aid := edFindMat.MatID;
      except
        aid := 0;
      end;

      ShowModalRef(Self, rtMat, vtMat, 'TfmMaterials', Self.OnDate, aid);
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end
    else begin
      case FDocType of
        dtWBMove,dtWriteOff:ShowModalWH(Self,MaxDateTime,FMatID,1,FWID);
        dtReturnOut: if FKAID>0 then ShowModalWH(Self,MaxDateTime,FMatID,1,FWID,FKAID);
      end;//case

      if Self.Visible then edFindMat.Editor.SetFocus;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.mdPositionCalcFields(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.mdPositionCalcFields') else _udebug := nil;{$ENDIF}

  with DataSet do begin
    FieldByName('docnumtxt').AsString := FieldByName('docnum').AsString + ' '
      + rs('fmWaybill','AttDate')+' '+DateTimeToStr(FieldByName('docdate').AsDateTime);

    FieldByName('pricetxt').AsString := FloatToStr(FieldByName('price').AsFloat)+' '+
                                       FieldByName('currname').AsString;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.aSetPanelsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.aSetPanelsExecute') else _udebug := nil;{$ENDIF}

  with TfrmSetPanels.Create(nil) do
  try
    MainHandle := Self.Handle;
    FList.AddObject(rs('fmWaybill', 'PanMat'), panMat);
    FList.AddObject(rs('fmWaybill', 'PanPrice'), panPrice);
    FList.AddObject(rs('fmWaybill', 'PanSN'), panSN);
    FList.AddObject(rs('fmWaybill', 'PanSummary'), panSummary);
    SetPanels;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.WMRealignPanels(var M: TMessage);
 var
   FList: TStringList;
   i: Integer;
   FVis: Boolean;
   FPan: TPanel;
   FOffs: Integer;
   Y: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.WMRealignPanels') else _udebug := nil;{$ENDIF}

  FList := TStringList(Pointer(M.WParam));
  FOffs := 0;
  panSummary.Align := alNone;

  for i := 0 to FList.Count - 1 do begin
    FVis := FList.Strings[i] = '1';
    FPan := TPanel(FList.Objects[i]);

    if FPan.Visible <> FVis then begin
      if FVis
        then FOffs := FOffs + FPan.Height
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

  SavePanVisibility;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.RealignPanels;
 var
   FOffs: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.RealignPanels') else _udebug := nil;{$ENDIF}

  FOffs := 0;
  if not panSN.Visible then FOffs := FOffs - panSN.Height;
  if not panSummary.Visible then FOffs := FOffs - panSummary.Height;
  panSummary.Align := alClient;
  if not panSummary.Visible then FOffs := FOffs + 7;
  if FOffs <> 0 then Self.Height := Self.Height + FOffs;
  SavePanVisibility;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.LoadPanVisibility;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.LoadPanVisibility') else _udebug := nil;{$ENDIF}

  panSN.Visible := FPanSNVis;
  panSummary.Visible := FPanSummaryVis;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.SavePanVisibility;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.SavePanVisibility') else _udebug := nil;{$ENDIF}

  FPanSNVis := panSN.Visible;
  FPanSummaryVis := panSummary.Visible;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.FormShow') else _udebug := nil;{$ENDIF}

  inherited;

  if not FRealigned then begin
    RealignPanels;
    FRealigned := True;
  end
  else LoadPanVisibility;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.CtrlEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.CtrlEnter') else _udebug := nil;{$ENDIF}

  FCurrCtrl := Sender as TControl;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.CtrlExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.CtrlExit') else _udebug := nil;{$ENDIF}

  FCurrCtrl := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.WMDelete(var M: TMessage);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.WMDelete') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
    rtWHouse,rtPersons:begin
      FtmpCtrl := FCurrCtrl;
      FCurrCtrl := nil;
      SendMessage(Self.Handle,WM_REFRESH,0,integer(TRefType(M.LParam)));
      FCurrCtrl := FtmpCtrl;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//=============================================================
procedure TfrmEditPositionMov.aAddWHouseExecute(Sender: TObject);
 var
   aid:integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.aAddWHouseExecute') else _udebug := nil;{$ENDIF}

  try
    aid := cbWHouse.KeyValue;
  except
    aid := 0;
  end;

  cbWhouse.SetFocus;
  ShowModalRef(Self,rtWHouse,vtWHouse,'TfmWHouse',Self.OnDate,aid);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.chbRsvPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.chbRsvPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  inherited;

  if chbRsv.Tag = 0 then edAmountPropertiesChange(nil);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.cbWHousePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.cbWHousePropertiesChange') else _udebug := nil;{$ENDIF}

  inherited;

  if cbWHouse.Tag = 0 then begin
    FWID := cbWHouse.KeyValue;
    DataModified(nil);
    SendMessage(Self.Handle,WM_REFRESH,FMatID,integer(rtMat));
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.FormDestroy') else _udebug := nil;{$ENDIF}

  edFindMat.SaveToRegistry(MainRegKey + '\' + Self.Name + '\' + edFindMat.Name);

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.WMSetText(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.WMSetText') else _udebug := nil;{$ENDIF}

  inherited;

  lTitle.Caption := panTitleBar.Caption;

  if not Assigned(edFindMat) then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  if (edFindMat.MatID = 0)
    then lMatEx.Caption := ''
    else begin
      lMatEx.Left := lTitle.Left + lTitle.Width;
      lMatEx.Width := panTitleButtons.Left - 2 - lMatEx.Left;
      lMatEx.Caption := ': ' + edFindMat.MatName;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
procedure TfrmEditPositionMov.cdsWhouseBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionMov.cdsWhouseBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsWhouse.Macros.ParamByName('m').AsString := WHAccessMacro;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//=============================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditPositionMov', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//=============================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
