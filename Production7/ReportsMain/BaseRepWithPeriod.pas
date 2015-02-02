{$I ok_sklad.inc}
unit BaseRepWithPeriod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseRep, FR_DSet, FR_DBSet, DB, DBClient, ssClientDataSet,
  FR_Chart, FR_ChBox, FR_Class, ActnList, ssFormStorage, ImgList, xButton,
  ssPanel, ssGradientPanel, StdCtrls, ExtCtrls, ssBevel, ssSpeedButton,
  ssPeriod, okPeriod, dxTL6, dxDBCtrl6, dxCntner6, dxDBTL6, ssMemDS;

type
  TfrmBaseRepWithPeriod = class(TfrmBaseRep)
    prdMain: TokPeriod;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure frReport1GetValue(const ParName: String; var ParValue: Variant);

  protected
    procedure SetOnDate(const Value: TDateTime); override;
  end;

var
  frmBaseRepWithPeriod: TfrmBaseRepWithPeriod;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  prConst, ssBaseConst, udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}

//==============================================================================================
procedure TfrmBaseRepWithPeriod.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseRepWithPeriod.FormCreate') else _udebug := nil;{$ENDIF}

  inherited;

  prdMain.RegistryPath := MainRegKey + '\' + Self.Name;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseRepWithPeriod.FormDestroy(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseRepWithPeriod.FormDestroy') else _udebug := nil;{$ENDIF}

  inherited;

  prdMain.SaveToRegistry;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseRepWithPeriod.frReport1GetValue(const ParName: String; var ParValue: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseRepWithPeriod.frReport1GetValue') else _udebug := nil;{$ENDIF}

  inherited;

  try
    if 0 = AnsiCompareText(ParName, 'repid') then ParValue := RepID else
    if 0 = AnsiCompareText(ParName, 'fromdate') then begin
      if prdMain.FromDate >= 0
        then ParValue := DateToStr(prdMain.FromDate)
        else ParValue := '__________';
    end
    else if 0 = AnsiCompareText(ParName, 'todate') then begin
      if (prdMain.ToDate <> MaxDateTime) and (prdMain.ToDate <> 0)
        then ParValue := DateToStr(prdMain.ToDate)
        else ParValue := '__________';
    end;

  except
    ParValue := '!E!';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBaseRepWithPeriod.SetOnDate(const Value: TDateTime);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBaseRepWithPeriod.SetOnDate') else _udebug := nil;{$ENDIF}

  inherited;

  prdMain.BaseDate := Value;
  prdMain.LoadFromRegistry;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('BaseRepWithPeriod', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
