inherited fmBaseWBDoc: TfmBaseWBDoc
  OnResize = FrameResize
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 161
    Width = 435
    Height = 3
    Cursor = crVSplit
    Align = alTop
    OnMoved = Splitter1Moved
  end
  inherited panClient: TPanel
    Height = 161
    Align = alTop
    ParentColor = True
    inherited ssBevel3: TssBevel
      Top = 31
      Height = 129
    end
    inherited ssBevel9: TssBevel
      Top = 30
    end
    inherited ssBevel8: TssBevel
      Top = 31
      Height = 129
    end
    inherited ssBevel12: TssBevel
      Top = 160
    end
    inherited pcMainList: TcxPageControl
      Top = 31
      Height = 129
      inherited tsMainList: TcxTabSheet
        Caption = #1054#1089#1085#1086#1074#1085#1086#1081' '#1089#1087#1080#1089#1086#1082
        object bvlMainListTop: TssBevel [0]
          Left = 0
          Top = 0
          Width = 433
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
          Visible = False
        end
        inherited grdMain: TssDBGrid
          Top = 1
          Height = 98
          Hint = 'SUMMALL'
          KeyField = 'WBILLID'
          Filter.Criteria = {00000000}
          OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoStoreToRegistry, edgoTabThrough, edgoVertThrough]
          OptionsCustomize = [edgoBandMoving, edgoBandSizing, edgoColumnMoving, edgoColumnSizing]
          OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoRowSelect, edgoUseBitmap]
          OnNeedAdjust = grdMainNeedAdjust
          OnGetGroupNodeAddText = grdMainGetGroupNodeAddText
          object colImg: TdxDBGridImageColumn
            Alignment = taLeftJustify
            MinWidth = 16
            Sizing = False
            Width = 25
            BandIndex = 0
            RowIndex = 0
            OnGetText = colImgGetText
            Images = dmData.Images
          end
          object colChecked: TdxDBGridImageColumn
            Alignment = taLeftJustify
            MinWidth = 16
            Sizing = False
            Width = 20
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
              '151')
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
            HeaderAlignment = taCenter
            Width = 85
            BandIndex = 0
            RowIndex = 0
            FieldName = 'NUM'
          end
          object colOnDate: TdxDBGridColumn
            Tag = 1
            Alignment = taCenter
            HeaderAlignment = taCenter
            Width = 90
            BandIndex = 0
            RowIndex = 0
            FieldName = 'ONDATE'
            OnGetText = colOnDateGetText
          end
          object colName: TdxDBGridColumn
            Tag = 1
            HeaderAlignment = taCenter
            Sorted = csUp
            Width = 183
            BandIndex = 0
            RowIndex = 0
            FieldName = 'KANAME'
          end
          object colSummAll: TdxDBGridColumn
            Tag = 1
            Alignment = taRightJustify
            HeaderAlignment = taCenter
            Width = 90
            BandIndex = 0
            RowIndex = 0
            FieldName = 'SUMMALL'
            OnGetText = colSummAllGetText
          end
          object colSummPay: TdxDBGridColumn
            Tag = 1
            HeaderAlignment = taCenter
            Visible = False
            BandIndex = 0
            RowIndex = 0
            FieldName = 'summpay'
            OnGetText = colSummPayGetText
          end
          object colSummInCurr: TdxDBGridColumn
            HeaderAlignment = taCenter
            Visible = False
            Width = 90
            BandIndex = 0
            RowIndex = 0
          end
          object colDocSaldo: TdxDBGridColumn
            Tag = 1
            HeaderAlignment = taCenter
            Visible = False
            BandIndex = 0
            RowIndex = 0
            OnCustomDrawCell = colDocSaldoCustomDrawCell
            OnGetText = colSummPayGetText
          end
          object colNotes: TdxDBGridColumn
            Tag = 1
            HeaderAlignment = taCenter
            Visible = False
            Width = 100
            BandIndex = 0
            RowIndex = 0
            FieldName = 'notes'
          end
          object colCurrName: TdxDBGridColumn
            Visible = False
            BandIndex = 0
            RowIndex = 0
            FieldName = 'currname'
          end
          object colID: TdxDBGridColumn
            Visible = False
            BandIndex = 0
            RowIndex = 0
            FieldName = 'wbillid'
          end
        end
        object panFooter: TPanel
          Left = 0
          Top = 99
          Width = 433
          Height = 30
          Align = alBottom
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 1
          DesignSize = (
            433
            30)
          object ssBevel1: TssBevel
            Left = 0
            Top = 0
            Width = 433
            Height = 30
            Align = alClient
            ColorGrBegin = clBtnFace
            ColorGrEnd = clBtnFace
            ColorInner = clBtnShadow
            ColorOuter = clBtnShadow
            Edges = [beTop]
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Style = bsSingle
            UseGradient = False
          end
          object lDocsCount: TLabel
            Left = 452
            Top = 9
            Width = 93
            Height = 13
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            Caption = #1042#1089#1077#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
          end
          object lDocsSumm: TLabel
            Left = 1000
            Top = 9
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            Caption = #1053#1072' '#1089#1091#1084#1084#1091
          end
          object stCount: TssBevel
            Left = 548
            Top = 8
            Width = 93
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
            Margins.Right = 2
            UseGradient = True
            WordBreak = False
          end
          object stTotal: TssBevel
            Left = 647
            Top = 8
            Width = 156
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
            Margins.Right = 2
            UseGradient = True
            WordBreak = False
          end
        end
      end
      object tsTemp: TcxTabSheet
        Caption = 'tsTemp'
        ImageIndex = 1
        TabVisible = False
        object ssBevel5: TssBevel
          Left = 0
          Top = 0
          Width = 518
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
      end
    end
    object panFilter: TPanel
      Left = 0
      Top = 0
      Width = 435
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      DesignSize = (
        435
        30)
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
      object ssBevel2: TssBevel
        Left = 0
        Top = 1
        Width = 3
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
      object bvlRight: TssBevel
        Left = 434
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
        Shape = bsLeftLine
        Style = bsSingle
        UseGradient = False
      end
      object lStatus: TLabel
        Left = 663
        Top = 9
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = #1057#1090#1072#1090#1091#1089
      end
      object lKAgent: TLabel
        Left = 320
        Top = 9
        Width = 78
        Height = 13
        Alignment = taRightJustify
        Caption = 'Business partner'
      end
      object btnKagent: TssSpeedButton
        Left = 606
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
        ImageIndex = 28
        Images = dmData.Images18x18
        LeftMargin = 2
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
        OnClick = btnKagentClick
      end
      object cbChecked: TcxImageComboBox
        Left = 663
        Top = 5
        Width = 110
        Height = 24
        Anchors = [akTop, akRight]
        EditValue = 0
        ImeName = 'Russian'
        ParentFont = False
        Properties.DefaultDescription = #1074#1089#1077
        Properties.Images = dmData.Images
        Properties.Items = <
          item
            Description = #1074#1089#1077
            ImageIndex = 42
            Value = 0
          end
          item
            Description = #1087#1088#1086#1074#1077#1076#1105#1085#1085#1099#1077
            ImageIndex = 31
            Value = 1
          end
          item
            Description = #1085#1077#1087#1088#1086#1074#1077#1076#1077#1085#1085#1099#1077
            ImageIndex = 32
            Value = 2
          end>
        Properties.OnChange = lcbKAgentPropertiesEditValueChanged
        Style.StyleController = dmData.scMain
        TabOrder = 1
      end
      object lcbKAgent: TssDBLookupCombo
        Left = 408
        Top = 5
        Width = 193
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
          '<>'
          '<>'
          '<>')
        Properties.OnChange = lcbKAgentPropertiesChange
        Properties.OnEditValueChanged = lcbKAgentPropertiesEditValueChanged
        Properties.OnInitPopup = lcbKAgentPropertiesInitPopup
        Style.StyleController = dmData.scMain
        TabOrder = 0
        Text = '<>'
        DisplayEmpty = '<>'
        EmptyValue = 0
        KeyField = 'kaid'
        ListField = 'name'
        ListSource = srcKAgent
      end
      object prdMain: TokPeriod
        Left = 6
        Top = 5
        Width = 307
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
        TabOrder = 2
        ViewType = vtShort
        LangManager = dmData.Lng
        DesignSize = (
          307
          21)
      end
    end
  end
  object pcMain: TcxPageControl [2]
    Left = 0
    Top = 164
    Width = 435
    Height = 102
    ActivePage = tsPositions
    Align = alClient
    Images = dmData.Images
    OwnerDraw = True
    TabOrder = 1
    OnChange = pcMainChange
    object tsPositions: TcxTabSheet
      ImageIndex = 14
      object ssBevel14: TssBevel
        Left = 0
        Top = 1
        Width = 1
        Height = 46
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
      object ssBevel15: TssBevel
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
      object ssBevel16: TssBevel
        Left = 0
        Top = 47
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
      object ssBevel17: TssBevel
        Left = 434
        Top = 1
        Width = 1
        Height = 46
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
      object grdDet: TssDBGrid
        Left = 1
        Top = 1
        Width = 433
        Height = 46
        TabStop = False
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
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        PopupMenu = pmDet
        ShowHint = True
        TabOrder = 0
        BandFont.Charset = DEFAULT_CHARSET
        BandFont.Color = clBlack
        BandFont.Height = -11
        BandFont.Name = 'Tahoma'
        BandFont.Style = [fsBold]
        DataSource = srcDetail
        Filter.Criteria = {00000000}
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clBlack
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        HideFocusRect = True
        HideSelectionColor = clWindow
        HideSelectionTextColor = clWindowText
        HighlightColor = clWindow
        HighlightTextColor = clWindowText
        LookAndFeel = lfUltraFlat
        MaxRowLineCount = 1
        OptionsBehavior = [edgoDragScroll, edgoStoreToRegistry, edgoTabThrough, edgoVertThrough]
        OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseLocate]
        OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoRowAutoHeight, edgoRowSelect, edgoUseBitmap]
        PreviewFont.Charset = DEFAULT_CHARSET
        PreviewFont.Color = clBlue
        PreviewFont.Height = -11
        PreviewFont.Name = 'Tahoma'
        PreviewFont.Style = [fsBold]
        ShowRowFooter = True
        OnChangedColumnsWidth = grdDetChangedColumnsWidth
        OnCustomDrawCell = grdDetCustomDrawCell
        LangManager = dmData.Lng
        OnNeedAdjust = grdDetNeedAdjust
        object colRecNo: TdxDBGridColumn
          Alignment = taCenter
          Caption = #8470
          HeaderAlignment = taCenter
          MinWidth = 30
          Sizing = False
          Width = 30
          BandIndex = 0
          RowIndex = 0
          OnGetText = colRecNoGetText
        end
        object colMatName: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          MaxLength = 300
          Sorted = csDown
          Width = 191
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MATNAME'
          SummaryType = cstSum
          SummaryField = 'amount'
          SummaryFormat = '0.00'
        end
        object colArtikul: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'Artikul'
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
        object colWHouseName: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          MaxLength = 100
          MinWidth = 30
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'WHNAME'
        end
        object colAmount: TdxDBGridColumn
          Tag = 1
          Alignment = taRightJustify
          HeaderAlignment = taCenter
          MaxLength = 91
          MinWidth = 50
          Width = 70
          BandIndex = 0
          RowIndex = 0
          FieldName = 'amount'
          OnGetText = colAmountGetText
        end
        object colMeasureName: TdxDBGridColumn
          Tag = 1
          Alignment = taCenter
          HeaderAlignment = taCenter
          MaxLength = 40
          MinWidth = 40
          Width = 40
          BandIndex = 0
          RowIndex = 0
          FieldName = 'MSRNAME'
        end
        object colPriceWONDS: TdxDBGridColumn
          Tag = 1
          Alignment = taRightJustify
          HeaderAlignment = taCenter
          Visible = False
          Width = 100
          BandIndex = 0
          RowIndex = 0
          OnGetText = colPriceGetText
        end
        object colPrice: TdxDBGridColumn
          Tag = 1
          Alignment = taRightJustify
          HeaderAlignment = taCenter
          MaxLength = 120
          MinWidth = 50
          Width = 80
          BandIndex = 0
          RowIndex = 0
          OnGetText = colPriceGetText
        end
        object colPriceInCurr: TdxDBGridColumn
          Tag = 1
          Alignment = taRightJustify
          HeaderAlignment = taCenter
          Visible = False
          Width = 80
          BandIndex = 0
          RowIndex = 0
          FieldName = 'PRICE'
          OnGetText = colPriceGetText
        end
        object colSummDefWONDS: TdxDBGridColumn
          Tag = 1
          Alignment = taRightJustify
          HeaderAlignment = taCenter
          Visible = False
          Width = 100
          BandIndex = 0
          RowIndex = 0
          OnGetText = colDetNDSGetText
        end
        object colNDS: TdxDBGridColumn
          Tag = 1
          Alignment = taRightJustify
          HeaderAlignment = taCenter
          Visible = False
          Width = 60
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NDS'
          OnGetText = colNDSGetText
        end
        object colDetNDS: TdxDBGridColumn
          Alignment = taRightJustify
          HeaderAlignment = taCenter
          Visible = False
          Width = 100
          BandIndex = 0
          RowIndex = 0
        end
        object colSummDef: TdxDBGridColumn
          Tag = 1
          Alignment = taRightJustify
          HeaderAlignment = taCenter
          MaxLength = 120
          MinWidth = 50
          Width = 80
          BandIndex = 0
          RowIndex = 0
          OnGetText = colSummDefGetText
        end
        object colSummCurr: TdxDBGridColumn
          Tag = 1
          Alignment = taRightJustify
          HeaderAlignment = taCenter
          MaxLength = 120
          MinWidth = 50
          Width = 80
          BandIndex = 0
          RowIndex = 0
          OnGetText = colSummCurrGetText
          SummaryType = cstSum
          SummaryField = 'SummCurr'
          SummaryFormat = '0.00'
        end
        object colNorm: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
        end
        object colRate: TdxDBGridColumn
          Tag = 1
          Alignment = taRightJustify
          HeaderAlignment = taCenter
          Visible = False
          Width = 70
          BandIndex = 0
          RowIndex = 0
          FieldName = 'onvalue'
        end
        object colProducer: TdxDBGridColumn
          HeaderAlignment = taCenter
          Visible = False
          Width = 100
          BandIndex = 0
          RowIndex = 0
        end
        object colGTD: TdxDBGridColumn
          HeaderAlignment = taCenter
          Visible = False
          Width = 100
          BandIndex = 0
          RowIndex = 0
        end
        object colCertNum: TdxDBGridColumn
          HeaderAlignment = taCenter
          Visible = False
          Width = 100
          BandIndex = 0
          RowIndex = 0
        end
        object colCertDate: TdxDBGridColumn
          Alignment = taCenter
          Visible = False
          Width = 100
          BandIndex = 0
          RowIndex = 0
        end
        object colPosID: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'POSID'
        end
        object colArchived: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
        end
        object colCardNum: TdxDBGridColumn
          HeaderAlignment = taCenter
          Visible = False
          Width = 70
          BandIndex = 0
          RowIndex = 0
        end
        object colCardHolder: TdxDBGridColumn
          HeaderAlignment = taCenter
          Visible = False
          Width = 100
          BandIndex = 0
          RowIndex = 0
        end
      end
      object PanDetFooter: TPanel
        Left = 0
        Top = 48
        Width = 435
        Height = 30
        Align = alBottom
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 1
        DesignSize = (
          435
          30)
        object ssBevel4: TssBevel
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
        object lTot: TLabel
          Left = 465
          Top = 9
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = #1089' '#1053#1044#1057
        end
        object lTotNDSOut: TLabel
          Left = 217
          Top = 9
          Width = 104
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = #1048#1090#1086#1075#1086' UAH '#1073#1077#1079' '#1053#1044#1057
        end
        object lTotNDS: TLabel
          Left = 681
          Top = 9
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = #1053#1044#1057
        end
        object bvlCurrSep: TssBevel
          Left = 195
          Top = 0
          Width = 2
          Height = 29
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
          Visible = False
        end
        object lTotalCurr: TLabel
          Left = 8
          Top = 9
          Width = 65
          Height = 13
          Alignment = taRightJustify
          Caption = #1048#1090#1086#1075#1086' '#1074' USD'
          Visible = False
        end
        object stSummCurr: TssBevel
          Left = 76
          Top = 7
          Width = 109
          Height = 16
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
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Margins.Right = 2
          UseGradient = True
          Visible = False
          WordBreak = False
        end
        object stSummDef: TssBevel
          Left = 513
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
          GradientDirection = gdVertical
          HotTrack = False
          ImageIndex = 0
          Margins.Right = 2
          UseGradient = True
          WordBreak = False
        end
        object stSummDefNDS: TssBevel
          Left = 712
          Top = 7
          Width = 97
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
          GradientDirection = gdVertical
          HotTrack = False
          ImageIndex = 0
          Margins.Right = 2
          UseGradient = True
          WordBreak = False
        end
        object stSummDefNoNDS: TssBevel
          Left = 329
          Top = 7
          Width = 120
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
          GradientDirection = gdVertical
          HotTrack = False
          ImageIndex = 0
          Margins.Right = 2
          UseGradient = True
          WordBreak = False
        end
      end
    end
    object tsInfo: TcxTabSheet
      ImageIndex = 117
      object ssBevel10: TssBevel
        Left = 0
        Top = 1
        Width = 1
        Height = 76
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
        Top = 77
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
        Height = 76
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
        Height = 76
        Align = alClient
        BorderStyle = bsNone
        Color = clWindow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        DividerPos = 149
        GridColor = clBtnFace
        Flat = True
        MaxRowTextLineCount = 0
        Options = [ioAutoWidth, ioBandSizing, ioColumnSizing, ioDynamicColumnSizing, ioEditing, ioRowAutoHeight, ioStoreToRegistry]
        PaintStyle = ipsSimple
        OnDrawCaption = inspMainDrawCaption
        OnDrawValue = inspMainDrawValue
        Data = {
          1A0100000700000008000000000000000500000069724E756D08000000060000
          000800000069724B4167656E7408000000000000000C00000069724B4146756C
          6C4E616D6508000000000000000A00000069724B414164726573730800000000
          0000000900000069724B4150686F6E6508000000000000000500000069724661
          780800000000000000070000006972456D61696C080000000000000005000000
          6972575757080000000000000006000000697243757272080000000000000008
          0000006972526561736F6E0800000000000000080000006972506572736F6E08
          0000000000000008000000697253746174757308000000000000000700000069
          724E6F7465730100000008000000000000000800000069724B4167656E74}
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
        object irPerson: TdxInspectorTextRow
          Caption = #1055#1088#1080#1085#1103#1083
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
        object irKAgent: TdxInspectorTextButtonRow
          Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
          Hint = 'ddddd'
          ReadOnly = True
          ShowHint = True
          Buttons = <
            item
              Default = True
              Kind = bkGlyph
            end>
          EditButtonStyle = ebsGlyph
          OnButtonClick = irKAgentButtonClick
        end
        object irAmount: TdxInspectorTextRow
          Caption = #1054#1073#1097#1077#1077' '#1082#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1090#1086#1074#1072#1088#1072
          ReadOnly = True
          Visible = False
        end
        object irNotes: TdxInspectorTextRow
          Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          ReadOnly = True
        end
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
        Height = 89
        Hint = 'doctype'
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
        OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoStoreToRegistry, edgoTabThrough, edgoVertThrough]
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
            '-1'
            '3'
            '-3'
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
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
            '-7'
            ''
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
            ''
            ''
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
        object colRChecked: TdxDBGridImageColumn
          Alignment = taLeftJustify
          MinWidth = 16
          Sizing = False
          Width = 25
          BandIndex = 0
          RowIndex = 0
          FieldName = 'checked'
          OnGetText = colRCheckedGetText
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
            '181')
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
        object colDRNum: TdxDBGridColumn
          Alignment = taRightJustify
          HeaderAlignment = taCenter
          Sizing = False
          Sorted = csUp
          Width = 90
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NUM'
        end
        object colDROnDate: TdxDBGridColumn
          Alignment = taCenter
          HeaderAlignment = taCenter
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
        object colDRID: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'docID'
        end
        object colDRSummAll: TdxDBGridColumn
          HeaderAlignment = taCenter
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SUMM'
          OnGetText = colDRSummAllGetText
        end
        object colDRShortName: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'shortname'
        end
      end
    end
  end
  inherited ActionList: TActionList
    Left = 24
    Top = 192
    inherited aExcel: TAction
      Tag = 1
    end
    object aMatInfo: TAction [20]
      Category = 'All'
      Caption = 'aMatInfo'
      ImageIndex = 99
      ShortCut = 16457
      OnExecute = aMatInfoExecute
    end
    object aMatMove: TAction [21]
      Category = 'All'
      Caption = 'aMatMove'
      ImageIndex = 61
      ShortCut = 16461
      OnExecute = aMatMoveExecute
    end
    object aMatRsv: TAction [22]
      Category = 'All'
      Caption = 'aMatRsv'
      ImageIndex = 100
      ShortCut = 16466
      OnExecute = aMatRsvExecute
    end
    object aMC: TAction [23]
      Category = 'All'
      Caption = 'aMC'
      ImageIndex = 153
      ShortCut = 16462
      OnExecute = aMCExecute
    end
    object aGotoDoc: TAction [24]
      Caption = 'aGotoDoc'
      ImageIndex = 168
      OnExecute = aGotoDocExecute
    end
    object aSvcInfo: TAction [25]
      Caption = 'aSvcInfo'
      ImageIndex = 160
      OnExecute = aSvcInfoExecute
    end
    object aDetColParams: TAction [26]
      Category = 'All'
      Caption = 'aDetColParams'
      OnExecute = aDetColParamsExecute
    end
    object aDRPrint: TAction [27]
      Caption = 'aDRPrint'
      ImageIndex = 9
      OnExecute = aDRPrintExecute
    end
    object aFindAtWH: TAction [28]
      Caption = 'aFindAtWH'
      ImageIndex = 50
      OnExecute = aFindAtWHExecute
    end
    object aAddPayDoc: TAction [29]
      Category = 'All'
      Caption = 'aAddPayDoc'
      OnExecute = aAddPayDocExecute
    end
    object aShowNullBallance: TAction [30]
      Category = 'All'
      AutoCheck = True
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090#1099' '#1089' '#1085#1091#1083#1077#1074#1099#1084' '#1073#1072#1083#1072#1085#1089#1086#1084
      Checked = True
      OnExecute = aShowNullBallanceExecute
    end
    object aFindAtMats: TAction [31]
      Caption = 'aFindAtMats'
      ImageIndex = 14
      OnExecute = aFindAtMatsExecute
    end
    object aFindAtSvc: TAction [32]
      Caption = 'aFindAtSvc'
      ImageIndex = 15
      OnExecute = aFindAtSvcExecute
    end
  end
  inherited pmMain: TTBPopupMenu
    Left = 316
    Top = 240
    object itmPatternIns: TTBItem [1]
      Action = aPatternInsert
    end
    object TBItem6: TTBItem [6]
      Action = aCheck
    end
    object TBSeparatorItem6: TTBSeparatorItem [7]
    end
    object TBItem18: TTBItem [8]
      Action = aShowNullBallance
    end
    object TBItem5: TTBItem [9]
      Action = aShowFilter
    end
    object itmColParams: TTBItem [10]
      Action = aColParams
    end
    object TBSeparatorItem11: TTBSeparatorItem [11]
    end
    object TBItem23: TTBItem [12]
      Action = aPrint
    end
    object TBItem19: TTBItem [13]
      Action = aExcel
    end
    object TBSeparatorItem3: TTBSeparatorItem [14]
    end
  end
  inherited cdsMain: TssClientDataSet
    BeforeOpen = cdsMainBeforeOpen
    Left = 360
    Top = 64
  end
  inherited srcMain: TssDataSource
    Left = 404
    Top = 64
  end
  object cdsKAgent: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'p_KAgentList'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 152
    Top = 64
  end
  object srcKAgent: TDataSource
    DataSet = cdsKAgent
    Left = 212
    Top = 64
  end
  object srcMainEx: TDataSource
    DataSet = cdsMain
    OnDataChange = srcMainExDataChange
    Left = 12
    Top = 56
  end
  object cdsDetail: TssMemoryData
    BeforeOpen = cdsDetailBeforeOpen
    FieldDefs = <>
    Left = 104
    Top = 152
  end
  object cdsDetailFetch: TssClientDataSet
    Aggregates = <
      item
        Active = True
        AggregateName = 'aggMinMsr'
        Expression = 'min(msrname)'
        Visible = False
      end
      item
        Active = True
        AggregateName = 'aggMaxMsr'
        Expression = 'max(msrname)'
        Visible = False
      end
      item
        Active = True
        AggregateName = 'aggAmount'
        Expression = 'sum(amount)'
        Visible = False
      end>
    AggregatesActive = True
    Params = <
      item
        DataType = ftUnknown
        Name = 'WBILLID'
        ParamType = ptInput
      end>
    ProviderName = 'pWaybillDet_Get'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsDetailFetchBeforeOpen
    AfterOpen = cdsDetailFetchAfterOpen
    Macros = <>
    Left = 102
    Top = 105
    object cdsDetailPOSID: TIntegerField
      FieldName = 'POSID'
      ReadOnly = True
    end
    object cdsDetailWBILLID: TIntegerField
      FieldName = 'WBILLID'
      ReadOnly = True
    end
    object cdsDetailMATID: TIntegerField
      FieldName = 'MATID'
      ReadOnly = True
    end
    object cdsDetailMATNAME: TStringField
      FieldName = 'MATNAME'
      ReadOnly = True
      Size = 128
    end
    object cdsDetailMSRNAME: TStringField
      FieldName = 'MSRNAME'
      ReadOnly = True
      Size = 6
    end
    object cdsDetailWID: TIntegerField
      FieldName = 'WID'
      ReadOnly = True
    end
    object cdsDetailWHNAME: TStringField
      FieldName = 'WHNAME'
      ReadOnly = True
      Size = 64
    end
    object cdsDetailAMOUNT: TFloatField
      FieldName = 'AMOUNT'
      ReadOnly = True
    end
    object cdsDetailPRICE: TFloatField
      FieldName = 'PRICE'
      ReadOnly = True
    end
    object cdsDetailrecno: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'recno'
      Calculated = True
    end
    object cdsDetailsummdef2: TFloatField
      FieldKind = fkCalculated
      FieldName = 'summdef2'
      Calculated = True
    end
    object cdsDetailpricedef: TFloatField
      FieldKind = fkCalculated
      FieldName = 'pricedef'
      Calculated = True
    end
    object cdsDetailARTIKUL: TStringField
      FieldName = 'ARTIKUL'
      Size = 80
    end
    object cdsDetailNDS: TFloatField
      FieldName = 'NDS'
    end
    object cdsDetailONVALUE: TFloatField
      FieldName = 'ONVALUE'
      Required = True
    end
    object cdsDetailBARCODE: TStringField
      DisplayWidth = 128
      FieldName = 'BARCODE'
      Size = 128
    end
    object cdsDetailsumcurr: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'sumcurr'
    end
    object cdsDetailpricewonds: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'pricewonds'
    end
    object cdsDetailsumwonds: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'sumwonds'
    end
    object cdsDetailsumnds: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'sumnds'
    end
    object cdsDetailsumwithnds: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'sumwithnds'
    end
    object cdsDetailpricewithnds: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'pricewithnds'
    end
  end
  object srcDetail: TDataSource
    DataSet = cdsDetail
    Left = 106
    Top = 201
  end
  object pmDet: TTBPopupMenu
    Images = dmData.Images
    Left = 388
    Top = 241
    object itmMatInfo: TTBItem
      Action = aMatInfo
      Images = dmData.Images
    end
    object itmMatMove: TTBItem
      Action = aMatMove
    end
    object itmMatRsv: TTBItem
      Action = aMatRsv
    end
    object itmMC: TTBItem
      Action = aMC
    end
    object sepDetColOptions: TTBSeparatorItem
    end
    object itmFindAtMats: TTBItem
      Action = aFindAtMats
    end
    object itmFindAtSvc: TTBItem
      Action = aFindAtSvc
      Visible = False
    end
    object TBSeparatorItem10: TTBSeparatorItem
    end
    object TBItem20basewbdoc: TTBItem
      Action = aCopy
      ShortCut = 16451
    end
    object TBSeparatorItem7: TTBSeparatorItem
    end
    object itmDetColParams: TTBItem
      Action = aDetColParams
    end
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
    Left = 177
    Top = 193
  end
  object srcRel: TDataSource
    DataSet = cdsRel
    Left = 221
    Top = 193
  end
  object cdsDocRel: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'fromdate'
        ParamType = ptUnknown
        Value = '1.1.2000'
      end
      item
        DataType = ftString
        Name = 'todate'
        ParamType = ptUnknown
        Value = '1.1.2000'
      end>
    ProviderName = 'pInv_RelList'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsDocRelBeforeOpen
    Macros = <
      item
        DataType = ftString
        Name = 'm'
        ParamType = ptUnknown
      end>
    Left = 300
    Top = 64
  end
  object pmDocRel: TTBPopupMenu
    Images = dmData.Images
    Left = 452
    Top = 241
    object mnuGotoDoc: TTBItem
      Action = aGotoDoc
    end
    object itmDRPrint: TTBItem
      Action = aDRPrint
    end
  end
end
