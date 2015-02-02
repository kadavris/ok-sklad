{$I ok_sklad.inc}
unit fKAgent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseFrame, Menus, ActnList, dxTL6, ssDataSource, DB, DBClient,
  ssClientDataSet, TB2Item, dxDBTLCl6, dxGrClms6, dxDBCtrl6, dxDBGrid6,
  dxCntner6, ssLabel, StdCtrls, cxPC, cxControls, ssBevel,
  ssBaseConst, ssMemDS, ExtCtrls, ssBaseDlg,
  cxMaskEdit, cxDropDownEdit, cxCheckComboBox, Buttons, cxTextEdit,
  cxContainer, cxEdit, cxMemo, cxGroupBox,
  ssGroupBox, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxDBEdit,
  cxListView, cxCheckListBox, dxExEdtr6, dxInspRw, dxInspct,
  ComCtrls, Tabs, ssBaseTypes, XLSExportComp, ssXLSExport, 
  ssDBGrid, dxExEdtr, dxCntner;

type
  TfmKAgent = class(TssBaseFrame)
    aAccProps: TAction;
    aAccRefresh: TAction;
    aDelAcc: TAction;
    aMakeDefEnt: TAction;
    aMoveTo: TAction;
    aNewAcc: TAction;
    aOrdersInfo: TAction;
    aPersonDel: TAction;
    aPersonNew: TAction;
    aPersonProps: TAction;
    aPersonRefresh: TAction;
    aRecalc: TAction;
    aRecalcAll: TAction;
    aToEnt: TAction;
    aToPersons: TAction;
    aToWorkers: TAction;
    aTurnover: TAction;
    bvlBottomLine: TssBevel;
    cdsAcc: TssClientDataSet;
    cdsFind: TssClientDataSet;
    cdsPersons: TssClientDataSet;
    cdsView: TssClientDataSet;
    colAccount: TdxDBGridColumn;
    colAccType: TdxDBGridColumn;
    colAddress: TdxDBGridColumn;
    colArchived: TdxDBGridColumn;
    colBankName: TdxDBGridColumn;
    colBirthDate: TdxDBGridColumn;
    colCEMail: TdxDBGridColumn;
    colCertNum: TdxDBGridColumn;
    colCity: TdxDBGridColumn;
    colCJob: TdxDBGridColumn;
    colCName: TdxDBGridColumn;
    colCountry: TdxDBGridColumn;
    colCPhone: TdxDBGridColumn;
    colDef: TdxDBGridColumn;
    colDistrict: TdxDBGridColumn;
    colEMail: TdxDBGridColumn;
    colFax: TdxDBGridColumn;
    colFullName: TdxDBGridColumn;
    colID: TdxDBGridColumn;
    colImg: TdxDBGridImageColumn;
    colINN: TdxDBGridColumn;
    colJob: TdxDBGridColumn;
    colJobType: TdxDBGridColumn;
    colKPP: TdxDBGridColumn;
    colKType: TdxDBGridColumn;
    colMFO: TdxDBGridColumn;
    colName: TdxDBGridColumn;
    colNotes: TdxDBGridColumn;
    colOKPO: TdxDBGridColumn;
    colPhone: TdxDBGridColumn;
    colPhoneEx: TdxDBGridColumn;
    colPJobType: TdxDBGridColumn;
    colPostIndex: TdxDBGridColumn;
    colSaldo: TdxDBGridColumn;
    colWWW: TdxDBGridColumn;
    dbgKAgent: TssDBGrid;
    grdAcc: TssDBGrid;
    grdContact: TssDBGrid;
    inspAddr: TdxInspector;
    inspDoc: TdxInspector;
    inspMain: TdxInspector;
    irCertNum: TdxInspectorTextRow;
    irDoc: TdxInspectorTextRow;
    irDocDate: TdxInspectorTextRow;
    irDocNum: TdxInspectorTextRow;
    irDocSeries: TdxInspectorTextRow;
    irDocWhoProduce: TdxInspectorTextMemoRow;
    irEMail: TdxInspectorTextHyperLinkRow;
    irFactAddr: TdxInspectorTextMemoRow;
    irFax: TdxInspectorTextRow;
    irFullName: TdxInspectorTextMemoRow;
    irINN: TdxInspectorTextRow;
    irKAKind: TdxInspectorTextRow;
    irKPP: TdxInspectorTextRow;
    irKType: TdxInspectorTextRow;
    irLegalAddr: TdxInspectorTextMemoRow;
    irName: TdxInspectorTextRow;
    irNDSPayer: TdxInspectorTextRow;
    irOKPO: TdxInspectorTextRow;
    irPhone: TdxInspectorTextRow;
    irPriceType: TdxInspectorTextRow;
    irWWW: TdxInspectorTextHyperLinkRow;
    memNotes: TcxMemo;
    PageAccounts: TcxTabSheet;
    PageMain: TcxTabSheet;
    PagePersons: TcxTabSheet;
    panBottom: TPanel;
    panGrid: TPanel;
    panMain: TPanel;
    pcEditKAgent: TcxPageControl;
    pmAcc: TTBPopupMenu;
    pmPersons: TTBPopupMenu;
    srcAcc: TDataSource;
    srcPersons: TDataSource;
    srcView: TssDataSource;
    ssBevel10: TssBevel;
    ssBevel11: TssBevel;
    ssBevel13: TssBevel;
    ssBevel14: TssBevel;
    ssBevel15: TssBevel;
    ssBevel16: TssBevel;
    ssBevel17: TssBevel;
    ssBevel18: TssBevel;
    ssBevel19: TssBevel;
    ssBevel1: TssBevel;
    ssBevel20: TssBevel;
    ssBevel21: TssBevel;
    ssBevel22: TssBevel;
    ssBevel23: TssBevel;
    ssBevel24: TssBevel;
    ssBevel25: TssBevel;
    ssBevel26: TssBevel;
    ssBevel27: TssBevel;
    ssBevel28: TssBevel;
    ssBevel29: TssBevel;
    ssBevel2: TssBevel;
    ssBevel3: TssBevel;
    ssBevel4: TssBevel;
    ssBevel5: TssBevel;
    ssBevel6: TssBevel;
    ssBevel7: TssBevel;
    ssBevel8: TssBevel;
    ssBevel9: TssBevel;
    TBItem10: TTBItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    TBItem13: TTBItem;
    TBItem14: TTBItem;
    TBItem15: TTBItem;
    TBItem16: TTBItem;
    TBItem17: TTBItem;
    TBItem18: TTBItem;
    TBItem19: TTBItem;
    TBItem20: TTBItem;
    TBItem21: TTBItem;
    TBItem22: TTBItem;
    TBItem23: TTBItem;
    TBItem24: TTBItem;
    TBItem25: TTBItem;
    TBItem26: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    TBSeparatorItem10: TTBSeparatorItem;
    TBSeparatorItem11: TTBSeparatorItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBSeparatorItem5: TTBSeparatorItem;
    TBSeparatorItem6: TTBSeparatorItem;
    TBSeparatorItem7: TTBSeparatorItem;
    TBSeparatorItem8: TTBSeparatorItem;
    TBSeparatorItem9: TTBSeparatorItem;
    TBSubmenuItem1: TTBSubmenuItem;
    tsContacts: TcxTabSheet;
    tsDoc: TcxTabSheet;
    tsNotes: TcxTabSheet;
    xlsExpFile: TXLSExportFile;
    xlsExport: TssXLSExport;
    panFooter: TPanel;
    lCount: TLabel;
    stCount: TssBevel;
    ssBevel12: TssBevel;
    ssBevel30: TssBevel;

    procedure aAccRefreshExecute(Sender: TObject);
    procedure aColParamsExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure aDelAccExecute(Sender: TObject);
    procedure aMakeDefEntExecute(Sender: TObject);
    procedure aMoveToExecute(Sender: TObject);
    procedure aNewAccExecute(Sender: TObject);
    procedure aOrdersInfoExecute(Sender: TObject);
    procedure aPersonDelExecute(Sender: TObject);
    procedure aPersonNewExecute(Sender: TObject);
    procedure aPersonRefreshExecute(Sender: TObject);
    procedure aRecalcAllExecute(Sender: TObject);
    procedure aRecalcExecute(Sender: TObject);
    procedure aSelectAllExecute(Sender: TObject);
    procedure aShowArchivedExecute(Sender: TObject);
    procedure aToEntExecute(Sender: TObject);
    procedure aTurnoverExecute(Sender: TObject);
    procedure btnEMailClick(Sender: TObject);
    procedure btnWWWClick(Sender: TObject);
    procedure cdsAccBeforeOpen(DataSet: TDataSet);
    procedure cdsPersonsBeforeOpen(DataSet: TDataSet);
    procedure cdsViewAfterOpen(DataSet: TDataSet);
    procedure cdsViewBeforeOpen(DataSet: TDataSet);
    procedure colAccTypeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colCJobGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colCNameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colJobGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colPhoneGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure colSaldoGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
    procedure dbgKAgentCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure dbgKAgentDblClick(Sender: TObject);
    procedure dbgKAgentGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
    procedure dbgKAgentKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgKAgentNeedAdjust(Sender: TObject);
    procedure dbgKAgentSelectedCountChange(Sender: TObject);
    procedure FrameResize(Sender: TObject);
    procedure grdAccDblClick(Sender: TObject);
    procedure grdContactCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure grdContactDblClick(Sender: TObject);
    procedure inspDocDrawCaption(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
    procedure inspDocDrawValue(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
    procedure irPriceTypeDrawValue(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
    procedure pcEditKAgentChange(Sender: TObject);
    procedure pmMainPopup(Sender: TObject);
    procedure srcViewDataChange(Sender: TObject; Field: TField);
    procedure tbsMainChange(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
    procedure tsNotesShow(Sender: TObject);
    procedure xlsExportProgress(AIndex: Integer; const AText: String);
    procedure xlsExportSaveField(ANode: TdxTreeListNode; AIndex: Integer; XLSCell: TCell);

  private
    FKType: integer;
    procedure SetKType(const Value: integer);

  private
    procedure RefreshDetail;
    procedure RefreshDoc;
    procedure RecalcSaldo(ACount: Integer);
    property KType: integer read FKType write SetKType;
    function GetKASaldo(AID: Integer; AOnDate: TDateTime): Extended;

  protected
    function GetIDForUpdate: integer; override;
    procedure SetCurrentID(const Value: Integer); override;
    function GetSubID(EdClass: TBaseDlg; AAction: TActionType): integer; override;
    procedure SetOnDate(const Value: TDateTime); override;

  public
    procedure DoArchive; override;
    procedure UpdateActionList; override;
    procedure DoOpen(AParam: Variant); override;
    procedure DoClose; override;
    procedure DoDelete; override;
    procedure DoRefresh(const AID: integer; AParam: integer = 0); override;
    procedure SetCaptions; override;
    procedure DoShow; override;
    procedure DoExcel(Grid: TdxDBGrid); override;
    procedure DoSomething; override;
    procedure DoFind(const AFName, AStr: string; ALocateType: TLocateType; AFwd: Boolean = True); override;
    procedure DoAfterFind(AParam: Integer = 0); override;
    procedure DoSetFocus; override;
    procedure SelectRecord(AHandle: HWND); override;
    procedure LoadSkin; override;
    procedure NotifyChanged; override;
  end;

var
  fmKAgent: TfmKAgent;

//==============================================================================================
//==============================================================================================
//==============================================================================================
implementation

uses
  EditKAgent, ClientData, prFun, prConst, ShellAPI, prTypes, ssStrUtil,
  EditKAAccount, ssDateUtils, EditKAPersons, ssCallbackConst, KATurnover,
  Progress, fMessageDlg, Export, XLSFormat, ssFun, OrdersInfo, Udebug, xLngDefs;

var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';

{$R *.dfm}

const
     _ID_ = 'KAID';

//==============================================================================================
procedure TfmKAgent.DoClose;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.DoClose') else _udebug := nil;{$ENDIF}

  cdsView.Close;
  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.DoDelete;
  var
    i: Integer;
    FIgnore, FResetDef, FEntsChanged: Boolean;
    FErr: string;
    FKAID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.DoDelete') else _udebug := nil;{$ENDIF}

  try //finally
    if (dbgKAgent.SelectedCount = 0)
       or ((dbgKAgent.SelectedCount = 1) and (mrYes <> ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo])))
       or ((dbgKAgent.SelectedCount > 1) and (mrYes <> ssMessageDlg(Format(rs('Common', 'DelConfirmEx'), [dbgKAgent.SelectedCount]), ssmtWarning, [ssmbYes, ssmbNo])))
    then Exit;

    FIgnore := False;
    FEntsChanged := False;

    with newDataSet do
      try //finally
        FResetDef := False;
        ProviderName := 'pKA_Del';
        FetchParams;
        Application.ProcessMessages;

        fProgress.Show;
        fProgress.Caption := rs('Common', 'Deleting');
        fProgress.UpDate;
        fProgress.pbMain.Max := dbgKAgent.SelectedCount;

        for i := 0 to dbgKAgent.SelectedCount - 1 do begin
          fProgress.lText.Caption := dbgKAgent.SelectedNodes[i].Values[colName.Index];
          Application.ProcessMessages;

          try // except
            if (VarToInt(dbgKAgent.SelectedNodes[i].Values[colDef.Index]) = 1)
               and (VarToInt(dbgKAgent.SelectedNodes[i].Values[colKType.Index]) = 3)
            then FResetDef := True;

            if (VarToInt(dbgKAgent.SelectedNodes[i].Values[colKType.Index]) = 3)
              then FEntsChanged := True;

            TrStart;
            if DelToRecycleBin then begin
              if not AddToRecycleBin(dmData.SConnection, Self.ClassName, dbgKAgent.SelectedNodes[i].Values[colID.Index], dbgKAgent.SelectedNodes[i].Values[colName.Index],false, Self.FunID) then begin
                ssMessageDlg(rs('Common', 'ErrorInsToRecycleBin'), ssmtError, [ssmbOk]);
                raise Exception.Create('');
              end;
            end
            else begin
              Params.ParamByName('kaid').AsInteger := dbgKAgent.SelectedNodes[i].Values[colID.Index];
              Execute;
            end;

            if not TrCommit(False) then raise Exception.Create(TrError);

          except
            on e: Exception do begin
              if not FIgnore then begin
                if pos('FOREIGN KEY', e.Message) > 0 then begin // this KA is used somewhere
                  ssMessageDlg(rs(Self.Name, 'CantDelRefdBP'), ssmtError, [ssmbOk]);
                  TrRollback;
                end
                else if dbgKAgent.SelectedCount = 1 then begin
                  ssMessageDlg(rs('Common', 'NoDelete') + e.Message, ssmtError, [ssmbOk]);
                  TrRollback;
                end
                else begin
                  case ssMessageDlg(Format(rs('Common', 'NoDeleteEx'), [dbgKAgent.SelectedNodes[i].Values[colName.Index]]), ssmtError, [ssmbYes, ssmbYesForAll, ssmbNo])
                  of
                    mrYes: ;
                    mrYesToAll: FIgnore := True;
                    else Exit;
                  end;
                end;
              end; //if not FIgnore
            end; // on e: Exception
          end; // try except

          fProgress.pbMain.StepIt;
        end; // for i := 0 to dbgKAgent.SelectedCount - 1

        //if RefreshAllClients then dmData.SConnection.AppServer.q_Add(CA_REFRESH, CA_KAGENTS);

        if FResetDef then begin
          ProviderName := 'pKAgent_GetEnt';
          Params.Clear;
          Open;
          if not IsEmpty then begin
            FKAID := Fields[0].AsInteger;
            Close;
            ProviderName := 'pKAgent_SetDef';
            FetchParams;
            Params.ParamByName('kaid').AsInteger := FKAID;
            Params.ParamByName('def').AsInteger := 1;
            Execute;
          end
          else FKAID := 0;

          CurrEnt.KAID := FKAID;

          if FEntsChanged then RefreshEnts;
        end; // if FResetDef

        with dbgKAgent do
          if SelectedCount > 1
          then cdsView.First
          else if (FocusedNode.Index = Count - 1) and (FocusedNode.Index > 0)
               then cdsView.Locate(_ID_, FocusedNode.GetPrev.Values[ColumnByFieldName(KeyField).Index], [])
               else cdsView.Locate(_ID_, FocusedNode.GetNext.Values[ColumnByFieldName(KeyField).Index], []);

        aRefresh.Execute;
        UpdateActionList;

      finally
        Free;
      end;

    inherited;

  finally
    fProgress.Hide;
    Application.ProcessMessages;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  end;
end;

//==============================================================================================
procedure TfmKAgent.DoOpen(AParam: Variant);
  var
    i: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.DoOpen') else _udebug := nil;{$ENDIF}

  pcEditKAgent.ActivePage := PageMain;

  case Tag of
    100: RefType := rtPersons;
    101: RefType := rtEnt;
    else RefType := rtKAgent;
  end;
  EditingClass := TfrmEditKAgent;

  KType := 0;
  //  cdsView.Open;
  inherited;
  //  srcViewDataChange(srcView, nil);

  if not LoadExpParams
    then with ExportList do
      for i := 0 to dbgKAgent.ColumnCount - 1 do
        if dbgKAgent.Columns[i].Tag = 1
          then AddObject(dbgKAgent.Columns[i].Name, pointer(1));

  with dbgKAgent do
    if FocusedNode <> nil
      then FocusedNode.Selected := True;

  colJob.Visible := KType = 3;
  colPhone.Visible := not colJob.Visible;
  colSaldo.Visible := ShowBallance and (KType <> 4);
  FrameResize(Self);
  CanRefresh := True;
  {$IFDEF CBL}aOrdersInfo.Visible := False; {$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.SetCaptions;
  var
    FTitle: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.SetCaptions') else _udebug := nil;{$ENDIF}

  with LangMan do begin
    Self.Caption := GetRS(Self.Name, 'TitleKAgent');

    if KType = 0
      then colName.Caption := GetRS(Self.Name, 'NameF')
      else colName.Caption := GetRS(Self.Name, 'FIO');

    FTitle := Self.Caption;

    case CountryRules.AR of
      accRul_RU: colMFO.Caption := rs(Self.Name, 'BIC');
      accRul_UA: colMFO.Caption := rs(Self.Name, 'MFO');
      else
        begin
          colMFO.Caption := rs(Self.Name, 'ABA');
          irInn.Visible := False;
          irOKPO.Visible := False;
          irKPP.Visible := False;
        end;
    end;

    aAccProps.Caption := GetRS('Common', 'Properties');
    aAccRefresh.Caption := GetRS('Common', 'Refresh');
    aDelAcc.Caption := GetRS('Common', 'Del');
    aMakeDefEnt.Caption := GetRS(Self.Name, 'MakeEntDef');
    aNewAcc.Caption := GetRS('Common', 'Add');
    aOrdersInfo.Caption := GetRS('fmOrders', 'OrdersInfo');
    aPersonDel.Caption := GetRS('Common', 'Del');
    aPersonNew.Caption := GetRS('Common', 'Add');
    aPersonProps.Caption := GetRS('Common', 'Properties');
    aPersonRefresh.Caption := GetRS('Common', 'Refresh');
    aRecalc.Caption := GetRS(Self.Name, 'Recalc');
    aRecalcAll.Caption := GetRS(Self.Name, 'RecalcAll');
    aSelectAll.Caption := GetRS('Common', 'SelectAll');
    aShowArchived.Caption := GetRS('Common', 'ShowArchived');
    aTurnover.Caption := GetRS(Self.Name, 'KATurnover');

    colAccount.Caption := GetRS(Self.Name, 'Account');
    colAccType.Caption := GetRS(Self.Name, 'AccountType');
    colAddress.Caption := GetRS(Self.Name, 'Address');
    colBankName.Caption := GetRS(Self.Name, 'AccountBank');
    colBirthDate.Caption := GetRS(Self.Name, 'BirthDate');
    colCEMail.Caption := GetRS(Self.Name, 'EMail');
    colCertNum.Caption := GetRS(Self.Name, 'CertNum');
    colCity.Caption := GetRS(Self.Name, 'City');
    colCJob.Caption := GetRS(Self.Name, 'PersonPost');
    colCName.Caption := GetRS(Self.Name, 'PersonName');
    colCountry.Caption := GetRS(Self.Name, 'Country');
    colCPhone.Caption := GetRS(Self.Name, 'Phone');
    colDistrict.Caption := GetRS(Self.Name, 'District');
    colEMail.Caption := GetRS(Self.Name, 'EMail');
    colFax.Caption := GetRS(Self.Name, 'Fax');
    colFullName.Caption := GetRS(Self.Name, 'FullName');
    colImg.Caption := '';
    colINN.Caption := GetRS(Self.Name, 'INN');
    colJob.Caption := GetRS(Self.Name, 'Job');
    colKPP.Caption := GetRS(Self.Name, 'KPP');
    colNotes.Caption := GetRS('fmKAgent', 'Notes');
    colOKPO.Caption := GetRS(Self.Name, 'OKPO');
    colPhone.Caption := GetRS(Self.Name, 'Type');
    colPhoneEx.Caption := GetRS(Self.Name, 'Phone');
    colPostIndex.Caption := GetRS(Self.Name, 'PostIndex');
    colSaldo.Caption := GetRS(Self.Name, 'Ballance');
    colWWW.Caption := GetRS(Self.Name, 'WWW');

    irCertNum.Caption := GetRS(Self.Name, 'CertNum');
    irDoc.Caption := GetRS(Self.Name, 'DocName');
    irDocDate.Caption := GetRS(Self.Name, 'DocDate');
    irDocNum.Caption := GetRS(Self.Name, 'DocNum');
    irDocSeries.Caption := GetRS(Self.Name, 'DocSeries');
    irDocWhoProduce.Caption := GetRS(Self.Name, 'DocWhoProduce');
    irEmail.Caption := GetRS(Self.Name, 'EMail');
    irFactAddr.Caption := GetRS(Self.Name, 'FactAddr');
    irFax.Caption := GetRS(Self.Name, 'Fax');
    irInn.Caption := GetRS(Self.Name, 'INN');
    irKAKind.Caption := GetRS(Self.Name, 'KAKind');
    irKPP.Caption := GetRS(Self.Name, 'KPP');
    irKType.Caption := GetRS(Self.Name, 'Type');
    irLegalAddr.Caption := GetRS(Self.Name, 'LegalAddr');
    irNDSPayer.Caption := GetRS(Self.Name, 'NDSPayer');
    irOKPO.Caption := GetRS(Self.Name, 'OKPO');
    irPhone.Caption := GetRS(Self.Name, 'Phone');
    irPriceType.Caption := GetRS('fmWaybill', 'PriceType');
    irWWW.Caption := GetRS(Self.Name, 'WWW');

    lCount.Caption := GetRS(Self.Name, 'KACount') + ':';

    PageAccounts.Caption := GetRS(Self.Name, 'PageAccounts');
    PageMain.Caption := GetRS(Self.Name, 'PageMain');
    PagePersons.Caption := GetRS(Self.Name, 'PagePersons');
    tsContacts.Caption := GetRS(Self.Name, 'PageContact');
    tsDoc.Caption := GetRS(Self.Name, 'Doc');
    tsNotes.Caption := GetRS(Self.Name, 'Notes') + ' ';

{lDocName.Caption := rs_DocName;
    lDocNum.Caption := rs_DocNum;
    lDocDate.Caption := rs_DocDate;
    lDocSeries.Caption := rs_DocSeries;
    lDocWhoProduce.Caption := rs_DocWhoProduce;

    with tbsMain.Tabs do begin
      Clear;
      Add(rs_KAAll);
      Add(rs_KAEnt);
      Add(rs_KAPersons);
      Add(rs_KAWorkers);
    end;

    aMoveTo.Caption := rs_MoveTo;
    aToEnt.Caption := rs_KAEnt;
    aToPersons.Caption := rs_KAPersons;
    aToWorkers.Caption := rs_KAWorkers;
    }

    SendMessage(ParentHandle, WM_SETPARENTCAPTION, integer(@FTitle), 0);

    FindList.Clear;
    FindList.AddObject(rs(Self.Name, 'NameD') + ' (' + rs(Self.Name, 'FIO') + ');' + 'name', pointer(1));
  end;

  inherited;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.dbgKAgentDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.dbgKAgentDblClick') else _udebug := nil;{$ENDIF}

  if dbgKAgent.Count > 0 then
    if ModalView then begin
      if cdsView.FieldByName('archived').AsInteger <> 1 then begin
        FCurrentID := cdsView.fieldbyname('kaid').AsInteger;
        SendMessage(ParentHandle, WM_SELECTITEM, 0, 0);
      end
      else FCurrentID := -1;
    end
    else DoProperties;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.ActionListUpdate') else _udebug := nil;{$ENDIF}

  inherited;

  aNewAcc.Enabled := not cdsView.IsEmpty;
  aAccProps.Enabled := aNewAcc.Enabled and not cdsAcc.IsEmpty;
  aDelAcc.Enabled := aAccProps.Enabled;

  aPersonNew.Enabled := not cdsView.IsEmpty;
  aPersonProps.Enabled := aPersonNew.Enabled and not cdsPersons.IsEmpty;
  aPersonDel.Enabled := aPersonProps.Enabled;

  aMoveTo.Enabled := Self.Tag<>100;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.UpdateActionList;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.UpdateActionList') else _udebug := nil;{$ENDIF}

  inherited;

  {$IFDEF LIMITED}
    limited := cdsView.Active and (cdsView.recordCount > limitBusinessPartnersCount);
  {$ELSE}
    limited := False;
  {$ENDIF}

  aNew.Enabled := not limited;
  aPatternInsert.Enabled := not limited;
  aProperties.Enabled := not cdsView.IsEmpty and (dbgKAgent.SelectedCount = 1);
  aDel.Enabled := not cdsView.IsEmpty;
  aDynamic.Enabled := False;
  aMoveTo.Enabled := aProperties.Enabled;
  aToEnt.Enabled := aMoveTo.Enabled;
  aToPersons.Enabled := aMoveTo.Enabled;
  aToWorkers.Enabled := aMoveTo.Enabled;
  aMakeDefEnt.Enabled := not cdsView.IsEmpty;
  aTurnover.Enabled := not cdsView.IsEmpty;
  aRecalc.Enabled := not cdsView.IsEmpty;
  aRecalcAll.Enabled := not cdsView.IsEmpty;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.DoRefresh(const AID: integer; AParam: integer = 0);
  var
     FKType_: integer;
     FID_: integer;
     FLastIndex: Integer;
     {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.DoRefresh') else _udebug := nil;{$ENDIF}

  FCurrentID := -1;
  FLastIndex := dbgKAgent.TopIndex;
  cdsView.DisableControls;

  case AParam of
    0: DSRefresh(cdsView, _ID_, AID);

    1: begin
         KType := AID-1;
         DSRefresh(cdsView, _ID_, 0);
       end;

    2: DSRefresh(cdsAcc, 'accid', AID);

    4: DSRefresh(cdsPersons, 'personid', AID);

    3: begin
        FID_ := PKAgentInfo(pointer(AID))^.ID;
        FKType_ := PKAgentInfo(pointer(AID))^.KType;

        if (KType<>0) and (KType-1<>FKType_) then begin
          KType := FKType_+1;
          SendMessage(ParentHandle, WM_SETTREEITEM, KType+1, 0);
        end;

        DSRefresh(cdsView, _ID_, FID_);
        dbgKAgent.SetFocus;
       end;
  end;
  dbgKAgent.TopIndex := FLastIndex;
  cdsView.EnableControls;

  dbgKAgent.ClearSelection;

  if dbgKAgent.FocusedNode <> nil then dbgKAgent.FocusedNode.Selected := True;

  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmKAgent.GetIDForUpdate: integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.GetIDForUpdate') else _udebug := nil;{$ENDIF}

  Result := cdsView.fieldbyname(_ID_).AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.srcViewDataChange(Sender: TObject; Field: TField);
  var
     i: integer;
     {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.srcViewDataChange') else _udebug := nil;{$ENDIF}

  if cdsView.FieldByName('archived').AsInteger <> 1
    then FCurrentID := cdsView.fieldbyname(_ID_).AsInteger
    else FCurrentID := -1;

  tsDoc.TabVisible := cdsView.FieldByName('ktype').AsInteger>0;

  if not panBottom.Visible then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  with cdsView do begin
    if cdsView.FieldByName('ktype').AsInteger in [0, 3] then begin
      irName.Caption := rs(Self.Name, 'Name');
      irFullName.Caption := rs(Self.Name, 'FullName');
      irFullName.Text := FieldByName('fullname').AsString;
    end
    else begin
      irName.Caption := rs(Self.Name, 'FIO');
      irFullName.Caption := rs(Self.Name, 'BirthDate');
      if FieldByName('birthdate').IsNull
        then irFullName.Text := ''
        else irFullName.Text := FieldByName('birthdate').AsString;
    end;

    if not colJob.Visible then begin
      case cdsView.FieldByName('kakind').AsInteger of
        0: case cdsView.FieldByName('ktype').AsInteger of
             2: irKAKind.Text := rs(Self.Name, 'Worker');
             3: irKAKind.Text := rs(Self.Name, 'OwnEnt');
           end;

        1: irKAKind.Text := rs(Self.Name, 'Client');

        2: irKAKind.Text := rs(Self.Name, 'SupplierClient');
      end
    end
    else irKAKind.Text := cdsView.FieldByName('job').AsString;

    case cdsView.FieldByName('ktype').AsInteger of
      0: irKType.Text := rs(Self.Name, 'KAEnt');
      1: irKType.Text := rs(Self.Name, 'KAPersons');
      2: irKType.Text := rs(Self.Name, 'KAWorkers');
      3: irKType.Text := rs(Self.Name, 'Ents');
    end;

    irName.Text := FieldByName('name').AsString;
    irOKPO.Text := fieldbyname('okpo').AsString;
    irKPP.Text := fieldbyname('kpp').AsString;
    irINN.Text := fieldbyname('inn').AsString;
    irCertNum.Text := fieldbyname('certnum').AsString;

    if FieldByName('ndspayer').AsInteger = 1
      then irNDSPayer.Text := rs('Common', 'Yes')
      else irNDSPayer.Text := rs('Common', 'No');

    {irCountry.Text := FieldByName('country').AsString;
    irDistrict.Text := FieldByName('district').AsString;
    irRegion.Text := FieldByName('city').AsString;
    irPostIndex.Text := FieldByName('postindex').AsString;
    }

    irPhone.Text := FieldByName('phone').AsString;
    irFax.Text := FieldByName('fax').AsString;
    irWWW.Text := FieldByName('www').AsString;
    irEMail.Text := FieldByName('email').AsString;
    irLegalAddr.Text := GetKAAddrEx(dmData.SConnection, FieldByName('kaid').AsInteger, 0);
    irFactAddr.Text := GetKAAddrEx(dmData.SConnection, FieldByName('kaid').AsInteger, 1);

    if FieldByName('ptypeid').IsNull
      then irPriceType.Text := ''
      else with newDataSet do
        try
          ProviderName := 'pPriceTypes_Get';
          FetchParams;
          Params.ParamByName('ptypeid').AsInteger := cdsView.FieldByName('ptypeid').AsInteger;
          Open;
          irPriceType.Text := FieldByName('name').AsString;
          Close;

        finally
          Free;
        end;

    memNotes.Text := FieldByName('notes').AsString;

    for i := 0 to pcEditKAgent.PageCount-1 do pcEditKAgent.Pages[i].Tag := 1;

    RefreshDetail;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.FrameResize(Sender: TObject);
  var
    AStyle: integer;
    Offset, W, i: integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.FrameResize') else _udebug := nil;{$ENDIF}

  inherited;
  dbgKAgentNeedAdjust(dbgKAgent);
  AdjustGrid(grdAcc, colAccount);

  AStyle := GetWindowLong(grdContact.Handle, GWL_STYLE);

  if AStyle and WS_VSCROLL = WS_VSCROLL
    then Offset := 19
    else Offset := 2;

  colCName.Width := grdContact.Width-colCJob.Width-colCEMail.Width-Offset-colCPhone.Width;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.RefreshDetail;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.RefreshDetail') else _udebug := nil;{$ENDIF}

   with pcEditKAgent do
     if ActivePage.Tag=1 then begin
       if ActivePage = PageAccounts then DSRefresh(cdsAcc, 'accid', 0)
       else if ActivePage = PagePersons then DSRefresh(cdsPersons, 'personid', 0)
       else if ActivePage = tsDoc then RefreshDoc;

       ActivePage.Tag := 0;
     end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.pcEditKAgentChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.pcEditKAgentChange') else _udebug := nil;{$ENDIF}

  RefreshDetail;
  pcEditKAgent.Anchors := pcEditKAgent.Anchors+[akTop];
  bvlBottomLine.Visible := panBottom.Visible and (pcEditKAgent.ActivePage<>PageAccounts) and (pcEditKAgent.ActivePage<>PagePersons);
  pcEditKAgent.Anchors := pcEditKAgent.Anchors-[akTop];

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.cdsAccBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.cdsAccBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsAcc.Params.ParamByName('kaid').AsInteger := cdsView.fieldbyname('kaid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.cdsPersonsBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.cdsPersonsBeforeOpen') else _udebug := nil;{$ENDIF}

  cdsPersons.Params.ParamByName('kaid').AsInteger := cdsView.fieldbyname('kaid').AsInteger;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.aNewAccExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.aNewAccExecute') else _udebug := nil;{$ENDIF}

  with TfrmEditKAAccount.Create(nil) do
   try
     MainHandle := Self.Handle;
     ParentNameEx := Self.Name;
     PID := cdsView.fieldbyname('kaid').AsInteger;
     lKAName.Caption := cdsView.fieldbyname('name').AsString;

     if (Sender as TComponent).Tag = 1
       then ID := cdsAcc.fieldbyname('accid').AsInteger
       else ID := 0;

    ShowModal;

   finally
     Free;
   end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.grdAccDblClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.grdAccDblClick') else _udebug := nil;{$ENDIF}

  if grdAcc.Count>0 then aAccProps.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.aAccRefreshExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.aAccRefreshExecute') else _udebug := nil;{$ENDIF}

  DSRefresh(cdsAcc, 'accid', 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.aDelAccExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.aDelAccExecute') else _udebug := nil;{$ENDIF}

  if mrYes <> ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo]) then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  with newDataSet do
    try
      TrStart;

      try
        ProviderName := 'pAgentAccount_DelByID';
        FetchParams;
        Params.ParamByName('accid').AsInteger := cdsAcc.fieldbyname('accid').AsInteger;
        Execute;
        TrCommit;
        DSRefresh(cdsAcc, 'accid', 0);
        UpdateActionList;

      except
        on e:exception do begin
          TrRollback;
          ssMessageDlg(rs('Common', 'NoDelete')+#10#13+e.Message, ssmtError, [ssmbOk]);
        end;
      end;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.DoSomething;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.DoSomething') else _udebug := nil;{$ENDIF}

  inherited;

  //bvlGridBottom.Visible := False;
  panBottom.Visible := False;
  //bvlBottomLine.Visible := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.SetCurrentID(const Value: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.SetCurrentID') else _udebug := nil;{$ENDIF}

  inherited;

  cdsView.Locate(_ID_, Value, []);
  dbgKAgent.ClearSelection;
  if dbgKAgent.FocusedNode <> nil then dbgKAgent.FocusedNode.Selected := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.SetKType(const Value: integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.SetKType') else _udebug := nil;{$ENDIF}

  FKType := Value;
  if Value < 2
    then colName.Caption := rs(Self.Name, 'NameF')
    else colName.Caption := rs(Self.Name, 'FIO');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.cdsViewBeforeOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.cdsViewBeforeOpen') else _udebug := nil;{$ENDIF}

  colSaldo.Visible := ShowBallance and (KType <> 4);
  colJob.Visible := KType = 3;
  colJob.Width := 150;
  colPhone.Visible := not colJob.Visible;
  aMakeDefEnt.Visible := KType = 4;
  FrameResize(Self);

  if KType = 0
    then cdsView.Macros.ParamByName('m').AsString := ''
    else cdsView.Macros.ParamByName('m').AsString := ' and ka.ktype=' + IntToStr(KType - 1);

  cdsView.Params.ParamByName('ondate').AsDateTime := LastSecondInDay(Self.OnDate);
  cdsView.Params.ParamByName('showarchived').AsInteger := Integer(aShowArchived.Checked);
  //cdsView.Params.ParamByName('ondate2').AsDateTime := LastSecondInDay(Self.OnDate);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.tbsMainChange(Sender: TObject; NewTab: Integer; var AllowChange: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.tbsMainChange') else _udebug := nil;{$ENDIF}

  FKType := NewTab;
  aRefresh.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.cdsViewAfterOpen(DataSet: TDataSet);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.cdsViewAfterOpen') else _udebug := nil;{$ENDIF}

  FrameResize(Self);
  stCount.Caption := IntToStr(DataSet.RecordCount);
  NeedRefresh := False;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.DoShow;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.DoShow') else _udebug := nil;{$ENDIF}

  inherited;

  try
    if RefType in [rtPersons, rtEnt] then dbgKAgent.SetFocus;
  except
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.RefreshDoc;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.RefreshDoc') else _udebug := nil;{$ENDIF}

  Screen.Cursor := crSQLWait;
  with newDataSet do
    try
      ProviderName := 'pAgentDoc_Get';
      FetchParams;
      Params.ParamByName('kaid').AsInteger := cdsView.fieldbyname('kaid').AsInteger;
      Open;
      if not IsEmpty then begin
        irDoc.Text := fieldbyname('docname').AsString;
        irDocNum.Text := fieldbyname('docnum').AsString;
        irDocSeries.Text := fieldbyname('docseries').AsString;

        if not fieldbyname('docdate').IsNull
          then irDocDate.Text := ssDateToStr(fieldbyname('docdate').AsDateTime)
          else irDocDate.Text := '';

        irDocWhoProduce.Text := fieldbyname('docwhoproduce').AsString;
      end
      else begin
        irDoc.Text := '';
        irDocNum.Text := '';
        irDocSeries.Text := '';
        irDocDate.Text := '';
        irDocWhoProduce.Text := '';
      end;
      Close;

    finally
      Free;
      Screen.Cursor := crDefault;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.aMoveToExecute(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.aMoveToExecute') else _udebug := nil;{$ENDIF}

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmKAgent.aToEntExecute(Sender: TObject);
  (*var
     ktype_: integer;
     dtype, stype: string;
     {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.aToEntExecute') else _udebug := nil;{$ENDIF}

  ktype_ := (Sender as TComponent).Tag;
  case ktype_ of
    0: dtype := rs_KAEnt;
    1: dtype := rs_KAPersons;
    2: dtype := rs_KAWorkers;
  end;

  case cdsView.FieldByName('ktype').AsInteger of
    0: stype := rs_KAEnt;
    1: stype := rs_KAPersons;
    2: stype := rs_KAWorkers;
  end;

  if ssMessageDlg(Format(rs('Common', 'MoveConfirm'), [stype, dtype]), ssmtWarning, [ssmbYes, ssmbNo])<>mrYes then Exit;

  Application.ProcessMessages;
  if ktype_<>cdsView.FieldByName('ktype').AsInteger then begin
    with newDataSet do
     try
      ProviderName := 'pKAgent_Move';
      FetchParams;
      Params.ParamByName('kaid').AsInteger := cdsView.fieldbyname('kaid').AsInteger;
      Params.ParamByName('ktype').AsInteger := ktype_;
      Execute;
      if (KType>0) and (ktype_+1<>KType) then begin
       KType := ktype_+1;
       SendMessage(ParentHandle, WM_SETTREEITEM, KType+1, 0);
      end;
      aRefresh.Execute;
     finally
      Free;
     end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmKAgent.btnEMailClick(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.btnEMailClick') else _udebug := nil;{$ENDIF}

  if trim(txtEMail.Caption)<>'' then
   ShellExecute(Application.Handle, nil, PChar('mailto:'+Trim(txtEMail.Caption)),nil, nil, SW_SHOWNORMAL);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmKAgent.btnWWWClick(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.btnWWWClick') else _udebug := nil;{$ENDIF}

  if trim(txtWWW.Caption)<>'' then
   ShellExecute(Application.Handle, nil, PChar(Trim(txtWWW.Caption)),nil, nil, SW_SHOWNORMAL);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmKAgent.aPersonNewExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.aPersonNewExecute') else _udebug := nil;{$ENDIF}

  with TfrmEditKAPersons.Create(nil) do
    try
      MainHandle := Self.Handle;
      ParentNameEx := Self.Name;
      PID := cdsView.fieldbyname('kaid').AsInteger;
      lKAName.Caption := cdsView.fieldbyname('name').AsString;

      if (Sender as TComponent).Tag = 1
        then ID := cdsPersons.fieldbyname('personid').AsInteger
        else ID := 0;

      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.aPersonRefreshExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.aPersonRefreshExecute') else _udebug := nil;{$ENDIF}

  DSRefresh(cdsPersons, 'personid', 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.aPersonDelExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.aPersonDelExecute') else _udebug := nil;{$ENDIF}

  if ssMessageDlg(rs('Common', 'DelConfirm'), ssmtWarning, [ssmbYes, ssmbNo])<>mrYes then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

   with newDataSet do
     try
       TrStart;
       try
         ProviderName := 'pAgentPersons_DelByID';
         FetchParams;
         Params.ParamByName('personid').AsInteger := cdsPersons.fieldbyname('personid').AsInteger;
         Execute;
         TrCommit;
         DSRefresh(cdsPersons, 'personid', 0);
         UpdateActionList;

       except
         on e:exception do begin
           TrRollback;
           ssMessageDlg(rs('Common', 'NoDelete')+#10#13+e.Message, ssmtError, [ssmbOk]);
         end;
       end;

     finally
       Free;
     end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmKAgent.GetSubID(EdClass: TBaseDlg; AAction: TActionType): integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.GetSubID') else _udebug := nil;{$ENDIF}

  EdClass.Tag := Self.Tag;

  if AAction = atInsert then begin
    Result := KType;
    EdClass.DoCustom(Param);
  end
  else Result := -1; // maybe this is wrong number

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.tsNotesShow(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.tsNotesShow') else _udebug := nil;{$ENDIF}

  memNotes.Height := tsNotes.Height + 2;
  memNotes.Width := memNotes.Width - 20;
  tsNotes.Color := clWindow;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.dbgKAgentCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.dbgKAgentCustomDrawCell') else _udebug := nil;{$ENDIF}

  try
    if AColumn = colPhone then begin
      AAlignment := taLeftJustify;

      if not ASelected then AFont.Color := clBtnShadow;

      AFont.Name := 'Small Fonts';
      AFont.Size := 7;
    end;

    if odd(ANode.Index) and not ASelected then AColor := GridOddLinesColor;

    if (not VarIsNull(ANode.Values[colArchived.Index])) and (VarToInt(ANode.Values[colArchived.Index]) = 1) then begin
      AFont.Color := clBtnShadow;
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    if (not VarIsNull(ANode.Values[colDef.Index])) and (ANode.Values[colDef.Index] = 1) and not ASelected
      then AFont.Color := DefaultColor;

    if not VarIsNull(ANode.Values[colJobType.Index]) then
      if (ANode.Values[colJobType.Index] = '') or (ANode.Values[colJobType.Index] = 0)
        then AFont.Color := clBlue
        else AFont.Color := clGreen;

    if (AColumn = colSaldo) and (not VarIsNull(ANode.Values[colSaldo.Index]))// and (ANode.Values[colSaldo.Index] <> '')
    then begin
      if ssStrToFloat(ANode.Values[colSaldo.Index]) < 0 then AFont.Color := clRed
      else if ssStrToFloat(ANode.Values[colSaldo.Index]) > 0 then AFont.Color := clGreen;
    end

  except
    //on e: Exception do AColor := clYellow;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.DoFind(const AFName, AStr: string; ALocateType: TLocateType; AFwd: Boolean = True);
  var
    FNode: TdxTreeListNode;
    FChar: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.DoFind') else _udebug := nil;{$ENDIF}

  inherited;

  SearchInfo.Failed := False;
  if FindStr <> AStr then begin
    if FilterOnSearch then begin
     case ALocateType of
       ltSubstr: FChar := '%';
       else FChar := '';
     end;

     if AStr = ''
       then cdsView.Filter := ''
       else begin
         if cdsView.FieldByName(AFName) is TDateTimeField
           then cdsView.Filter := ''
           else cdsView.Filter := AFName + ' like ''' + FChar + AStr + '%''';
       end;
     cdsView.Filtered := True;
    end;
    //else cdsMain.Filtered := True;
    FindIndex := -1;
  end;

  FindStr := AStr;
  if AStr = '' then begin
    if FilterOnSearch then cdsView.Filtered := False;

    SearchInfo.PrevFindStr := '';
    DoRefreshFindParams;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  FNode := FindNode(dbgKAgent, AFName, AStr, ALocateType, FindIndex, AFwd);
  if FNode <> nil then begin
    FindIndex := FNode.Index;
    dbgKAgent.ClearSelection;
    dbgKAgent.TopIndex := FNode.AbsoluteIndex;
    dbgKAgent.FocusedAbsoluteIndex := FNode.AbsoluteIndex;
    FNode.Focused := True;

    if dbgKAgent.FocusedNode <> nil then dbgKAgent.FocusedNode.Selected := True;

    SearchInfo.PrevFindStr := FindStr;
   end
   else begin
     SearchInfo.Failed := True;

     if FilterOnSearch then cdsView.Filtered := False;

     SendMessage(ParentHandle, WM_SEARCHFAILED, 0, 0);
     //ssMessageDlg(rs('Common', 'FindError') + ', ' + rs('Common', 'DSEnd'), ssmtInformation, [ssmbOk]);
   end;
   DoRefreshFindParams;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.colImgGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.colImgGetText') else _udebug := nil;{$ENDIF}

  if AText = '2' then AText := '1' else
  if AText = '3' then AText := '0';

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.DoAfterFind(AParam: Integer = 0);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.DoAfterFind') else _udebug := nil;{$ENDIF}

  inherited;

  if ModalView
    then dbgKAgentDblClick(dbgKAgent)
    else dbgKAgent.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.SelectRecord(AHandle: HWND);
  var
    FKAInfo: TNewRecordInfo;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.SelectRecord') else _udebug := nil;{$ENDIF}

  inherited;

  with FKAInfo do begin
    ID := cdsView.FieldByName('kaid').AsInteger;
    Name := cdsView.FieldByName('Name').AsString;
  end;
  SendMessage(AHandle, WM_RECORDCHANGED, Integer(@FKAInfo), Integer(rtKAgent));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.aTurnoverExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.aTurnoverExecute') else _udebug := nil;{$ENDIF}

  if not ShowBallance then begin
    AccessDenied;
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  with TfrmKATurnover.Create(nil) do
    try
      ParentNameEx := Self.Name;
      OnDate := Self.OnDate;
      ID := Self.cdsView.FieldByName('kaid').AsInteger;
      ShowModal;

    finally
      Free;
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.aRecalcExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.aRecalcExecute') else _udebug := nil;{$ENDIF}

  RecalcSaldo(1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.colSaldoGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.colSaldoGetText') else _udebug := nil;{$ENDIF}

  if AText <> ''
    then AText := FormatFloat(MoneyDisplayFormat, StrToFloat(AText));

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.RecalcSaldo(ACount: Integer);
  var
    FCount, i: Integer;
    BM: TBookmark;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.RecalcSaldo') else _udebug := nil;{$ENDIF}

  if ACount = 1
    then FCount := ACount
    else FCount := cdsView.RecordCount;

  fProgress.Show;
  try
    fProgress.Caption := rs('fmKAgent', 'RecalcBallance') + '...';
    fProgress.UpDate;
    fProgress.pbMain.Max := FCount;

    cdsView.DisableControls;
    BM := cdsView.GetBookmark;

    with newDataSet do begin
      try
        ProviderName := 'pKA_RecalcSaldo';
        FetchParams;

        if ACount <> 1 then cdsView.First;

        for i := 1 to FCount do begin
          fProgress.lText.Caption := cdsView.FieldByName('name').AsString;
          Application.ProcessMessages;
          Params.ParamByName('kaid').AsInteger := cdsView.FieldByName('kaid').AsInteger;
          Params.ParamByName('ondate').AsDateTime := LastSecondInDay(Self.OnDate);
          Execute;
          fProgress.pbMain.StepIt;
          if ACount <> 1 then cdsView.Next;
        end;

      finally
        cdsView.GotoBookmark(BM);
        cdsView.FreeBookmark(BM);
        Free;
        cdsView.EnableControls;
      end;
      
      aRefresh.Execute;
    end;

  finally
    fProgress.Hide;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.aRecalcAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.aRecalcAllExecute') else _udebug := nil;{$ENDIF}

  RecalcSaldo(-1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.colPhoneGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.colPhoneGetText') else _udebug := nil;{$ENDIF}

  if AText='' then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  case StrToInt(AText) of
    0: case ANode.Values[colKType.Index] of
         2: AText := rs(Self.Name, 'Worker');
         3: AText := rs(Self.Name, 'OwnEnt');
         else AText := rs(Self.Name, 'Supplier');
       end;

    1: AText := rs(Self.Name, 'Client');

    2: AText := rs(Self.Name, 'SupplierClient');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.grdContactDblClick(Sender: TObject);
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.grdContactDblClick') else _udebug := nil;{$ENDIF}

  if grdContact.Count > 0 then aPersonProps.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//==============================================================================================
procedure TfmKAgent.dbgKAgentKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.dbgKAgentKeyDown') else _udebug := nil;{$ENDIF}

  if Key = 13 then dbgKAgentDblClick(dbgKAgent);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.dbgKAgentSelectedCountChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.dbgKAgentSelectedCountChange') else _udebug := nil;{$ENDIF}

  UpdateActionList;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.aSelectAllExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.aSelectAllExecute') else _udebug := nil;{$ENDIF}

  dbgKAgent.SelectAll;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.DoExcel(Grid: TdxDBGrid);
  var
    FShowExcel: Boolean;
    AFName: string;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.DoExcel') else _udebug := nil;{$ENDIF}

  inherited;

  with TfrmExport.Create(nil) do
    try
      if cdsFunc.Locate('classname', Self.ClassName, [])
        then FunID := cdsFunc.fieldbyname('funid').AsInteger
        else FunID := 0;

      grdExp := dbgKAgent;
      lName.Caption := Self.Caption;
      FList := ExportList;

      if ShowModal <> mrOk
        then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end
        else FShowExcel := chbShowExcel.Checked;

    finally
      Free;
    end;

  with TSaveDialog.Create(nil) do
    try
      DefaultExt := 'xls';
      Filter := 'Excel files (*.xls)|*.xls';
      if not Execute
        then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end
        else if FileName <> '' then AFName := FileName;

    finally
      Free;
    end;

  fProgress.Caption := rs('Common', 'Excel') + '...';
  fProgress.Show;
  fProgress.Update;
  fProgress.pbMain.Max := dbgKAgent.Count;
  fProgress.pbMain.Position := 0;

  try
    xlsExpFile.Workbook.Sheets.Clear;
    xlsExpFile.Workbook.Sheets.Add('Sheet1');
    xlsExport.ExportGrid(0, 0, 0, dbgKAgent, ExportList, AFName);

  finally
    fProgress.Hide;
  end;

  Application.ProcessMessages;

  if FShowExcel
    then ShellExecute(Application.Handle, nil, PChar(AFName), nil, nil, SW_SHOWNORMAL);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.xlsExportProgress(AIndex: Integer; const AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.xlsExportProgress') else _udebug := nil;{$ENDIF}

  fProgress.pbMain.StepIt;
  fProgress.lText.Caption := AText;
  Application.ProcessMessages;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.xlsExportSaveField(ANode: TdxTreeListNode; AIndex: Integer; XLSCell: TCell);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.xlsExportSaveField') else _udebug := nil;{$ENDIF}

  if AIndex = colPhone.Index then begin
    XLSCell.HAlign := TextAlignmentToXLSCellHAlignment(taLeftJustify);

    case StrToInt(ANode.Values[AIndex]) of
      0: if ANode.Values[colKType.Index] = 2
           then XLSCell.Value := rs(Self.Name, 'Worker')
           else XLSCell.Value := rs(Self.Name, 'Supplier');

      1: XLSCell.Value := rs(Self.Name, 'Client');

      2: XLSCell.Value := rs(Self.Name, 'SupplierClient');
    end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.DoSetFocus;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.DoSetFocus') else _udebug := nil;{$ENDIF}

  if dbgKAgent.Visible then dbgKAgent.SetFocus;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.inspDocDrawCaption(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.inspDocDrawCaption') else _udebug := nil;{$ENDIF}

  if UseGridOddColor and Odd(Sender.Node.AbsoluteIndex)
    then AColor := GridOddLinesColor
    else AColor := clWindow;

  AFont.Color := clWindowText;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.inspDocDrawValue(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.inspDocDrawValue') else _udebug := nil;{$ENDIF}

  if UseGridOddColor and Odd(Sender.Node.AbsoluteIndex)
    then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.grdContactCustomDrawCell(Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean; var AText: String; var AColor: TColor; AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.grdContactCustomDrawCell') else _udebug := nil;{$ENDIF}

  if Odd(ANode.Index) and not ASelected then AColor := GridOddLinesColor;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.colCNameGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.colCNameGetText') else _udebug := nil;{$ENDIF}

  AText := '    ' + AText;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.colAccTypeGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.colAccTypeGetText') else _udebug := nil;{$ENDIF}

  AText := '    ' + AText;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.SetOnDate(const Value: TDateTime);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.SetOnDate') else _udebug := nil;{$ENDIF}

  inherited;

  if CanRefresh then NeedRefresh := True;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.irPriceTypeDrawValue(Sender: TdxInspectorRow; ACanvas: TCanvas; ARect: TRect; var AText: String; AFont: TFont; var AColor: TColor; var ADone: Boolean);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.irPriceTypeDrawValue') else _udebug := nil;{$ENDIF}

  AFont.Color := clBlue;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.LoadSkin;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.LoadSkin') else _udebug := nil;{$ENDIF}

  inherited;

  panFooter.Color := clokFooter;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.colJobGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.colJobGetText') else _udebug := nil;{$ENDIF}

  if not VarIsNull(ANode.Values[colJobType.Index]) then begin
    if ANode.Values[colJobType.Index] = 0
      then AText := rs('fmKAgent', 'Director')
      else AText := rs('fmKAgent', 'Buh');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.aMakeDefEntExecute(Sender: TObject);
  var
    FKAID: Integer;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.aMakeDefEntExecute') else _udebug := nil;{$ENDIF}

  Application.ProcessMessages;
  Screen.Cursor := crSQLWait;

  try
    FKAID := cdsView.FieldByName('kaid').AsInteger;
    MakeDefaultEnt(dmData.SConnection, FKAID);
    aRefresh.Execute;

  finally
    Screen.Cursor := crDefault;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.colCJobGetText(Sender: TObject; ANode: TdxTreeListNode; var AText: String);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.colCJobGetText') else _udebug := nil;{$ENDIF}

  if not VarIsNull(ANode.Values[colPJobType.Index]) then
    case VarToInt(ANode.Values[colPJobType.Index]) of
      0: AText := rs('fmKAgent', 'Director');
      1: AText := rs('fmKAgent', 'Buh');
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.NotifyChanged;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.NotifyChanged') else _udebug := nil;{$ENDIF}

  if not JumpFromBuffer
    then frmMainForm.AddToBuffer(vtRefs, FunID, Self.Caption, ClassName, Tag, FCurrentID, 0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.dbgKAgentGetOptionsTitle(Sender: TObject; var AText: String; var ImgList: TImageList; var AIndex: Integer);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.dbgKAgentGetOptionsTitle') else _udebug := nil;{$ENDIF}

  AText := rs('fmKAgent', 'TitleKAgent');
  ImgList := dmData.Images;
  AIndex := II_KA;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.aColParamsExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.aColParamsExecute') else _udebug := nil;{$ENDIF}

  dbgKAgent.ShowColOptions;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.dbgKAgentNeedAdjust(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.dbgKAgentNeedAdjust') else _udebug := nil;{$ENDIF}

  dbgKAgent.Adjust(nil, [colImg]);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.DoArchive;
  var
    FArchive: Integer;
    i: Integer;
    FRemain: Extended;
    FSkip: Boolean;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.DoArchive') else _udebug := nil;{$ENDIF}

  FSkip := False;

  if cdsView.FieldByName('archived').AsInteger = 0 then begin
    if not (((dbgKAgent.SelectedCount = 1) and (mrYes = ssMessageDlg(rs('fmKAgent', 'ArchiveConfirm'), ssmtWarning, [ssmbYes, ssmbNo])))
       or
       ((dbgKAgent.SelectedCount > 1) and
       (mrYes = ssMessageDlg(Format(rs('fmKAgent', 'ArchiveConfirmEx'), [dbgKAgent.SelectedCount]), ssmtWarning, [ssmbYes, ssmbNo]))))
    then begin
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    FArchive := 1;
  end
  else begin
    if not (((dbgKAgent.SelectedCount = 1) and (mrYes = ssMessageDlg(rs('fmKAgent', 'UnArchiveConfirm'), ssmtWarning, [ssmbYes, ssmbNo])))
       or
       ((dbgKAgent.SelectedCount > 1) and (mrYes = ssMessageDlg(Format(rs('fmMaterials', 'UnArchiveConfirmEx'), [dbgKAgent.SelectedCount]), ssmtWarning, [ssmbYes, ssmbNo]) )))
    then begin
      {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
      Exit;
    end;

    FArchive := 0;
  end;

  if dbgKAgent.SelectedCount > 1 then fProgress.Show;

  with newDataSet do
  try
    ProviderName := 'pKAgent_Archive';
    FetchParams;
    Application.ProcessMessages;
    fProgress.Caption := rs('Common', 'Processing');
    fProgress.UpDate;
    fProgress.pbMain.Max := dbgKAgent.SelectedCount;
    Params.ParamByName('archived').AsInteger := FArchive;

    for i := 0 to dbgKAgent.SelectedCount - 1 do begin
      FRemain := GetKASaldo(dbgKAgent.SelectedNodes[i].Values[colID.Index], MaxDateTime);

      if (FRemain = 0) or (FArchive = 0) then begin
        Params.ParamByName('kaid').AsInteger := dbgKAgent.SelectedNodes[i].Values[colID.Index];
        Execute;
      end
      else begin
        if dbgKAgent.SelectedCount = 1 then begin
          ssMessageDlg(Format(rs('fmKAgent', 'ArchiveError'), [VarToStr(dbgKAgent.SelectedNodes[i].Values[colName.Index]),
            FormatFloat(MoneyDisplayFormat, FRemain)]), ssmtError, [ssmbOk]);
        end
        else if not FSkip then
          case ssMessageDlg(Format(rs('fmKAgent', 'ArchiveError'),
               [VarToStr(dbgKAgent.SelectedNodes[i].Values[colName.Index]),
               FormatFloat(MatDisplayFormat, FRemain)]) + ' ' + rs('fmKAgent', 'Cont'), ssmtError, [ssmbYes, ssmbNo, ssmbSkip]) of
             mrYes:;
             mrIgnore: FSkip := True;
             else Break;
          end;
      end;

      fProgress.lText.Caption := VarToStr(dbgKAgent.SelectedNodes[i].Values[colName.Index]);
      fProgress.pbMain.StepIt;
      Application.ProcessMessages;
    end;

    Application.ProcessMessages;
    aRefresh.Execute;
    RefreshFun('TfmWaybill', 0);
    RefreshFun('TfmPayDoc', 206);
    RefreshFun('TfmPayDoc', 207);
    RefreshFun('TfmWaybillOut', 0);
    RefreshFun('TfmAccOut', 0);
    RefreshFun('TfmWBReturnIn', 0);
    RefreshFun('TfmWBReturnOut', 0);
    RefreshFun('TfmOrders', 16);
    RefreshFun('TfmOrders', -16);
    UpdateActionList;

  finally
    if fProgress.Visible then fProgress.Hide;
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.pmMainPopup(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.pmMainPopup') else _udebug := nil;{$ENDIF}

  if cdsView.FieldByName('archived').AsInteger = 0
    then aArchive.Caption := rs('Common', 'MoveToArchive')
    else aArchive.Caption := rs('Common', 'ExtractFromArchive');

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.aShowArchivedExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.aShowArchivedExecute') else _udebug := nil;{$ENDIF}

  aRefresh.Execute;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
function TfmKAgent.GetKASaldo(AID: Integer; AOnDate: TDateTime): Extended;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.GetKASaldo') else _udebug := nil;{$ENDIF}

  Result := 0;
  with newDataSet do
  try
    ProviderName := 'pKA_GetSaldo';
    FetchParams;
    Params.ParamByName('kaid').AsInteger := AID;
    Params.ParamByName('ondate').AsDateTime := AOnDate;
    Open;
    Result := FieldByName('saldo').AsFloat;
    Close;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
procedure TfmKAgent.aOrdersInfoExecute(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfmKAgent.aOrdersInfoExecute') else _udebug := nil;{$ENDIF}

  with TfrmOrdersInfo.Create(nil) do
  try
    ParentNameEx := 'fmKAgent';
    KAID := Self.cdsView.FieldByName('kaid').AsInteger;
    OnDate := Self.OnDate;
    ShowModal;

  finally
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//==============================================================================================
initialization
  {$IFDEF UDEBUG}Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('fKAgent', @Debugging, DEBUG_group_ID);{$ENDIF}

//==============================================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
