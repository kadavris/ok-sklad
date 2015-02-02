{$I ok_sklad.inc}
unit CommonRef;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, dxCntner, ActnList,
  DB, DBClient, prConst, ssMemDS, ssBaseConst, ssBaseTypes,
  BaseFrame, ssFormStorage, ExtCtrls, ssImagePanel, cxControls, cxGroupBox,
  cxContainer, cxEdit, cxTextEdit, ssSpeedButton;

type
  TfrmCommonRef = class(TMDIChildRef)
    ActionList1: TActionList;
    aNew: TAction;
    aProps: TAction;
    aDel: TAction;
    aRefresh: TAction;
    FormStorage: TssFormStorage;
    aDyn: TAction;
    panBar: TPanel;
    panActionButtons: TPanel;
    btnNew: TssSpeedButton;
    btnDelEx: TssSpeedButton;
    btnRefreshEx: TssSpeedButton;
    btnProps: TssSpeedButton;
    sepDyn: TBevel;
    ssSpeedButton3: TssSpeedButton;
    sepPrint: TBevel;
    btnPrint: TssSpeedButton;
    btnExcel: TssSpeedButton;
    panDirUp: TPanel;
    panBarFind: TPanel;
    edFind: TcxTextEdit;
    panBarFindButtons: TPanel;
    btnFind: TssSpeedButton;
    btnFindParams: TssSpeedButton;
    panBarHelp: TPanel;
    ssSpeedButton4: TssSpeedButton;
    aHelp: TAction;
    aFind: TAction;
    aFindProps: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure aDelExecute(Sender: TObject);
    procedure aNewExecute(Sender: TObject);
    procedure aPropsExecute(Sender: TObject);
    procedure aRefreshExecute(Sender: TObject);
    procedure aDynExecute(Sender: TObject);
  private
    bState: TButtonsState;
    procedure WMChangeBState(var M: TMessage); message WM_CHANGEBSTATE;
    procedure WMSetParentCaption(var M: TMessage); message WM_SETPARENTCAPTION;
    procedure WMResetStyle(var M: TMessage); message WM_RESETSTYLE;
    procedure UpdActions;
    procedure SetFrame(const Value: TClass);
  public
    fFrame: TssBaseFrame;
    property fFrameClass: TClass write SetFrame;
    procedure SetCaptions; override;
  end;

var
  frmCommonRef: TfrmCommonRef;

implementation


uses ClientData, prFun, Udebug;

var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}

procedure TfrmCommonRef.FormClose(Sender: TObject; var Action: TCloseAction);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCommonRef.FormClose') else _udebug := nil;{$ENDIF}


  //BarManager.SaveToRegistry(MainRegKey+'\'+Self.Name);
  if Assigned(fFrame) then begin
    fFrame.DoClose;                   
    fFrame.Free;
  end;
//  Action:=caFree;
//  FormStorage.Active:=False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmCommonRef.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCommonRef.FormCreate') else _udebug := nil;{$ENDIF}


 SetCaptions;
 SetStyle(Self, IStyle);

// if ExistRegPath(Self.Name) then begin
//  BarManager.LoadFromRegistry(MainRegKey+'\'+Self.Name);
// end;

// FormStorage.IniFileName:=MainRegKey;
// FormStorage.IniSection:=FSection;
// FormStorage.Active:=True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmCommonRef.aDelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCommonRef.aDelExecute') else _udebug := nil;{$ENDIF}


     fFrame.DoDelete;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmCommonRef.aNewExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCommonRef.aNewExecute') else _udebug := nil;{$ENDIF}


     fFrame.DoInsert;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmCommonRef.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCommonRef.SetCaptions') else _udebug := nil;{$ENDIF}


{     actAdd.Caption:=rs_Add;
     ActProperties.Caption:=rs_Properties;
     ActDel.Caption:=rs_Del;
     ActRefresh.Caption:=rs_Refresh;
     aDyn.Caption:=rs_Dynamic;

     actAdd.Hint:=rs_Add;
     ActProperties.Hint:=rs_Properties;
     actDel.Hint:=rs_Del;
     actRefresh.Hint:=rs_Refresh;}

     if Assigned(fFrame) then fFrame.SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmCommonRef.aPropsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCommonRef.aPropsExecute') else _udebug := nil;{$ENDIF}


     fFrame.DoProperties;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmCommonRef.aRefreshExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCommonRef.aRefreshExecute') else _udebug := nil;{$ENDIF}


     fFrame.DoRefresh(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmCommonRef.WMChangeBState(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCommonRef.WMChangeBState') else _udebug := nil;{$ENDIF}


     bState:=TButtonsState(word(pointer(M.WParam)^));
     UpdActions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmCommonRef.UpdActions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCommonRef.UpdActions') else _udebug := nil;{$ENDIF}


{     actAdd.Enabled:=bsInsert in bState;
     ActProperties.Enabled:=bsProperties in bState;
     ActDel.Enabled:=bsDelete in bState;
     ActRefresh.Enabled:=bsRefresh in bState;
     aDyn.Enabled:=bsDynamic in bState;
     aDyn.Checked:=bsDynChecked in bState;
     btnDyn.Down:=aDyn.Checked;}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmCommonRef.SetFrame(const Value: TClass);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCommonRef.SetFrame') else _udebug := nil;{$ENDIF}


     fFrame:=TssBaseFrameClass(Value).Create(nil);
     fFrame.ParentHandle:=Self.Handle;
     fFrame.OnDate:=Self.OnDate;
     fFrame.DoOpen(0);
     fFrame.Parent:=Self;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmCommonRef.WMSetParentCaption(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCommonRef.WMSetParentCaption') else _udebug := nil;{$ENDIF}


     Self.Caption:=String(pointer(M.WParam)^);
//     panTitle.Caption:=Self.Caption;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmCommonRef.WMResetStyle(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCommonRef.WMResetStyle') else _udebug := nil;{$ENDIF}


     SetStyle(Self, IStyle);
     if fFrame<>nil then SetStyle(fFrame, IStyle);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

procedure TfrmCommonRef.aDynExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmCommonRef.aDynExecute') else _udebug := nil;{$ENDIF}


     fFrame.DoDynamic;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('CommonRef', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
