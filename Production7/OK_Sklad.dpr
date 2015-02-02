{$I ok_sklad.inc}
program OK_Sklad;

{%ToDo 'OK_Sklad.todo'}

uses
  ControlResizeBugFix in '..\Libs7\ssPack\ControlResizeBugFix.pas',
  ComObj, DSIntf, MidConst,// midas.dll load
  Classes,
  DateUtils,
  dialogs,
  Forms,
  IniFiles,
  Math,
  StrUtils,
  SysUtils,
  Windows,
  prConst in 'prConst.pas',
  prFun in 'prFun.pas',
  ClientData in 'ClientData.pas',
  About in 'About\About.pas' {frmAbout},
  ActivationDlg in 'Internet\ActivationDlg.pas',
  apImgList in '..\Libs7\ap\apImgList.pas',
  apTree in 'Classes\apTree.pas',
  BankPersonsEdit in 'Banks\BankPersonsEdit.pas' {frmBankPersonsEdit},
  BaseFrame in 'ssBase\BaseFrame.pas' {ssBaseFrame: TFrame},
  BaseRef in 'ssBase\BaseRef.pas' {fmBaseRef: TFrame},
  BaseRep in 'ReportsMain\BaseRep.pas' {frmBaseRep},
  BaseRepWithPeriod in 'ReportsMain\BaseRepWithPeriod.pas' {frmBaseRepWithPeriod},
  BaseWBDoc in 'ssBase\BaseWBDoc.pas' {fmBaseWBDoc: TFrame},
  Bundles in 'Bundles\Bundles.pas',
  Bundling in 'Bundles\Bundling.pas',
  CCMain in 'CommandCenter\CCMain.pas' {frmCCMain},
  CommonConstants in '..\ssEnt\ssServer\CommonConstants.pas',
  CurrencyEdit in 'Currency\CurrencyEdit.pas' {frmCurrencyEdit},
  DCTurnover in 'DiscCards\DCTurnover.pas' {frmDCTurnover},
  debugTraceForm in 'DebugUnits\debugTraceForm.pas' {fmDebugTrace},
  DocsList in 'Waybill\DocsList.pas' {frmDocsList},
  EditAccountType in 'AccountType\EditAccountType.pas' {frmEditAccountType},
  EditAccOut in 'AccOut\EditAccOut.pas' {frmEditAccOut},
  EditAtt in 'WaybillOut\EditAtt.pas' {frmEditAtt},
  EditBank in 'Banks\EditBank.pas' {frmEditBank},
  EditCashDesk in 'CashDesks\EditCashDesk.pas' {frmEditCashDesk},
  EditCashOrder_RUS in 'PayDoc\EditCashOrder_RUS.pas' {frmEditCashOrder_RUS},
  EditCashOrder_UKR in 'PayDoc\EditCashOrder_UKR.pas' {frmEditCashOrder_UKR},
  EditChargeType in 'ChargeType\EditChargeType.pas' {frmEditChargeType},
  EditContr in 'Contr\EditContr.pas' {frmEditContr},
  EditCountry in 'Countries\EditCountry.pas' {frmEditCountry},
  EditDB in 'DB\EditDB.pas' {frmEditDB},
  EditDiscCards in 'DiscCards\EditDiscCards.pas' {frmEditDiscCards},
  EditEqType in 'EqType\EditEqType.pas' {frmEditEqType},
  EditInventory in 'Inventory\EditInventory.pas' {frmEditInventory},
  EditInvoice in 'Invoices\EditInvoice.pas' {frmEditInvoice},
  EditInvPos in 'Inventory\EditInvPos.pas' {frmEditInvPos},
  EditKAAccount in 'KAgent\EditKAAccount.pas' {frmEditKAAccount},
  EditKAgent in 'KAgent\EditKAgent.pas' {frmEditKAgent},
  EditKAPersons in 'KAgent\EditKAPersons.pas' {frmEditKAPersons},
  EditMaterials in 'Materials\EditMaterials.pas' {frmEditMaterials},
  EditMeasure in 'Measure\EditMeasure.pas' {frmEditMeasure},
  EditMoneyMove in 'PayDoc\EditMoneyMove.pas' {frmEditMoneyMove},
  EditOrderIn in 'Orders\EditOrderIn.pas' {frmEditOrderIn},
  EditOrderOut in 'Orders\EditOrderOut.pas' {frmEditOrderOut},
  EditOrderTmp in 'Orders\EditOrderTmp.pas' {frmEditOrderTmp},
  EditOrderTmpOut in 'Orders\EditOrderTmpOut.pas' {frmEditOrderTmpOut},
  EditPayDoc in 'PayDoc\EditPayDoc.pas' {frmEditPayDoc},
  EditPayOrder_RUS in 'PayDoc\EditPayOrder_RUS.pas' {frmEditPayOrder_RUS},
  EditPayOrder_UKR in 'PayDoc\EditPayOrder_UKR.pas' {frmEditPayOrder_UKR},
  EditPosition in 'Waybill\EditPosition.pas' {frmEditPosition},
  EditPositionAcc in 'AccOut\EditPositionAcc.pas' {frmEditPositionAcc},
  EditPositionMov in 'WaybillMov\EditPositionMov.pas' {frmEditPositionMov},
  EditPositionOrder in 'Orders\EditPositionOrder.pas' {frmEditPositionOrder},
  EditPositionSvc in 'WaybillOut\EditPositionSvc.pas' {frmEditPositionSvc},
  EditPosReturnIn in 'WBReturnIn\EditPosReturnIn.pas' {frmEditPosReturnIn},
  EditPriceList in 'PriceList\EditPriceList.pas' {frmEditPriceList},
  EditPriceTypes in 'PriceTypes\EditPriceTypes.pas' {frmEditPriceTypes},
  EditReport in 'ReportsMain\EditReport.pas' {frmEditReport},
  EditServices in 'Services\EditServices.pas' {frmEditServices},
  EditTaxes in 'Taxes\EditTaxes.pas' {frmEditTaxes},
  EditTaxWB in 'TaxWB\EditTaxWB.pas' {frmEditTaxWB},
  EditTaxWBDet in 'TaxWB\EditTaxWBDet.pas' {frmEditTaxWBDet},
  EditWaybill in 'Waybill\EditWaybill.pas' {frmEditWaybill},
  EditWaybillMov in 'WaybillMov\EditWaybillMov.pas' {frmEditWaybillMov},
  EditWaybillOut in 'WaybillOut\EditWaybillOut.pas' {frmEditWaybillOut},
  EditWBRest in 'WaybillRest\EditWBRest.pas' {frmEditWBRest},
  EditWBReturnIn in 'WBReturnIn\EditWBReturnIn.pas' {frmEditWBReturnIn},
  EditWBReturnOut in 'WBReturnOut\EditWBReturnOut.pas' {frmEditWBReturnOut},
  EditWebShop in 'Internet\EditWebShop.pas',
  EditWHouse in 'WHouse\EditWHouse.pas' {frmEditWHouse},
  EditWriteOff in 'WriteOff\EditWriteOff.pas' {frmEditWriteOff},
  EmailMsg in 'EMailSend\EmailMsg.pas' {frmSendMsg},
  ExImportWiz in 'ExImport\ExImportWiz.pas' {frmExImportWiz},
  Export in 'Export\Export.pas' {frmExport},
  fAccountType in 'AccountType\fAccountType.pas' {fmAccountType: TFrame},
  fAccOut in 'AccOut\fAccOut.pas' {fmAccOut: TFrame},
  fAllReports in 'ReportsMain\fAllReports.pas' {fmAllReports: TFrame},
  fBank in 'Banks\fBank.pas' {fmBank: TFrame},
  fCashDesks in 'CashDesks\fCashDesks.pas' {fmCashDesks: TFrame},
  fChargeType in 'ChargeType\fChargeType.pas' {fmChargeType: TFrame},
  fContr in 'Contr\fContr.pas' {fmContr: TFrame},
  fCountries in 'Countries\fCountries.pas' {fmCountries: TFrame},
  fCurrency in 'Currency\fCurrency.pas' {fmCurrency: TFrame},
  fDB in 'DB\fDB.pas' {fmDB: TFrame},
  fDCG in 'DiscCards\fDCG.pas' {fmDCG: TFrame},
  fDiscCards in 'DiscCards\fDiscCards.pas' {fmDiscCards: TFrame},
  fEqType in 'EqType\fEqType.pas' {fmEqType: TFrame},
  fFinance in 'Finance\fFinance.pas' {fmFinance: TFrame},
  fInventory in 'Inventory\fInventory.pas' {fmInventory: TFrame},
  fInvoices in 'Invoices\fInvoices.pas' {fmInvoices: TFrame},
  fKAgent in 'KAgent\fKAgent.pas' {fmKAgent: TFrame},
  fLoadingData in 'LoadingData\fLoadingData.pas' {fmLoadingData: TFrame},
  fMaterials in 'Materials\fMaterials.pas' {fmMaterials: TFrame},
  fMeasures in 'Measure\fMeasures.pas' {fmMeasures: TFrame},
  fMessageDlg in 'fMessageDlg.pas' {frmMessageDlg},
  fMoneyMove in 'PayDoc\fMoneyMove.pas' {fmMoneyMove: TFrame},
  fNA in 'NA\fNA.pas' {fmNA: TFrame},
  fOperLog in 'OperLog\fOperLog.pas' {fmOperLog: TFrame},
  fOrders in 'Orders\fOrders.pas' {fmOrders: TFrame},
  fPayDoc in 'PayDoc\fPayDoc.pas' {fmPayDoc: TFrame},
  fPriceList in 'PriceList\fPriceList.pas' {fmPriceList: TFrame},
  fPriceTypes in 'PriceTypes\fPriceTypes.pas' {fmPriceTypes: TFrame},
  fRecycleBin in 'RecycleBin\fRecycleBin.pas' {fmRecycleBin: TFrame},
  fReturnIn in 'WBReturnIn\fReturnIn.pas' {fmWBReturnIn: TFrame},
  fReturnOut in 'WBReturnOut\fReturnOut.pas' {fmWBReturnOut: TFrame},
  fRSS in 'Internet\fRSS.pas',
  fServices in 'Services\fServices.pas' {fmServices: TFrame},
  fSQLEditor in 'SQLEditor\fSQLEditor.pas' {fmSQLEditor: TFrame},
  fSvcGroup in 'SvcGroup\fSvcGroup.pas' {fmSvcGroup: TFrame},
  fTaxes in 'Taxes\fTaxes.pas' {fmTaxes: TFrame},
  fTaxWB in 'TaxWB\fTaxWB.pas' {fmTaxWB: TFrame},
  fUserGroups in 'UserGroups\fUserGroups.pas' {fmUserGroups: TFrame},
  fUserMonitor in 'UserMonitor\fUserMonitor.pas' {fmUserMonitor: TFrame},
  fUsers in 'Users\fUsers.pas' {fmUsers: TFrame},
  fWaybillMov in 'WaybillMov\fWaybillMov.pas' {fmWaybillMov: TFrame},
  fWaybillOut in 'WaybillOut\fWaybillOut.pas' {fmWaybillOut: TFrame},
  fWBReestr in 'Waybill\fWBReestr.pas' {fmWBReestr: TFrame},
  fWBRest in 'WaybillRest\fWBRest.pas' {fmWBRest: TFrame},
  fWebShops in 'Internet\fWebShops.pas',
  fWHouse in 'WHouse\fWHouse.pas' {fmWhouse: TFrame},
  fWriteOff in 'WriteOff\fWriteOff.pas' {fmWriteOff: TFrame},
  ideSN in '..\Libs7\hardware\ideSN\ideSN.pas',
  InitialSettings in 'Wizards\InitialSettings.pas',
  KAOutParty in 'WBReturnIn\KAOutParty.pas' {frmKAOutParty},
  KATurnover in 'KAgent\KATurnover.pas' {frmKATurnover},
  Lock in 'Lock.pas' {frmLock},
  Login in 'Login.pas' {frmLogin},
  Main in 'Main.pas' {frmMain},
  MatMove in 'WMat\MatMove.pas' {frmMatMove},
  MatRsv in 'Materials\MatRsv.pas' {frmMatRsv},
  MCList in 'WMat\MCList.pas' {frmMCList},
  MetaAddress in 'Classes\MetaAddress.pas',
  MetaBusinessPartner in 'Classes\MetaBusinessPartner.pas',
  MetaClass in 'Classes\MetaClass.pas',
  MetaDiscount in 'Classes\Finances\MetaDiscount.pas',
  MetaDoc in 'Classes\Documents\MetaDoc.pas',
  MetaImage in 'Classes\MetaImage.pas',
  MetaOrder in 'Classes\Documents\MetaOrder.pas',
  WBMetaItem in 'Classes\Documents\WBMetaItem.pas',
  MetaPrice in 'Classes\Finances\MetaPrice.pas',
  MetaProduct in 'Classes\MetaProduct.pas',
  MetaTax in 'Classes\Finances\MetaTax.pas',
  ok_rep in 'OK_Rep\ok_rep.pas',
  okDateUtils in '..\Libs7\ssPack\okDateUtils.pas',
  okMoneyFun in 'okMoneyFun.pas',
  okSearchEdit in '..\Libs7\ssPack\okSearchEdit.pas',
  okServer_TLB in 'okServer_TLB.pas',
  okSkladClassDefs in 'okSkladClassDefs.pas',
  OperHistory in 'OperLog\OperHistory.pas' {frmOperHistory},
  OperProps in 'OperLog\OperProps.pas' {frmOperProps},
  Options in 'Options\Options.pas' {frmOptions},
  OrdersInfo in 'Orders\OrdersInfo.pas' {frmOrdersInfo},
  PartySelect in 'WaybillOut\PartySelect.pas' {frmPartySelect},
  PJSysInfo in '..\Libs7\hardware\ddsysinfo\PJSysInfo.pas',
  Progress in 'Progress\Progress.pas' {frmProgress},
  Protection in 'Protection\Protection.pas',
  prRep in 'prRep.pas',
  prTypes in 'prTypes.pas',
  RegExpr in '..\Libs7\regexpr\Source\RegExpr.pas',
  RemainsAtWH in 'WaybillOut\RemainsAtWH.pas' {frmRemainsAtWH},
  Rep1 in 'ReportsMain\Rep1.pas' {frmRep1},
  Rep10 in 'ReportsMain\Rep10.pas' {frmRep10},
  Rep14 in 'ReportsMain\Rep14.pas' {frmRep14},
  Rep17 in 'ReportsMain\Rep17.pas' {frmRep17},
  Rep20 in 'ReportsMain\Rep20.pas',
  Rep21 in 'ReportsMain\Rep21.pas' {frmRep21},
  Rep24 in 'ReportsMain\Rep24.pas' {frmRep24},
  Rep25 in 'ReportsMain\Rep25.pas' {frmRep25},
  Rep3 in 'ReportsMain\Rep3.pas' {frmRep3},
  Rep7 in 'ReportsMain\Rep7.pas' {frmRep7},
  Rep9 in 'ReportsMain\Rep9.pas' {frmRep9},
  RepMoney in 'ReportsMain\RepMoney.pas' {frmRepMoney},
  RepPersons in 'ReportsMain\RepPersons.pas' {frmRepPersons},
  SelectHost in 'SelectHost.pas' {frmSelectHost},
  Serializator in 'Classes\Serializator.pas',
  Serials in 'Waybill\Serials.pas' {frmSerials},
  SetCols in 'PriceList\SetCols.pas' {frmSetCols},
  SetDiscount in 'WaybillOut\SetDiscount.pas' {frmSetDiscount},
  SetPanels in 'Waybill\SetPanels.pas' {frmSetPanels},
  SetWMat in 'PriceList\SetWMat.pas' {frmSetWMat},
  ssBaseConst in 'ssBase\ssBaseConst.pas',
  ssBaseDlg in 'ssBase\ssBaseDlg.pas' {BaseDlg},
  ssBaseIntfDlg in 'ssBase\ssBaseIntfDlg.pas' {frmBaseIntfDlg},
  ssBaseSkinForm in 'ssBase\ssBaseSkinForm.pas' {frmBaseSkin},
  ssBaseTypes in 'ssBase\ssBaseTypes.pas',
  ssBaseWBDocDlg in 'ssBase\ssBaseWBDocDlg.pas' {frmBaseWBDocDlg},
  ssBaseWBDocDlgWithPayment in 'ssBase\ssBaseWBDocDlgWithPayment.pas' {frmBaseWBDocDlgWithPayment},
  ssBaseWBDocOut in 'ssBase\ssBaseWBDocOut.pas' {frmBaseWBDocOut},
  ssBaseWizard in 'ssBase\ssBaseWizard.pas' {frmBaseWizard},
  ssCallbackConst in 'ssCallbackConst.pas',
  ssClntCallback in 'ssClntCallback.pas' {IssClntCallback: CoClass},
  ssDateUtils in '..\Libs7\ssPack\ssDateUtils.pas',
  ssFun in 'ssBase\ssFun.pas',
  ssMDIChild in 'ssBase\ssMDIChild.pas' {MDIChild},
  ssRegUtils in '..\Libs7\ssPack\ssRegUtils.pas',
  ssStrUtil in '..\Libs7\ssPack\ssStrUtil.pas',
  StartWiz in 'StartWiz\StartWiz.pas' {frmStartWiz},
  synachar in 'EMailSend\synachar.pas',
  synacode in 'EMailSend\synacode.pas',
  synautil in 'EMailSend\synautil.pas',
  treeSelector in 'treeSelector.pas' {frmTreeSelector: TFrame},
  TmpOrderInfo in 'Orders\TmpOrderInfo.pas' {frmTmpOrderInfo},
  Torg12 in 'ReportsMain\Torg12.pas' {frmTorg12},
  UDebug in '..\Libs7\AP\UDebug.pas',
  UserGroupsEdit in 'UserGroups\UserGroupsEdit.pas' {frmUserGroupsEdit},
  UsersEdit in 'Users\UsersEdit.pas' {frmUsersEdit},
  VerInf in '..\Libs7\xLib\VerInf.pas',
  Waybill in 'Waybill\Waybill.pas' {fmWaybill: TFrame},
  WaybillClass in 'Classes\Documents\WaybillClass.pas',
  WaybillInClass in 'Classes\Documents\WaybillInClass.pas',
  WaybillOutClass in 'Classes\Documents\WaybillOutClass.pas',
  WBMovSetPT in 'WaybillMov\WBMovSetPT.pas' {frmWBMovSetPT},
  WebReq in 'Internet\WebReq.pas',
  WMat in 'WMat\WMat.pas' {fmWMat: TFrame},
  xLngDefs in '..\Libs7\ssPack\xLngDefs.pas',
  xLngManager in '..\Libs7\xLib\xLngManager.pas',
  xNumInWords in '..\Libs7\ssPack\xNumInWords.pas',
  xStrUtils in '..\Libs7\xLib\xStrUtils.pas',
  OK_Sklad_TLB in 'OK_Sklad_TLB.pas',
  xClasses in '..\Libs7\xLib\xClasses.pas',
  xNumInWords_UKR in '..\Libs7\ssPack\xNumInWords_UKR.pas',
  xNumInWords_ENG in '..\Libs7\ssPack\xNumInWords_ENG.pas',
  xNumInWords_ESP in '..\Libs7\ssPack\xNumInWords_ESP.pas',
  xNumInWords_RUS in '..\Libs7\ssPack\xNumInWords_RUS.pas',
  okFrameList in '..\Libs7\ssPack\okFrameList.pas',
  fMatGroup in 'MatGroup\fMatGroup.pas' {fmMatGroup: TFrame};

{$R *.TLB}

{$R *.res}

const
  clientINI = 'client.ini';

var
  FViewType: integer;
  F: TextFile;
  i: integer;
  param, s: String;
  midash: THandle;

//==============================================================================================
procedure loadINI;
  var
    ini: TIniFile;
begin
  if not FileExists(clientINI) then Exit;

  ini := TIniFile.Create(clientPath + clientINI);
  //brandCode := ini.ReadInteger('main', 'bmode', 0);
  ini.Destroy;
end;

//==============================================================================================
procedure ShowCmdLineHelp;
begin
  Application.MessageBox('-h|--help - this text'
     + #13#10'-d - debug ON'
     + #13#10'--clearreg - clear our registry tree'
     + #13#10'--resetcid - resets languages and financial settings to the United States-specific'
     + #13#10'--setcid=CC - set languages and financial settings according to the two-letter country code specified in place of CC'
     , 'Das mnogopolesnische helpische');
  Application.Terminate;
  Application.ProcessMessages;
  Halt;
end;

//==============================================================================================
begin
  {$I ok_sklad_compile_date.inc}

  {$IFDEF FREE}
  {$I ok_sklad_free_limits.inc}
  {$ENDIF}

  {$IFDEF LITE}
  {$I ok_sklad_lite_limits.inc}
  {$ENDIF}

  randomize;
  udebugSetLogFile(ExtractFilePath(ParamStr(0)) + ClientLogFile);

  {$IFDEF DEBUG}
  debugProfilingLevel(debugLevelHigh);
  cmdLineDebugLevel := 10;
  {$ENDIF}

  debugInstantLog('Units initialized');
  Application.Initialize;

  ClientPath := ExtractFilePath(ParamStr(0));
  ServerPath := ClientPath; SetLength(ServerPath, length(ServerPath) - 1); // strip last slash
  {$IFDEF DEBUG}
  ServerPath := AnsiMidStr(ServerPath, 1, LastDelimiter('\\', ServerPath)) + 'ssEnt\ssServer\';
  {$ELSE}
  ServerPath := AnsiMidStr(ServerPath, 1, LastDelimiter('\\', ServerPath)) + 'Server\';
  {$ENDIF}
  WriteToRegStr(prRegKey, 'ClientPath', ClientPath, HKEY_CURRENT_USER);
  WriteToRegStr(prRegKey, 'ServerPath', ServerPath, HKEY_CURRENT_USER);

  //---------------------------------------------------------------------------------
  debugInstantLog('+ cleaning vile borland sh-tuff');
  DropRegKey('CLSID\{9E8D2FA1-591C-11D0-BF52-0020AF32BD64}', HKEY_CLASSES_ROOT);
  DropRegKey('CLSID\{9E8D2FA3-591C-11D0-BF52-0020AF32BD64}', HKEY_CLASSES_ROOT);
  DropRegKey('CLSID\{9E8D2FA5-591C-11D0-BF52-0020AF32BD64}', HKEY_CLASSES_ROOT);

  {
  s := clientPath + 'midas.dll';
  debugInstantLog('+ preloading our ' + s);
  try
    RegisterComServer(s);
  except
    on e:Exception do debugInstantLog('! NOTE: RegisterComServer(' + s + '): ' + e.Message);
  end;

  midash := LoadLibrary(PChar(s));

  if midash = 0 then begin
    debugInstantLog(SErrorLoadingMidas);
    MessageDlg('OK-Client initialization error: '#13#10 + SErrorLoadingMidas + #13#10 + s, mtError, [mbOk], 0);
    Application.Terminate;
    Application.ProcessMessages;
    Halt;
  end;

  RegisterMidasLib(GetProcAddress(midash, 'DllGetClassObject'));
  }
  //---------------------------------------------------------------------------------

  debugInstantLog('creating data form');
  Application.CreateForm(TdmData, dmData);
  if ParamCount > 0 then
    for i := 1 to ParamCount do begin
      param := AnsiLowerCase(ParamStr(i));

      if AnsiMidStr(param, 1, 2) = '-d' then begin // debug
        if (length(param) > 2) then cmdLineDebugLevel := Floor(ssStrToFloat(AnsiMidStr(param, 3, 9), 0))
        else if (i < ParamCount) and (0.0 <> ssStrToFloat(ParamStr(i + 1), 0.0)) then cmdLineDebugLevel := Floor(ssStrToFloat(ParamStr(i + 1), 0.0))
        else cmdLineDebugLevel := 5;
        debugInstantLog('Debug level set to -d ' + IntToStr(cmdLineDebugLevel));
      end
      //-------------------------------------------------
      else if -1 <> AnsiIndexStr(param, ['-h', '--help'])
           then ShowCmdLineHelp
      //-------------------------------------------------
      else if param = '--clearreg' then begin
        s := '';
        if not DropRegKey(prRegKey, HKEY_CURRENT_USER) then s := ' HKCU';
        if not DropRegKey(prRegKey, HKEY_LOCAL_MACHINE) then s := s + ' HKLM';
        if s <> ''
          then Application.MessageBox(PChar('Error deleting registry branches:' + s), 'Oj beda, beda!!!')
          else LoadLangInfo;// now running Initialsettings dialog
      end
      //-------------------------------------------------
      else if (param = '--resetcid') or (AnsiMidStr(param, 1, 9) = '--setcid=')
      then begin
        if param = '--resetcid'
          then CountryRules.setCurrent(cidUS)
          else CountryRules.setCurrent(AnsiMidStr(ParamStr(i), 10, 2));

        if CountryRules.cid = -1 then begin
          debugInstantLog('Invalid param value: ' + ParamStr(i));
          Application.MessageBox(PChar('Invalid param value: ' + ParamStr(i)), 'Fantastische!');
          Application.Terminate;
          Application.ProcessMessages;
          Halt;
        end;

        LangID := CountryRules.LangID;
        RepLangID := LangID;
        LangName := langNames[LangID];
        RepLangName := langNames[LangID];
        SaveLangInfo;
      end
    end;// for i := 1 to ParamCount

  LoadLangInfo;

  //loadINI;
  debugInstantLog('loading dlls');
  resdllHandle := LoadLibrary(PChar(ClientPath + '\\soapmgr32.dll')); // load branding bitmaps, strings and other volatile stuff

  fProgress := TfrmProgress.Create(nil);

  InitRes(LangMan);

  // statistics
  ClientStartTime := 0; //pre-init

  debugInstantLog('Logging in');
  if not CheckLogin(dmData.SConnection, ltProduction) then begin
    debugInstantLog('Login failed');
    Application.Terminate;
    Application.ProcessMessages;
    Exit;
  end;

  debugInstantLog('InitProfile');
  InitProfile(dmData.SConnection, UserID, ProfID, TreeID, dmData.scMain);
  InitCallback;

  debugInstantLog('Creating Main form');
  Application.CreateForm(TokMainClass, frmMain);

  debugInstantLog('Creating CCMain');
  frmCCMain := TfrmCCMainClass.Create(Application);
  frmCCMain.FormStyle := fsMDIChild;
  frmCCMain.WindowState := wsMaximized;
  frmCCMain.OnDate := frmMain.edOnDate.Date;

  debugInstantLog('setting view');

  if ReadFromRegInt(PrRegKey, 'ViewType', FViewType)
    then CurrentView := TCCViewType(FViewType)
    else CurrentView := vtDocs;

  frmMain.ResetActive(CurrentView);
  ReadFromRegInt(PrRegKey, 'CurrNode', CurrentNode);
  frmCCMain.ViewType := frmMainForm.GetEnabledView(CurrentView);
  SendMessage(frmCCMain.Handle, WM_SETCAPTIONEX, integer(@frmMain.aRunCC.Caption), 0);

  {$IFNDEF DEBUG}
  {$IF defined(BETA)}
  if DaysBetween(Now, EncodeDate(compiledYear, compiledMonth, compiledDay)) > MaxFreeDays then begin
    ShowMessage(rs('Common', 'FreeVerExpired'));
    Application.Terminate;
    Application.ProcessMessages;
    Halt;
  end;
  {$IFEND}
  {$ENDIF}

  debugInstantLog('Starting UI');

  Application.Run;

  Application.ProcessMessages;
end.
