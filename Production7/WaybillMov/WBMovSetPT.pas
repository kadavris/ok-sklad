{$I ok_sklad.inc}
unit WBMovSetPT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ExtCtrls, StdCtrls, cxButtons,
  ssFormStorage, ActnList, ssBaseSkinForm, ssBevel, ImgList, ssSpeedButton,
  ssPanel, ssGradientPanel, ssBaseDlg, xButton,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  ssDBLookupCombo, DB, DBClient, ssClientDataSet, ClientData, ssBaseIntfDlg,ssBaseConst;

type
  TfrmWBMovSetPT = class(TfrmBaseIntfDlg)
    FormStorage: TssFormStorage;
    panMain: TPanel;
    btnLock: TssSpeedButton;
    btnHelp: TssSpeedButton;
    aLock: TAction;
    aHelp: TAction;
    btnSendErrMessage: TssSpeedButton;
    aSendErrMessage: TAction;
    bvlBox: TssBevel;
    cdsPriceTypes: TssClientDataSet;
    dsPriceTypes: TDataSource;
    lPriceType: TssBevel;
    lcbPriceTypes: TssDBLookupCombo;
    aAddPT: TAction;
    btnAddPT: TssSpeedButton;
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aLockExecute(Sender: TObject);
    procedure aHelpExecute(Sender: TObject);
    procedure aAddPTExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aSendErrMessageExecute(Sender: TObject);
  private
    FOnDate: TDateTime;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;
  protected
    FParentName: string;
    FID: integer;
    FSubID: integer;
    FGrpID: integer;
    procedure SetID(const Value: integer); virtual; abstract;
    procedure SetParentName(const Value: string); virtual;
    procedure SetOnDate(const Value: TDateTime); virtual;
    procedure SetSubID(const Value: integer); virtual;
    procedure DoCreate; override;
    procedure SetGrpID(const Value: integer); virtual;
  public
    MainHandle: HWND;
    SourceID: integer;
    IsPattern: Boolean;
    property GrpID: integer read FGrpID write SetGrpID;
    property ParentNameEx: string read FParentName write SetParentName;
    property ID: integer read FID write SetID;
    property SubID: integer read FSubID write SetSubID;
    property OnDate: TDateTime read FOnDate write SetOnDate;
    procedure SetCaptions; virtual;
    procedure DoHelp; virtual;
    procedure DoCustom(AParam: Integer); virtual;
  end;
//  TBaseDlgClass = class of TBaseDlg;

var
  frmWBMovSetPT: TfrmWBMovSetPT;

implementation

uses prConst, prFun, Menus,prTypes, ssFun, Udebug;

  var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

{ TBaseDlg }


procedure TfrmWBMovSetPT.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmWBMovSetPT.WMRefresh') else _udebug := nil;{$ENDIF}


  case TRefType(M.LParam) of
    rtPriceTypes: begin
      DSRefresh(cdsPriceTypes, 'ptypeid', M.WParam);
      lcbPriceTypes.KeyValue := M.WParam;
    end;//rtPriceTypes
  end;//case

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



procedure TfrmWBMovSetPT.SetOnDate(const Value: TDateTime);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmWBMovSetPT.SetOnDate') else _udebug := nil;{$ENDIF}


  FOnDate := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmWBMovSetPT.SetSubID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmWBMovSetPT.SetSubID') else _udebug := nil;{$ENDIF}


  FSubID := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmWBMovSetPT.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmWBMovSetPT.SetParentName') else _udebug := nil;{$ENDIF}


  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmWBMovSetPT.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmWBMovSetPT.SetCaptions') else _udebug := nil;{$ENDIF}


  inherited;

  btnLock.Hint := LangMan.GetRS('Common', 'Lock');
  btnHelp.Hint := LangMan.GetRS('Common', 'Help');

  aOK.Caption := LangMan.GetRS('Common', 'OK');
  aCancel.Caption := LangMan.GetRS('Common', 'Cancel');
  aApply.Caption := LangMan.GetRS('Common', 'Apply');
  aAddPT.Hint:=LangMan.GetRS('fmWaybill','RefPT');
  lPriceType.Caption:=LangMan.GetRS('fmMaterials','PriceType')+':';
  aAddPT.ShortCut:=TextToShortCut('Ctrl+Ins');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmWBMovSetPT.DoCreate;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmWBMovSetPT.DoCreate') else _udebug := nil;{$ENDIF}

  inherited;

  FormStorage.IniFileName:=PrRegKey;
  FormStorage.IniSection:=Self.Name;
  FormStorage.Active:=True;

  //SetStyle(Self, IStyle);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmWBMovSetPT.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmWBMovSetPT.ActionListUpdate') else _udebug := nil;{$ENDIF}
  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

procedure TfrmWBMovSetPT.SetGrpID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmWBMovSetPT.SetGrpID') else _udebug := nil;{$ENDIF}
    
  FGrpID := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmWBMovSetPT.aLockExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmWBMovSetPT.aLockExecute') else _udebug := nil;{$ENDIF}


  LockScreen;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmWBMovSetPT.aHelpExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmWBMovSetPT.aHelpExecute') else _udebug := nil;{$ENDIF}


  DoHelp;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmWBMovSetPT.DoHelp;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmWBMovSetPT.DoHelp') else _udebug := nil;{$ENDIF}


  Application.HelpJump(ParentNameEx);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmWBMovSetPT.DoCustom(AParam: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmWBMovSetPT.DoCustom') else _udebug := nil;{$ENDIF}


{}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmWBMovSetPT.aAddPTExecute(Sender: TObject);
var aid: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmWBMovSetPT.aAddPTExecute') else _udebug := nil;{$ENDIF}


  try  aid := lcbPriceTypes.KeyValue;  except  aid := 0;  end;
  lcbPriceTypes.SetFocus;
  ShowModalRef(Self, rtPriceTypes, vtPriceTypes, 'TfmPriceTypes', Self.OnDate, aid);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmWBMovSetPT.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmWBMovSetPT.FormCreate') else _udebug := nil;{$ENDIF}


  inherited;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmWBMovSetPT.aSendErrMessageExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmWBMovSetPT.aSendErrMessageExecute') else _udebug := nil;{$ENDIF}


  SendMsg;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('WBMovSetPT', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
