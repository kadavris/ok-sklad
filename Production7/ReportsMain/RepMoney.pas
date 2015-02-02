{$I ok_sklad.inc}
unit RepMoney; // 

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseRepWithPeriod, FR_DSet, FR_DBSet, DB, DBClient,
  ssClientDataSet, FR_Chart, FR_ChBox, FR_Class, ActnList, ssFormStorage,
  ImgList, xButton, ssPanel, ssGradientPanel, ssPeriod, okPeriod, dxTL6,
  dxDBCtrl6, dxCntner6, dxDBTL6, StdCtrls, ExtCtrls, ssSpeedButton, ssBevel,
  cxContainer, cxEdit, cxCheckBox, ssCheckBox, cxControls, cxGroupBox,
  ssGroupBox, ssMemDS;

type
  TfrmRepMoney = class(TfrmBaseRepWithPeriod)
    cdsBalCash: TssClientDataSet;
    cdsBalCashless: TssClientDataSet;
    cdsPDCharge: TssClientDataSet;
    cdsPDIn: TssClientDataSet;
    cdsPDOut: TssClientDataSet;
    chbPDCharge: TssCheckBox;
    chbPDIn: TssCheckBox;
    chbPDOut: TssCheckBox;
    chbPrintBallance: TssCheckBox;
    fsrcBalCash: TfrDBDataSet;
    fsrcCashless: TfrDBDataSet;
    fsrcPDCharge: TfrDBDataSet;
    fsrcPDIn: TfrDBDataSet;
    fsrcPDOut: TfrDBDataSet;
    gbDocs: TssGroupBox;

    procedure cdsBalCashBeforeOpen(DataSet: TDataSet);
    procedure cdsBalCashlessBeforeOpen(DataSet: TDataSet);
    procedure cdsPDChargeBeforeOpen(DataSet: TDataSet);
    procedure cdsPDInBeforeOpen(DataSet: TDataSet);
    procedure cdsPDOutBeforeOpen(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure frReport1BeforePrint(Memo: TStringList; View: TfrView);
    procedure frReport1GetValue(const ParName: String; var ParValue: Variant);

  public
    procedure SetCaptions; override;
  end;

var
  frmRepMoney: TfrmRepMoney;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  ssDateUtils, ssFun, prConst, ssRegUtils, ssBaseConst, udebug, prFun;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

//==============================================================================================
procedure TfrmRepMoney.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRepMoney.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult = mrOk then begin
    CanClose := False;
    FromDate := prdMain.FromDate;
    ToDate := LastSecondInDay(prdMain.ToDate);

    cdsPDIn.Close;
    if chbPDIn.Checked then cdsPDIn.Open;

    cdsPDOut.Close;
    if chbPDOut.Checked then cdsPDOut.Open;

    cdsPDCharge.Close;
    if chbPDCharge.Checked then cdsPDCharge.Open;

    cdsBalCash.Close;
    if chbPrintBallance.Checked then cdsBalCash.Open;

    cdsBalCashless.Close;
    if chbPrintBallance.Checked then cdsBalCashless.Open;

    SmartShowRep(frReport1, 'RepMoney.frf');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRepMoney.frReport1GetValue(const ParName: String; var ParValue: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRepMoney.frReport1GetValue') else _udebug := nil;{$ENDIF}

  inherited;

  if 0 = AnsiCompareText(ParName, 'summin')
    then ParValue := RoundToA(cdsPDIn.FieldByName('total').AsFloat * cdsPDIn.FieldByName('onvalue').AsFloat, -2)
  else if 0 = AnsiCompareText(ParName, 'summout')
    then ParValue := RoundToA(cdsPDOut.FieldByName('total').AsFloat * cdsPDOut.FieldByName('onvalue').AsFloat, -2)
  else if 0 = AnsiCompareText(ParName, 'summcharge')
    then ParValue := RoundToA(cdsPDCharge.FieldByName('total').AsFloat * cdsPDCharge.FieldByName('onvalue').AsFloat, -2);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRepMoney.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRepMoney.SetCaptions') else _udebug := nil;{$ENDIF}

  inherited;

  with LangMan do begin
    chbPDIn.Properties.Caption := GetRS('fmAllReports', 'PayIn');
    chbPDOut.Properties.Caption := GetRS('fmAllReports', 'PayOut');
    chbPDCharge.Properties.Caption := GetRS('fmAllReports', 'PDCharge');

    chbPrintBallance.Properties.Caption := GetRS('fmAllReports', 'PrintBallance');
    gbDocs.Caption := ' ' + GetRS('fmAllReports', 'Docs') + ' ';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRepMoney.cdsPDInBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRepMoney.cdsPDInBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsPDIn.Params.ParamByName('fromdate').AsDateTime := FromDate;
  cdsPDIn.Params.ParamByName('todate').AsDateTime := ToDate;

  if chbPDIn.Checked
    then cdsPDIn.Params.ParamByName('doctype').AsInteger := 1
    else cdsPDIn.Params.ParamByName('doctype').AsInteger := -1000;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRepMoney.cdsPDOutBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRepMoney.cdsPDOutBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsPDOut.Params.ParamByName('fromdate').AsDateTime := FromDate;
  cdsPDOut.Params.ParamByName('todate').AsDateTime := ToDate;

  if chbPDOut.Checked
    then cdsPDOut.Params.ParamByName('doctype').AsInteger := -1
    else cdsPDOut.Params.ParamByName('doctype').AsInteger := -1000;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRepMoney.cdsPDChargeBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRepMoney.cdsPDChargeBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsPDCharge.Params.ParamByName('fromdate').AsDateTime := FromDate;

  if chbPDCharge.Checked
    then cdsPDCharge.Params.ParamByName('todate').AsDateTime := ToDate
    else cdsPDCharge.Params.ParamByName('todate').AsDateTime := MinDateTime;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRepMoney.FormCreate(Sender: TObject);
  var
    intTmp: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRepMoney.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'PDIn', intTmp) then chbPDIn.Checked := intTmp = 1;
  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'PDOut', intTmp) then chbPDOut.Checked := intTmp = 1;
  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'PDCharge', intTmp) then chbPDCharge.Checked := intTmp = 1;
  if ReadFromRegInt(MainRegKey + '\' + Self.Name, 'PrintBallance', intTmp) then chbPrintBallance.Checked := intTmp = 1;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRepMoney.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRepMoney.FormDestroy') else _udebug := nil;{$ENDIF}

  WriteToRegInt(MainRegKey + '\' + Self.Name, 'PDIn', Integer(chbPDIn.Checked));
  WriteToRegInt(MainRegKey + '\' + Self.Name, 'PDOut', Integer(chbPDOut.Checked));
  WriteToRegInt(MainRegKey + '\' + Self.Name, 'PDCharge', Integer(chbPDCharge.Checked));
  WriteToRegInt(MainRegKey + '\' + Self.Name, 'PrintBallance', Integer(chbPrintBallance.Checked));

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRepMoney.cdsBalCashBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRepMoney.cdsBalCashBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsBalCash.Params.ParamByName('ondate').AsDateTime := ToDate;

  if chbPrintBallance.Checked
    then cdsBalCash.Params.ParamByName('ptypeid').AsInteger := 1
    else cdsBalCash.Params.ParamByName('ptypeid').AsInteger := -1000;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRepMoney.cdsBalCashlessBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRepMoney.cdsBalCashlessBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsBalCashless.Params.ParamByName('ondate').AsDateTime := ToDate;

  if chbPrintBallance.Checked
    then cdsBalCashless.Params.ParamByName('ptypeid').AsInteger := 2
    else cdsBalCashless.Params.ParamByName('ptypeid').AsInteger := -1000;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmRepMoney.frReport1BeforePrint(Memo: TStringList; View: TfrView);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmRepMoney.frReport1BeforePrint') else _udebug := nil;{$ENDIF}

  inherited;

  if (View.Name = 'SubReport1') and not chbPDIn.Checked then View.dy := 0;
  if (View.Name = 'SubReport2') and not chbPDOut.Checked then View.dy := 0;
  if (View.Name = 'SubReport3') and not chbPDCharge.Checked then View.dy := 0;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('RepMoney', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
