unit kgu1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Memo1: TMemo;
    lHID: TLabel;
    lUser: TLabel;
    lregNo: TLabel;
    lEmail: TLabel;
    EdHID: TEdit;
    EdUser: TEdit;
    Edregno: TEdit;
    Edemail: TEdit;
    CbBarC: TCheckBox;
    rgMaxClients: TRadioGroup;
    EdMaxClients: TEdit;
    btnDefaults: TButton;
    BtnClear: TButton;
    BtnGen: TButton;
    BtnSave: TButton;
    lCust: TLabel;
    SaveDialog1: TSaveDialog;
    btnEncode: TButton;
    bynDecode: TButton;
    mInput: TMemo;
    edWebShops: TEdit;
    lWebShops: TLabel;
    lAddStr: TLabel;
    mAddStr: TMemo;
    btnMyHID: TButton;
    procedure clearError;
    procedure BtnClearClick(Sender: TObject);
    procedure BtnGenClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure rgMaxClientsClick(Sender: TObject);
    procedure btnDefaultsClick(Sender: TObject);
    procedure btnEncodeClick(Sender: TObject);
    procedure btDecodeClick(Sender: TObject);
    procedure btnMyHIDClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
uses
  DateUtils, Protection;

//==============================================================================================
procedure TForm1.clearError;
begin
  lHID.Font.Style := [];
  lHID.Font.Color := clwindowText;
  lUser.Font.Style := [];
  lUser.Font.Color := clwindowText;
  lRegNo.Font.Style := [];
  lRegNo.Font.Color := clwindowText;
  lEmail.Font.Style := [];
  lEmail.Font.Color := clwindowText;
  lcust.Visible := False;
end;

//==============================================================================================
procedure TForm1.BtnClearClick(Sender: TObject);
begin
  Memo1.Text := '';
  edHID.Text := '';
  edUser.Text := '';
  edRegno.Text := '';
  edEmail.Text := '';
  edWebShops.text := '0';
  mAddStr.text := '';
  rgMaxclients.ItemIndex := 0;
  EdMaxClients.Text := '';
  EdMaxClients.Enabled := False;
  cbBarC.Checked := False;
  clearError;
end;

//==============================================================================================
procedure TForm1.rgMaxClientsClick(Sender: TObject);
begin
  if rgMaxClients.ItemIndex = 5 then begin
    EdMaxClients.Enabled := true;
    EdMaxClients.SetFocus;
  end
  else begin
    EdMaxClients.Enabled := false;
  end;
end;

//==============================================================================================
procedure TForm1.btnDefaultsClick(Sender: TObject);
begin
  BtnClearClick(Sender);
  btnMyHIDClick(Sender);
  
  edUser.Text := 'user';
  edRegno.Text := '1111';
  edEmail.Text := 'some@email.com';
  edWebShops.text := '1';
  cbBarC.Checked := True;
end;

//==============================================================================================
procedure TForm1.BtnGenClick(Sender: TObject);
 var
   list: Tstringlist;
   s: string;
begin
  list := Tstringlist.create;
  if trim(edHID.Text) = '' then begin
    lHID.Font.Style := [fsBold];
    lHID.Font.Color := clRed;
    EdHID.SetFocus;
    exit;
  end;
  list.add('hardwareid=' + trim(edHID.Text));

  case rgMaxClients.ItemIndex of
    0: s := '1';
    1: s := '3';
    2: s := '5';
    3: s := '10';
    4: s := '99999';
    5: begin
      try
        StrToInt(trim(EdMaxClients.Text));
        s := trim(EdMaxClients.Text);
      except
        s := '';
      end;
      if s = '' then begin
        lcust.Visible := True;
        EdMaxClients.SetFocus;
        exit;
      end;
    end;
  end;
  list.add('maxclients=' + s);

  if cbBarc.Checked
    then s := '1'
    else s := '0';
  list.add('barcodes=' + s);

  if trim(edUser.Text) = '' then begin
    lUser.Font.Style := [fsBold];
    lUser.Font.Color := clRed;
    EdUser.SetFocus;
    exit;
  end;
  list.add('user=' + trim(edUser.Text));

  if trim(edRegNo.Text) = '' then begin
    lRegNo.Font.Style := [fsBold];
    lRegNo.Font.Color := clRed;
    EdRegNo.SetFocus;
    exit;
  end;
  list.add('id=' + trim(edRegno.Text));

  if trim(edEmail.Text) = '' then begin
    lEmail.Font.Style := [fsBold];
    lEmail.Font.Color := clRed;
    EdEmail.SetFocus;
    exit;
  end;

  list.add('email=' + trim(edEmail.Text));

  try
    StrToInt(trim(edWebShops.Text));
    list.add('webshops=' + trim(edWebShops.Text));
  except
    list.add('webshops=0');
  end;

  list.add(trim(mAddStr.Text));

  Memo1.Text := encodeKey(list.text);

  clearError;
end;

//==============================================================================================
procedure TForm1.BtnSaveClick(Sender: TObject);
 var
   f: textFile;
begin
  if not SaveDialog1.Execute then Exit;

  AssignFile(f, SaveDialog1.FileName);
  try
    rewrite(f);
    writeln(f, Memo1.Text);
    closefile(f);
  except
    showMessage('Error saving ' + SaveDialog1.FileName);
  end;
end;

//==============================================================================================
procedure TForm1.btnEncodeClick(Sender: TObject);
begin
  Memo1.Text := encodeKey(mInput.text);
end;

//==============================================================================================
procedure TForm1.btDecodeClick(Sender: TObject);
begin
  Memo1.Text := decodeKey(mInput.text);
end;

//==============================================================================================
procedure TForm1.btnMyHIDClick(Sender: TObject);
begin
  EdHid.Text := CurrentHardwareID[0];
end;

end.

