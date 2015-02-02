inherited frmEditInvPos: TfrmEditInvPos
  Left = 362
  Top = 199
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'frmEditInvPos'
  ClientHeight = 355
  ClientWidth = 624
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 624
    Height = 273
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
    object panMat: TPanel
      Left = 0
      Top = 0
      Width = 624
      Height = 81
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        624
        81)
      object ssBevel2: TssBevel
        Left = 2
        Top = 1
        Width = 617
        Height = 80
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
      object lWhouse: TLabel
        Left = 12
        Top = 18
        Width = 65
        Height = 16
        Caption = 'Warehouse'
      end
      object txtWHouse: TssBevel
        Left = 96
        Top = 16
        Width = 427
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        ColorGrBegin = clWindow
        ColorGrEnd = clWindow
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = [beLeft, beRight, beTop, beBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        GradientDirection = gdVertical
        HotTrack = False
        ImageIndex = 0
        ParentShowHint = False
        ShowHint = True
        UseGradient = True
      end
      object sbAddWHouse: TssSpeedButton
        Left = 526
        Top = 14
        Width = 27
        Height = 27
        Alignment = taCenter
        AllwaysShowFrame = False
        Anchors = [akTop, akRight]
        ButtonType = ssbtStandard
        Checked = False
        DisabledImages = dmData.Images18x18dis
        Enabled = False
        GroupIndex = 0
        ImageIndex = 26
        Images = dmData.Images18x18
        LeftMargin = 3
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
      end
      object edMat: TokMatSearchEdit
        Left = 12
        Top = 42
        Width = 598
        Height = 31
        ButtonsLeftMargin = 3
        CapFind = 'Search'
        CapFindParams = 'Search options'
        CapRef = 'Products Directory'
        CapContextFind = 'Context search'
        CapFindBegin = 'From the beginning'
        CapFindConcurr = 'Full match'
        CapFindSubstr = 'Partial match'
        EditorOffset = 84
        DisabledImages = dmData.Images18x18dis
        Images = dmData.Images18x18
        ImageIndexRef = 22
        ImageIndexFind = 18
        ImageIndexFindParams = 19
        LangManager = dmData.Lng
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
        ScannerImageIndex = 50
        DesignSize = (
          598
          31)
      end
    end
    object panPrice: TPanel
      Left = 0
      Top = 81
      Width = 624
      Height = 106
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 2
      DesignSize = (
        624
        106)
      object ssBevel3: TssBevel
        Left = 2
        Top = -1
        Width = 617
        Height = 107
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
      object lAmount: TLabel
        Left = 12
        Top = 16
        Width = 81
        Height = 16
        Caption = #1060#1072#1082#1090'. '#1082#1086#1083'-'#1074#1086':'
      end
      object stMeasureName: TssBevel
        Left = 267
        Top = 12
        Width = 51
        Height = 24
        Alignments.Horz = taCenter
        Caption = #1096#1090'.'
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
      object lRealPrice: TLabel
        Left = 343
        Top = 16
        Width = 70
        Height = 16
        Caption = #1060#1072#1082#1090'. '#1094#1077#1085#1072':'
      end
      object txtRealPriceCurr: TssBevel
        Left = 560
        Top = 12
        Width = 50
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
      object lRemain: TLabel
        Left = 12
        Top = 44
        Width = 96
        Height = 16
        Caption = #1059#1095#1105#1090#1085#1086#1077' '#1082#1086#1083'-'#1074#1086':'
      end
      object stRemain: TssBevel
        Left = 144
        Top = 42
        Width = 121
        Height = 22
        Alignments.Horz = taRightJustify
        Caption = '0'
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
        UseGradient = True
      end
      object stM2: TssBevel
        Left = 267
        Top = 70
        Width = 51
        Height = 22
        Alignments.Horz = taCenter
        Caption = #1096#1090'.'
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
      object lPrice: TLabel
        Left = 343
        Top = 46
        Width = 68
        Height = 16
        Caption = #1059#1095#1105#1090'. '#1094#1077#1085#1072':'
      end
      object txtPrice: TssBevel
        Left = 437
        Top = 42
        Width = 121
        Height = 22
        Alignments.Horz = taRightJustify
        Caption = '0'
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
        UseGradient = True
      end
      object txtCurr: TssBevel
        Left = 560
        Top = 42
        Width = 50
        Height = 22
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
      object lDiff: TLabel
        Left = 12
        Top = 73
        Width = 48
        Height = 16
        Caption = #1056#1072#1079#1085#1080#1094#1072
      end
      object txtDiff: TssBevel
        Left = 144
        Top = 70
        Width = 121
        Height = 22
        Alignments.Horz = taRightJustify
        Caption = '0'
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
        UseGradient = True
      end
      object stM3: TssBevel
        Left = 267
        Top = 42
        Width = 51
        Height = 22
        Alignments.Horz = taCenter
        Caption = #1096#1090'.'
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
      object lDiffSum: TLabel
        Left = 343
        Top = 75
        Width = 42
        Height = 16
        Caption = #1057#1091#1084#1084#1072':'
      end
      object txtDiffSum: TssBevel
        Left = 437
        Top = 70
        Width = 121
        Height = 22
        Alignments.Horz = taRightJustify
        Caption = '0'
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
        UseGradient = True
      end
      object txtDiffSumCurr: TssBevel
        Left = 560
        Top = 70
        Width = 50
        Height = 22
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
      object edAmount: TssCalcEdit
        Left = 143
        Top = 11
        Width = 123
        Height = 24
        EditValue = 0.000000000000000000
        ImeName = 'Russian'
        ParentFont = False
        Properties.OnChange = edAmountPropertiesChange
        Style.StyleController = dmData.scMain
        TabOrder = 0
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
        CalcColor = clBtnFace
        DecimalPlaces = 3
      end
      object edRealPrice: TssCalcEdit
        Left = 436
        Top = 11
        Width = 123
        Height = 24
        EditValue = 0.000000000000000000
        ImeName = 'Russian'
        ParentFont = False
        Properties.OnChange = edAmountPropertiesChange
        Style.StyleController = dmData.scMain
        TabOrder = 1
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
        CalcColor = clBtnFace
        DecimalPlaces = 6
      end
    end
    object panSummary: TPanel
      Left = 0
      Top = 187
      Width = 624
      Height = 86
      Align = alClient
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      DesignSize = (
        624
        86)
      object ssBevelLeft: TssBevel
        Left = 2
        Top = -1
        Width = 617
        Height = 85
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
      object lSummary: TLabel
        Left = 12
        Top = 14
        Width = 42
        Height = 16
        Anchors = [akTop, akRight]
        Caption = #1048#1090#1086#1075#1086':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object txtSum: TssBevel
        Left = 345
        Top = 11
        Width = 213
        Height = 23
        Alignments.Horz = taRightJustify
        Caption = '0,00 '
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
      object lSum: TLabel
        Left = 143
        Top = 15
        Width = 90
        Height = 16
        Caption = #1057#1091#1084#1084#1072' '#1073#1077#1079' '#1053#1044#1057
      end
      object lRealSum: TssLabel
        Left = 143
        Top = 37
        Width = 76
        Height = 16
        Caption = #1057#1091#1084#1084#1072' '#1089' '#1053#1044#1057
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object txtRealSum: TssBevel
        Left = 345
        Top = 33
        Width = 213
        Height = 24
        Alignments.Horz = taRightJustify
        Caption = '0,00 '
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
      object txtSummDiff: TssBevel
        Left = 345
        Top = 54
        Width = 213
        Height = 24
        Alignments.Horz = taRightJustify
        Caption = '0,00 '
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
      object lSummDiff: TssLabel
        Left = 143
        Top = 59
        Width = 140
        Height = 16
        Caption = #1057#1091#1084#1084#1072' '#1080#1079#1073'-'#1082#1072'/'#1085#1077#1076#1086#1080#1084#1082#1080
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object txtSumCurr: TssBevel
        Left = 560
        Top = 11
        Width = 50
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
      object txtRealSumCurr: TssBevel
        Left = 560
        Top = 33
        Width = 50
        Height = 22
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
      object txtSumDiffCurr: TssBevel
        Left = 560
        Top = 54
        Width = 50
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
      Left = 566
      inherited btnTBMinimize: TssSpeedButton
        Height = 16
      end
      inherited btnTBMaximize: TssSpeedButton
        Height = 16
      end
      inherited btnTBClose: TssSpeedButton
        Height = 16
      end
    end
  end
  inherited panButtons: TPanel
    Top = 320
    Width = 624
    inherited btnOK: TxButton
      Left = 313
      Top = 9
    end
    inherited btnCancel: TxButton
      Left = 416
      Top = 9
    end
    inherited btnApply: TxButton
      Left = 519
      Top = 9
    end
  end
  inherited panToolBar: TPanel
    Width = 624
    inherited btnLock: TssSpeedButton
      Left = 534
      Width = 25
      Height = 25
      LeftMargin = 4
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 562
      Width = 25
      Height = 25
      LeftMargin = 4
    end
    inherited btnHelp: TssSpeedButton
      Left = 591
      Width = 25
      Height = 25
      LeftMargin = 4
    end
    object btnMC: TssSpeedButton
      Left = 87
      Top = 1
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      Caption = 'aShowTurnIn'
      GroupIndex = 0
      ImageIndex = 153
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnMCClick
    end
    object btnRsv: TssSpeedButton
      Left = 59
      Top = 1
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      Caption = 'aShowTurnIn'
      GroupIndex = 0
      ImageIndex = 100
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnRsvClick
    end
    object btnMove: TssSpeedButton
      Left = 31
      Top = 1
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      Caption = 'aShowTurnIn'
      GroupIndex = 0
      ImageIndex = 61
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnMoveClick
    end
    object btnInfo: TssSpeedButton
      Left = 2
      Top = 1
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      Caption = 'aShowTurnIn'
      GroupIndex = 0
      ImageIndex = 99
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnInfoClick
    end
  end
  inherited ilTitleBar: TImageList
    Left = 228
    Top = 8
  end
  inherited FormStorage: TssFormStorage
    Left = 37
    Top = 234
  end
  inherited ActionList: TActionList
    Left = 30
    Top = 227
    object aAddMat: TAction [5]
      ImageIndex = 14
    end
    object aAddWHouse: TAction [6]
      ImageIndex = 50
    end
    object aFind: TAction [7]
      Category = 'Find'
      Caption = #1055#1086#1080#1089#1082
      Hint = #1055#1086#1080#1089#1082
      ImageIndex = 52
    end
    object aFindParams: TAction [8]
      Category = 'Find'
      Caption = 'aFindParams'
      ImageIndex = 53
    end
    object aFindBegin: TAction [9]
      Category = 'Find'
      AutoCheck = True
      Caption = #1057#1085#1072#1095#1072#1083#1072
      Checked = True
      GroupIndex = 3
    end
    object aFindSubstr: TAction [10]
      Category = 'Find'
      AutoCheck = True
      Caption = #1063#1072#1089#1090#1080#1095#1085#1086#1077' '#1089#1086#1074#1087#1072#1076#1077#1085#1080#1077
      GroupIndex = 3
    end
    object aFindConcurr: TAction [11]
      Category = 'Find'
      AutoCheck = True
      Caption = #1055#1086#1083#1085#1086#1077' '#1089#1086#1074#1087#1072#1076#1077#1085#1080#1077
      GroupIndex = 3
    end
    object aContextFind: TAction [12]
      Category = 'Find'
      AutoCheck = True
      Caption = #1050#1086#1085#1090#1077#1082#1089#1090#1085#1099#1081' '#1087#1086#1080#1089#1082
      Checked = True
    end
  end
end
