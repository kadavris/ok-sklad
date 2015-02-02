{$I ok_sklad.inc}
unit SetDiscount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ssBaseDlg, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalc, ssCalcEdit, StdCtrls, ssBevel,
  ActnList, ssFormStorage, ImgList, xButton, ssPanel, ssGradientPanel,
  ssSpeedButton, ExtCtrls;

type
  TfrmSetDiscount = class(TBaseDlg)
    bvlMain: TssBevel;
    lDisc: TLabel;
    edDisc: TssCalcEdit;
    ssSpeedButton2: TssSpeedButton;
    ssSpeedButton3: TssSpeedButton;
    ssSpeedButton4: TssSpeedButton;
    procedure ssSpeedButton2Click(Sender: TObject);
    procedure ssSpeedButton3Click(Sender: TObject);
    procedure ssSpeedButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SetCaptions; override;
  end;

var
  frmSetDiscount: TfrmSetDiscount;

implementation

uses prConst, udebug;

  var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}

//==============================================================================================
procedure TfrmSetDiscount.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSetDiscount.SetCaptions') else _udebug := nil;{$ENDIF}


  inherited;

  with LangMan do begin
    Self.Caption := GetRS('fmWaybill', 'SetDiscount');

    lDisc.Caption := GetRS('fmWaybill', 'DiscForMats') + ':';
  end;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSetDiscount.ssSpeedButton2Click(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSetDiscount.ssSpeedButton2Click') else _udebug := nil;{$ENDIF}


  edDisc.Value := 5;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSetDiscount.ssSpeedButton3Click(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSetDiscount.ssSpeedButton3Click') else _udebug := nil;{$ENDIF}

  edDisc.Value := 7;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSetDiscount.ssSpeedButton4Click(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSetDiscount.ssSpeedButton4Click') else _udebug := nil;{$ENDIF}


  edDisc.Value := 10;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSetDiscount.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSetDiscount.FormCreate') else _udebug := nil;{$ENDIF}


  inherited;

  SetCaptions;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('SetDiscount', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
