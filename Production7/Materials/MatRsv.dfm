inherited frmMatRsv: TfrmMatRsv
  Left = 418
  Top = 220
  VertScrollBar.Range = 0
  ActiveControl = grdMain
  BorderStyle = bsDialog
  Caption = 'frmMatRsv'
  ClientHeight = 648
  ClientWidth = 932
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 932
    Height = 566
    DesignSize = (
      932
      566)
    object ssBevel4: TssBevel
      Left = 0
      Top = 0
      Width = 932
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
      Left = 297
      Top = 11
      Width = 66
      Height = 16
      Alignment = taRightJustify
      Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
    end
    object btnKagent: TssSpeedButton
      Left = 642
      Top = 6
      Width = 26
      Height = 26
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 18
      Images = dmData.Images
      LeftMargin = 2
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
      OnClick = btnKagentClick
    end
    object lDocType: TLabel
      Left = 685
      Top = 11
      Width = 94
      Height = 16
      Alignment = taRightJustify
      Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
    end
    object grdMain: TssDBTreeList
      Left = 0
      Top = 38
      Width = 932
      Height = 491
      Hint = '*'
      DrawDragFrame = False
      Bands = <
        item
          Caption = #1044#1086#1082#1091#1084#1077#1085#1090
        end
        item
          Caption = #1058#1086#1074#1072#1088
        end
        item
          Caption = #1057#1091#1084#1084#1072
        end>
      DefaultLayout = False
      HeaderPanelRowCount = 1
      KeyField = 'posid'
      ParentField = 'pid'
      Align = alTop
      ParentShowHint = False
      PopupMenu = pmMain
      ShowHint = True
      TabOrder = 3
      OnDblClick = grdMainDblClick
      OnMouseMove = grdMainMouseMove
      DataSource = srcMain
      FixedBandLineColor = clBtnFace
      GridLineColor = clBtnFace
      LookAndFeel = lfUltraFlat
      ShowBands = True
      ShowGrid = True
      TreeLineColor = clGradientInactiveCaption
      LangManager = dmData.Lng
      OnGetOptionsTitle = grdMainGetOptionsTitle
      object colID: TdxDBGridColumn
        Visible = False
        Width = 33
        BandIndex = 0
        RowIndex = 0
        FieldName = 'POSID'
      end
      object colDocType: TdxDBGridImageColumn
        Alignment = taCenter
        Caption = '*'
        HeaderAlignment = taCenter
        MinWidth = 45
        Sizing = False
        Width = 45
        BandIndex = 0
        RowIndex = 0
        OnCustomDrawCell = colDocTypeCustomDrawCell
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
          '202')
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
          '-1001'
          ''
          ''
          ''
          ''
          ''
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
          ''
          '1002'
          ''
          ''
          ''
          ''
          '-1006'
          ''
          ''
          ''
          '1004'
          '-1005'
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          '-16'
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
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
      object colNum: TdxDBGridColumn
        Tag = 1
        Alignment = taRightJustify
        Caption = #1053#1086#1084#1077#1088
        HeaderAlignment = taCenter
        TabStop = False
        Width = 60
        BandIndex = 0
        RowIndex = 0
        FieldName = 'NUM'
      end
      object colOnDate: TdxDBGridColumn
        Tag = 1
        Alignment = taCenter
        Caption = #1044#1072#1090#1072
        HeaderAlignment = taCenter
        Width = 105
        BandIndex = 0
        RowIndex = 0
        FieldName = 'ONDATE'
      end
      object colAmount: TdxDBGridColumn
        Tag = 1
        Caption = #1050#1086#1083'-'#1074#1086
        HeaderAlignment = taCenter
        Sorted = csUp
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
        Width = 80
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
        Width = 51
        BandIndex = 2
        RowIndex = 0
        FieldName = 'ONVALUE'
      end
      object colNPrice: TdxDBGridColumn
        Tag = 1
        Alignment = taRightJustify
        Caption = #1042' '#1085#1072#1094'. '#1074#1072#1083#1102#1090#1077
        Width = 80
        BandIndex = 2
        RowIndex = 0
        OnGetText = colNPriceGetText
      end
      object colNCurrency: TdxDBGridColumn
        Tag = 1
        Caption = #1042#1072#1083#1102#1090#1072
        HeaderAlignment = taCenter
        Width = 40
        BandIndex = 2
        RowIndex = 0
        OnGetText = colNCurrencyGetText
      end
      object colWHouse: TdxDBGridColumn
        Tag = 1
        Caption = #1057#1082#1083#1072#1076
        HeaderAlignment = taCenter
        Width = 135
        BandIndex = 1
        RowIndex = 0
        FieldName = 'NAME'
      end
      object colPriceIn: TdxDBGridColumn
        Visible = False
        BandIndex = 0
        RowIndex = 0
        FieldName = 'pricein'
      end
      object colKAName: TdxDBGridColumn
        Tag = 1
        HeaderAlignment = taCenter
        Visible = False
        Width = 120
        BandIndex = 0
        RowIndex = 0
        FieldName = 'kagentname'
      end
    end
    object lcbKAgent: TssDBLookupCombo
      Left = 369
      Top = 6
      Width = 271
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
        #1042#1089#1077)
      Properties.OnChange = lcbKAgentPropertiesChange
      Properties.OnEditValueChanged = edFromDatePropertiesEditValueChanged
      Properties.OnInitPopup = lcbKAgentPropertiesInitPopup
      Style.StyleController = dmData.scMain
      TabOrder = 1
      Text = #1042#1089#1077
      DisplayEmpty = #1042#1089#1077
      EmptyValue = 0
      KeyField = 'kaid'
      ListField = 'name'
      ListSource = srcKAgent
    end
    object cbDocType: TcxComboBox
      Left = 788
      Top = 6
      Width = 131
      Height = 24
      ImeName = 'Russian'
      ParentFont = False
      Properties.OnEditValueChanged = cbDocTypePropertiesEditValueChanged
      Style.StyleController = dmData.scMain
      TabOrder = 2
    end
    object panEmpty: TPanel
      Left = 5
      Top = 84
      Width = 921
      Height = 420
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvNone
      Caption = 
        #1044#1072#1085#1085#1099#1081' '#1090#1086#1074#1072#1088' '#1085#1072' '#1090#1077#1082#1091#1097#1080#1081' '#1084#1086#1084#1077#1085#1090' '#1074#1077#1089#1100' '#1089#1074#1086#1073#1086#1076#1077#1085' '#1080' '#1074' '#1088#1077#1079#1077#1088#1074#1077' '#1085#1077' '#1085#1072#1093#1086 +
        #1076#1080#1090#1089#1103
      Color = clWindow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 4
      Visible = False
    end
    object panFooter: TPanel
      Left = 0
      Top = 530
      Width = 932
      Height = 36
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 5
      DesignSize = (
        932
        36)
      object ssBevel3: TssBevel
        Left = 0
        Top = 0
        Width = 932
        Height = 36
        Align = alClient
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
      object lAmount: TssLabel
        Left = 441
        Top = 10
        Width = 82
        Height = 16
        Alignment = taRightJustify
        Anchors = [akLeft, akBottom]
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
      object txtAmount: TssBevel
        Left = 544
        Top = 9
        Width = 129
        Height = 19
        Alignments.Horz = taRightJustify
        Anchors = [akRight, akBottom]
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
      object lTotal: TssLabel
        Left = 694
        Top = 10
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
      object txtTotal: TssBevel
        Left = 758
        Top = 9
        Width = 165
        Height = 19
        Alignments.Horz = taRightJustify
        Anchors = [akRight, akBottom]
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
    end
    object prdMain: TokPeriod
      Left = 12
      Top = 6
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
      TabOrder = 0
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
    Top = 613
    Width = 932
    BevelInner = bvRaised
    BevelOuter = bvLowered
    inherited btnOK: TxButton
      Left = 725
      Anchors = [akTop]
    end
    inherited btnCancel: TxButton
      Left = 828
    end
    inherited btnApply: TxButton
      Left = 620
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
  end
  inherited ilTitleBar: TImageList
    Left = 120
    Top = 156
  end
  inherited FormStorage: TssFormStorage
    Left = 84
    Top = 156
  end
  inherited ActionList: TActionList
    Left = 148
    Top = 156
    object aPrint: TAction [5]
      Caption = #1055#1077#1095#1072#1090#1072#1090#1100
      ImageIndex = 9
      OnExecute = aPrintExecute
    end
    object aPrintMain: TAction [6]
      Caption = #1054#1090#1095#1105#1090' '#1086' '#1076#1074#1080#1078#1077#1085#1080#1080' '#1090#1086#1074#1072#1088#1072
      Hint = #1054#1090#1095#1105#1090' '#1086' '#1076#1074#1080#1078#1077#1085#1080#1080' '#1090#1086#1074#1072#1088#1072
      OnExecute = aPrintMainExecute
    end
    object aPrintDoc: TAction [7]
      Caption = #1044#1086#1082#1091#1084#1077#1085#1090
      OnExecute = aPrintDocExecute
    end
    object aRefresh: TAction [8]
      Caption = 'aRefresh'
      ImageIndex = 6
      ShortCut = 116
      OnExecute = aRefreshExecute
    end
    object aColOptions: TAction
      Caption = 'aColOptions'
      OnExecute = aColOptionsExecute
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
      end>
    ProviderName = 'pWMat_GetRsv'
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
  object srcMain: TDataSource
    DataSet = mdMain
    OnDataChange = srcMainDataChange
    Left = 212
    Top = 197
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
    ModifyPrepared = False
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frDocGetValue
    Left = 184
    Top = 157
    ReportForm = {19000000}
  end
  object fdsView: TfrDBDataSet
    DataSource = srcMain
    Left = 294
    Top = 185
  end
  object pmMain: TTBPopupMenu
    Images = dmData.Images
    Left = 232
    Top = 157
    object TBSubmenuItem1: TTBSubmenuItem
      Action = aPrint
      Images = dmData.Images
      object TBItem5: TTBItem
        Action = aPrintMain
      end
      object TBItem1: TTBItem
        Action = aPrintDoc
      end
    end
    object TBItem2: TTBItem
      Action = aRefresh
    end
    object TBSeparatorItem1: TTBSeparatorItem
    end
    object TBItem3: TTBItem
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
    object mdReportOnValue: TFloatField
      FieldName = 'OnValue'
    end
  end
  object fdsReport: TfrDBDataSet
    DataSet = mdReport
    Left = 266
    Top = 185
  end
  object cdsRsv_Temp: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pSysRsv_List'
    RemoteServer = dmData.SConnection
    Macros = <
      item
        DataType = ftString
        Name = 'm'
        ParamType = ptUnknown
      end>
    Left = 44
    Top = 184
  end
  object mdMain: TdxMemData
    Indexes = <>
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
    SortOptions = []
    SortedField = 'wbillid'
    Left = 184
    Top = 197
    object mdMainwtype: TIntegerField
      FieldName = 'wtype'
    end
    object mdMainwbillid: TIntegerField
      FieldName = 'wbillid'
    end
    object mdMainondate: TDateTimeField
      FieldName = 'ondate'
    end
    object mdMainamount: TFloatField
      FieldName = 'amount'
    end
    object mdMainnum: TStringField
      FieldName = 'num'
    end
    object mdMainname: TStringField
      FieldName = 'name'
      Size = 64
    end
    object mdMainprice: TFloatField
      FieldName = 'price'
    end
    object mdMainshortname: TStringField
      FieldName = 'shortname'
      Size = 10
    end
    object mdMainonvalue: TFloatField
      FieldName = 'onvalue'
    end
    object mdMainposid: TIntegerField
      FieldName = 'posid'
    end
    object mdMainkaid: TIntegerField
      FieldName = 'kaid'
    end
    object mdMainpricein: TFloatField
      FieldName = 'pricein'
    end
    object mdMainkagentname: TStringField
      FieldName = 'kagentname'
      Size = 255
    end
    object mdMainpid: TIntegerField
      FieldName = 'pid'
    end
  end
  object cdsWHouse: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pWHouse_List'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsWHouseBeforeOpen
    Macros = <
      item
        DataType = ftString
        Name = 'm'
        ParamType = ptInput
      end>
    Left = 360
    Top = 189
  end
end
