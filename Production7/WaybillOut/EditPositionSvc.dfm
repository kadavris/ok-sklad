inherited frmEditPositionSvc: TfrmEditPositionSvc
  Left = 412
  Top = 194
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'frmEditPositionSvc'
  ClientHeight = 510
  ClientWidth = 624
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 624
    Height = 429
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
    object panSvc: TPanel
      Tag = 1
      Left = 0
      Top = 0
      Width = 624
      Height = 106
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        624
        106)
      object bvlSvc: TssBevel
        Left = 6
        Top = 4
        Width = 612
        Height = 102
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
      object lPersonname: TLabel
        Left = 18
        Top = 74
        Width = 63
        Height = 16
        Caption = #1042#1099#1087#1086#1083#1085#1080#1083':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object btnPersonName: TssSpeedButton
        Left = 523
        Top = 68
        Action = aPersonsRef
        Alignment = taCenter
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        GroupIndex = 0
        ImageIndex = 32
        Images = dmData.Images18x18
        LeftMargin = 4
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
        OnMouseDown = btnPersonNameMouseDown
        OnMouseUp = btnPersonNameMouseUp
      end
      object chbIsNormed: TcxCheckBox
        Left = 14
        Top = 10
        Width = 350
        Height = 24
        Enabled = False
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1053#1086#1088#1084#1080#1088#1086#1074#1072#1085#1085#1072#1103' '#1091#1089#1083#1091#1075#1072
        TabOrder = 0
        ImeName = 'Russian'
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
      object edSvc: TokSvcSearchEdit
        Left = 18
        Top = 37
        Width = 590
        Height = 31
        ButtonsLeftMargin = 3
        CapFind = 'Search'
        CapFindParams = 'Search options'
        CapRef = 'Services Directory'
        CapContextFind = 'Context search'
        CapFindBegin = 'From the beginning'
        CapFindConcurr = 'Full match'
        CapFindSubstr = 'Partial match'
        EditorOffset = 85
        DisabledImages = dmData.Images18x18dis
        Images = dmData.Images18x18
        ImageIndexRef = 38
        ImageIndexFind = 18
        ImageIndexFindParams = 19
        LangManager = dmData.Lng
        RemoteServer = dmData.SConnection
        SearchNames.Strings = (
          'Name;name'
          'Model;artikul')
        SearchType = stBegin
        Skin = dmData.sknMain
        TabOrder = 1
        TabStop = True
        OnChange = edSvcChange
        OnRefButtonClick = edSvcRefButtonClick
        DesignSize = (
          590
          31)
      end
      object lcbPersonName: TssDBLookupCombo
        Left = 103
        Top = 69
        Width = 419
        Height = 24
        ImeName = 'Russian'
        ParentFont = False
        Properties.DropDownListStyle = lsEditFixedList
        Style.StyleController = dmData.scMain
        TabOrder = 2
        OnEnter = lcbPersonNameEnter
        OnExit = lcbPersonNameExit
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
        EmptyValue = 0
        KeyField = 'kaid'
        ListField = 'Name'
        ListSource = srcPersonName
      end
    end
    object panPrice: TPanel
      Tag = 1
      Left = 0
      Top = 106
      Width = 624
      Height = 106
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      DesignSize = (
        624
        106)
      object ssBevel2: TssBevel
        Left = 6
        Top = -1
        Width = 612
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
        Style = bsSingle
        UseGradient = False
      end
      object lAmount: TLabel
        Left = 18
        Top = 16
        Width = 68
        Height = 16
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      end
      object stMeasureName: TssBevel
        Left = 252
        Top = 11
        Width = 50
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
      object lPrice: TLabel
        Left = 18
        Top = 46
        Width = 62
        Height = 16
        Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100
      end
      object stCurrShortName: TssBevel
        Left = 252
        Top = 41
        Width = 50
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
      object lNorm: TssLabel
        Left = 18
        Top = 74
        Width = 42
        Height = 16
        Caption = #1053#1086#1088#1084#1072':'
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object lKurs: TLabel
        Left = 325
        Top = 46
        Width = 81
        Height = 16
        Caption = #1050#1091#1088#1089' '#1074#1072#1083#1102#1090#1099':'
      end
      object btnShowNDS: TssSpeedButton
        Left = 581
        Top = 68
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtChecked
        Checked = True
        Caption = 'aShowNDS'
        GroupIndex = 0
        ImageIndex = 23
        Images = dmData.Images
        LeftMargin = 4
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
        OnClick = btnShowNDSClick
      end
      object lNDSRate: TssLabel
        Left = 325
        Top = 74
        Width = 95
        Height = 16
        Caption = #1057#1090#1072#1074#1082#1072' '#1053#1044#1057', %:'
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object edAmount: TssCalcEdit
        Left = 127
        Top = 10
        Width = 123
        Height = 24
        EditValue = 1.000000000000000000
        ImeName = 'Russian'
        ParentFont = False
        Properties.ImmediatePost = True
        Properties.Precision = 15
        Properties.OnChange = edAmountPropertiesChange
        Style.StyleController = dmData.scMain
        TabOrder = 0
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
        CalcColor = clBtnFace
        DecimalPlaces = 3
      end
      object edPrice: TssCalcEdit
        Left = 127
        Top = 39
        Width = 123
        Height = 24
        EditValue = 0.000000000000000000
        ImeName = 'Russian'
        ParentFont = False
        Properties.ImmediatePost = True
        Properties.OnChange = edPricePropertiesChange
        Properties.OnEditValueChanged = edPricePropertiesEditValueChanged
        Style.StyleController = dmData.scMain
        TabOrder = 1
        OnKeyDown = GoNextKeyDown
        OnKeyPress = edPriceKeyPress
        CalcColor = clBtnFace
        DecimalPlaces = 6
      end
      object edNorm: TssCalcEdit
        Left = 127
        Top = 69
        Width = 123
        Height = 24
        EditValue = 0.000000000000000000
        ImeName = 'Russian'
        ParentFont = False
        Properties.ImmediatePost = True
        Properties.Precision = 15
        Properties.OnChange = edAmountPropertiesChange
        Style.StyleController = dmData.scMain
        TabOrder = 2
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
        CalcColor = clBtnFace
        DecimalPlaces = 3
      end
      object edNDS: TssCalcEdit
        Left = 462
        Top = 69
        Width = 118
        Height = 24
        EditValue = 0.000000000000000000
        ImeName = 'Russian'
        ParentFont = False
        Properties.ImmediatePost = True
        Properties.OnChange = edNDSPropertiesChange
        Style.StyleController = dmData.scMain
        TabOrder = 3
        OnKeyDown = GoNextKeyDown
        OnKeyPress = edPriceKeyPress
        CalcColor = clBtnFace
        DecimalPlaces = 6
      end
      object edRate: TssCalcEdit
        Left = 462
        Top = 39
        Width = 118
        Height = 24
        Anchors = [akTop, akRight]
        EditValue = 0.000000000000000000
        Enabled = False
        ImeName = 'Russian'
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.ImmediatePost = True
        Properties.UseLeftAlignmentOnEditing = False
        Style.StyleController = dmData.scMain
        TabOrder = 4
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
        CalcColor = clBtnFace
        DecimalPlaces = 8
      end
    end
    object panDiscount: TPanel
      Left = 0
      Top = 212
      Width = 624
      Height = 101
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 3
      DesignSize = (
        624
        101)
      object bvlDiscount: TssBevel
        Left = 6
        Top = -1
        Width = 612
        Height = 102
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
      object stPriceDiscount: TssBevel
        Left = 424
        Top = 33
        Width = 122
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
        UseGradient = True
      end
      object lDisc: TssLabel
        Left = 18
        Top = 39
        Width = 61
        Height = 16
        Caption = #1057#1082#1080#1076#1082#1072', %'
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object lPriceDiscount: TssLabel
        Left = 314
        Top = 37
        Width = 93
        Height = 16
        Caption = #1050#1086#1085#1077#1095#1085#1072#1103' '#1094#1077#1085#1072':'
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object txtFinallyPriceCurr: TssBevel
        Left = 550
        Top = 33
        Width = 49
        Height = 24
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
      object chbDiscount: TcxCheckBox
        Left = 14
        Top = 4
        Width = 174
        Height = 26
        AutoSize = False
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.DisplayUnchecked = 'False'
        Properties.OnChange = chbDiscountPropertiesChange
        Properties.Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1089#1082#1080#1076#1082#1091
        Style.StyleController = dmData.scMain
        TabOrder = 0
        ImeName = 'Russian'
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
      object edDiscount: TssCalcEdit
        Left = 127
        Top = 34
        Width = 79
        Height = 24
        EditValue = 0.000000000000000000
        Enabled = False
        ImeName = 'Russian'
        ParentFont = False
        Properties.OnChange = edDiscountPropertiesChange
        Style.StyleController = dmData.scMain
        TabOrder = 1
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
        CalcColor = clBtnFace
        DecimalPlaces = 2
      end
      object chbSvcToPrice: TcxCheckBox
        Left = 14
        Top = 62
        Width = 593
        Height = 25
        AutoSize = False
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.DisplayUnchecked = 'False'
        Properties.OnChange = chbDiscountPropertiesChange
        Properties.Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1091#1089#1083#1091#1075#1080' '#1083#1086#1078#1080#1090#1089#1103' '#1085#1072' '#1089#1077#1073#1077#1089#1090#1086#1080#1084#1086#1089#1090#1100' '#1090#1086#1074#1072#1088#1072
        Style.StyleController = dmData.scMain
        TabOrder = 2
        ImeName = 'Russian'
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
    end
    object panSummary: TPanel
      Left = 0
      Top = 313
      Width = 624
      Height = 116
      Align = alClient
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 2
      DesignSize = (
        624
        116)
      object bvlSummary: TssBevel
        Left = 6
        Top = -1
        Width = 612
        Height = 110
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
      object lSummary: TLabel
        Left = 18
        Top = 12
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
      object stAmountEx: TssBevel
        Left = 318
        Top = 9
        Width = 238
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
      object stSumm: TssBevel
        Left = 318
        Top = 31
        Width = 238
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
      object lAmountEx: TLabel
        Left = 129
        Top = 12
        Width = 73
        Height = 16
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
      end
      object lSummWONDS: TLabel
        Left = 129
        Top = 36
        Width = 95
        Height = 16
        Caption = #1057#1091#1084#1084#1072' '#1073#1077#1079' '#1053#1044#1057':'
      end
      object lNDS: TssLabel
        Left = 129
        Top = 59
        Width = 60
        Height = 16
        Caption = #1053#1044#1057' 18%:'
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object stSummNDS: TssBevel
        Left = 318
        Top = 53
        Width = 238
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
      object lSummWithNDS: TssLabel
        Left = 129
        Top = 80
        Width = 81
        Height = 16
        Caption = #1057#1091#1084#1084#1072' '#1089' '#1053#1044#1057':'
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object stSummWithNDS: TssBevel
        Left = 318
        Top = 75
        Width = 238
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
        Left = 559
        Top = 9
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
      object txtSummWONDS: TssBevel
        Left = 559
        Top = 31
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
      object txtSummNDS: TssBevel
        Left = 559
        Top = 53
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
      object txtSummWithNDS: TssBevel
        Left = 559
        Top = 75
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
    Top = 476
    Width = 624
    Height = 34
    inherited btnOK: TxButton
      Left = 313
      Top = 9
      Height = 24
    end
    inherited btnCancel: TxButton
      Left = 416
      Top = 9
      Width = 97
      Height = 24
    end
    inherited btnApply: TxButton
      Left = 519
      Top = 9
      Width = 99
      Height = 24
    end
  end
  inherited panToolBar: TPanel
    Width = 624
    inherited btnLock: TssSpeedButton
      Left = 533
      Top = 1
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 561
      Top = 1
    end
    inherited btnHelp: TssSpeedButton
      Left = 590
      Top = 1
    end
    object btnInfo: TssSpeedButton
      Left = 6
      Top = 1
      Action = aSvcInfo
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 160
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object btnMove: TssSpeedButton
      Left = 34
      Top = 1
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      Caption = 'aShowTurnIn'
      Enabled = False
      GroupIndex = 0
      ImageIndex = 61
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object btnRsv: TssSpeedButton
      Left = 63
      Top = 1
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      Caption = 'aShowTurnIn'
      Enabled = False
      GroupIndex = 0
      ImageIndex = 100
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      Visible = False
    end
    object btnMC: TssSpeedButton
      Left = 91
      Top = 1
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      Caption = 'aShowTurnIn'
      Enabled = False
      GroupIndex = 0
      ImageIndex = 153
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      Visible = False
    end
    object btnSetPanels: TssSpeedButton
      Left = 505
      Top = 1
      Action = aSetPanels
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 40
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
  end
  inherited ilTitleBar: TImageList
    Left = 136
    Top = 28
  end
  inherited FormStorage: TssFormStorage
    Active = True
    StoredProps.Strings = (
      'btnShowNDS.Checked'
      'panDiscount.Visible'
      'panSummary.Visible')
    Left = 194
    Top = 27
  end
  inherited ActionList: TActionList
    Images = dmData.Images18x18
    Left = 166
    Top = 27
    object aPersonsRef: TAction
      Caption = 'aPersonsRef'
      ImageIndex = 32
      OnExecute = aPersonsRefExecute
    end
    object aSetKurs: TAction
      Caption = 'aSetKurs'
    end
    object aSvcInfo: TAction
      Caption = 'aSvcInfo'
      ImageIndex = 160
      ShortCut = 16457
      OnExecute = aSvcInfoExecute
    end
    object aRef: TAction
      Caption = 'aRef'
      ShortCut = 16429
    end
    object aSetPanels: TAction
      Caption = 'aSetPanels'
      ImageIndex = 40
      OnExecute = aSetPanelsExecute
    end
  end
  object srcPersonName: TDataSource
    DataSet = cdsPersonName
    Left = 316
    Top = 96
  end
  object cdsPersonName: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'p_Persons_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 288
    Top = 96
  end
end
