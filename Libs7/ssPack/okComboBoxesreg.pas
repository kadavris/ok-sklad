unit okComboBoxesreg;

interface

procedure Register;

implementation

uses
  Classes, DesignEditors, okFontComboBox;

procedure Register;
begin
  RegisterComponents('OK-Controls', [TokFontComboBox, TokComboBox]);

end;

end.

