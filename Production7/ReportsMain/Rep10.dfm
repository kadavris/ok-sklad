inherited frmRep10: TfrmRep10
  Left = 466
  Top = 242
  Caption = 'frmRep10'
  ClientHeight = 615
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Height = 533
    object lWhouse: TLabel [0]
      Left = 20
      Top = 113
      Width = 21
      Height = 16
      Caption = #1057#1082#1083
    end
    object sbAddWHouse: TssSpeedButton [1]
      Left = 492
      Top = 106
      Width = 29
      Height = 28
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
      Top = 146
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
      Top = 142
      Width = 28
      Height = 28
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
      Top = 142
      Width = 29
      Height = 28
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
      Left = 16
      Top = 414
      Height = 64
      Visible = False
      inherited Image3: TImage
        Top = 5
        Visible = False
      end
      inherited lTextNotes: TLabel
        Height = 64
        Visible = False
      end
    end
    inherited dbgRef: TdxDBTreeList
      Top = 287
      Height = 118
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
      TabOrder = 3
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
      Top = 143
      Width = 326
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Properties.PopupAutoSize = False
      Properties.PopupSizeable = False
      Properties.PopupWidth = 324
      Properties.ReadOnly = False
      Style.StyleController = dmData.scMain
      TabOrder = 4
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
      Left = 132
      Top = 209
      Width = 363
      Height = 24
      ParentFont = False
      Properties.Alignment = taLeftJustify
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = 'GrpBy'
      State = cbsChecked
      Style.StyleController = dmData.scMain
      TabOrder = 6
      ImeName = 'Russian'
      OnEnter = CtrlEnter
      OnExit = CtrlExit
      OnKeyDown = GoNextKeyDown
      OnKeyPress = GoNext
    end
    object chbPriceType: TcxCheckBox
      Left = 132
      Top = 233
      Width = 363
      Height = 24
      ParentFont = False
      Properties.Alignment = taLeftJustify
      Properties.DisplayUnchecked = 'False'
      Properties.OnChange = chbPriceTypePropertiesChange
      Properties.Caption = 'chbPriceType'
      Style.StyleController = dmData.scMain
      TabOrder = 8
      ImeName = 'Russian'
      OnEnter = CtrlEnter
      OnExit = CtrlExit
      OnKeyDown = GoNextKeyDown
      OnKeyPress = GoNext
    end
    object lcbPriceTypes: TssDBLookupCombo
      Left = 156
      Top = 258
      Width = 334
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      Enabled = False
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
    object chbShowNullMats: TcxCheckBox
      Left = 132
      Top = 185
      Width = 391
      Height = 24
      ParentFont = False
      Properties.Alignment = taLeftJustify
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1090#1086#1074#1072#1088#1099' '#1089' '#1085#1091#1083#1077#1074#1099#1084' '#1086#1089#1090#1072#1090#1082#1086#1084' '#1080' '#1086#1073#1086#1088#1086#1090#1072#1084#1080
      Style.StyleController = dmData.scMain
      TabOrder = 5
      ImeName = 'Russian'
      OnEnter = CtrlEnter
      OnExit = CtrlExit
      OnKeyDown = GoNextKeyDown
      OnKeyPress = GoNext
    end
  end
  inherited panButtons: TPanel
    Top = 580
  end
  inherited panToolBar: TPanel
    inherited btnUseLogo: TssSpeedButton
      ImageIndex = 118
    end
    inherited btnUseDiagram: TssSpeedButton
      ImageIndex = 103
    end
  end
  inherited FormStorage: TssFormStorage
    Active = True
    StoredProps.Strings = (
      'chbPriceType.Checked'
      'chbGrpBy.Checked'
      'chbShowNullMats.Checked')
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
    Left = 120
    Top = 19
  end
  inherited dsMaster: TDataSource
    Left = 150
    Top = 20
  end
  inherited frDBDSMaster: TfrDBDataSet
    Left = 181
    Top = 20
  end
  inherited cdsDetail: TssClientDataSet
    Left = 150
    Top = 50
  end
  inherited dsDetail: TDataSource
    Left = 180
    Top = 50
  end
  inherited frDBDSDetail: TfrDBDataSet
    Left = 210
    Top = 50
  end
  inherited cdsSubDetail: TssClientDataSet
    Left = 180
    Top = 81
  end
  inherited dsSubDetail: TDataSource
    Left = 210
    Top = 81
  end
  inherited frDBDSSubDetail: TfrDBDataSet
    Left = 241
    Top = 81
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
  object srcPriceTypes: TDataSource
    DataSet = cdsPriceTypes
    Left = 20
    Top = 176
  end
  object cdsPriceTypes: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pPriceTypes_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 48
    Top = 176
  end
end
