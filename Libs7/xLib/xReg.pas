unit xReg;

interface

procedure Register;

implementation

{$R xLib.dcr}

uses
  {$IFNDEF NODESIGN}
  DesignIntf,
  {$ENDIF}
  //xLngManDsgn, 
  xLog, Classes, xBevel, xSpeedButton, xButton, xLngManager, xClasses,
  xStyleContainer, xCtrls, xBarCode, flImageList , flLabel, flListView;

procedure Register;
begin
  RegisterComponents('xLib', [TxLngManager, TxLog, TxQueue, TxStyleContainer, TxBarCode, TflImageList]);
  RegisterComponents('xControls', [TxBevel, TxSpeedButton, TxButton, TxLabelEx, TflSpeedButton, TflLabel, TflListView]);
  {$IFNDEF NODESIGN}
  RegisterComponentEditor(TxLngManager, TxLngManEditor);
  {$ENDIF}
end;


end.
