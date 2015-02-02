unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, xLngManager, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Lng: TxLngManager;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  Lng.CfgFile := ExtractFilePath(ParamStr(0)) + 'lng.ini';
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Lng.Open;
  Lng.ShowEditor;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Lng.Close;
end;

end.
