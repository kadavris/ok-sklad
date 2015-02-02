program imgListProject;

uses
  Forms,
  apImgList in '..\apImgList.pas',
  imglistform in 'imglistform.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

