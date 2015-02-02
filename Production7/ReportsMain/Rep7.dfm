inherited frmRep7: TfrmRep7
  Left = 415
  Top = 217
  Caption = 'frmRep7'
  ClientHeight = 555
  ClientWidth = 557
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 557
    Height = 473
    object lWhouse: TLabel [0]
      Left = 20
      Top = 82
      Width = 40
      Height = 16
      Caption = #1057#1082#1083#1072#1076':'
    end
    object btnAddWHouse: TssSpeedButton [1]
      Left = 481
      Top = 49
      Width = 22
      Height = 22
      Action = aRef
      Alignment = taCenter
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      DisabledImages = dmData.Images18x18dis
      GroupIndex = 0
      ImageIndex = -1
      Images = dmData.Images18x18
      LeftMargin = 2
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnMouseDown = btnAddWHouseMouseDown
      OnMouseUp = btnAddWHouseMouseUp
    end
    object lMatGroup: TLabel [2]
      Left = 20
      Top = 81
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
      Left = 481
      Top = 79
      Width = 22
      Height = 22
      Action = aRef
      Alignment = taCenter
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = -1
      Images = dmData.Images18x18
      LeftMargin = 2
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnMouseDown = btnAddMGMouseDown
      OnMouseUp = btnAddWHouseMouseUp
    end
    object btnDrillDown: TssSpeedButton [4]
      Left = 514
      Top = 79
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
    object lOnDate: TLabel [5]
      Left = 20
      Top = 53
      Width = 34
      Height = 16
      Caption = #1044#1072#1090#1072':'
    end
    inherited panNotes: TPanel
      Left = 1
      Top = 271
      Height = 55
      TabOrder = 6
      Visible = False
      inherited lTextNotes: TLabel
        Height = 55
      end
    end
    inherited dbgRef: TdxDBTreeList
      Left = 41
      Top = 422
      TabOrder = 7
    end
    object lcbWHouse: TssDBLookupCombo
      Left = 137
      Top = 48
      Width = 343
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      ImeName = 'Russian'
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Style.StyleController = dmData.scMain
      TabOrder = 1
      OnEnter = lcbWHouseEnter
      OnExit = lcbWHouseExit
      EmptyValue = 0
      KeyField = 'wid'
      ListField = 'name'
      ListSource = dsWhouse
    end
    object edMatGroup: TssPopupTreeEdit
      Tag = 10
      Left = 137
      Top = 78
      Width = 343
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Properties.PopupAutoSize = False
      Properties.PopupSizeable = False
      Properties.PopupWidth = 341
      Properties.ReadOnly = False
      Properties.OnChange = edMatGroupPropertiesChange
      Style.StyleController = dmData.scMain
      TabOrder = 2
      ImeName = 'Russian'
      OnEnter = lcbWHouseEnter
      OnExit = lcbWHouseExit
      OnGetNodeImageIndex = edMatGroupGetNodeImageIndex
      ListSource = dsMatGroup
      KeyField = 'grpid'
      ParentField = 'pid'
      DisplayField = 'name'
      ShowExpandedTree = False
      Images = dmData.Images
    end
    object gb7PriceTypes: TssGroupBox
      Left = 137
      Top = 240
      Width = 376
      Height = 124
      Alignment = alTopLeft
      Caption = 'gb7PriceTypes'
      TabOrder = 4
      Edges = [beLeft, beRight, beTop, beBottom]
      DesignSize = (
        376
        124)
      object rbt7DefPrice: TcxRadioButton
        Left = 15
        Top = 30
        Width = 346
        Height = 20
        Caption = 'rbt7DefPrice'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = rbt7DefPriceClick
      end
      object rbt7PriceType: TcxRadioButton
        Left = 15
        Top = 54
        Width = 346
        Height = 21
        Caption = 'rbt7PriceType'
        TabOrder = 1
        OnClick = rbt7DefPriceClick
      end
      object lcbPriceTypes: TssDBLookupCombo
        Left = 37
        Top = 81
        Width = 326
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        Enabled = False
        ImeName = 'Russian'
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Style.StyleController = dmData.scMain
        TabOrder = 2
        EmptyValue = 0
        KeyField = 'ptypeid'
        ListField = 'name'
        ListSource = srcPriceTypes
      end
    end
    object chbPrintArtikuls: TcxCheckBox
      Left = 132
      Top = 370
      Width = 363
      Height = 24
      ParentFont = False
      Properties.Alignment = taLeftJustify
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1077#1095#1072#1090#1072#1090#1100' '#1072#1088#1090#1080#1082#1091#1083#1099
      Style.StyleController = dmData.scMain
      TabOrder = 5
      ImeName = 'Russian'
      OnKeyDown = GoNextKeyDown
    end
    object edOnDate: TcxDateEdit
      Left = 137
      Top = 18
      Width = 98
      Height = 24
      BeepOnEnter = False
      ImeName = 'Russian'
      ParentFont = False
      Properties.ReadOnly = False
      Style.BorderColor = clBtnShadow
      Style.BorderStyle = ebsUltraFlat
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      Style.StyleController = dmData.scMain
      Style.ButtonStyle = btsUltraFlat
      TabOrder = 0
    end
    object gbGrp: TssGroupBox
      Left = 137
      Top = 116
      Width = 376
      Height = 109
      Alignment = alTopLeft
      Caption = ' '#1043#1088#1091#1087#1087#1080#1088#1086#1074#1072#1090#1100' '
      TabOrder = 3
      Edges = [beLeft, beRight, beTop, beBottom]
      object rbtByGrp: TcxRadioButton
        Left = 15
        Top = 26
        Width = 346
        Height = 21
        Caption = #1087#1086' '#1090#1086#1074#1072#1088#1085#1099#1084' '#1075#1088#1091#1087#1087#1072#1084
        TabOrder = 0
        OnClick = rbt7DefPriceClick
      end
      object rbtByProducer: TcxRadioButton
        Left = 15
        Top = 50
        Width = 346
        Height = 21
        Caption = #1087#1086' '#1087#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1103#1084
        TabOrder = 1
        OnClick = rbt7DefPriceClick
      end
      object rbtNoGrp: TcxRadioButton
        Left = 15
        Top = 75
        Width = 346
        Height = 21
        Caption = #1085#1077' '#1075#1088#1091#1087#1087#1080#1088#1086#1074#1072#1090#1100
        Checked = True
        TabOrder = 2
        TabStop = True
        OnClick = rbt7DefPriceClick
      end
    end
    object chbShowAcc: TcxCheckBox
      Left = 132
      Top = 395
      Width = 363
      Height = 24
      ParentFont = False
      Properties.Alignment = taLeftJustify
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1077#1095#1072#1090#1072#1090#1100' '#1082#1086#1083#1086#1085#1082#1091' "'#1047#1072#1082#1072#1079#1072#1090#1100'"'
      Style.StyleController = dmData.scMain
      TabOrder = 8
      ImeName = 'Russian'
      OnKeyDown = GoNextKeyDown
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 557
    inherited panTitleButtons: TssPanel
      Left = 499
    end
  end
  inherited panButtons: TPanel
    Top = 520
    Width = 557
    inherited btnOK: TxButton
      Left = 233
    end
    inherited btnCancel: TxButton
      Left = 450
    end
    inherited btnApply: TxButton
      Left = 342
    end
  end
  inherited panToolBar: TPanel
    Width = 557
    inherited btnLock: TssSpeedButton
      Left = 506
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 530
    end
    inherited btnHelp: TssSpeedButton
      Left = 482
    end
    inherited btnUseLogo: TssSpeedButton
      Left = 31
      Width = 22
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      LeftMargin = 2
    end
    inherited btnUseDiagram: TssSpeedButton
      Left = 4
      Width = 22
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      LeftMargin = 2
    end
  end
  inherited ilTitleBar: TImageList
    Left = 36
    Top = 212
  end
  inherited FormStorage: TssFormStorage
    StoredProps.Strings = (
      'chbPrintArtikuls.Checked')
    Left = 208
    Top = 80
  end
  inherited ActionList: TActionList
    Left = 64
    Top = 212
  end
  inherited frReport1: TfrReport
    Left = 244
    ReportForm = {19000000}
  end
  inherited frChartObject1: TfrChartObject
    Left = 300
  end
  inherited cdsMaster: TssMemoryData
    Left = 16
    Top = 251
  end
  inherited dsMaster: TDataSource
    Left = 46
    Top = 252
  end
  inherited frDBDSMaster: TfrDBDataSet
    Left = 77
    Top = 252
  end
  inherited cdsDetail: TssClientDataSet
    Left = 18
    Top = 290
  end
  inherited dsDetail: TDataSource
    Left = 48
    Top = 290
  end
  inherited frDBDSDetail: TfrDBDataSet
    Left = 78
    Top = 290
  end
  inherited cdsSubDetail: TssClientDataSet
    Left = 20
    Top = 333
  end
  inherited dsSubDetail: TDataSource
    Left = 50
    Top = 333
  end
  inherited frDBDSSubDetail: TfrDBDataSet
    Left = 81
    Top = 333
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
    Left = 22
    Top = 153
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
    Left = 50
    Top = 153
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
    Left = 22
    Top = 181
  end
  object dsMatGroup: TDataSource
    DataSet = cdsMatGroup
    Left = 50
    Top = 181
  end
  object ActionList1: TActionList
    Left = 60
    Top = 125
    object aRef: TAction
      Caption = 'aRef'
      ShortCut = 16429
      OnExecute = aRefExecute
    end
  end
  object srcPriceTypes: TDataSource
    DataSet = cdsPriceTypes
    Left = 276
    Top = 224
  end
  object cdsPriceTypes: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pPriceTypes_List'
    RemoteServer = dmData.SConnection
    AfterOpen = cdsPriceTypesAfterOpen
    Macros = <>
    Left = 304
    Top = 224
  end
end
