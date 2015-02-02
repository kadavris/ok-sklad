{$I ok_sklad.inc}
unit EditOrderTmp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxCntner6, dxEditor6, StdCtrls, ssBaseConst, ssBaseDlg,
  cxMemo, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalc, ssCalcEdit, okSearchEdit, ssLabel, ssBevel,
  ActnList, ssFormStorage, ImgList, xButton, ssPanel, ssGradientPanel,
  ssBaseTypes, cxCheckBox, cxLookAndFeelPainters, cxButtons, ssSpeedButton,
  dxDBGrid6, dxTL6, dxDBCtrl6, dxDBTLCl6, dxGrClms6, ssDBGrid, DB,
  prTypes, DBClient, ssClientDataSet, Menus, TB2Item;

type
  TfrmEditOrderTmp = class(TBaseDlg)
    aHide: TAction;
    aInfo: TAction;
    btnHide: TssSpeedButton;
    btnInfo: TssSpeedButton;
    bvlMain: TssBevel;
    bvlPriceInterval: TssBevel;
    cdsOrdered: TssClientDataSet;
    cdsOrderedcertnum: TStringField;
    cdsOrderedCURRID: TIntegerField;
    cdsOrderedDOCID: TIntegerField;
    cdsOrderedDOCNUM: TStringField;
    cdsOrderedkaname: TStringField;
    cdsOrderedNAME: TStringField;
    cdsOrderednotes: TStringField;
    cdsOrderedONDATE: TDateTimeField;
    cdsOrderedONVALUE: TFloatField;
    cdsOrderedORDERED: TFloatField;
    cdsOrderedposdate: TDateTimeField;
    cdsOrderedPOSID: TIntegerField;
    cdsOrderedPRICE: TFloatField;
    cdsOrderedREMAIN: TFloatField;
    cdsOrderedreserved: TFloatField;
    cdsOrderedRSV: TFloatField;
    cdsOrderedSHORTNAME: TStringField;
    cdsOrderedTODATE: TDateTimeField;
    cdsOrderedWBILLID: TIntegerField;
    cdsOrderedWID: TIntegerField;
    cdsOrderedWTYPE: TIntegerField;
    colDocNum: TdxDBGridColumn;
    colKAName: TdxDBGridColumn;
    colRsv: TdxDBGridColumn;
    colTmpAmount: TdxDBGridColumn;
    colTmpImg: TdxDBGridImageColumn;
    colTmpNotes: TdxDBGridColumn;
    colTmpPosID: TdxDBGridColumn;
    colToDate: TdxDBGridColumn;
    colWBillID: TdxDBGridColumn;
    edAmount: TssCalcEdit;
    edMat: TokMatSearchEdit;
    edNotes: TcxMemo;
    grdOrdered: TssDBGrid;
    lAmount: TssLabel;
    lcbWH: TokWHouseSearchEdit;
    lMatEx: TLabel;
    lNotes: TLabel;
    lTitle: TLabel;
    pmMain: TTBPopupMenu;
    srcOrdered: TDataSource;
    stMeasureName: TssBevel;
    TBItem4: TTBItem;

    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aHideExecute(Sender: TObject);
    procedure aInfoExecute(Sender: TObject);
    procedure cdsOrderedBeforeOpen(DataSet: TDataSet);
    procedure colDocNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colRsvGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colTmpAmountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure DataModified(Sender: TObject);
    procedure edAmountPropertiesChange(Sender: TObject);
    procedure edMatChange(Sender: TObject);
    procedure edMatRefButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdOrderedCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure grdOrderedDblClick(Sender: TObject);
    procedure lcbWHChange(Sender: TObject);

  private
    FAValue: Extended;
    procedure WMSetText(var M: TMessage); message WM_SETTEXT;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    function GetMatID: Integer;
    procedure SetMatID(const Value: Integer);

  protected
    procedure setid(const Value: integer); override;
    procedure SetParentName(const Value: string); override;
    procedure RealignGrid;

  public
    ParentHandle: HWND;
    procedure SetCaptions; override;
    property MatID: Integer read GetMatID write SetMatID;
  end;

var
  frmEditOrderTmp: TfrmEditOrderTmp;

implementation

uses
  prConst, ClientData, prFun,
  ssCallbackConst, xLngManager, ssFun, TmpOrderInfo, fMessageDlg, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}
//==============================================================================================
procedure TfrmEditOrderTmp.setid(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditOrderTmp.setid') else _udebug := nil;{$ENDIF}

  if not IsPattern then FID := Value;

  with newDataSet do
  try
    if Value <> 0 then begin
      if not IsPattern
        then Self.Caption := dmData.Lng.GetRS('fmOrders', 'TmpEdit')
        else Self.Caption := dmData.Lng.GetRS('fmOrders', 'TmpNew');

      ProviderName := 'pWaybillDet_Pos';
      FetchParams;
      Params.ParamByName('posid').AsInteger := Value;
      Open;

      if not IsEmpty then begin
        edMat.MatID := FieldByName('matid').AsInteger;
        lcbWH.WID := FieldByName('wid').AsInteger;
        edAmount.Value := FieldByName('amount').AsFloat;
        edNotes.Text := FieldByName('notes').AsString;
      end;
      Close;

      if not IsPattern then btnApply.Enabled := False;

      edMat.Enabled := False;
      lcbWH.Enabled := False;
    end
    else Self.Caption := dmData.Lng.GetRS('fmOrders', 'TmpNew');

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmp.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
    NewRecord: boolean;
    PosInfo: TPosInfo;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditOrderTmp.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult in [mrOK, mrYes] then begin
    CanClose := False;

    with newDataSet do
    try
      TrStart;

      try
        NewRecord := (ID = 0);

        if NewRecord then begin
          FID := GetMaxID(dmData.SConnection, 'waybilldet', 'posid');

          ProviderName := 'pWaybill_Get';
          FetchParams;
          Params.ParamByName('wbillid').AsInteger := -16;
          Open;
          if IsEmpty then begin
            Close;
            ProviderName := 'pWaybill_InsS';
            FetchParams;
            Params.ParamByName('wbillid').AsInteger := -16;
            Params.ParamByName('num').AsString := 'System';
            Params.ParamByName('ondate').AsDateTime := Date;
            Params.ParamByName('checked').AsInteger := 0;
            Params.ParamByName('deleted').AsInteger := 1;
            Params.ParamByName('defnum').AsInteger := 0;
            Params.ParamByName('wtype').AsInteger := 16;
            Execute;
          end;

          Close;
        end;

        if NewRecord
          then ProviderName := 'pWaybillDet_InsS'
          else ProviderName := 'pWaybillDet_UpdS';

        FetchParams;
        Params.ParamByName('posid').AsInteger := FID;
        Params.ParamByName('matid').AsInteger := edMat.MatID;
        Params.ParamByName('wbillid').AsInteger := -16;
        Params.ParamByName('num').AsInteger := FID;
        Params.ParamByName('wid').AsInteger := lcbWH.WID;
        Params.ParamByName('amount').AsFloat := StrToFloat(edAmount.EditText);
        Params.ParamByName('nds').AsFloat := edMat.NDS;
        Params.ParamByName('ondate').AsDateTime := Now;
        Execute;

        if not NewRecord then begin
          ProviderName := 'pWaybillDetAP_Del';
          FetchParams;
          Params.ParamByName('posid').AsInteger := FID;
          Execute;
        end;

        ProviderName := 'pWaybillDetAP_InsS';
        FetchParams;
        Params.ParamByName('posid').AsInteger := FID;
        Params.ParamByName('notes').AsString := edNotes.Text;
        Params.ParamByName('certnum').AsString := UserFullName;
        Execute;

        ProviderName := 'pWMatTurnOut_Del';
        FetchParams;
        Params.ParamByName('posid').AsInteger := FID;
        Execute;

        ProviderName := 'pWMatTurnOut_Ins';
        FetchParams;
        Params.ParamByName('posid').AsInteger := FID;
        Params.ParamByName('matid').AsInteger := edMat.MatID;
        Params.ParamByName('wid').AsInteger := lcbWH.WID;
        Params.ParamByName('sourceid').AsInteger := FID;
        Params.ParamByName('turntype').AsInteger := 3;
        Params.ParamByName('ondate').AsDateTime := Now;
        Params.ParamByName('amount').AsFloat := RoundToA(StrToFloat(edAmount.EditText), MatDisplayDigits);
        Execute;

        TrCommit;

        PosInfo.PosID := FID;
        PosInfo.MatID := edMat.MatID;
        PosInfo.WID := lcbWH.WID;
        SendMessage(MainHandle, WM_REFRESH, Integer(@PosInfo), -16);

        RefreshFun('TfmOrders', 16);
        RefreshFun('TfmWMat', 0);

        if (ModalResult = mrYes) then begin
          if NewRecord then begin
            edMat.MatID := 0;
            edMat.Editor.SetFocus;
            edAmount.Value := 0;
            edNotes.Clear;
            FID := 0;
          end
        end
        else CanClose := True;

        FModified := False;

      finally
        Free;
      end;

    except
      on e:exception do begin
        TrRollback;
        MessageDlg(e.Message, mtError, [mbOk], 0);
      end;
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmp.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmp.ActionListUpdate') else _udebug := nil;{$ENDIF}

  aOk.Enabled := (edMat.MatID > 0) and (lcbWH.WID > 0) and (FAValue > 0) and FModified;
  aApply.Enabled := aOk.Enabled;

  aInfo.Enabled := btnHide.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmp.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmp.DataModified') else _udebug := nil;{$ENDIF}

  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmp.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmp.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with dmData.Lng do begin
    edMat.InitRes;
    edMat.SearchNames[0] := GetRS('fmInventory', 'NameShort') + ';name';

    if edMat.CurrentSearchIndex = 0
      then edMat.Caption.Caption := GetRS('fmInventory', 'NameShort') + ':';

    lcbWH.InitRes;
    colDocNum.Caption := GetRS('fmWMat', 'OrderNo');
    colToDate.Caption := GetRS('fmWMat', 'OrderToDate');
    colTmpAmount.Caption := GetRS('fmWMat', 'Free');
    colTmpImg.Caption := '';
    btnInfo.Hint := GetRS('fmOrders', 'PosInfo');
    aInfo.Caption := GetRS('fmOrders', 'PosInfo');
    //colOPrice.Caption := GetRS('fmWMat', 'NPrice');
    colRsv.Caption := GetRS('fmWMat', 'Reserved');
    colKAName.Caption := GetRS('fmWaybill', 'Supplier');

    //colOrdFree.Caption := GetRS('fmWMat', 'Free');
    //colOrdRsv.Caption := GetRS('fmWMat', 'Reserved');

    lAmount.Caption := GetRS('fmWaybill', 'Amount') + ':';
    lNotes.Caption := GetRS('fmWaybill', 'Notes') + ':';
    aHide.Caption := GetRS('fmOrders', 'ShowOrders') + ' (' + ShortCutToText(aHide.ShortCut) + ')';

  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmp.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmp.SetParentName') else _udebug := nil;{$ENDIF}

  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmp.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmp.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  SetCaptions;
  lcbWH.RefreshItemsDS;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmp.WMSetText(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmp.WMSetText') else _udebug := nil;{$ENDIF}

  inherited;

  lTitle.Caption := panTitleBar.Caption;

  if not Assigned(edMat) then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  if (edMat.MatID = 0)
    then lMatEx.Caption := ''
    else begin
      lMatEx.Left := lTitle.Left + lTitle.Width;
      lMatEx.Width := panTitleButtons.Left - 2 - lMatEx.Left;
      lMatEx.Caption := ': ' + edMat.MatName;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmp.edMatChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmp.edMatChange') else _udebug := nil;{$ENDIF}

  stMeasureName.Caption := edMat.Measure;

  if edMat.MatID = 0
    then lMatEx.Caption := ''
    else begin
      lMatEx.Left := lTitle.Left + lTitle.Width;
      lMatEx.Width := panTitleButtons.Left - 2 - lMatEx.Left;
      lMatEx.Caption := ': ' + edMat.MatName;
    end;

  DataModified(Self);

  if btnHide.Checked
    then DSRefresh(cdsOrdered, 'posid', 0)
    else cdsOrdered.Close;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmp.edAmountPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmp.edAmountPropertiesChange') else _udebug := nil;{$ENDIF}

  try
    FAValue := StrToFloat(edAmount.EditingText);

  except
    FAValue := 0;
  end;

  DataModified(Self);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmp.lcbWHChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmp.lcbWHChange') else _udebug := nil;{$ENDIF}

  DataModified(Self);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfrmEditOrderTmp.GetMatID: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmp.GetMatID') else _udebug := nil;{$ENDIF}

  Result := edMat.MatID;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmp.SetMatID(const Value: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmp.SetMatID') else _udebug := nil;{$ENDIF}

  edMat.MatID := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmp.edMatRefButtonClick(Sender: TObject);
 var
   AID: Integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmp.edMatRefButtonClick') else _udebug := nil;{$ENDIF}

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
procedure TfrmEditOrderTmp.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmp.WMRefresh') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
    rtMat:
      begin
        edMat.MatID := M.WParam;
      end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmp.aHideExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmp.aHideExecute') else _udebug := nil;{$ENDIF}

  aHide.Checked := not aHide.Checked;
  btnHide.Checked := not aHide.Checked;
  RealignGrid;

  if btnHide.Checked and not cdsOrdered.Active and (edMat.MatID > 0)
    then DSRefresh(cdsOrdered, 'posid', 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmp.RealignGrid;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmp.RealignGrid') else _udebug := nil;{$ENDIF}

  if not btnHide.Checked
    then Self.ClientHeight := BaseHeight + btnHide.Top + btnHide.Height + 10
    else Self.ClientHeight := BaseHeight + grdOrdered.Top + grdOrdered.Height + 10;

  grdOrdered.Visible := btnHide.Checked;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmp.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmp.FormShow') else _udebug := nil;{$ENDIF}

  inherited;

  RealignGrid;

  if btnHide.Checked and (edMat.MatID > 0) and not cdsOrdered.Active
    then DSRefresh(cdsOrdered, 'posid', 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmp.cdsOrderedBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmp.cdsOrderedBeforeOpen') else _udebug := nil;{$ENDIF}

  with (DataSet as TssClientDataSet) do begin
    Params.ParamByName('matid').AsInteger := edMat.MatID;
    Params.ParamByName('getempty').AsInteger := 0;
    Params.ParamByName('ondate').AsDateTime := MaxDateTime;
    Params.ParamByName('wh').AsString := AllowedWH;
    Params.ParamByName('wid').AsInteger := 0;
    Params.ParamByName('kaid').AsInteger := 0;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmp.colDocNumGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmp.colDocNumGetText') else _udebug := nil;{$ENDIF}

  if VarToInt(ANode.Values[colWBillID.Index]) = -16 then AText := rs('fmOrders', 'Temp');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmp.colRsvGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmp.colRsvGetText') else _udebug := nil;{$ENDIF}

  if AText <> '' then
    try
      AText := FormatFloat(MatDisplayFormat, RoundToA(StrToFloat(AText), MatDisplayDigits));
    except
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmp.colTmpAmountGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmp.colTmpAmountGetText') else _udebug := nil;{$ENDIF}

  try
    AText := FormatFloat(MatDisplayFormat, RoundToA(StrToFloat(AText) - StrToFloat(ANode.Values[colRsv.Index]), MatDisplayDigits));
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmp.grdOrderedCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmp.grdOrderedCustomDrawCell') else _udebug := nil;{$ENDIF}

  if UseGridOddColor and not ASelected and Odd(ANode.AbsoluteIndex)
    then AColor := GridOddLinesColor;

  if (VarToFloat(ANode.Values[colRsv.Index]) > 0) and (AColumn = colRsv)
    then AFont.Color := clRed;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmp.aInfoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmp.aInfoExecute') else _udebug := nil;{$ENDIF}

  if cdsOrdered.FieldByName('wbillid').AsInteger <> -16 then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with TfrmTmpOrderInfo.Create(nil) do
  try
    ParentNameEx := 'fmOrders';
    txtPerson.Caption := cdsOrdered.FieldByName('certnum').AsString;
    txtTime.Caption := cdsOrdered.FieldByName('posdate').AsString;
    txtNotes.Caption := cdsOrdered.FieldByName('notes').AsString;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditOrderTmp.grdOrderedDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditOrderTmp.grdOrderedDblClick') else _udebug := nil;{$ENDIF}

  aInfo.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditOrderTmp', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
