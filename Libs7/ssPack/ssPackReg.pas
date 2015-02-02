unit ssPackReg;

interface

procedure Register;

implementation

uses
  Classes, 
  DesignEditors, 
  DesignIntf, 
  okClasses,
  okEditors,
  okFrameList, 
  okLabel, 
  okPeriod, 
  okSearchEdit,
  //ssActionMainMenuBar, 
  //ssBarDsgn, 
  ssBevel, 
  //ssButton, 
  ssCalcEdit, 
  ssCheckBox, 
  ssClientDataSet, 
  ssDataSource, 
  ssDBComboBox, 
  ssDBGrid, 
  ssDBLookupCombo,
  ssDBTreeView, 
  ssExcel, 
  ssFormStorage,
  ssFormStorageEditor, 
  ssGradientPanel, 
  ssGroupBox,
  ssImagePanel, 
  //ssInspector, 
  ssLabel,
  ssMemDS, 
  ssPageControl, 
  ssPanel, 
  ssPeriod, 
  ssPopupMenu, 
  ssPopupTreeEdit, 
  ssSocketConnection, 
  ssSpeedButton,
  //ssToolBar, 
  //ssTransparentPanel, 
  ssXLSExport;

procedure Register;
begin
  RegisterComponents('SS Pack', [{TssActionMainMenuBar, TssADOQuery, TssTransparentPanel, TssButton, TssToolBar,}
   TssClientDataSet, TssMemoryData, TssSocketConnection, 
   TssFormStorage, TssDBComboBox, TssImagePanel, TssGroupBox, TssPopupTreeEdit, TssGradientPanel,
   TssPopupMenu, TssDBTreeView, TssExcel, TssSpeedButton,
   TssDataSource, TssBevel, TssCalcEdit, TssDBLookupCombo, TssLabel,
   TssCheckBox, 
   //TssInspector, 
   TssDBGrid, TssPanel, TssPeriod, TssPageControl, TssDBTreeList, TssXLSExport]);

  RegisterComponents('OK-Lib', [TokKASearchEdit,
    TokSearchEdit, TokMatSearchEdit, TokSvcSearchEdit,
    TokDocSearchEdit, TokContractSearchEdit, TokPayDocSearchEdit,
    TokWHouseSearchEdit, TokDiscCardSearchEdit, TokOrderSearchEdit, TokOrder,
    TokKAgent, TokPayDoc, TokWarehouse, TokDiscCard, TokFrameList, TokFunctionBuffer,
    TokGridSearchEdit]);

  RegisterComponents('OK-Controls', [TokLabel, TokPeriod, TokTextEdit]);

  RegisterComponentEditor(TssFormStorage, TFormStorageEditor);
  //RegisterComponentEditor(TssToolBar, TssBarDesigner);
  {$IFNDEF NODESIGN}
  RegisterComponentEditor(TssClientDataSet, TssCDSEditor);
  {$ENDIF}
  RegisterPropertyEditor(TypeInfo(TStrings), TssFormStorage, 'StoredProps', TStoredPropsProperty);
end;

end.
