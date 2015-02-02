unit xLibReg;

interface

procedure Register;

implementation

{$R xLib.dcr}

uses
  Classes, xLog;

procedure Register;
begin
  RegisterComponents('xLib', [TxLog]);
end;

end.
