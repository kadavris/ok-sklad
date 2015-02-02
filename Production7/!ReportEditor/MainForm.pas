unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls, ComCtrls, ImgList, Registry,
  xLngManager,
  FR_View, FR_Desgn, FR_Class, FR_Rich, FR_ChBox, FR_Cross, FR_RRect, FR_BarC, FR_Shape, FR_Chart,
  cxControls, cxContainer, cxTreeView, cxLookAndFeelPainters, cxButtons, cxEdit,
  cxDropDownEdit, cxImageComboBox, cxGroupBox, cxTextEdit, cxMaskEdit;

const
  langMax = 2;
  langNames: array [0 .. langMax] of String = ('English', 'Русский', 'Українська');
  langFolders: array [0 .. langMax] of String = ('ENG', 'RUS', 'UKR');

  regRepEdit: String = '\SOFTWARE\OPERATOR\REPEDIT\';

type
  TfrmMainForm = class(TForm)
    Panel1: TPanel;
    pmDocTree: TPopupMenu;
    miEdit1: TMenuItem;
    miCopyEdit1: TMenuItem;
    SaveDialog1: TSaveDialog;
    langMan: TxLngManager;
    frRichObject1: TfrRichObject;
    frChartObject1: TfrChartObject;
    frShapeObject1: TfrShapeObject;
    frBarCodeObject1: TfrBarCodeObject;
    frRoundRectObject1: TfrRoundRectObject;
    frCrossObject1: TfrCrossObject;
    frCheckBoxObject1: TfrCheckBoxObject;
    miRevert: TMenuItem;
    miRestoreOrig: TMenuItem;
    cxGroupBox1: TcxGroupBox;
    docTreeView: TcxTreeView;
    cbLangName: TcxImageComboBox;
    butLoad: TcxButton;
    butClose: TcxButton;
    OpenDialog1: TOpenDialog;
    ImageList1: TImageList;
    procedure switchLang;
    procedure InitRes;
    procedure docTreeViewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbLangNameChange(Sender: TObject);
    procedure docTreeViewDblClick(Sender: TObject);
    procedure miCopyEdit1Click(Sender: TObject);
    function getCustomReportsReg: TRegKeyInfo;
    procedure FormResize(Sender: TObject);
    procedure pmDocTreePopup(Sender: TObject);
    procedure miRevertClick(Sender: TObject);
    procedure miRestoreOrigClick(Sender: TObject);
    procedure butCloseClick(Sender: TObject);
    procedure butLoadClick(Sender: TObject);

  private
    function getSelRepPath(inMenu: Boolean = False): String;
    procedure restoreOldrep(from: Integer);
    procedure makeLangTree(lang: Cardinal);
  end;

var
  frmMainForm: TfrmMainForm;
  frDoc: TfrReport;
  RepPath: String;
  regCustomReps: String;
  selNode: TTreeNode;

//========================================================================
//========================================================================
//========================================================================
implementation

{$IFDEF UDEBUG}
var
  DEBUG_unit_ID: Integer; Debugging: Boolean; DEBUG_group_ID: String = '';
{$ENDIF}

{$R *.dfm}
//========================================================================
function getErrStr: String;
begin
  Result := SysErrorMessage(GetLastError);
end;

//========================================================================
function TfrmMainForm.getSelRepPath(inMenu: Boolean = False): String;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMainForm.getSelRepPath') else _udebug := nil;{$ENDIF}

  Result := '';
  if inMenu then begin // avoid fucking strange shit with selection clearing before the popup item executing
    if selNode.Data = nil then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

    Result := String(selNode.Data^)
  end
  else if docTreeView.Selected.Data = nil
       then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end
       else Result := String(docTreeView.Selected.Data^);

  Result := RepPath + langFolders[cbLangName.ItemIndex] + '\' + Result;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//========================================================================
procedure TfrmMainForm.switchLang;
  var
    s: String;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMainForm.switchLang') else _udebug := nil;{$ENDIF}

  try
    langMan.Active := False;
    langMan.Active := True;
    langMan.ActiveLngDesc := langFolders[cbLangName.ItemIndex];

  except
    ShowMessage('Unable to load language resource file! Exitting.');
    raise;
  end;

  s := 'FR_' + langFolders[cbLangName.ItemIndex] + '.DLL';

  try
    //frLocale := TfrLocale.Create;
    frLocale.LoadDll(s);

  except
    on e: Exception do ShowMessage('cannot localize FastReports engine as: ' + s);
  end;

  with langMan do begin // localizing
    miEdit1.Caption := GetRS('menus', 'miEdit');
    miCopyEdit1.Caption := GetRS('menus', 'miCopyEdit');
    miRevert.Caption := GetRS('menus', 'miRevert');
    miRestoreOrig.Caption := GetRS('menus', 'miRestoreOrig');

    butClose.Caption := GetRS('common', 'butClose');
    butLoad.Caption := GetRS('common', 'butLoad');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//========================================================================
procedure TfrmMainForm.InitRes;
  //{$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  //{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMainForm.InitRes') else _udebug := nil;{$ENDIF}

  langMan.CfgFile := ExtractFilePath(ParamStr(0)) + 'RE_LNG\lng.ini';

  //{$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//========================================================================
procedure TfrmMainForm.makeLangTree(lang: Cardinal);
  var
    i,l: Cardinal;
    nodes: array [0..9] of TTreeNode; // 9 level nesting should be good guess ;)
    rki: TRegKeyInfo;

  procedure addChild(fname, descr: String);
    var s: ^String;
  begin
    if fname = '' then Exit;
    new(s);
    s^ := fname;
    nodes[l + 1] := docTreeView.Items.AddChildObject(nodes[l], descr,  s );
  end;

  procedure addSibling(descr: String);
  begin
    nodes[l] := docTreeView.Items.AddObject(nodes[l], descr, nil );
  end;

  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMainForm.makeLangTree') else _udebug := nil;{$ENDIF}

  docTreeView.Items.BeginUpdate;
  docTreeView.Items.Clear;
  rki := getCustomReportsReg;

  l := 0; nodes[0] := nil;
  case lang of
    0: begin // en
         addSibling('Main slips');
           //addChild('Waybill_Invoice.frf', '????Memorandum');
           addChild('ReturnOut.frf', 'Return to supplier');
           addChild('Waybill_Mov.frf', 'Goods movement slip');
           addChild('Waybill_In.frf', 'Goods receipt slip');
           addChild('Waybill_Out.frf', 'Goods dispatch slip');

         addSibling('Invoices');
           addChild('WaybillAcc_Out.frf', 'Invoice');

         addSibling('Orders');
           addChild('Order_Out.frf', 'Client''''s order');
           addChild('Order_In.frf', 'Order to supplier');

         addSibling('Miscellaneous documents');
           addChild('WarrantyDoc.frf', 'Warranty slip');
           addChild('PriceLabel.frf', 'Price tags');
           addChild('PriceLabelBC.frf', 'Price tags w barcodes');
           addChild('Rep_DocRegistry.frf', 'Documents registry');

         addSibling('Warehouse/point of sales');
           addChild('Waybill_Rest.frf', 'Initial stock balance');
           addChild('Inv.frf', 'Inventory');

         addSibling('Reports on goods');
           addChild('WriteOff.frf', 'Write off');
           addChild('Rep1.frf', 'Short income and sales report');
           addChild('Rep25.frf', 'Detailed goods income report');
           addChild('RepMatRest.frf', 'Goods remains report');
           addChild('grpmove.frf', 'Goods category movement report');
           addChild('matmove.frf', 'Single product movement report');
           addChild('Rep10.frf', 'Turnover register');
           addChild('Rep10_1.frf', 'Turnover register for goods category');
           addChild('RepMatSelRank.frf', 'Sales rating');
           addChild('RepMatMinRest.frf', 'Minimal goods remains report');
           addChild('RepMatTurnPeriod.frf', 'Product turnover (w/o sums)');
           addChild('RepMatTurnPeriod2.frf', 'Product turnover');
           addChild('RepMatSelSvc.frf', 'Short service sales summary');

         addSibling('Financial reports');
           addChild('RepMatSelPr.frf', 'Report on profitable sales');
           addChild('DynSel.frf', 'Sales dynamics');
           addChild('RepExpenses.frf', 'Expenses report');
           addChild('ReplPRvsEx.frf', 'Financial results summary');
           addChild('Rep21.frf', 'Short financial results report');
           addChild('RepMoney.frf', 'Funds turnover report');

         addSibling('Business partners');
           addChild('Rep3.frf', 'Sales by clients / Income by suppliers');
           addChild('Rep3_1.frf', 'Same as above with emphasize on profit');
           addChild('Kreditors.frf', 'Creditors list');
           addChild('Debitors.frf', 'Debtors list');
           addChild('RepKAAllBOnly.frf', 'Business partner balance report');
           addChild('RepKAAll.frf', 'Report on business partner');

         addSibling('Contracts');
           addChild('Rep24.frf', 'Short report on contract');

         addSibling('Internal reports');
           addChild('RepPersons.frf', 'Employees performance report');

         if rki.NumSubKeys > 0 then addSibling('* Ваши отчёты *');
       end; // english

      //-------------------------------------------------------------------------
    // русский
    1: begin
         addSibling('Накладные');
           addChild('Waybill_Invoice.frf', 'Счёт-фактура');
           addChild('ReturnOut.frf', 'Возвратная накладная');
           addChild('Waybill_Mov.frf', 'Накладная перемещения');
           addChild('Waybill_In.frf', 'Приходная накладная');
           addChild('Waybill_Out.frf', 'Расходная накладная');

         addSibling('Счета');
           addChild('WaybillAcc_Out.frf', 'Счёт на предоплату');

         addSibling('Заказы');
           addChild('Order_Out.frf', 'Заказ от клиента');
           addChild('Order_In.frf', 'Заказ поставщику');

         addSibling('Документы');
           addChild('WarrantyDoc.frf', 'Гарантийный документ');
           addChild('PriceLabel.frf', 'Ценники');
           addChild('PriceLabelBC.frf', 'Ценники со штрих-кодом');
           addChild('Rep_DocRegistry.frf', 'Реестр документов');

         addSibling('Склад');
           addChild('Waybill_Rest.frf', 'Акт ввода остатков товара');
           addChild('Inv.frf', 'Акт инвентаризации');

         addSibling('Товарные отчёты');
           addChild('WriteOff.frf', 'Акт списания');
           addChild('Rep1.frf', 'Краткий отчёт о приходе и продажах товаров');
           addChild('Rep25.frf', 'Развернутый отчет о приходе');
           addChild('RepMatRest.frf', 'Ведомость материальных остатков');
           addChild('grpmove.frf', 'Отчёт о движении группы товара');
           addChild('matmove.frf', 'Отчёт о движении товара');
           addChild('Rep10.frf', 'Оборотная ведомость');
           addChild('Rep10_1.frf', 'Оборотная ведомость по группам товаров');
           addChild('RepMatSelRank.frf', 'Рейтинг продаж');
           addChild('RepMatMinRest.frf', 'Отчёт о минимальных остатках');
           addChild('RepMatTurnPeriod.frf', 'Оборотная ведомость товара (без сумм)');
           addChild('RepMatTurnPeriod2.frf', 'Оборотная ведомость товара');
           addChild('RepMatSelSvc.frf', 'Краткий отчёт о продажах услуг');

         addSibling('Финансовые отчёты');
           addChild('RepMatSelPr.frf', 'Отчёт о продажах с прибылью');
           addChild('DynSel.frf', 'Динамика продаж');
           addChild('RepExpenses.frf', 'Отчёт о затратах');
           addChild('ReplPRvsEx.frf', 'Отчёт о финансовом результате');
           addChild('Rep21.frf', 'Краткий отчёт о финансовом результате');
           addChild('RepMoney.frf', 'Отчёт об оборотах денежных средств');

         addSibling('Отчёты по контрагентам');
           addChild('Rep3.frf', 'Отчёт о продажах по клиентам/приходе по поставщикам');
           addChild('Rep3_1.frf', '--"-- с показом прибыли');
           addChild('Kreditors.frf', 'Список кредиторов (мы должны)');
           addChild('Debitors.frf', 'Список дебеторов (нам должны)');
           addChild('RepKAAllBOnly.frf', 'Баланс по контрагенту');
           addChild('RepKAAll.frf', 'Отчёт по контрагенту');

         addSibling('Отчёты по договорам');
           addChild('Rep24.frf', 'Краткий отчёт по договору');

         addSibling('Служебные отчёты');
           addChild('RepPersons.frf', 'Отчёт о работе служащих');

         if rki.NumSubKeys > 0 then addSibling('* Ваши отчёты *');
       end; // russian

      //-------------------------------------------------------------------------
      // ukrainian
     2: begin
         addSibling('Накладні');
           addChild('ReturnOut.frf', 'Повернення');
           addChild('Waybill_Mov.frf', 'Переміщення');
           addChild('Waybill_In.frf', 'Прибуткова');
           addChild('Waybill_Out.frf', 'Видаткова');

         addSibling('Рахунки');
           addChild('WaybillAcc_Out.frf', 'Передоплата');

         addSibling('Замовлення');
           addChild('Order_Out.frf', 'Від клієнту');
           addChild('Order_In.frf', 'Постачальнику');

         addSibling('Документи');
           addChild('WarrantyDoc.frf', 'Гарантійний документ');
           addChild('PriceLabel.frf', 'Цiнники');
           addChild('PriceLabelBC.frf', 'Цiнники зi штрих-кодом');
           addChild('Rep_DocRegistry.frf', 'Реєстр документiв');

         addSibling('Складскi звiти');
           addChild('Rep1.frf', 'Скорочений звiт про прибуток товарiв');
           addChild('Rep25.frf', 'Розгорнутий звiт про прибуток товарiв');
           addChild('Rep1.frf', 'Скорочений звiт про продаж товарiв');
           addChild('RepMatRest.frf', 'Вiдомiсть матерiальних залишкiв');
           addChild('grpmove.frf', 'Звiт про рух групи товару');
           addChild('matmove.frf', 'Звiт про рух товару');
           addChild('Rep10.frf', 'Оборотна вiдомiсть');
           addChild('Rep10_1.frf', 'Оборотна вiдомiсть по группах');
           addChild('RepMatSelRank.frf', 'Рейтинг продажу');
           addChild('RepMatMinRest.frf', 'Звiт про мiнiмальнi залишки');
           addChild('RepMatTurnPeriod.frf', 'Оборотна вiдомiсть товару (без сум)');
           addChild('RepMatTurnPeriod2.frf', 'Оборотна вiдомiсть товару');
           addChild('RepMatSelSvc.frf', 'Скорочений звiт про продаж послуг');

         addSibling('Фiнансовi звiти');
           addChild('RepMatSelPr.frf', 'Звiт про продаж з прибутком');
           addChild('DynSel.frf', 'Динамiка продажу');
           addChild('RepExpenses.frf', 'Звiт про затрати');
           addChild('ReplPRvsEx.frf', 'Звiт про фiнансовий результат');
           addChild('Rep21.frf', 'Скорочений звiт про фiнансовий результат');
           addChild('REpMoney.frf', 'Звiт про обiг грошових засобiв');

         addSibling('Звiти по контрагентам');
           addChild('Rep3.frf', 'Звiт про продаж по клiєнтам/по постачальникам');
           addChild('Rep3_1.frf', '--"-- з показом прибутку');
           addChild('Kreditors.frf', 'Список кредиторiв (ми заборгували)');
           addChild('Debitors.frf', 'Список дебеторiв (нам заборгували)');
           addChild('RepKAAllBOnly.frf', 'Баланс по контрагенту');
           addChild('RepKAAll.frf', 'Звiт по контрагенту');

         addSibling('Звiти по договорах');
           addChild('Rep24.frf', 'Скорочений звiт за договором');

         addSibling('Службовi звiти');
           addChild('RepPersons.frf', 'Звiт про роботу службовцiв');

         if rki.NumSubKeys > 0 then addSibling('* Ваші звіти *');
     end; // ukrainian
  end; //case

// adding custom reports here ------------------------------------------------
  if rki.NumSubKeys > 0 then
    with TRegistry.Create do begin
      RootKey := HKEY_LOCAL_MACHINE;
      for i := 1 to rki.NumSubKeys do begin
        OpenKey(regCustomReps + IntToStr(i), False);
        addChild(ReadString('File'), ReadString('Name'));
        CloseKey;
      end;
      Free;
    end;

  docTreeView.Items.EndUpdate;
  docTreeView.FullExpand;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//========================================================================
procedure TfrmMainForm.FormCreate(Sender: TObject);
  var
   i: Cardinal;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMainForm.FormCreate') else _udebug := nil;{$ENDIF}

  cxGRoupBox1.Caption := '   Copyright © Irystyle, 2003-' + IntToStr(CurrentYear) + '   ';

  InitRes;
  regCustomReps := regRepEdit + 'CUSTOMREP';

  frDoc := TfrReport.Create(nil);

  cbLangName.Tag := 0;
  cbLangName.Properties.Items.Clear;
  cbLangName.Properties.BeginUpdate;
  for i := 0 to High(Langnames) do begin
    cbLangName.Properties.Items.Add;
    cbLangName.Properties.Items[i].Description := Langnames[i];
    cbLangName.Properties.Items[i].Value := i;
  end;
  cbLangName.Properties.EndUpdate;

  with TRegistry.Create do begin
    RootKey := HKEY_CURRENT_USER;
    
    if OpenKey(regRepEdit + 'lang', False) then begin // last lang used
      cbLangName.ItemIndex := ReadInteger('lang');
      CloseKey;
    end
    else cbLangName.ItemIndex := 0;
    cbLangName.Tag := 1;
    cbLangNameChange(Sender);

    if not OpenKey('\SOFTWARE\OPERATOR\SKLAD', False) then begin
      ShowMessage(langMan.GetRs('errors', 'noMainApp'));
      Halt;
    end;

    RepPath := ReadString('ClientPath');
    if RepPath = '' then begin
      ShowMessage(langMan.GetRs('errors', 'noMainApp'));
      Halt;
    end;

    RepPath := RepPath + '\Reports\';

    CloseKey;

    if OpenKey(regRepEdit + 'Form', False) then begin // last mainform shape
      frmMainForm.Width := ReadInteger('Width');
      frmMainForm.Height := ReadInteger('Height');
      CloseKey;
    end;
    Free;
  end;

  if ParamCount > 0 
  then 
    try
      frDoc.LoadFromFile(ParamStr(1));
      frDoc.DesignReport;

    except
      on e: Exception do Application.MessageBox(PChar(langMan.GetRS('errors', 'errorTitle')), PChar(langMan.GetRS('errors', 'loadreport') + ': ' + e.Message));
    end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//========================================================================
procedure TfrmMainForm.docTreeViewClick(Sender: TObject);
  (*
  var
    s: String;
    m: tmodalresult;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
  *)
begin
  (*{$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMainForm.docTreeViewClick') else _udebug := nil;{$ENDIF}

  frDoc.Clear;
  with docTreeView do begin
    if Selected.Data = nil then Exit;
    if not frDoc.LoadFromFile(getSelRepPath) then Exit;
    frDoc.MDIPreview := False;
    frDoc.ModalPreview := False;
    m := frDoc.DesignReport;
    if m = mrOK then exit;
    frDoc.ShowReport;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
  *)
end;

//========================================================================
procedure TfrmMainForm.docTreeViewDblClick(Sender: TObject);
  var
    s: AnsiString;
    m:  tmodalresult;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMainForm.docTreeViewDblClick') else _udebug := nil;{$ENDIF}

  frDoc.Clear;
  with docTreeView do begin
    if Selected.Data = nil then begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

    s := getSelRepPath;
    if not FileExists(s + '.orig') then begin
      if LongBool(0) = CopyFile(Pchar(s), PChar(s + '.orig'), False)
        then Application.MessageBox(PChar(s + langMan.GetRS('errors', 'saveorig')), PChar(getErrStr));
    end;

    if FileExists(s + '.bak') then DeleteFile(s + '.bak');

    if LongBool(0) = CopyFile(PChar(s), PChar(s + '.bak'), False)
      then Application.MessageBox(PChar(s + langMan.GetRS('errors', 'savebak')), PChar(getErrStr));

    if not frDoc.LoadFromFile(s) then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

    {frDoc.MDIPreview := False;
    frDoc.ModalPreview := False;
    }

    m := frDoc.DesignReport;

    if m = mrOK then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} exit; end;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//========================================================================
procedure TfrmMainForm.cbLangNameChange(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
   if (cbLangName.Tag = 0) or (cbLangName.ItemIndex = -1) then Exit;

  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMainForm.cbLangNameChange') else _udebug := nil;{$ENDIF}

   with TRegistry.Create do begin
     RootKey := HKEY_LOCAL_MACHINE;
     OpenKey(regRepEdit + 'lang', True);
     WriteInteger('lang', cbLangName.ItemIndex);
     CloseKey;
     Free;
   end;

   makeLangTree(cbLangName.ItemIndex);
   switchLang;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//========================================================================
function TfrmMainForm.getCustomReportsReg: TRegKeyInfo;
  var
    rki: TRegKeyInfo;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMainForm.getCustomReportsReg') else _udebug := nil;{$ENDIF}

  with TRegistry.Create do begin
    RootKey := HKEY_LOCAL_MACHINE;
    OpenKey(regCustomReps, True);
    GetKeyInfo(rki);
    Result := rki;
    CloseKey;
    Free;
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//========================================================================
procedure TfrmMainForm.miCopyEdit1Click(Sender: TObject);
  var
    s, rname: String;
    //rki: TRegKeyInfo;
    i: Cardinal;
    {$IFDEF UDEBUG}_udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMainForm.miCopyEdit1Click') else _udebug := nil;{$ENDIF}

  with docTreeView do begin
    if Selected.HasChildren then   begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

    s := String(Selected.Data^);
  end;

  SaveDialog1.InitialDir := RepPath + langFolders[cbLangName.ItemIndex];

  if (not saveDialog1.Execute) or (LongBool(0) = CopyFile(PChar(s), PChar(SaveDialog1.FileName), False))
  then begin
    {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
    Exit;
  end;

  s := SaveDialog1.FileName;

  repeat
    rname := InputBox(langMan.GetRS('common', 'GetRepNameCap'), langMan.GetRS('common', 'GetRepNamePrompt'), s);
  until rname <> '';

  with TRegistry.Create do begin
    RootKey := HKEY_LOCAL_MACHINE;
    i := 1;
    while OpenKey(regCustomReps + IntToStr(i), False) do begin // search for free name
      inc(i); CloseKey;
    end;
    OpenKey(regCustomReps + IntToStr(i), True);
    WriteString('File', s);
    WriteString('Name', rname);
    CloseKey;
    Free;
  end;

  frDoc.Title := s;
  frDoc.LoadFromFile(RepPath + langFolders[cbLangName.ItemIndex] + s);
  frDoc.DesignReport;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//========================================================================
procedure TfrmMainForm.FormResize(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMainForm.FormResize') else _udebug := nil;{$ENDIF}

  with TRegistry.Create do begin
    RootKey := HKEY_LOCAL_MACHINE;
    if OpenKey(regRepEdit + 'Form', True) then begin
      WriteInteger('Width', frmMainForm.Width);
      WriteInteger('Height', frmMainForm.Height);
      CloseKey;
    end;
    Free;
  end;

  Realign;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//========================================================================
procedure TfrmMainForm.pmDocTreePopup(Sender: TObject);
  var
    s: String;
    i: Integer;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMainForm.pmDocTreePopup') else _udebug := nil;{$ENDIF}

  with docTreeView do begin
    selNode := Selected;
    if Selected.Data = nil then begin
      for i := 0 to pmDocTree.Items.Count-1 do
        pmDocTree.Items[i].Enabled := False;
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
    end;

    s := getSelRepPath;
    for i := 0 to pmDocTree.Items.Count-1 do
      pmDocTree.Items[i].Enabled := pmDocTree.Items[i].Tag = 0;

    miRestoreOrig.Enabled := FileExists(s + '.orig');
    miRevert.Enabled := FileExists(s + '.bak');
  end;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//========================================================================
procedure TfrmMainForm.restoreOldrep(from: Integer);
  var s,ext: String;
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMainForm.restoreOldrep') else _udebug := nil;{$ENDIF}


  if from = 0 then ext := '.bak'
  else ext := '.orig';

  s := getSelRepPath(True);
  if LongBool(0) = CopyFile(PChar(s + ext), PChar(s), False) then begin
     Application.MessageBox(PChar(s + langMan.GetRS('errors', 'CopyFile')), PChar(getErrStr));
       begin {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF} Exit; end;

  end;
  DeleteFile(s + ext);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//========================================================================
procedure TfrmMainForm.miRevertClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMainForm.miRevertClick') else _udebug := nil;{$ENDIF}


  if IDYes = Application.MessageBox(PChar(langMan.GetRS('common', 'wantRevert')), PChar(selNode.Text), MB_YESNO)
  then restoreOldRep(0);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//========================================================================
procedure TfrmMainForm.miRestoreOrigClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMainForm.miRestoreOrigClick') else _udebug := nil;{$ENDIF}

  if IDYes = Application.MessageBox(PChar(langMan.GetRS('common', 'wantRestOrig')), PChar(selNode.Text), MB_YESNO)
  then restoreOldRep(1);

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//========================================================================
procedure TfrmMainForm.butCloseClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMainForm.butCloseClick') else _udebug := nil;{$ENDIF}

  Application.Terminate;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//========================================================================
procedure TfrmMainForm.butLoadClick(Sender: TObject);
  {$IFDEF UDEBUG}var _udebug: Tdebug;{$ENDIF}
begin
  {$IFDEF UDEBUG}if Debugging then _udebug := Tdebug.Create(debugLevelHigh, DEBUG_unit_ID, 'TfrmMainForm.butLoadClick') else _udebug := nil;{$ENDIF}

  with OpenDialog1.Create(nil) do
    if Execute then begin
      try
        frDoc.LoadFromFile(FileName);

      except
        Application.MessageBox(PChar(langMan.GetRS('errors', 'errorTitle')), PChar(langMan.GetRS('errors', 'loadreport')));
        Free;
        {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
        Exit;
      end;
    end;

  frDoc.DesignReport;

  {$IFDEF UDEBUG}if _udebug <> nil then _udebug.Destroy;{$ENDIF}
end;

//========================================================================
initialization
  {$IFDEF UDEBUG}
  Debugging := False;
  DEBUG_unit_ID := debugRegisterUnit('MainForm', @Debugging, DEBUG_group_ID);
  {$ENDIF}

//========================================================================
finalization
  //{$IFDEF UDEBUG}debugUnregisterUnit(DEBUG_unit_ID);{$ENDIF}

end.
