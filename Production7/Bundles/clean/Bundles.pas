unit Bundles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseWBDoc, dxExEdtr, DB, ssMemDS, ssDataSource, DBClient,
  ssClientDataSet, TB2Item, Menus, ActnList, dxInspRw, dxInspct, dxCntner,
  ssInspector, ssPeriod, okPeriod, cxDropDownEdit, ssDBLookupCombo,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxImageComboBox,
  ssSpeedButton, StdCtrls, dxDBGrid, dxTL, dxDBCtrl, dxDBTLCl, dxGrClms,
  dxCntner6, ssDBGrid, cxPC, cxControls, ssBevel, ExtCtrls;

type
  TfmBundles = class(TfmBaseWBDoc)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmBundles: TfmBundles;

implementation

{$R *.dfm}

end.

