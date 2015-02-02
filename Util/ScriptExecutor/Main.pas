unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, JvToolEdit, xIBUtils, DB;

type
  TForm1 = class(TForm)
    edBD: TJvFilenameEdit;
    Label1: TLabel;
    Label2: TLabel;
    edScript: TJvFilenameEdit;
    btnExec: TButton;
    procedure btnExecClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnExecClick(Sender: TObject);
var
  FErr: string;
begin
  FErr := '';
  with TStringList.Create do
  try
    LoadFromFile(edScript.Text);
    ExecScriptEx(edBD.Text, Text, nil, FErr, 3);
    if FErr <> ''
      then raise Exception.Create('Error: ' + FErr)
      else ShowMessage('Скрипт успешно выполнен!');
  finally
    Free;
  end;  
end;

end.
