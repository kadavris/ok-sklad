{$I ok_sklad.inc}
unit SelectNewMat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ssBaseDlg, cxLookAndFeelPainters, ActnList, ssFormStorage,
  ImgList, StdCtrls, cxButtons, ssSpeedButton, ssPanel, ssGradientPanel,
  ExtCtrls, ComCtrls, xButton;

type
  TfrmSelectNewMat = class(TBaseDlg)
    lvMain: TListView;
    procedure FormCreate(Sender: TObject);
    procedure lvMainDblClick(Sender: TObject);
    procedure lvMainKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  public
    procedure SetCaptions; override;
  end;

var
  frmSelectNewMat: TfrmSelectNewMat;

implementation

uses
  ClientData, {MeterialsRes,} ssBaseConst, prFun, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

{ TfrmSelectNewMat }

//==============================================================================================
procedure TfrmSelectNewMat.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSelectNewMat.SetCaptions') else _udebug := nil;{$ENDIF}


  inherited;
  Caption := rs(Self.Name, 'title');
  lvMain.Items[0].Caption := rs(Self.Name, 'Mat');
  lvMain.Items[1].Caption := rs(Self.Name, 'Group');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSelectNewMat.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSelectNewMat.FormCreate') else _udebug := nil;{$ENDIF}


  SetCaptions;
  lvMain.Selected := lvMain.Items[0];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSelectNewMat.lvMainDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSelectNewMat.lvMainDblClick') else _udebug := nil;{$ENDIF}


  if lvMain.Selected <> nil then ModalResult := mrOk;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSelectNewMat.lvMainKeyPress(Sender: TObject; var Key: Char);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSelectNewMat.lvMainKeyPress') else _udebug := nil;{$ENDIF}


  if Key = #13 then begin
   Key := #0;
   lvMainDblClick(lvMain);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmSelectNewMat.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmSelectNewMat.FormShow') else _udebug := nil;{$ENDIF}


  inherited;
  lvMain.Items[0].Focused := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('SelectNewMat', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
