unit ClientData;

interface

uses
  SysUtils, Classes, DB, DBClient, MConnect, SConnect,
  ImgList, Controls, cxContainer, cxEdit, cxStyles, ssSocketConnection;

type
  TdmData = class(TDataModule)
    SConnection: TssSocketConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmData: TdmData;

implementation

{$R *.dfm}

end.
