inherited frmRep14: TfrmRep14
  Left = 342
  Top = 204
  Caption = 'frmRep14'
  ClientHeight = 558
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Height = 476
    object lWhouse: TLabel [0]
      Left = 20
      Top = 123
      Width = 21
      Height = 16
      Caption = #1057#1082#1083
    end
    object btnAddWHouse: TssSpeedButton [1]
      Left = 455
      Top = 116
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
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnMouseDown = btnAddWHouseMouseDown
      OnMouseUp = btnAddWHouseMouseUp
    end
    object lMatGroup: TLabel [2]
      Left = 20
      Top = 154
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
      Left = 455
      Top = 149
      Action = aRef
      Alignment = taCenter
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = -1
      Images = dmData.Images18x18
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnMouseDown = btnAddMGMouseDown
      OnMouseUp = btnAddWHouseMouseUp
    end
    object btnDrillDown: TssSpeedButton [4]
      Left = 486
      Top = 149
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
    object lPosAmount: TLabel [5]
      Left = 254
      Top = 405
      Width = 56
      Height = 16
      Alignment = taRightJustify
      AutoSize = False
      Caption = #1087#1086#1079
    end
    inherited panNotes: TPanel
      Left = 1231
      Top = 271
      Height = 55
      Visible = False
      inherited lTextNotes: TLabel
        Height = 55
      end
    end
    inherited dbgRef: TdxDBTreeList
      Left = 1231
      Top = 414
    end
    object lcbWHouse: TssDBLookupCombo
      Left = 137
      Top = 118
      Width = 317
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      ImeName = 'Russian'
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Style.StyleController = dmData.scMain
      TabOrder = 3
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
      Top = 150
      Width = 317
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Properties.PopupAutoSize = False
      Properties.PopupSizeable = False
      Properties.PopupWidth = 315
      Properties.ReadOnly = False
      Properties.OnChange = edMatGroupPropertiesChange
      Style.StyleController = dmData.scMain
      TabOrder = 4
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
    object rgSortType: TcxRadioGroup
      Left = 18
      Top = 187
      Width = 249
      Height = 97
      ItemIndex = 0
      ParentFont = False
      Properties.Items = <
        item
          Caption = #1087#1086' '#1082#1086#1083
        end
        item
          Caption = #1087#1086' '#1087#1088#1080#1073
        end
        item
          Caption = #1087#1086' '#1086#1090#1085' '#1087#1088#1080#1073
        end>
      Style.BorderColor = clBtnText
      Style.BorderStyle = ebsUltraFlat
      Style.StyleController = dmData.scMain
      TabOrder = 5
      Caption = ' '#1057#1086#1088#1090' '
    end
    object rgSortDirect: TcxRadioGroup
      Left = 274
      Top = 187
      Width = 239
      Height = 97
      ItemIndex = 1
      ParentFont = False
      Properties.Items = <
        item
          Caption = #1087#1086' '#1074#1086#1079#1088
        end
        item
          Caption = #1087#1086' '#1091#1073#1099#1074
        end>
      Style.StyleController = dmData.scMain
      TabOrder = 6
      Caption = ' '#1053#1072#1087#1088
    end
    object chbPosAmount: TcxCheckBox
      Left = 25
      Top = 400
      Width = 145
      Height = 26
      AutoSize = False
      ParentFont = False
      Properties.Alignment = taLeftJustify
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1086#1082' '#1087#1077#1088#1074
      Style.StyleController = dmData.scMain
      TabOrder = 7
      ImeName = 'Russian'
      OnClick = chbPosAmountClick
      OnKeyDown = GoNextKeyDown
    end
    object edPosAmount: TcxSpinEdit
      Left = 171
      Top = 400
      Width = 80
      Height = 24
      Enabled = False
      Properties.MaxValue = 1000000000.000000000000000000
      Style.ButtonStyle = btsUltraFlat
      TabOrder = 8
      Value = 10
      ImeName = 'Russian'
    end
    object rgMats: TcxRadioGroup
      Left = 18
      Top = 293
      Width = 495
      Height = 97
      ItemIndex = 0
      ParentFont = False
      Properties.Items = <
        item
          Caption = #1058#1086#1083#1100#1082#1086' '#1090#1086#1074#1072#1088#1099', '#1082#1086#1090#1086#1088#1099#1077' '#1087#1088#1086#1076#1072#1074#1072#1083#1080#1089#1100
        end
        item
          Caption = #1058#1086#1083#1100#1082#1086' '#1090#1086#1074#1072#1088#1099', '#1082#1086#1090#1086#1088#1099#1077' '#1085#1077' '#1087#1088#1086#1076#1072#1074#1072#1083#1080#1089#1100
        end
        item
          Caption = #1048' '#1090#1077' '#1080' '#1076#1088#1091#1075#1080#1077
        end>
      Style.StyleController = dmData.scMain
      TabOrder = 9
      Caption = ' '#1042#1082#1083#1102#1095#1080#1090#1100' '#1074' '#1086#1090#1095#1105#1090' '
    end
    object chbOnlyNull: TcxCheckBox
      Left = 25
      Top = 426
      Width = 488
      Height = 26
      AutoSize = False
      ParentFont = False
      Properties.Alignment = taLeftJustify
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1090#1086#1074#1072#1088#1099' '#1089' '#1085#1091#1083#1077#1074#1099#1084' '#1089#1074#1086#1073#1086#1076#1085#1099#1084' '#1086#1089#1090#1072#1090#1082#1086#1084
      Style.StyleController = dmData.scMain
      TabOrder = 10
      ImeName = 'Russian'
      OnKeyDown = GoNextKeyDown
    end
  end
  inherited panButtons: TPanel
    Top = 523
  end
  inherited panToolBar: TPanel
    inherited btnLock: TssSpeedButton
      Left = 446
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 473
    end
    inherited btnHelp: TssSpeedButton
      Left = 500
    end
    inherited btnUseLogo: TssSpeedButton
      ImageIndex = 118
    end
    inherited btnUseDiagram: TssSpeedButton
      ImageIndex = 103
    end
  end
  inherited ilTitleBar: TImageList
    Left = 36
    Top = 52
  end
  inherited FormStorage: TssFormStorage
    Left = 208
    Top = 80
  end
  inherited ActionList: TActionList
    Left = 64
    Top = 52
  end
  inherited frReport1: TfrReport
    Left = 244
    ReportForm = {19000000}
  end
  inherited frChartObject1: TfrChartObject
    Left = 300
  end
  inherited cdsMaster: TssMemoryData
    Left = 12
    Top = 75
  end
  inherited dsMaster: TDataSource
    Left = 42
    Top = 76
  end
  inherited frDBDSMaster: TfrDBDataSet
    Left = 73
    Top = 76
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
    Left = 166
    Top = 113
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
    Left = 194
    Top = 113
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
    Left = 166
    Top = 141
  end
  object dsMatGroup: TDataSource
    DataSet = cdsMatGroup
    Left = 194
    Top = 141
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
end
