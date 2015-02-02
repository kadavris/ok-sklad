inherited frmEditKAAccount: TfrmEditKAAccount
  Left = 359
  Top = 213
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'frmEditKAAccount'
  ClientHeight = 295
  ClientWidth = 562
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panTitleBar: TssGradientPanel
    Width = 562
    TabOrder = 2
    inherited panTitleButtons: TssPanel
      Left = 503
    end
  end
  inherited panButtons: TPanel
    Top = 255
    Width = 562
    Height = 40
    inherited btnOK: TxButton
      Left = 249
      Top = 7
    end
    inherited btnCancel: TxButton
      Left = 353
      Top = 7
    end
    inherited btnApply: TxButton
      Left = 458
      Top = 7
    end
  end
  object panMain: TPanel [2]
    Left = 0
    Top = 21
    Width = 562
    Height = 234
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      562
      234)
    object bvlMain: TssBevel
      Left = 6
      Top = 31
      Width = 550
      Height = 197
      Anchors = [akLeft, akTop, akRight, akBottom]
      ColorGrBegin = clBtnFace
      ColorGrEnd = clBtnFace
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      UseGradient = False
    end
    object lAccount: TLabel
      Left = 21
      Top = 94
      Width = 28
      Height = 16
      Caption = #1057#1095#1105#1090
    end
    object lType: TLabel
      Left = 21
      Top = 123
      Width = 22
      Height = 16
      Caption = #1058#1080#1087
    end
    object lBank: TLabel
      Left = 21
      Top = 150
      Width = 29
      Height = 16
      Caption = #1052#1060#1054
    end
    object txtBankName: TssBevel
      Left = 114
      Top = 175
      Width = 403
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      ColorGrBegin = clWindow
      ColorGrEnd = clWindow
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = True
    end
    object lBankName: TLabel
      Left = 21
      Top = 176
      Width = 28
      Height = 16
      Caption = #1041#1072#1085#1082
    end
    object ssBevel4: TssBevel
      Left = 7
      Top = 76
      Width = 549
      Height = 2
      Anchors = [akLeft, akTop, akRight]
      ColorGrBegin = clBtnFace
      ColorGrEnd = clBtnFace
      ColorInner = clBtnShadow
      ColorOuter = clBtnHighlight
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsTopLine
      UseGradient = False
    end
    object lKAName: TLabel
      Left = 49
      Top = 47
      Width = 138
      Height = 16
      Caption = #1054#1054#1054' "'#1056#1086#1075#1072' '#1080' '#1082#1086#1087#1099#1090#1072'"'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object imgKAgent: TImage
      Left = 20
      Top = 46
      Width = 19
      Height = 19
      Transparent = True
    end
    object btnHelp: TssSpeedButton
      Left = 528
      Top = 1
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 7
      Images = dmData.Images18x18
      LeftMargin = 4
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object btnLock: TssSpeedButton
      Left = 500
      Top = 1
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      Caption = 'aShowTurnIn'
      GroupIndex = 0
      ImageIndex = 90
      Images = dmData.Images
      LeftMargin = 4
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnLockClick
    end
    object btnBankRef: TssSpeedButton
      Left = 519
      Top = 160
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 19
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnBankRefClick
    end
    object edAccount: TcxTextEdit
      Left = 113
      Top = 92
      Width = 405
      Height = 24
      Properties.MaxLength = 64
      Properties.OnChange = DataModified
      Style.StyleController = dmData.scMain
      TabOrder = 0
      ImeName = 'Russian'
      OnKeyDown = GoNextKeyDown
      OnKeyPress = GoNext
    end
    object lcbAccType: TssDBLookupCombo
      Left = 113
      Top = 119
      Width = 405
      Height = 24
      ImeName = 'Russian'
      Properties.DropDownListStyle = lsFixedList
      Properties.OnChange = DataModified
      Style.StyleController = dmData.scMain
      TabOrder = 1
      OnKeyPress = GoNext
      EmptyValue = 0
      KeyField = 'typeid'
      ListField = 'name'
      ListSource = srcAccType
    end
    object lcbBank: TssDBComboBox
      Left = 113
      Top = 146
      Width = 405
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      DataBinding.DataField = 'BANKID'
      ImeName = 'Russian'
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'BANKID'
      Properties.ListColumns = <
        item
          MinWidth = 60
          FieldName = 'MFO'
        end
        item
          FieldName = 'NAME'
        end>
      Properties.ListOptions.GridLines = glVertical
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = srcBanks
      Properties.OnEditValueChanged = lcbBankPropertiesEditValueChanged
      Style.StyleController = dmData.scMain
      TabOrder = 2
      OnKeyPress = GoNext
      DefFieldName = 'DEF'
    end
  end
  inherited ilTitleBar: TImageList
    Left = 152
    Top = 24
  end
  object FormStorage: TssFormStorage [4]
    Active = False
    UseRegistry = True
    StoredValues = <>
    Left = 256
    Top = 36
  end
  inherited ActionList: TActionList
    Left = 284
  end
  object cdsBanks: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pBanks_List'
    RemoteServer = dmData.SConnection
    AfterOpen = cdsBanksAfterOpen
    Macros = <>
    Left = 348
    Top = 68
  end
  object srcBanks: TDataSource
    DataSet = cdsBanks
    Left = 376
    Top = 68
  end
  object cdsAccType: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pAccountType_List'
    RemoteServer = dmData.SConnection
    AfterOpen = cdsAccTypeAfterOpen
    Macros = <>
    Left = 352
    Top = 36
  end
  object srcAccType: TDataSource
    DataSet = cdsAccType
    Left = 380
    Top = 36
  end
end
