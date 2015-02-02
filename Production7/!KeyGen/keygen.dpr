program keygen;

uses
  Forms,
  //prConst in '..\prConst.pas',
  Protection in '..\Protection\Protection.pas',
  //ssRegUtils in '..\..\Libs7\ssPack\ssRegUtils.pas',
  synacode in '..\EMailSend\synacode.pas',
  //UDebug in '..\..\Libs7\Debug\UDebug.pas',
  PJSysInfo in '..\..\Libs7\Hardware\ddsysinfo\PJSysInfo.pas',
  idesn in '..\..\Libs7\Hardware\idesn\idesn.pas',
  kgu1 in 'kgu1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

