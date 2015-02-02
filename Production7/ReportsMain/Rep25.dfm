inherited frmRep25: TfrmRep25
  Left = 449
  Top = 213
  ActiveControl = prdMain
  Caption = 'frmRep25'
  ClientHeight = 682
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Height = 600
    TabOrder = 3
    DesignSize = (
      532
      600)
    object lWhouse: TLabel [0]
      Left = 20
      Top = 113
      Width = 21
      Height = 16
      Caption = #1057#1082#1083
    end
    object sbAddWHouse: TssSpeedButton [1]
      Left = 490
      Top = 109
      Width = 22
      Height = 22
      Alignment = taCenter
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      DisabledImages = dmData.Images18x18dis
      GroupIndex = 0
      ImageIndex = 26
      Images = dmData.Images18x18
      LeftMargin = 2
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = sbAddWHouseClick
    end
    object lMatGroup: TLabel [2]
      Left = 20
      Top = 143
      Width = 105
      Height = 16
      Caption = #1058#1086#1074#1072#1088#1085#1072#1103' '#1075#1088#1091#1087#1087#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnAddMG: TssSpeedButton [3]
      Left = 462
      Top = 140
      Width = 22
      Height = 22
      Alignment = taCenter
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 48
      Images = dmData.Images
      LeftMargin = 2
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnAddMGClick
    end
    object btnDrillDown: TssSpeedButton [4]
      Left = 490
      Top = 140
      Width = 22
      Height = 22
      Alignment = taCenter
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtChecked
      Checked = True
      DisabledImages = dmData.Images18x18dis
      GroupIndex = 0
      ImageIndex = 25
      Images = dmData.Images18x18
      LeftMargin = 2
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object lPTOut: TLabel [5]
      Left = 20
      Top = 201
      Width = 110
      Height = 34
      AutoSize = False
      Caption = #1058#1086#1074#1072#1088#1085#1072#1103' '#1085#1072#1094#1077#1085#1082#1072' '#1076#1083#1103':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    inherited panNotes: TPanel
      Top = 1
      Height = 95
      TabOrder = 5
      inherited lTextNotes: TLabel
        Height = 95
      end
    end
    inherited dbgRef: TdxDBTreeList
      Top = 391
      Height = 167
      TabOrder = 6
    end
    inherited prdMain: TokPeriod
      Left = 44
      Top = 23
    end
    object lcbWHouse: TssDBLookupCombo
      Left = 137
      Top = 108
      Width = 352
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      ImeName = 'Russian'
      ParentFont = False
      Properties.DropDownListStyle = lsEditFixedList
      Style.StyleController = dmData.scMain
      TabOrder = 1
      OnEnter = CtrlEnter
      OnExit = CtrlExit
      OnKeyDown = GoNextKeyDown
      OnKeyPress = GoNext
      EmptyValue = 0
      KeyField = 'wid'
      ListField = 'name'
      ListSource = dsWhouse
    end
    object edMatGroup: TssPopupTreeEdit
      Tag = 10
      Left = 137
      Top = 139
      Width = 323
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Properties.PopupAutoSize = False
      Properties.PopupSizeable = False
      Properties.PopupWidth = 321
      Properties.ReadOnly = False
      Style.StyleController = dmData.scMain
      TabOrder = 3
      ImeName = 'Russian'
      OnEnter = CtrlEnter
      OnExit = CtrlExit
      OnKeyDown = GoNextKeyDown
      OnKeyPress = GoNext
      OnGetNodeImageIndex = edMatGroupGetNodeImageIndex
      ListSource = dsMatGroup
      KeyField = 'grpid'
      ParentField = 'pid'
      DisplayField = 'name'
      ShowExpandedTree = False
      Images = dmData.Images
    end
    object edKA: TokKASearchEdit
      Left = 20
      Top = 167
      Width = 498
      Height = 31
      ButtonsLeftMargin = 4
      CapFind = 'Search'
      CapFindParams = 'Search options'
      CapRef = 'Business Partners Directory'
      CapContextFind = 'Context search'
      CapFindBegin = 'From the beginning'
      CapFindConcurr = 'Full match'
      CapFindSubstr = 'Partial match'
      EditorOffset = 118
      DisabledImages = dmData.Images18x18dis
      Images = dmData.Images18x18
      ImageIndexRef = 28
      ImageIndexFind = 18
      ImageIndexFindParams = 19
      LangManager = dmData.Lng
      RemoteServer = dmData.SConnection
      ShowLng = False
      SearchNames.Strings = (
        'Short name;name')
      SearchType = stBegin
      Skin = dmData.sknMain
      TabOrder = 4
      OnRefButtonClick = edKARefButtonClick
      SearchMode = smAll
      DesignSize = (
        498
        31)
    end
    object chbIsMove: TcxCheckBox
      Left = 17
      Top = 240
      Width = 363
      Height = 24
      ParentFont = False
      Properties.Alignment = taLeftJustify
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103
      State = cbsChecked
      Style.StyleController = dmData.scMain
      TabOrder = 2
      Visible = False
      ImeName = 'Russian'
      OnEnter = CtrlEnter
      OnExit = CtrlExit
      OnKeyDown = GoNextKeyDown
      OnKeyPress = GoNext
    end
    object lcbPTOut: TssDBLookupCombo
      Left = 137
      Top = 202
      Width = 352
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      ImeName = 'Russian'
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Style.StyleController = dmData.scMain
      TabOrder = 7
      EmptyValue = 0
      KeyField = 'ptypeid'
      ListField = 'name'
      ListSource = srcPriceTypes
    end
    object gbGrp: TssGroupBox
      Left = 137
      Top = 240
      Width = 352
      Height = 106
      Alignment = alTopLeft
      Caption = ' '#1043#1088#1091#1087#1087#1080#1088#1086#1074#1072#1090#1100' '
      TabOrder = 9
      Edges = [beLeft, beRight, beTop, beBottom]
      object rbtByGrp: TcxRadioButton
        Left = 15
        Top = 26
        Width = 323
        Height = 21
        Caption = #1087#1086' '#1090#1086#1074#1072#1088#1085#1099#1084' '#1075#1088#1091#1087#1087#1072#1084
        TabOrder = 0
      end
      object rbtBySupplier: TcxRadioButton
        Left = 15
        Top = 49
        Width = 330
        Height = 21
        Caption = #1087#1086' '#1087#1086#1089#1090#1072#1074#1097#1080#1082#1072#1084
        TabOrder = 1
      end
      object rbtNoGrp: TcxRadioButton
        Left = 15
        Top = 74
        Width = 332
        Height = 21
        Caption = #1085#1077' '#1075#1088#1091#1087#1087#1080#1088#1086#1074#1072#1090#1100
        Checked = True
        TabOrder = 2
        TabStop = True
      end
    end
    object chbShowOnlySummary: TcxCheckBox
      Left = 132
      Top = 351
      Width = 369
      Height = 24
      ParentFont = False
      Properties.Alignment = taLeftJustify
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1089#1091#1084#1084#1072#1088#1085#1099#1077' '#1079#1085#1072#1095#1077#1085#1080#1103' '#1087#1086' '#1086#1090#1095#1105#1090#1091
      Style.StyleController = dmData.scMain
      TabOrder = 8
      ImeName = 'Russian'
      OnEnter = CtrlEnter
      OnExit = CtrlExit
      OnKeyDown = GoNextKeyDown
      OnKeyPress = GoNext
    end
  end
  inherited panButtons: TPanel
    Top = 647
    inherited btnOK: TxButton
      Left = 324
    end
    inherited btnCancel: TxButton
      Left = 428
    end
  end
  inherited panToolBar: TPanel
    TabOrder = 0
    inherited btnLock: TssSpeedButton
      Left = 489
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 511
    end
    inherited btnHelp: TssSpeedButton
      Left = 466
    end
    inherited btnUseLogo: TssSpeedButton
      Left = 30
      Width = 22
      Height = 22
      LeftMargin = 2
    end
    inherited btnUseDiagram: TssSpeedButton
      Width = 22
      Height = 22
      LeftMargin = 2
    end
  end
  inherited ilTitleBar: TImageList
    Left = 240
    Top = 12
  end
  inherited FormStorage: TssFormStorage
    StoredProps.Strings = (
      'chbIsMove.Checked'
      'btnDrillDown.Checked'
      'chbShowOnlySummary.Checked'
      'rbtNoGrp.Checked'
      'rbtBySupplier.Checked'
      'rbtByGrp.Checked')
    Left = 464
    Top = 62
  end
  inherited ActionList: TActionList
    Left = 268
    Top = 12
    inherited aCurAction: TAction
      OnExecute = aCurActionExecute
    end
  end
  inherited frReport1: TfrReport
    ReportForm = {19000000}
  end
  inherited cdsMaster: TssMemoryData
    Left = 147
    Top = 399
  end
  inherited dsMaster: TDataSource
    OnDataChange = dsMasterDataChange
    Left = 102
    Top = 403
  end
  inherited frDBDSMaster: TfrDBDataSet
    Left = 265
    Top = 399
  end
  inherited cdsDetail: TssClientDataSet
    Left = 378
    Top = 253
  end
  inherited dsDetail: TDataSource
    Left = 384
    Top = 249
  end
  inherited frDBDSDetail: TfrDBDataSet
    Left = 390
    Top = 245
  end
  inherited cdsSubDetail: TssClientDataSet
    Left = 380
    Top = 292
  end
  inherited dsSubDetail: TDataSource
    Left = 386
    Top = 288
  end
  inherited frDBDSSubDetail: TfrDBDataSet
    Left = 389
    Top = 284
  end
  object cdsWhouse: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pWHouse_List'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsWhouseBeforeOpen
    Macros = <
      item
        DataType = ftString
        Name = 'm'
        ParamType = ptInput
      end>
    Left = 228
    Top = 107
    object cdsWhouseWID: TIntegerField
      FieldName = 'WID'
      ReadOnly = True
    end
    object cdsWhouseNAME: TStringField
      FieldName = 'NAME'
      ReadOnly = True
      Size = 64
    end
    object cdsWhouseADDR: TStringField
      FieldName = 'ADDR'
      ReadOnly = True
      Size = 255
    end
    object cdsWhouseNOTES: TStringField
      FieldName = 'NOTES'
      ReadOnly = True
      Size = 255
    end
    object cdsWhouseDELETED: TIntegerField
      FieldName = 'DELETED'
      ReadOnly = True
    end
  end
  object dsWhouse: TDataSource
    DataSet = cdsWhouse
    Left = 246
    Top = 106
  end
  object cdsMatGroup: TssClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'GRPID'
        Attributes = [faReadonly]
        DataType = ftInteger
      end
      item
        Name = 'PID'
        Attributes = [faReadonly]
        DataType = ftInteger
      end
      item
        Name = 'NAME'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 64
      end
      item
        Name = 'DELETED'
        Attributes = [faReadonly]
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'pMatGroup_List'
    RemoteServer = dmData.SConnection
    StoreDefs = True
    Macros = <>
    Left = 303
    Top = 136
  end
  object dsMatGroup: TDataSource
    DataSet = cdsMatGroup
    Left = 319
    Top = 136
  end
  object cdsPriceTypes: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pPriceTypes_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 180
    Top = 144
  end
  object srcPriceTypes: TDataSource
    DataSet = cdsPriceTypes
    Left = 152
    Top = 144
  end
end
