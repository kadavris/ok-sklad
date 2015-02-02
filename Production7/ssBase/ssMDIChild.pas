{$I ok_sklad.inc}
unit ssMDIChild;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ssBaseSkinForm, ImgList, ssSpeedButton, ssPanel, ExtCtrls,
  ssGradientPanel;

type
  TMDIChild = class(TfrmBaseSkin)
    private
      FOnDate: TDateTime;

    protected
      procedure SetOnDate(const Value: TDateTime); virtual;

    public
      procedure SetCaptions; virtual; abstract;
      property OnDate: TDateTime read FOnDate write SetOnDate;
  end;

var
  MDIChild: TMDIChild;

//==============================================================================
implementation

{$R *.dfm}

procedure TMDIChild.SetOnDate(const Value: TDateTime);
begin
  FOnDate := Value;
end;

end.
