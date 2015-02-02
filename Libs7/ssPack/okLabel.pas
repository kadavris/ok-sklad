unit okLabel;

interface

uses
  SysUtils, Classes, Controls, StdCtrls, ssLabel, xLngManager;

type
  TokLabel = class(TssLabel)
  private
    FLangManager: TxLngManager;
    FLangRes: TCaption;
    FLangSection: TCaption;
    procedure SetLangManager(const Value: TxLngManager);
    procedure SetLangRes(const Value: TCaption);
    procedure SetLangSection(const Value: TCaption);
  public
    destructor Destroy; override;  
  published
    property LangRes: TCaption read FLangRes write SetLangRes;
    property LangSection: TCaption read FLangSection write SetLangSection;
    property LangManager: TxLngManager read FLangManager write SetLangManager;
  end;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

//==============================================================================================
destructor TokLabel.Destroy;
begin
  //if Assigned(FLangManager) then FLangManager.UnregisterCtrl(Self);

  inherited;
end;

//==============================================================================================
procedure TokLabel.SetLangManager(const Value: TxLngManager);
begin
  if Value = FLangManager then Exit;

  if Assigned(Value) then begin
    Value.FreeNotification(Self);
    //Value.RegisterCtrl(Self);
  end;

  FLangManager := Value;
end;

//==============================================================================================
procedure TokLabel.SetLangRes(const Value: TCaption);
begin
  FLangRes := Value;

  if not Assigned(FLangManager) then Exit;

  Self.Caption := FLangManager.GetRS(FLangSection, Value);
end;

//==============================================================================================
procedure TokLabel.SetLangSection(const Value: TCaption);
begin
  FLangSection := Value;

  if not Assigned(FLangManager) then Exit;

  Self.Caption := FLangManager.GetRS(Value, FLangRes);
end;

end.
