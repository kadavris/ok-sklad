unit ssBarDsgn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ImgList, ssSpeedButton, ComCtrls, DesignEditors;

type
  TfrmBarDsgn = class(TForm)
    btnNew: TssSpeedButton;
    ActionList: TActionList;
    ImageList: TImageList;
    aDel: TAction;
    aNew: TAction;
    btnDel: TssSpeedButton;
    btnClose: TssSpeedButton;
    aClose: TAction;
    lvMain: TListView;
    procedure aCloseExecute(Sender: TObject);
    procedure aNewExecute(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aDelExecute(Sender: TObject);
  end;

  TssBarDesigner = class(TComponentEditor)
  public
    function GetVerb(Index: Integer): string; override;
    function GetVerbCount: integer; override;
  end;
var
  frmBarDsgn: TfrmBarDsgn;

implementation

{$R *.dfm}

procedure TfrmBarDsgn.aCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmBarDsgn.aNewExecute(Sender: TObject);
  var
    FItem: TListItem;
begin
  FItem:=lvMain.Items.Add;
  FItem.Caption:='New Button';
  lvMain.Selected:=FItem;
  FItem.EditCaption;
end;

procedure TfrmBarDsgn.btnDelClick(Sender: TObject);
begin
end;

procedure TfrmBarDsgn.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
begin
  aDel.Enabled:=lvMain.Items.Count>0;
end;

procedure TfrmBarDsgn.aDelExecute(Sender: TObject);
begin
  if lvMain.Selected<>nil then begin
    lvMain.Items.Delete(lvMain.Selected.Index);
    if lvMain.Items.Count>0 then lvMain.Selected:=lvMain.Items[0];
  end;
end;

function TssBarDesigner.GetVerb(Index: Integer): string;
begin
  case Index of
    0: Result := 'Test String';
    else Result := '';
  end;
end;

function TssBarDesigner.GetVerbCount: integer;
begin
     Result:=1;
end;

end.
