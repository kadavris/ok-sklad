program ReportEditor;

uses
  MainForm in 'MainForm.pas',
  xLngManager in '..\..\libs7\xlib\xlngmanager.pas',
  Forms,
  ssBaseConst in '..\ssBase\ssBaseConst.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Report Editor';
  Application.CreateForm(TfrmMainForm, frmMainForm);
  Application.Run;
end.
