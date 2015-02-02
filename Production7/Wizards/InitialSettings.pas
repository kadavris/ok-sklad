unit InitialSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ssBaseSkinForm, ImgList, ssSpeedButton, ssPanel, ExtCtrls,
  ssGradientPanel, xButton, cxSplitter, cxControls, cxContainer,
  cxTreeView, ComCtrls, cxLabel, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxImageComboBox, StdCtrls, cxCheckBox;

type
  TfrmInitialSettings = class(TfrmBaseSkin)
    panMain: TPanel;
    PanBottom: TPanel;
    pcMain: TPageControl;
    tvMain: TcxTreeView;
    splMain: TcxSplitter;
    btnOK: TxButton;
    btnCancel: TxButton;
    tsCID: TTabSheet;
    cbLang: TcxComboBox;
    cbRepLang: TcxComboBox;
    lblLang: TcxLabel;
    lblRepLang: TcxLabel;
    gbCID: TGroupBox;
    lblCountryID: TcxLabel;
    cbCountryID: TcxImageComboBox;
    cbAR: TcxComboBox;
    chbARdef: TcxCheckBox;
    lAR: TcxLabel;

    procedure pcMainChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cbCountryIDPropertiesChange(Sender: TObject);
    procedure cbLangPropertiesChange(Sender: TObject);
    procedure cbRepLangPropertiesChange(Sender: TObject);
    procedure tvMainChange(Sender: TObject; Node: TTreeNode);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure chbARdefPropertiesChange(Sender: TObject);

  private
    procedure checkData;
    procedure setCaptions;

    procedure setCanCancel(AValue: Boolean);
    function getCanCancel: Boolean;

  public
    property CanCancel: Boolean read getCanCancel write setCanCancel;
  end;

var
  frmInitialSettings: TfrmInitialSettings;

//=================================================================================
//=================================================================================
//=================================================================================
//=================================================================================
implementation

uses
  ClientData, StrUtils, xLngDefs, prFun;

const
  rs_Section = 'InitialSettings';

{$R *.dfm}

//=================================================================================
procedure TfrmInitialSettings.setCaptions;
  var
    i: Integer;
begin
  with dmData.lng do begin
    Self.Caption := rs(rs_Section, 'Title');
    btnCancel.Caption := rs('Common', 'Cancel');
    btnOK.Caption := rs('Common', 'OK');

    gbCID.Caption := rs('frmOptions', 'CountryOfOp', 3);
    if CountryRules.cid = -1
      then lblCountryID.Caption := rs('frmOptions', 'CountryOfOpUnsetHint')
      else lblCountryID.Caption := rs('frmOptions', 'CountryOfOpHint');

    lblLang.Caption := rs('frmOptions', 'Language');
    lblRepLang.Caption := rs('frmOptions', 'RepLang');

    tsCID.Caption := rs(rs_Section, 'tsCID');

    tvMain.Items.Clear;
    tvMain.Items.BeginUpdate;
    tvMain.Items.AddObject(nil, rs(rs_Section, 'tsCID'), pointer(tsCID));
    tvMain.Items.EndUpdate;
  end;

  // blocking unwanted languages from fearful american people
  cbLang.Properties.BeginUpdate;
  cbRepLang.Properties.BeginUpdate;
  cbLang.Properties.Items.Clear;
  cbRepLang.Properties.Items.Clear;
  for i := 0 to dmData.Lng.FilesCount - 1 do begin
    if (CountryRules.cid = cidUS) and (i <> lidENG) and (i <> lidESP) then Break;

    cbLang.Properties.Items.Add(dmData.Lng.Files[i].LangName);
    cbRepLang.Properties.Items.Add(dmData.Lng.Files[i].LangName);
  end;

  switchLang(CountryRules.LangID);
  cbLang.ItemIndex := LangID;
  if RepLangID = -1 then RepLangID := LangID;
  cbRepLang.ItemIndex := RepLangID;

  cbLang.Properties.EndUpdate;
  cbRepLang.Properties.EndUpdate;

  lAR.Caption := RS('frmOptions', 'AccRules') + ':';
  chbARdef.Properties.Caption := RS('Common', 'Default');
  chbARdef.Checked := True;
  chbARdef.Enabled := False;
end;

//=================================================================================
procedure TfrmInitialSettings.checkData;
begin
  btnOK.Enabled := (cbCountryID.ItemIndex <> -1) and (cbLang.ItemIndex <> -1);
end;

//=================================================================================
procedure TfrmInitialSettings.setCanCancel(AValue: Boolean);
begin
  btnCancel.Visible := AValue;
end;

//=================================================================================
function TfrmInitialSettings.getCanCancel: Boolean;
begin
  Result := btnCancel.Visible;
end;

//=================================================================================
procedure TfrmInitialSettings.pcMainChange(Sender: TObject);
begin
  inherited;
end;

//=================================================================================
procedure TfrmInitialSettings.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := btnOK.Enabled or CanCancel;
  if not CanClose then Exit;

  // saving
  SaveLangInfo;
end;

//=================================================================================
procedure TfrmInitialSettings.FormCreate(Sender: TObject);
  var
    i,n: Integer;
    s: String;
    cbi: TcxImageComboboxItem;
begin
  inherited;
  Left := Screen.Width div 2 - Width div 2;
  Top := Screen.Height div 2 - Height div 2;

  CanCancel := True;

  cbCountryID.Properties.Images := CountryRules.Images;

  // filling country drop down
  cbCountryID.Properties.BeginUpdate;
  for i := 0 to CountryRules.count - 1 do begin
    cbi := TcxImageComboboxItem(cbCountryID.Properties.Items.Add);
    cbi.ImageIndex := CountryRules[i].FlagIndex;
    cbi.Description := CountryRules[i].Name;
    cbi.Value := CountryRules[i].cid;

    if (CountryRules.cid <> -1) and (CountryRules.cid = CountryRules[i].cid)
      then cbCountryId.ItemIndex := cbi.Index;
  end;
  cbCountryID.Properties.EndUpdate;

  cbAR.Properties.BeginUpdate;
  for i := 0 to accRul_Max do cbAR.Properties.Items.Add(RS('Common', 'accRul_' + IntToStr(i)));
  cbAR.Properties.EndUpdate;

  setCaptions;
  checkData;
end;

//=================================================================================
procedure TfrmInitialSettings.cbCountryIDPropertiesChange(Sender: TObject);
begin
  inherited;

  if CountryRules.cid = cbCountryID.Properties.Items[cbCountryID.ItemIndex].Value
    then Exit;

  CountryRules.setCurrent(Integer(cbCountryID.Properties.Items[cbCountryID.ItemIndex].Value));
  CountryRules.AR := CountryRules.defAR;

  switchLang(LangID, CountryRules.cid);
  SetCaptions; // to fix available language selection
  checkData;
end;

//=================================================================================
procedure TfrmInitialSettings.cbLangPropertiesChange(Sender: TObject);
begin
  inherited;
  switchLang(cbLang.ItemIndex);
  SetCaptions;
  checkData;
end;

//=================================================================================
procedure TfrmInitialSettings.cbRepLangPropertiesChange(Sender: TObject);
begin
  inherited;
  RepLangID := cbRepLang.ItemIndex;
  switchLang(LangID);
  checkData;
end;

//=================================================================================
procedure TfrmInitialSettings.tvMainChange(Sender: TObject; Node: TTreeNode);
begin
  inherited;
  if Node = nil then Exit;
  pcMain.ActivePage := TTabSheet(Node.Data);
end;

//=================================================================================
procedure TfrmInitialSettings.btnOKClick(Sender: TObject);
begin
  if CountryRules.cid = -1 then Exit;

  inherited;
  ModalResult := mrOK;
end;

//=================================================================================
procedure TfrmInitialSettings.btnCancelClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

//=================================================================================
procedure TfrmInitialSettings.chbARdefPropertiesChange(Sender: TObject);
begin
  inherited;
  cbAR.Enabled := not chbARdef.Checked;
end;

end.

