inherited fmPayDoc: TfmPayDoc
  object splMain: TSplitter [0]
    Left = 0
    Top = 101
    Width = 435
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object pcMain: TcxPageControl [1]
    Left = 0
    Top = 104
    Width = 435
    Height = 162
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
        Height = 136
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
        Top = 137
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
        Height = 136
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
        Height = 136
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
          380100000800000008000000000000000500000069724E756D08000000060000
          000800000069724B4167656E7408000000000000000C00000069724B4146756C
          6C4E616D6508000000000000000A00000069724B414164726573730800000000
          0000000900000069724B4150686F6E6508000000000000000500000069724661
          780800000000000000070000006972456D61696C080000000000000005000000
          6972575757080000000000000006000000697243757272080000000000000008
          0000006972537461747573080000000000000009000000697250617954797065
          08000000000000000C0000006972436861726765547970650800000000000000
          080000006972526561736F6E08000000000000000C00000069725061794D5065
          72736F6E0100000008000000000000000800000069724B4167656E74}
        object irNum: TdxInspectorTextRow
          Caption = #8470
          ReadOnly = True
        end
        object irKAPhone: TdxInspectorTextRow
          Caption = #1058#1077#1083#1077#1092#1086#1085
          ReadOnly = True
        end
        object irKAFullName: TdxInspectorTextMemoRow
          Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          ReadOnly = True
        end
        object irKAAdress: TdxInspectorTextMemoRow
          Caption = #1040#1076#1088#1077#1089
          ReadOnly = True
        end
        object irCurr: TdxInspectorTextRow
          Caption = #1057#1091#1084#1084#1072
          ImageIndex = 2
          ReadOnly = True
        end
        object irReason: TdxInspectorTextRow
          Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
          ReadOnly = True
        end
        object irPayMPerson: TdxInspectorTextRow
          Caption = #1063#1077#1088#1077#1079' '#1082#1086#1075#1086
          ImageIndex = 67
          ReadOnly = True
        end
        object irFax: TdxInspectorTextRow
          Caption = #1060#1072#1082#1089
          ReadOnly = True
        end
        object irEmail: TdxInspectorTextHyperLinkRow
          Caption = 'E-Mail'
          ImageIndex = 46
          ReadOnly = True
        end
        object irWWW: TdxInspectorTextHyperLinkRow
          Caption = 'Internet'
          ImageIndex = 45
          ReadOnly = True
        end
        object irStatus: TdxInspectorTextRow
          Caption = #1057#1090#1072#1090#1091#1089' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          ReadOnly = True
        end
        object irPayType: TdxInspectorTextRow
          Caption = #1058#1080#1087' '#1088#1072#1089#1095#1105#1090#1072
          ReadOnly = True
        end
        object irChargeType: TdxInspectorTextRow
          Caption = #1057#1090#1072#1090#1100#1103' '#1087#1088#1080#1093#1086#1076#1086#1074'/'#1088#1072#1089#1093#1086#1076#1086#1074
          ReadOnly = True
        end
        object irKAgent: TdxInspectorTextButtonRow
          Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
          ReadOnly = True
          OnEditButtonClick = irKAgentEditButtonClick
          Buttons = <
            item
              Default = True
              Kind = bkGlyph
            end>
          EditButtonStyle = ebsGlyph
        end
      end
    end
    object tsNotes: TcxTabSheet
      Caption = 'tsNotes'
      ImageIndex = 4
      OnShow = tsNotesShow
      DesignSize = (
        435
        138)
      object ssBevel4: TssBevel
        Left = 0
        Top = 1
        Width = 1
        Height = 136
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
        Top = 137
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
        Height = 136
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
        Width = 559
        Height = 124
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
      object grdDocRel: TssDBGrid
        Left = 0
        Top = 0
        Width = 964
        Height = 138
        Hint = 'NUM'
        DrawDragFrame = False
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'DOCID'
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
          FieldName = 'doctype'
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
            '195'
            '196'
            '197'
            '198'
            '199'
            '200'
            '201'
            '202'
            '203'
            '204'
            '205'
            '206')
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
            '8'
            '-8'
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
            '7'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            '-9'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            '16'
            '-16')
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
          FieldName = 'SUMM'
          DisplayFormat = ',0.00'
          Nullable = False
        end
        object colDRID: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DOCID'
        end
      end
    end
  end
  object panMain: TPanel [2]
    Left = 0
    Top = 0
    Width = 435
    Height = 101
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object panFooter: TPanel
      Left = 0
      Top = 71
      Width = 435
      Height = 30
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      DesignSize = (
        435
        30)
      object bvlTotals: TssBevel
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
        Left = 1011
        Top = 8
        Width = 73
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        AutoSize = False
        Caption = #1053#1072' '#1089#1091#1084#1084#1091
      end
      object lCount: TLabel
        Left = 765
        Top = 7
        Width = 93
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        AutoSize = False
        Caption = #1042#1089#1077#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
      end
      object stCount: TssBevel
        Left = 864
        Top = 4
        Width = 89
        Height = 21
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
        Left = 578
        Top = 4
        Width = 136
        Height = 21
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
      Height = 71
      Align = alClient
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      object ssBevel8: TssBevel
        Left = 434
        Top = 30
        Width = 1
        Height = 40
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
        Height = 40
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
        Top = 70
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
        Height = 40
        Hint = '??? ???????'
        DrawDragFrame = False
        Bands = <
          item
          end>
        DefaultLayout = True
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
        OnKeyDown = grdMainKeyDown
        DataSource = srcView
        Filter.Criteria = {00000000}
        HideFocusRect = True
        HideSelectionColor = 10724259
        HighlightColor = clNavy
        LookAndFeel = lfUltraFlat
        OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoStoreToRegistry, edgoTabThrough, edgoVertThrough]
        OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoRowSelect, edgoUseBitmap]
        OnCustomDrawCell = grdMainCustomDrawCell
        OnSelectedCountChange = grdMainSelectedCountChange
        LangManager = dmData.Lng
        OnNeedAdjust = grdMainNeedAdjust
        OnGetOptionsTitle = grdMainGetOptionsTitle
        object colID: TdxDBGridColumn
          Visible = False
          Width = 85
          BandIndex = 0
          RowIndex = 0
          FieldName = 'PAYDOCID'
        end
        object colDocType: TdxDBGridImageColumn
          Alignment = taLeftJustify
          MinWidth = 16
          Sizing = False
          Sorted = csUp
          Width = 25
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DOCTYPE'
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
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
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
            '-2')
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
        object colPayOrder: TdxDBGridImageColumn
          Alignment = taCenter
          HeaderAlignment = taCenter
          HeaderGlyph.Data = {
            42020000424D4202000000000000420000002800000010000000100000000100
            1000030000000002000000000000000000000000000000000000007C0000E003
            00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C0000000000003E63
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C0000
            3E631F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C000000003E631F7C
            00001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C00003E631F7C00001F7C
            00001F7C1F7C1F7C1F7C1F7C1F7C1F7C00001F7C00001F7C1F7C3E6300001F7C
            00001F7C1F7C1F7C1F7C1F7C1F7C00001F7C00001F7C1F7C1F7C00001F7C0000
            1F7C1F7C1F7C1F7C1F7C1F7C00001F7C00001F7C1F7C1F7C00001F7C00001F7C
            1F7C1F7C1F7C1F7C1F7C1F7C00001F7C1F7C1F7C1F7C00001F7C00001F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C3E6300001F7C1F7C00001F7C00001F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C3E63000000001F7C00001F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C
            1F7C1F7C1F7C}
          MinWidth = 16
          Sizing = False
          Width = 22
          BandIndex = 0
          RowIndex = 0
          OnCustomDrawCell = colPayOrderCustomDrawCell
          OnGetText = colPayOrderGetText
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
            '69')
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
            '1'
            ''
            ''
            '-1')
        end
        object colNum: TdxDBGridColumn
          Tag = 1
          Alignment = taRightJustify
          Caption = '#'
          HeaderAlignment = taCenter
          Width = 70
          BandIndex = 0
          RowIndex = 0
          FieldName = 'numex'
          OnGetText = colNumGetText
        end
        object colOnDate: TdxDBGridColumn
          Tag = 1
          Alignment = taCenter
          Caption = '????'
          HeaderAlignment = taCenter
          Width = 70
          BandIndex = 0
          RowIndex = 0
          FieldName = 'ONDATE'
          OnGetText = colOnDateGetText
        end
        object colChargeType: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'chargename'
        end
        object colName: TdxDBGridColumn
          Tag = 1
          Alignment = taLeftJustify
          Caption = '??????????'
          HeaderAlignment = taCenter
          Width = 300
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAME'
        end
        object colPayType: TdxDBGridColumn
          Tag = 1
          Caption = '??? ???????'
          HeaderAlignment = taCenter
          Width = 80
          BandIndex = 0
          RowIndex = 0
          FieldName = 'PTYPENAME'
        end
        object colTotal: TdxDBGridColumn
          Tag = 1
          Alignment = taRightJustify
          Caption = '????? ? ??????? ??????'
          HeaderAlignment = taCenter
          Width = 95
          BandIndex = 0
          RowIndex = 0
          FieldName = 'TOTAL'
          OnGetText = colTotalGetText
        end
        object colTotalDef: TdxDBGridColumn
          Tag = 1
          Alignment = taRightJustify
          Caption = '????? ? ???. ??????'
          HeaderAlignment = taCenter
          Visible = False
          Width = 95
          BandIndex = 0
          RowIndex = 0
          FieldName = 'TOTAL'
          OnGetText = colTotalDefGetText
        end
        object colShortName: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          Width = 76
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHORTNAME'
        end
        object colRate: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          Width = 55
          BandIndex = 0
          RowIndex = 0
          FieldName = 'ONVALUE'
        end
        object colKAID: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'KAID'
        end
        object colNumEx: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DOCNUM'
        end
        object colCashName: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'cashname'
        end
        object colAcc: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'accnum'
          OnGetText = colAccGetText
        end
        object colBankName: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'BANKNAME'
        end
        object colOperID: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'OPERID'
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
        object lKAgent: TLabel
          Left = 304
          Top = 7
          Width = 78
          Height = 13
          Alignment = taRightJustify
          Caption = 'Business partner'
        end
        object lPayType: TLabel
          Left = 793
          Top = 9
          Width = 38
          Height = 13
          Alignment = taRightJustify
          Caption = 'Paytype'
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
        object btnKagent: TssSpeedButton
          Left = 523
          Top = 5
          Width = 21
          Height = 21
          Alignment = taLeftJustify
          AllwaysShowFrame = False
          ButtonType = ssbtStandard
          Checked = False
          DisabledImages = dmData.Images
          DisabledImageIndex = 75
          GroupIndex = 0
          ImageIndex = 18
          Images = dmData.Images
          LeftMargin = 2
          ParentShowHint = False
          ShowHint = True
          Style = ssbsUser
          ViewStyle = ssvsGlyphOnly
          OnClick = btnKagentClick
        end
        object lChargeType: TLabel
          Left = 561
          Top = 7
          Width = 85
          Height = 13
          Alignment = taRightJustify
          Caption = #1057#1090#1072#1090#1100#1103' '#1088#1072#1089#1093#1086#1076#1086#1074
        end
        object btnChargeType: TssSpeedButton
          Left = 769
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
          OnClick = btnChargeTypeClick
        end
        object lcbKAgent: TssDBLookupCombo
          Left = 384
          Top = 3
          Width = 139
          Height = 24
          ImeName = 'Russian'
          ParentFont = False
          Properties.DropDownListStyle = lsEditFixedList
          Properties.Items.Strings = (
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' ')
          Properties.OnChange = lcbKAgentPropertiesChange
          Properties.OnEditValueChanged = lcbKAgentPropertiesEditValueChanged
          Properties.OnInitPopup = lcbKAgentPropertiesInitPopup
          Style.StyleController = dmData.scMain
          TabOrder = 0
          Text = ' '
          DisplayEmpty = ' '
          EmptyValue = 0
          KeyField = 'kaid'
          ListField = 'name'
          ListSource = srcKAgent
        end
        object lcbPayType: TssDBLookupCombo
          Left = 841
          Top = 5
          Width = 105
          Height = 24
          ImeName = 'Russian'
          ParentFont = False
          Properties.DropDownListStyle = lsEditFixedList
          Properties.Items.Strings = (
            ' '
            '1'
            '2'
            '3'
            '4'
            '5'
            '6'
            '7'
            '8'
            '9'
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' ')
          Properties.OnChange = lcbPayTypePropertiesChange
          Properties.OnEditValueChanged = lcbKAgentPropertiesEditValueChanged
          Style.StyleController = dmData.scMain
          TabOrder = 1
          Text = ' '
          DisplayEmpty = ' '
          EmptyValue = 0
          KeyField = 'ptypeid'
          ListField = 'name'
          ListSource = srcPayType
        end
        object lcbChargeType: TssDBLookupCombo
          Left = 649
          Top = 3
          Width = 115
          Height = 24
          ImeName = 'Russian'
          ParentFont = False
          Properties.DropDownListStyle = lsEditFixedList
          Properties.Items.Strings = (
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' '
            ' ')
          Properties.OnChange = lcbChargeTypePropertiesChange
          Properties.OnEditValueChanged = lcbKAgentPropertiesEditValueChanged
          Style.StyleController = dmData.scMain
          TabOrder = 2
          Text = ' '
          DisplayEmpty = ' '
          EmptyValue = 0
          KeyField = 'ctypeid'
          ListField = 'name'
          ListSource = srcChargeType
        end
        object prdMain: TokPeriod
          Left = 6
          Top = 5
          Width = 267
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
          OnChange = prdMainChange
          TabOrder = 3
          ViewType = vtShort
          LangManager = dmData.Lng
          DesignSize = (
            267
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
      OnExecute = aPrintInOrderExecute
    end
    object aPrintPayOrder: TAction [11]
      Category = 'All'
      OnExecute = aPrintPayOrderExecute
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
      Caption = 'print'
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
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'todate'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'doctype'
        ParamType = ptInput
      end>
    ProviderName = 'pPayDoc_List'
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
    Left = 428
    Top = 56
    object cdsViewPAYDOCID: TIntegerField
      FieldName = 'PAYDOCID'
      Required = True
    end
    object cdsViewDOCTYPE: TIntegerField
      FieldName = 'DOCTYPE'
      Required = True
    end
    object cdsViewONDATE: TDateTimeField
      FieldName = 'ONDATE'
      Required = True
    end
    object cdsViewKAID: TIntegerField
      FieldName = 'KAID'
    end
    object cdsViewPTYPEID: TIntegerField
      FieldName = 'PTYPEID'
      Required = True
    end
    object cdsViewCURRID: TIntegerField
      FieldName = 'CURRID'
      Required = True
    end
    object cdsViewDELETED: TIntegerField
      FieldName = 'DELETED'
      Required = True
    end
    object cdsViewDOCNUM: TStringField
      FieldName = 'DOCNUM'
      Required = True
    end
    object cdsViewCHECKED: TIntegerField
      FieldName = 'CHECKED'
      Required = True
    end
    object cdsViewWITHNDS: TIntegerField
      FieldName = 'WITHNDS'
      Required = True
    end
    object cdsViewREASON: TStringField
      FieldName = 'REASON'
      Size = 255
    end
    object cdsViewNOTES: TStringField
      FieldName = 'NOTES'
      Size = 255
    end
    object cdsViewMPERSONID: TIntegerField
      FieldName = 'MPERSONID'
    end
    object cdsViewCTYPEID: TIntegerField
      FieldName = 'CTYPEID'
      Required = True
    end
    object cdsViewNAME: TStringField
      FieldName = 'NAME'
      Size = 64
    end
    object cdsViewPTYPENAME: TStringField
      FieldName = 'PTYPENAME'
      Required = True
      Size = 48
    end
    object cdsViewSHORTNAME: TStringField
      FieldName = 'SHORTNAME'
      Required = True
      Size = 3
    end
    object cdsViewONVALUE: TFloatField
      FieldName = 'ONVALUE'
      Required = True
    end
    object cdsViewFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 255
    end
    object cdsViewADDRESS: TStringField
      FieldName = 'ADDRESS'
      Size = 255
    end
    object cdsViewPHONE: TStringField
      FieldName = 'PHONE'
      Size = 64
    end
    object cdsViewFAX: TStringField
      FieldName = 'FAX'
      Size = 32
    end
    object cdsViewEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 64
    end
    object cdsViewWWW: TStringField
      FieldName = 'WWW'
      Size = 64
    end
    object cdsViewCITY: TStringField
      FieldName = 'CITY'
      Size = 32
    end
    object cdsViewDISTRICT: TStringField
      FieldName = 'DISTRICT'
      Size = 32
    end
    object cdsViewPOSTINDEX: TStringField
      FieldName = 'POSTINDEX'
      Size = 16
    end
    object cdsViewCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Size = 32
    end
    object cdsViewCHARGENAME: TStringField
      FieldName = 'CHARGENAME'
      Required = True
      Size = 128
    end
    object cdsViewnumex: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'numex'
    end
    object cdsViewCASHID: TIntegerField
      FieldName = 'CASHID'
    end
    object cdsViewACCID: TIntegerField
      FieldName = 'ACCID'
    end
    object cdsViewCASHNAME: TStringField
      FieldName = 'CASHNAME'
      Size = 128
    end
    object cdsViewACCNUM: TStringField
      FieldName = 'ACCNUM'
      Size = 48
    end
    object cdsViewBANKNAME: TStringField
      FieldName = 'BANKNAME'
      Size = 128
    end
    object cdsViewOPERID: TIntegerField
      FieldName = 'OPERID'
    end
    object cdsViewTOTAL: TFloatField
      FieldName = 'TOTAL'
      Required = True
    end
    object cdsViewDOCID: TIntegerField
      FieldName = 'DOCID'
      Required = True
    end
  end
  object cdsKAgent: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'p_KAgentList'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 340
    Top = 52
  end
  object srcKAgent: TDataSource
    DataSet = cdsKAgent
    Left = 312
    Top = 52
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
  object cdsPayOrder: TssClientDataSet
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
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'todate'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'doctype'
        ParamType = ptInput
      end>
    ProviderName = 'pPayDoc_Order'
    RemoteServer = dmData.SConnection
    Macros = <
      item
        DataType = ftString
        Name = 'm'
        ParamType = ptUnknown
      end>
    Left = 120
    Top = 76
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
    Left = 268
    Top = 44
  end
  object srcChargeType: TDataSource
    DataSet = cdsChargeType
    Left = 240
    Top = 44
  end
  object cdsRel: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'docid'
        ParamType = ptUnknown
      end>
    ProviderName = 'pWaybill_RelList'
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
  object srcView: TssDataSource
    DataSet = cdsView
    ChangeDelay = 250
    OnDelayedDataChange = srcViewDelayedDataChange
    Left = 436
    Top = 104
  end
end
