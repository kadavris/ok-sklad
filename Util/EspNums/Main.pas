unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
{$R *.dfm}
uses EspNumLtr, ConvUtils;

procedure TForm1.Button1Click(Sender: TObject);
begin
  try

   Memo1.Text:=numeral(StrToInt64(Edit1.Text));
 except
   raise;
 end;
end;

end.
