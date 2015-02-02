inherited frmEditPosition: TfrmEditPosition
  Left = 442
  Top = 203
  Width = 733
  Height = 659
  Caption = 'frmEditPosition'
  OnCloseQuery = FormCloseQuery
  OnKeyDown = nil
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 725
    Height = 547
    object ssBevel8: TssBevel
      Left = 388
      Top = 1
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
      Tag = 1
      Left = 0
      Top = 0
      Width = 725
      Height = 123
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 0
      DesignSize = (
        725
        123)
      object bvlMat: TssBevel
        Left = 5
        Top = 0
        Width = 719
        Height = 124
        Anchors = [akLeft, akTop, akRight]
        ColorGrBegin = clBtnFace
        ColorGrEnd = clBtnFace
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = [beLeft, beRight, beTop, beBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        GradientDirection = gdHorizontal
        HotTrack = False
        ImageIndex = 0
        UseGradient = False
      end
      object lWHouse: TssLabel
        Left = 17
        Top = 94
        Width = 40
        Height = 16
        Caption = #1057#1082#1083#1072#1076':'
        Transparent = True
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object sbAddWHouse: TssSpeedButton
        Left = 687
        Top = 86
        Action = aAddWHouse
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        Anchors = [akTop, akRight]
        ButtonType = ssbtStandard
        Checked = False
        DisabledImages = dmData.Images18x18dis
        GroupIndex = 0
        ImageIndex = 50
        Images = dmData.Images
        LeftMargin = 4
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
      end
      object edMat: TokMatSearchEdit
        Left = 17
        Top = 50
        Width = 696
        Height = 31
        Hint = '55555'
        Anchors = [akLeft, akTop, akRight]
        ButtonsLeftMargin = 3
        Color = clBtnFace
        CapFind = 'Search'
        CapFindParams = 'Search options'
        CapRef = 'Products Directory'
        CapContextFind = 'Context search'
        CapFindBegin = 'From the beginning'
        CapFindConcurr = 'Full match'
        CapFindSubstr = 'Partial match'
        EditorOffset = 70
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
        StyleController = dmData.scMain
        TabOrder = 0
        TabStop = True
        OnChange = edMatChange
        OnKeyDown = edMatKeyDown
        OnEnter = aAddMatExecute
        OnRefButtonClick = edMatRefButtonClick
        AllowZeroRest = True
        LoadNDS = True
        LoadTaxes = True
        OnWeightChanged = edMatWeightChanged
        ScannerImageIndex = 50
        DesignSize = (
          696
          31)
      end
      object cbWHouse: TssDBLookupCombo
        Left = 103
        Top = 87
        Width = 578
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        ImeName = 'Russian'
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.OnChange = cbWHousePropertiesChange
        Properties.OnEditValueChanged = cbWHousePropertiesEditValueChanged
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
      object edMatRB: TcxRadioGroup
        Left = 110
        Top = 4
        Width = 392
        Height = 48
        ParentColor = False
        Properties.Columns = 3
        Properties.Items = <
          item
            Caption = 'item1'
            Value = 0
          end
          item
            Caption = 'item2'
            Value = 2
          end
          item
            Caption = 'item3'
            Value = 3
          end>
        Style.BorderColor = clWindowText
        Style.BorderStyle = ebsSingle
        Style.Color = clBtnFace
        Style.Edges = []
        Style.HotTrack = False
        Style.StyleController = dmData.scMain
        TabOrder = 2
        OnClick = edMatRBClick
      end
    end
    object panPrice: TPanel
      Tag = 1
      Left = 0
      Top = 123
      Width = 725
      Height = 100
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 1
      DesignSize = (
        725
        100)
      object bvlPrice: TssBevel
        Left = 5
        Top = 0
        Width = 719
        Height = 102
        Anchors = [akLeft, akTop, akRight]
        ColorGrBegin = clBtnFace
        ColorGrEnd = clBtnFace
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = [beLeft, beRight, beTop, beBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        GradientDirection = gdHorizontal
        HotTrack = False
        ImageIndex = 0
        UseGradient = False
      end
      object lAmount: TssLabel
        Left = 17
        Top = 10
        Width = 73
        Height = 16
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
        Transparent = True
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object lPrice: TLabel
        Left = 17
        Top = 42
        Width = 74
        Height = 16
        Caption = #1062#1077#1085#1072' '#1089' '#1053#1044#1057':'
        Transparent = True
      end
      object stMeasureName: TssBevel
        Left = 283
        Top = 6
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
      object stCurrShortName: TssBevel
        Left = 283
        Top = 38
        Width = 51
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
        Left = 348
        Top = 9
        Width = 65
        Height = 16
        Caption = #1042' '#1085#1072#1083#1080#1095#1080#1080':'
        Transparent = True
      end
      object stRemain: TssBevel
        Left = 492
        Top = 6
        Width = 221
        Height = 21
        Alignments.Horz = taRightJustify
        Anchors = [akLeft, akTop, akRight]
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
      object lPriceNoNDS: TssLabel
        Left = 17
        Top = 74
        Width = 140
        Height = 16
        Caption = 'Price per item, VAT incl:'
        Transparent = True
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object stCurrShortNameOutNDS: TssBevel
        Left = 283
        Top = 70
        Width = 51
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
      object lNDSRate: TssLabel
        Left = 350
        Top = 75
        Width = 95
        Height = 16
        Caption = #1057#1090#1072#1074#1082#1072' '#1053#1044#1057', %:'
        Transparent = True
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object btnShowNDS: TssSpeedButton
        Left = 687
        Top = 69
        Action = aShowNDS
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        Anchors = [akTop, akRight]
        ButtonType = ssbtChecked
        Checked = True
        GroupIndex = 0
        ImageIndex = -1
        Images = dmData.Images
        LeftMargin = 4
        ParentColorEx = False
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
      end
      object lRemainAll: TLabel
        Left = 350
        Top = 28
        Width = 98
        Height = 16
        Caption = #1044#1086#1089#1090#1091#1087#1085#1086' '#1074#1077#1079#1076#1077':'
        Transparent = True
      end
      object stRemainAll: TssBevel
        Left = 492
        Top = 26
        Width = 221
        Height = 21
        Alignments.Horz = taRightJustify
        Anchors = [akLeft, akTop, akRight]
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
      object stRsv: TssBevel
        Left = 492
        Top = 46
        Width = 221
        Height = 20
        Alignments.Horz = taRightJustify
        Anchors = [akLeft, akTop, akRight]
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
      object lRsv: TLabel
        Left = 350
        Top = 48
        Width = 64
        Height = 16
        Caption = #1042' '#1088#1077#1079#1077#1088#1074#1077':'
        Transparent = True
      end
      object edPrice: TssCalcEdit
        Left = 159
        Top = 37
        Width = 123
        Height = 24
        EditValue = 0.000000000000000000
        ImeName = 'Russian'
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
        Left = 159
        Top = 5
        Width = 123
        Height = 24
        EditValue = 0.000000000000000000
        ImeName = 'Russian'
        Properties.OnChange = edAmountPropertiesChange
        Style.StyleController = dmData.scMain
        TabOrder = 0
        OnKeyDown = GoNextKeyDown
        OnKeyPress = edAmountKeyPress
        CalcColor = clBtnFace
        DecimalPlaces = 4
      end
      object edPriceNoNDS: TssCalcEdit
        Left = 159
        Top = 69
        Width = 123
        Height = 24
        EditValue = 0.000000000000000000
        ImeName = 'Russian'
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
        Left = 492
        Top = 69
        Width = 197
        Height = 24
        Anchors = [akLeft, akTop, akRight]
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
    end
    object panSN: TPanel
      Left = 0
      Top = 223
      Width = 725
      Height = 38
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 2
      DesignSize = (
        725
        38)
      object bvlSN: TssBevel
        Left = 5
        Top = 0
        Width = 719
        Height = 41
        Anchors = [akLeft, akTop, akRight]
        ColorGrBegin = clBtnFace
        ColorGrEnd = clBtnFace
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = [beLeft, beRight, beTop, beBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        GradientDirection = gdHorizontal
        HotTrack = False
        ImageIndex = 0
        UseGradient = False
      end
      object lSN: TLabel
        Left = 18
        Top = 1
        Width = 105
        Height = 36
        AutoSize = False
        Caption = #1057#1077#1088#1080#1081#1085#1099#1077' '#1085#1086#1084#1077#1088#1072':'
        Transparent = True
        Layout = tlCenter
        WordWrap = True
      end
      object edSN: TcxButtonEdit
        Left = 130
        Top = 7
        Width = 583
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ClickKey = 16429
        Properties.MaxLength = 255
        Properties.ReadOnly = False
        Properties.OnButtonClick = edSNPropertiesButtonClick
        Properties.OnChange = edSNPropertiesChange
        Properties.OnEditValueChanged = edSNPropertiesEditValueChanged
        Style.StyleController = dmData.scMain
        TabOrder = 0
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
    end
    object panPriceInterval: TPanel
      Left = 0
      Top = 261
      Width = 725
      Height = 75
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 4
      DesignSize = (
        725
        75)
      object bvlPriceInterval: TssBevel
        Left = 5
        Top = 0
        Width = 719
        Height = 76
        Anchors = [akLeft, akTop, akRight]
        ColorGrBegin = clBtnFace
        ColorGrEnd = clBtnFace
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = [beLeft, beRight, beTop, beBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        GradientDirection = gdHorizontal
        HotTrack = False
        ImageIndex = 0
        UseGradient = False
      end
      object lPriceInterval: TssLabel
        Left = 15
        Top = 7
        Width = 261
        Height = 16
        AutoSize = False
        Caption = #1048#1085#1090#1077#1088#1074#1072#1083' '#1079#1072#1082#1091#1087#1086#1095#1085#1099#1093' '#1094#1077#1085':'
        Transparent = True
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object sbShowPriceIn: TssSpeedButton
        Left = 16
        Top = 36
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtChecked
        Checked = True
        GroupIndex = 0
        ImageIndex = 104
        Images = dmData.Images
        LeftMargin = 4
        ParentColorEx = False
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
        OnClick = sbShowPriceInClick
      end
      object panPriceIn: TPanel
        Left = 286
        Top = 5
        Width = 435
        Height = 63
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 0
        DesignSize = (
          435
          63)
        object lMinPrice: TLabel
          Left = 0
          Top = 1
          Width = 118
          Height = 16
          Caption = #1052#1080#1085#1080#1084#1072#1083#1100#1085#1072#1103' '#1094#1077#1085#1072':'
          Transparent = True
        end
        object stMinPrice: TssBevel
          Left = 150
          Top = 2
          Width = 280
          Height = 21
          Alignments.Horz = taRightJustify
          Anchors = [akLeft, akTop, akRight]
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
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          UseGradient = True
        end
        object stMaxPrice: TssBevel
          Left = 150
          Top = 42
          Width = 280
          Height = 21
          Alignments.Horz = taRightJustify
          Anchors = [akLeft, akTop, akRight]
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
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          UseGradient = True
        end
        object lMaxPrice: TLabel
          Left = 0
          Top = 41
          Width = 123
          Height = 16
          Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1094#1077#1085#1072':'
          Transparent = True
        end
        object lAvgPrice: TLabel
          Left = 0
          Top = 22
          Width = 87
          Height = 16
          Caption = #1057#1088#1077#1076#1085#1103#1103' '#1094#1077#1085#1072':'
          Transparent = True
        end
        object stAvgPrice: TssBevel
          Left = 150
          Top = 22
          Width = 280
          Height = 21
          Alignments.Horz = taRightJustify
          Anchors = [akLeft, akTop, akRight]
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
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          UseGradient = True
        end
      end
    end
    object panSummary: TPanel
      Left = 0
      Top = 407
      Width = 725
      Height = 111
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 3
      DesignSize = (
        725
        111)
      object bvlSummary: TssBevel
        Left = 5
        Top = 0
        Width = 719
        Height = 105
        Anchors = [akLeft, akTop, akRight, akBottom]
        ColorGrBegin = clBtnFace
        ColorGrEnd = clBtnFace
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = [beLeft, beRight, beTop, beBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        GradientDirection = gdHorizontal
        HotTrack = False
        ImageIndex = 0
        UseGradient = False
      end
      object lSummary: TLabel
        Left = 33
        Top = 11
        Width = 38
        Height = 16
        Anchors = [akTop]
        Caption = #1048#1090#1086#1075#1086':'
        Transparent = True
      end
      object lAmountEx: TLabel
        Left = 257
        Top = 11
        Width = 73
        Height = 16
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
        Transparent = True
      end
      object stAmountEx: TssBevel
        Left = 428
        Top = 7
        Width = 229
        Height = 24
        Alignments.Horz = taRightJustify
        Anchors = [akLeft, akTop, akRight]
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
        Left = 663
        Top = 7
        Width = 49
        Height = 24
        Alignments.Horz = taCenter
        Anchors = [akTop, akRight]
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
      object lSummWONDS: TLabel
        Left = 257
        Top = 34
        Width = 95
        Height = 16
        Caption = #1057#1091#1084#1084#1072' '#1073#1077#1079' '#1053#1044#1057':'
        Transparent = True
      end
      object stSumm: TssBevel
        Left = 428
        Top = 30
        Width = 229
        Height = 23
        Alignments.Horz = taRightJustify
        Anchors = [akLeft, akTop, akRight]
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
        Left = 663
        Top = 30
        Width = 49
        Height = 23
        Alignments.Horz = taCenter
        Anchors = [akTop, akRight]
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
      object lNDS: TssLabel
        Left = 257
        Top = 58
        Width = 60
        Height = 16
        Caption = #1053#1044#1057' 18%:'
        Transparent = True
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object stSummNDS: TssBevel
        Left = 428
        Top = 52
        Width = 229
        Height = 23
        Alignments.Horz = taRightJustify
        Anchors = [akLeft, akTop, akRight]
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
        Left = 663
        Top = 52
        Width = 49
        Height = 23
        Alignments.Horz = taCenter
        Anchors = [akTop, akRight]
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
      object lSummWithNDS: TssLabel
        Left = 257
        Top = 79
        Width = 81
        Height = 16
        Caption = #1057#1091#1084#1084#1072' '#1089' '#1053#1044#1057':'
        Transparent = True
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object stSummWithNDS: TssBevel
        Left = 428
        Top = 74
        Width = 229
        Height = 23
        Alignments.Horz = taRightJustify
        Anchors = [akLeft, akTop, akRight]
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
        Left = 663
        Top = 74
        Width = 49
        Height = 23
        Alignments.Horz = taCenter
        Anchors = [akTop, akRight]
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
    end
    object PanAddProps: TPanel
      Left = 0
      Top = 336
      Width = 725
      Height = 71
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 5
      DesignSize = (
        725
        71)
      object bvlAddPrps: TssBevel
        Left = 5
        Top = 0
        Width = 719
        Height = 73
        Anchors = [akLeft, akTop, akRight, akBottom]
        ColorGrBegin = clBtnFace
        ColorGrEnd = clBtnFace
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = [beLeft, beRight, beTop, beBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        GradientDirection = gdHorizontal
        HotTrack = False
        ImageIndex = 0
        Style = bsSingle
        UseGradient = False
      end
      object lProducer: TssLabel
        Left = 12
        Top = 15
        Width = 95
        Height = 16
        Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100':'
        Transparent = True
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object lCertNum: TssLabel
        Left = 345
        Top = 16
        Width = 122
        Height = 16
        Caption = #1053#1086#1084#1077#1088' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1072':'
        Transparent = True
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object lCertDate: TssLabel
        Left = 346
        Top = 44
        Width = 114
        Height = 16
        Caption = #1044#1072#1090#1072' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1072':'
        Transparent = True
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object lGTD: TssLabel
        Left = 12
        Top = 46
        Width = 70
        Height = 16
        Caption = #1053#1086#1084#1077#1088' '#1043#1058#1044':'
        Transparent = True
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object edCertNum: TcxTextEdit
        Left = 507
        Top = 10
        Width = 206
        Height = 26
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Properties.MaxLength = 64
        Properties.OnChange = DataModified
        Style.StyleController = dmData.scMain
        TabOrder = 2
        ImeName = 'Russian'
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
      object edCertDate: TcxDateEdit
        Left = 507
        Top = 39
        Width = 206
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        ImeName = 'Russian'
        Properties.SaveTime = False
        Properties.ShowTime = False
        Properties.OnChange = DataModified
        Style.StyleController = dmData.scMain
        TabOrder = 3
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
      object edGTD: TcxTextEdit
        Left = 148
        Top = 39
        Width = 179
        Height = 26
        AutoSize = False
        Properties.MaxLength = 64
        Properties.OnChange = DataModified
        Style.StyleController = dmData.scMain
        TabOrder = 1
        ImeName = 'Russian'
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
      object cbProducer: TcxComboBox
        Left = 148
        Top = 10
        Width = 179
        Height = 24
        BeepOnEnter = False
        ImeName = 'Russian'
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
    Width = 725
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
      Left = 667
    end
  end
  inherited panButtons: TPanel
    Top = 594
    Width = 725
    DesignSize = (
      725
      35)
    inherited btnOK: TxButton
      Left = 408
      Top = 6
    end
    inherited btnCancel: TxButton
      Left = 512
      Top = 6
    end
    inherited btnApply: TxButton
      Left = 615
      Top = 6
    end
    object cbReuseModal: TssCheckBox
      Left = 5
      Top = 7
      Width = 220
      Height = 24
      ParentFont = False
      ParentShowHint = False
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = 'Reuse Modal'
      ShowHint = True
      Style.StyleController = dmData.scMain
      TabOrder = 3
      ImeName = 'Russian'
      OnClick = cbReuseModalClick
    end
  end
  inherited panToolBar: TPanel
    Width = 725
    DesignSize = (
      725
      26)
    inherited btnLock: TssSpeedButton
      Left = 671
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 695
    end
    inherited btnHelp: TssSpeedButton
      Left = 647
    end
    object btnInfo: TssSpeedButton
      Left = 5
      Top = 1
      Width = 22
      Height = 22
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      Caption = 'aShowTurnIn'
      GroupIndex = 0
      ImageIndex = 99
      Images = dmData.Images
      LeftMargin = 1
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnInfoClick
    end
    object btnMove: TssSpeedButton
      Left = 33
      Top = 1
      Width = 22
      Height = 22
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      Caption = 'aShowTurnIn'
      GroupIndex = 0
      ImageIndex = 61
      Images = dmData.Images
      LeftMargin = 1
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnMoveClick
    end
    object btnRsv: TssSpeedButton
      Left = 62
      Top = 1
      Width = 22
      Height = 22
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      Caption = 'aShowTurnIn'
      GroupIndex = 0
      ImageIndex = 100
      Images = dmData.Images
      LeftMargin = 1
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnRsvClick
    end
    object btnMC: TssSpeedButton
      Left = 90
      Top = 1
      Width = 22
      Height = 22
      Action = aMC
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 153
      Images = dmData.Images
      LeftMargin = 1
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object btnSetPanels: TssSpeedButton
      Left = 607
      Top = 1
      Width = 23
      Height = 22
      Action = aSetPanels
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 40
      Images = dmData.Images
      LeftMargin = 1
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object btnOrder: TssSpeedButton
      Left = 118
      Top = 1
      Width = 22
      Height = 22
      Action = aOrder
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 189
      Images = dmData.Images
      LeftMargin = 1
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
  end
  inherited ilTitleBar: TImageList
    Left = 236
    Top = 4
  end
  inherited FormStorage: TssFormStorage
    StoredProps.Strings = (
      'aShowNDS.Checked'
      'btnShowNDS.Checked'
      'panSN.Visible'
      'panPriceInterval.Visible'
      'panSummary.Visible'
      'PanAddProps.Visible')
    Left = 205
    Top = 58
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
    object aMC: TAction
      Caption = 'aMC'
      ImageIndex = 153
      ShortCut = 16462
      OnExecute = aMCExecute
    end
    object aOrder: TAction
      Caption = 'aOrder'
      ImageIndex = 189
      ShortCut = 116
      OnExecute = aOrderExecute
    end
  end
  object cdsWhouse: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pWHouse_List'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsWhouseBeforeOpen
    AfterOpen = cdsWhouseAfterOpen
    Macros = <
      item
        DataType = ftString
        Name = 'm'
        ParamType = ptInput
      end>
    Left = 282
    Top = 82
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
    DataSet = cdsWhouse
    Left = 267
    Top = 51
  end
  object cdsMeasure: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pMeasures_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 274
    Top = 58
  end
  object dsMeasure: TDataSource
    DataSet = cdsMeasure
    Left = 279
    Top = 51
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
    Left = 266
    Top = 6
  end
end
