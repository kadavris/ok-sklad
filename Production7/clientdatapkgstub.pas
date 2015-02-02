// AP: Stub file for packages build
interface

uses
  SysUtils, Classes, DB, DBClient, MConnect, SConnect, Forms,
  ImgList, Controls, cxContainer, cxEdit, cxStyles,Windows,Dialogs,
  xClasses,

  ssClientDataSet,
  ssSocketConnection;

type
  TdmData = class(TDataModule)
    cdsEnt: TssClientDataSet;
    i12: TImageList;
    i14: TImageList;
    i15: TImageList;
    Images14x14: TImageList;
    Images18x18: TImageList;
    Images18x18dis: TImageList;
    Images24x24: TImageList;
    Images: TImageList;
    ImagesTree: TImageList;
    LargeImages: TImageList;
    scMain: TcxEditStyleController;
    SConnection: TssSocketConnection;
    srMain: TcxStyleRepository;
    stSelection: TcxStyle;

    procedure DataModuleCreate(Sender: TObject);
    procedure SConnectionAfterConnect(Sender: TObject);
    procedure SConnectionAfterDisconnect(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure SConnectionAfterDBConnect(Sender: TObject);
    procedure SConnectionLossConnect(Sender: TObject);
    procedure CurrentEntChange(Sender: TObject);

  private
    FMHandle: HWND;
    qEvents: TxQueue;
    InProcess: Boolean;
    procedure SetMHandle(const Value: HWND);
    procedure DoAction(AAction: TxQueueAction);

  public
    property MHandle: HWND read FMHandle write SetMHandle;
    procedure q_Add(AType: integer; AParam, AAddr: Variant);
  end;

var
  dmData: TdmData;

implementation

{$R *.dfm}

//==============================================================================================
procedure TdmData.DataModuleCreate(Sender: TObject);
begin
end;

//==============================================================================================
procedure TdmData.DoAction(AAction: TxQueueAction);
begin
end;

//==============================================================================================
procedure TdmData.q_Add(AType: integer; AParam, AAddr: Variant);
begin
end;

//==============================================================================================
procedure TdmData.SConnectionAfterConnect(Sender: TObject);
begin
end;

//==============================================================================================
procedure TdmData.SConnectionAfterDisconnect(Sender: TObject);
begin
end;

//==============================================================================================
procedure TdmData.SetMHandle(const Value: HWND);
begin
end;

//==============================================================================================
procedure TdmData.DataModuleDestroy(Sender: TObject);
begin
end;

//==============================================================================================
procedure TdmData.SConnectionAfterDBConnect(Sender: TObject);
begin
end;

//==============================================================================================
procedure TdmData.SConnectionLossConnect(Sender: TObject);
begin
end;

//==============================================================================================
procedure TdmData.CurrentEntChange(Sender: TObject);
begin
end;

initialization

finalization
