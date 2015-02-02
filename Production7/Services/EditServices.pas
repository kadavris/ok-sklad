{$I ok_sklad.inc}
unit EditServices;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, dxCntner6, dxEditor6, StdCtrls,
  ActnList, ssBaseTypes, DB, DBClient, dxExEdtr6, Buttons,
  ComCtrls, Mask, ssFormStorage, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxPC, cxMaskEdit, cxDropDownEdit,
  cxDBEdit, ssClientDataSet, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, ssDBComboBox, cxMemo, cxCheckBox, cxCurrencyEdit,
  cxLookAndFeelPainters, cxButtons, cxRadioGroup, ssBaseDlg, ssBaseConst,
  cxGraphics, cxCustomData, cxStyles, cxTL, ssImagePanel,
  cxInplaceContainer, cxCalc, ssPopupTreeEdit, cxTreeView,
  ssDBTreeView, Menus, ssSpeedButton, ssPanel, ssGradientPanel, ssBevel,
  ssDBLookupCombo, ssLabel, dxTL6, dxDBCtrl6, dxDBGrid6, ssMemDS,
  ssCalcEdit, xButton, cxGroupBox, ssGroupBox, dxDBTLCl6, dxGrClms6, TB2Item,
  ImgList, okSearchEdit;

type
  TfrmEditServices = class(TBaseDlg)
    aGrpDel1: TMenuItem;
    aGrpIns1: TMenuItem;
    aGrpProp1: TMenuItem;
    aGrpRefresh1: TMenuItem;
    aMCDel: TAction;
    aMCNew: TAction;
    aMCProps: TAction;
    aMIns: TAction;
    aPricesAdd: TAction;
    aPricesDel: TAction;
    aPricesProps: TAction;
    btnCopyName: TssSpeedButton;
    btnGrp: TssSpeedButton;
    btnGrpParent: TssSpeedButton;
    btnMeasures: TssSpeedButton;
    cbType: TcxComboBox;
    cdsCurrency: TssClientDataSet;
    cdsMatGroup: TssClientDataSet;
    cdsMeasures: TssClientDataSet;
    cdsParent: TssClientDataSet;
    chbIsNormed: TcxCheckBox;
    chbIsTrans: TcxCheckBox;
    colDeff: TcxTreeListColumn;
    colID: TcxTreeListColumn;
    colNAme: TcxTreeListColumn;
    edArtikul: TcxTextEdit;
    edName: TcxTextEdit;
    edNorm: TssCalcEdit;
    edNotes: TcxMemo;
    edPrice: TssCalcEdit;
    gbMainInfo: TssGroupBox;
    gbNotes: TssGroupBox;
    lArtikul: TssLabel;
    lcbCurrency: TssDBLookupCombo;
    lcbGrpParent: TssPopupTreeEdit;
    lcbMeasure: TssDBLookupCombo;
    lcbParent: TssPopupTreeEdit;
    lGrpParent: TssLabel;
    lKurs: TLabel;
    lMeasure: TLabel;
    lName: TLabel;
    lNorm: TssLabel;
    lParent: TLabel;
    lPrice: TssLabel;
    lType: TLabel;
    mnuDiscAdd: TTBItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    panMainInfo: TPanel;
    pcMain: TcxPageControl;
    pcParent: TPageControl;
    pmMatGroup: TPopupMenu;
    pmMC: TTBPopupMenu;
    rbtNoParent: TcxRadioButton;
    rbtParent: TcxRadioButton;
    sbKurs: TssSpeedButton;
    srcCurrency: TDataSource;
    srcMatGroup: TDataSource;
    srcMeasures: TDataSource;
    srcParent: TDataSource;
    TBItem2: TTBItem;
    TBItem3: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    tsGrp: TTabSheet;
    tsMain: TcxTabSheet;
    tsMat: TTabSheet;
    tsNotes: TcxTabSheet;
    tvMain: TcxTreeList;

    procedure aApplyExecute(Sender: TObject);
    procedure aCancelExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aMInsExecute(Sender: TObject);
    procedure aOKExecute(Sender: TObject);
    procedure btnCopyNameClick(Sender: TObject);
    procedure btnGrpMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnGrpMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btnMeasuresMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure cbTypePropertiesChange(Sender: TObject);
    procedure cdsCurrencyAfterOpen(DataSet: TDataSet);
    procedure cdsCurrencyBeforeOpen(DataSet: TDataSet);
    procedure cdsParentAfterOpen(DataSet: TDataSet);
    procedure chbIsNormedClick(Sender: TObject);
    procedure DataModified(Sender: TObject);
    procedure edArtikulPropertiesChange(Sender: TObject);
    procedure edMatGroupGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
    procedure edNameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edNamePropertiesChange(Sender: TObject);
    procedure edNotesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edPricePropertiesEditValueChanged(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure lcbCurrencyPropertiesChange(Sender: TObject);
    procedure lcbCurrencyPropertiesEditValueChanged(Sender: TObject);
    procedure lcbGrpParentPropertiesEditValueChanged(Sender: TObject);
    procedure lcbMeasureEnter(Sender: TObject);
    procedure lcbParentEnter(Sender: TObject);
    procedure lcbParentExit(Sender: TObject);
    procedure lcbParentGetNodeImageIndex(Sender: TObject; ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType; var AIndex: TImageIndex);
    procedure lcbParentPropertiesEditValueChanged(Sender: TObject);
    procedure rbtParentClick(Sender: TObject);
    procedure sbKursClick(Sender: TObject);
    procedure tvMainSelectionChanged(Sender: TObject);

  private
    FCanModify, FMCModified: Boolean;
    FCurrRef: TControl;
    FPricesNode, FMatChangeNode: TcxTreeListNode;
    FTmpMatID: Integer;
    OldGrp: string;
    OldNum: integer;
    PopupNode: TTreeNode;
    PriceCanChange, PriceCanPost, MCCanPost, MCCanChange: Boolean;

    procedure LoadMatGroup;
    procedure SetCanModify(const Value: Boolean);
    procedure WMLayoutChanged(var M: TMessage); message WM_LAYOUTCHANGED;
    procedure WMRefresh(var M: TMessage); message WM_REFRESH;

  protected
    procedure SetGrpID(const Value: integer); override;
    procedure setid(const Value: integer); override;
    procedure SetParentName(const Value: string); override;

  public
    ParentHandle: HWND;
    MatType: Integer;

    procedure SetCaptions; override;
    property CanModify: Boolean read FCanModify write SetCanModify;
  end;

var
  frmEditServices: TfrmEditServices;

implementation

uses 
  prConst, prFun, ClientData, Login, ssFun,
  EditMeasure, EditWHouse, fWHouse, prTypes, ssCallbackConst,
  ssBaseIntfDlg, fMessageDlg, CurrencyEdit, udebug;

var DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}
//==============================================================================================
procedure TfrmEditServices.FormCreate(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.FormCreate') else _udebug := nil;{$ENDIF}


   inherited;
   FCanModify := True;
   Screen.Cursor := crSQLWait;
   try
     Application.ProcessMessages;
     //dmData.Images.GetBitmap(39, edPrice.Properties.ButtonGlyph);
     btnMeasures.ImageIndex := 33;

     pcMain.ActivePage := tsMain;

     cdsParent.Open;
     cdsMeasures.Open;
     cdsMeasures.Locate('def', 1, []);
     lcbMeasure.KeyValue := cdsMeasures.FieldByName('mid').AsInteger;
   finally
     Screen.Cursor := crDefault;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.setid(const Value: integer);
  var
    FNode: TcxTreeListNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditServices.setid') else _udebug := nil;{$ENDIF}

  DSRefresh(cdsCurrency, 'currid', 0);

  if not IsPattern then FID := Value;

  with newDataSet do
  try
    if Value <> 0 then begin
      ProviderName := 'pSvc_Get';
      FetchParams;
      Params.ParamByName('svcid').AsInteger := Value;
      Open;
      if not IsEmpty then begin
        cbType.ItemIndex := FieldByName('isgrp').AsInteger;
        edName.Text := FieldByName('name').AsString;
        edArtikul.Text := FieldByName('artikul').AsString;
        edNotes.Text := FieldByName('notes').AsString;
        lcbParent.Value := FieldByName('pid').AsInteger;
        if cbType.ItemIndex = 0 then lcbMeasure.KeyValue := FieldByName('mid').AsInteger;
        edNorm.Value := FieldByName('norm').AsFloat;  
        chbIsTrans.Checked := FieldByName('istransport').AsInteger = 1;
        chbIsNormed.Checked := FieldByName('isnormed').AsInteger = 1;
        FGrpID := FieldByName('pid').AsInteger;
        if FieldByName('isgrp').AsInteger = 0 then begin
          edPrice.Value := FieldByName('price').AsFloat;
          lcbCurrency.KeyValue := FieldByName('currid').AsInteger;
        end
        else begin
          if FieldByName('pid').AsInteger = Value
            then rbtNoParent.Checked := True
            else rbtParent.Checked := True;
          lcbGrpParent.Value := FieldByName('pid').AsInteger;
        end;
      end;
      Close;

      if not IsPattern then cbType.Enabled := False;
    end;
  finally
    Free;
  end;
  FModified := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  var
   NewRecord: Boolean;
   GrpID, Num: Integer;
   FInfo: TGrpInfo;
   FPrice, FNorm: Extended;
   {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelLow, DEBUG_unit_ID, 'TfrmEditServices.FormCloseQuery') else _udebug := nil;{$ENDIF}


  if CanModify then
    if ModalResult in [mrOK, mrYes] then begin
      CanClose := False;

      with newDataSet do
      try
        TrStart;

        try
          NewRecord := (ID = 0);
          if FID = 0 then begin
            FID := GetMaxID(dmData.SConnection, 'services', 'svcid');
          end;

          if NewRecord
            then ProviderName := 'pSvc_Ins'
            else ProviderName := 'pSvc_Upd';
          FetchParams;
          Params.ParamByName('svcid').AsInteger := FID;
          Params.ParamByName('name').AsString := edName.Text;
          Params.ParamByName('artikul').AsString := edArtikul.Text;
          Params.ParamByName('isgrp').AsInteger := cbType.ItemIndex;
          if cbType.ItemIndex = 1 then begin
            chbIsTrans.Checked := False;
            chbIsNormed.Checked := False;
          end;
          Params.ParamByName('istransport').AsInteger := Integer(chbIsTrans.Checked);
          Params.ParamByName('notes').AsString := edNotes.Text;
          Params.ParamByName('currid').AsInteger := lcbCurrency.KeyValue;
          Params.ParamByName('isnormed').AsInteger := Integer(chbIsNormed.Checked);

          try
            FNorm := StrToFloat(edNorm.EditingText);
          except
            FNorm := 0;
          end;
        
          if chbIsNormed.Checked
            then Params.ParamByName('norm').AsFloat := FNorm
            else Params.ParamByName('norm').AsFloat := 0;

          if cbType.ItemIndex = 0
            then Params.ParamByName('mid').AsInteger := lcbMeasure.KeyValue
            else begin
              Params.ParamByName('mid').DataType := ftInteger;
              Params.ParamByName('mid').Clear;
            end;

          try
            FPrice := StrToFloat(edPrice.EditingText);
          except
            FPrice := 0;
          end;

          Params.ParamByName('price').AsFloat := FPrice;
          if cbType.ItemIndex = 0
            then Params.ParamByName('pid').AsInteger := lcbParent.Value
            else begin
              if rbtNoParent.Checked
                then Params.ParamByName('pid').AsInteger := FID
                else Params.ParamByName('pid').AsInteger := lcbGrpParent.Value;
            end;
          Execute;
          GrpID := Params.ParamByName('pid').AsInteger;

          TrCommit;
          if cbType.ItemIndex = 0 then begin
            try
              SendMessage(MainHandle, WM_REFRESH, ID, GrpID + 10);
            except
            end;
          end
          else begin
            FInfo.ID := FID;

            if lcbGrpParent.EditingText <> EmptyStr
              then FInfo.PID := lcbGrpParent.Value
              else FInfo.PID := ID;

            SendMessage(MainHandle, WM_REFRESH, Integer(@FInfo), -1);
            //frmMainForm.ExecRefresh('WH', 0);}
          end;
          if ModalResult = mrYes then
            if NewRecord then begin
              tvMain.FocusedNode := tvMain.Items[0];
              if not IsPattern then begin
                edName.Text := EmptyStr;
                edArtikul.Text := EmptyStr;
                edNotes.Text := EmptyStr;
              end;
              edName.SetFocus;
              FID := 0;
              if cbType.ItemIndex = 1 then DSRefresh(cdsParent, 'svcid', 0);
            end else
          else CanClose := True;
          FModified := False;

        finally
          Free;
        end;

      except
        on e:exception do begin
         TrRollback;
         MessageDlg(e.Message, mtError, [mbOk], 0);
        end;
      end;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.ActionListUpdate') else _udebug := nil;{$ENDIF}


  aOk.Enabled := (FModified and (Trim(edName.Text) <> EmptyStr) and
    (((Trim(lcbParent.EditingText) <> '') and (cbType.ItemIndex = 0) and
    (Trim(edArtikul.Text) <> EmptyStr) and
    (lcbCurrency.Text>'')) or
    (cbType.ItemIndex = 1))) or not CanModify;
  aApply.Enabled := aOk.Enabled and FModified;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.DataModified(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.DataModified') else _udebug := nil;{$ENDIF}


  FModified := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.aApplyExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.aApplyExecute') else _udebug := nil;{$ENDIF}


     ModalResult := mrYes;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.aOKExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.aOKExecute') else _udebug := nil;{$ENDIF}


     ModalResult := mrOK;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.aCancelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.aCancelExecute') else _udebug := nil;{$ENDIF}


     ModalResult := mrCancel;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.SetCaptions;
  var
    FItem: TcxTreeListNode;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.SetCaptions') else _udebug := nil;{$ENDIF}


  with LangMan do begin
    lName.Caption := GetRS(ParentNameEx, 'Name') + ':';
    lArtikul.Caption := GetRS(ParentNameEx, 'Artikul') + ':';
    lParent.Caption := GetRS(ParentNameEx, 'SubordToGrp') + ':';
    tsMain.Caption := GetRS(ParentNameEx, 'MainInfoEx');
    lPrice.Caption := GetRS(ParentNameEx, 'Price') + ':';
    lType.Caption := GetRS(ParentNameEx, 'Type') + ':';
    lMeasure.Caption := GetRS(ParentNameEx, 'Measure') + ':';
    lNorm.Caption := GetRS(ParentNameEx, 'Norm') + ':';
    lKurs.Caption := GetRS(ParentNameEx, 'Rate') + ':';
    gbNotes.Caption := ' ' + GetRS(ParentNameEx, 'Notes') + ' ';
    sbKurs.Hint := GetRS(ParentNameEx, 'SetRate'); 
    btnGrp.Hint := GetRS(ParentNameEx, 'SvcGroupRef');
    btnGrpParent.Hint := GetRS(ParentNameEx, 'SvcGroupRef');
    btnMeasures.Hint := GetRS(ParentNameEx, 'MeasuresRef');

    chbIsTrans.Properties.Caption := GetRS(ParentNameEx, 'IsTrans');
    chbIsNormed.Properties.Caption := GetRS(ParentNameEx, 'SvcNormed');

    cbType.Properties.Items.Add(GetRS(ParentNameEx, 'Svc'));
    cbType.Properties.Items.Add(GetRS(ParentNameEx, 'SvcGroup'));
    cbType.ItemIndex := 0;

    rbtParent.Caption := GetRS(ParentNameEx, 'GrpDepend');
    rbtNoParent.Caption := GetRS(ParentNameEx, 'NoDepend');
    lGrpParent.Caption := GetRS(ParentNameEx, 'Group');
    btnCopyName.Hint := GetRS(ParentNameEx, 'CopyName');

    with tvMain do begin
      Clear;
      FItem := Add;
      FItem.Values[0] := GetRS(ParentNameEx, 'MainInfoEx');
      FItem.Data := Pointer(0);
      FItem.SelectedIndex := 160;
      FItem.ImageIndex := 160;

      FItem := Add;
      FItem.Values[0] := GetRS(ParentNameEx, 'Notes');
      FItem.Data := Pointer(1);
      FItem.SelectedIndex := 4;
      FItem.ImageIndex := 4;
      
      FocusedNode := Items[0];
     end;
  end;
  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.SetParentName(const Value: string);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.SetParentName') else _udebug := nil;{$ENDIF}


  FParentName := Value;
  SetCaptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.cdsCurrencyAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.cdsCurrencyAfterOpen') else _udebug := nil;{$ENDIF}


  if Dataset.Locate('def', 1, [])
    then lcbCurrency.KeyValue := Dataset.fieldbyname('currid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.aMInsExecute(Sender: TObject);
  var aid: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.aMInsExecute') else _udebug := nil;{$ENDIF}


  if FCurrRef = btnGrp then begin
    try aid := lcbParent.Value; except aid := 0; end;
    ShowModalRef(Self, rtSvcGroup, vtSvcGroup, 'TfmSvcGroup', Self.OnDate, aid);
  end else
  if FCurrRef = btnMeasures then begin
    try aid := lcbMeasure.KeyValue; except aid := 0; end;
    ShowModalRef(Self, rtMeasures, vtMeasures, 'TfmMeasures', Self.OnDate, aid);
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.WMRefresh(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.WMRefresh') else _udebug := nil;{$ENDIF}


     case TRefType(M.LParam) of
       rtSvcGroup:
         begin
          DSRefresh(cdsParent, 'svcid', M.WParam);
          lcbParent.Value := M.WParam;
          lcbGrpParent.Value := M.WParam;
         end;
       rtMeasures:
         begin
          DSRefresh(cdsMeasures, 'mid', M.WParam);
          lcbMeasure.KeyValue := M.WParam;
         end;
     end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.tvMainSelectionChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.tvMainSelectionChanged') else _udebug := nil;{$ENDIF}


  if tvMain.FocusedNode = nil then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  pcMain.ActivePageIndex := Integer(tvMain.FocusedNode.Data);
  if pcMain.ActivePage = tsMain then begin
    gbMainInfo.Caption := ' ' + rs(ParentNameEx, 'MainInfo') + ' ';
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.edNamePropertiesChange(Sender: TObject);
  var strTemp: string;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.edNamePropertiesChange') else _udebug := nil;{$ENDIF}


  if cbType.ItemIndex = 0
    then strTemp := rs(ParentNameEx, 'Svc') + ': '
    else strTemp := rs(ParentNameEx, 'SvcGroup') + ': ';
    
  strTemp := strTemp + edName.Text;
  panTitleBar.Caption := strTemp;
  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.edArtikulPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.edArtikulPropertiesChange') else _udebug := nil;{$ENDIF}

  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.edPricePropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.edPricePropertiesEditValueChanged') else _udebug := nil;{$ENDIF}

  if not edPrice.DroppedDown and not VarIsNull(edPrice.EditValue)
    then edPrice.Value := RoundToA(edPrice.EditValue, -2);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.lcbCurrencyPropertiesChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.lcbCurrencyPropertiesChange') else _udebug := nil;{$ENDIF}


  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.edMatGroupGetNodeImageIndex(Sender: TObject;
  ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType;
  var AIndex: TImageIndex);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.edMatGroupGetNodeImageIndex') else _udebug := nil;{$ENDIF}


  if ANode.Expanded
    then AIndex := 49
    else AIndex := 48;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.SetGrpID(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.SetGrpID') else _udebug := nil;{$ENDIF}


  inherited;

  if Value<>0 then begin
   rbtParent.Checked := True;
   lcbParent.Value := Value;
   lcbGrpParent.Value := Value;
  end
  else rbtNoParent.Checked := True;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.LoadMatGroup;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.LoadMatGroup') else _udebug := nil;{$ENDIF}


  cdsMatGroup.Open;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.edNotesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.edNotesKeyDown') else _udebug := nil;{$ENDIF}


  if ssCtrl in Shift then
   case Key of
    VK_UP:
      begin
        tvMain.FocusedNode := tvMain.FocusedNode.GetPrev;
      end;
    VK_DOWN:
      begin
        Perform(WM_NEXTDLGCTL, 0, 0);
      end;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.FormShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.FormShow') else _udebug := nil;{$ENDIF}


  inherited;
  btnGrp.ImageIndex := 23;
  btnGrpParent.ImageIndex := 23;
  try
    edName.SetFocus;
  except
  end;
  tvMainSelectionChanged(tvMain);
  edNamePropertiesChange(edName);
  FModified := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.lcbParentGetNodeImageIndex(Sender: TObject;
  ANode: TcxTreeListNode; AIndexType: TcxTreeListImageIndexType;
  var AIndex: TImageIndex);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.lcbParentGetNodeImageIndex') else _udebug := nil;{$ENDIF}


  if ANode.Expanded then AIndex := 49
   else AIndex := 48;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.FormKeyDown') else _udebug := nil;{$ENDIF}


  inherited;
//

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.edNameKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.edNameKeyDown') else _udebug := nil;{$ENDIF}


  if ssCtrl in Shift then
   case Key of
     VK_DOWN: Perform(WM_NEXTDLGCTL, 0, 0);
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.lcbParentEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.lcbParentEnter') else _udebug := nil;{$ENDIF}


  FCurrRef := btnGrp;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.cbTypePropertiesChange(Sender: TObject);
  var
    AVis: Boolean;
    FNode: TcxTreeListNode;
    i: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.cbTypePropertiesChange') else _udebug := nil;{$ENDIF}


  AVis := cbType.ItemIndex = 0;
  lArtikul.Visible := AVis;
  btnCopyName.Visible := AVis;
  edArtikul.Visible := AVis;
  tvMainSelectionChanged(tvMain);
  if cbType.ItemIndex = 0
    then pcParent.ActivePage := tsMat
    else pcParent.ActivePage := tsGrp;
  edNamePropertiesChange(edName);
  if not Self.Visible then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.lcbParentPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.lcbParentPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}


  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.btnCopyNameClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.btnCopyNameClick') else _udebug := nil;{$ENDIF}


  if cbType.ItemIndex = 0 then edArtikul.Text := edName.Text;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.cdsParentAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.cdsParentAfterOpen') else _udebug := nil;{$ENDIF}


  lcbParent.Value := cdsParent.fieldbyname('svcid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.rbtParentClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.rbtParentClick') else _udebug := nil;{$ENDIF}


  lGrpParent.Enabled := rbtParent.Checked;
  lcbGrpParent.Enabled := rbtParent.Checked;
  btnGrpParent.Enabled := rbtParent.Checked and cbType.Enabled;

  if rbtParent.Checked
    then lcbGrpParent.EditingText := OldGrp
    else begin
      lcbGrpParent.Properties.OnEditValueChanged := nil;
      lcbGrpParent.EditingText := EmptyStr;
      lcbGrpParent.Properties.OnEditValueChanged := lcbGrpParentPropertiesEditValueChanged;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.lcbGrpParentPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.lcbGrpParentPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}


  OldGrp := lcbGrpParent.EditingText;
  DataModified(Sender);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.SetCanModify(const Value: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.SetCanModify') else _udebug := nil;{$ENDIF}


  FCanModify := Value;

  btnOk.Left := btnApply.Left;
  aApply.Enabled := Value;
  aApply.Visible := Value;
  aCancel.Visible := Value;

  cbType.Enabled := Value;
  edName.Enabled := Value;
  edArtikul.Enabled := Value;
  lcbParent.Enabled := Value;
  rbtParent.Enabled := Value;
  btnGrp.Enabled := Value;
  lGrpParent.Enabled := Value;
  lcbGrpParent.Enabled := Value;
  rbtNoParent.Enabled := Value;
  lcbMeasure.Enabled := Value;
  btnMeasures.Enabled := Value;
  chbIsTrans.Enabled := Value;
  chbIsNormed.Enabled := Value;
  sbKurs.Enabled := Value;
  edNorm.Enabled := Value;

  btnCopyName.Enabled := Value;
  edPrice.Enabled := Value;
  lcbCurrency.Enabled := Value;
  edNotes.Enabled := Value;


  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.WMLayoutChanged(var M: TMessage);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.WMLayoutChanged') else _udebug := nil;{$ENDIF}


//  edMCMat.SetLng;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.cdsCurrencyBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.cdsCurrencyBeforeOpen') else _udebug := nil;{$ENDIF}


  cdsCurrency.Params.ParamByName('ondate').AsDateTime := Self.OnDate;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.lcbCurrencyPropertiesEditValueChanged(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.lcbCurrencyPropertiesEditValueChanged') else _udebug := nil;{$ENDIF}


  cdsCurrency.Locate('currid', cdsCurrency.FieldByName('currid').AsInteger, []);
  sbKurs.Caption := cdsCurrency.FieldByName('onvalue').AsString;
  sbKurs.Enabled := lcbCurrency.KeyValue <> BaseCurrID;
  sbKurs.Repaint;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.sbKursClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.sbKursClick') else _udebug := nil;{$ENDIF}


  with TfrmCurrencyEdit.Create(nil) do
  try
    MainHandle := Self.Handle;
    ParentNameEx := 'fmCurrency';
    OnDate := Self.OnDate;
    ID := Self.lcbCurrency.KeyValue;
    if Self.cdsCurrency.FieldByName('ondate').AsDateTime = Self.OnDate
      then SubID := Self.cdsCurrency.FieldByName('rateid').AsInteger;
    SetFocusToRate := True;
    SetInactive;
    if ShowModal = mrOk then begin
      DSRefresh(Self.cdsCurrency, 'currid', 0);
      lcbCurrency.KeyValue := Self.cdsCurrency.FieldByName('currid').AsInteger;
    end;
  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.lcbParentExit(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.lcbParentExit') else _udebug := nil;{$ENDIF}


  FCurrRef := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.btnGrpMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.btnGrpMouseDown') else _udebug := nil;{$ENDIF}


  FCurrRef := btnGrp;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.btnGrpMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.btnGrpMouseUp') else _udebug := nil;{$ENDIF}


  FCurrRef := nil;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.chbIsNormedClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.chbIsNormedClick') else _udebug := nil;{$ENDIF}


  lNorm.Visible := chbIsNormed.Checked;
  edNorm.Visible := chbIsNormed.Checked;

  if chbIsNormed.Checked
    then lPrice.Caption := rs(Self.ParentNameEx, 'NormPrice') + ':'
    else lPrice.Caption := rs(Self.ParentNameEx, 'Price') + ':';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.lcbMeasureEnter(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.lcbMeasureEnter') else _udebug := nil;{$ENDIF}


  FCurrRef := btnMeasures;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfrmEditServices.btnMeasuresMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmEditServices.btnMeasuresMouseDown') else _udebug := nil;{$ENDIF}


  FCurrRef := Sender as TControl;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;



initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('EditServices', @Debugging, DEBUG_group_ID);{$ENDIF}


finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
