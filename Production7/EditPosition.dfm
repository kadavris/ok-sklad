inherited frmEditPosition: TfrmEditPosition
  Left = 205
  Top = 0
  ClientWidth = 507
  ClientHeight = 509
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'frmEditPosition'
  OnCloseQuery = FormCloseQuery
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited panMain: TPanel
    Width = 507
    Height = 453
    object ssBevel8: TssBevel [0]
      Left = 315
      Width = 9
      Height = 16
      Top = -20
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
    inherited panToolBar: TPanel
      Width = 507
      DesignSize = (
        507
        25)
      inherited btnLock: TssSpeedButton
        Left = 433
      end
      inherited btnSendErrMessage: TssSpeedButton
        Left = 456
      end
      inherited btnHelp: TssSpeedButton
        Left = 479
      end
      object btnInfo: TssSpeedButton
        Left = 4
        Top = 1
        Width = 23
        Height = 23
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        Caption = 'aShowTurnIn'
        GroupIndex = 0
        ImageIndex = 99
        Images = dmData.Images
        LeftMargin = 4
        Offset = 1
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
        OnClick = btnInfoClick
      end
      object btnMove: TssSpeedButton
        Left = 27
        Top = 1
        Width = 23
        Height = 23
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        Caption = 'aShowTurnIn'
        GroupIndex = 0
        ImageIndex = 61
        Images = dmData.Images
        LeftMargin = 4
        Offset = 1
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
        OnClick = btnMoveClick
      end
      object btnRsv: TssSpeedButton
        Left = 50
        Top = 1
        Width = 23
        Height = 23
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        Caption = 'aShowTurnIn'
        GroupIndex = 0
        ImageIndex = 100
        Images = dmData.Images
        LeftMargin = 4
        Offset = 1
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
        OnClick = btnRsvClick
      end
      object btnMC: TssSpeedButton
        Left = 73
        Top = 1
        Width = 23
        Height = 23
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        Caption = 'aShowTurnIn'
        GroupIndex = 0
        ImageIndex = 153
        Images = dmData.Images
        LeftMargin = 4
        Offset = 1
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
        OnClick = btnMCClick
      end
      object btnSetPanels: TssSpeedButton
        Left = 410
        Top = 1
        Width = 23
        Height = 23
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
        Offset = 1
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
      end
    end
    object panMat: TPanel
      Left = 0
      Top = 25
      Width = 507
      Height = 64
      Tag = 1
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 1
      DesignSize = (
        507
        64)
      object bvlMat: TssBevel
        Left = 4
        Top = 1
        Width = 498
        Height = 63
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
      object lWHouse: TssLabel
        Left = 14
        Top = 39
        Width = 34
        Height = 13
        Caption = #1057#1082#1083#1072#1076':'
        Transparent = True
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object sbAddWHouse: TssSpeedButton
        Left = 425
        Top = 33
        Width = 22
        Height = 22
        Action = aAddWHouse
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        Anchors = [akTop, akRight]
        ButtonType = ssbtStandard
        Checked = False
        DisabledImages = dmData.Images18x18dis
        GroupIndex = 0
        ImageIndex = 50
        Images = dmData.Images18x18
        LeftMargin = 2
        Offset = 1
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
      end
      object edMat: TokMatSearchEdit
        Left = 14
        Top = 8
        Width = 480
        Height = 25
        ButtonsLeftMargin = 3
        Color = clBtnFace
        EditorOffset = 71
        DisabledImages = dmData.Images18x18dis
        Images = dmData.Images18x18
        ImageIndexRef = 22
        ImageIndexFind = 18
        ImageIndexFindParams = 19
        LangManager = dmData.Lng
        ParentColor = False
        RemoteServer = dmData.SConnection
        SearchNames.Strings = (
          ';name'
          ';artikul'
          ';barcode')
        SearchType = stBegin
        TabOrder = 0
        OnChange = edMatChange
        OnRefButtonClick = edMatRefButtonClick
        LoadNDS = True
        DesignSize = (
          480
          25)
      end
      object cbWHouse: TssDBLookupCombo
        Left = 105
        Top = 34
        Width = 319
        Height = 21
        Properties.DropDownListStyle = lsFixedList
        Properties.OnChange = cbWHousePropertiesChange
        Style.StyleController = dmData.scMain
        Style.ButtonStyle = btsSimple
        TabOrder = 1
        OnKeyDown = GoNextKeyDown
        OnKeyPress = cbWHouseKeyPress
        EmptyValue = 0
        KeyField = 'wid'
        ListField = 'name'
        ListSource = dsWhouse
      end
    end
    object panPrice: TPanel
      Left = 0
      Top = 89
      Width = 507
      Height = 86
      Tag = 1
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 2
      DesignSize = (
        507
        86)
      object bvlPrice: TssBevel
        Left = 4
        Width = 498
        Height = 87
        Top = -1
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
      object lAmount: TssLabel
        Left = 14
        Top = 12
        Width = 62
        Height = 13
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
        Transparent = True
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object lPrice: TLabel
        Left = 14
        Top = 36
        Width = 65
        Height = 13
        Caption = #1062#1077#1085#1072' '#1089' '#1053#1044#1057':'
        Transparent = True
      end
      object stMeasureName: TssBevel
        Left = 206
        Top = 9
        Width = 41
        Height = 19
        Alignments.Horz = taCenter
        Caption = #1096#1090'.'
        ColorGrBegin = clWindow
        ColorGrEnd = clWindow
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = [beLeft, beRight, beTop, beBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        GradientDirection = gdVertical
        HotTrack = False
        ImageIndex = 0
        UseGradient = True
      end
      object stCurrShortName: TssBevel
        Left = 206
        Top = 33
        Width = 41
        Height = 19
        Alignments.Horz = taCenter
        Caption = 'UAH'
        ColorGrBegin = clWindow
        ColorGrEnd = clWindow
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = [beLeft, beRight, beTop, beBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        GradientDirection = gdVertical
        HotTrack = False
        ImageIndex = 0
        UseGradient = True
      end
      object lRemain: TLabel
        Left = 261
        Top = 7
        Width = 54
        Height = 13
        Caption = #1042' '#1085#1072#1083#1080#1095#1080#1080':'
        Transparent = True
      end
      object stRemain: TssBevel
        Left = 376
        Top = 5
        Width = 118
        Height = 17
        Alignments.Horz = taRightJustify
        Caption = '0'
        ColorGrBegin = clWindow
        ColorGrEnd = clWindow
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = [beLeft, beRight, beTop, beBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        GradientDirection = gdVertical
        HotTrack = False
        ImageIndex = 0
        UseGradient = True
      end
      object lPriceNoNDS: TssLabel
        Left = 14
        Top = 60
        Width = 77
        Height = 13
        Caption = #1062#1077#1085#1072' '#1073#1077#1079' '#1053#1044#1057':'
        Transparent = True
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object stCurrShortNameOutNDS: TssBevel
        Left = 206
        Top = 57
        Width = 41
        Height = 19
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
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        GradientDirection = gdVertical
        HotTrack = False
        ImageIndex = 0
        UseGradient = True
      end
      object lNDSRate: TssLabel
        Left = 260
        Top = 61
        Width = 80
        Height = 13
        Caption = #1057#1090#1072#1074#1082#1072' '#1053#1044#1057', %:'
        Transparent = True
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object btnShowNDS: TssSpeedButton
        Left = 472
        Top = 55
        Width = 22
        Height = 22
        Action = aShowNDS
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtChecked
        Checked = True
        GroupIndex = 0
        ImageIndex = -1
        Images = dmData.Images
        LeftMargin = 2
        Offset = 1
        ParentColorEx = False
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
      end
      object lRemainAll: TLabel
        Left = 260
        Top = 23
        Width = 85
        Height = 13
        Caption = #1044#1086#1089#1090#1091#1087#1085#1086' '#1074#1077#1079#1076#1077':'
        Transparent = True
      end
      object stRemainAll: TssBevel
        Left = 376
        Top = 21
        Width = 118
        Height = 17
        Alignments.Horz = taRightJustify
        Caption = '0'
        ColorGrBegin = clWindow
        ColorGrEnd = clWindow
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = [beLeft, beRight, beTop, beBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        GradientDirection = gdVertical
        HotTrack = False
        ImageIndex = 0
        UseGradient = True
      end
      object stRsv: TssBevel
        Left = 376
        Top = 37
        Width = 118
        Height = 17
        Alignments.Horz = taRightJustify
        Caption = '0'
        ColorGrBegin = clWindow
        ColorGrEnd = clWindow
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = [beLeft, beRight, beTop, beBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        GradientDirection = gdVertical
        HotTrack = False
        ImageIndex = 0
        UseGradient = True
      end
      object lRsv: TLabel
        Left = 260
        Top = 39
        Width = 55
        Height = 13
        Caption = #1042' '#1088#1077#1079#1077#1088#1074#1077':'
        Transparent = True
      end
      object edPrice: TssCalcEdit
        Left = 105
        Top = 32
        Width = 100
        Height = 21
        EditValue = 0.000000000000000000
        Properties.ImmediatePost = True
        Properties.Precision = 15
        Properties.OnChange = edPricePropertiesChange
        Properties.OnEditValueChanged = edPricePropertiesEditValueChanged
        Style.StyleController = dmData.scMain
        TabOrder = 1
        OnKeyDown = GoNextKeyDown
        OnKeyPress = edPriceKeyPress
        CalcColor = clBtnFace
        DecimalPlaces = 6
      end
      object edAmount: TssCalcEdit
        Left = 105
        Top = 8
        Width = 100
        Height = 21
        EditValue = 0.000000000000000000
        Properties.OnChange = edAmountPropertiesChange
        Style.StyleController = dmData.scMain
        TabOrder = 0
        OnKeyDown = GoNextKeyDown
        OnKeyPress = edAmountKeyPress
        CalcColor = clBtnFace
        DecimalPlaces = 4
      end
      object edPriceNoNDS: TssCalcEdit
        Left = 105
        Top = 56
        Width = 100
        Height = 21
        Anchors = [akTop, akRight]
        EditValue = 0.000000000000000000
        Properties.OnChange = edPriceNondsPropertiesChange
        Properties.OnEditValueChanged = edPriceNoNDSPropertiesEditValueChanged
        Style.StyleController = dmData.scMain
        TabOrder = 2
        OnKeyDown = GoNextKeyDown
        OnKeyPress = edPriceKeyPress
        CalcColor = clBtnFace
        DecimalPlaces = 6
      end
      object edNDS: TssCalcEdit
        Left = 375
        Top = 56
        Width = 96
        Height = 21
        EditValue = 0.000000000000000000
        Properties.ImmediatePost = True
        Properties.OnChange = edNDSPropertiesChange
        Style.StyleController = dmData.scMain
        TabOrder = 3
        OnKeyDown = GoNextKeyDown
        OnKeyPress = edPriceKeyPress
        CalcColor = clBtnFace
        DecimalPlaces = 6
      end
    end
    object panSN: TPanel
      Left = 0
      Top = 175
      Width = 507
      Height = 37
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 3
      DesignSize = (
        507
        37)
      object bvlSN: TssBevel
        Left = 4
        Width = 498
        Height = 38
        Top = -1
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
      object lSN: TLabel
        Left = 14
        Top = 4
        Width = 85
        Height = 29
        AutoSize = False
        Caption = #1057#1077#1088#1080#1081#1085#1099#1077' '#1085#1086#1084#1077#1088#1072':'
        Transparent = True
        Layout = tlCenter
        WordWrap = True
      end
      object edSN: TcxButtonEdit
        Left = 105
        Top = 7
        Width = 390
        Height = 21
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ClickKey = 16429
        Properties.ReadOnly = True
        Properties.OnButtonClick = edSNPropertiesButtonClick
        Style.StyleController = dmData.scMain
        TabOrder = 0
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
    end
    object panPriceInterval: TPanel
      Left = 0
      Top = 212
      Width = 507
      Height = 88
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 4
      DesignSize = (
        507
        88)
      object bvlPriceInterval: TssBevel
        Left = 4
        Width = 498
        Height = 89
        Top = -1
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
      object lPriceInterval: TssLabel
        Left = 258
        Top = 9
        Width = 212
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = #1048#1085#1090#1077#1088#1074#1072#1083' '#1079#1072#1082#1091#1087#1086#1095#1085#1099#1093' '#1094#1077#1085':'
        Transparent = True
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object sbShowPriceIn: TssSpeedButton
        Left = 473
        Top = 5
        Width = 21
        Height = 21
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtChecked
        Checked = True
        GroupIndex = 0
        ImageIndex = 104
        Images = dmData.Images
        LeftMargin = 2
        Offset = 1
        ParentColorEx = False
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
        OnClick = sbShowPriceInClick
      end
      object panPriceIn: TPanel
        Left = 254
        Top = 28
        Width = 244
        Height = 51
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        object lMinPrice: TLabel
          Left = 6
          Top = 4
          Width = 101
          Height = 13
          Caption = #1052#1080#1085#1080#1084#1072#1083#1100#1085#1072#1103' '#1094#1077#1085#1072':'
          Transparent = True
        end
        object stMinPrice: TssBevel
          Left = 122
          Top = 2
          Width = 118
          Height = 17
          Alignments.Horz = taRightJustify
          Caption = '0,00 '
          ColorGrBegin = clWindow
          ColorGrEnd = clWindow
          ColorInner = clBtnShadow
          ColorOuter = clBtnShadow
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          UseGradient = True
        end
        object stMaxPrice: TssBevel
          Left = 122
          Top = 34
          Width = 118
          Height = 17
          Alignments.Horz = taRightJustify
          Caption = '0,00 '
          ColorGrBegin = clWindow
          ColorGrEnd = clWindow
          ColorInner = clBtnShadow
          ColorOuter = clBtnShadow
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          UseGradient = True
        end
        object lMaxPrice: TLabel
          Left = 6
          Top = 36
          Width = 107
          Height = 13
          Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1094#1077#1085#1072':'
          Transparent = True
        end
        object lAvgPrice: TLabel
          Left = 6
          Top = 20
          Width = 73
          Height = 13
          Caption = #1057#1088#1077#1076#1085#1103#1103' '#1094#1077#1085#1072':'
          Transparent = True
        end
        object stAvgPrice: TssBevel
          Left = 122
          Top = 18
          Width = 118
          Height = 17
          Alignments.Horz = taRightJustify
          Caption = '0,00 '
          ColorGrBegin = clWindow
          ColorGrEnd = clWindow
          ColorInner = clBtnShadow
          ColorOuter = clBtnShadow
          Edges = [beLeft, beRight, beTop, beBottom]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          UseGradient = True
        end
      end
    end
    object panSummary: TPanel
      Left = 0
      Top = 360
      Width = 507
      Height = 93
      Align = alClient
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 6
      DesignSize = (
        507
        93)
      object bvlSummary: TssBevel
        Left = 4
        Width = 498
        Height = 94
        Top = -1
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
        Left = 14
        Top = 10
        Width = 40
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1048#1090#1086#1075#1086':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lAmountEx: TLabel
        Left = 105
        Top = 10
        Width = 62
        Height = 13
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
        Transparent = True
      end
      object stAmountEx: TssBevel
        Left = 258
        Top = 7
        Width = 194
        Height = 19
        Alignments.Horz = taRightJustify
        Caption = '0,00'
        ColorGrBegin = clWindow
        ColorGrEnd = clWindow
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = [beLeft, beRight, beTop, beBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
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
        Left = 454
        Top = 7
        Width = 40
        Height = 19
        Alignments.Horz = taCenter
        ColorGrBegin = clWindow
        ColorGrEnd = clWindow
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = [beLeft, beRight, beTop, beBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        GradientDirection = gdVertical
        HotTrack = False
        ImageIndex = 0
        UseGradient = True
      end
      object lSummWONDS: TLabel
        Left = 105
        Top = 29
        Width = 85
        Height = 13
        Caption = #1057#1091#1084#1084#1072' '#1073#1077#1079' '#1053#1044#1057':'
        Transparent = True
      end
      object stSumm: TssBevel
        Left = 258
        Top = 25
        Width = 194
        Height = 19
        Alignments.Horz = taRightJustify
        Caption = '0,00'
        ColorGrBegin = clWindow
        ColorGrEnd = clWindow
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = [beLeft, beRight, beTop, beBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
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
        Left = 454
        Top = 25
        Width = 40
        Height = 19
        Alignments.Horz = taCenter
        ColorGrBegin = clWindow
        ColorGrEnd = clWindow
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = [beLeft, beRight, beTop, beBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        GradientDirection = gdVertical
        HotTrack = False
        ImageIndex = 0
        UseGradient = True
      end
      object lNDS: TssLabel
        Left = 105
        Top = 48
        Width = 50
        Height = 13
        Caption = #1053#1044#1057' 18%:'
        Transparent = True
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object stSummNDS: TssBevel
        Left = 258
        Top = 43
        Width = 194
        Height = 19
        Alignments.Horz = taRightJustify
        Caption = '0,00'
        ColorGrBegin = clWindow
        ColorGrEnd = clWindow
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = [beLeft, beRight, beTop, beBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
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
        Left = 454
        Top = 43
        Width = 40
        Height = 19
        Alignments.Horz = taCenter
        ColorGrBegin = clWindow
        ColorGrEnd = clWindow
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = [beLeft, beRight, beTop, beBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        GradientDirection = gdVertical
        HotTrack = False
        ImageIndex = 0
        UseGradient = True
      end
      object lSummWithNDS: TssLabel
        Left = 105
        Top = 65
        Width = 73
        Height = 13
        Caption = #1057#1091#1084#1084#1072' '#1089' '#1053#1044#1057':'
        Transparent = True
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object stSummWithNDS: TssBevel
        Left = 258
        Top = 61
        Width = 194
        Height = 19
        Alignments.Horz = taRightJustify
        Caption = '0,00'
        ColorGrBegin = clWindow
        ColorGrEnd = clWindow
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = [beLeft, beRight, beTop, beBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
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
        Left = 454
        Top = 61
        Width = 40
        Height = 19
        Alignments.Horz = taCenter
        ColorGrBegin = clWindow
        ColorGrEnd = clWindow
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = [beLeft, beRight, beTop, beBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        GradientDirection = gdVertical
        HotTrack = False
        ImageIndex = 0
        UseGradient = True
      end
    end
    object PanAddProps: TPanel
      Left = 0
      Top = 300
      Width = 507
      Height = 60
      Align = alTop
      BevelOuter = bvNone
      ParentColor = True
      TabOrder = 5
      DesignSize = (
        507
        60)
      object bvlAddPrps: TssBevel
        Left = 4
        Width = 498
        Height = 61
        Top = -1
        Anchors = [akLeft, akTop, akRight]
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
      object lProducer: TssLabel
        Left = 14
        Top = 11
        Width = 82
        Height = 13
        Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object lCertNum: TssLabel
        Left = 260
        Top = 12
        Width = 106
        Height = 13
        Caption = #1053#1086#1084#1077#1088' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1072':'
        Transparent = True
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object lCertDate: TssLabel
        Left = 260
        Top = 35
        Width = 98
        Height = 13
        Caption = #1044#1072#1090#1072' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1072':'
        Transparent = True
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object lGTD: TssLabel
        Left = 14
        Top = 36
        Width = 62
        Height = 13
        Caption = #1053#1086#1084#1077#1088' '#1043#1058#1044':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Transparent = True
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object edCertNum: TcxTextEdit
        Left = 375
        Top = 7
        Width = 120
        Height = 21
        AutoSize = False
        ParentFont = False
        Properties.MaxLength = 64
        Properties.OnChange = DataModified
        Style.StyleController = dmData.scMain
        TabOrder = 2
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
      object edCertDate: TcxDateEdit
        Left = 375
        Top = 31
        Width = 78
        Height = 21
        ParentFont = False
        Properties.SaveTime = False
        Properties.ShowTime = False
        Properties.OnChange = DataModified
        Style.StyleController = dmData.scMain
        TabOrder = 3
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
      object edGTD: TcxTextEdit
        Left = 104
        Top = 31
        Width = 146
        Height = 21
        AutoSize = False
        ParentFont = False
        Properties.MaxLength = 64
        Properties.OnChange = DataModified
        Style.StyleController = dmData.scMain
        TabOrder = 1
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
      object cbProducer: TcxComboBox
        Left = 104
        Top = 7
        Width = 146
        Height = 21
        BeepOnEnter = False
        ParentFont = False
        Properties.MaxLength = 255
        Properties.OnChange = DataModified
        Properties.OnInitPopup = cbProducerPropertiesInitPopup
        Style.StyleController = dmData.scMain
        TabOrder = 0
        OnKeyPress = GoNext
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 507
    inherited panTitleButtons: TssPanel
      Left = 450
    end
  end
  inherited panButtons: TPanel
    Top = 474
    Width = 507
    DesignSize = (
      507
      35)
    inherited btnOK: TxButton
      Left = 254
      Top = 7
    end
    inherited btnCancel: TxButton
      Left = 338
      Top = 7
    end
    inherited btnApply: TxButton
      Left = 422
      Top = 7
    end
  end
  inherited ilTitleBar: TImageList
    Left = 56
    Top = 80
  end
  inherited FormStorage: TssFormStorage
    Left = 205
    Top = 58
    StoredProps.Strings = (
      'aShowNDS.Checked'
      'btnShowNDS.Checked'
      'panSN.Visible'
      'panPriceInterval.Visible'
      'panSummary.Visible')
  end
  inherited ActionList: TActionList
    Left = 198
    Top = 51
    object aAddMat: TAction [5]
      ImageIndex = 14
      OnExecute = aAddMatExecute
    end
    object aAddWHouse: TAction [6]
      ImageIndex = 50
      OnExecute = aAddWHouseExecute
    end
    object aSN: TAction
      Caption = 'aSN'
      OnExecute = aSNExecute
    end
    object aShowNDS: TAction
      Caption = 'aShowNDS'
      Checked = True
      OnExecute = aShowNDSExecute
    end
    object aSetPanels: TAction
      Caption = 'aSetPanels'
      ImageIndex = 40
      OnExecute = aSetPanelsExecute
    end
  end
  object cdsWhouse: TssClientDataSet
    Left = 250
    Top = 66
    Aggregates = <>
    Params = <>
    ProviderName = 'pWHouse_List'
    RemoteServer = dmData.SConnection
    Macros = <>
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
    object cdsWhouseDEF: TIntegerField
      FieldName = 'DEF'
      ReadOnly = True
    end
  end
  object dsWhouse: TDataSource
    Left = 267
    Top = 51
    DataSet = cdsWhouse
  end
  object cdsMeasure: TssClientDataSet
    Left = 274
    Top = 58
    Aggregates = <>
    Params = <>
    ProviderName = 'pMeasures_List'
    RemoteServer = dmData.SConnection
    Macros = <>
  end
  object dsMeasure: TDataSource
    Left = 279
    Top = 51
    DataSet = cdsMeasure
  end
  object cdsFind: TssClientDataSet
    Left = 114
    Top = 74
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
  end
end
