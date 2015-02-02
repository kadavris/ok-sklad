inherited frmEditPosReturnIn: TfrmEditPosReturnIn
  Left = 448
  Top = 224
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'frmEditPosReturnIn'
  ClientHeight = 420
  ClientWidth = 624
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 624
    Height = 335
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
      Height = 75
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        624
        75)
      object ssBevel1: TssBevel
        Left = 4
        Top = 0
        Width = 615
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
      object sbAddWHouse: TssSpeedButton
        Left = 523
        Top = 37
        Action = aAddWHouse
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        Anchors = [akTop, akRight]
        ButtonType = ssbtStandard
        Checked = False
        GroupIndex = 0
        ImageIndex = 50
        Images = dmData.Images
        LeftMargin = 4
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
      end
      object lWhouse: TLabel
        Left = 17
        Top = 44
        Width = 35
        Height = 16
        Caption = #1057#1082#1083#1072#1076
      end
      object cbWHouse: TssDBLookupCombo
        Left = 103
        Top = 38
        Width = 419
        Height = 24
        Anchors = [akLeft, akTop, akRight]
        ImeName = 'Russian'
        ParentFont = False
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
      object edFindMat: TokMatSearchEdit
        Left = 17
        Top = 5
        Width = 591
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
        TabOrder = 0
        OnChange = edFindMatChange
        OnRefButtonClick = aAddMatExecute
        AllowZeroRest = True
        LoadNDS = True
        LoadTaxes = True
        ScannerImageIndex = 50
        DesignSize = (
          591
          31)
      end
    end
    object panPrice: TPanel
      Tag = 1
      Left = 0
      Top = 75
      Width = 624
      Height = 108
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      DesignSize = (
        624
        108)
      object ssBevel2: TssBevel
        Left = 4
        Top = -1
        Width = 615
        Height = 109
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
        Top = 16
        Width = 40
        Height = 16
        Caption = #1050#1086#1083'-'#1074#1086
      end
      object lPrice: TLabel
        Left = 17
        Top = 46
        Width = 69
        Height = 16
        Caption = #1062#1077#1085#1072' '#1089' '#1053#1044#1057
      end
      object stMeasureName: TssBevel
        Left = 287
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
      object stCurrShortName: TssBevel
        Left = 287
        Top = 40
        Width = 50
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
      object stCurrShortNameOutNDS: TssBevel
        Left = 287
        Top = 69
        Width = 50
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
      object lPriceNoNDS: TssLabel
        Left = 17
        Top = 75
        Width = 49
        Height = 16
        Caption = #1073#1077#1079' '#1053#1044#1057
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object lRemain: TLabel
        Left = 369
        Top = 15
        Width = 117
        Height = 16
        Anchors = [akTop, akRight]
        Caption = #1044#1086#1089#1090#1091#1087#1085#1086' '#1080#1079' '#1087#1072#1088#1090#1080#1080
      end
      object stRemain: TssBevel
        Left = 522
        Top = 14
        Width = 88
        Height = 19
        Alignments.Horz = taRightJustify
        Anchors = [akTop, akRight]
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
      object sbPartysSelect: TssSpeedButton
        Left = 257
        Top = 10
        Action = aPartysSelect
        Alignment = taCenter
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        DisabledImages = dmData.Images18x18dis
        GroupIndex = 0
        ImageIndex = 43
        Images = dmData.Images18x18
        LeftMargin = 4
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
      end
      object lDisclaimer: TLabel
        Left = 345
        Top = 43
        Width = 262
        Height = 52
        Alignment = taRightJustify
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'lDisclaimer'
        WordWrap = True
      end
      object edPrice: TssCalcEdit
        Left = 159
        Top = 39
        Width = 127
        Height = 24
        EditValue = 0.000000000000000000
        Enabled = False
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
      object edAmount: TssCalcEdit
        Left = 159
        Top = 10
        Width = 98
        Height = 24
        EditValue = 0.000000000000000000
        ImeName = 'Russian'
        ParentFont = False
        Properties.OnChange = edAmountPropertiesChange
        Style.StyleController = dmData.scMain
        TabOrder = 0
        OnKeyDown = GoNextKeyDown
        OnKeyPress = edAmountKeyPress
        CalcColor = clBtnFace
        DecimalPlaces = 3
      end
      object edPriceNoNDS: TssCalcEdit
        Left = 159
        Top = 69
        Width = 127
        Height = 24
        EditValue = 0.000000000000000000
        Enabled = False
        ImeName = 'Russian'
        ParentFont = False
        Properties.OnChange = edPriceNondsPropertiesChange
        Properties.OnEditValueChanged = edPriceNoNDSPropertiesEditValueChanged
        Style.StyleController = dmData.scMain
        TabOrder = 2
        OnKeyDown = GoNextKeyDown
        OnKeyPress = edPriceKeyPress
        CalcColor = clBtnFace
        DecimalPlaces = 6
      end
    end
    object panSummary: TPanel
      Left = 0
      Top = 230
      Width = 624
      Height = 105
      Align = alClient
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 3
      DesignSize = (
        624
        105)
      object bvlSummary: TssBevel
        Left = 4
        Top = -1
        Width = 615
        Height = 106
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
        Transparent = True
      end
      object lAmountEx: TLabel
        Left = 129
        Top = 12
        Width = 73
        Height = 16
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
        Transparent = True
      end
      object stAmountEx: TssBevel
        Left = 320
        Top = 9
        Width = 239
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
        Left = 561
        Top = 9
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
        Font.Style = []
        GradientDirection = gdVertical
        HotTrack = False
        ImageIndex = 0
        UseGradient = True
      end
      object lSummWONDS: TLabel
        Left = 129
        Top = 36
        Width = 95
        Height = 16
        Caption = #1057#1091#1084#1084#1072' '#1073#1077#1079' '#1053#1044#1057':'
        Transparent = True
      end
      object stSumm: TssBevel
        Left = 320
        Top = 31
        Width = 239
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
        Left = 561
        Top = 31
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
        Font.Style = []
        GradientDirection = gdVertical
        HotTrack = False
        ImageIndex = 0
        UseGradient = True
      end
      object lNDS: TssLabel
        Left = 129
        Top = 59
        Width = 60
        Height = 16
        Caption = #1053#1044#1057' 18%:'
        Transparent = True
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object stSummNDS: TssBevel
        Left = 320
        Top = 53
        Width = 239
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
        Left = 561
        Top = 53
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
        Font.Style = []
        GradientDirection = gdVertical
        HotTrack = False
        ImageIndex = 0
        UseGradient = True
      end
      object lSummWithNDS: TssLabel
        Left = 129
        Top = 80
        Width = 81
        Height = 16
        Caption = #1057#1091#1084#1084#1072' '#1089' '#1053#1044#1057':'
        Transparent = True
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object stSummWithNDS: TssBevel
        Left = 320
        Top = 75
        Width = 239
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
        Left = 561
        Top = 75
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
        Font.Style = []
        GradientDirection = gdVertical
        HotTrack = False
        ImageIndex = 0
        UseGradient = True
      end
    end
    object panSN: TPanel
      Left = 0
      Top = 183
      Width = 624
      Height = 47
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 2
      DesignSize = (
        624
        47)
      object bvlSN: TssBevel
        Left = 4
        Top = -2
        Width = 615
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
        Anchors = [akLeft, akTop, akRight]
        ParentFont = False
        Properties.Buttons = <
          item
            Default = True
            Kind = bkEllipsis
          end>
        Properties.ClickKey = 16429
        Properties.ReadOnly = False
        Style.StyleController = dmData.scMain
        TabOrder = 0
        OnKeyDown = GoNextKeyDown
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
    Top = 382
    Width = 624
    Height = 38
    inherited btnOK: TxButton
      Left = 314
      Top = 4
      Height = 24
    end
    inherited btnCancel: TxButton
      Left = 417
      Top = 4
      Width = 97
      Height = 24
    end
    inherited btnApply: TxButton
      Left = 521
      Top = 4
      Height = 24
    end
  end
  inherited panToolBar: TPanel
    Width = 624
    inherited btnLock: TssSpeedButton
      Left = 537
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 564
    end
    inherited btnHelp: TssSpeedButton
      Left = 591
    end
    object btnMC: TssSpeedButton
      Left = 85
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
      Left = 58
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
      Left = 4
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
    object btnSetPanels: TssSpeedButton
      Left = 510
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
    Left = 44
    Top = 80
  end
  inherited FormStorage: TssFormStorage
    StoredProps.Strings = (
      'panSN.Visible'
      'panSummary.Visible')
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
    object aSetPanels: TAction
      Caption = 'aSetPanels'
      ImageIndex = 40
      OnExecute = aSetPanelsExecute
    end
    object aPartysSelect: TAction
      Caption = 'aPartysSelect'
      ImageIndex = 43
      OnExecute = aPartysSelectExecute
    end
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
    Left = 250
    Top = 66
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
    Left = 114
    Top = 74
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
    Left = 120
    Top = 23
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
      DisplayFormat = ',0.####'
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
    object mdPositionwhname: TStringField
      FieldName = 'whname'
      Size = 64
    end
    object mdPositiondocnumtxt: TStringField
      FieldKind = fkCalculated
      FieldName = 'docnumtxt'
      Size = 128
      Calculated = True
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
    object mdPositionsourceid: TIntegerField
      FieldName = 'sourceid'
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
    object mdPositioncertdate: TDateField
      FieldName = 'certdate'
    end
    object mdPositioncardid: TIntegerField
      FieldName = 'cardid'
    end
  end
  object dsmdPosition: TDataSource
    DataSet = mdPosition
    Left = 150
    Top = 23
  end
end
