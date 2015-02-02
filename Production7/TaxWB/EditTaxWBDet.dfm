inherited frmEditTaxWBDet: TfrmEditTaxWBDet
  Left = 346
  Top = 210
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'frmEditTaxWBDet'
  ClientHeight = 332
  ClientWidth = 624
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Top = 45
    Width = 624
    Height = 253
    DesignSize = (
      624
      253)
    object ssBevelLeft: TssBevel
      Left = 5
      Top = 7
      Width = 613
      Height = 239
      Anchors = [akLeft, akTop, akRight, akBottom]
      ColorGrBegin = clBtnFace
      ColorGrEnd = clBtnFace
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object ssBevel8: TssBevel
      Left = 388
      Top = -25
      Width = 11
      Height = 20
      ColorGrBegin = clBtnFace
      ColorGrEnd = clBtnFace
      ColorInner = clBtnShadow
      ColorOuter = clGray
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsLeftLine
      Style = bsSingle
      UseGradient = False
      Visible = False
    end
    object lDateOfShipment: TLabel
      Left = 18
      Top = 70
      Width = 83
      Height = 16
      Caption = #1044#1072#1090#1072' '#1086#1090#1075#1088#1091#1079#1082#1080
    end
    object lAmount: TLabel
      Left = 18
      Top = 98
      Width = 68
      Height = 16
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
    end
    object lPrice: TLabel
      Left = 335
      Top = 70
      Width = 69
      Height = 16
      Caption = #1062#1077#1085#1072' '#1089' '#1053#1044#1057
    end
    object ssBevel4: TssBevel
      Left = 5
      Top = 55
      Width = 613
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
    object ssBevel9: TssBevel
      Left = 5
      Top = 130
      Width = 613
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
    object stMeasureName: TssBevel
      Left = 267
      Top = 96
      Width = 51
      Height = 23
      Alignments.Horz = taCenter
      ColorGrBegin = clWindow
      ColorGrEnd = clWindow
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      GradientDirection = gdVertical
      HotTrack = False
      ImageIndex = 0
      UseGradient = True
    end
    object stCurrShortName: TssBevel
      Left = 567
      Top = 66
      Width = 42
      Height = 24
      Alignments.Horz = taCenter
      Caption = 'UAH'
      ColorGrBegin = clWindow
      ColorGrEnd = clWindow
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      GradientDirection = gdVertical
      HotTrack = False
      ImageIndex = 0
      UseGradient = True
    end
    object stCurrShortNameOutNDS: TssBevel
      Left = 567
      Top = 96
      Width = 42
      Height = 23
      Alignments.Horz = taCenter
      Anchors = [akTop, akRight]
      Caption = 'UAH'
      ColorGrBegin = clWindow
      ColorGrEnd = clWindow
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      GradientDirection = gdVertical
      HotTrack = False
      ImageIndex = 0
      UseGradient = True
    end
    object lPriceNoNDS: TssLabel
      Left = 335
      Top = 100
      Width = 49
      Height = 16
      Caption = #1073#1077#1079' '#1053#1044#1057
      DisabledDraw = ddUser
      DisabledColor = clBtnShadow
    end
    object lSummary: TLabel
      Left = 18
      Top = 146
      Width = 38
      Height = 16
      Anchors = [akTop, akRight]
      Caption = #1048#1090#1086#1075#1086':'
      Transparent = True
    end
    object lAmountEx: TLabel
      Left = 143
      Top = 146
      Width = 73
      Height = 16
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
      Transparent = True
    end
    object lSummWONDS: TLabel
      Left = 143
      Top = 170
      Width = 95
      Height = 16
      Caption = #1057#1091#1084#1084#1072' '#1073#1077#1079' '#1053#1044#1057':'
      Transparent = True
    end
    object lNDS: TssLabel
      Left = 143
      Top = 193
      Width = 60
      Height = 16
      Caption = #1053#1044#1057' 18%:'
      Transparent = True
      DisabledDraw = ddUser
      DisabledColor = clBtnShadow
    end
    object lSummWithNDS: TssLabel
      Left = 143
      Top = 214
      Width = 81
      Height = 16
      Caption = #1057#1091#1084#1084#1072' '#1089' '#1053#1044#1057':'
      Transparent = True
      DisabledDraw = ddUser
      DisabledColor = clBtnShadow
    end
    object stAmountEx: TssBevel
      Left = 319
      Top = 143
      Width = 239
      Height = 23
      Alignments.Horz = taRightJustify
      Caption = '0,00'
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
      GradientDirection = gdVertical
      HotTrack = False
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      UseGradient = True
    end
    object txtSummAmount: TssBevel
      Left = 560
      Top = 143
      Width = 49
      Height = 23
      Alignments.Horz = taCenter
      ColorGrBegin = clWindow
      ColorGrEnd = clWindow
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      GradientDirection = gdVertical
      HotTrack = False
      ImageIndex = 0
      UseGradient = True
    end
    object stSumm: TssBevel
      Left = 319
      Top = 165
      Width = 239
      Height = 23
      Alignments.Horz = taRightJustify
      Caption = '0,00'
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
      GradientDirection = gdVertical
      HotTrack = False
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      UseGradient = True
    end
    object txtSummWONDS: TssBevel
      Left = 560
      Top = 165
      Width = 49
      Height = 23
      Alignments.Horz = taCenter
      Caption = 'UAH'
      ColorGrBegin = clWindow
      ColorGrEnd = clWindow
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      GradientDirection = gdVertical
      HotTrack = False
      ImageIndex = 0
      UseGradient = True
    end
    object stSummNDS: TssBevel
      Left = 319
      Top = 187
      Width = 239
      Height = 23
      Alignments.Horz = taRightJustify
      Caption = '0,00'
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
      GradientDirection = gdVertical
      HotTrack = False
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      UseGradient = True
    end
    object txtSummNDS: TssBevel
      Left = 560
      Top = 187
      Width = 49
      Height = 23
      Alignments.Horz = taCenter
      Caption = 'UAH'
      ColorGrBegin = clWindow
      ColorGrEnd = clWindow
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      GradientDirection = gdVertical
      HotTrack = False
      ImageIndex = 0
      UseGradient = True
    end
    object stSummWithNDS: TssBevel
      Left = 319
      Top = 209
      Width = 239
      Height = 24
      Alignments.Horz = taRightJustify
      Caption = '0,00'
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
      GradientDirection = gdVertical
      HotTrack = False
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      UseGradient = True
    end
    object txtSummWithNDS: TssBevel
      Left = 560
      Top = 209
      Width = 49
      Height = 24
      Alignments.Horz = taCenter
      Caption = 'UAH'
      ColorGrBegin = clWindow
      ColorGrEnd = clWindow
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      GradientDirection = gdVertical
      HotTrack = False
      ImageIndex = 0
      UseGradient = True
    end
    object edPrice: TssCalcEdit
      Left = 438
      Top = 65
      Width = 128
      Height = 24
      EditValue = 0.000000000000000000
      ImeName = 'Russian'
      Properties.ImmediatePost = True
      Properties.OnChange = edPricePropertiesChange
      Style.StyleController = dmData.scMain
      TabOrder = 3
      OnKeyDown = GoNextKeyDown
      OnKeyPress = edPriceKeyPress
      CalcColor = clBtnFace
      DecimalPlaces = 6
    end
    object edAmount: TssCalcEdit
      Left = 143
      Top = 95
      Width = 123
      Height = 24
      EditValue = 0.000000000000000000
      ImeName = 'Russian'
      Properties.OnChange = edAmountPropertiesChange
      Style.StyleController = dmData.scMain
      TabOrder = 2
      OnKeyDown = GoNextKeyDown
      OnKeyPress = edAmountKeyPress
      CalcColor = clBtnFace
      DecimalPlaces = 3
    end
    object edPriceNoNDS: TssCalcEdit
      Left = 438
      Top = 95
      Width = 128
      Height = 24
      Anchors = [akTop, akRight]
      EditValue = 0.000000000000000000
      ImeName = 'Russian'
      Properties.OnChange = edPriceNondsPropertiesChange
      Style.StyleController = dmData.scMain
      TabOrder = 4
      OnKeyDown = GoNextKeyDown
      OnKeyPress = edPriceNoNDSKeyPress
      CalcColor = clBtnFace
      DecimalPlaces = 6
    end
    object edDateOfShipment: TcxDateEdit
      Left = 143
      Top = 65
      Width = 123
      Height = 24
      ImeName = 'Russian'
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.StyleController = dmData.scMain
      TabOrder = 1
      OnKeyDown = GoNextKeyDown
      OnKeyPress = edDateOfShipmentKeyPress
      EditValue = 0d
    end
    object edMat: TokMatSearchEdit
      Left = 18
      Top = 17
      Width = 591
      Height = 31
      Hint = '55555'
      ButtonsLeftMargin = 3
      Color = clBtnFace
      CapFind = 'Search'
      CapFindParams = 'Search options'
      CapRef = 'Products Directory'
      CapContextFind = 'Context search'
      CapFindBegin = 'From the beginning'
      CapFindConcurr = 'Full match'
      CapFindSubstr = 'Partial match'
      EditorOffset = 81
      DisabledImages = dmData.Images18x18dis
      Images = dmData.Images18x18
      ImageIndexRef = 22
      ImageIndexFind = 18
      ImageIndexFindParams = 19
      LangManager = dmData.Lng
      ParentColor = False
      RemoteServer = dmData.SConnection
      ShowHint = True
      SearchNames.Strings = (
        'Name;name'
        'Model;artikul'
        'Barcode;barcode')
      SearchType = stBegin
      TabOrder = 0
      OnChange = edMatChange
      OnRefButtonClick = edMatRefButtonClick
      AllowZeroRest = True
      LoadNDS = True
      LoadTaxes = True
      ScannerImageIndex = 50
      DesignSize = (
        591
        31)
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 624
    object lTitle: TLabel [0]
      Left = 5
      Top = 5
      Width = 25
      Height = 16
      Caption = 'Test'
      Transparent = True
      OnMouseDown = panTitleBarMouseDown
    end
    object lMatEx: TLabel [1]
      Left = 44
      Top = 5
      Width = 6
      Height = 16
      AutoSize = False
      Caption = ' '
      Transparent = True
      OnMouseDown = panTitleBarMouseDown
    end
    inherited panTitleButtons: TssPanel
      Left = 565
      Width = 57
      inherited btnTBMinimize: TssSpeedButton
        Height = 14
      end
      inherited btnTBMaximize: TssSpeedButton
        Height = 14
      end
      inherited btnTBClose: TssSpeedButton
        Height = 14
      end
    end
  end
  inherited panButtons: TPanel
    Top = 298
    Width = 624
    Height = 34
    inherited btnOK: TxButton
      Left = 311
      Top = 4
      Width = 99
      Height = 24
    end
    inherited btnCancel: TxButton
      Left = 415
      Top = 4
      Width = 97
      Height = 24
    end
    inherited btnApply: TxButton
      Left = 518
      Top = 4
      Width = 99
      Height = 24
    end
  end
  inherited panToolBar: TPanel
    Width = 624
    Height = 24
    inherited btnLock: TssSpeedButton
      Left = 533
      Top = 2
      Width = 22
      Height = 22
      LeftMargin = 2
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 561
      Top = 2
      Width = 22
      Height = 22
      LeftMargin = 2
    end
    inherited btnHelp: TssSpeedButton
      Left = 590
      Top = 2
      Width = 22
      Height = 22
      LeftMargin = 2
    end
    object btnInfo: TssSpeedButton
      Left = 5
      Top = 1
      Width = 22
      Height = 22
      Action = aMatInfo
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 99
      Images = dmData.Images
      LeftMargin = 2
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object btnMove: TssSpeedButton
      Left = 33
      Top = 1
      Width = 22
      Height = 22
      Action = aMatMove
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 61
      Images = dmData.Images
      LeftMargin = 2
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object btnRsv: TssSpeedButton
      Left = 62
      Top = 1
      Width = 22
      Height = 22
      Action = aMatRsv
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 100
      Images = dmData.Images
      LeftMargin = 2
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object btnMC: TssSpeedButton
      Left = 90
      Top = 1
      Width = 22
      Height = 22
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      Caption = 'aShowTurnIn'
      GroupIndex = 0
      ImageIndex = 153
      Images = dmData.Images
      LeftMargin = 2
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnMCClick
    end
  end
  inherited FormStorage: TssFormStorage
    Left = 205
    Top = 58
  end
  inherited ActionList: TActionList
    Left = 198
    Top = 51
    object aMatInfo: TAction
      Caption = 'aMatInfo'
      ImageIndex = 99
      OnExecute = aMatInfoExecute
    end
    object aMatMove: TAction
      Caption = 'aMatMove'
      ImageIndex = 61
      OnExecute = aMatMoveExecute
    end
    object aMatRsv: TAction
      Caption = 'aMatRsv'
      ImageIndex = 100
      OnExecute = aMatRsvExecute
    end
    object aAddMat: TAction
      Caption = 'aAddMat'
      ShortCut = 16429
      OnExecute = aAddMatExecute
    end
  end
  object cdsFind: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pSQL'
    RemoteServer = dmData.SConnection
    Macros = <
      item
        DataType = ftString
        Name = 'sql'
        ParamType = ptUnknown
      end>
    Left = 126
    Top = 30
  end
end
