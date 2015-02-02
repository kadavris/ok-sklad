program oksvc;

uses
  SvcMgr,
  Main in 'Main.pas' {svcBackup: TService},
  //xClasses in '..\..\xLib\xClasses.pas',
  //ssRegUtils in '..\..\Libs6\ssPack\ssRegUtils.pas',
  UpdStat in 'UpdStat.pas' {svcUpdateStat: TService},
  ok_svc_const in 'ok_svc_const.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TsvcBackup, svcBackup);
  Application.CreateForm(TsvcUpdateStat, svcUpdateStat);
  Application.Run;
end.
