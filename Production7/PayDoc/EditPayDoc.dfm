inherited frmEditPayDoc: TfrmEditPayDoc
  Left = 426
  Top = 195
  Width = 659
  Height = 668
  Caption = 'frmEditPayDoc'
  Constraints.MinHeight = 560
  Constraints.MinWidth = 570
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 651
    Height = 556
    DesignSize = (
      651
      556)
    object ssBevel1: TssBevel
      Left = 6
      Top = 267
      Width = 644
      Height = 1
      Anchors = [akLeft, akTop, akRight]
      ColorGrBegin = clBtnFace
      ColorGrEnd = clBtnFace
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsTopLine
      Style = bsSingle
      UseGradient = False
    end
    object panMainInfo: TPanel
      Tag = 1
      Left = 0
      Top = 0
      Width = 651
      Height = 133
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        651
        133)
      object bvlMainInfo: TssBevel
        Left = 6
        Top = 1
        Width = 640
        Height = 132
        Anchors = [akLeft, akTop, akRight]
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
      object lDocNum: TLabel
        Left = 21
        Top = 44
        Width = 37
        Height = 16
        Caption = #1053#1086#1084#1077#1088
      end
      object lOnDate: TLabel
        Left = 318
        Top = 44
        Width = 29
        Height = 16
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = #1044#1072#1090#1072
      end
      object btnSetTime: TssSpeedButton
        Left = 617
        Top = 42
        Width = 20
        Height = 20
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        Anchors = [akTop, akRight]
        ButtonType = ssbtStandard
        Checked = False
        GroupIndex = 0
        ImageIndex = 95
        Images = dmData.Images
        LeftMargin = 2
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
        OnClick = btnSetTimeClick
      end
      object lPayType: TLabel
        Left = 21
        Top = 74
        Width = 73
        Height = 16
        Caption = #1058#1080#1087' '#1088#1072#1089#1095#1105#1090#1072
      end
      object lChargeType: TssLabel
        Left = 21
        Top = 103
        Width = 104
        Height = 16
        Caption = #1057#1090#1072#1090#1100#1103' '#1088#1072#1089#1093#1086#1076#1086#1074':'
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object btnChargeType: TssSpeedButton
        Left = 612
        Top = 100
        Width = 20
        Height = 20
        Action = aPayMPersons
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        Anchors = [akTop, akRight]
        ButtonType = ssbtStandard
        Checked = False
        GroupIndex = 0
        ImageIndex = -1
        Images = dmData.Images
        LeftMargin = 2
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
        OnMouseDown = btnChargeTypeMouseDown
        OnMouseUp = btnChargeTypeMouseUp
      end
      object btnFin: TssSpeedButton
        Left = 261
        Top = 71
        Width = 20
        Height = 20
        Action = aPayMPersons
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        GroupIndex = 0
        ImageIndex = -1
        Images = dmData.Images
        LeftMargin = 3
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
        OnMouseDown = btnFinMouseDown
        OnMouseUp = btnFinMouseUp
      end
      object chbChecked: TcxCheckBox
        Left = 16
        Top = 10
        Width = 215
        Height = 24
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1055#1088#1086#1074#1077#1089#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090
        State = cbsChecked
        Style.StyleController = dmData.scMain
        TabOrder = 0
        ImeName = 'Russian'
        OnClick = chbNDSClick
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
      object edDocNum: TcxTextEdit
        Left = 139
        Top = 39
        Width = 151
        Height = 24
        BeepOnEnter = False
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 20
        Style.StyleController = dmData.scMain
        TabOrder = 1
        ImeName = 'Russian'
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
      object edOnDate: TcxDateEdit
        Left = 352
        Top = 39
        Width = 130
        Height = 24
        Anchors = [akTop, akRight]
        BeepOnEnter = False
        ImeName = 'Russian'
        ParentFont = False
        Properties.DateOnError = deNull
        Properties.InputKind = ikMask
        Properties.SaveTime = False
        Properties.ShowTime = False
        Properties.OnChange = edOnDatePropertiesChange
        Properties.OnEditValueChanged = edOnDatePropertiesEditValueChanged
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        Style.StyleController = dmData.scMain
        TabOrder = 5
        OnExit = edOnDateExit
        OnKeyDown = GoNextKeyDown
        OnKeyPress = edOnDateKeyPress
      end
      object edTime: TcxTimeEdit
        Left = 501
        Top = 39
        Width = 112
        Height = 24
        Anchors = [akTop, akRight]
        EditValue = 0.000000000000000000
        ParentFont = False
        Properties.OnChange = DataModified
        Style.StyleController = dmData.scMain
        TabOrder = 6
        ImeName = 'Russian'
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
      object lcbPayType: TssDBLookupCombo
        Left = 139
        Top = 69
        Width = 122
        Height = 24
        ImeName = 'Russian'
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.OnEditValueChanged = lcbPayTypePropertiesEditValueChanged
        Style.StyleController = dmData.scMain
        TabOrder = 2
        OnEnter = lcbPayTypeEnter
        OnExit = lcbPayTypeExit
        OnKeyPress = GoNext
        EmptyValue = 0
        KeyField = 'ptypeid'
        ListField = 'name'
        ListSource = srcPayType
      end
      object nbPayType: TNotebook
        Left = 294
        Top = 69
        Width = 339
        Height = 26
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 3
        object TPage
          Left = 0
          Top = 0
          Caption = 'Default'
          object lCashDesk: TLabel
            Left = 2
            Top = 5
            Width = 33
            Height = 16
            Caption = #1050#1072#1089#1089#1072
          end
          object btnCashDesks: TssSpeedButton
            Left = 313
            Top = 2
            Width = 20
            Height = 20
            Action = aPayMPersons
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = -1
            Images = dmData.Images
            LeftMargin = 2
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnMouseDown = btnCashDesksMouseDown
            OnMouseUp = btnCashDesksMouseUp
          end
          object lcbCashDesks: TssDBLookupCombo
            Left = 49
            Top = 0
            Width = 261
            Height = 24
            ImeName = 'Russian'
            Properties.DropDownListStyle = lsEditFixedList
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 0
            OnKeyPress = GoNext
            EmptyValue = 0
            KeyField = 'cashid'
            ListField = 'name'
            ListSource = srcCashDesks
          end
        end
        object TPage
          Left = 0
          Top = 0
          Caption = 'Cashless'
          DesignSize = (
            339
            26)
          object lAccount: TLabel
            Left = 4
            Top = 5
            Width = 23
            Height = 16
            Caption = #1056'/'#1089':'
          end
          object lcbAccount: TssDBLookupCombo
            Left = 49
            Top = 0
            Width = 288
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ImeName = 'Russian'
            Properties.DropDownListStyle = lsFixedList
            Properties.OnChange = DataModified
            TabOrder = 0
            OnKeyPress = GoNext
            EmptyValue = 0
            KeyField = 'accid'
            ListField = 'fullname'
            ListSource = srcEntAcc
          end
        end
      end
      object lcbChargeType: TssDBLookupCombo
        Left = 139
        Top = 98
        Width = 470
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        ImeName = 'Russian'
        ParentFont = False
        Properties.DropDownListStyle = lsEditFixedList
        Properties.OnEditValueChanged = lcbPayTypePropertiesEditValueChanged
        Style.StyleController = dmData.scMain
        TabOrder = 4
        OnEnter = lcbPayMPersonEnter
        OnExit = lcbPayMPersonExit
        OnKeyPress = GoNext
        EmptyValue = 0
        KeyField = 'ctypeid'
        ListField = 'name'
        ListSource = srcChargeType
      end
    end
    object panKA: TPanel
      Tag = 1
      Left = 0
      Top = 133
      Width = 651
      Height = 103
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      DesignSize = (
        651
        103)
      object bvlKA: TssBevel
        Left = 6
        Top = -1
        Width = 640
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
        UseGradient = False
      end
      object lBallance: TLabel
        Left = 108
        Top = 43
        Width = 191
        Height = 16
        Caption = #1058#1077#1082#1091#1097#1080#1081' '#1073#1072#1083#1072#1085#1089' '#1089' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1086#1084
      end
      object stBallance: TssBevel
        Left = 304
        Top = 41
        Width = 297
        Height = 24
        Alignments.Horz = taRightJustify
        ColorGrBegin = clWindow
        ColorGrEnd = clWindow
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = [beLeft, beRight, beTop, beBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        GradientDirection = gdHorizontal
        HotTrack = False
        ImageIndex = 0
        Style = bsSingle
        UseGradient = True
      end
      object btnKABallance2: TssSpeedButton
        Left = 605
        Top = 41
        Width = 20
        Height = 20
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        GroupIndex = 0
        ImageIndex = 116
        Images = dmData.Images
        LeftMargin = 1
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
        OnClick = btnBallanceClick
      end
      object lPayMPerson: TssLabel
        Left = 21
        Top = 73
        Width = 69
        Height = 16
        Caption = #1063#1077#1088#1077#1079' '#1082#1086#1075#1086':'
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object btnPayMPerson: TssSpeedButton
        Left = 605
        Top = 70
        Width = 20
        Height = 20
        Action = aPayMPersons
        Alignment = taCenter
        AllwaysShowFrame = False
        Anchors = [akTop, akRight]
        ButtonType = ssbtStandard
        Checked = False
        GroupIndex = 0
        ImageIndex = -1
        Images = dmData.Images
        LeftMargin = 1
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
        OnMouseDown = btnPayMPersonMouseDown
        OnMouseUp = btnChargeTypeMouseUp
      end
      object edKAgent: TokKASearchEdit
        Left = 22
        Top = 6
        Width = 611
        Height = 31
        Anchors = [akLeft, akTop, akRight]
        ButtonsLeftMargin = 3
        CapFind = 'Search'
        CapFindParams = 'Search options'
        CapRef = 'Business Partners Directory'
        CapContextFind = 'Context search'
        CapFindBegin = 'From the beginning'
        CapFindConcurr = 'Full match'
        CapFindSubstr = 'Partial match'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        DisabledImages = dmData.Images18x18dis
        Images = dmData.Images18x18
        ImageIndexRef = 28
        ImageIndexFind = 18
        ImageIndexFindParams = 19
        LangManager = dmData.Lng
        RemoteServer = dmData.SConnection
        SearchNames.Strings = (
          'Short name;name')
        SearchType = stBegin
        TabOrder = 0
        OnChange = edKAgentChange
        OnRefButtonClick = edKAgentRefButtonClick
        LoadContracts = True
        SearchMode = smAll
        DesignSize = (
          611
          31)
      end
      object lcbPayMPerson: TssDBLookupCombo
        Left = 118
        Top = 68
        Width = 483
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        ImeName = 'Russian'
        ParentFont = False
        Properties.DropDownListStyle = lsEditFixedList
        Style.StyleController = dmData.scMain
        TabOrder = 1
        OnEnter = lcbPayMPersonEnter
        OnExit = lcbPayMPersonExit
        OnKeyPress = GoNext
        EmptyValue = 0
        KeyField = 'kaid'
        ListField = 'Name'
        ListSource = srcPayMPersons
      end
    end
    object panSumm: TPanel
      Tag = 1
      Left = 0
      Top = 236
      Width = 651
      Height = 74
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 2
      DesignSize = (
        651
        74)
      object bvlSumm: TssBevel
        Left = 6
        Top = -1
        Width = 640
        Height = 75
        Anchors = [akLeft, akTop, akRight]
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
      object lTotal: TLabel
        Left = 21
        Top = 14
        Width = 42
        Height = 16
        Caption = #1057#1091#1084#1084#1072':'
      end
      object lRate: TLabel
        Left = 386
        Top = 14
        Width = 81
        Height = 16
        Anchors = [akTop, akRight]
        Caption = #1050#1091#1088#1089' '#1074#1072#1083#1102#1090#1099':'
      end
      object lTotalDef: TLabel
        Left = 21
        Top = 44
        Width = 76
        Height = 16
        Caption = #1057#1091#1084#1084#1072' '#1074' RUR'
      end
      object stTotalDef: TssBevel
        Left = 140
        Top = 42
        Width = 121
        Height = 24
        Alignments.Horz = taRightJustify
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
        GradientDirection = gdHorizontal
        HotTrack = False
        ImageIndex = 0
        Style = bsSingle
        UseGradient = True
      end
      object stCurrencyDef: TssBevel
        Left = 263
        Top = 42
        Width = 69
        Height = 24
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
        GradientDirection = gdHorizontal
        HotTrack = False
        ImageIndex = 0
        Style = bsSingle
        UseGradient = True
      end
      object lNDS: TLabel
        Left = 346
        Top = 44
        Width = 91
        Height = 16
        Anchors = [akTop, akRight]
        Caption = #1042' '#1090'.'#1095'. '#1053#1044#1057' 20%'
      end
      object stNDS: TssBevel
        Left = 482
        Top = 42
        Width = 96
        Height = 22
        Alignments.Horz = taRightJustify
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
        GradientDirection = gdHorizontal
        HotTrack = False
        ImageIndex = 0
        Style = bsSingle
        UseGradient = True
      end
      object stCurrNDS: TssBevel
        Left = 578
        Top = 42
        Width = 54
        Height = 22
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
        GradientDirection = gdHorizontal
        HotTrack = False
        ImageIndex = 0
        Style = bsSingle
        UseGradient = True
      end
      object edTotal: TssCalcEdit
        Left = 138
        Top = 9
        Width = 123
        Height = 24
        EditValue = 0.000000000000000000
        ImeName = 'Russian'
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.ImmediatePost = True
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnChange = edTotalPropertiesChange
        Properties.OnEditValueChanged = edTotalPropertiesEditValueChanged
        Style.StyleController = dmData.scMain
        TabOrder = 0
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
        CalcColor = clBtnFace
        DecimalPlaces = 2
      end
      object lcbCurrency: TssDBLookupCombo
        Left = 261
        Top = 9
        Width = 72
        Height = 24
        ImeName = 'Russian'
        ParentFont = False
        Properties.DropDownListStyle = lsEditFixedList
        Properties.OnEditValueChanged = lcbCurrencyPropertiesEditValueChanged
        Style.StyleController = dmData.scMain
        TabOrder = 1
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
        EmptyValue = 0
        KeyField = 'currid'
        ListField = 'shortname'
        ListSource = srcCurrency
      end
      object chbNDS: TcxCheckBox
        Left = 448
        Top = 43
        Width = 22
        Height = 24
        Anchors = [akTop, akRight]
        Properties.Alignment = taRightJustify
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = ''
        State = cbsChecked
        TabOrder = 3
        ImeName = 'Russian'
        OnClick = chbNDSClick
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
      object edRate: TssCalcEdit
        Left = 535
        Top = 9
        Width = 99
        Height = 24
        Anchors = [akTop, akRight]
        EditValue = 0.000000000000000000
        ImeName = 'Russian'
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.ImmediatePost = True
        Properties.UseLeftAlignmentOnEditing = False
        Properties.OnChange = edRatePropertiesChange
        Style.StyleController = dmData.scMain
        TabOrder = 2
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
        CalcColor = clBtnFace
        DecimalPlaces = 8
      end
    end
    object panDoc: TPanel
      Left = 0
      Top = 310
      Width = 651
      Height = 123
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 4
      DesignSize = (
        651
        123)
      object bvlDoc: TssBevel
        Left = 6
        Top = -1
        Width = 640
        Height = 124
        Anchors = [akLeft, akTop, akRight]
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
      object lDocType: TssLabel
        Left = 302
        Top = 14
        Width = 92
        Height = 16
        Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072':'
        Enabled = False
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object btnWBDocs: TssSpeedButton
        Left = 263
        Top = 42
        Width = 29
        Height = 28
        Action = aWBDocs
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        DisabledImages = dmData.Images18x18dis
        Enabled = False
        GroupIndex = 0
        ImageIndex = 41
        Images = dmData.Images18x18
        LeftMargin = 2
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
      end
      object lDocSum: TssLabel
        Left = 303
        Top = 44
        Width = 124
        Height = 16
        Caption = #1057#1091#1084#1084#1072' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091':'
        Enabled = False
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object txtDocSumm: TssBevel
        Left = 478
        Top = 39
        Width = 155
        Height = 22
        Alignments.Horz = taRightJustify
        Anchors = [akLeft, akTop, akRight]
        ColorGrBegin = clWindow
        ColorGrEnd = clWindow
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = [beLeft, beRight, beTop, beBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnShadow
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        GradientDirection = gdHorizontal
        HotTrack = False
        ImageIndex = 0
        Style = bsSingle
        UseGradient = True
      end
      object lDocPaid: TssLabel
        Left = 303
        Top = 65
        Width = 63
        Height = 16
        Caption = #1054#1087#1083#1072#1095#1077#1085#1086':'
        Enabled = False
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object txtDocPaid: TssBevel
        Left = 478
        Top = 63
        Width = 155
        Height = 22
        Alignments.Horz = taRightJustify
        Anchors = [akLeft, akTop, akRight]
        ColorGrBegin = clWindow
        ColorGrEnd = clWindow
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = [beLeft, beRight, beTop, beBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnShadow
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        GradientDirection = gdHorizontal
        HotTrack = False
        ImageIndex = 0
        Style = bsSingle
        UseGradient = True
      end
      object txtDocSaldo: TssBevel
        Left = 478
        Top = 86
        Width = 155
        Height = 22
        Alignments.Horz = taRightJustify
        Anchors = [akLeft, akTop, akRight]
        ColorGrBegin = clWindow
        ColorGrEnd = clWindow
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = [beLeft, beRight, beTop, beBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnShadow
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        GradientDirection = gdHorizontal
        HotTrack = False
        ImageIndex = 0
        Style = bsSingle
        UseGradient = True
      end
      object lDocSaldo: TssLabel
        Left = 303
        Top = 87
        Width = 129
        Height = 16
        Caption = #1041#1072#1083#1072#1085#1089' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091':'
        Enabled = False
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object txtDocDate: TssBevel
        Left = 116
        Top = 74
        Width = 173
        Height = 22
        Alignments.Horz = taCenter
        ColorGrBegin = clWindow
        ColorGrEnd = clWindow
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = [beLeft, beRight, beTop, beBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnShadow
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        GradientDirection = gdHorizontal
        HotTrack = False
        ImageIndex = 0
        Style = bsSingle
        UseGradient = True
      end
      object lDocDate: TssLabel
        Left = 21
        Top = 75
        Width = 29
        Height = 16
        Caption = #1044#1072#1090#1072
        Enabled = False
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object chbDoc: TcxCheckBox
        Left = 16
        Top = 6
        Width = 162
        Height = 24
        Properties.Alignment = taLeftJustify
        Properties.DisplayUnchecked = 'False'
        Properties.Caption = #1054#1087#1083#1072#1090#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
        Style.StyleController = dmData.scMain
        TabOrder = 0
        ImeName = 'Russian'
        OnClick = chbDocClick
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
      object cbDocType: TcxComboBox
        Left = 409
        Top = 9
        Width = 224
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        Enabled = False
        ImeName = 'Russian'
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.OnEditValueChanged = cbDocTypePropertiesEditValueChanged
        Style.StyleController = dmData.scMain
        TabOrder = 1
        OnKeyPress = GoNext
      end
      object edWBNum: TokDocSearchEdit
        Left = 22
        Top = 41
        Width = 240
        Height = 30
        ButtonsLeftMargin = 4
        EditorOffset = 95
        Enabled = False
        LangManager = dmData.Lng
        RemoteServer = dmData.SConnection
        ShowLng = False
        ShowButtons = sbtHide
        SearchNames.Strings = (
          'Document No.;num')
        SearchType = stBegin
        Skin = dmData.sknMain
        TabOrder = 2
        OnChange = edWBNumChange
        WType = 0
        LoadDocSaldo = True
        DesignSize = (
          240
          30)
      end
      object edContr: TokContractSearchEdit
        Left = 22
        Top = 41
        Width = 270
        Height = 30
        ButtonsLeftMargin = 2
        CapRef = 'Contract Register'
        EditorOffset = 95
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        DisabledImages = dmData.Images18x18dis
        Enabled = False
        Images = dmData.Images18x18
        ImageIndexRef = 41
        LangManager = dmData.Lng
        RemoteServer = dmData.SConnection
        ShowLng = False
        ShowButtons = sbtOnlyRef
        SearchNames.Strings = (
          'Contract;num')
        SearchType = stBegin
        Skin = dmData.sknMain
        TabOrder = 3
        OnChange = edContrChange
        ContractType = ctIn
        DesignSize = (
          270
          30)
      end
    end
    object panNotes: TPanel
      Left = 0
      Top = 433
      Width = 651
      Height = 123
      Align = alClient
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 3
      DesignSize = (
        651
        123)
      object bvlNotes: TssBevel
        Left = 6
        Top = -1
        Width = 640
        Height = 122
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
      object lReason: TLabel
        Left = 21
        Top = 14
        Width = 64
        Height = 16
        Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
      end
      object lNotes: TLabel
        Left = 21
        Top = 39
        Width = 72
        Height = 16
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      end
      object edReason: TcxTextEdit
        Left = 139
        Top = 9
        Width = 494
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        BeepOnEnter = False
        ParentFont = False
        Properties.Alignment.Horz = taLeftJustify
        Properties.MaxLength = 255
        Style.StyleController = dmData.scMain
        TabOrder = 0
        ImeName = 'Russian'
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
      object memNotes: TMemo
        Left = 140
        Top = 39
        Width = 493
        Height = 77
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelInner = bvSpace
        BevelKind = bkFlat
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ImeName = 'Russian'
        MaxLength = 255
        ParentFont = False
        TabOrder = 1
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 651
    inherited panTitleButtons: TssPanel
      Left = 593
      inherited btnTBMinimize: TssSpeedButton
        Left = -2
      end
      inherited btnTBMaximize: TssSpeedButton
        Left = 15
      end
      inherited btnTBClose: TssSpeedButton
        Left = 32
      end
    end
  end
  inherited panButtons: TPanel
    Top = 603
    Width = 651
    inherited btnOK: TxButton
      Left = 341
    end
    inherited btnCancel: TxButton
      Left = 445
    end
    inherited btnApply: TxButton
      Left = 547
    end
  end
  inherited panToolBar: TPanel
    Width = 651
    inherited btnLock: TssSpeedButton
      Left = 577
      Top = 3
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 601
      Top = 3
    end
    inherited btnHelp: TssSpeedButton
      Left = 626
      Top = 3
    end
    object btnBallance: TssSpeedButton
      Left = 25
      Top = 1
      Width = 20
      Height = 20
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 116
      Images = dmData.Images
      LeftMargin = 1
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnBallanceClick
    end
    object btnSetPanels: TssSpeedButton
      Left = 63
      Top = 1
      Width = 20
      Height = 20
      Action = aSetPanels
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 40
      Images = dmData.Images
      LeftMargin = 2
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object btnPrint: TssSpeedButton
      Left = 6
      Top = 1
      Width = 20
      Height = 20
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 9
      Images = dmData.Images
      LeftMargin = 1
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object btnFinance: TssSpeedButton
      Left = 44
      Top = 1
      Width = 20
      Height = 20
      Action = aFinance
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 165
      Images = dmData.Images
      LeftMargin = 1
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
  end
  inherited ilTitleBar: TImageList
    Left = 84
    Top = 460
  end
  inherited FormStorage: TssFormStorage
    StoredProps.Strings = (
      'panDoc.Visible'
      'panNotes.Visible')
    Left = 56
    Top = 460
  end
  inherited ActionList: TActionList
    Images = dmData.Images18x18
    Left = 28
    Top = 460
    object aPayMPersons: TAction
      Caption = 'aPayMPersons'
      ShortCut = 16429
      OnExecute = aPayMPersonsExecute
    end
    object aSetPanels: TAction
      Caption = 'aSetPanels'
      ImageIndex = 40
      OnExecute = aSetPanelsExecute
    end
    object aWBDocs: TAction
      Caption = 'aWBDocs'
      ImageIndex = 41
      OnExecute = aWBDocsExecute
    end
    object aFinance: TAction
      Caption = 'aFinance'
      ImageIndex = 165
      OnExecute = aFinanceExecute
    end
  end
  object cdsCurrency: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDateTime
        Name = 'ondate'
        ParamType = ptInput
      end>
    ProviderName = 'pCurrency_ListEx'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsCurrencyBeforeOpen
    AfterOpen = cdsCurrencyAfterOpen
    Macros = <>
    Left = 76
    Top = 252
  end
  object srcCurrency: TDataSource
    DataSet = cdsCurrency
    Left = 68
    Top = 248
  end
  object cdsPayType: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'p_PayType_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 180
    Top = 28
  end
  object srcPayType: TDataSource
    DataSet = cdsPayType
    Left = 152
    Top = 28
  end
  object cdsPayMPersons: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'p_Persons_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 132
    Top = 204
  end
  object srcPayMPersons: TDataSource
    DataSet = cdsPayMPersons
    Left = 160
    Top = 204
  end
  object srcChargeType: TDataSource
    DataSet = cdsChargeType
    Left = 376
    Top = 424
  end
  object cdsChargeType: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pChargeType_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 404
    Top = 424
  end
  object cdsCashDesks: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pCashDesks_List'
    RemoteServer = dmData.SConnection
    AfterOpen = cdsCashDesksAfterOpen
    Macros = <>
    Left = 348
    Top = 32
  end
  object srcCashDesks: TDataSource
    DataSet = cdsCashDesks
    Left = 320
    Top = 32
  end
  object cdsEntAcc: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'p_EntAccounts_List'
    RemoteServer = dmData.SConnection
    OnCalcFields = cdsEntAccCalcFields
    Macros = <>
    Left = 420
    Top = 32
    object cdsEntAccACCID: TIntegerField
      FieldName = 'ACCID'
      Required = True
    end
    object cdsEntAccBANKID: TIntegerField
      FieldName = 'BANKID'
      Required = True
    end
    object cdsEntAccTYPEID: TIntegerField
      FieldName = 'TYPEID'
      Required = True
    end
    object cdsEntAccMFO: TStringField
      FieldName = 'MFO'
      Required = True
      Size = 10
    end
    object cdsEntAccNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 128
    end
    object cdsEntAccTYPENAME: TStringField
      FieldName = 'TYPENAME'
      Required = True
      Size = 64
    end
    object cdsEntAccfullname: TStringField
      FieldKind = fkCalculated
      FieldName = 'fullname'
      Size = 255
      Calculated = True
    end
    object cdsEntAccACCNUM: TStringField
      FieldName = 'ACCNUM'
      Required = True
      Size = 64
    end
    object cdsEntAccDEF: TIntegerField
      FieldName = 'DEF'
    end
  end
  object srcEntAcc: TDataSource
    DataSet = cdsEntAcc
    Left = 392
    Top = 32
  end
end
