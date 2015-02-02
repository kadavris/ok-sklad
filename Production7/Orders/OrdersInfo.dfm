inherited frmOrdersInfo: TfrmOrdersInfo
  Left = 361
  Top = 208
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'frmOrdersInfo'
  ClientHeight = 683
  ClientWidth = 932
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 932
    Height = 601
    DesignSize = (
      932
      601)
    object ssBevel8: TssBevel
      Left = 926
      Top = 36
      Width = 1
      Height = 542
      Anchors = [akTop, akRight]
      ColorGrBegin = clBtnFace
      ColorGrEnd = clBtnFace
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsRightLine
      UseGradient = False
    end
    object ssBevel1: TssBevel
      Left = 4
      Top = 69
      Width = 1
      Height = 513
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
    object ssBevel3: TssBevel
      Left = 4
      Top = 560
      Width = 923
      Height = 38
      Anchors = [akLeft, akRight, akBottom]
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
    object ssBevel4: TssBevel
      Left = 4
      Top = 5
      Width = 923
      Height = 69
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
    object lKAgentF: TLabel
      Left = 297
      Top = 16
      Width = 66
      Height = 16
      Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
    end
    object btnKagent: TssSpeedButton
      Left = 640
      Top = 10
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 18
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnKagentClick
    end
    object lDocType: TLabel
      Left = 678
      Top = 16
      Width = 94
      Height = 16
      Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
    end
    object txtTotalAmount: TssBevel
      Left = 554
      Top = 568
      Width = 132
      Height = 20
      Alignments.Horz = taRightJustify
      Anchors = [akRight, akBottom]
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
    object txtTotalSum: TssBevel
      Left = 768
      Top = 568
      Width = 149
      Height = 20
      Alignments.Horz = taRightJustify
      Anchors = [akRight, akBottom]
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
    object txtTotalDocs: TssBevel
      Left = 308
      Top = 568
      Width = 112
      Height = 20
      Alignments.Horz = taRightJustify
      Anchors = [akRight, akBottom]
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
    object lTotalAmount: TssLabel
      Left = 458
      Top = 571
      Width = 82
      Height = 16
      Anchors = [akRight, akBottom]
      Caption = #1042#1089#1077#1075#1086' '#1090#1086#1074#1072#1088#1072':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      DisabledDraw = ddUser
      DisabledColor = clBtnShadow
    end
    object lTotalDocs: TssLabel
      Left = 210
      Top = 568
      Width = 87
      Height = 16
      Alignment = taRightJustify
      Anchors = [akRight, akBottom]
      Caption = #1042#1089#1077#1075#1086' '#1079#1072#1082#1072#1079#1086#1074':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      DisabledDraw = ddUser
      DisabledColor = clBtnShadow
    end
    object lTotalSum: TssLabel
      Left = 706
      Top = 568
      Width = 57
      Height = 16
      Alignment = taRightJustify
      Anchors = [akRight, akBottom]
      Caption = #1085#1072' '#1089#1091#1084#1084#1091':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      DisabledDraw = ddUser
      DisabledColor = clBtnShadow
    end
    object lDocStatus: TLabel
      Left = 678
      Top = 47
      Width = 75
      Height = 16
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100':'
    end
    object grdMain: TssDBGrid
      Left = 5
      Top = 75
      Width = 916
      Height = 486
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
      BorderStyle = bsNone
      ParentShowHint = False
      PopupMenu = pmMain
      ShowHint = True
      TabOrder = 2
      OnDblClick = grdMainDblClick
      DataSource = srcView
      Filter.Criteria = {00000000}
      FixedBandLineColor = clBtnFace
      GridLineColor = 12174536
      GroupPanelColor = clBtnFace
      GroupNodeColor = 14804712
      HideFocusRect = True
      LookAndFeel = lfUltraFlat
      OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEnterShowEditor, edgoImmediateEditor, edgoStoreToRegistry, edgoTabThrough, edgoVertThrough]
      OptionsCustomize = [edgoBandSizing, edgoColumnMoving, edgoColumnSizing]
      OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
      OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoRowSelect, edgoUseBitmap]
      ShowBands = True
      OnCustomDrawCell = grdMainCustomDrawCell
      Anchors = [akLeft, akTop, akRight, akBottom]
      LangManager = dmData.Lng
      OnNeedAdjust = grdMainNeedAdjust
      OnGetOptionsTitle = grdMainGetOptionsTitle
      object colID: TdxDBGridColumn
        Visible = False
        Width = 40
        BandIndex = 0
        RowIndex = 0
        FieldName = 'POSID'
      end
      object colDocType: TdxDBGridImageColumn
        Alignment = taCenter
        Caption = '*'
        HeaderAlignment = taCenter
        MinWidth = 16
        Sizing = False
        Width = 25
        BandIndex = 0
        RowIndex = 0
        FieldName = 'WTYPE'
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
          '195'
          '196'
          '197'
          '198'
          '199'
          '200'
          '201'
          '202'
          '203'
          '204')
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
          '16'
          '-16'
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          '1016'
          '-1016')
      end
      object colType: TdxDBGridColumn
        Alignment = taCenter
        Sizing = False
        Width = 30
        BandIndex = 0
        RowIndex = 0
        OnCustomDrawCell = colTypeCustomDrawCell
        OnGetText = colTypeGetText
      end
      object colChecked: TdxDBGridImageColumn
        Alignment = taCenter
        HeaderAlignment = taCenter
        MinWidth = 16
        Sizing = False
        Width = 30
        BandIndex = 0
        RowIndex = 0
        FieldName = 'checked'
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
          '204')
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
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          '2')
      end
      object colNum: TdxDBGridColumn
        Tag = 1
        Alignment = taRightJustify
        Caption = #1053#1086#1084#1077#1088
        HeaderAlignment = taCenter
        TabStop = False
        Width = 69
        BandIndex = 0
        RowIndex = 0
        FieldName = 'NUM'
      end
      object colOnDate: TdxDBGridColumn
        Tag = 1
        Alignment = taCenter
        Caption = #1044#1072#1090#1072
        HeaderAlignment = taCenter
        Width = 80
        BandIndex = 0
        RowIndex = 0
        FieldName = 'ONDATE'
        OnGetText = colOnDateGetText
      end
      object colKAgent: TdxDBGridColumn
        Tag = 1
        HeaderAlignment = taCenter
        Width = 137
        BandIndex = 0
        RowIndex = 0
        FieldName = 'kaname'
      end
      object colMatName: TdxDBGridColumn
        Tag = 1
        HeaderAlignment = taCenter
        Sorted = csUp
        Width = 106
        BandIndex = 1
        RowIndex = 0
        FieldName = 'matname'
      end
      object colArtikul: TdxDBGridColumn
        Tag = 1
        HeaderAlignment = taCenter
        Width = 74
        BandIndex = 1
        RowIndex = 0
        FieldName = 'artikul'
      end
      object colAmount: TdxDBGridColumn
        Tag = 1
        Caption = #1050#1086#1083'-'#1074#1086
        HeaderAlignment = taCenter
        Width = 62
        BandIndex = 1
        RowIndex = 0
        FieldName = 'AMOUNT'
        OnGetText = colAmountGetText
      end
      object colMeasure: TdxDBGridColumn
        Tag = 1
        Alignment = taCenter
        HeaderAlignment = taCenter
        Width = 40
        BandIndex = 1
        RowIndex = 0
        FieldName = 'measure'
      end
      object colPrice: TdxDBGridColumn
        Tag = 1
        Alignment = taRightJustify
        Caption = #1042' '#1091#1095#1105#1090'. '#1074#1072#1083#1102#1090#1077
        HeaderAlignment = taCenter
        Width = 55
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
        OnGetText = colCurrencyGetText
      end
      object colRate: TdxDBGridColumn
        Tag = 1
        Caption = #1050#1091#1088#1089
        HeaderAlignment = taCenter
        Visible = False
        Width = 43
        BandIndex = 2
        RowIndex = 0
        FieldName = 'ONVALUE'
      end
      object colNPrice: TdxDBGridColumn
        Tag = 1
        Alignment = taRightJustify
        Caption = #1042' '#1085#1072#1094'. '#1074#1072#1083#1102#1090#1077
        Visible = False
        Width = 62
        BandIndex = 2
        RowIndex = 0
        OnGetText = colNPriceGetText
      end
      object colNCurrency: TdxDBGridColumn
        Tag = 1
        Caption = #1042#1072#1083#1102#1090#1072
        HeaderAlignment = taCenter
        Visible = False
        Width = 33
        BandIndex = 2
        RowIndex = 0
        OnGetText = colNCurrencyGetText
      end
      object colWHouse: TdxDBGridColumn
        Tag = 1
        Caption = #1057#1082#1083#1072#1076
        HeaderAlignment = taCenter
        Visible = False
        Width = 170
        BandIndex = 1
        RowIndex = 0
        FieldName = 'WHNAME'
        OnGetText = colWHouseGetText
      end
      object colWID: TdxDBGridColumn
        Visible = False
        Width = 81
        BandIndex = 0
        RowIndex = 0
        FieldName = 'WID'
      end
    end
    object lcbKAgent: TssDBLookupCombo
      Left = 374
      Top = 11
      Width = 265
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
        #1042#1089#1077)
      Properties.OnChange = lcbKAgentPropertiesChange
      Properties.OnEditValueChanged = edFromDatePropertiesEditValueChanged
      Properties.OnInitPopup = lcbKAgentPropertiesInitPopup
      Style.StyleController = dmData.scMain
      TabOrder = 0
      Text = #1042#1089#1077
      DisplayEmpty = #1042#1089#1077
      EmptyValue = 0
      KeyField = 'kaid'
      ListField = 'name'
      ListSource = srcKAgent
    end
    object cbDocType: TcxComboBox
      Left = 785
      Top = 11
      Width = 134
      Height = 24
      ImeName = 'Russian'
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.OnEditValueChanged = edFromDatePropertiesEditValueChanged
      Style.StyleController = dmData.scMain
      TabOrder = 1
    end
    object edMat: TokMatSearchEdit
      Left = 297
      Top = 39
      Width = 371
      Height = 31
      Hint = '55555'
      ButtonsLeftMargin = 3
      Color = clBtnFace
      CapFind = 'Search'
      CapFindParams = 'Search options'
      CapRef = 'Products Directory'
      CapContextFind = 'Context search'
      CapFindBegin = 'From the beginning'
      CapFindConcurr = 'Full match'
      CapFindSubstr = 'Partial match'
      EditorOffset = 63
      DisabledImages = dmData.Images18x18dis
      Images = dmData.Images18x18
      ImageIndexRef = 22
      ImageIndexFind = 18
      ImageIndexFindParams = 19
      LangManager = dmData.Lng
      ParentColor = False
      RemoteServer = dmData.SConnection
      ShowHint = True
      ShowLng = False
      ShowButtons = sbtOnlyRef
      SearchNames.Strings = (
        'Name;name'
        'Model;artikul'
        'Barcode;barcode')
      SearchType = stBegin
      TabOrder = 3
      OnChange = edFromDatePropertiesEditValueChanged
      OnRefButtonClick = edMatRefButtonClick
      AllowZeroRest = True
      LoadNDS = True
      LoadTaxes = True
      ScannerImageIndex = 50
      DesignSize = (
        371
        31)
    end
    object cbDocStatus: TcxComboBox
      Left = 785
      Top = 42
      Width = 134
      Height = 24
      ImeName = 'Russian'
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.OnEditValueChanged = edFromDatePropertiesEditValueChanged
      Style.StyleController = dmData.scMain
      TabOrder = 4
    end
    object chbGrp: TcxCheckBox
      Left = 22
      Top = 41
      Width = 235
      Height = 27
      AutoSize = False
      ParentFont = False
      Properties.Alignment = taLeftJustify
      Properties.DisplayUnchecked = 'False'
      Properties.Caption = #1057#1075#1088#1091#1087#1087#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1079#1072#1082#1072#1079#1072#1084
      Style.BorderColor = clBtnShadow
      Style.BorderStyle = ebsUltraFlat
      Style.Shadow = False
      Style.StyleController = dmData.scMain
      TabOrder = 5
      ImeName = 'Russian'
      OnClick = chbGrpClick
      OnKeyDown = GoNextKeyDown
    end
    object panEmpty: TPanel
      Left = 5
      Top = 97
      Width = 921
      Height = 414
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvNone
      Caption = #1055#1086' '#1091#1089#1083#1086#1074#1080#1103#1084' '#1092#1080#1083#1100#1090#1088#1072' '#1079#1072#1082#1072#1079#1099' '#1076#1083#1103' '#1076#1072#1085#1085#1086#1075#1086' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1102#1090
      Color = clWindow
      ParentBackground = False
      TabOrder = 7
      Visible = False
    end
    object prdMain: TokPeriod
      Left = 12
      Top = 11
      Width = 275
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
      TabOrder = 6
      ViewType = vtShort
      LangManager = dmData.Lng
      DesignSize = (
        275
        21)
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 932
    inherited panTitleButtons: TssPanel
      Left = 874
    end
  end
  inherited panButtons: TPanel
    Top = 648
    Width = 932
    inherited btnOK: TxButton
      Left = 725
      Anchors = [akTop]
    end
    inherited btnCancel: TxButton
      Left = 828
    end
    inherited btnApply: TxButton
      Left = 308
      Top = 9
      Visible = False
    end
  end
  inherited panToolBar: TPanel
    Width = 932
    inherited btnLock: TssSpeedButton
      Left = 842
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 869
    end
    inherited btnHelp: TssSpeedButton
      Left = 896
    end
    object btnPrintDoc: TssSpeedButton
      Left = 31
      Top = 1
      Hint = #1044#1086#1082#1091#1084#1077#1085#1090
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090
      GroupIndex = 0
      ImageIndex = 68
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnPrintDocClick
    end
    object btnPrint: TssSpeedButton
      Left = 4
      Top = 1
      Hint = #1054#1090#1095#1105#1090' '#1086' '#1076#1074#1080#1078#1077#1085#1080#1080' '#1090#1086#1074#1072#1088#1072
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      Caption = #1055#1077#1095#1072#1090#1072#1090#1100
      GroupIndex = 0
      ImageIndex = 9
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnPrintClick
    end
    object btnLocate: TssSpeedButton
      Left = 58
      Top = 1
      Action = aLocate
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      DisabledImages = dmData.Images
      GroupIndex = 0
      ImageIndex = 168
      Images = dmData.Images
      LeftMargin = 4
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
    StoredProps.Strings = (
      'chbGrp.Checked')
  end
  inherited ActionList: TActionList
    Images = dmData.Images
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
    object aRefresh: TAction
      Caption = 'aRefresh'
      ImageIndex = 6
      ShortCut = 116
      OnExecute = aRefreshExecute
    end
  end
  object cdsView: TssClientDataSet
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
        Name = 'matid'
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
        Name = 'checked'
        ParamType = ptUnknown
      end>
    ProviderName = 'pOrders_GetInfo'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsViewBeforeOpen
    AfterOpen = cdsViewAfterOpen
    Macros = <>
    Left = 44
    Top = 156
  end
  object srcView: TDataSource
    DataSet = cdsView
    Left = 72
    Top = 156
  end
  object cdsKAgent: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'p_KAgentList'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 364
    Top = 49
  end
  object srcKAgent: TDataSource
    DataSet = cdsKAgent
    Left = 336
    Top = 49
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
    object TBSeparatorItem3: TTBSeparatorItem
    end
    object TBItem4: TTBItem
      Action = aRefresh
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
