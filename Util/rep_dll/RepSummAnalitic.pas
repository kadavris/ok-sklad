unit RepSummAnalitic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ssBaseIntfDlg2, ActnList, ImgList, xButton, ssSpeedButton,
  ssPanel, ExtCtrls, ssGradientPanel, FR_Class, ssBevel;

type
  TfrmRepSummaryAnalitic = class(TfrmBaseIntfDlg2)
    frReport1: TfrReport;
    ssBevel1: TssBevel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRepSummaryAnalitic: TfrmRepSummaryAnalitic;

implementation

{$R *.dfm}

end.
