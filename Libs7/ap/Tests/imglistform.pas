unit imglistform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, apImgList, ExtCtrls;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  il: TapImgList;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  il:=TapImgList.Create(Form1);
  il.Width := 300;
  il.Height := 350;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  il.Free;
end;

end.

