program Esp;

uses
  Forms,
  Main in 'Main.pas' {Form1},
  EspNumLtr in 'EspNumLtr.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
