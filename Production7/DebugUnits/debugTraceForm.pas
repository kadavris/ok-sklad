{$I ok_sklad.inc}
unit debugTraceForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, uDebug, ComCtrls;

type
  TfmDebugTrace = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ButOK: TButton;
    ButCancel: TButton;
    debugOut: TRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure ButOKClick(Sender: TObject);
    procedure ButCancelClick(Sender: TObject);
    procedure SetMode(Val: Integer);

  private
    FMode: Integer;

  public
    property Mode: Integer read FMode write SetMode;
  end;

var
  fmDebugTrace: TfmDebugTrace;

implementation

{$R *.dfm}

//==============================================================================================
procedure TfmDebugTrace.SetMode(Val: Integer);
begin
  case Val of
    0: debugOut.Text := udebugDump(False);
    1: debugOut.Text := profTopByTime;
    2: debugOut.Text := profTopByCalls;
  end;
end;

//==============================================================================================
procedure TfmDebugTrace.FormCreate(Sender: TObject);
begin
end;

//==============================================================================================
procedure TfmDebugTrace.ButOKClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

//==============================================================================================
procedure TfmDebugTrace.ButCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.

