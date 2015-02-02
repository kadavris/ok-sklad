unit fWebCats;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseRef, DB, ssDataSource, DBClient, ssClientDataSet, TB2Item,
  Menus, ActnList, dxCntner6, dxTL6, dxDBCtrl6, dxDBGrid6, ssDBGrid, cxPC,
  cxControls, ssBevel, ExtCtrls;

type
  TfmWebCats = class(TfmBaseRef)
  private
  public
  end;

var
  fmWebCats: TfmWebCats;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  {$IFDEF UDEBUG}Udebug,{$ENDIF}
  prConst, ssClientDataSet, ssRegUtils, fMessageDlg;

{$IFDEF UDEBUG}
var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';
{$ENDIF}

{$R *.dfm}

end.
 
