//UDEBUG code already inserted. Please do not remove this line.
{$I ok_server.inc}
unit servlog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmLog = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnOK: TButton;
    gbLog: TGroupBox;
    memoDebug: TMemo;
    MemoLog: TMemo;
    Splitter1: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure SetCaptions;
    procedure FormResize(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  end;

var
  frmLog: TfrmLog;

//==================================================================================
//==================================================================================
//==================================================================================
//==================================================================================
implementation

uses
  {$IFDEF UDEBUG}udebug,{$ENDIF}
  ServerData, ssSrvConst;

{$IFDEF UDEBUG}
var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';
{$ENDIF}

{$R *.dfm}

//==================================================================================
procedure TfrmLog.FormCreate(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmLog.FormCreate') else _udebug := nil;{$ENDIF}

  memoLog.Lines.Text := GetLogStack(False);

  {$IFDEF UDEBUG}
  memoDebug.Lines.text := udebugDump;
  {$ELSE}
  memoDebug.Visible := False;
  Splitter1.Visible := False;
  memoLog.Align := alClient;
  {$ENDIF}

  SetCaptions;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==================================================================================
procedure TfrmLog.SetCaptions;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmLog.SetCaptions') else _udebug := nil;{$ENDIF}

  with dmData.Lng do begin
    Self.Caption := OK_AppName + ': ' + GetRS(Self.Name, 'Title');
    gbLog.Caption := GetRS(Self.Name, 'gbLog');
    btnOK.Caption := GetRS(Self.Name, 'btnOK');
  end;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==================================================================================
procedure TfrmLog.FormResize(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmLog.FormResize') else _udebug := nil;{$ENDIF}

  Realign;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==================================================================================
procedure TfrmLog.btnOKClick(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmLog.btnOKClick') else _udebug := nil;{$ENDIF}

  ModalResult := mrOk;

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('servlog', @Debugging, DEBUG_group_ID);
  {$ENDIF}

finalization
  {$IFDEF UDEBUG}
  //debugUnregisterUnit(DEBUG_unit_ID);
  {$ENDIF}

end.
