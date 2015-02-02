{$I ok_sklad.inc}
unit fUserMonitor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrame, Menus, ActnList, dxTL6, dxDBCtrl6, dxDBGrid6, dxCntner6,
  DB, DBClient, ssBaseConst, ExtCtrls, TB2Item, ssDBGrid,
  ssClientDataSet, xLngDefs;

type
  TfmUserMonitor = class(TssBaseFrame)
    cdsMain: TssClientDataSet;
    cdsUTV: TssClientDataSet;
    colFun: TdxDBGridColumn;
    colInterval: TdxDBGridColumn;
    colLogin: TdxDBGridColumn;
    colUserName: TdxDBGridColumn;
    grdMain: TssDBGrid;
    srcView: TDataSource;
    Timer: TTimer;

    procedure cdsUTVBeforeOpen(DataSet: TDataSet);
    procedure colFunCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure colFunGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colIntervalGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure FrameResize(Sender: TObject);
    procedure grdMainCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure TimerTimer(Sender: TObject);

  private
    CanMonitor: boolean;

  public
    procedure DoClose; override;
    procedure DoOpen(AParam: Variant); override;
    procedure DoRefresh(const AID: integer; AParam: integer = 0); override;
    procedure NotifyChanged; override;
    procedure RealingGrid;
    procedure SetCaptions; override;
    procedure StartProcess; override;
    procedure StopProcess; override;
    procedure UpdateActionList; override;
  end;

var
  fmUserMonitor: TfmUserMonitor;

implementation

uses 
  ClientData, prFun, prConst, ssFun, prTypes, udebug;

var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

{ TfmMeasures }

const
     _ID_ = 'userid';

//==============================================================================================
procedure TfmUserMonitor.DoClose;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUserMonitor.DoClose') else _udebug := nil;{$ENDIF}


  cdsMain.Close;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUserMonitor.DoOpen(AParam: Variant);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUserMonitor.DoOpen') else _udebug := nil;{$ENDIF}


  cdsMain.Open;
  StartProcess;
  
  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUserMonitor.SetCaptions;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUserMonitor.SetCaptions') else _udebug := nil;{$ENDIF}


  with LangMan do begin
    Self.Caption := GetRS(Self.Name, 'Title');
    colLogin.Caption := GetRS(Self.Name, 'Login');
    colUserName.Caption := GetRS(Self.Name, 'FullName');
    colFun.Caption := GetRS(Self.Name, 'Function');
    colInterval.Caption := GetRS(Self.Name, 'Interval');
  end;

  DSRefresh(cdsUTV, 'id', 0);
  
  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUserMonitor.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUserMonitor.UpdateActionList') else _udebug := nil;{$ENDIF}


  aNew.Enabled := False;
  aPatternInsert.Enabled := False;
  aProperties.Enabled := False;
  aDel.Enabled := False;
  aDynamic.Enabled := False;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUserMonitor.DoRefresh(const AID: integer; AParam: integer = 0);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUserMonitor.DoRefresh') else _udebug := nil;{$ENDIF}


  DSRefresh(cdsMain, _ID_, AID);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUserMonitor.colFunGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUserMonitor.colFunGetText') else _udebug := nil;{$ENDIF}


  if (AText <> EmptyStr) and cdsUTV.Locate('funid', StrToInt(AText), [])
    then AText := cdsUTV.fieldbyname('name').AsString
    else AText := LangMan.GetRS(Self.Name, 'System');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUserMonitor.colFunCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUserMonitor.colFunCustomDrawCell') else _udebug := nil;{$ENDIF}


     AAlignment := taLeftJustify;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUserMonitor.StartProcess;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUserMonitor.StartProcess') else _udebug := nil;{$ENDIF}


     CanMonitor := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUserMonitor.StopProcess;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUserMonitor.StopProcess') else _udebug := nil;{$ENDIF}


     CanMonitor := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUserMonitor.TimerTimer(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUserMonitor.TimerTimer') else _udebug := nil;{$ENDIF}


  if CanMonitor then DoRefresh(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUserMonitor.grdMainCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUserMonitor.grdMainCustomDrawCell') else _udebug := nil;{$ENDIF}


     if UseGridOddColor and not ASelected and Odd(ANode.AbsoluteIndex) then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUserMonitor.RealingGrid;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUserMonitor.RealingGrid') else _udebug := nil;{$ENDIF}


  AdjustGrid(grdMain, colFun);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUserMonitor.FrameResize(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUserMonitor.FrameResize') else _udebug := nil;{$ENDIF}

  inherited;
  RealingGrid;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUserMonitor.cdsUTVBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUserMonitor.cdsUTVBeforeOpen') else _udebug := nil;{$ENDIF}


  cdsUTV.Params.ParamByName('profid').AsInteger := 0;
  cdsUTV.Params.ParamByName('lang').AsString := LangName;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUserMonitor.colIntervalGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  var FInterval: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUserMonitor.colIntervalGetText') else _udebug := nil;{$ENDIF}


  FInterval := StrToInt(AText);
  AText := GetIntervalStr(FInterval);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmUserMonitor.NotifyChanged;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmUserMonitor.NotifyChanged') else _udebug := nil;{$ENDIF}


  if not JumpFromBuffer
    then frmMainForm.AddToBuffer(vtService, FunID, Self.Caption, ClassName, Tag, FCurrentID, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fUserMonitor', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
