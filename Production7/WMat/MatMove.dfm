inherited frmMatMove: TfrmMatMove
  Left = 351
  Top = 217
  Width = 950
  Height = 497
  ActiveControl = grdMain
  Caption = 'frmMatMove'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 950
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 934
    Height = 377
    DesignSize = (
      934
      377)
    object ssBevel4: TssBevel
      Left = 0
      Top = 0
      Width = 934
      Height = 38
      Align = alTop
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
    object lKAgentF: TLabel
      Left = 325
      Top = 11
      Width = 66
      Height = 16
      Alignment = taRightJustify
      Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
    end
    object btnKagent: TssSpeedButton
      Left = 608
      Top = 8
      Width = 20
      Height = 20
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 18
      Images = dmData.Images
      LeftMargin = 1
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnKagentClick
    end
    object lDocType: TLabel
      Left = 640
      Top = 11
      Width = 94
      Height = 16
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
    end
    object grdMain: TssDBGrid
      Left = 0
      Top = 38
      Width = 934
      Height = 258
      DrawDragFrame = False
      Bands = <
        item
          Caption = #1044#1086#1082#1091#1084#1077#1085#1090
        end
        item
          Caption = #1058#1086#1074#1072#1088
        end
        item
          Caption = #1062#1077#1085#1072
        end>
      DefaultLayout = False
      HeaderPanelRowCount = 1
      KeyField = 'POSID'
      SummaryGroups = <>
      SummarySeparator = ', '
      Align = alClient
      ParentShowHint = False
      PopupMenu = pmMain
      ShowHint = True
      TabOrder = 3
      OnDblClick = grdMainDblClick
      DataSource = srcView
      Filter.Criteria = {00000000}
      FixedBandLineColor = clBtnFace
      GroupPanelColor = clBtnFace
      LookAndFeel = lfUltraFlat
      OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEnterShowEditor, edgoImmediateEditor, edgoStoreToRegistry, edgoTabThrough, edgoVertThrough]
      OptionsCustomize = [edgoBandSizing, edgoColumnMoving, edgoColumnSizing]
      OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
      OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
      ShowBands = True
      OnCustomDrawCell = grdMainCustomDrawCell
      LangManager = dmData.Lng
      OnNeedAdjust = grdMainNeedAdjust
      OnGetOptionsTitle = grdMainGetOptionsTitle
      object colID: TdxDBGridColumn
        Visible = False
        Width = 49
        BandIndex = 0
        RowIndex = 0
        FieldName = 'POSID'
      end
      object colDocType: TdxDBGridImageColumn
        Alignment = taCenter
        Caption = '*'
        HeaderAlignment = taCenter
        MinWidth = 16
        Width = 25
        BandIndex = 0
        RowIndex = 0
        FieldName = 'WTYPE'
        Images = dmData.Images
        ImageIndexes.Strings = (
          '0'
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11'
          '12'
          '13'
          '14'
          '15'
          '16'
          '17'
          '18'
          '19'
          '20'
          '21'
          '22'
          '23'
          '24'
          '25'
          '26'
          '27'
          '28'
          '29'
          '30'
          '31'
          '32'
          '33'
          '34'
          '35'
          '36'
          '37'
          '38'
          '39'
          '40'
          '41'
          '42'
          '43'
          '44'
          '45'
          '46'
          '47'
          '48'
          '49'
          '50'
          '51'
          '52'
          '53'
          '54'
          '55'
          '56'
          '57'
          '58'
          '59'
          '60'
          '61'
          '62'
          '63'
          '64'
          '65'
          '66'
          '67'
          '68'
          '69'
          '70'
          '71'
          '72'
          '73'
          '74'
          '75'
          '76'
          '77'
          '78'
          '79'
          '80'
          '81'
          '82'
          '83'
          '84'
          '85'
          '86'
          '87'
          '88'
          '89'
          '90'
          '91'
          '92'
          '93'
          '94'
          '95'
          '96'
          '97'
          '98'
          '99'
          '100'
          '101'
          '102'
          '103'
          '104'
          '105'
          '106'
          '107'
          '108'
          '109'
          '110'
          '111'
          '112'
          '113'
          '114'
          '115'
          '116'
          '117'
          '118'
          '119'
          '120'
          '121'
          '122'
          '123'
          '124'
          '125'
          '126'
          '127'
          '128'
          '129'
          '130'
          '131'
          '132'
          '133'
          '134'
          '135'
          '136'
          '137'
          '138'
          '139'
          '140'
          '141'
          '142'
          '143'
          '144'
          '145'
          '146'
          '147'
          '148'
          '149'
          '150'
          '151'
          '152'
          '153'
          '154'
          '155'
          '156'
          '157'
          '158'
          '159'
          '160'
          '161'
          '162'
          '163')
        Values.Strings = (
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          '1'
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          '-1'
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          '4'
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          '-5'
          ''
          '6'
          '-6'
          ''
          ''
          ''
          ''
          '5')
      end
      object colType: TdxDBGridColumn
        Alignment = taCenter
        Width = 30
        BandIndex = 0
        RowIndex = 0
        OnCustomDrawCell = colTypeCustomDrawCell
        OnGetText = colTypeGetText
      end
      object colNum: TdxDBGridColumn
        Tag = 1
        Alignment = taRightJustify
        Caption = #1053#1086#1084#1077#1088
        HeaderAlignment = taCenter
        Sorted = csUp
        TabStop = False
        Width = 94
        BandIndex = 0
        RowIndex = 0
        FieldName = 'NUM'
      end
      object colOnDate: TdxDBGridColumn
        Tag = 1
        Alignment = taCenter
        Caption = #1044#1072#1090#1072
        HeaderAlignment = taCenter
        Width = 98
        BandIndex = 0
        RowIndex = 0
        FieldName = 'ONDATE'
      end
      object colKAgent: TdxDBGridColumn
        Tag = 1
        HeaderAlignment = taCenter
        Width = 170
        BandIndex = 0
        RowIndex = 0
        FieldName = 'kagentname'
      end
      object colAmount: TdxDBGridColumn
        Tag = 1
        Caption = #1050#1086#1083'-'#1074#1086
        HeaderAlignment = taCenter
        Width = 81
        BandIndex = 1
        RowIndex = 0
        FieldName = 'AMOUNT'
        OnGetText = colAmountGetText
      end
      object colPrice: TdxDBGridColumn
        Tag = 1
        Alignment = taRightJustify
        Caption = #1042' '#1091#1095#1105#1090'. '#1074#1072#1083#1102#1090#1077
        HeaderAlignment = taCenter
        Width = 69
        BandIndex = 2
        RowIndex = 0
        FieldName = 'PRICE'
        OnGetText = colPriceGetText
      end
      object colCurrency: TdxDBGridColumn
        Tag = 1
        Caption = #1042#1072#1083#1102#1090#1072
        HeaderAlignment = taCenter
        Width = 40
        BandIndex = 2
        RowIndex = 0
        FieldName = 'SHORTNAME'
      end
      object colRate: TdxDBGridColumn
        Tag = 1
        Caption = #1050#1091#1088#1089
        HeaderAlignment = taCenter
        Visible = False
        Width = 50
        BandIndex = 2
        RowIndex = 0
        FieldName = 'ONVALUE'
      end
      object colNPrice: TdxDBGridColumn
        Tag = 1
        Alignment = taRightJustify
        Caption = #1042' '#1085#1072#1094'. '#1074#1072#1083#1102#1090#1077
        Visible = False
        Width = 73
        BandIndex = 2
        RowIndex = 0
        OnGetText = colNPriceGetText
      end
      object colNCurrency: TdxDBGridColumn
        Tag = 1
        Caption = #1042#1072#1083#1102#1090#1072
        HeaderAlignment = taCenter
        Visible = False
        Width = 36
        BandIndex = 2
        RowIndex = 0
        OnGetText = colNCurrencyGetText
      end
      object colWHouse: TdxDBGridColumn
        Tag = 1
        Caption = #1057#1082#1083#1072#1076
        HeaderAlignment = taCenter
        Width = 105
        BandIndex = 1
        RowIndex = 0
        FieldName = 'FROMWH'
        OnGetText = colWHouseGetText
      end
      object colToWH: TdxDBGridColumn
        Visible = False
        Width = 62
        BandIndex = 0
        RowIndex = 0
        FieldName = 'ToWH'
      end
      object colFromWID: TdxDBGridColumn
        Visible = False
        Width = 101
        BandIndex = 0
        RowIndex = 0
        FieldName = 'FROMWID'
      end
      object colToWID: TdxDBGridColumn
        Visible = False
        Width = 74
        BandIndex = 0
        RowIndex = 0
        FieldName = 'TOWID'
      end
      object colRemain: TdxDBGridColumn
        Tag = 1
        HeaderAlignment = taCenter
        Width = 42
        BandIndex = 1
        RowIndex = 0
        FieldName = 'remain'
        OnGetText = colAmountGetText
      end
    end
    object lcbKAgent: TssDBLookupCombo
      Left = 402
      Top = 6
      Width = 199
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      ImeName = 'Russian'
      ParentFont = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.OnChange = lcbKAgentPropertiesChange
      Properties.OnEditValueChanged = edFromDatePropertiesEditValueChanged
      Properties.OnInitPopup = lcbKAgentPropertiesInitPopup
      Style.StyleController = dmData.scMain
      TabOrder = 1
      EmptyValue = 0
      KeyField = 'kaid'
      ListField = 'name'
      ListSource = srcKAgent
    end
    object cbDocType: TcxComboBox
      Left = 752
      Top = 6
      Width = 177
      Height = 24
      Anchors = [akTop, akRight]
      ImeName = 'Russian'
      ParentFont = False
      Properties.OnEditValueChanged = edFromDatePropertiesEditValueChanged
      Style.StyleController = dmData.scMain
      TabOrder = 2
    end
    object prdMain: TokPeriod
      Left = 12
      Top = 6
      Width = 285
      Height = 21
      AutoAlign = True
      CapType = 'Period:'
      CapMonth = 'Month:'
      CapYear = 'Year:'
      CapQuarter = 'Quarter:'
      CapFrom = 'From:'
      CapTo = 'to:'
      CapSelPeriod = 'Select Period'
      EditorsOffset = 12
      GoNextOnEnter = False
      PopupSkin = dmData.sknMain
      OnChange = edFromDatePropertiesEditValueChanged
      TabOrder = 0
      ViewType = vtShort
      LangManager = dmData.Lng
      DesignSize = (
        285
        21)
    end
    object panSummary: TPanel
      Left = 0
      Top = 296
      Width = 934
      Height = 81
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 4
      DesignSize = (
        934
        81)
      object ssBevel3: TssBevel
        Left = 0
        Top = 0
        Width = 934
        Height = 81
        Align = alTop
        ColorGrBegin = clBtnFace
        ColorGrEnd = clBtnFace
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = [beLeft, beRight, beTop, beBottom]
        GradientDirection = gdHorizontal
        HotTrack = False
        ImageIndex = 0
        UseGradient = False
        OnMouseEnter = ssBevel3MouseEnter
        OnMouseLeave = ssBevel3MouseLeave
      end
      object lKAgent: TLabel
        Left = 15
        Top = 9
        Width = 82
        Height = 16
        Caption = #1055#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082
      end
      object txtKAgent: TLabel
        Left = 128
        Top = 10
        Width = 278
        Height = 65
        Anchors = [akLeft, akTop, akRight, akBottom]
        AutoSize = False
        Caption = 'txtKAgent'
        WordWrap = True
      end
      object txtAmountIn: TssBevel
        Left = 521
        Top = 7
        Width = 160
        Height = 20
        Alignments.Horz = taRightJustify
        Anchors = [akTop, akRight]
        Caption = '999999,999 '#1096#1090'.'
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
        WordBreak = False
      end
      object txtTotalIn: TssBevel
        Left = 766
        Top = 7
        Width = 163
        Height = 20
        Alignments.Horz = taRightJustify
        Anchors = [akTop, akRight]
        Caption = '44444454,99 UAH'
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
        WordBreak = False
      end
      object txtAmountOut: TssBevel
        Left = 521
        Top = 31
        Width = 160
        Height = 19
        Alignments.Horz = taRightJustify
        Anchors = [akTop, akRight]
        Caption = '999999,999 '#1096#1090'.'
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
        WordBreak = False
      end
      object txtTotalOut: TssBevel
        Left = 766
        Top = 31
        Width = 163
        Height = 19
        Alignments.Horz = taRightJustify
        Anchors = [akTop, akRight]
        Caption = '44444454,99 UAH'
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
        WordBreak = False
      end
      object lAmountIn: TssLabel
        Left = 415
        Top = 9
        Width = 82
        Height = 16
        Anchors = [akTop, akRight]
        Caption = #1042#1089#1077#1075#1086' '#1087#1088#1080#1093#1086#1076':'
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object lAmountOut: TssLabel
        Left = 415
        Top = 32
        Width = 81
        Height = 16
        Anchors = [akTop, akRight]
        Caption = #1042#1089#1077#1075#1086' '#1088#1072#1089#1093#1086#1076':'
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object lTotalIn: TssLabel
        Left = 692
        Top = 9
        Width = 57
        Height = 16
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = #1085#1072' '#1089#1091#1084#1084#1091':'
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object lTotalOut: TssLabel
        Left = 692
        Top = 32
        Width = 57
        Height = 16
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = #1085#1072' '#1089#1091#1084#1084#1091':'
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object bvlFooterSep: TssBevel
        Left = 403
        Top = -2
        Width = 1
        Height = 83
        Anchors = [akTop, akRight]
        ColorGrBegin = clBtnFace
        ColorGrEnd = clBtnFace
        ColorInner = clBtnShadow
        ColorOuter = clBtnHighlight
        Edges = [beLeft, beRight, beBottom]
        GradientDirection = gdHorizontal
        HotTrack = False
        ImageIndex = 0
        Shape = bsLeftLine
        UseGradient = False
      end
      object lRemain: TssLabel
        Left = 415
        Top = 54
        Width = 52
        Height = 16
        Anchors = [akTop, akRight]
        Caption = #1054#1089#1090#1072#1090#1086#1082':'
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object txtRemain: TssBevel
        Left = 521
        Top = 54
        Width = 160
        Height = 20
        Alignments.Horz = taRightJustify
        Anchors = [akTop, akRight]
        Caption = '999999,999 '#1096#1090'.'
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
        WordBreak = False
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 934
    inherited panTitleButtons: TssPanel
      Left = 876
    end
  end
  inherited panButtons: TPanel
    Top = 424
    Width = 934
    inherited btnOK: TxButton
      Left = 626
    end
    inherited btnCancel: TxButton
      Left = 730
    end
    inherited btnApply: TxButton
      Left = 831
      Visible = False
    end
  end
  inherited panToolBar: TPanel
    Width = 934
    inherited btnLock: TssSpeedButton
      Left = 882
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 906
    end
    inherited btnHelp: TssSpeedButton
      Left = 858
    end
    object btnPrintDoc: TssSpeedButton
      Left = 24
      Top = 1
      Width = 20
      Height = 20
      Hint = #1044#1086#1082#1091#1084#1077#1085#1090
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090
      GroupIndex = 0
      ImageIndex = 68
      Images = dmData.Images
      LeftMargin = 1
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnPrintDocClick
    end
    object btnPrint: TssSpeedButton
      Left = 4
      Top = 1
      Width = 20
      Height = 20
      Hint = #1054#1090#1095#1105#1090' '#1086' '#1076#1074#1080#1078#1077#1085#1080#1080' '#1090#1086#1074#1072#1088#1072
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      Caption = #1055#1077#1095#1072#1090#1072#1090#1100
      GroupIndex = 0
      ImageIndex = 9
      Images = dmData.Images
      LeftMargin = 1
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnPrintClick
    end
    object btnLocate: TssSpeedButton
      Left = 44
      Top = 1
      Width = 20
      Height = 20
      Action = aLocate
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 168
      Images = dmData.Images
      LeftMargin = 1
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
  end
  inherited ilTitleBar: TImageList
    Left = 120
    Top = 156
  end
  inherited FormStorage: TssFormStorage
    Top = 140
  end
  inherited ActionList: TActionList
    Left = 148
    Top = 156
    object aPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1072#1090#1100
      ImageIndex = 9
      OnExecute = aPrintExecute
    end
    object aPrintMain: TAction
      Caption = #1054#1090#1095#1105#1090' '#1086' '#1076#1074#1080#1078#1077#1085#1080#1080' '#1090#1086#1074#1072#1088#1072
      Hint = #1054#1090#1095#1105#1090' '#1086' '#1076#1074#1080#1078#1077#1085#1080#1080' '#1090#1086#1074#1072#1088#1072
      OnExecute = aPrintMainExecute
    end
    object aPrintDoc: TAction
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090
      OnExecute = aPrintDocExecute
    end
    object aColOptions: TAction
      Caption = 'aColOptions'
      OnExecute = aColOptionsExecute
    end
    object aLocate: TAction
      Caption = 'aLocate'
      ImageIndex = 168
      OnExecute = aLocateExecute
    end
  end
  object cdsView: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'matid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fromdate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'todate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'wid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'kaid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'wtype'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'wh'
        ParamType = ptUnknown
      end>
    ProviderName = 'pWMat_GetMoveEx'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsViewBeforeOpen
    AfterOpen = cdsViewAfterOpen
    Macros = <
      item
        DataType = ftString
        Name = 'm'
        ParamType = ptUnknown
      end>
    Left = 44
    Top = 156
  end
  object srcView: TDataSource
    DataSet = cdsView
    OnDataChange = srcViewDataChange
    Left = 72
    Top = 156
  end
  object cdsKAgent: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'p_KAgentList'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 380
    Top = 137
  end
  object srcKAgent: TDataSource
    DataSet = cdsKAgent
    Left = 352
    Top = 137
  end
  object frDoc: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frDocGetValue
    Left = 184
    Top = 157
    ReportForm = {19000000}
  end
  object fdsView: TfrDBDataSet
    DataSource = srcView
    Left = 72
    Top = 184
  end
  object pmMain: TTBPopupMenu
    Images = dmData.Images
    Left = 232
    Top = 157
    object TBItem3: TTBItem
      Action = aLocate
      Images = dmData.Images
    end
    object TBSeparatorItem1: TTBSeparatorItem
    end
    object TBItem5: TTBItem
      Action = aPrintMain
      ImageIndex = 9
    end
    object TBItem1: TTBItem
      Action = aPrintDoc
      ImageIndex = 9
    end
    object TBSeparatorItem2: TTBSeparatorItem
    end
    object TBItem2: TTBItem
      Action = aColOptions
    end
  end
  object mdReport: TdxMemData
    Indexes = <>
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
    SortOptions = []
    Left = 266
    Top = 157
    object mdReportdocnum: TStringField
      FieldName = 'docnum'
      Size = 15
    end
    object mdReportDocDate: TDateField
      FieldName = 'DocDate'
    end
    object mdReportKAFullName: TStringField
      FieldName = 'KAFullName'
      Size = 255
    end
    object mdReportEntName: TStringField
      FieldName = 'EntName'
      Size = 255
    end
    object mdReportReason: TStringField
      FieldName = 'Reason'
      Size = 255
    end
    object mdReportPerson: TStringField
      FieldName = 'Person'
      Size = 64
    end
    object mdReportPosNo: TIntegerField
      FieldName = 'PosNo'
    end
    object mdReportMatName: TStringField
      FieldName = 'PosMatName'
      Size = 128
    end
    object mdReportMsrName: TStringField
      FieldName = 'PosMsrName'
      Size = 6
    end
    object mdReportPosAmount: TFloatField
      FieldName = 'PosAmount'
    end
    object mdReportPosPrice: TFloatField
      FieldName = 'PosPrice'
    end
    object mdReportPosSumm: TStringField
      FieldName = 'PosSumm'
    end
    object mdReportAllSummNDSOut: TStringField
      FieldName = 'AllSummNDSOut'
      Size = 64
    end
    object mdReportAllSummNDS: TStringField
      FieldName = 'AllSummNDS'
      Size = 64
    end
    object mdReportAllSumm: TStringField
      FieldName = 'AllSumm'
      Size = 64
    end
    object mdReportPropis: TStringField
      DisplayWidth = 255
      FieldName = 'Propis'
      Size = 1024
    end
    object mdReportCurNDS: TFloatField
      FieldName = 'CurNDS'
    end
  end
  object fdsReport: TfrDBDataSet
    DataSet = mdReport
    Left = 266
    Top = 185
  end
end
