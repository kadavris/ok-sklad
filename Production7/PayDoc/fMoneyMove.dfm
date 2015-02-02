inherited fmMoneyMove: TfmMoneyMove
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 98
    Width = 435
    Height = 4
    Cursor = crVSplit
    Align = alBottom
  end
  object pcMain: TcxPageControl [1]
    Left = 0
    Top = 102
    Width = 435
    Height = 164
    ActivePage = PageInfo
    Align = alBottom
    Images = dmData.Images
    TabOrder = 0
    object PageInfo: TcxTabSheet
      ImageIndex = 117
      object ssBevel10: TssBevel
        Left = 0
        Top = 1
        Width = 1
        Height = 138
        Align = alLeft
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
      object ssBevel19: TssBevel
        Left = 0
        Top = 0
        Width = 435
        Height = 1
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
      object ssBevel21: TssBevel
        Left = 0
        Top = 139
        Width = 435
        Height = 1
        Align = alBottom
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
      object ssBevel22: TssBevel
        Left = 434
        Top = 1
        Width = 1
        Height = 138
        Align = alRight
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
      object inspMain: TdxInspector
        Left = 1
        Top = 1
        Width = 433
        Height = 138
        Align = alClient
        BorderStyle = bsNone
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        DividerPos = 151
        GridColor = clBtnFace
        Flat = True
        MaxRowTextLineCount = 0
        Options = [ioAutoWidth, ioBandSizing, ioColumnSizing, ioDynamicColumnSizing, ioEditing, ioRowAutoHeight, ioStoreToRegistry]
        PaintStyle = ipsSimple
        OnDrawCaption = inspMainDrawCaption
        OnDrawValue = inspMainDrawValue
        Data = {
          C10000000600000008000000000000000500000069724E756D08000000000000
          0006000000697254797065080000000100000006000000697246726F6D080000
          00000000000A000000697246726F6D53756D6D08000000010000000400000069
          72546F0800000000000000080000006972546F53756D6D080000000000000008
          00000069725374617475730800000000000000080000006972526561736F6E02
          000000080000000000000006000000697246726F6D0800000000000000040000
          006972546F}
        object irNum: TdxInspectorTextRow
          Caption = #8470
          ReadOnly = True
        end
        object irFromSumm: TdxInspectorTextRow
          Caption = #1057#1087#1080#1089#1072#1085#1086
          ImageIndex = 2
          ReadOnly = True
        end
        object irReason: TdxInspectorTextRow
          Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
          ReadOnly = True
        end
        object irStatus: TdxInspectorTextRow
          Caption = #1057#1090#1072#1090#1091#1089' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          ReadOnly = True
        end
        object irType: TdxInspectorTextRow
          Caption = #1058#1080#1087' '#1086#1087#1077#1088#1072#1094#1080#1080
          ReadOnly = True
        end
        object irFrom: TdxInspectorTextRow
          Caption = #1054#1090#1082#1091#1076#1072
          ReadOnly = True
        end
        object irTo: TdxInspectorTextRow
          Caption = #1050#1091#1076#1072
          ReadOnly = True
        end
        object irToSumm: TdxInspectorTextRow
          Caption = #1047#1072#1095#1080#1089#1083#1077#1085#1086
          ReadOnly = True
        end
        object irCharge: TdxInspectorTextRow
          Caption = #1056#1072#1089#1093#1086#1076#1099
          ReadOnly = True
          Visible = False
        end
      end
    end
    object tsNotes: TcxTabSheet
      Caption = 'tsNotes'
      ImageIndex = 4
      OnShow = tsNotesShow
      DesignSize = (
        435
        140)
      object ssBevel4: TssBevel
        Left = 0
        Top = 1
        Width = 1
        Height = 138
        Align = alLeft
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
      object ssBevel5: TssBevel
        Left = 0
        Top = 0
        Width = 435
        Height = 1
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
      object ssBevel6: TssBevel
        Left = 0
        Top = 139
        Width = 435
        Height = 1
        Align = alBottom
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
      object ssBevel7: TssBevel
        Left = 434
        Top = 1
        Width = 1
        Height = 138
        Align = alRight
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
      object memNotes: TcxMemo
        Left = 13
        Top = -1
        Width = 424
        Height = 126
        Anchors = [akLeft, akTop, akRight, akBottom]
        ImeName = 'Russian'
        ParentFont = False
        Properties.ReadOnly = True
        Style.BorderStyle = ebsNone
        Style.HotTrack = False
        Style.StyleController = dmData.scMain
        Style.TransparentBorder = True
        TabOrder = 0
      end
    end
    object tsDocRel: TcxTabSheet
      Caption = 'tsDocRel'
      ImageIndex = 158
      TabVisible = False
      object grdDocRel: TssDBGrid
        Left = 0
        Top = 0
        Width = 443
        Height = 140
        Hint = 'NUM'
        DrawDragFrame = False
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'WBILLID'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        ParentShowHint = False
        PopupMenu = pmDocRel
        ShowHint = True
        TabOrder = 0
        OnDblClick = grdDocRelDblClick
        DataSource = srcRel
        Filter.Criteria = {00000000}
        LookAndFeel = lfUltraFlat
        OptionsCustomize = [edgoBandMoving, edgoBandSizing, edgoColumnSizing]
        OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoRowSelect, edgoUseBitmap]
        object colDRType: TdxDBGridImageColumn
          Alignment = taLeftJustify
          HeaderAlignment = taCenter
          MinWidth = 16
          Sizing = False
          Width = 25
          BandIndex = 0
          RowIndex = 0
          FieldName = 'wtype'
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
            '159')
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
            '100'
            '-100'
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
            '2'
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
            '5'
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
            '7')
        end
        object colDRNum: TdxDBGridColumn
          Alignment = taRightJustify
          HeaderAlignment = taCenter
          Sizing = False
          Width = 90
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NUM'
        end
        object colDROnDate: TdxDBGridColumn
          Alignment = taCenter
          HeaderAlignment = taCenter
          Sorted = csUp
          Width = 90
          BandIndex = 0
          RowIndex = 0
          FieldName = 'ONDATE'
          OnGetText = colDROnDateGetText
        end
        object colDRTypeName: TdxDBGridColumn
          HeaderAlignment = taCenter
          Sizing = False
          Width = 217
          BandIndex = 0
          RowIndex = 0
          OnGetText = colDRTypeNameGetText
        end
        object colDRSummAll: TdxDBGridCurrencyColumn
          HeaderAlignment = taCenter
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMMALL'
          DisplayFormat = ',0.00'
          Nullable = False
        end
        object colDRID: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'WBILLID'
        end
      end
    end
  end
  object panMain: TPanel [2]
    Left = 0
    Top = 0
    Width = 435
    Height = 98
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object panFooter: TPanel
      Left = 0
      Top = 68
      Width = 435
      Height = 30
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      Visible = False
      DesignSize = (
        435
        30)
      object ssBevel1: TssBevel
        Left = 0
        Top = 0
        Width = 435
        Height = 30
        Align = alClient
        ColorGrBegin = clBtnFace
        ColorGrEnd = clBtnFace
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = [beLeft, beRight, beBottom]
        GradientDirection = gdHorizontal
        HotTrack = False
        ImageIndex = 0
        Style = bsSingle
        UseGradient = False
      end
      object lTotal: TLabel
        Left = 400
        Top = 8
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = #1053#1072' '#1089#1091#1084#1084#1091
      end
      object lCount: TLabel
        Left = 643
        Top = 8
        Width = 93
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = #1042#1089#1077#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      end
      object stCount: TssBevel
        Left = 747
        Top = 7
        Width = 74
        Height = 16
        Alignments.Horz = taRightJustify
        Anchors = [akTop, akRight]
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
        WordBreak = False
      end
      object stTotal: TssBevel
        Left = 464
        Top = 7
        Width = 136
        Height = 16
        Alignments.Horz = taRightJustify
        Anchors = [akTop, akRight]
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
        WordBreak = False
      end
    end
    object panGrid: TPanel
      Left = 0
      Top = 0
      Width = 435
      Height = 68
      Align = alClient
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      object ssBevel8: TssBevel
        Left = 434
        Top = 30
        Width = 1
        Height = 37
        Align = alRight
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
      object ssBevel9: TssBevel
        Left = 0
        Top = 29
        Width = 435
        Height = 1
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
      object ssBevel3: TssBevel
        Left = 0
        Top = 30
        Width = 1
        Height = 37
        Align = alLeft
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
      object ssBevel12: TssBevel
        Left = 0
        Top = 67
        Width = 435
        Height = 1
        Align = alBottom
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
      object grdMain: TssDBGrid
        Left = 1
        Top = 30
        Width = 433
        Height = 37
        DrawDragFrame = False
        Bands = <
          item
            Caption = #1044#1086#1082#1091#1084#1077#1085#1090
          end
          item
            Caption = #1054#1090#1082#1091#1076#1072
          end
          item
            Caption = #1050#1091#1076#1072
          end>
        DefaultLayout = False
        HeaderPanelRowCount = 1
        KeyField = 'PAYDOCID'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        BorderStyle = bsNone
        ParentShowHint = False
        PopupMenu = pmMain
        ShowHint = True
        TabOrder = 0
        OnDblClick = grdMainDblClick
        DataSource = srcView
        Filter.Criteria = {00000000}
        HideFocusRect = True
        HideSelectionColor = 10724259
        HighlightColor = clNavy
        LookAndFeel = lfUltraFlat
        OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoStoreToRegistry, edgoTabThrough, edgoVertThrough]
        OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoRowSelect, edgoUseBitmap]
        ShowBands = True
        OnCustomDrawCell = grdMainCustomDrawCell
        OnSelectedCountChange = grdMainSelectedCountChange
        LangManager = dmData.Lng
        OnNeedAdjust = grdMainNeedAdjust
        OnGetOptionsTitle = grdMainGetOptionsTitle
        object colID: TdxDBGridColumn
          Visible = False
          Width = 95
          BandIndex = 0
          RowIndex = 0
          FieldName = 'OPERID'
        end
        object colDocType: TdxDBGridImageColumn
          Alignment = taLeftJustify
          MinWidth = 16
          Sizing = False
          Width = 25
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DOCTYPE'
          OnGetText = colDocTypeGetText
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
            '163'
            '164'
            '165'
            '166'
            '167'
            '168'
            '169'
            '170'
            '171'
            '172'
            '173'
            '174'
            '175'
            '176'
            '177'
            '178'
            '179'
            '180'
            '181'
            '182'
            '183'
            '184'
            '185'
            '186'
            '187'
            '188'
            '189'
            '190'
            '191'
            '192'
            '193'
            '194'
            '195')
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
            '-2'
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
            '-3'
            '-4'
            '-5'
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
            '-6'
            '6')
        end
        object colChecked: TdxDBGridImageColumn
          Alignment = taLeftJustify
          MinWidth = 16
          Sizing = False
          Width = 24
          BandIndex = 0
          RowIndex = 0
          FieldName = 'CHECKED'
          OnGetText = colCheckedGetText
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
            '64')
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
            '1'
            '0')
        end
        object colNum: TdxDBGridColumn
          Tag = 2
          Alignment = taRightJustify
          Caption = #1053#1086#1084#1077#1088
          HeaderAlignment = taCenter
          Width = 78
          BandIndex = 0
          RowIndex = 0
          FieldName = 'docnum'
          OnGetText = colNumGetText
        end
        object colOnDate: TdxDBGridColumn
          Tag = 1
          Alignment = taCenter
          Caption = #1044#1072#1090#1072
          HeaderAlignment = taCenter
          Width = 78
          BandIndex = 0
          RowIndex = 0
          FieldName = 'ONDATE'
          OnGetText = colOnDateGetText
        end
        object colOperType: TdxDBGridColumn
          Tag = 1
          Alignment = taLeftJustify
          Caption = #1058#1080#1087' '#1086#1087#1077#1088#1072#1094#1080#1080
          HeaderAlignment = taCenter
          Sorted = csDown
          Width = 84
          BandIndex = 0
          RowIndex = 0
          FieldName = 'doctype'
          OnGetText = colOperTypeGetText
        end
        object colFrom: TdxDBGridColumn
          Tag = 1
          Caption = #1048#1079' '#1082#1072#1089#1089#1099' ('#1089#1086' '#1089#1095#1105#1090#1072')'
          Width = 61
          BandIndex = 1
          RowIndex = 0
          OnGetText = colFromGetText
        end
        object colTotal: TdxDBGridColumn
          Tag = 1
          Alignment = taRightJustify
          Caption = #1057#1091#1084#1084#1072
          HeaderAlignment = taCenter
          Width = 61
          BandIndex = 1
          RowIndex = 0
          FieldName = 'total'
          OnGetText = colTotalGetText
        end
        object colShortName: TdxDBGridColumn
          Caption = #1042#1072#1083#1102#1090#1072
          HeaderAlignment = taCenter
          Visible = False
          Width = 34
          BandIndex = 1
          RowIndex = 0
          FieldName = 'shortname'
        end
        object colRate: TdxDBGridColumn
          Caption = #1050#1091#1088#1089
          HeaderAlignment = taCenter
          Visible = False
          Width = 34
          BandIndex = 1
          RowIndex = 0
        end
        object colAcc: TdxDBGridColumn
          Caption = #1056'/'#1089
          HeaderAlignment = taCenter
          Visible = False
          Width = 38
          BandIndex = 1
          RowIndex = 0
          FieldName = 'accnumsrc'
          OnGetText = colAccGetText
        end
        object colCashName: TdxDBGridColumn
          Caption = #1050#1072#1089#1089#1072
          HeaderAlignment = taCenter
          Visible = False
          Width = 34
          BandIndex = 1
          RowIndex = 0
          FieldName = 'cashnamesrc'
        end
        object colTotalDest: TdxDBGridColumn
          Tag = 1
          Alignment = taRightJustify
          Caption = #1057#1091#1084#1084#1072
          HeaderAlignment = taCenter
          Width = 57
          BandIndex = 2
          RowIndex = 0
          FieldName = 'totaldest'
          OnGetText = colTotalDestGetText
        end
        object colTo: TdxDBGridColumn
          Tag = 1
          Caption = #1042' '#1082#1072#1089#1089#1091' ('#1085#1072' '#1089#1095#1105#1090')'
          HeaderAlignment = taCenter
          Width = 65
          BandIndex = 2
          RowIndex = 0
          OnGetText = colToGetText
        end
        object colAccDest: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'accnumdest'
        end
        object colCashNameDest: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'cashnamedest'
        end
        object colShortNameDest: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'shortnamedest'
        end
        object colCharge: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'totalcharge'
        end
        object colBankSrc: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'banksrc'
        end
        object colBankDest: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'bankdest'
        end
      end
      object panFilter: TPanel
        Left = 0
        Top = 0
        Width = 435
        Height = 29
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 1
        object bvlTop: TssBevel
          Left = 0
          Top = 0
          Width = 435
          Height = 1
          Align = alTop
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
        object lOperType: TLabel
          Left = 1
          Top = 9
          Width = 70
          Height = 13
          Alignment = taRightJustify
          Caption = #1058#1080#1087' '#1086#1087#1077#1088#1072#1094#1080#1080
        end
        object ssBevel2: TssBevel
          Left = 0
          Top = 1
          Width = 5
          Height = 28
          Align = alLeft
          ColorGrBegin = clBtnFace
          ColorGrEnd = clBtnFace
          ColorInner = clBtnShadow
          ColorOuter = clBtnShadow
          Edges = [beLeft, beRight, beTop, beBottom]
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Shape = bsLeftLine
          Style = bsSingle
          UseGradient = False
        end
        object bvlRight: TssBevel
          Left = 1
          Top = 1
          Width = 2
          Height = 28
          ColorGrBegin = clBtnFace
          ColorGrEnd = clBtnFace
          ColorInner = clBtnShadow
          ColorOuter = clBtnShadow
          Edges = [beLeft, beRight, beTop, beBottom]
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Shape = bsRightLine
          Style = bsSingle
          UseGradient = False
        end
        object lChargeType: TLabel
          Left = 266
          Top = 9
          Width = 85
          Height = 13
          Alignment = taRightJustify
          Caption = #1057#1090#1072#1090#1100#1103' '#1088#1072#1089#1093#1086#1076#1086#1074
          Visible = False
        end
        object btnChargeType: TssSpeedButton
          Left = 486
          Top = 5
          Width = 21
          Height = 21
          Alignment = taLeftJustify
          AllwaysShowFrame = False
          ButtonType = ssbtStandard
          Checked = False
          GroupIndex = 0
          ImageIndex = 149
          Images = dmData.Images
          LeftMargin = 2
          ParentShowHint = False
          ShowHint = True
          Style = ssbsUser
          ViewStyle = ssvsGlyphOnly
          Visible = False
          OnClick = btnChargeTypeClick
        end
        object lcbChargeType: TssDBLookupCombo
          Left = 371
          Top = 5
          Width = 112
          Height = 24
          ImeName = 'Russian'
          ParentFont = False
          Properties.DropDownListStyle = lsEditFixedList
          Properties.Items.Strings = (
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077)
          Properties.OnChange = lcbChargeTypePropertiesChange
          Properties.OnEditValueChanged = lcbKAgentPropertiesEditValueChanged
          Style.StyleController = dmData.scMain
          TabOrder = 0
          Text = #1042#1089#1077
          Visible = False
          DisplayEmpty = #1042#1089#1077
          EmptyValue = 0
          KeyField = 'ctypeid'
          ListField = 'name'
          ListSource = srcChargeType
        end
        object cbOperType: TcxComboBox
          Left = 520
          Top = 5
          Width = 93
          Height = 21
          ImeName = 'Russian'
          Properties.DropDownListStyle = lsFixedList
          Properties.OnEditValueChanged = cbOperTypePropertiesEditValueChanged
          TabOrder = 1
        end
        object prdMain: TokPeriod
          Left = 6
          Top = 5
          Width = 255
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
          OnChange = cbOperTypePropertiesEditValueChanged
          TabOrder = 2
          ViewType = vtShort
          LangManager = dmData.Lng
          DesignSize = (
            255
            21)
        end
      end
    end
  end
  inherited ActionList: TActionList
    Left = 60
    Top = 76
    object aPrintInOrder: TAction [10]
      Category = 'All'
    end
    object aPrintPayOrder: TAction [11]
      Category = 'All'
    end
    inherited aPrint: TAction
      Caption = '????????'
      ShortCut = 0
    end
    inherited aShowFilter: TAction
      Checked = True
    end
    object aGotoDoc: TAction
      Category = 'All'
      Caption = 'aGotoDoc'
      ImageIndex = 168
      OnExecute = aGotoDocExecute
    end
    object aDRPrint: TAction
      Category = 'All'
      Caption = 'aDRPrint'
      ImageIndex = 9
      OnExecute = aDRPrintExecute
    end
  end
  inherited pmMain: TTBPopupMenu
    Left = 32
    Top = 76
    object TBItem9: TTBItem [1]
      Action = aPatternInsert
    end
    object TBSeparatorItem3: TTBSeparatorItem [5]
    end
    object TBSubmenuItem1: TTBSubmenuItem [6]
      Action = aPrint
      object TBItem5: TTBItem
        Action = aPrintInOrder
      end
      object TBItem6: TTBItem
        Action = aPrintPayOrder
      end
    end
    object TBItem10: TTBItem [8]
      Action = aSelectAll
    end
    object TBSeparatorItem5: TTBSeparatorItem [9]
    end
    object TBItem8: TTBItem [10]
      Action = aCheck
    end
    object TBItem12: TTBItem [11]
      Action = aColParams
    end
    object TBItem7: TTBItem [12]
      Action = aShowFilter
    end
    object TBSeparatorItem4: TTBSeparatorItem [13]
    end
  end
  object srcView: TDataSource
    DataSet = cdsView
    OnDataChange = srcViewDataChange
    Left = 32
    Top = 104
  end
  object cdsView: TssClientDataSet
    Aggregates = <
      item
        Active = True
        AggregateName = 'aggCount'
        Expression = 'count(paydocid))'
        Visible = False
      end>
    Params = <
      item
        DataType = ftUnknown
        Name = 'fromdate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'todate'
        ParamType = ptUnknown
      end>
    ProviderName = 'pMoneyMove_List'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsViewBeforeOpen
    AfterOpen = cdsViewAfterOpen
    OnCalcFields = cdsViewCalcFields
    Macros = <
      item
        DataType = ftString
        Name = 'm'
        ParamType = ptUnknown
      end>
    Left = 60
    Top = 104
  end
  object cdsKAgent: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'p_KAgentList'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 352
    Top = 156
  end
  object srcKAgent: TDataSource
    DataSet = cdsKAgent
    Left = 324
    Top = 156
  end
  object cdsPayType: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'p_PayType_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 248
    Top = 112
  end
  object srcPayType: TDataSource
    DataSet = cdsPayType
    Left = 220
    Top = 112
  end
  object frDoc: TfrReport
    InitialZoom = pzDefault
    ModifyPrepared = False
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frDocGetValue
    Left = 92
    Top = 76
    ReportForm = {19000000}
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
    Left = 164
    Top = 132
  end
  object cdsChargeType: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pChargeType_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 296
    Top = 156
  end
  object srcChargeType: TDataSource
    DataSet = cdsChargeType
    Left = 268
    Top = 156
  end
  object cdsRel: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'paydocid'
        ParamType = ptUnknown
      end>
    ProviderName = 'pPayDoc_RelList'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsRelBeforeOpen
    AfterOpen = cdsRelAfterOpen
    Macros = <>
    Left = 184
    Top = 204
  end
  object srcRel: TDataSource
    DataSet = cdsRel
    Left = 212
    Top = 204
  end
  object pmDocRel: TTBPopupMenu
    Images = dmData.Images
    Left = 248
    Top = 204
    object mnuGotoDoc: TTBItem
      Action = aGotoDoc
    end
    object TBItem11: TTBItem
      Action = aDRPrint
    end
  end
end
