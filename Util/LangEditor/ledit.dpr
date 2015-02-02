program ledit;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows,
  xLngManager;

begin
  with TxLngManager.Create(nil) do
  try
  finally
    Free;
  end;
end.
 