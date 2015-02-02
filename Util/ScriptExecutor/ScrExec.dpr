program ScrExec;

uses
  Forms,
  Main in 'Main.pas' {Form1},
  xIBUtils in '..\Libs6\ssPack\xIBUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
