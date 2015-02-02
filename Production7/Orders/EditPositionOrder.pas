{$I ok_sklad.inc}
unit EditPositionOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, EditPositionAcc, dxmdaset, DB, ssMemDS, DBClient,
  ssClientDataSet, ActnList, ssFormStorage, ImgList, xButton, ssPanel,
  ssGradientPanel, cxSpinEdit, cxCalendar, cxTextEdit, cxButtonEdit,
  cxDropDownEdit, cxCalc, ssCalcEdit, cxMaskEdit, ssDBLookupCombo,
  cxControls, cxContainer, cxEdit, cxCheckBox, okSearchEdit, ssLabel,
  ssSpeedButton, StdCtrls, ssBevel, ExtCtrls, ssBaseConst, cxRadioGroup,
  ssCheckBox;

type
  TfrmEditPositionOrder = class(TfrmEditPositionAcc)
    procedure edFindMatChange(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure setid(const Value: integer); override;
  public

  end;

var
  frmEditPositionOrder: TfrmEditPositionOrder;

implementation

uses
  prConst, ClientData, ssFun, prTypes, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

{ TfrmEditPositionOrder }

//==============================================================================================
procedure TfrmEditPositionOrder.setid(const Value: integer);
 var
  BM:TBookmark;
  APosId,ATmpId, ASourceId:Integer;
  AAmount:Extended;
  {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditPositionOrder.setid') else _udebug := nil;{$ENDIF}


  inherited;

  {cbWHouse.Tag := 1; cdsWhouse.Open;  cbWHouse.Tag := 0;
  edNDS.Value := FPosNDS;
  if Value<>0 then begin
    Fid := Value;
    LockFind := True;
    //Освобождение редактируемых позиций (старых)
    TdxMemData(pointer(stMeasureName.Tag)).First;
    while not TdxMemData(pointer(stMeasureName.Tag)).Eof do begin
      if TdxMemData(pointer(stMeasureName.Tag)).FieldByName('sourceid').AsInteger=ID then begin
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
      if (TdxMemData(pointer(stRemain.Tag)).FieldByName('sourceid').AsInteger=ID)
         and (TdxMemData(pointer(stRemain.Tag)).FieldByName('free').AsInteger<>1) then begin
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
    end;
    FMatID := TdxMemData(pointer(Tag)).fieldbyname('matid').AsInteger;
    edFindMat.MatID := TdxMemData(pointer(Tag)).fieldbyname('matid').AsInteger;
    DSRefresh(cdsPriceTypes, 'ptypeid', 0);
    cbWHouse.KeyValue := TdxMemData(pointer(Tag)).fieldbyname('wid').AsInteger;
    cbProducer.Text := TdxMemData(pointer(Tag)).FieldByName('producer').AsString;
    edGTD.Text := TdxMemData(pointer(Tag)).FieldByName('gtd').AsString;
    edCertNum.Text := TdxMemData(pointer(Tag)).FieldByName('certnum').AsString;
    edCertDate.Date := TdxMemData(pointer(Tag)).FieldByName('certdate').AsDateTime;
    if edCertDate.Date = 0 then edCertDate.EditText := '';
    FPosNDS := StrToFloat(TdxMemData(pointer(Tag)).fieldbyname('nds').AsString);
    edNDS.Value := FPosNDS;
    if not TdxMemData(Pointer(Tag)).FieldByName('cardid').IsNull then begin
      rbtDiscCard.Checked := True;
      edDiscCard.CardID := TdxMemData(Pointer(Tag)).FieldByName('cardid').AsInteger;
    end
    else begin
      rbtDiscManual.Checked := True;
      edDiscCard.CardID := 0;
    end;
    edDiscount.Value := TdxMemData(pointer(Tag)).fieldbyname('discount').AsFloat;
    chbDiscount.Checked := edDiscount.Value > 0;

    //запись в mdRsv
    mdRsv.Close;
    mdRsv.Open;
    with TdxMemData(pointer(panMain.Tag)) do begin
      First;
      while not Eof do begin
        if (FieldByName('sourceid').AsInteger=Value) and mdPosition.Locate('posid',FieldByName('posid').AsInteger,[]) then begin
          mdRsv.Append;
          mdRsv.FieldByName('posid').AsInteger := mdPosition.FieldByName('posid').AsInteger;
          mdRsv.FieldByName('pricein').AsFloat := strtofloat(mdPosition.FieldByName('price').AsString);
          mdRsv.FieldByName('amount').AsFloat := FieldByName('amount').AsFloat;
          if not mdPosition.FieldByName('SN').IsNull then begin
            mdRsv.FieldByName('SN').AsString := mdPosition.FieldByName('SN').AsString;
            edSN.Text := edSN.Text+mdPosition.FieldByName('SN').AsString+'; ';
          end;//if
          mdRsv.Post;
        end;//if
        Next;
      end;//while
    end;//with
    if edSN.Text<>EmptyStr then edSN.Text := System.Copy(edSN.Text,1,Length(edSN.Text)-2);
    ManualPrice := true;
    if TdxMemData(pointer(Tag)).fieldbyname('PTypeId').IsNull
      then lcbPriceTypes.Text := EmptyStr
      else lcbPriceTypes.KeyValue := 
        TdxMemData(pointer(Tag)).fieldbyname('PTypeId').AsInteger;
    ManualPrice := false;
    chbRsv.Checked := chbRsv.Tag=1;
    FModified := false;
    LockFind := False;

  end
  else begin
    mdPosition.Close;
    Application.ProcessMessages;
    //set default whouse
    cbWHouse.Tag := 1;
    if (cbWHouse.EditText = '') and cdsWHouse.Locate('def', 1, []) then begin
     cbWhouse.KeyValue := cdsWHouse.fieldbyname('wid').AsInteger;
    end;
    cbWHouse.Tag := 0;
    edAmount.Tag := 1;edAmount.Value := OrdersOutDefAmount;edAmount.Tag := 0;
    edPrice.Value := 0;
    // go to whouse
    if WBOutAutoWH then begin
      chbRsv.Tag := 1;chbRsv.Checked := True;chbRsv.Tag := 0;
      aAddMatRExecute(nil);
      FModified := true;
    end;//if
  end;//else
  Application.ProcessMessages;
  if not Self.Visible then Self.ShowModal;
  }

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditPositionOrder.edFindMatChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditPositionOrder.edFindMatChange') else _udebug := nil;{$ENDIF}


  if edFindMat.MatID = 0 then begin
    lMatEx.Caption := EmptyStr;
    stMeasureName.Caption := EmptyStr;
  end
  else begin
    lMatEx.Left := lTitle.Left + lTitle.Width;
    lMatEx.Width := panTitleButtons.Left - 2 - lMatEx.Left;
    lMatEx.Caption := ': ' + edFindMat.MatName;

    stMeasureName.Caption := edFindMat.Measure;
    if edFindMat.IsSerial
      then edAmount.DecimalPlaces := 0
      else edAmount.DecimalPlaces := Trunc(Abs(MatDisplayDigits));
  end;
  if edFindMat.Tag = 0 then SendMessage(Self.Handle, WM_REFRESH,
    edFindMat.MatID, Integer(rtMat));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditPositionOrder', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
