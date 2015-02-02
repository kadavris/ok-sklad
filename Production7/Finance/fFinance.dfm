inherited fmFinance: TfmFinance
  object Splitter2: TSplitter [0]
    Left = 0
    Top = 6
    Width = 435
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object panMain: TPanel [1]
    Left = 0
    Top = 0
    Width = 435
    Height = 6
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 220
      Top = 0
      Width = 4
      Height = 6
      Align = alRight
    end
    object panSaldo: TPanel
      Left = 224
      Top = 0
      Width = 211
      Height = 6
      Align = alRight
      BevelOuter = bvNone
      Color = clWindow
      ParentBackground = False
      TabOrder = 0
      object ssBevel8: TssBevel
        Left = 210
        Top = 19
        Width = 1
        Height = 161
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
      object ssBevel2: TssBevel
        Left = 0
        Top = 19
        Width = 1
        Height = 161
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
      object txtSaldoDate: TssBevel
        Left = 0
        Top = 0
        Width = 211
        Height = 19
        Align = alTop
        Caption = ' '#1054#1089#1090#1072#1090#1082#1080' '#1085#1072' 10 '#1072#1087#1088#1077#1083#1103' 2004 '#1075
        ColorGrBegin = clBtnFace
        ColorGrEnd = clBtnFace
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = [beLeft, beRight, beTop, beBottom]
        GradientDirection = gdHorizontal
        HotTrack = False
        ImageIndex = 0
        Style = bsSingle
        UseGradient = True
      end
      object txtSaldoNA: TssBevel
        Left = 1
        Top = 19
        Width = 209
        Height = 161
        Align = alClient
        Alignments.Horz = taCenter
        Caption = ' '#1054#1089#1090#1072#1090#1082#1080' '#1085#1072' 10 '#1072#1087#1088#1077#1083#1103' 2004 '#1075
        ColorGrBegin = clBtnFace
        ColorGrEnd = clBtnFace
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        GradientDirection = gdHorizontal
        HotTrack = False
        ImageIndex = 0
        Style = bsSingle
        UseGradient = False
      end
      object ssBevel10: TssBevel
        Left = 0
        Top = 5
        Width = 211
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
      object inspCurr: TdxInspector
        Left = 1
        Top = 19
        Width = 209
        Height = 161
        Align = alClient
        BorderStyle = bsNone
        Color = clWindow
        DragMode = dmAutomatic
        TabOrder = 0
        OnDragDrop = inspCurrDragDrop
        OnDragOver = inspCurrDragOver
        OnStartDrag = inspCurrStartDrag
        DividerPos = 101
        GridColor = clBtnFace
        Flat = True
        Options = [ioAutoWidth, ioBandSizing, ioColumnSizing, ioDynamicColumnSizing]
        PaintStyle = ipsSimple
        OnDrawCaption = inspCurrDrawCaption
        OnDrawValue = inspCurrDrawValue
        Data = {
          380000000200000008000000000000000C000000696E737043757272526F7731
          08000000000000000C000000696E737043757272526F773200000000}
        object inspCurrRow1: TdxInspectorTextRow
          Alignment = taRightJustify
          Caption = 'EUR'
          Text = '1 123,78 '
        end
        object inspCurrRow2: TdxInspectorTextRow
          Alignment = taRightJustify
          Caption = 'USD'
          ReadOnly = True
          Text = '10 023,50 '
        end
      end
      object panCurrTotal: TPanel
        Left = 0
        Top = -25
        Width = 211
        Height = 30
        Align = alBottom
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 1
        DesignSize = (
          211
          30)
        object lTotal: TLabel
          Left = 8
          Top = 9
          Width = 39
          Height = 13
          Anchors = [akLeft, akBottom]
          Caption = #1048#1090#1086#1075#1086' '#1074
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object txtTotal: TssBevel
          Left = 112
          Top = 6
          Width = 93
          Height = 19
          Alignments.Horz = taRightJustify
          Anchors = [akLeft, akRight, akBottom]
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
          Style = bsSingle
          UseGradient = True
        end
        object ssBevel11: TssBevel
          Left = 0
          Top = 1
          Width = 1
          Height = 29
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
        object ssBevel13: TssBevel
          Left = 210
          Top = 1
          Width = 1
          Height = 29
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
        object ssBevel1: TssBevel
          Left = 0
          Top = 0
          Width = 211
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
        object lcbCurrency: TssDBLookupCombo
          Left = 56
          Top = 5
          Width = 53
          Height = 24
          Anchors = [akLeft, akBottom]
          ImeName = 'Russian'
          ParentFont = False
          Properties.DropDownListStyle = lsEditFixedList
          Properties.OnEditValueChanged = lcbCurrencyPropertiesEditValueChanged
          Style.StyleController = dmData.scMain
          TabOrder = 0
          EmptyValue = 0
          KeyField = 'currid'
          ListField = 'shortname'
          ListSource = srcCurr
        end
      end
    end
    object panData: TPanel
      Left = 0
      Top = 0
      Width = 220
      Height = 6
      Align = alClient
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      object pcFin: TcxPageControl
        Left = 0
        Top = 0
        Width = 220
        Height = 6
        ActivePage = tsFinance
        Align = alClient
        TabOrder = 0
        TabPosition = tpBottom
        OnChange = pcFinChange
        object tsFinance: TcxTabSheet
          Caption = #1060#1080#1085#1072#1085#1089#1099
          ImageIndex = 0
          object tlMain: TdxDBTreeList
            Left = 0
            Top = 0
            Width = 220
            Height = 0
            DrawDragFrame = False
            Bands = <
              item
              end>
            DefaultLayout = True
            HeaderPanelRowCount = 1
            KeyField = 'id'
            ParentField = 'pid'
            Align = alClient
            DragMode = dmAutomatic
            PopupMenu = pmMain
            TabOrder = 0
            OnDblClick = tlMainDblClick
            OnDragDrop = tlMainDragDrop
            OnDragOver = tlMainDragOver
            OnKeyDown = tlMainKeyDown
            OnStartDrag = tlMainStartDrag
            DataSource = srcMain
            DblClkExpanding = False
            GridLineColor = clBtnFace
            HideFocusRect = True
            HideSelectionColor = clBtnShadow
            HideSelectionTextColor = clWindow
            ImageIndexFieldName = 'iindex'
            Images = dmData.Images
            LookAndFeel = lfUltraFlat
            OptionsBehavior = [etoAutoSort, etoDblClick, etoDragExpand, etoImmediateEditor, etoTabThrough]
            OptionsView = [etoAutoWidth, etoBandHeaderWidth, etoHideFocusRect, etoRowSelect, etoUseBitmap, etoUseImageIndexForSelected]
            ShowButtons = False
            ShowGrid = True
            ShowLines = False
            TreeLineColor = clGrayText
            OnChangeNode = tlMainChangeNode
            OnCustomDrawCell = tlMainCustomDrawCell
            object colName: TdxDBTreeListColumn
              HeaderAlignment = taCenter
              Width = 155
              BandIndex = 0
              RowIndex = 0
              FieldName = 'name'
            end
            object colSaldo: TdxDBTreeListCurrencyColumn
              HeaderAlignment = taCenter
              Sorted = csDown
              Width = 71
              BandIndex = 0
              RowIndex = 0
              OnCustomDrawCell = colSaldoCustomDrawCell
              FieldName = 'saldo'
              OnGetText = colSaldoGetText
              DisplayFormat = ',0.00'
              Nullable = False
            end
            object colID: TdxDBTreeListColumn
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'id'
            end
          end
        end
        object tsActives: TcxTabSheet
          Caption = #1040#1082#1090#1080#1074#1099
          ImageIndex = 1
          object tlActives: TdxDBTreeList
            Left = 0
            Top = 0
            Width = 714
            Height = 297
            DrawDragFrame = False
            Bands = <
              item
              end>
            DefaultLayout = True
            HeaderPanelRowCount = 1
            KeyField = 'id'
            ParentField = 'pid'
            Align = alClient
            PopupMenu = pmActives
            TabOrder = 0
            DataSource = srcActives
            DblClkExpanding = False
            GridLineColor = clBtnFace
            HideFocusRect = True
            HideSelectionColor = clBtnShadow
            HideSelectionTextColor = clWindow
            ImageIndexFieldName = 'iindex'
            Images = dmData.Images
            LookAndFeel = lfUltraFlat
            OptionsBehavior = [etoAutoSort, etoDblClick, etoDragExpand, etoImmediateEditor, etoTabThrough]
            OptionsView = [etoAutoWidth, etoBandHeaderWidth, etoHideFocusRect, etoRowSelect, etoUseBitmap, etoUseImageIndexForSelected]
            ShowButtons = False
            ShowGrid = True
            ShowLines = False
            TreeLineColor = clGrayText
            OnChangeNode = tlActivesChangeNode
            OnColumnSorting = tlActivesColumnSorting
            OnCustomDrawCell = tlActivesCustomDrawCell
            object colActName: TdxDBTreeListColumn
              Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1088#1072#1079#1076#1077#1083#1072
              HeaderAlignment = taCenter
              Width = 155
              BandIndex = 0
              RowIndex = 0
              FieldName = 'name'
            end
            object colActSaldo: TdxDBTreeListCurrencyColumn
              Caption = #1057#1091#1084#1084#1072
              HeaderAlignment = taCenter
              Width = 71
              BandIndex = 0
              RowIndex = 0
              OnCustomDrawCell = colSaldoCustomDrawCell
              FieldName = 'saldo'
              OnGetText = colSaldoGetText
              DisplayFormat = ',0.00'
              Nullable = False
            end
            object colActID: TdxDBTreeListColumn
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'id'
            end
          end
        end
      end
    end
  end
  object pcMain: TcxPageControl [2]
    Left = 0
    Top = 9
    Width = 435
    Height = 257
    ActivePage = tsTurnover
    Align = alBottom
    Images = dmData.Images
    TabOrder = 1
    object tsTurnover: TcxTabSheet
      Caption = #1054#1073#1086#1088#1086#1090#1099
      ImageIndex = 165
      object txtTONA: TssBevel
        Left = 0
        Top = 29
        Width = 435
        Height = 204
        Align = alClient
        Alignments.Horz = taCenter
        Caption = ' '#1054#1089#1090#1072#1090#1082#1080' '#1085#1072' 10 '#1072#1087#1088#1077#1083#1103' 2004 '#1075
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
      object grdTurnOver: TssDBGrid
        Left = 0
        Top = 29
        Width = 435
        Height = 204
        Hint = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        DrawDragFrame = False
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'id'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        ParentShowHint = False
        PopupMenu = pmDet
        ShowHint = True
        TabOrder = 0
        DataSource = srcTurnOver
        Filter.Criteria = {00000000}
        HideFocusRect = True
        HideSelectionColor = 10724259
        HighlightColor = clNavy
        LookAndFeel = lfUltraFlat
        OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoStoreToRegistry, edgoTabThrough, edgoVertThrough]
        OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoRowSelect, edgoUseBitmap]
        OnColumnSorting = grdTurnOverColumnSorting
        OnCustomDrawCell = grdTurnOverCustomDrawCell
        LangManager = dmData.Lng
        OnNeedAdjust = grdTurnOverNeedAdjust
        OnGetOptionsTitle = grdTurnOverGetOptionsTitle
        object colTOID: TdxDBGridColumn
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
            '3'
            '4'
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
            '-6'
            '6')
        end
        object colChecked: TdxDBGridImageColumn
          Alignment = taLeftJustify
          MinWidth = 16
          Sizing = False
          Visible = False
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
            '171')
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
          Tag = 1
          Alignment = taRightJustify
          Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          HeaderAlignment = taCenter
          Sorted = csUp
          Width = 70
          BandIndex = 0
          RowIndex = 0
          FieldName = 'num'
        end
        object colOnDate: TdxDBGridColumn
          Tag = 1
          Alignment = taCenter
          Caption = #1044#1072#1090#1072
          HeaderAlignment = taCenter
          Width = 70
          BandIndex = 0
          RowIndex = 0
          FieldName = 'ONDATE'
          OnGetText = colOnDateGetText
        end
        object colChargeType: TdxDBGridColumn
          Tag = 1
          Caption = #1057#1090#1072#1090#1100#1103
          HeaderAlignment = taCenter
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'chargename'
        end
        object colKAName: TdxDBGridColumn
          Tag = 2
          Alignment = taLeftJustify
          Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
          HeaderAlignment = taCenter
          Width = 300
          BandIndex = 0
          RowIndex = 0
          FieldName = 'KANAME'
          OnGetText = colKANameGetText
        end
        object colPayType: TdxDBGridColumn
          Tag = 1
          Caption = #1058#1080#1087' '#1088#1072#1089#1095#1105#1090#1072
          HeaderAlignment = taCenter
          Width = 80
          BandIndex = 0
          RowIndex = 0
          FieldName = 'PTYPENAME'
        end
        object colTotal: TdxDBGridColumn
          Tag = 1
          Alignment = taRightJustify
          Caption = #1057#1091#1084#1084#1072' '#1074' '#1074#1072#1083#1102#1090#1077
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
          Caption = #1057#1091#1084#1084#1072' '#1074' '#1085#1072#1094'. '#1074#1072#1083#1102#1090#1077
          HeaderAlignment = taCenter
          Visible = False
          Width = 95
          BandIndex = 0
          RowIndex = 0
          FieldName = 'TOTALDEF'
          OnGetText = colTotalDefGetText
        end
        object colShortName: TdxDBGridColumn
          Caption = #1042#1072#1083#1102#1090#1072
          HeaderAlignment = taCenter
          Visible = False
          Width = 76
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHORTNAME'
        end
        object colRate: TdxDBGridColumn
          Tag = 1
          Caption = #1050#1091#1088#1089
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
        end
        object colBankName: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'BANKNAME'
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
        DesignSize = (
          435
          29)
        object ssBevel6: TssBevel
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
        object lFromDate: TLabel
          Left = 30
          Top = 9
          Width = 7
          Height = 13
          Alignment = taRightJustify
          Caption = 'C'
        end
        object lToDate: TLabel
          Left = 157
          Top = 9
          Width = 14
          Height = 13
          Alignment = taRightJustify
          Caption = #1055#1086
        end
        object ssBevel7: TssBevel
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
        object ssBevel9: TssBevel
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
          Style = bsSingle
          UseGradient = False
        end
        object lCurr: TLabel
          Left = 665
          Top = 9
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = #1042#1072#1083#1102#1090#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lKAgent: TLabel
          Left = 319
          Top = 9
          Width = 58
          Height = 13
          Alignment = taRightJustify
          Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
        end
        object btnKagent: TssSpeedButton
          Left = 622
          Top = 5
          Width = 21
          Height = 21
          Alignment = taLeftJustify
          AllwaysShowFrame = False
          Anchors = [akTop, akRight]
          ButtonType = ssbtStandard
          Checked = False
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
        object edFromDate: TcxDateEdit
          Left = 40
          Top = 4
          Width = 80
          Height = 24
          BeepOnEnter = False
          ImeName = 'Russian'
          ParentFont = False
          Properties.ReadOnly = False
          Properties.OnChange = edFromDatePropertiesChange
          Properties.OnEditValueChanged = edFromDatePropertiesEditValueChanged
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = False
          Style.StyleController = dmData.scMain
          TabOrder = 0
          OnKeyPress = edFromDateKeyPress
        end
        object edToDate: TcxDateEdit
          Left = 183
          Top = 4
          Width = 80
          Height = 24
          BeepOnEnter = False
          ImeName = 'Russian'
          ParentFont = False
          Properties.ReadOnly = False
          Properties.OnChange = edFromDatePropertiesChange
          Properties.OnEditValueChanged = edFromDatePropertiesEditValueChanged
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = False
          Style.StyleController = dmData.scMain
          TabOrder = 1
          OnKeyPress = edFromDateKeyPress
        end
        object lcbCurr: TssDBLookupCombo
          Left = 713
          Top = 3
          Width = 55
          Height = 24
          ImeName = 'Russian'
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.Items.Strings = (
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077
            #1042#1089#1077)
          Properties.OnEditValueChanged = lcbCurrPropertiesEditValueChanged
          Style.StyleController = dmData.scMain
          Style.ButtonStyle = btsSimple
          TabOrder = 2
          EmptyValue = 0
          KeyField = 'CURRID'
          ListField = 'SHORTNAME'
          ListSource = srcCurr
        end
        object lcbKAgent: TssDBLookupCombo
          Left = 412
          Top = 3
          Width = 205
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
            #1042#1089#1077)
          Properties.OnChange = lcbKAgentPropertiesChange
          Properties.OnEditValueChanged = lcbKAgentPropertiesEditValueChanged
          Properties.OnInitPopup = lcbKAgentPropertiesInitPopup
          Style.StyleController = dmData.scMain
          TabOrder = 3
          EmptyValue = 0
          KeyField = 'kaid'
          ListField = 'name'
          ListSource = srcKAgent
        end
      end
    end
    object tsActChart: TcxTabSheet
      Caption = 'tsActChart'
      ImageIndex = 165
      object panActChartFilter: TPanel
        Left = 0
        Top = 0
        Width = 929
        Height = 31
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        object ssBevel3: TssBevel
          Left = 0
          Top = 0
          Width = 929
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
        object lACFrom: TLabel
          Left = 26
          Top = 9
          Width = 7
          Height = 13
          Alignment = taRightJustify
          Caption = 'C'
        end
        object lACTo: TLabel
          Left = 121
          Top = 9
          Width = 14
          Height = 13
          Alignment = taRightJustify
          Caption = #1055#1086
        end
        object ssBevel4: TssBevel
          Left = 0
          Top = 1
          Width = 5
          Height = 29
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
        object ssBevel5: TssBevel
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
        object ssBevel12: TssBevel
          Left = 928
          Top = 1
          Width = 1
          Height = 29
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
        object ssBevel17: TssBevel
          Left = 0
          Top = 30
          Width = 929
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
        object edACFromDate: TcxDateEdit
          Left = 36
          Top = 5
          Width = 80
          Height = 24
          BeepOnEnter = False
          ImeName = 'Russian'
          Properties.ReadOnly = False
          Properties.OnChange = edFromDatePropertiesChange
          Properties.OnEditValueChanged = edFromDatePropertiesEditValueChanged
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = False
          Style.StyleController = dmData.scMain
          TabOrder = 0
          OnKeyPress = edFromDateKeyPress
        end
        object edACToDate: TcxDateEdit
          Left = 139
          Top = 5
          Width = 80
          Height = 24
          BeepOnEnter = False
          ImeName = 'Russian'
          Properties.ReadOnly = False
          Properties.OnChange = edFromDatePropertiesChange
          Properties.OnEditValueChanged = edFromDatePropertiesEditValueChanged
          Style.LookAndFeel.Kind = lfFlat
          Style.LookAndFeel.NativeStyle = False
          Style.StyleController = dmData.scMain
          TabOrder = 1
          OnKeyPress = edFromDateKeyPress
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 31
        Width = 929
        Height = 202
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 1
        object ssBevel19: TssBevel
          Left = 0
          Top = 201
          Width = 929
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
        object ssBevel18: TssBevel
          Left = 783
          Top = 0
          Width = 1
          Height = 201
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
        object crtActives: TChart
          Left = 0
          Top = 0
          Width = 774
          Height = 201
          AllowPanning = pmNone
          AllowZoom = False
          AnimatedZoom = True
          BackWall.Brush.Color = clWhite
          BackWall.Color = clWindow
          MarginBottom = 2
          MarginLeft = 2
          MarginRight = 2
          MarginTop = 5
          Title.Alignment = taLeftJustify
          Title.Text.Strings = (
            'TChart')
          Title.Visible = False
          BackColor = clWindow
          BottomAxis.DateTimeFormat = 'dd.MM.yyyy'
          LeftAxis.LabelsSeparation = 50
          Legend.Visible = False
          View3D = False
          Align = alClient
          BevelOuter = bvNone
          DragCursor = crDefault
          DragMode = dmAutomatic
          PopupMenu = pmActChart
          TabOrder = 0
          OnDragOver = crtActivesDragOver
          OnStartDrag = crtActivesStartDrag
          object ssBevel14: TssBevel
            Left = 0
            Top = 0
            Width = 2
            Height = 201
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
          object Series1: TLineSeries
            Marks.ArrowLength = 8
            Marks.Style = smsValue
            Marks.Visible = False
            SeriesColor = clBlue
            Title = 'Actives'
            LinePen.Width = 2
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
          object Series2: TLineSeries
            Active = False
            Marks.ArrowLength = 8
            Marks.Visible = False
            SeriesColor = 4227072
            ShowInLegend = False
            Title = 'WHSumm'
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
          object Series3: TLineSeries
            Active = False
            Marks.ArrowLength = 8
            Marks.Visible = False
            SeriesColor = clYellow
            Title = 'Cash'
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
          object Series4: TLineSeries
            Active = False
            Marks.ArrowLength = 8
            Marks.Visible = False
            SeriesColor = clMaroon
            Title = 'Cashless'
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
          object Series5: TLineSeries
            Active = False
            Marks.ArrowLength = 8
            Marks.Visible = False
            SeriesColor = clFuchsia
            Title = 'Debtors'
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
          object Series6: TLineSeries
            Active = False
            Marks.ArrowLength = 8
            Marks.Visible = False
            SeriesColor = clRed
            Title = 'Creditors'
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Multiplier = 1.000000000000000000
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Multiplier = 1.000000000000000000
            YValues.Order = loNone
          end
        end
        object panChartOptions: TPanel
          Left = 784
          Top = 0
          Width = 145
          Height = 201
          Align = alRight
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 1
          DesignSize = (
            145
            201)
          object bvlActives: TssBevel
            Left = 6
            Top = 13
            Width = 10
            Height = 9
            Cursor = crHandPoint
            Color = clBlue
            ColorGrBegin = clBtnFace
            ColorGrEnd = clBtnFace
            ColorInner = clBlue
            ColorOuter = clBlue
            Edges = [beLeft, beRight, beTop, beBottom]
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            ParentColor = False
            UseGradient = False
            OnClick = bvlActivesClick
          end
          object bvlWHSumm: TssBevel
            Tag = 1
            Left = 6
            Top = 30
            Width = 10
            Height = 9
            Cursor = crHandPoint
            Color = clGreen
            ColorGrBegin = clBtnFace
            ColorGrEnd = clBtnFace
            ColorInner = clGreen
            ColorOuter = clGreen
            Edges = [beLeft, beRight, beTop, beBottom]
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            ParentColor = False
            UseGradient = False
            OnClick = bvlActivesClick
          end
          object bvlCash: TssBevel
            Tag = 2
            Left = 6
            Top = 48
            Width = 10
            Height = 9
            Cursor = crHandPoint
            Color = clYellow
            ColorGrBegin = clBtnFace
            ColorGrEnd = clBtnFace
            ColorInner = clYellow
            ColorOuter = clYellow
            Edges = [beLeft, beRight, beTop, beBottom]
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            ParentColor = False
            UseGradient = False
            OnClick = bvlActivesClick
          end
          object bvlCashless: TssBevel
            Tag = 3
            Left = 6
            Top = 67
            Width = 10
            Height = 9
            Cursor = crHandPoint
            Color = clMaroon
            ColorGrBegin = clBtnFace
            ColorGrEnd = clBtnFace
            ColorInner = clMaroon
            ColorOuter = clMaroon
            Edges = [beLeft, beRight, beTop, beBottom]
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            ParentColor = False
            UseGradient = False
            OnClick = bvlActivesClick
          end
          object bvlDebtors: TssBevel
            Tag = 4
            Left = 6
            Top = 86
            Width = 10
            Height = 9
            Cursor = crHandPoint
            Color = clFuchsia
            ColorGrBegin = clBtnFace
            ColorGrEnd = clBtnFace
            ColorInner = clFuchsia
            ColorOuter = clFuchsia
            Edges = [beLeft, beRight, beTop, beBottom]
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            ParentColor = False
            UseGradient = False
            OnClick = bvlActivesClick
          end
          object bvlCreditors: TssBevel
            Tag = 5
            Left = 6
            Top = 105
            Width = 10
            Height = 9
            Cursor = crHandPoint
            Color = clRed
            ColorGrBegin = clBtnFace
            ColorGrEnd = clBtnFace
            ColorInner = clRed
            ColorOuter = clRed
            Edges = [beLeft, beRight, beTop, beBottom]
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            ParentColor = False
            UseGradient = False
            OnClick = bvlActivesClick
          end
          object sldMinMax: TJvxSlider
            Left = 20
            Top = 112
            Width = 124
            Height = 29
            Increment = 1
            Options = [soSmooth]
            TabOrder = 0
            Value = 50
            Anchors = [akLeft, akRight, akBottom]
            OnChange = sldMinMaxChange
          end
          object sldTopBottom: TJvxSlider
            Left = 20
            Top = 140
            Width = 124
            Height = 29
            Increment = 1
            Options = [soSmooth]
            TabOrder = 1
            Value = 50
            Anchors = [akLeft, akRight, akBottom]
            OnChange = sldTopBottomChange
          end
          object chbShowActives: TssCheckBox
            Left = 20
            Top = 7
            Width = 120
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Properties.DisplayUnchecked = 'False'
            Properties.Caption = #1040#1082#1090#1080#1074#1099
            State = cbsChecked
            TabOrder = 2
            ImeName = 'Russian'
            OnClick = chbShowActivesClick
          end
          object chbShowWHSumm: TssCheckBox
            Left = 20
            Top = 24
            Width = 120
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Properties.DisplayUnchecked = 'False'
            Properties.Caption = #1057#1082#1083#1072#1076
            TabOrder = 3
            ImeName = 'Russian'
            OnClick = chbShowWHSummClick
          end
          object chbShowCash: TssCheckBox
            Left = 20
            Top = 42
            Width = 120
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Properties.DisplayUnchecked = 'False'
            Properties.Caption = #1053#1072#1083#1080#1095#1085#1099#1077
            TabOrder = 4
            ImeName = 'Russian'
            OnClick = chbShowCashClick
          end
          object chbShowCashless: TssCheckBox
            Left = 20
            Top = 61
            Width = 120
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Properties.DisplayUnchecked = 'False'
            Properties.Caption = #1041#1077#1079#1085#1072#1083#1080#1095#1085#1099#1077
            TabOrder = 5
            ImeName = 'Russian'
            OnClick = chbShowCashlessClick
          end
          object chbShowDebtors: TssCheckBox
            Left = 20
            Top = 80
            Width = 120
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Properties.DisplayUnchecked = 'False'
            Properties.Caption = #1044#1077#1073#1077#1090#1086#1088#1099
            TabOrder = 6
            ImeName = 'Russian'
            OnClick = chbShowDebtorsClick
          end
          object chbShowCreditors: TssCheckBox
            Left = 20
            Top = 99
            Width = 117
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Properties.DisplayUnchecked = 'False'
            Properties.Caption = #1050#1088#1077#1076#1080#1090#1086#1088#1099
            TabOrder = 7
            ImeName = 'Russian'
            OnClick = chbShowCreditorsClick
          end
          object chbShowGrid: TssCheckBox
            Left = 20
            Top = 165
            Width = 120
            Height = 21
            Anchors = [akLeft, akRight, akBottom]
            Properties.DisplayUnchecked = 'False'
            Properties.Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1089#1077#1090#1082#1091
            State = cbsChecked
            TabOrder = 8
            ImeName = 'Russian'
            OnClick = chbShowGridClick
          end
        end
        object Panel2: TPanel
          Left = -155
          Top = 0
          Width = 9
          Height = 201
          Align = alRight
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 2
          object cxSplitter1: TcxSplitter
            Left = 1
            Top = 0
            Width = 8
            Height = 201
            HotZoneClassName = 'TcxMediaPlayer8Style'
            AlignSplitter = salRight
            AllowHotZoneDrag = False
            MinSize = 100
            Control = panChartOptions
            ShowHint = True
            ParentShowHint = False
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    object aShowCurr: TAction
      Category = 'All'
      Caption = 'aShowCurr'
      Checked = True
    end
    object aRecalc: TAction
      Category = 'All'
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1086#1089#1090#1072#1090#1086#1082
      OnExecute = aRecalcExecute
    end
    object aRecalcAll: TAction
      Tag = 1
      Category = 'All'
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1086#1089#1090#1072#1090#1082#1080' '#1076#1083#1103' '#1074#1089#1077#1093
      OnExecute = aRecalcExecute
    end
    object aGotoDoc: TAction
      Category = 'All'
      Caption = 'aGotoDoc'
      ImageIndex = 168
      OnExecute = aGotoDocExecute
    end
    object aMove: TAction
      Category = 'All'
      Caption = 'aMove'
      ImageIndex = 175
      OnExecute = aMoveExecute
    end
    object aConvert: TAction
      Category = 'All'
      Caption = 'aConvert'
      ImageIndex = 174
      OnExecute = aConvertExecute
    end
    object aCashWithCharge: TAction
      Category = 'All'
      Caption = 'aCashWithCharge'
      ImageIndex = 179
      OnExecute = aCashWithChargeExecute
    end
    object aRecalcActives: TAction
      Category = 'All'
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1072#1082#1090#1080#1074#1099
      OnExecute = aRecalcActivesExecute
    end
    object aRecalcActivesAll: TAction
      Category = 'All'
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1072#1082#1090#1080#1074#1099' '#1079#1072' '#1087#1077#1088#1080#1086#1076'...'
      OnExecute = aRecalcActivesAllExecute
    end
    object aNull: TAction
      Category = 'All'
      Caption = #1057#1087#1080#1089#1072#1090#1100' '#1074#1089#1105
    end
  end
  inherited pmMain: TTBPopupMenu
    OnPopup = pmMainPopup
    inherited TBItem1: TTBItem
      Visible = False
    end
    inherited TBItem2: TTBItem
      Visible = False
    end
    object TBItem9: TTBItem [2]
      Action = aMove
    end
    object TBItem11: TTBItem [3]
      Action = aConvert
    end
    object TBItem10: TTBItem [4]
      Action = aCashWithCharge
    end
    object TBSeparatorItem3: TTBSeparatorItem [5]
    end
    object TBItem13: TTBItem [6]
      Action = aNull
      Enabled = False
      Visible = False
    end
    inherited TBItem3: TTBItem
      Visible = False
    end
    object TBItem6: TTBItem
      Action = aRecalc
    end
    object TBItem7: TTBItem
      Action = aRecalcAll
    end
  end
  object mdMain: TssMemoryData
    FieldDefs = <>
    Left = 31
    Top = 112
    object mdMainid: TIntegerField
      FieldName = 'id'
    end
    object mdMainname: TStringField
      FieldName = 'name'
      Size = 128
    end
    object mdMainsaldo: TCurrencyField
      FieldName = 'saldo'
      DisplayFormat = ',0.00'
    end
    object mdMainpid: TIntegerField
      FieldName = 'pid'
    end
    object mdMainiindex: TIntegerField
      FieldName = 'iindex'
    end
  end
  object srcMain: TDataSource
    DataSet = mdMain
    OnDataChange = srcMainDataChange
    Left = 59
    Top = 112
  end
  object cdsEntAcc: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'p_EntAccounts_List'
    RemoteServer = dmData.SConnection
    OnCalcFields = cdsEntAccCalcFields
    Macros = <>
    Left = 96
    Top = 24
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
  object cdsCashDesks: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pCashDesks_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 92
    Top = 112
  end
  object cdsMain: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'ondate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ratedate'
        ParamType = ptUnknown
      end>
    ProviderName = 'pMoneySaldo_Get'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsMainBeforeOpen
    Macros = <>
    Left = 120
    Top = 112
  end
  object cdsCurr: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'ondate'
        ParamType = ptUnknown
      end>
    ProviderName = 'pCurrency_ListEx'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsCurrBeforeOpen
    AfterOpen = cdsCurrAfterOpen
    Macros = <>
    Left = 163
    Top = 25
  end
  object srcCurr: TDataSource
    DataSet = cdsCurr
    Left = 191
    Top = 25
  end
  object srcChargeType: TDataSource
    DataSet = cdsChargeType
    Left = 108
    Top = 156
  end
  object cdsChargeType: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pChargeType_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 136
    Top = 156
  end
  object mdTurnOver: TssMemoryData
    FieldDefs = <>
    Left = 127
    Top = 216
    object IntegerField1: TIntegerField
      FieldName = 'id'
    end
    object mdTurnOverpaydocid: TIntegerField
      FieldName = 'paydocid'
    end
    object mdTurnOverchecked: TIntegerField
      FieldName = 'checked'
    end
    object mdTurnOverdoctype: TIntegerField
      FieldName = 'doctype'
    end
    object mdTurnOverondate: TDateTimeField
      FieldName = 'ondate'
    end
    object mdTurnOvernum: TStringField
      FieldName = 'num'
      Size = 48
    end
    object mdTurnOverchargename: TStringField
      FieldName = 'chargename'
      Size = 64
    end
    object mdTurnOverkaname: TStringField
      FieldName = 'kaname'
      Size = 255
    end
    object mdTurnOverptypename: TStringField
      FieldName = 'ptypename'
      Size = 64
    end
    object mdTurnOvertotal: TCurrencyField
      FieldName = 'total'
      DisplayFormat = ',0.00'
    end
    object mdTurnOvertotaldef: TCurrencyField
      FieldName = 'totaldef'
      DisplayFormat = ',0.00'
    end
    object mdTurnOvershortname: TStringField
      FieldName = 'shortname'
      Size = 24
    end
    object mdTurnOveronvalue: TFloatField
      FieldName = 'onvalue'
    end
    object mdTurnOveraccnum: TStringField
      FieldName = 'accnum'
      Size = 64
    end
    object mdTurnOvercashname: TStringField
      FieldName = 'cashname'
      Size = 128
    end
    object mdTurnOverbankname: TStringField
      FieldName = 'bankname'
      Size = 255
    end
    object mdTurnOverkaid: TIntegerField
      FieldName = 'kaid'
    end
  end
  object srcTurnOver: TDataSource
    DataSet = cdsTurnover
    Left = 155
    Top = 216
  end
  object pmDet: TTBPopupMenu
    Images = dmData.Images
    Left = 196
    Top = 224
    object TBItem8: TTBItem
      Action = aGotoDoc
    end
    object TBItem5: TTBItem
      Action = aColParams
    end
  end
  object srcKAgent: TDataSource
    DataSet = cdsKAgent
    Left = 108
    Top = 184
  end
  object cdsKAgent: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'p_KAgentList'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 136
    Top = 184
  end
  object mdActives: TssMemoryData
    FieldDefs = <>
    Left = 159
    Top = 112
    object IntegerField2: TIntegerField
      FieldName = 'id'
    end
    object StringField1: TStringField
      FieldName = 'name'
      Size = 128
    end
    object CurrencyField1: TCurrencyField
      FieldName = 'saldo'
      DisplayFormat = ',0.00'
    end
    object IntegerField3: TIntegerField
      FieldName = 'pid'
    end
    object IntegerField4: TIntegerField
      FieldName = 'iindex'
    end
  end
  object srcActives: TDataSource
    DataSet = mdActives
    OnDataChange = srcMainDataChange
    Left = 187
    Top = 112
  end
  object pmActives: TTBPopupMenu
    Images = dmData.Images
    OnPopup = pmMainPopup
    Left = 440
    Top = 76
    object TBItem17: TTBItem
      Action = aRefresh
    end
    object TBSeparatorItem4: TTBSeparatorItem
    end
    object TBItem20: TTBItem
      Action = aRecalcActives
    end
  end
  object cdsActives: TssClientDataSet
    Aggregates = <>
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
    ProviderName = 'pActives_GetHistory'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsActivesBeforeOpen
    Macros = <>
    Left = 176
    Top = 176
  end
  object srcActivesChart: TDataSource
    DataSet = cdsActives
    Left = 236
    Top = 196
  end
  object pmActChart: TTBPopupMenu
    Images = dmData.Images
    Left = 444
    Top = 20
    object TBItem12: TTBItem
      Action = aRecalcActivesAll
    end
  end
  object cdsTurnover: TssClientDataSet
    Aggregates = <>
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
      end
      item
        DataType = ftUnknown
        Name = 'turntype'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'currid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'inkaid'
        ParamType = ptUnknown
      end>
    ProviderName = 'pMoneyTurnover_Get'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsTurnoverBeforeOpen
    Macros = <>
    Left = 60
    Top = 152
  end
end
