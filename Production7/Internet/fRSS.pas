unit fRSS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseRef, DB, ssDataSource, DBClient, ssClientDataSet, TB2Item,
  Menus, ActnList, dxCntner6, dxTL6, dxDBCtrl6, dxDBGrid6, ssDBGrid, cxPC,
  cxControls, ssBevel, ExtCtrls, OleCtrls, SHDocVw;

type
  TfmRSS = class(TfmBaseRef)
    cxTabSheet1: TcxTabSheet;
  private
  public
  end;

var
  fmRSS: TfmRSS;

implementation

{$R *.dfm}

end.

