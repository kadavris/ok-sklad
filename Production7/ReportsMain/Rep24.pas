{$I ok_sklad.inc}
unit Rep24; // раткий отчЄт по договору

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseRep, FR_DSet, FR_DBSet, DB, DBClient, ssClientDataSet,
  FR_Chart, FR_ChBox, FR_Class, ActnList, ssFormStorage, ImgList, xButton,
  ssPanel, ssGradientPanel, dxTL6, dxDBCtrl6, dxCntner6, dxDBTL6, StdCtrls,
  ExtCtrls, ssSpeedButton, ssBevel, okSearchEdit, ssBaseConst, Grids,
  DBGrids, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxImageComboBox, ClientData, ssMemDS;

type
  TfrmRep24 = class(TfrmBaseRep)
    cbChecked: TcxImageComboBox;
    cbDocType: TcxImageComboBox;
    edContr: TokContractSearchEdit;
    lStatus: TLabel;
    lType: TLabel;

    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aPrintExecute(Sender: TObject);
    procedure cbDocTypePropertiesChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure frReport1GetValue(const ParName: String; var ParValue: Variant);

  private
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
    procedure NoAccess(Sender: TObject);

  public
    procedure SetCaptions; override;
  end;

var
  frmRep24: TfrmRep24;

implementation

uses
  prTypes, ssBaseIntfDlg, prConst, okClasses, DateUtils, prFun, xLngManager, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfrmRep24.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep24.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    cbDocType.Properties.Items[0].Description := GetRS('fmWaybill', 'DocContrIn');
    cbDocType.Properties.Items[1].Description := GetRS('fmWaybill', 'DocContrOut');
    cbChecked.Properties.Items[0].Description := GetRS('Common', 'All');
    cbChecked.Properties.Items[1].Description := GetRS('fmWaybill', 'Checked');
    cbChecked.Properties.Items[2].Description := GetRS('fmWaybill', 'NoChecked');
    lStatus.Caption := GetRS('fmAllReports','Status') + ':';
    lTextNotes.Caption := GetRS('fmAllReports','Rep24Info');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep24.WMRefresh(var M: TMessage);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep24.WMRefresh') else _udebug := nil;{$ENDIF}

  case TRefType(M.LParam) of
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmRep24.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep24.FormCloseQuery') else _udebug := nil;{$ENDIF}

  inherited;

  if ModalResult = mrOk then begin
    CanClose := False;
    Application.ProcessMessages;

    with cdsDetail do begin//—читываем остатки на дату
      Close;
      ProviderName := 'pRep_24';
      Params.Clear;
      Macros.Clear;
      FetchParams;
      Params.ParamByName('docid').AsInteger := edContr.Obj.DocID;
      FetchMacros;
      case cbChecked.EditValue of
        0:Macros.ParamByName('m').AsString := '';
        1:Macros.ParamByName('m').AsString := 'where dr.checked=1';
        2:Macros.ParamByName('m').AsString := 'where dr.checked=0';
      end;//case
      Open;
      CopyDataSet(cdsMaster, cdsDetail);
      Close;
      SmartShowRep(frReport1, 'rep24.frf');
    end;//with
  end
  else CanClose := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep24.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep24.ActionListUpdate') else _udebug := nil;{$ENDIF}

  inherited;
  aOK.Enabled := (edContr.Obj.DocID>0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep24.cbDocTypePropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep24.cbDocTypePropertiesChange') else _udebug := nil;{$ENDIF}

  inherited;

  if cbDocType.Tag = 0 then begin
    if edContr.Obj.DocID > 0 then edContr.DocID := 0;

    case cbDocType.EditValue of
      -8:begin
        edContr.ContractType := ctOut;
        edContr.ImageIndexRef := 45;
      end;//-8

      8:begin
        edContr.ContractType := ctIn;
        edContr.ImageIndexRef := 46;
      end;
    end;//case
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep24.frReport1GetValue(const ParName: String; var ParValue: Variant);
  var
    pt:integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep24.frReport1GetValue') else _udebug := nil;{$ENDIF}

  inherited;

  if 0 = AnsiCompareText(ParName, 'CONTRNUM') then ParValue := edContr.Obj.Num else
  if 0 = AnsiCompareText(ParName, 'CONTRDATE') then ParValue := DateOf(edContr.Obj.DocDate) else
  if 0 = AnsiCompareText(ParName, 'CONTRTYPE') then ParValue := cbDocType.EditValue else
  if 0 = AnsiCompareText(ParName, 'CONTRTODATE') then ParValue := DateOf(edContr.Obj.ToDate) else
  if 0 = AnsiCompareText(ParName, 'CONTRCURRNAME') then ParValue := edContr.Obj.CurrName else
  if 0 = AnsiCompareText(ParName, 'CONTRKAGENT') then ParValue := KAName(dmData.SConnection,edContr.Obj.KAID,pt,1) else
  if 0 = AnsiCompareText(ParName, 'CONTRAMOUNT') then ParValue := Abs(edContr.Obj.Amount) else
  if 0 = AnsiCompareText(ParName, 'CONTRSUMM') then ParValue := Abs(edContr.Obj.Summ) else
  if 0 = AnsiCompareText(ParName, 'SHIPPEDAMOUNT') then ParValue := Abs(edContr.Obj.ShippedAmount) else
  if 0 = AnsiCompareText(ParName, 'SHIPPEDSUMM') then ParValue := Abs(edContr.Obj.ShippedSumm) else
  if 0 = AnsiCompareText(ParName, 'PAIDSUMM') then ParValue := Abs(edContr.Obj.PaidSumm);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep24.aPrintExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep24.aPrintExecute') else _udebug := nil;{$ENDIF}

  if aOK.Enabled then inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep24.NoAccess(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep24.NoAccess') else _udebug := nil;{$ENDIF}

  showNotAvailable;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRep24.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRep24.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  (*
  {$IFDEF LITE}
  edContr.OnRefButtonClick := NoAccess;
  {$ENDIF}
  *)

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('Rep24', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
