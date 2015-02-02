{$I ok_sklad.inc}
unit BankPersonsEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ExtCtrls, StdCtrls, cxButtons,
  ssFormStorage, ActnList, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMemo, ssMemDS, ssBaseIntfDlg, ssBevel, ImgList, ssSpeedButton, ssPanel,
  ssGradientPanel, xButton;

type
  TfrmBankPersonsEdit = class(TfrmBaseIntfDlg)
    FormStorage: TssFormStorage;
    panMain: TPanel;
    ssBevel2: TssBevel;
    lName: TLabel;
    edName: TcxTextEdit;
    lJob: TLabel;
    edJob: TcxTextEdit;
    lPhone: TLabel;
    edPhone: TcxTextEdit;
    lEMail: TLabel;
    edEMail: TcxTextEdit;
    memNotes: TcxMemo;
    lNotes: TLabel;
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure DataModified(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FOnDate: TDateTime;
    FModified: boolean;
  protected
    FParentName: string;
    FID: integer;
    procedure SetID(const Value: integer);
    procedure SetParentName(const Value: string);
    procedure SetOnDate(const Value: TDateTime);
    procedure DoCreate; override;
  public
    MainHandle: HWND;
    mdC: TssMemoryData;
    UseMemDS: boolean;
    PID: integer;
    property ParentNameEx: string read FParentName write SetParentName;
    property ID: integer read FID write SetID;
    property OnDate: TDateTime read FOnDate write SetOnDate;
    procedure SetCaptions;
  end;

var
  frmBankPersonsEdit: TfrmBankPersonsEdit;

implementation

uses
  prConst, prFun, DB, ssBaseConst, ssClientDataSet, DBClient,
  ClientData, Udebug;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';


{$R *.dfm}

{ TBaseDlg }

//==============================================================================================
procedure TfrmBankPersonsEdit.SetOnDate(const Value: TDateTime);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBankPersonsEdit.SetOnDate') else _udebug := nil;{$ENDIF}


  FOnDate := Value;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBankPersonsEdit.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBankPersonsEdit.SetParentName') else _udebug := nil;{$ENDIF}


  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBankPersonsEdit.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBankPersonsEdit.SetCaptions') else _udebug := nil;{$ENDIF}


  aOk.Caption := rs(Self.Name,'OK');
  aCancel.Caption := rs(Self.Name,'Cancel');
  aApply.Caption := rs(Self.Name,'Apply');

  lName.Caption := rs(Self.Name,'FIO');
  lJob.Caption := rs(Self.Name,'Job');
  lPhone.Caption := rs(Self.Name,'Phone');
  lEMail.Caption := rs(Self.Name,'EMail');
  lNotes.Caption := rs(Self.Name,'Notes');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBankPersonsEdit.DoCreate;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBankPersonsEdit.DoCreate') else _udebug := nil;{$ENDIF}

  inherited;

  FormStorage.IniFileName := PrRegKey;
  FormStorage.IniSection := Self.Name;
  FormStorage.Active := True;

  //SetStyle(Self, IStyle);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBankPersonsEdit.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBankPersonsEdit.ActionListUpdate') else _udebug := nil;{$ENDIF}

  aOk.Enabled := (Trim(edName.Text)<>EmptyStr);
  aApply.Enabled := aOk.Enabled and FModified and (ID=0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBankPersonsEdit.SetID(const Value: integer);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmBankPersonsEdit.SetID') else _udebug := nil;{$ENDIF}

  FID := Value;
     if Value <> 0 then begin
       panTitleBar.Caption := rs(Self.Name,'PersonProps');
       aApply.Enabled := False;
     end
     else panTitleBar.Caption := rs(Self.Name,'NewPerson');

     if UseMemDS then begin
       if Value <> 0 then begin
         edName.Text := mdC.fieldbyname('name').AsString;
         edPhone.Text := mdC.fieldbyname('phone').AsString;
         edEMail.Text := mdC.fieldbyname('email').AsString;
         edJob.Text := mdC.fieldbyname('job').AsString;
         memNotes.Text := mdC.fieldbyname('notes').AsString;
       end;
     end
     else begin
      if Value <> 0 then begin
        with newDataset do
         try
           ProviderName := 'pBankPersons_Get';
           FetchParams;
           Params.ParamByName('personid').AsInteger := Value;
           Open;
           edName.Text := fieldbyname('name').AsString;
           edPhone.Text := fieldbyname('phone').AsString;
           edEMail.Text := fieldbyname('email').AsString;
           edJob.Text := fieldbyname('job').AsString;
           memNotes.Text := fieldbyname('notes').AsString;
           Close;

         finally
           Free;
         end;
       end;
     end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfrmBankPersonsEdit.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBankPersonsEdit.DataModified') else _udebug := nil;{$ENDIF}

  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmBankPersonsEdit.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
 var
   Maxx: integer;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmBankPersonsEdit.FormCloseQuery') else _udebug := nil;{$ENDIF}

  if ModalResult in [mrYes, mrOK] then begin
    CanClose := False;

    if UseMemDS then begin
       if ID = 0
         then mdC.Append
         else mdC.Edit;

       mdC.FieldByName('name').AsString := edName.Text;
       mdC.FieldByName('phone').AsString := edPhone.Text;
       mdC.FieldByName('job').AsString := edJob.Text;
       mdC.FieldByName('email').AsString := edEMail.Text;
       mdC.FieldByName('notes').AsString := memNotes.Text;
       mdC.Post;
    end
    else with newDataset do
      try
        if ID = 0 then begin
          ProviderName := 'pBankPersons_Max';
          Open;
          Maxx := Fields[0].AsInteger+1;
          Close;
        end
        else Maxx := ID;

        if ID = 0
         then ProviderName := 'pBankPersons_Ins'
         else ProviderName := 'pBankPersons_Upd';

        FetchParams;
        Params.ParamByName('personid').AsInteger := Maxx;
        Params.ParamByName('bankid').AsInteger := PID;
        Params.ParamByName('name').AsString := edName.Text;
        Params.ParamByName('phone').AsString := edPhone.Text;
        Params.ParamByName('email').AsString := edEMail.Text;
        Params.ParamByName('job').AsString := edJob.Text;
        Params.ParamByName('notes').AsString := memNotes.Text;
        Execute;

        SendMessage(MainHandle, WM_REFRESH, Maxx, 1);

      finally
        Free;
      end;

      if ModalResult = mrOk
       then CanClose := True
       else begin
         edName.Clear;
         edPhone.Clear;
         edEMail.Clear;
         edJob.Clear;
         memNotes.Clear;
         edName.SetFocus;
       end;
  end; //if ModalResult in [mrYes, mrOK]

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('BankPersonsEdit', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
