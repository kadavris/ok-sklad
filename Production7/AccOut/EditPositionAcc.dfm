inherited frmEditPositionAcc: TfrmEditPositionAcc
  Left = 666
  Top = 115
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'frmEditPositionAcc'
  ClientHeight = 786
  ClientWidth = 626
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 626
    Height = 704
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
    object lKurs: TLabel
      Left = 365
      Top = 7
      Width = 26
      Height = 16
      Alignment = taRightJustify
      Caption = 'Rate'
      Visible = False
    end
    object sbKurs: TssSpeedButton
      Left = 400
      Top = 5
      Width = 60
      Height = 21
      Action = aSetKurs
      Alignment = taCenter
      AllwaysShowFrame = True
      ButtonType = ssbtStandard
      Checked = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      GroupIndex = 0
      ImageIndex = -1
      Images = dmData.Images
      LeftMargin = 4
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsCaptionOnly
      Visible = False
    end
    object panMat: TPanel
      Tag = 1
      Left = 0
      Top = 0
      Width = 626
      Height = 146
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        626
        146)
      object bvlMat: TssBevel
        Left = 6
        Top = 4
        Width = 614
        Height = 142
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
      object lWhouse: TssLabel
        Left = 17
        Top = 119
        Width = 49
        Height = 16
        Caption = 'lWhouse'
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object sbAddWHouse: TssSpeedButton
        Left = 526
        Top = 113
        Width = 22
        Height = 22
        Action = aAddMatR
        Alignment = taCenter
        AllwaysShowFrame = False
        Anchors = [akTop, akRight]
        ButtonType = ssbtStandard
        Checked = False
        DisabledImages = dmData.Images18x18dis
        GroupIndex = 0
        ImageIndex = 22
        Images = dmData.Images18x18
        LeftMargin = 3
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
        OnMouseDown = sbAddWHouseMouseDown
        OnMouseUp = sbAddMatMouseUp
      end
      object btnRemainsAtWH: TssSpeedButton
        Left = 583
        Top = 113
        Width = 22
        Height = 22
        Action = aRemainsAtWH
        Alignment = taCenter
        AllwaysShowFrame = False
        Anchors = [akTop, akRight]
        ButtonType = ssbtStandard
        Checked = False
        DisabledImages = dmData.Images18x18dis
        DisabledImageIndex = 53
        GroupIndex = 0
        ImageIndex = 53
        Images = dmData.Images18x18
        LeftMargin = 3
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
        OnMouseDown = sbAddWHouseMouseDown
        OnMouseUp = sbAddMatMouseUp
      end
      object ssBevel1: TssBevel
        Left = 20
        Top = 36
        Width = 582
        Height = 1
        ColorGrBegin = clBtnFace
        ColorGrEnd = clBtnFace
        ColorInner = clBtnShadow
        ColorOuter = clBtnHighlight
        Edges = [beLeft, beRight, beTop, beBottom]
        GradientDirection = gdHorizontal
        HotTrack = False
        ImageIndex = 0
        UseGradient = False
      end
      object edFindMat: TokMatSearchEdit
        Left = 17
        Top = 81
        Width = 593
        Height = 31
        Anchors = [akLeft, akTop, akRight]
        ButtonsLeftMargin = 3
        CapFind = 'Search'
        CapFindParams = 'Search options'
        CapRef = 'Products Directory'
        CapContextFind = 'Context search'
        CapFindBegin = 'From the beginning'
        CapFindConcurr = 'Full match'
        CapFindSubstr = 'Partial match'
        EditorOffset = 85
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
        StyleController = dmData.scMain
        TabOrder = 0
        TabStop = True
        OnChange = edFindMatChange
        OnRefButtonClick = edFindMatRefButtonClick
        AllowZeroRest = True
        LoadNDS = True
        LoadTaxes = True
        OnWeightChanged = edFindMatWeightChanged
        ScannerImageIndex = 50
        DesignSize = (
          593
          31)
      end
      object chbRsv: TcxCheckBox
        Left = 12
        Top = 10
        Width = 361
        Height = 27
        TabStop = False
        AutoSize = False
        Properties.Alignment = taLeftJustify
        Properties.DisplayUnchecked = 'False'
        Properties.OnChange = chbRsvPropertiesChange
        Properties.Caption = #1047#1072#1088#1077#1079#1077#1088#1074#1080#1088#1086#1074#1072#1090#1100' '#1090#1086#1074#1072#1088
        State = cbsChecked
        Style.BorderColor = clBtnShadow
        Style.BorderStyle = ebsUltraFlat
        Style.Shadow = False
        Style.StyleController = dmData.scMain
        TabOrder = 2
        ImeName = 'Russian'
        OnClick = chbRsvClick
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
      object cbWHouse: TssDBLookupCombo
        Left = 103
        Top = 113
        Width = 421
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        ImeName = 'Russian'
        Properties.DropDownListStyle = lsFixedList
        Properties.OnEditValueChanged = cbWHousePropertiesEditValueChanged
        Style.StyleController = dmData.scMain
        Style.ButtonStyle = btsSimple
        TabOrder = 1
        OnEnter = edMatEnter
        OnExit = edMatExit
        OnKeyDown = GoNextKeyDown
        OnKeyPress = cbWHouseKeyPress
        EmptyValue = 0
        KeyField = 'wid'
        ListField = 'name'
        ListSource = dsWhouse
      end
      object edMatRB: TcxRadioGroup
        Left = 129
        Top = 39
        Width = 393
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
        TabOrder = 3
        OnClick = edMatRBClick
      end
    end
    object panPrice: TPanel
      Tag = 1
      Left = 0
      Top = 146
      Width = 626
      Height = 104
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      DesignSize = (
        626
        104)
      object bvlPrice: TssBevel
        Left = 6
        Top = -1
        Width = 614
        Height = 104
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
      object lAmount: TssLabel
        Left = 17
        Top = 14
        Width = 73
        Height = 16
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object sbPartysSelect: TssSpeedButton
        Left = 257
        Top = 10
        Width = 22
        Height = 22
        Action = aPartysSelect
        Alignment = taCenter
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        DisabledImages = dmData.Images18x18dis
        GroupIndex = 0
        ImageIndex = 43
        Images = dmData.Images18x18
        LeftMargin = 3
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
        OnMouseDown = sbAddWHouseMouseDown
        OnMouseUp = sbAddMatMouseUp
      end
      object stMeasureName: TssBevel
        Left = 287
        Top = 10
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
      object lRemain: TssLabel
        Left = 359
        Top = 7
        Width = 122
        Height = 16
        Caption = #1044#1086#1089#1090#1091#1087#1085#1086' '#1085#1072' '#1089#1082#1083#1072#1076#1077':'
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object stRemain: TssBevel
        Left = 502
        Top = 6
        Width = 108
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
      object lPriceType: TssLabel
        Left = 17
        Top = 43
        Width = 99
        Height = 16
        Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103' '#1094#1077#1085#1099':'
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object lRemainAll: TLabel
        Left = 359
        Top = 28
        Width = 98
        Height = 16
        Caption = #1044#1086#1089#1090#1091#1087#1085#1086' '#1074#1077#1079#1076#1077':'
      end
      object stRemainAll: TssBevel
        Left = 502
        Top = 26
        Width = 108
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
      object lPrice: TssLabel
        Left = 17
        Top = 74
        Width = 136
        Height = 16
        Caption = 'Price per unit, VAT incl:'
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object stCurrShortName: TssBevel
        Left = 287
        Top = 69
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
      object lNDSRate: TssLabel
        Left = 359
        Top = 74
        Width = 95
        Height = 16
        Caption = #1057#1090#1072#1074#1082#1072' '#1053#1044#1057', %:'
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object btnShowNDS: TssSpeedButton
        Left = 583
        Top = 68
        Width = 22
        Height = 22
        Action = aShowNDS
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        Anchors = [akTop, akRight]
        ButtonType = ssbtChecked
        Checked = True
        GroupIndex = 0
        ImageIndex = -1
        Images = dmData.Images
        LeftMargin = 2
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
      end
      object ssSpeedButton1: TssSpeedButton
        Left = 309
        Top = 38
        Width = 27
        Height = 26
        Alignment = taCenter
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        Caption = 'aPartysSelect'
        DisabledImages = dmData.Images18x18dis
        Enabled = False
        GroupIndex = 0
        ImageIndex = 40
        Images = dmData.Images18x18
        LeftMargin = 3
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
        OnClick = aPartysSelectExecute
        OnMouseDown = sbAddWHouseMouseDown
        OnMouseUp = sbAddMatMouseUp
      end
      object lRsv: TLabel
        Left = 359
        Top = 48
        Width = 64
        Height = 16
        Caption = #1042' '#1088#1077#1079#1077#1088#1074#1077':'
      end
      object stRsv: TssBevel
        Left = 502
        Top = 46
        Width = 108
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
      object edAmount: TssCalcEdit
        Left = 159
        Top = 9
        Width = 98
        Height = 24
        EditValue = 0.000000000000000000
        ImeName = 'Russian'
        Properties.ImmediatePost = True
        Properties.Precision = 15
        Properties.OnChange = edAmountPropertiesChange
        Style.StyleController = dmData.scMainOK
        TabOrder = 0
        OnEnter = edMatEnter
        OnExit = edMatExit
        OnKeyDown = GoNextKeyDown
        OnKeyPress = edAmountKeyPress
        CalcColor = clBtnFace
        DecimalPlaces = 3
      end
      object lcbPriceTypes: TssDBLookupCombo
        Left = 159
        Top = 38
        Width = 149
        Height = 24
        TabStop = False
        ImeName = 'Russian'
        Properties.DropDownListStyle = lsEditFixedList
        Properties.OnChange = lcbPriceTypesPropertiesChange
        Style.StyleController = dmData.scMain
        TabOrder = 2
        OnKeyPress = GoNext
        EmptyValue = 0
        KeyField = 'ptypeid'
        ListField = 'name'
        ListSource = dsPriceTypes
      end
      object edPrice: TssCalcEdit
        Left = 159
        Top = 68
        Width = 127
        Height = 24
        EditValue = 0.000000000000000000
        ImeName = 'Russian'
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
      object edNDS: TssCalcEdit
        Left = 502
        Top = 68
        Width = 81
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        EditValue = 0.000000000000000000
        ImeName = 'Russian'
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
      Top = 250
      Width = 626
      Height = 44
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 2
      DesignSize = (
        626
        44)
      object bvlSN: TssBevel
        Left = 6
        Top = -1
        Width = 614
        Height = 45
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
      object lSN: TssLabel
        Left = 17
        Top = 5
        Width = 107
        Height = 33
        AutoSize = False
        Caption = #1057#1077#1088#1080#1081#1085#1099#1077' '#1085#1086#1084#1077#1088#1072':'
        WordWrap = True
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object edSN: TcxButtonEdit
        Left = 129
        Top = 9
        Width = 483
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ClickKey = 16429
        Properties.ReadOnly = False
        Properties.OnButtonClick = edSNPropertiesButtonClick
        Style.StyleController = dmData.scMain
        TabOrder = 0
        OnEnter = edSN1Enter
        OnExit = edSN1Exit
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
    end
    object PanAddProps: TPanel
      Left = 0
      Top = 478
      Width = 626
      Height = 73
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 4
      DesignSize = (
        626
        73)
      object bvlAddPrps: TssBevel
        Left = 6
        Top = 0
        Width = 614
        Height = 74
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
        Left = 17
        Top = 14
        Width = 95
        Height = 16
        Caption = #1055#1088#1086#1080#1079#1074#1086#1076#1080#1090#1077#1083#1100':'
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object lCertNum: TssLabel
        Left = 320
        Top = 15
        Width = 122
        Height = 16
        Caption = #1053#1086#1084#1077#1088' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1072':'
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object lCertDate: TssLabel
        Left = 320
        Top = 43
        Width = 114
        Height = 16
        Caption = #1044#1072#1090#1072' '#1089#1077#1088#1090#1080#1092#1080#1082#1072#1090#1072':'
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object lGTD: TssLabel
        Left = 17
        Top = 44
        Width = 70
        Height = 16
        Caption = #1053#1086#1084#1077#1088' '#1043#1058#1044':'
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object edCertNum: TcxTextEdit
        Left = 462
        Top = 9
        Width = 150
        Height = 25
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        ParentFont = False
        Properties.MaxLength = 64
        Properties.OnChange = DataModified
        Style.StyleController = dmData.scMain
        TabOrder = 2
        ImeName = 'Russian'
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
      object edCertDate: TcxDateEdit
        Left = 462
        Top = 38
        Width = 150
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        ImeName = 'Russian'
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
        Left = 128
        Top = 38
        Width = 180
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
        Left = 128
        Top = 9
        Width = 180
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
    object panDiscount: TPanel
      Left = 0
      Top = 294
      Width = 626
      Height = 101
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 3
      DesignSize = (
        626
        101)
      object bvlDiscount: TssBevel
        Left = 6
        Top = -1
        Width = 614
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
        Left = 433
        Top = 64
        Width = 121
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
        UseGradient = True
      end
      object lPriceDiscount: TssLabel
        Left = 330
        Top = 68
        Width = 93
        Height = 16
        Caption = #1050#1086#1085#1077#1095#1085#1072#1103' '#1094#1077#1085#1072':'
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object txtFinallyPriceCurr: TssBevel
        Left = 558
        Top = 64
        Width = 51
        Height = 23
        Alignments.Horz = taCenter
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
        Font.Style = []
        GradientDirection = gdVertical
        HotTrack = False
        ImageIndex = 0
        UseGradient = True
      end
      object txtDiscHolder: TssBevel
        Left = 433
        Top = 34
        Width = 176
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
        GradientDirection = gdVertical
        HotTrack = False
        ImageIndex = 0
        UseGradient = True
        WordBreak = False
      end
      object lHolder: TssLabel
        Left = 329
        Top = 38
        Width = 72
        Height = 16
        Caption = #1044#1077#1088#1078#1072#1090#1077#1083#1100':'
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object btnDiscountType: TssSpeedButton
        Left = 299
        Top = 65
        Width = 22
        Height = 22
        Alignment = taCenter
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        Caption = '%'
        GroupIndex = 0
        ImageIndex = 43
        LeftMargin = 3
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsCaptionOnly
        Visible = False
        OnClick = btnDiscountTypeClick
      end
      object chbDiscount: TcxCheckBox
        Left = 17
        Top = 9
        Width = 280
        Height = 25
        AutoSize = False
        Properties.Alignment = taLeftJustify
        Properties.DisplayUnchecked = 'False'
        Properties.OnChange = chbDiscountPropertiesChange
        Properties.Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1089#1082#1080#1076#1082#1091
        TabOrder = 0
        ImeName = 'Russian'
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
      object edDiscount: TssCalcEdit
        Left = 180
        Top = 63
        Width = 117
        Height = 24
        EditValue = 0.000000000000000000
        Enabled = False
        ImeName = 'Russian'
        ParentFont = False
        Properties.OnChange = edDiscountPropertiesChange
        Style.StyleController = dmData.scMain
        TabOrder = 4
        OnKeyDown = GoNextKeyDown
        OnKeyPress = edDiscountKeyPress
        CalcColor = clBtnFace
        DecimalPlaces = 2
      end
      object rbtDiscCard: TcxRadioButton
        Left = 34
        Top = 37
        Width = 144
        Height = 21
        Caption = #1044#1080#1089#1082#1086#1085#1090#1085#1072#1103' '#1082#1072#1088#1090#1072
        TabOrder = 1
        OnClick = rbtDiscManualClick
        OnKeyPress = rbtDiscCardKeyPress
      end
      object rbtDiscManual: TcxRadioButton
        Left = 34
        Top = 64
        Width = 144
        Height = 21
        Caption = #1042#1088#1091#1095#1085#1091#1102
        Checked = True
        TabOrder = 2
        TabStop = True
        OnClick = rbtDiscManualClick
        OnKeyPress = GoNext
      end
      object edDiscCard: TokDiscCardSearchEdit
        Left = 180
        Top = 31
        Width = 141
        Height = 31
        ButtonsLeftMargin = 2
        CapRef = 'Discount Cards Directory'
        EditorOffset = 0
        DisabledImages = dmData.Images18x18dis
        Images = dmData.Images18x18
        ImageIndexRef = 49
        LangManager = dmData.Lng
        RemoteServer = dmData.SConnection
        ShowLng = False
        ShowButtons = sbtOnlyRef
        SearchNames.Strings = (
          'No.;num')
        SearchType = stBegin
        StyleController = dmData.scMain
        TabOrder = 3
        OnChange = edDiscCardChange
        DesignSize = (
          141
          31)
      end
    end
    object panSummary: TPanel
      Left = 0
      Top = 596
      Width = 626
      Height = 112
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 7
      DesignSize = (
        626
        112)
      object bvlSummary: TssBevel
        Left = 6
        Top = -2
        Width = 614
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
        Left = 17
        Top = 12
        Width = 42
        Height = 16
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
        Width = 241
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
      object stSumm: TssBevel
        Left = 318
        Top = 31
        Width = 241
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
        Width = 241
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
        Width = 241
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
      object txtSummAmount: TssBevel
        Left = 560
        Top = 9
        Width = 50
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
        Font.Style = []
        GradientDirection = gdVertical
        HotTrack = False
        ImageIndex = 0
        UseGradient = True
      end
      object txtSummWONDS: TssBevel
        Left = 560
        Top = 31
        Width = 50
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
        Font.Style = []
        GradientDirection = gdVertical
        HotTrack = False
        ImageIndex = 0
        UseGradient = True
      end
      object txtSummNDS: TssBevel
        Left = 560
        Top = 53
        Width = 50
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
        Font.Style = []
        GradientDirection = gdVertical
        HotTrack = False
        ImageIndex = 0
        UseGradient = True
      end
      object txtSummWithNDS: TssBevel
        Left = 560
        Top = 75
        Width = 50
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
        Font.Style = []
        GradientDirection = gdVertical
        HotTrack = False
        ImageIndex = 0
        UseGradient = True
      end
    end
    object panWarranty: TPanel
      Left = 0
      Top = 551
      Width = 626
      Height = 45
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 5
      Visible = False
      DesignSize = (
        626
        45)
      object bvlWarranty: TssBevel
        Left = 6
        Top = -1
        Width = 614
        Height = 45
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
      object lWPeriod: TssLabel
        Left = 320
        Top = 14
        Width = 113
        Height = 16
        Caption = #1043#1072#1088#1072#1085#1090#1080#1081#1085#1099#1081' '#1089#1088#1086#1082':'
        Enabled = False
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object cbWPeriodType: TcxComboBox
        Left = 523
        Top = 9
        Width = 89
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        BeepOnEnter = False
        Enabled = False
        ImeName = 'Russian'
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.MaxLength = 255
        Properties.OnChange = DataModified
        TabOrder = 2
        OnKeyPress = GoNext
      end
      object chbWarranty: TcxCheckBox
        Left = 12
        Top = 9
        Width = 265
        Height = 25
        AutoSize = False
        Properties.Alignment = taLeftJustify
        Properties.DisplayUnchecked = 'False'
        Properties.OnChange = chbDiscountPropertiesChange
        Properties.Caption = #1055#1086#1089#1090#1072#1074#1080#1090#1100' '#1085#1072' '#1075#1072#1088#1072#1085#1090#1080#1102
        Style.StyleController = dmData.scMain
        TabOrder = 0
        ImeName = 'Russian'
        OnClick = chbWarrantyClick
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
      object edWPeriod: TcxSpinEdit
        Left = 462
        Top = 9
        Width = 60
        Height = 24
        Enabled = False
        Properties.MaxValue = 10000.000000000000000000
        Properties.MinValue = 1.000000000000000000
        Properties.OnChange = edWPeriodPropertiesChange
        TabOrder = 1
        Value = 12
        ImeName = 'Russian'
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
    end
    object panInterval: TPanel
      Left = 0
      Top = 395
      Width = 626
      Height = 83
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 6
      DesignSize = (
        626
        83)
      object bvlPriceIn: TssBevel
        Left = 6
        Top = -1
        Width = 614
        Height = 111
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
      object lPriceInterval: TssLabel
        Left = 20
        Top = 17
        Width = 261
        Height = 16
        AutoSize = False
        Caption = #1048#1085#1090#1077#1088#1074#1072#1083' '#1079#1072#1082#1091#1087#1086#1095#1085#1099#1093' '#1094#1077#1085':'
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object sbShowPriceIn: TssSpeedButton
        Left = 21
        Top = 43
        Width = 22
        Height = 22
        Action = aShowPriceIn
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtChecked
        Checked = True
        GroupIndex = 0
        ImageIndex = 35
        Images = dmData.Images
        LeftMargin = 2
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
      end
      object panPriceIn: TPanel
        Left = 313
        Top = 12
        Width = 300
        Height = 63
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        Visible = False
        DesignSize = (
          300
          63)
        object lMinPrice: TLabel
          Left = 7
          Top = 2
          Width = 118
          Height = 16
          Caption = #1052#1080#1085#1080#1084#1072#1083#1100#1085#1072#1103' '#1094#1077#1085#1072':'
        end
        object stMinPrice: TssBevel
          Left = 150
          Top = 0
          Width = 145
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
          Top = 39
          Width = 145
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
          Left = 7
          Top = 42
          Width = 123
          Height = 16
          Caption = #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072#1103' '#1094#1077#1085#1072':'
        end
        object lAvgPrice: TLabel
          Left = 7
          Top = 22
          Width = 87
          Height = 16
          Caption = #1057#1088#1077#1076#1085#1103#1103' '#1094#1077#1085#1072':'
        end
        object stAvgPrice: TssBevel
          Left = 150
          Top = 20
          Width = 145
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
  end
  inherited panTitleBar: TssGradientPanel
    Width = 626
    object lMatEx: TLabel [0]
      Left = 44
      Top = 5
      Width = 6
      Height = 16
      AutoSize = False
      Caption = ' '
      Transparent = True
      OnMouseDown = panTitleBarMouseDown
    end
    object lTitle: TLabel [1]
      Left = 5
      Top = 5
      Width = 25
      Height = 16
      Caption = 'Test'
      Transparent = True
      OnMouseDown = panTitleBarMouseDown
    end
    inherited panTitleButtons: TssPanel
      Left = 567
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
    Top = 751
    Width = 626
    DesignSize = (
      626
      35)
    inherited btnOK: TxButton
      Left = 315
      Top = 9
      Width = 99
      Height = 24
    end
    inherited btnCancel: TxButton
      Left = 418
      Top = 9
      Height = 24
    end
    inherited btnApply: TxButton
      Left = 522
      Top = 9
      Height = 24
    end
    object cbReuseModal: TssCheckBox
      Left = 5
      Top = 10
      Width = 299
      Height = 26
      TabStop = False
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      ParentShowHint = False
      Properties.DisplayUnchecked = 'False'
      ShowHint = True
      TabOrder = 3
      ImeName = 'Russian'
      OnClick = cbReuseModalClick
    end
  end
  inherited panToolBar: TPanel
    Width = 626
    DesignSize = (
      626
      26)
    inherited btnLock: TssSpeedButton
      Left = 574
      Top = 2
      Width = 22
      Height = 22
      LeftMargin = 2
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 597
      Top = 2
      Width = 22
      Height = 22
      LeftMargin = 2
    end
    inherited btnHelp: TssSpeedButton
      Left = 551
      Top = 2
      Width = 22
      Height = 22
      LeftMargin = 2
    end
    object btnMC: TssSpeedButton
      Left = 75
      Top = 2
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
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object btnRsv: TssSpeedButton
      Left = 52
      Top = 2
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
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnRsvClick
    end
    object btnMove: TssSpeedButton
      Left = 29
      Top = 2
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
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnMoveClick
    end
    object btnInfo: TssSpeedButton
      Left = 6
      Top = 2
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
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnInfoClick
    end
    object btnSetPanels: TssSpeedButton
      Left = 511
      Top = 2
      Width = 22
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
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object btnOrder: TssSpeedButton
      Left = 98
      Top = 2
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
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object btnOrderOut: TssSpeedButton
      Left = 121
      Top = 2
      Width = 22
      Height = 22
      Action = aOrderOut
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 190
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
  end
  inherited ilTitleBar: TImageList
    Left = 44
    Top = 128
  end
  inherited FormStorage: TssFormStorage
    Active = True
    StoredProps.Strings = (
      'aShowPriceIn.Checked'
      'aShowNDS.Checked'
      'btnShowNDS.Checked'
      'panSN.Visible'
      'PanAddProps.Visible'
      'panDiscount.Visible'
      'panSummary.Visible'
      'panWarranty.Visible'
      'panInterval.Visible')
    Left = 256
    Top = 6
  end
  inherited ActionList: TActionList
    Images = dmData.Images18x18
    Left = 142
    Top = 55
    object aShowPriceIn: TAction
      Caption = 'aShowPriceIn'
      Checked = True
      ImageIndex = 35
      OnExecute = aShowPriceInExecute
    end
    object aAddMatR: TAction
      Caption = 'aAddMatR'
      ImageIndex = 22
      ShortCut = 16429
      OnExecute = aAddMatRExecute
    end
    object aAddWHouse: TAction
      Caption = 'aAddWHouse'
      ImageIndex = 26
      ShortCut = 16429
    end
    object aSetKurs: TAction
      Caption = 'aSetKurs'
      OnExecute = aSetKursExecute
    end
    object aPartysSelect: TAction
      Caption = 'aPartysSelect'
      ImageIndex = 43
      OnExecute = aPartysSelectExecute
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
    object aShowSN: TAction
      Caption = 'aShowSN'
      OnExecute = aShowSNExecute
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
    object aOrderOut: TAction
      Caption = 'aOrderOut'
      ImageIndex = 190
      ShortCut = 117
      OnExecute = aOrderOutExecute
    end
    object aRemainsAtWH: TAction
      Caption = 'aRemainsAtWH'
      ImageIndex = 53
      ShortCut = 16471
      OnExecute = aRemainsAtWHExecute
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
    Left = 254
    Top = 51
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
    Left = 287
    Top = 51
  end
  object dsmdPosition: TDataSource
    DataSet = mdPosition
    Left = 520
    Top = 63
  end
  object dsmdRsv: TDataSource
    DataSet = mdRsv
    Left = 204
    Top = 50
  end
  object cdsPriceTypes: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'matid'
        ParamType = ptUnknown
      end>
    ProviderName = 'pPriceTypes_MatList'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsPriceTypesBeforeOpen
    AfterOpen = cdsPriceTypesAfterOpen
    Macros = <>
    Left = 332
    Top = 50
  end
  object dsPriceTypes: TDataSource
    DataSet = cdsPriceTypes
    Left = 361
    Top = 50
  end
  object mdRsv: TssMemoryData
    FieldDefs = <
      item
        Name = 'matid'
        DataType = ftInteger
      end
      item
        Name = 'wid'
        DataType = ftInteger
      end
      item
        Name = 'posid'
        DataType = ftInteger
      end
      item
        Name = 'amount'
        DataType = ftFloat
      end
      item
        Name = 'ondate'
        DataType = ftDateTime
      end
      item
        Name = 'price'
        DataType = ftCurrency
      end
      item
        Name = 'currid'
        DataType = ftInteger
      end
      item
        Name = 'onvalue'
        DataType = ftFloat
      end
      item
        Name = 'NDS'
        DataType = ftFloat
      end
      item
        Name = 'Discount'
        DataType = ftFloat
      end>
    Left = 176
    Top = 50
    object IntegerField3: TIntegerField
      FieldName = 'posid'
    end
    object FloatField1: TFloatField
      FieldName = 'amount'
    end
    object mdRsvpricein: TFloatField
      FieldName = 'pricein'
    end
    object mdRsvSN: TStringField
      FieldName = 'SN'
      Size = 64
    end
    object mdRsvpostype: TIntegerField
      FieldName = 'postype'
    end
  end
  object mdPosition: TssMemoryData
    FieldDefs = <
      item
        Name = 'matid'
        DataType = ftInteger
      end
      item
        Name = 'wid'
        DataType = ftInteger
      end
      item
        Name = 'posid'
        DataType = ftInteger
      end
      item
        Name = 'amount'
        DataType = ftFloat
      end
      item
        Name = 'ondate'
        DataType = ftDateTime
      end
      item
        Name = 'price'
        DataType = ftCurrency
      end
      item
        Name = 'currid'
        DataType = ftInteger
      end
      item
        Name = 'onvalue'
        DataType = ftFloat
      end
      item
        Name = 'NDS'
        DataType = ftFloat
      end
      item
        Name = 'Discount'
        DataType = ftFloat
      end>
    OnCalcFields = mdPositionCalcFields
    Left = 548
    Top = 63
    object mdPositionmatid: TIntegerField
      FieldName = 'matid'
    end
    object mdPositionwid: TIntegerField
      FieldName = 'wid'
    end
    object mdPositionposid: TIntegerField
      FieldName = 'posid'
    end
    object mdPositionamount: TFloatField
      FieldName = 'amount'
    end
    object mdPositionondate: TDateTimeField
      FieldName = 'ondate'
    end
    object mdPositioncurrid: TIntegerField
      FieldName = 'currid'
    end
    object mdPositiononvalue: TFloatField
      FieldName = 'onvalue'
    end
    object mdPositionNDS: TFloatField
      FieldName = 'NDS'
    end
    object mdPositionDiscount: TFloatField
      FieldName = 'Discount'
    end
    object mdPositioncurrname: TStringField
      FieldName = 'currname'
    end
    object mdPositiondocnum: TStringField
      FieldName = 'docnum'
    end
    object mdPositiondocdate: TDateTimeField
      FieldName = 'docdate'
    end
    object mdPositiondocnumtxt: TStringField
      FieldKind = fkCalculated
      FieldName = 'docnumtxt'
      Size = 128
      Calculated = True
    end
    object mdPositionwhname: TStringField
      FieldName = 'whname'
      Size = 64
    end
    object mdPositionprice: TFloatField
      FieldName = 'price'
    end
    object mdPositionpricetxt: TStringField
      Alignment = taRightJustify
      FieldKind = fkCalculated
      FieldName = 'pricetxt'
      Calculated = True
    end
    object mdPositionSN: TStringField
      FieldName = 'SN'
      Size = 64
    end
    object mdPositionwtype: TIntegerField
      FieldName = 'wtype'
    end
    object mdPositionwbillid: TIntegerField
      FieldName = 'wbillid'
    end
    object mdPositiongtd: TStringField
      DisplayWidth = 64
      FieldName = 'gtd'
      Size = 64
    end
    object mdPositionproducer: TStringField
      FieldName = 'producer'
      Size = 255
    end
    object mdPositioncertnum: TStringField
      FieldName = 'certnum'
      Size = 64
    end
    object mdPositioncertdate: TDateTimeField
      FieldName = 'certdate'
    end
    object mdPositionpostype: TIntegerField
      FieldName = 'postype'
    end
  end
  object DataSource1: TDataSource
    DataSet = mdwmt
    Left = 441
    Top = 61
  end
  object mdwmt: TdxMemData
    Indexes = <>
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
    SortOptions = []
    Left = 413
    Top = 61
  end
end
