program ssAdmin;

uses
  Forms,
  ProvMain in 'ProvMain.pas' {frmProvMain},
  ssServer_TLB in 'ssServer_TLB.pas',
  ssaConst in 'ssaConst.pas',
  xFun in '..\..\lib\xLib\xFun.pas',
  xNetUtils in '..\..\lib\xLib\xNetUtils.pas',
  xStrUtils in '..\..\lib\xLib\xStrUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'dbAdmin';
  Application.CreateForm(TfrmProvMain, frmProvMain);
  Application.Run;
end.
