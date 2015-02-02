inherited fmWMat: TfmWMat
  object splMain: TSplitter [0]
    Left = 0
    Top = 105
    Width = 435
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    OnMoved = splMainMoved
  end
  object pcMain: TcxPageControl [1]
    Left = 0
    Top = 108
    Width = 435
    Height = 158
    ActivePage = tsWHouse
    Align = alBottom
    Images = dmData.Images
    TabOrder = 0
    OnChange = pcMainChange
    object tsWHouse: TcxTabSheet
      Caption = #1057#1082#1083#1072#1076#1099' '
      ImageIndex = 50
      object panWHouseFooter: TPanel
        Left = 0
        Top = 109
        Width = 435
        Height = 25
        Align = alBottom
        Alignment = taLeftJustify
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          435
          25)
        object lTotal: TLabel
          Left = -5001
          Top = 5
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = #1042#1089#1077#1075#1086':'
        end
        object lFree: TLabel
          Left = -4870
          Top = 5
          Width = 52
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = #1057#1074#1086#1073#1086#1076#1085#1086':'
        end
        object lReserved: TLabel
          Left = -4718
          Top = 5
          Width = 40
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = #1056#1077#1079#1077#1088#1074':'
        end
        object ssBevel1: TssBevel
          Left = 0
          Top = 24
          Width = 435
          Height = 1
          Align = alBottom
          ColorGrBegin = clBtnFace
          ColorGrEnd = clBtnFace
          ColorInner = clGray
          ColorOuter = clGray
          Edges = [beLeft, beRight, beTop, beBottom]
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel3: TssBevel
          Left = -4299
          Top = 0
          Width = 4
          Height = 31
          Anchors = [akTop, akRight]
          ColorGrBegin = clBtnFace
          ColorGrEnd = clBtnFace
          ColorInner = clGray
          ColorOuter = clGray
          Edges = [beLeft, beRight, beTop, beBottom]
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Shape = bsRightLine
          Style = bsSingle
          UseGradient = False
        end
        object ssBevel14: TssBevel
          Left = 434
          Top = 0
          Width = 1
          Height = 24
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
        object stReservedValue: TssBevel
          Left = -4673
          Top = 4
          Width = 83
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
        end
        object stFreeValue: TssBevel
          Left = -4813
          Top = 4
          Width = 83
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
        end
        object stTotalValue: TssBevel
          Left = -4963
          Top = 4
          Width = 83
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
        end
        object ssBevel2: TssBevel
          Left = 0
          Top = 0
          Width = 1
          Height = 24
          Align = alLeft
          ColorGrBegin = clBtnFace
          ColorGrEnd = clBtnFace
          ColorInner = clGray
          ColorOuter = clBtnHighlight
          Edges = [beLeft, beRight, beTop, beBottom]
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Shape = bsLeftLine
          UseGradient = False
        end
      end
      object panWHouse: TPanel
        Left = 0
        Top = 0
        Width = 435
        Height = 109
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 1
        object ssBevel7: TssBevel
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
        object ssBevel10: TssBevel
          Left = 0
          Top = 1
          Width = 1
          Height = 107
          Align = alLeft
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
        object ssBevel11: TssBevel
          Left = 434
          Top = 1
          Width = 1
          Height = 107
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
        object ssBevel13: TssBevel
          Left = 0
          Top = 108
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
        object grdWHouse: TssDBGrid
          Left = 1
          Top = 1
          Width = 433
          Height = 107
          Hint = #1057#1082#1083#1072#1076
          DrawDragFrame = False
          Bands = <
            item
              Caption = #1052#1072#1090#1077#1088#1080#1072#1083
            end>
          DefaultLayout = False
          HeaderPanelRowCount = 1
          KeyField = 'WID'
          SummaryGroups = <>
          SummarySeparator = ', '
          Align = alClient
          BorderStyle = bsNone
          ParentShowHint = False
          PopupMenu = pmAdd
          ShowHint = True
          TabOrder = 0
          OnDblClick = grdWHouseDblClick
          OnKeyDown = grdWHouseKeyDown
          DataSource = srcWHouse
          Filter.Criteria = {00000000}
          FixedBandLineColor = clBtnFace
          GroupPanelColor = clBtnFace
          LookAndFeel = lfUltraFlat
          OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEnterShowEditor, edgoImmediateEditor, edgoTabThrough, edgoVertThrough]
          OptionsCustomize = [edgoBandSizing, edgoColumnSizing]
          OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
          OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
          OnCustomDrawCell = grdMainCustomDrawCell
          object colWID: TdxDBGridColumn
            Visible = False
            Width = 114
            BandIndex = 0
            RowIndex = 0
            FieldName = 'WID'
          end
          object colWName: TdxDBGridColumn
            Tag = 1
            Alignment = taLeftJustify
            Caption = #1057#1082#1083#1072#1076
            HeaderAlignment = taCenter
            Sizing = False
            TabStop = False
            Width = 415
            BandIndex = 0
            RowIndex = 0
            FieldName = 'NAME'
            SummaryFooterType = cstCount
          end
          object colWRemain: TdxDBGridColumn
            Tag = 1
            Alignment = taRightJustify
            Caption = #1042#1089#1077#1075#1086
            HeaderAlignment = taCenter
            Sizing = False
            Sorted = csUp
            Width = 70
            BandIndex = 0
            RowIndex = 0
            FieldName = 'REMAIN'
            OnGetText = colWRemainGetText
            SummaryFooterType = cstSum
          end
          object colWFree: TdxDBGridColumn
            Alignment = taRightJustify
            Caption = #1057#1074#1086#1073#1086#1076#1085#1086
            HeaderAlignment = taCenter
            Sizing = False
            Width = 70
            BandIndex = 0
            RowIndex = 0
            FieldName = 'REMAIN'
            OnGetText = colWFreeGetText
            SummaryFooterType = cstSum
          end
          object colWReserved: TdxDBGridColumn
            Alignment = taRightJustify
            Caption = #1056#1077#1079#1077#1088#1074
            HeaderAlignment = taCenter
            Sizing = False
            Width = 65
            BandIndex = 0
            RowIndex = 0
            FieldName = 'reserved'
            OnGetText = colWReservedGetText
            SummaryFooterType = cstSum
          end
        end
      end
    end
    object tsPrice: TcxTabSheet
      Caption = #1062#1077#1085#1099' '
      ImageIndex = 171
      object ssBevel15: TssBevel
        Left = 0
        Top = 0
        Width = 601
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
      object ssBevel16: TssBevel
        Left = 0
        Top = 1
        Width = 1
        Height = 132
        Align = alLeft
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
      object ssBevel17: TssBevel
        Left = 600
        Top = 1
        Width = 1
        Height = 132
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
      object ssBevel18: TssBevel
        Left = 0
        Top = 133
        Width = 601
        Height = 1
        Align = alBottom
        ColorGrBegin = clBtnFace
        ColorGrEnd = clBtnFace
        ColorInner = clGray
        ColorOuter = clGray
        Edges = [beLeft, beRight, beTop, beBottom]
        GradientDirection = gdHorizontal
        HotTrack = False
        ImageIndex = 0
        Style = bsSingle
        UseGradient = False
      end
      object grdPrice: TssDBGrid
        Left = 1
        Top = 1
        Width = 200
        Height = 132
        DrawDragFrame = False
        Bands = <
          item
            Caption = #1044#1086#1082#1091#1084#1077#1085#1090
          end
          item
            Caption = #1058#1086#1074#1072#1088
          end
          item
            Caption = #1042#1093#1086#1076#1085#1072#1103' '#1094#1077#1085#1072
          end>
        DefaultLayout = False
        HeaderPanelRowCount = 1
        KeyField = 'POSID'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        BorderStyle = bsNone
        ParentShowHint = False
        PopupMenu = pmPrices
        ShowHint = True
        TabOrder = 0
        OnClick = grdPriceClick
        OnDblClick = grdPriceDblClick
        OnKeyDown = grdPriceKeyDown
        DataSource = srcPrice
        Filter.Criteria = {00000000}
        FixedBandLineColor = clBtnFace
        GroupPanelColor = clBtnFace
        HideFocusRect = True
        LookAndFeel = lfUltraFlat
        OptionsBehavior = [edgoAutoSort, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoStoreToRegistry, edgoTabThrough, edgoVertThrough]
        OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoRowSelect, edgoUseBitmap]
        ShowBands = True
        OnChangedColumnsWidth = grdPriceChangedColumnsWidth
        OnCustomDrawCell = grdMainCustomDrawCell
        LangManager = dmData.Lng
        OnNeedAdjust = grdPriceNeedAdjust
        OnGetOptionsTitle = grdPriceGetOptionsTitle
        object colpPosID: TdxDBGridColumn
          Visible = False
          Width = 37
          BandIndex = 1
          RowIndex = 0
          FieldName = 'POSID'
        end
        object colPDocType: TdxDBGridImageColumn
          Alignment = taRightJustify
          MinWidth = 16
          Sizing = False
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
            '160')
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
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
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
            ''
            ''
            '6'
            ''
            ''
            ''
            ''
            ''
            '5')
        end
        object colPDocNum: TdxDBGridColumn
          Tag = 1
          Alignment = taRightJustify
          HeaderAlignment = taCenter
          Width = 62
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DOCNUM'
        end
        object colOnDate: TdxDBGridColumn
          Tag = 1
          Alignment = taCenter
          Caption = #1055#1088#1080#1085#1103#1090#1086
          HeaderAlignment = taCenter
          TabStop = False
          Width = 94
          BandIndex = 0
          RowIndex = 0
          FieldName = 'ONDATE'
          OnGetText = colOnDateGetText
        end
        object colOnTime: TdxDBGridColumn
          Tag = 1
          Alignment = taCenter
          Caption = #1042#1088#1077#1084#1103
          HeaderAlignment = taCenter
          Width = 94
          BandIndex = 0
          RowIndex = 0
          FieldName = 'ONDATE'
          OnGetText = colOnTimeGetText
        end
        object colWHouse: TdxDBGridColumn
          Tag = 1
          Alignment = taLeftJustify
          Caption = #1057#1082#1083#1072#1076
          HeaderAlignment = taCenter
          Width = 135
          BandIndex = 1
          RowIndex = 0
          FieldName = 'NAME'
        end
        object colPRemain: TdxDBGridColumn
          Tag = 1
          Caption = #1050#1086#1083'-'#1074#1086
          HeaderAlignment = taCenter
          Width = 50
          BandIndex = 1
          RowIndex = 0
          FieldName = 'REMAIN'
          OnGetText = colPRemainGetText
        end
        object colPReserved: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          Width = 29
          BandIndex = 1
          RowIndex = 0
          FieldName = 'reserved'
          OnGetText = colPReservedGetText
        end
        object colSN: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          Width = 29
          BandIndex = 1
          RowIndex = 0
          FieldName = 'SN'
        end
        object colPPrice: TdxDBGridColumn
          Tag = 1
          Alignment = taRightJustify
          Caption = #1062#1077#1085#1072' '#1074' '#1091#1095'. '#1074#1072#1083#1102#1090#1077
          HeaderAlignment = taCenter
          Sorted = csUp
          Width = 100
          BandIndex = 2
          RowIndex = 0
          FieldName = 'PRICE'
          OnGetText = colPPriceGetText
        end
        object colPPriceN: TdxDBGridColumn
          Tag = 1
          Alignment = taRightJustify
          Caption = #1062#1077#1085#1072' '#1074' '#1085#1072#1094'. '#1074#1072#1083#1102#1090#1077
          HeaderAlignment = taCenter
          Width = 100
          BandIndex = 2
          RowIndex = 0
          FieldName = 'PRICE'
          OnGetText = colPPriceNGetText
        end
        object colCurName: TdxDBGridColumn
          Visible = False
          Width = 43
          BandIndex = 1
          RowIndex = 0
          FieldName = 'SHORTNAME'
        end
        object colOnValue: TdxDBGridColumn
          Visible = False
          Width = 37
          BandIndex = 1
          RowIndex = 0
          FieldName = 'ONVALUE'
        end
        object colPWID: TdxDBGridColumn
          Visible = False
          Width = 75
          BandIndex = 0
          RowIndex = 0
          FieldName = 'WID'
        end
        object colP_GTD: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          Width = 80
          BandIndex = 1
          RowIndex = 0
          FieldName = 'gtd'
        end
        object colP_CertNum: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          Width = 80
          BandIndex = 1
          RowIndex = 0
          FieldName = 'certnum'
        end
        object colP_CertDate: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          Width = 80
          BandIndex = 1
          RowIndex = 0
          FieldName = 'certdate'
        end
        object colP_Producer: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          Width = 80
          BandIndex = 1
          RowIndex = 0
          FieldName = 'Producer'
        end
      end
    end
    object tsOrdered: TcxTabSheet
      Caption = #1047#1072#1082#1072#1079#1072#1085#1086' '
      ImageIndex = 203
      object grdOrdered: TssDBGrid
        Left = 0
        Top = 0
        Width = 200
        Height = 134
        DrawDragFrame = False
        Bands = <
          item
            Caption = #1047#1072#1082#1072#1079
          end
          item
            Caption = #1052#1072#1090#1077#1088#1080#1072#1083
          end
          item
            Caption = #1042#1093#1086#1076#1085#1072#1103' '#1094#1077#1085#1072
          end>
        DefaultLayout = False
        HeaderPanelRowCount = 1
        KeyField = 'POSID'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        ParentShowHint = False
        PopupMenu = pmOrdered
        ShowHint = True
        TabOrder = 0
        OnDblClick = grdOrderedDblClick
        DataSource = srcOrdered
        Filter.Criteria = {00000000}
        FixedBandLineColor = clBtnFace
        GroupPanelColor = clBtnFace
        HideFocusRect = True
        LookAndFeel = lfUltraFlat
        OptionsBehavior = [edgoAutoSort, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoStoreToRegistry, edgoTabThrough, edgoVertThrough]
        OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoRowSelect, edgoUseBitmap]
        ShowBands = True
        OnCustomDrawCell = grdMainCustomDrawCell
        LangManager = dmData.Lng
        OnNeedAdjust = grdOrderedNeedAdjust
        OnGetOptionsTitle = grdOrderedGetOptionsTitle
        object colOPosID: TdxDBGridColumn
          Visible = False
          Width = 37
          BandIndex = 1
          RowIndex = 0
          FieldName = 'POSID'
        end
        object colOWType: TdxDBGridImageColumn
          Alignment = taRightJustify
          MinWidth = 16
          Sizing = False
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
            '203')
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
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
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
            ''
            ''
            '6'
            ''
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
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            '16')
        end
        object colODocNum: TdxDBGridColumn
          Tag = 1
          Alignment = taRightJustify
          Caption = #1053#1086#1084#1077#1088' '#1079#1072#1082#1072#1079#1072
          HeaderAlignment = taCenter
          Width = 53
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DOCNUM'
          OnGetText = colODocNumGetText
        end
        object colODocDate: TdxDBGridColumn
          Tag = 1
          Alignment = taCenter
          Caption = #1044#1072#1090#1072' '#1079#1072#1082#1072#1079#1072
          HeaderAlignment = taCenter
          TabStop = False
          Width = 80
          BandIndex = 0
          RowIndex = 0
          FieldName = 'ONDATE'
          OnGetText = colODocDateGetText
        end
        object colOToDate: TdxDBGridColumn
          Tag = 1
          Alignment = taCenter
          Caption = #1054#1078#1080#1076#1072#1077#1090#1089#1103
          HeaderAlignment = taCenter
          Width = 71
          BandIndex = 0
          RowIndex = 0
          OnCustomDrawCell = colOToDateCustomDrawCell
          FieldName = 'TODATE'
          OnGetText = colOToDateGetText
        end
        object colOSupplier: TdxDBGridColumn
          HeaderAlignment = taCenter
          Width = 120
          BandIndex = 0
          RowIndex = 0
          FieldName = 'kaname'
        end
        object colOWHName: TdxDBGridColumn
          Tag = 1
          Alignment = taLeftJustify
          Caption = #1057#1082#1083#1072#1076
          HeaderAlignment = taCenter
          Width = 135
          BandIndex = 1
          RowIndex = 0
          FieldName = 'NAME'
        end
        object colOAmount: TdxDBGridColumn
          Tag = 1
          Caption = #1050#1086#1083'-'#1074#1086
          HeaderAlignment = taCenter
          Width = 50
          BandIndex = 1
          RowIndex = 0
          FieldName = 'ORDERED'
          OnGetText = colOAmountGetText
        end
        object colORsv: TdxDBGridColumn
          Tag = 1
          Caption = #1056#1077#1079#1077#1088#1074
          HeaderAlignment = taCenter
          Visible = False
          Width = 29
          BandIndex = 1
          RowIndex = 0
          FieldName = 'reserved'
          OnGetText = colPReservedGetText
        end
        object colOPriceInCurr: TdxDBGridColumn
          Tag = 1
          Alignment = taRightJustify
          Caption = #1062#1077#1085#1072' '#1074' '#1091#1095'. '#1074#1072#1083#1102#1090#1077
          HeaderAlignment = taCenter
          Sorted = csUp
          Width = 100
          BandIndex = 2
          RowIndex = 0
          FieldName = 'PRICE'
          OnGetText = colOPriceInCurrGetText
        end
        object colOPrice: TdxDBGridColumn
          Tag = 1
          Alignment = taRightJustify
          Caption = #1062#1077#1085#1072' '#1074' '#1085#1072#1094'. '#1074#1072#1083#1102#1090#1077
          HeaderAlignment = taCenter
          Width = 100
          BandIndex = 2
          RowIndex = 0
          FieldName = 'PRICE'
          OnGetText = colOPriceGetText
        end
        object colOShortName: TdxDBGridColumn
          Visible = False
          Width = 43
          BandIndex = 1
          RowIndex = 0
          FieldName = 'SHORTNAME'
        end
        object colORate: TdxDBGridColumn
          Caption = #1050#1091#1088#1089
          Visible = False
          Width = 37
          BandIndex = 1
          RowIndex = 0
          FieldName = 'ONVALUE'
        end
        object colOWID: TdxDBGridColumn
          Visible = False
          Width = 63
          BandIndex = 0
          RowIndex = 0
          FieldName = 'WID'
        end
        object colWBillID: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'WBILLID'
        end
      end
    end
    object tsMC: TcxTabSheet
      Caption = 'tsMC'
      ImageIndex = 153
      object grdMC: TssDBGrid
        Left = 0
        Top = 0
        Width = 447
        Height = 134
        Hint = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        DrawDragFrame = False
        Bands = <
          item
            Caption = #1052#1072#1090#1077#1088#1080#1072#1083
          end>
        DefaultLayout = False
        HeaderPanelRowCount = 1
        KeyField = 'MATID'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        ParentShowHint = False
        PopupMenu = pmMC
        ShowHint = True
        TabOrder = 0
        OnDblClick = grdMCDblClick
        DataSource = srcMC
        Filter.Criteria = {00000000}
        FixedBandLineColor = clBtnFace
        GroupPanelColor = clBtnFace
        LookAndFeel = lfUltraFlat
        OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEnterShowEditor, edgoImmediateEditor, edgoStoreToRegistry, edgoTabThrough, edgoVertThrough]
        OptionsCustomize = [edgoBandSizing, edgoColumnMoving, edgoColumnSizing]
        OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
        OnCustomDrawCell = grdMCCustomDrawCell
        LangManager = dmData.Lng
        OnGetOptionsTitle = grdMCGetOptionsTitle
        object colNo: TdxDBGridColumn
          Alignment = taCenter
          Width = 25
          BandIndex = 0
          RowIndex = 0
          OnGetText = colNoGetText
        end
        object colMCName: TdxDBGridColumn
          Tag = 1
          Alignment = taLeftJustify
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          HeaderAlignment = taCenter
          Sorted = csUp
          TabStop = False
          Width = 378
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAME'
          OnGetText = colNameGetText
        end
        object colMCID: TdxDBGridColumn
          Visible = False
          Width = 58
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MATID'
        end
        object colMCArtikul: TdxDBGridColumn
          Tag = 1
          Alignment = taLeftJustify
          Caption = #1040#1088#1090#1080#1082#1091#1083
          HeaderAlignment = taCenter
          Visible = False
          Width = 120
          BandIndex = 0
          RowIndex = 0
          FieldName = 'artikul'
          OnGetText = colNameGetText
        end
        object colMCTotal: TdxDBGridColumn
          Tag = 1
          Caption = #1042#1089#1077#1075#1086
          HeaderAlignment = taCenter
          Width = 70
          BandIndex = 0
          RowIndex = 0
          FieldName = 'Total'
          OnGetText = colMCTotalGetText
        end
        object colMCFree: TdxDBGridColumn
          Tag = 1
          Caption = #1057#1074#1086#1073#1086#1076#1085#1086
          HeaderAlignment = taCenter
          Width = 70
          BandIndex = 0
          RowIndex = 0
          FieldName = 'Free'
          OnGetText = colMCTotalGetText
        end
        object colMCRsv: TdxDBGridColumn
          Tag = 1
          Caption = #1056#1077#1079#1077#1088#1074
          HeaderAlignment = taCenter
          Width = 65
          BandIndex = 0
          RowIndex = 0
          OnCustomDrawCell = colMCRsvCustomDrawCell
          FieldName = 'rsv'
          OnGetText = colMCTotalGetText
        end
        object colPrice: TdxDBGridColumn
          Caption = #1055#1086#1089#1083#1077#1076#1085#1103#1103' '#1074#1093#1086#1076#1085#1072#1103' '#1094#1077#1085#1072
          HeaderAlignment = taCenter
          Width = 158
          BandIndex = 0
          RowIndex = 0
          FieldName = 'price'
          OnGetText = colPriceGetText
        end
        object colShortName: TdxDBGridColumn
          Visible = False
          Width = 45
          BandIndex = 0
          RowIndex = 0
          FieldName = 'shortname'
        end
        object colMCGrpName: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'grpname'
        end
        object colMCCountry: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'country'
        end
        object colMCBarCode: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          Width = 80
          BandIndex = 0
          RowIndex = 0
          FieldName = 'barcode'
        end
        object colMCMsrName: TdxDBGridColumn
          Tag = 1
          Alignment = taCenter
          HeaderAlignment = taCenter
          Visible = False
          Width = 50
          BandIndex = 0
          RowIndex = 0
          FieldName = 'msrname'
        end
        object colMCProducer: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'producer'
        end
      end
    end
    object tsAdd: TcxTabSheet
      Caption = 'tsAdd'
      ImageIndex = 3
      TabVisible = False
      object grdMats: TssDBGrid
        Left = 0
        Top = 0
        Width = 498
        Height = 134
        Hint = 'name'
        DrawDragFrame = False
        Bands = <
          item
          end>
        DefaultLayout = False
        HeaderPanelRowCount = 1
        KeyField = 'posid'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        DragMode = dmAutomatic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        PopupMenu = pmMats
        ShowHint = True
        TabOrder = 0
        OnDblClick = grdMatsDblClick
        OnDragDrop = grdMatsDragDrop
        OnDragOver = grdMatsDragOver
        OnKeyDown = grdMatsKeyDown
        BandColor = 12500670
        BandFont.Charset = DEFAULT_CHARSET
        BandFont.Color = clBlack
        BandFont.Height = -11
        BandFont.Name = 'Tahoma'
        BandFont.Style = [fsBold]
        DataSource = srcMats
        Filter.Criteria = {00000000}
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clBlack
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        HideFocusRect = True
        HideSelectionColor = clInactiveBorder
        HideSelectionTextColor = clBlack
        LookAndFeel = lfUltraFlat
        MaxRowLineCount = 1
        OptionsBehavior = [edgoAutoSort, edgoEditing, edgoEnterShowEditor, edgoExtMultiSelect, edgoImmediateEditor, edgoMultiSelect, edgoStoreToRegistry, edgoTabs, edgoVertThrough]
        OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseLocate]
        OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoShowButtonAlways, edgoUseBitmap]
        PreviewFont.Charset = DEFAULT_CHARSET
        PreviewFont.Color = clBlue
        PreviewFont.Height = -11
        PreviewFont.Name = 'Tahoma'
        PreviewFont.Style = [fsBold]
        ShowRowFooter = True
        OnColumnSorting = grdMatsColumnSorting
        OnCustomDrawCell = grdMatsCustomDrawCell
        OnEdited = grdMatsEdited
        LangManager = dmData.Lng
        OnNeedAdjust = grdMatsNeedAdjust
        OnGetOptionsTitle = grdMatsGetOptionsTitle
        object colMRecNo: TdxDBGridColumn
          Alignment = taCenter
          Caption = #8470
          DisableEditor = True
          HeaderAlignment = taCenter
          MaxLength = 30
          MinWidth = 30
          Sizing = False
          Width = 35
          BandIndex = 0
          RowIndex = 0
          OnGetText = colMRecNoGetText
        end
        object colMMatName: TdxDBGridColumn
          Tag = 1
          DisableEditor = True
          HeaderAlignment = taCenter
          MaxLength = 300
          Width = 207
          BandIndex = 0
          RowIndex = 0
          FieldName = 'name'
          SummaryType = cstSum
          SummaryField = 'amount'
          SummaryFormat = '0.00'
        end
        object colMMatArtikul: TdxDBGridColumn
          Tag = 1
          DisableEditor = True
          HeaderAlignment = taCenter
          Visible = False
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'artikul'
        end
        object colMWHName: TdxDBGridLookupColumn
          Tag = 1
          HeaderAlignment = taCenter
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'whname'
          ListFieldName = 'name'
          OnCloseUp = colMWHNameCloseUp
        end
        object colMAmount: TdxDBGridColumn
          Tag = 2
          Alignment = taRightJustify
          HeaderAlignment = taCenter
          MaxLength = 91
          Width = 99
          BandIndex = 0
          RowIndex = 0
          FieldName = 'amount'
        end
        object colMPrice: TdxDBGridColumn
          Tag = 1
          Alignment = taRightJustify
          HeaderAlignment = taCenter
          MaxLength = 120
          Width = 100
          BandIndex = 0
          RowIndex = 0
          OnChange = colMPriceChange
          FieldName = 'price'
        end
        object colMMatID: TdxDBGridColumn
          Visible = False
          Width = 37
          BandIndex = 0
          RowIndex = 0
          FieldName = 'matid'
        end
        object colMPriceType: TdxDBGridLookupColumn
          Tag = 1
          HeaderAlignment = taCenter
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'ptypename'
          ListFieldName = 'name'
          OnCloseUp = colMPriceTypeCloseUp
        end
        object colMSumm: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          Width = 70
          BandIndex = 0
          RowIndex = 0
          FieldName = 'summ'
          OnGetText = colMSummGetText
        end
      end
    end
  end
  object panClient: TPanel [2]
    Left = 0
    Top = 0
    Width = 435
    Height = 105
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object ssBevel9: TssBevel
      Left = 0
      Top = 30
      Width = 1
      Height = 44
      Align = alLeft
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
    object ssBevel8: TssBevel
      Left = 434
      Top = 30
      Width = 1
      Height = 44
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
    object ssBevel5: TssBevel
      Left = 0
      Top = 74
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
      Height = 44
      Hint = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DrawDragFrame = False
      Bands = <
        item
          Caption = #1058#1086#1074#1072#1088
        end
        item
          Caption = #1054#1089#1090#1072#1090#1082#1080' '#1085#1072' '#1089#1082#1083#1072#1076#1077
        end
        item
          Caption = #1046#1077#1083#1072#1077#1084#1099#1081' '#1079#1072#1087#1072#1089
          Visible = False
        end
        item
          Caption = #1047#1072#1082#1072#1079#1072#1085#1086
          Visible = False
        end
        item
          Caption = #1054#1089#1090#1072#1090#1082#1080' + '#1047#1072#1082#1072#1079#1072#1085#1086
          Visible = False
        end>
      DefaultLayout = False
      HeaderPanelRowCount = 1
      KeyField = 'MATID'
      SummaryGroups = <>
      SummarySeparator = ', '
      Align = alClient
      BorderStyle = bsNone
      ParentShowHint = False
      PopupMenu = pmAdd
      ShowHint = True
      TabOrder = 0
      OnDblClick = grdMainDblClick
      OnDragDrop = grdMainDragDrop
      OnDragOver = grdMainDragOver
      OnKeyDown = grdMainKeyDown
      DataSource = srcViewEx
      Filter.Criteria = {00000000}
      FixedBandLineColor = clBtnFace
      GroupPanelColor = clBtnFace
      HideFocusRect = True
      HighlightColor = clTeal
      LookAndFeel = lfUltraFlat
      OptionsBehavior = [edgoAutoSort, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoStoreToRegistry, edgoTabThrough, edgoVertThrough]
      OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
      OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoRowSelect, edgoUseBitmap]
      ShowBands = True
      OnCustomDrawCell = grdMainCustomDrawCell
      LangManager = dmData.Lng
      OnNeedAdjust = grdMainNeedAdjust
      OnGetOptionsTitle = grdMainGetOptionsTitle
      object colNum: TdxDBGridColumn
        Alignment = taCenter
        Caption = #8470' '#1087'/'#1087
        HeaderAlignment = taCenter
        Sizing = False
        Width = 35
        BandIndex = 0
        RowIndex = 0
        FieldName = 'NUM'
        OnGetText = colNumGetText
      end
      object colName: TdxDBGridColumn
        Tag = 1
        Alignment = taLeftJustify
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        HeaderAlignment = taCenter
        Sorted = csDown
        TabStop = False
        Width = 209
        BandIndex = 0
        RowIndex = 0
        FieldName = 'MATNAME'
        OnGetText = colNameGetText
      end
      object colID: TdxDBGridColumn
        Visible = False
        Width = 79
        BandIndex = 0
        RowIndex = 0
        FieldName = 'MATID'
      end
      object colArtikul: TdxDBGridColumn
        Tag = 1
        Alignment = taLeftJustify
        Caption = #1040#1088#1090#1080#1082#1091#1083
        HeaderAlignment = taCenter
        Width = 120
        BandIndex = 0
        RowIndex = 0
        FieldName = 'ARTIKUL'
        OnGetText = colNameGetText
      end
      object colBarCode: TdxDBGridColumn
        Tag = 1
        HeaderAlignment = taCenter
        Visible = False
        Width = 100
        BandIndex = 0
        RowIndex = 0
        FieldName = 'BARCODE'
      end
      object colMeasure: TdxDBGridColumn
        Tag = 1
        Alignment = taCenter
        Caption = #1045#1076'. '#1080#1079#1084'.'
        HeaderAlignment = taCenter
        Width = 50
        BandIndex = 0
        RowIndex = 0
        FieldName = 'MSRNAME'
      end
      object colProducer: TdxDBGridColumn
        Tag = 1
        HeaderAlignment = taCenter
        Visible = False
        Width = 100
        BandIndex = 0
        RowIndex = 0
        FieldName = 'PRODUCER'
      end
      object colCountry: TdxDBGridColumn
        Tag = 1
        HeaderAlignment = taCenter
        Visible = False
        Width = 100
        BandIndex = 0
        RowIndex = 0
        FieldName = 'COUNTRY'
      end
      object colRemain: TdxDBGridColumn
        Tag = 1
        Caption = #1042#1089#1077#1075#1086
        HeaderAlignment = taCenter
        Width = 70
        BandIndex = 1
        RowIndex = 0
        FieldName = 'REMAIN'
        OnGetText = colRemainGetText
      end
      object colAtWH: TdxDBGridColumn
        Alignment = taRightJustify
        HeaderAlignment = taCenter
        Visible = False
        Width = 70
        BandIndex = 1
        RowIndex = 0
        OnGetText = colAtWHGetText
      end
      object colFree: TdxDBGridColumn
        Tag = 1
        Caption = #1057#1074#1086#1073#1086#1076#1085#1086
        HeaderAlignment = taCenter
        Width = 70
        BandIndex = 1
        RowIndex = 0
        FieldName = 'REMAIN'
        OnGetText = colFreeGetText
      end
      object colReserved: TdxDBGridColumn
        Tag = 1
        Caption = #1056#1077#1079#1077#1088#1074
        HeaderAlignment = taCenter
        Width = 65
        BandIndex = 1
        RowIndex = 0
        FieldName = 'reserved'
        OnGetText = colReservedGetText
      end
      object colInWay: TdxDBGridColumn
        Alignment = taRightJustify
        HeaderAlignment = taCenter
        Visible = False
        Width = 70
        BandIndex = 1
        RowIndex = 0
        OnGetText = colInWayGetText
      end
      object colMinReserv: TdxDBGridColumn
        Tag = 1
        HeaderAlignment = taCenter
        Visible = False
        Width = 70
        BandIndex = 2
        RowIndex = 0
        FieldName = 'minreserv'
        OnGetText = colReservedGetText
      end
      object colMinRsvNeeded: TdxDBGridColumn
        Tag = 1
        HeaderAlignment = taCenter
        Visible = False
        Width = 70
        BandIndex = 2
        RowIndex = 0
        FieldName = 'minrsvneeded'
        OnGetText = colReservedGetText
      end
      object colOrdered: TdxDBGridColumn
        Tag = 1
        Alignment = taRightJustify
        HeaderAlignment = taCenter
        Visible = False
        Width = 70
        BandIndex = 3
        RowIndex = 0
        FieldName = 'ordered'
      end
      object colOrdRsv: TdxDBGridColumn
        Tag = 1
        Caption = #1056#1077#1079#1077#1088#1074
        HeaderAlignment = taCenter
        Visible = False
        BandIndex = 3
        RowIndex = 0
        FieldName = 'orsv'
      end
      object colOrdFree: TdxDBGridColumn
        Tag = 1
        Caption = #1057#1074#1086#1073#1086#1076#1085#1086
        HeaderAlignment = taCenter
        Visible = False
        BandIndex = 3
        RowIndex = 0
        FieldName = 'ofree'
      end
      object colTRemain: TdxDBGridColumn
        Tag = 1
        HeaderAlignment = taCenter
        Visible = False
        BandIndex = 4
        RowIndex = 0
        FieldName = 'tremain'
      end
      object colTFree: TdxDBGridColumn
        Tag = 1
        HeaderAlignment = taCenter
        Visible = False
        BandIndex = 4
        RowIndex = 0
        FieldName = 'tfree'
      end
      object colTRsv: TdxDBGridColumn
        Tag = 1
        HeaderAlignment = taCenter
        Visible = False
        BandIndex = 4
        RowIndex = 0
        FieldName = 'trsv'
      end
      object colAvgPrice: TdxDBGridColumn
        Tag = 1
        HeaderAlignment = taCenter
        Visible = False
        Width = 70
        BandIndex = 1
        RowIndex = 0
        FieldName = 'AVGPRICE'
        OnGetText = colAvgPriceGetText
      end
    end
    object panFooter: TPanel
      Left = 0
      Top = 75
      Width = 435
      Height = 30
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      object ssBevel4: TssBevel
        Left = 0
        Top = 0
        Width = 3
        Height = 29
        Align = alLeft
        ColorGrBegin = clBtnFace
        ColorGrEnd = clBtnFace
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = [beLeft]
        GradientDirection = gdHorizontal
        HotTrack = False
        ImageIndex = 0
        Style = bsSingle
        UseGradient = False
      end
      object lCount: TLabel
        Left = 9
        Top = 7
        Width = 110
        Height = 13
        Alignment = taRightJustify
        Caption = #1042#1089#1077#1075#1086' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1081':'
      end
      object txtCount: TssBevel
        Left = 122
        Top = 6
        Width = 71
        Height = 16
        Alignments.Horz = taRightJustify
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
        Margins.Right = 2
        UseGradient = True
        WordBreak = False
      end
      object ssBevel19: TssBevel
        Left = 432
        Top = 0
        Width = 3
        Height = 29
        Align = alRight
        ColorGrBegin = clBtnFace
        ColorGrEnd = clBtnFace
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = [beRight]
        GradientDirection = gdHorizontal
        HotTrack = False
        ImageIndex = 0
        Style = bsSingle
        UseGradient = False
      end
      object ssBevel20: TssBevel
        Left = 0
        Top = 29
        Width = 435
        Height = 1
        Align = alBottom
        ColorGrBegin = clBtnFace
        ColorGrEnd = clBtnFace
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = [beBottom]
        GradientDirection = gdHorizontal
        HotTrack = False
        ImageIndex = 0
        Style = bsSingle
        UseGradient = False
      end
      object panSummary: TPanel
        Left = 21
        Top = 0
        Width = 411
        Height = 29
        Align = alRight
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          411
          29)
        object lTotalMat: TLabel
          Left = 6
          Top = 7
          Width = 45
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = #1054#1089#1090#1072#1090#1086#1082':'
        end
        object txtTotal: TssBevel
          Left = 54
          Top = 6
          Width = 78
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
          ParentShowHint = False
          ShowHint = True
          UseGradient = True
        end
        object lFreeMat: TLabel
          Left = 145
          Top = 7
          Width = 52
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = #1057#1074#1086#1073#1086#1076#1085#1086':'
        end
        object txtFree: TssBevel
          Left = 200
          Top = 6
          Width = 79
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
          ParentShowHint = False
          ShowHint = True
          UseGradient = True
        end
        object lRsv: TLabel
          Left = 296
          Top = 7
          Width = 40
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = #1056#1077#1079#1077#1088#1074':'
        end
        object txtRsv: TssBevel
          Left = 339
          Top = 6
          Width = 68
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
          ParentShowHint = False
          ShowHint = True
          UseGradient = True
        end
        object ssBevel22: TssBevel
          Left = 0
          Top = 0
          Width = 1
          Height = 29
          Align = alLeft
          ColorGrBegin = clBtnFace
          ColorGrEnd = clBtnFace
          ColorInner = clBtnShadow
          ColorOuter = clBtnShadow
          Edges = [beLeft]
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          UseGradient = False
        end
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
      TabOrder = 2
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
      object ssBevel12: TssBevel
        Left = 0
        Top = 1
        Width = 3
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
        Left = 434
        Top = 1
        Width = 1
        Height = 28
        Align = alRight
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
      object btnKagent: TssSpeedButton
        Left = 505
        Top = 5
        Width = 21
        Height = 21
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        ButtonType = ssbtStandard
        Checked = False
        DisabledImages = dmData.Images18x18dis
        GroupIndex = 0
        ImageIndex = 28
        Images = dmData.Images18x18
        LeftMargin = 2
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
        OnClick = btnKagentClick
      end
      object lFromDate: TssLabel
        Left = 30
        Top = 9
        Width = 7
        Height = 13
        Alignment = taRightJustify
        Caption = #1057
        Enabled = False
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object lToDate: TssLabel
        Left = 141
        Top = 9
        Width = 14
        Height = 13
        Caption = #1055#1086
        Enabled = False
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object lKAgent: TssLabel
        Left = 265
        Top = 9
        Width = 75
        Height = 13
        Alignment = taRightJustify
        Caption = #1055#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082':'
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object edFromDate: TcxDateEdit
        Left = 43
        Top = 3
        Width = 90
        Height = 24
        BeepOnEnter = False
        Enabled = False
        ImeName = 'Russian'
        ParentFont = False
        Properties.ReadOnly = False
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        Style.StyleController = dmData.scMain
        TabOrder = 0
      end
      object edToDate: TcxDateEdit
        Left = 177
        Top = 3
        Width = 84
        Height = 24
        BeepOnEnter = False
        Enabled = False
        ImeName = 'Russian'
        ParentFont = False
        Properties.ReadOnly = False
        Style.LookAndFeel.Kind = lfFlat
        Style.LookAndFeel.NativeStyle = False
        Style.StyleController = dmData.scMain
        TabOrder = 1
      end
      object lcbKAgent: TssDBLookupCombo
        Left = 359
        Top = 3
        Width = 145
        Height = 24
        ImeName = 'Russian'
        ParentFont = False
        Properties.DropDownListStyle = lsEditFixedList
        Properties.Items.Strings = (
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>'
          '<>')
        Properties.OnChange = lcbKAgentPropertiesChange
        Properties.OnEditValueChanged = lcbKAgentPropertiesEditValueChanged
        Properties.OnInitPopup = lcbKAgentPropertiesInitPopup
        Style.StyleController = dmData.scMain
        TabOrder = 2
        Text = '<>'
        DisplayEmpty = '<>'
        EmptyValue = 0
        KeyField = 'kaid'
        ListField = 'name'
        ListSource = srcKAgent
      end
    end
  end
  inherited ActionList: TActionList
    OnUpdate = ActionListUpdate
    Top = 184
    object aMatMove: TAction [11]
      Category = 'All'
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1076#1074#1080#1078#1077#1085#1080#1080' '#1090#1086#1074#1072#1088#1072
      ImageIndex = 61
      ShortCut = 16461
      OnExecute = aMatMoveExecute
    end
    object aShowNull: TAction [12]
      Category = 'All'
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1085#1091#1083#1077#1074#1099#1077' '#1087#1086#1079#1080#1094#1080#1080
      OnExecute = aShowNullExecute
    end
    object aMatRsv: TAction
      Category = 'All'
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1088#1077#1079#1077#1088#1074#1077' '#1090#1086#1074#1072#1088#1072
      ImageIndex = 100
      ShortCut = 16466
      OnExecute = aMatRsvExecute
    end
    object aMatInfo: TAction
      Category = 'All'
      Caption = 'aMatInfo'
      ImageIndex = 99
      ShortCut = 16457
      OnExecute = aMatInfoExecute
    end
    object aRecalc: TAction
      Category = 'All'
      Caption = 'aRecalc'
      OnExecute = aRecalcExecute
    end
    object aRecalcAll: TAction
      Category = 'All'
      Caption = 'aRecalcAll'
      OnExecute = aRecalcExecute
    end
    object aShowMCList: TAction
      Category = 'All'
      Caption = 'aShowMCList'
      ImageIndex = 153
      ShortCut = 16462
      OnExecute = aShowMCListExecute
    end
    object aMCJump: TAction
      Category = 'All'
      Caption = 'aMCJump'
      OnExecute = aMCJumpExecute
    end
    object aDetColParams: TAction
      Category = 'All'
      Caption = 'aDetColParams'
      OnExecute = aDetColParamsExecute
    end
    object aGotoDoc: TAction
      Category = 'All'
      Caption = 'aGotoDoc'
      ImageIndex = 168
      OnExecute = aGotoDocExecute
    end
    object aShowNullPos: TAction
      Category = 'All'
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1087#1072#1088#1090#1080#1080' '#1089' '#1085#1091#1083#1077#1074#1099#1084' '#1086#1089#1090#1072#1090#1082#1086#1084
      OnExecute = aShowNullPosExecute
    end
    object aCreateAccOut: TAction
      Category = 'All'
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1089#1095#1105#1090'...'
      ImageIndex = 112
      OnExecute = aCreateAccOutExecute
    end
    object aCreateWBOut: TAction
      Category = 'All'
      Caption = #1054#1090#1075#1088#1091#1079#1080#1090#1100' '#1090#1086#1074#1072#1088'...'
      ImageIndex = 62
      OnExecute = aCreateWBOutExecute
    end
    object aCreateWriteOff: TAction
      Category = 'All'
      Caption = #1057#1087#1080#1089#1072#1090#1100' '#1090#1086#1074#1072#1088'...'
      ImageIndex = 125
      OnExecute = aCreateWriteOffExecute
    end
    object aCreateWBMove: TAction
      Category = 'All'
      Caption = #1055#1077#1088#1077#1084#1077#1089#1090#1080#1090#1100' '#1090#1086#1074#1072#1088'...'
      ImageIndex = 98
      OnExecute = aCreateWBMoveExecute
    end
    object aRePosting: TAction
      Tag = 1
      Category = 'All'
      Caption = #1057#1087#1080#1089#1072#1090#1100' '#1074#1077#1089#1100' '#1090#1086#1074#1072#1088' '#1086' '#1086#1087#1088#1080#1093#1086#1076#1086#1074#1072#1090#1100' '#1090#1077#1082#1091#1097#1077#1081' '#1076#1072#1090#1086#1081
      OnExecute = aWriteOffAllExecute
    end
    object aAddFunctions: TAction
      Category = 'All'
      Caption = 'aAddFunctions'
      OnExecute = aAddFunctionsExecute
    end
    object aWriteOffAll: TAction
      Category = 'All'
      Caption = #1057#1087#1080#1089#1072#1090#1100' '#1074#1077#1089#1100' '#1090#1086#1074#1072#1088
      OnExecute = aWriteOffAllExecute
    end
    object aMatsDel: TAction
      Category = 'Mats'
      Caption = 'aMatsDel'
      ImageIndex = 5
      ShortCut = 8238
      OnExecute = aMatsDelExecute
    end
    object aMatsSelectAll: TAction
      Category = 'Mats'
      Caption = 'aMatsSelectAll'
      OnExecute = aMatsSelectAllExecute
    end
    object aMatsColOptions: TAction
      Category = 'Mats'
      Caption = 'aMatsColOptions'
      OnExecute = aMatsColOptionsExecute
    end
    object aOColOptions: TAction
      Category = 'Ordered'
      Caption = 'aOColOptions'
      OnExecute = aOColOptionsExecute
    end
    object aGotoOrder: TAction
      Caption = 'aGotoOrder'
      ImageIndex = 168
      OnExecute = aGotoOrderExecute
    end
    object aOrder: TAction
      Category = 'Ordered'
      Caption = 'aOrder'
      ImageIndex = 203
      OnExecute = aOrderExecute
    end
    object aOrderMinRsv: TAction
      Category = 'All'
      Caption = 'aOrderMinRsv'
      OnExecute = aOrderMinRsvExecute
    end
    object aMCColOptions: TAction
      Caption = 'aMCColOptions'
      OnExecute = aMCColOptionsExecute
    end
  end
  inherited pmMain: TTBPopupMenu
    Left = 92
    Top = 32
  end
  object cdsView: TssClientDataSet
    Aggregates = <
      item
        Active = True
        AggregateName = 'aggTotal'
        Expression = 'sum(remain)'
        Visible = False
      end
      item
        Active = True
        AggregateName = 'aggRsv'
        Expression = 'sum(reserved)'
        Visible = False
      end>
    AggregatesActive = True
    FilterOptions = [foCaseInsensitive]
    Params = <
      item
        DataType = ftUnknown
        Name = 'grpid'
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
        Name = 'ondate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'getempty'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'wh'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'allwh'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'showallmats'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'grp'
        ParamType = ptUnknown
      end>
    ProviderName = 'pWMat_ListNew'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsViewBeforeOpen
    AfterOpen = cdsViewAfterOpen
    OnCalcFields = cdsViewCalcFields
    Macros = <>
    Left = 8
    Top = 80
    object cdsViewMATID: TIntegerField
      FieldName = 'MATID'
    end
    object cdsViewREMAIN: TFloatField
      FieldName = 'REMAIN'
    end
    object cdsViewRSV: TFloatField
      FieldName = 'RSV'
    end
    object cdsViewMATNAME: TStringField
      FieldName = 'MATNAME'
      Size = 128
    end
    object cdsViewMSRNAME: TStringField
      FieldName = 'MSRNAME'
      Size = 10
    end
    object cdsViewARTIKUL: TStringField
      FieldName = 'ARTIKUL'
      Size = 128
    end
    object cdsViewAVGPRICE: TFloatField
      FieldName = 'AVGPRICE'
    end
    object cdsViewreserved: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'reserved'
    end
    object cdsViewNUM: TIntegerField
      FieldName = 'NUM'
    end
    object cdsViewBARCODE: TStringField
      FieldName = 'BARCODE'
      Size = 128
    end
    object cdsViewCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Size = 128
    end
    object cdsViewPRODUCER: TStringField
      FieldName = 'PRODUCER'
      Size = 255
    end
    object cdsViewminreserv: TFloatField
      FieldName = 'minreserv'
    end
    object cdsViewminrsvneeded: TFloatField
      FieldKind = fkCalculated
      FieldName = 'minrsvneeded'
      Calculated = True
    end
    object cdsViewordered: TFloatField
      FieldName = 'ordered'
    end
    object cdsVieworsv: TFloatField
      FieldName = 'orsv'
    end
    object cdsViewofree: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'ofree'
    end
    object cdsViewtremain: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'tremain'
    end
    object cdsViewtrsv: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'trsv'
    end
    object cdsViewtfree: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'tfree'
    end
    object cdsViewisserial: TIntegerField
      FieldName = 'isserial'
    end
    object cdsViewprices: TStringField
      FieldName = 'prices'
      Size = 255
    end
  end
  object cdsWHouse: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'matid'
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
        Name = 'ondate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'wh'
        ParamType = ptUnknown
      end>
    ProviderName = 'pWMat_WHouseListNew'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsWHouseBeforeOpen
    AfterOpen = cdsWHouseAfterOpen
    OnCalcFields = cdsWHouseCalcFields
    Macros = <>
    Left = 168
    Top = 216
    object cdsWHouseREMAIN: TFloatField
      FieldName = 'REMAIN'
    end
    object cdsWHouseRSV: TFloatField
      FieldName = 'RSV'
    end
    object cdsWHouseWID: TIntegerField
      FieldName = 'WID'
      Required = True
    end
    object cdsWHouseNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 64
    end
    object cdsWHousereserved: TFloatField
      FieldKind = fkCalculated
      FieldName = 'reserved'
      Calculated = True
    end
  end
  object srcWHouse: TDataSource
    DataSet = cdsWHouse
    OnDataChange = srcWHouseDataChange
    Left = 200
    Top = 216
  end
  object srcViewEx: TssDataSource
    DataSet = cdsView
    ChangeDelay = 250
    OnDelayedDataChange = srcViewExDelayedDataChange
    Left = 64
    Top = 80
  end
  object cdsPrice: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'matid'
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
        Name = 'ondate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'getempty'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'wh'
        ParamType = ptUnknown
      end>
    ProviderName = 'pWMat_PriceListNew'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsPriceBeforeOpen
    AfterOpen = cdsPriceAfterOpen
    OnCalcFields = cdsPriceCalcFields
    Macros = <
      item
        DataType = ftString
        Name = 'm'
        ParamType = ptUnknown
      end>
    Left = 492
    Top = 108
    object cdsPriceREMAIN: TFloatField
      FieldName = 'REMAIN'
      Required = True
    end
    object cdsPriceRSV: TFloatField
      FieldName = 'RSV'
      Required = True
    end
    object cdsPricePOSID: TIntegerField
      FieldName = 'POSID'
      Required = True
    end
    object cdsPriceWID: TIntegerField
      FieldName = 'WID'
      Required = True
    end
    object cdsPriceNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 64
    end
    object cdsPriceONDATE: TDateTimeField
      FieldName = 'ONDATE'
      Required = True
    end
    object cdsPricePRICE: TFloatField
      FieldName = 'PRICE'
      Required = True
    end
    object cdsPriceSHORTNAME: TStringField
      FieldName = 'SHORTNAME'
      Required = True
      Size = 3
    end
    object cdsPriceONVALUE: TFloatField
      FieldName = 'ONVALUE'
      Required = True
    end
    object cdsPricereserved: TFloatField
      FieldKind = fkCalculated
      FieldName = 'reserved'
      Calculated = True
    end
    object cdsPriceSN: TStringField
      FieldName = 'SN'
      Size = 64
    end
    object cdsPriceWTYPE: TIntegerField
      FieldName = 'WTYPE'
    end
    object cdsPriceDOCNUM: TStringField
      FieldName = 'DOCNUM'
    end
    object cdsPriceWBILLID: TIntegerField
      FieldName = 'WBILLID'
    end
    object cdsPriceDOCID: TIntegerField
      FieldName = 'DOCID'
    end
    object cdsPriceGTD: TStringField
      FieldName = 'GTD'
      Size = 64
    end
    object cdsPriceCERTNUM: TStringField
      FieldName = 'CERTNUM'
      Size = 64
    end
    object cdsPriceCERTDATE: TDateTimeField
      FieldName = 'CERTDATE'
    end
    object cdsPricePRODUCER: TStringField
      FieldName = 'PRODUCER'
      Size = 64
    end
  end
  object srcPrice: TDataSource
    DataSet = cdsPrice
    OnDataChange = srcPriceDataChange
    Left = 464
    Top = 108
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
    Left = 16
    Top = 184
  end
  object cdsRsv_Temp: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'ondate'
        ParamType = ptInput
      end>
    ProviderName = 'pSysRsv_List'
    RemoteServer = dmData.SConnection
    Macros = <
      item
        DataType = ftString
        Name = 'm'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'remain'
        ParamType = ptUnknown
      end>
    Left = 124
    Top = 84
  end
  object pmAdd: TTBPopupMenu
    Images = dmData.Images
    Left = 160
    Top = 160
    object TBItem5: TTBItem
      Action = aMatMove
    end
    object TBItem7: TTBItem
      Action = aMatRsv
    end
    object TBItem8: TTBItem
      Action = aMatInfo
    end
    object TBItem12: TTBItem
      Action = aShowMCList
    end
    object TBSeparatorItem4: TTBSeparatorItem
    end
    object TBItem36: TTBItem
      Action = aSelectAll
    end
    object TBSeparatorItem12: TTBSeparatorItem
    end
    object TBItem9: TTBItem
      Action = aRecalc
    end
    object TBItem10: TTBItem
      Action = aRecalcAll
    end
    object TBSeparatorItem3: TTBSeparatorItem
    end
    object TBItem11: TTBItem
      Action = aExcel
      Images = dmData.Images
    end
    object TBSubmenuItem1: TTBSubmenuItem
      Action = aAddFunctions
      object TBItem29: TTBItem
        Action = aWriteOffAll
      end
      object TBItem24: TTBItem
        Action = aRePosting
        Visible = False
      end
      object TBItem34: TTBItem
        Action = aOrderMinRsv
      end
    end
    object TBSeparatorItem5: TTBSeparatorItem
    end
    object TBItem16: TTBItem
      Action = aShowFilter
    end
    object TBItem6: TTBItem
      Action = aShowNull
    end
    object TBItem23: TTBItem
      Action = aColParams
    end
  end
  object mdMC: TssMemoryData
    FieldDefs = <>
    Left = 180
    Top = 92
    object mdMCmatid: TIntegerField
      FieldName = 'matid'
    end
    object mdMCname: TStringField
      FieldName = 'name'
      Size = 128
    end
    object mdMCartikul: TStringField
      FieldName = 'artikul'
      Size = 128
    end
    object mdMCnotes: TStringField
      FieldName = 'notes'
      Size = 255
    end
    object mdMCtotal: TFloatField
      FieldName = 'total'
    end
    object mdMCfree: TFloatField
      FieldName = 'free'
    end
    object mdMCrsv: TFloatField
      FieldName = 'rsv'
    end
    object mdMCcurrid: TIntegerField
      FieldName = 'currid'
    end
    object mdMConvalue: TFloatField
      FieldName = 'onvalue'
    end
    object mdMCshortname: TStringField
      FieldName = 'shortname'
      Size = 10
    end
    object mdMCondate: TDateTimeField
      FieldName = 'ondate'
    end
    object mdMCprice: TFloatField
      FieldName = 'price'
    end
    object mdMCbarcode: TStringField
      FieldName = 'barcode'
      Size = 255
    end
    object mdMCproducer: TStringField
      FieldName = 'producer'
      Size = 255
    end
    object mdMCcountry: TStringField
      FieldName = 'country'
      Size = 255
    end
    object mdMCmsrname: TStringField
      FieldName = 'msrname'
      Size = 10
    end
    object mdMCgrpname: TStringField
      FieldName = 'grpname'
      Size = 255
    end
  end
  object srcMC: TDataSource
    DataSet = mdMC
    Left = 208
    Top = 92
  end
  object pmMC: TTBPopupMenu
    Images = dmData.Images
    Left = 192
    Top = 160
    object TBItem13: TTBItem
      Action = aMatMove
    end
    object TBItem14: TTBItem
      Action = aMatRsv
    end
    object TBItem15: TTBItem
      Action = aMatInfo
    end
    object TBSeparatorItem6: TTBSeparatorItem
    end
    object TBItem20: TTBItem
      Action = aMCJump
      ImageIndex = 168
    end
    object TBSeparatorItem11: TTBSeparatorItem
    end
    object TBItem35: TTBItem
      Action = aMCColOptions
    end
  end
  object srcKAgent: TDataSource
    DataSet = cdsKAgent
    Left = 380
    Top = 104
  end
  object cdsKAgent: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'p_KAgentList'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 352
    Top = 104
  end
  object pmPrices: TTBPopupMenu
    Images = dmData.Images
    Left = 228
    Top = 160
    object TBItem17: TTBItem
      Action = aMatMove
    end
    object TBItem18: TTBItem
      Action = aMatRsv
    end
    object TBItem19: TTBItem
      Action = aMatInfo
    end
    object sepCreateAcc: TTBSeparatorItem
    end
    object itmCreateAcc: TTBItem
      Action = aCreateAccOut
    end
    object TBItem28: TTBItem
      Action = aCreateWBOut
    end
    object TBItem27: TTBItem
      Action = aCreateWBMove
    end
    object TBItem26: TTBItem
      Action = aCreateWriteOff
    end
    object TBSeparatorItem7: TTBSeparatorItem
    end
    object TBItem22: TTBItem
      Action = aGotoDoc
    end
    object TBSeparatorItem8: TTBSeparatorItem
    end
    object TBItem21: TTBItem
      Action = aDetColParams
    end
    object TBItem25: TTBItem
      Action = aShowNullPos
    end
  end
  object mdMats: TssMemoryData
    FieldDefs = <>
    OnCalcFields = mdMatsCalcFields
    Left = 396
    Top = 173
    object mdMatsmatid: TIntegerField
      FieldName = 'matid'
    end
    object mdMatsname: TStringField
      FieldName = 'name'
      Size = 255
    end
    object mdMatsamount: TFloatField
      FieldName = 'amount'
    end
    object mdMatsprice: TFloatField
      FieldName = 'price'
    end
    object mdMatsartikul: TStringField
      FieldName = 'artikul'
      Size = 255
    end
    object mdMatsmid: TIntegerField
      FieldName = 'mid'
    end
    object mdMatsmsrname: TStringField
      FieldName = 'msrname'
      Size = 5
    end
    object mdMatsproducer: TStringField
      FieldName = 'producer'
      Size = 255
    end
    object mdMatsbarcode: TStringField
      FieldName = 'barcode'
      Size = 64
    end
    object mdMatsposid: TIntegerField
      FieldName = 'posid'
    end
    object mdMatsptypeid: TIntegerField
      FieldName = 'ptypeid'
    end
    object mdMatsptypename: TStringField
      FieldKind = fkLookup
      FieldName = 'ptypename'
      LookupDataSet = cdsPriceTypes
      LookupKeyFields = 'ptypeid'
      LookupResultField = 'name'
      KeyFields = 'ptypeid'
      Size = 64
      Lookup = True
    end
    object mdMatsdiscount: TFloatField
      FieldName = 'discount'
    end
    object mdMatswid: TIntegerField
      FieldName = 'wid'
    end
    object mdMatswhname: TStringField
      FieldKind = fkLookup
      FieldName = 'whname'
      LookupDataSet = cdsWH
      LookupKeyFields = 'WID'
      LookupResultField = 'NAME'
      KeyFields = 'wid'
      Size = 64
      Lookup = True
    end
    object mdMatsfullprice: TFloatField
      FieldName = 'fullprice'
    end
    object mdMatssumm: TFloatField
      FieldKind = fkCalculated
      FieldName = 'summ'
      Calculated = True
    end
    object mdMatsnds: TFloatField
      FieldName = 'nds'
    end
  end
  object srcMats: TDataSource
    DataSet = mdMats
    Left = 424
    Top = 173
  end
  object pmMats: TTBPopupMenu
    Images = dmData.Images
    Left = 572
    Top = 92
    object itmDefPT: TTBSubmenuItem
      Caption = #1058#1077#1082#1091#1097#1072#1103' '#1094#1077#1085#1086#1074#1072#1103' '#1082#1072#1090#1077#1075#1086#1088#1080#1103': '#1056#1086#1079#1085#1080#1094#1072
    end
    object TBSeparatorItem10: TTBSeparatorItem
    end
    object TBItem30: TTBItem
      Action = aMatsSelectAll
    end
    object TBItem31: TTBItem
      Action = aMatsDel
    end
    object TBSeparatorItem9: TTBSeparatorItem
    end
    object TBItem32: TTBItem
      Action = aMatsColOptions
    end
  end
  object cdsPriceTypes: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'matid'
        ParamType = ptUnknown
      end>
    ProviderName = 'pPriceTypes_List'
    RemoteServer = dmData.SConnection
    AfterOpen = cdsPriceTypesAfterOpen
    Macros = <>
    Left = 600
    Top = 92
  end
  object cdsWH: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'matid'
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
        Name = 'ondate'
        ParamType = ptUnknown
      end>
    ProviderName = 'pWHouse_List'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsWHBeforeOpen
    AfterOpen = cdsWHAfterOpen
    Macros = <
      item
        DataType = ftString
        Name = 'm'
        ParamType = ptInput
      end>
    Left = 332
    Top = 176
  end
  object cdsOrdered: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'matid'
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
        Name = 'ondate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'getempty'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'wh'
        ParamType = ptUnknown
      end>
    ProviderName = 'pWMat_Get_Ordered'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsOrderedBeforeOpen
    AfterOpen = cdsOrderedAfterOpen
    OnCalcFields = cdsOrderedCalcFields
    Macros = <>
    Left = 552
    Top = 173
    object cdsOrderedPOSID: TIntegerField
      FieldName = 'POSID'
    end
    object cdsOrderedREMAIN: TFloatField
      FieldName = 'REMAIN'
    end
    object cdsOrderedORDERED: TFloatField
      FieldName = 'ORDERED'
    end
    object cdsOrderedRSV: TFloatField
      FieldName = 'RSV'
    end
    object cdsOrderedWID: TIntegerField
      FieldName = 'WID'
    end
    object cdsOrderedNAME: TStringField
      FieldName = 'NAME'
      Size = 128
    end
    object cdsOrderedONDATE: TDateTimeField
      FieldName = 'ONDATE'
    end
    object cdsOrderedTODATE: TDateTimeField
      FieldName = 'TODATE'
    end
    object cdsOrderedPRICE: TFloatField
      FieldName = 'PRICE'
    end
    object cdsOrderedCURRID: TIntegerField
      FieldName = 'CURRID'
    end
    object cdsOrderedSHORTNAME: TStringField
      FieldName = 'SHORTNAME'
      Size = 10
    end
    object cdsOrderedONVALUE: TFloatField
      FieldName = 'ONVALUE'
    end
    object cdsOrderedWTYPE: TIntegerField
      FieldName = 'WTYPE'
    end
    object cdsOrderedDOCNUM: TStringField
      FieldName = 'DOCNUM'
    end
    object cdsOrderedWBILLID: TIntegerField
      FieldName = 'WBILLID'
    end
    object cdsOrderedDOCID: TIntegerField
      FieldName = 'DOCID'
    end
    object cdsOrderedkaname: TStringField
      FieldName = 'kaname'
      Size = 255
    end
    object cdsOrderedreserved: TFloatField
      FieldKind = fkCalculated
      FieldName = 'reserved'
      Calculated = True
    end
  end
  object srcOrdered: TDataSource
    DataSet = cdsOrdered
    OnDataChange = srcOrderedDataChange
    Left = 524
    Top = 173
  end
  object pmOrdered: TTBPopupMenu
    Images = dmData.Images
    Left = 256
    Top = 160
    object TBItem33: TTBItem
      Action = aOrder
    end
    object TBItem40: TTBItem
      Action = aGotoOrder
    end
    object TBSeparatorItem13: TTBSeparatorItem
    end
    object TBItem41: TTBItem
      Action = aOColOptions
    end
  end
  object cdsPT: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pPriceTypes_List'
    RemoteServer = dmData.SConnection
    AfterOpen = cdsPTAfterOpen
    Macros = <
      item
        DataType = ftString
        Name = 'grp'
        ParamType = ptUnknown
      end>
    Left = 284
    Top = 96
  end
end
