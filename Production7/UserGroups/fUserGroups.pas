{$I ok_sklad.inc}
unit fUserGroups;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrame, Menus, ActnList, dxTL6, dxDBCtrl6, dxDBGrid6, dxCntner6,
  DB, DBClient, ssBaseConst, TB2Item;

type
  TfmUserGroups = class(TssBaseFrame)
    cdsView: TClientDataSet;
    colName: TdxDBGridColumn;
    dsEqType: TDataSource;
    grdMain: TdxDBGrid;

    procedure grdMainDblClick(Sender: TObject);
    procedure grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);

  protected
    function GetIDForUpdate: integer; override;

  public
    procedure UpdateActionList; override;
    procedure DoOpen(AParam: Variant); override;
    procedure DoClose; override;
    procedure DoDelete; override;
    procedure DoRefresh(const AID: integer; AParam: integer = 0); override;
    procedure SetCaptions; override;
  end;

var
  fmUserGroups: TfmUserGroups;

implementation

uses 
  ClientData, prFun, prConst, UserGroupsEdit, Udebug;

var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

const
  _ID_ = 'grpid';

//==============================================================================================
procedure TfmUserGroups.DoClose;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUserGroups.DoClose') else _udebug := nil;{$ENDIF}

  cdsView.Close;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUserGroups.DoDelete;
var FNode: TdxTreeListNode;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUserGroups.DoDelete') else _udebug := nil;{$ENDIF}


  if MessageDlg(rs('common','DelConfirm'), mtWarning, [mbYes, mbNo], 0) = mrYes then
   with TClientDataSet.Create(nil) do
    try
     TrStart;
    try
     RemoteServer := dmData.SConnection;
     if not DeleteData(dmData.SConnection, 'usergroups', cdsView.fieldbyname(_ID_).AsInteger)
      then raise Exception.Create(rs('common','DeleteError'));

     if not DelToRecycleBin
      then TrCommit
      else begin
       TrRollback;

       if not AddToRecycleBin(dmData.SConnection, Self.ClassName, cdsView.fieldbyname(_ID_).AsInteger, cdsView.fieldbyname('name').AsString, False, Self.FunID) then begin
        MessageDlg(rs('common','ErrorInsToRecycleBin'), mtError, [mbOk], 0);
          begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

       end;
      end;

     aRefresh.Execute;
     UpdateActionList;
    except
     on e:exception do begin
      TrRollback;
      MessageDlg(rs('common','NoDelete')+#10#13+e.Message, mtError, [mbOk], 0);
     end;
    end;
    finally
     Free;
    end;
  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUserGroups.DoOpen(AParam: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUserGroups.DoOpen') else _udebug := nil;{$ENDIF}


  EditingClass := TfrmUserGroupsEdit;
  cdsView.Open;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUserGroups.SetCaptions;
  var t: string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUserGroups.SetCaptions') else _udebug := nil;{$ENDIF}


  Self.Caption := rs(Self.Name,'Title');
  colName.Caption := rs(Self.Name,'Name');

  t := rs(Self.Name, 'Title');
  SendMessage(ParentHandle, WM_SETPARENTCAPTION, integer(@t), 0);

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUserGroups.grdMainDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUserGroups.grdMainDblClick') else _udebug := nil;{$ENDIF}


  if grdMain.Count > 0 then DoProperties;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUserGroups.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUserGroups.UpdateActionList') else _udebug := nil;{$ENDIF}


     aProperties.Enabled := not cdsView.IsEmpty;
     aDel.Enabled := aProperties.Enabled;
     aDynamic.Enabled := False;

     inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUserGroups.DoRefresh(const AID: integer; AParam: integer = 0);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUserGroups.DoRefresh') else _udebug := nil;{$ENDIF}


     DSRefresh(cdsView, _ID_, AID);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmUserGroups.GetIDForUpdate: integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUserGroups.GetIDForUpdate') else _udebug := nil;{$ENDIF}


     Result := cdsView.fieldbyname(_ID_).AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUserGroups.grdMainCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUserGroups.grdMainCustomDrawCell') else _udebug := nil;{$ENDIF}


     if UseGridOddColor and not ASelected and Odd(ANode.AbsoluteIndex) then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fUserGroups', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
