inherited frmEditPositionMov: TfrmEditPositionMov
  Left = 495
  Top = 179
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'frmEditPositionMov'
  ClientHeight = 424
  ClientWidth = 624
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 624
    Height = 343
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
      Tag = 1
      Left = 0
      Top = 0
      Width = 624
      Height = 107
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        624
        107)
      object bvlMat: TssBevel
        Left = 5
        Top = 2
        Width = 613
        Height = 105
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
      object sbAddWHouse: TssSpeedButton
        Left = 526
        Top = 69
        Action = aAddWHouse
        Alignment = taCenter
        AllwaysShowFrame = False
        Anchors = [akTop, akRight]
        ButtonType = ssbtStandard
        Checked = False
        DisabledImages = dmData.Images18x18dis
        GroupIndex = 0
        ImageIndex = 26
        Images = dmData.Images18x18
        LeftMargin = 4
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
      end
      object lWhouse: TssLabel
        Left = 17
        Top = 73
        Width = 101
        Height = 22
        AutoSize = False
        Caption = 'lWhouse'
        Layout = tlCenter
        WordWrap = True
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object chbRsv: TcxCheckBox
        Left = 11
        Top = 10
        Width = 591
        Height = 27
        AutoSize = False
        ParentFont = False
        Properties.Alignment = taLeftJustify
        Properties.DisplayUnchecked = 'False'
        Properties.OnChange = DataModified
        Properties.OnEditValueChanged = chbRsvPropertiesEditValueChanged
        Properties.Caption = 'is rsv'
        State = cbsChecked
        Style.BorderColor = clBtnShadow
        Style.BorderStyle = ebsUltraFlat
        Style.Shadow = False
        Style.StyleController = dmData.scMain
        TabOrder = 0
        ImeName = 'Russian'
        OnEnter = CtrlEnter
        OnExit = CtrlExit
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
      object edFindMat: TokMatSearchEdit
        Left = 17
        Top = 38
        Width = 593
        Height = 31
        ButtonsLeftMargin = 3
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
        RemoteServer = dmData.SConnection
        ShowHint = True
        SearchNames.Strings = (
          'Name;name'
          'Model;artikul'
          'Barcode;barcode')
        SearchType = stBegin
        Skin = dmData.sknMain
        TabOrder = 1
        OnChange = edFindMatChange
        OnEndSearch = DataModified
        OnRefButtonClick = edFindMatRefButtonClick
        AllowZeroRest = True
        LoadNDS = True
        ScannerImageIndex = 50
        DesignSize = (
          593
          31)
      end
      object cbWHouse: TssDBLookupCombo
        Left = 103
        Top = 70
        Width = 421
        Height = 24
        ImeName = 'Russian'
        ParentFont = False
        Properties.DropDownListStyle = lsFixedList
        Properties.OnChange = cbWHousePropertiesChange
        Style.StyleController = dmData.scMain
        Style.ButtonStyle = btsSimple
        TabOrder = 2
        OnEnter = CtrlEnter
        OnExit = CtrlExit
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
        EmptyValue = 0
        KeyField = 'wid'
        ListField = 'name'
        ListSource = dsWhouse
      end
    end
    object panPrice: TPanel
      Tag = 1
      Left = 0
      Top = 107
      Width = 624
      Height = 74
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      DesignSize = (
        624
        74)
      object bvlPrice: TssBevel
        Left = 5
        Top = -1
        Width = 613
        Height = 75
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
        Left = 17
        Top = 14
        Width = 73
        Height = 16
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
      end
      object sbPartysSelect: TssSpeedButton
        Left = 234
        Top = 7
        Width = 27
        Height = 27
        Action = aPartysSelect
        Alignment = taCenter
        AllwaysShowFrame = False
        Anchors = [akTop, akRight]
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
      end
      object stMeasureName: TssBevel
        Left = 263
        Top = 10
        Width = 52
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
        Left = 329
        Top = 11
        Width = 129
        Height = 22
        AutoSize = False
        Caption = #1044#1086#1089#1090#1091#1087#1085#1086' '#1085#1072' '#1089#1082#1083#1072#1076#1077':'
        Layout = tlCenter
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object stRemain: TssBevel
        Left = 469
        Top = 10
        Width = 140
        Height = 23
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
        Font.Style = [fsBold]
        GradientDirection = gdVertical
        HotTrack = False
        ImageIndex = 0
        UseGradient = True
      end
      object lonsumm: TLabel
        Left = 17
        Top = 43
        Width = 58
        Height = 16
        Caption = #1053#1072' '#1089#1091#1084#1084#1091':'
      end
      object stSumm: TssBevel
        Left = 129
        Top = 39
        Width = 186
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
        Font.Style = [fsBold]
        GradientDirection = gdVertical
        HotTrack = False
        ImageIndex = 0
        UseGradient = True
      end
      object lRsv: TssLabel
        Left = 329
        Top = 41
        Width = 129
        Height = 22
        AutoSize = False
        Caption = 'lRsv'
        Layout = tlCenter
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object stRsv: TssBevel
        Left = 469
        Top = 39
        Width = 140
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
        Font.Style = [fsBold]
        GradientDirection = gdVertical
        HotTrack = False
        ImageIndex = 0
        UseGradient = True
      end
      object edAmount: TssCalcEdit
        Left = 128
        Top = 9
        Width = 105
        Height = 24
        EditValue = 0.000000000000000000
        ImeName = 'Russian'
        ParentFont = False
        Properties.ImmediatePost = True
        Properties.Precision = 15
        Properties.OnChange = edAmountPropertiesChange
        Style.StyleController = dmData.scMain
        TabOrder = 0
        OnEnter = CtrlEnter
        OnExit = CtrlExit
        OnKeyDown = GoNextKeyDown
        OnKeyPress = edAmountKeyPress
        CalcColor = clBtnFace
        DecimalPlaces = 4
      end
    end
    object panSN: TPanel
      Left = 0
      Top = 181
      Width = 624
      Height = 47
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 3
      DesignSize = (
        624
        47)
      object bvlSN: TssBevel
        Left = 5
        Top = -2
        Width = 613
        Height = 49
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
      object lSN: TssLabel
        Left = 17
        Top = 6
        Width = 101
        Height = 33
        AutoSize = False
        Caption = 'lSN'
        Layout = tlCenter
        WordWrap = True
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object edSN: TcxButtonEdit
        Left = 129
        Top = 10
        Width = 481
        Height = 24
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ClickKey = 16429
        Properties.ReadOnly = False
        Properties.OnButtonClick = edSNPropertiesButtonClick
        Properties.OnChange = DataModified
        Style.StyleController = dmData.scMain
        TabOrder = 0
        OnEnter = CtrlEnter
        OnExit = CtrlExit
        OnKeyDown = GoNextKeyDown
        OnKeyPress = GoNext
      end
    end
    object panSummary: TPanel
      Left = 0
      Top = 228
      Width = 624
      Height = 115
      Align = alClient
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 2
      DesignSize = (
        624
        115)
      object bvlSummary: TssBevel
        Left = 5
        Top = -1
        Width = 613
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
      object lAmountEx: TLabel
        Left = 130
        Top = 12
        Width = 73
        Height = 16
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
        Transparent = True
      end
      object lSummWONDS: TLabel
        Left = 130
        Top = 36
        Width = 95
        Height = 16
        Caption = #1057#1091#1084#1084#1072' '#1073#1077#1079' '#1053#1044#1057':'
        Transparent = True
      end
      object lNDS: TssLabel
        Left = 130
        Top = 59
        Width = 60
        Height = 16
        Caption = #1053#1044#1057' 18%:'
        Transparent = True
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object lSummWithNDS: TssLabel
        Left = 130
        Top = 80
        Width = 81
        Height = 16
        Caption = #1057#1091#1084#1084#1072' '#1089' '#1053#1044#1057':'
        Transparent = True
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object stAmountEx: TssBevel
        Left = 319
        Top = 9
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
      object stSummEx: TssBevel
        Left = 319
        Top = 31
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
      object stSummNDS: TssBevel
        Left = 319
        Top = 53
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
      object stSummWithNDS: TssBevel
        Left = 319
        Top = 75
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
        Left = 560
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
        Left = 560
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
        Left = 560
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
      object lSummary: TLabel
        Left = 17
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
        Transparent = True
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 624
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
    Top = 390
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
      Left = 5
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
    object btnMove: TssSpeedButton
      Left = 33
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
    object btnRsv: TssSpeedButton
      Left = 62
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
    object btnMC: TssSpeedButton
      Left = 90
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
    Left = 173
    Top = 13
  end
  inherited FormStorage: TssFormStorage
    StoredProps.Strings = (
      'panSN.Visible'
      'panSummary.Visible')
    Left = 285
    Top = 13
  end
  inherited ActionList: TActionList
    Images = dmData.Images18x18
    Left = 201
    Top = 13
    object aPartysSelect: TAction
      Caption = 'aPartysSelect'
      ImageIndex = 43
      OnExecute = aPartysSelectExecute
    end
    object aShowSN: TAction
      Caption = 'aShowSN'
      OnExecute = aShowSNExecute
    end
    object aAddMatR: TAction
      Caption = 'aAddMatR'
      ImageIndex = 22
      ShortCut = 16429
      OnExecute = aAddMatRExecute
    end
    object aSetPanels: TAction
      Caption = 'aSetPanels'
      ImageIndex = 40
      OnExecute = aSetPanelsExecute
    end
    object aAddWHouse: TAction
      Caption = 'aAddWHouse'
      ImageIndex = 26
      OnExecute = aAddWHouseExecute
    end
  end
  object dsmdPosition: TDataSource
    DataSet = mdPosition
    Left = 258
    Top = 13
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
    Left = 230
    Top = 13
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
    object mdPositionrsv: TFloatField
      FieldName = 'rsv'
    end
    object mdPositionpostype: TIntegerField
      FieldName = 'postype'
    end
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
    Left = 329
    Top = 61
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
    object mdRsvcurrid: TIntegerField
      FieldName = 'currid'
    end
    object mdRsvdiscount: TFloatField
      FieldName = 'discount'
    end
    object mdRsvnds: TFloatField
      FieldName = 'nds'
    end
    object mdRsvondate: TDateTimeField
      FieldName = 'ondate'
    end
    object mdRsvonvalue: TFloatField
      FieldName = 'onvalue'
    end
    object mdRsvcurrname: TStringField
      FieldName = 'currname'
      Size = 3
    end
    object mdRsvgtd: TStringField
      FieldName = 'gtd'
      Size = 64
    end
    object mdRsvproducer: TStringField
      FieldName = 'producer'
      Size = 255
    end
    object mdRsvcertnum: TStringField
      FieldName = 'certnum'
      Size = 64
    end
    object mdRsvcertdate: TDateField
      FieldName = 'certdate'
    end
  end
  object dsmdRsv: TDataSource
    DataSet = mdRsv
    Left = 357
    Top = 61
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
    Left = 122
    Top = 79
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
    Left = 155
    Top = 79
  end
end
