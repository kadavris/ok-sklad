inherited frmRep1: TfrmRep1
  Left = 380
  Top = 174
  ActiveControl = prdMain
  Caption = 'frmRep1'
  ClientHeight = 588
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Height = 506
    TabOrder = 3
    DesignSize = (
      532
      506)
    object lWhouse: TLabel [0]
      Left = 20
      Top = 113
      Width = 21
      Height = 16
      Caption = #1057#1082#1083
    end
    object sbAddWHouse: TssSpeedButton [1]
      Left = 492
      Top = 107
      Alignment = taCenter
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      DisabledImages = dmData.Images18x18dis
      GroupIndex = 0
      ImageIndex = 26
      Images = dmData.Images18x18
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = sbAddWHouseClick
    end
    object lMatGroup: TLabel [2]
      Left = 20
      Top = 164
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
      Left = 464
      Top = 159
      Alignment = taCenter
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 48
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnAddMGClick
    end
    object btnDrillDown: TssSpeedButton [4]
      Left = 492
      Top = 159
      Alignment = taCenter
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtChecked
      Checked = True
      DisabledImages = dmData.Images18x18dis
      GroupIndex = 0
      ImageIndex = 25
      Images = dmData.Images18x18
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    inherited panNotes: TPanel
      Top = 258
      Height = 95
      TabOrder = 7
      inherited lTextNotes: TLabel
        Height = 95
      end
    end
    inherited dbgRef: TdxDBTreeList
      Height = 150
      TabOrder = 6
    end
    object lcbWHouse: TssDBLookupCombo
      Left = 137
      Top = 108
      Width = 354
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
      Top = 160
      Width = 326
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Properties.PopupAutoSize = False
      Properties.PopupSizeable = False
      Properties.PopupWidth = 324
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
    object chbGrpBy: TcxCheckBox
      Left = 133
      Top = 218
      Width = 363
      Height = 24
      ParentFont = False
      Properties.Alignment = taLeftJustify
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = 'GrpBy'
      State = cbsChecked
      Style.StyleController = dmData.scMain
      TabOrder = 5
      ImeName = 'Russian'
      OnEnter = CtrlEnter
      OnExit = CtrlExit
      OnKeyDown = GoNextKeyDown
      OnKeyPress = GoNext
    end
    object edKA: TokKASearchEdit
      Left = 20
      Top = 188
      Width = 501
      Height = 31
      ButtonsLeftMargin = 4
      CapFind = 'Search'
      CapFindParams = 'Search options'
      CapRef = 'Business Partners Directory'
      CapContextFind = 'Context search'
      CapFindBegin = 'From the beginning'
      CapFindConcurr = 'Full match'
      CapFindSubstr = 'Partial match'
      EditorOffset = 95
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
        501
        31)
    end
    object chbIsMove: TcxCheckBox
      Left = 133
      Top = 134
      Width = 363
      Height = 24
      ParentFont = False
      Properties.Alignment = taLeftJustify
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1059#1095#1080#1090#1099#1074#1072#1090#1100' '#1087#1077#1088#1077#1084#1077#1097#1077#1085#1080#1103
      State = cbsChecked
      Style.StyleController = dmData.scMain
      TabOrder = 2
      ImeName = 'Russian'
      OnEnter = CtrlEnter
      OnExit = CtrlExit
      OnKeyDown = GoNextKeyDown
      OnKeyPress = GoNext
    end
  end
  inherited panButtons: TPanel
    Top = 553
  end
  inherited panToolBar: TPanel
    TabOrder = 0
    inherited btnLock: TssSpeedButton
      Left = 441
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 468
    end
    inherited btnHelp: TssSpeedButton
      Left = 495
    end
  end
  inherited FormStorage: TssFormStorage
    StoredProps.Strings = (
      'chbGrpBy.Checked'
      'chbIsMove.Checked'
      'btnDrillDown.Checked')
  end
  inherited ActionList: TActionList
    inherited aCurAction: TAction
      OnExecute = aCurActionExecute
    end
  end
  inherited frReport1: TfrReport
    ReportForm = {19000000}
  end
  inherited cdsMaster: TssMemoryData
    Top = 218
  end
  inherited dsMaster: TDataSource
    Top = 219
  end
  inherited frDBDSMaster: TfrDBDataSet
    Top = 219
  end
  inherited cdsDetail: TssClientDataSet
    Top = 249
  end
  inherited dsDetail: TDataSource
    Top = 249
  end
  inherited frDBDSDetail: TfrDBDataSet
    Top = 249
  end
  inherited cdsSubDetail: TssClientDataSet
    Top = 280
  end
  inherited dsSubDetail: TDataSource
    Top = 280
  end
  inherited frDBDSSubDetail: TfrDBDataSet
    Top = 280
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
end
