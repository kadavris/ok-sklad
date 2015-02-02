unit ssWaitForExcel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls;

type
  TfrmWaitForExcel = class(TForm)
    Animate: TAnimate;
    Bevel1: TBevel;
    lInfo: TLabel;
    Bevel2: TBevel;
    lCurInfo: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    function GetInfo : string;
    function GetAddInfo : string;
    procedure SetInfo(Value : string);
    procedure SetAddInfo(Value : string);

  public
    { Public declarations }
    property Info : string read GetInfo write SetInfo;
    property AddInfo : string read GetAddInfo write SetAddInfo;
  end;

var
  frmWaitForExcel: TfrmWaitForExcel;

implementation

{$R *.DFM}

resourcestring
  rs_Wait = 'Waiting...';

function TfrmWaitForExcel.GetInfo : string;
begin
  Result := '';
end;

function TfrmWaitForExcel.GetAddInfo : string;
begin
  Result := '';
end;

procedure TfrmWaitForExcel.SetInfo(Value : string);
begin
  lInfo.Caption:=Value;
  Application.ProcessMessages;
end;

procedure TfrmWaitForExcel.SetAddInfo(Value : string);
begin
  lCurInfo.Caption:=Value;
  Application.ProcessMessages;
end;

procedure TfrmWaitForExcel.FormShow(Sender: TObject);
begin
  Animate.Active:=true;
  Application.ProcessMessages;
end;

procedure TfrmWaitForExcel.FormCreate(Sender: TObject);
begin
  Self.Caption := rs_Wait;
end;

end.
