inherited frmKATurnover: TfrmKATurnover
  Left = 301
  Top = 195
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'frmKATurnover'
  ClientHeight = 656
  ClientWidth = 932
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 932
    Height = 574
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
    object lDocType: TLabel
      Left = 307
      Top = 8
      Width = 94
      Height = 16
      Alignment = taRightJustify
      Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
    end
    object grdMain: TdxDBGrid
      Left = 0
      Top = 38
      Width = 932
      Height = 503
      DrawDragFrame = False
      Bands = <
        item
          Caption = #1044#1086#1082#1091#1084#1077#1085#1090
        end
        item
          Caption = #1057#1091#1084#1084#1072
          Width = 456
        end>
      DefaultLayout = False
      HeaderPanelRowCount = 1
      KeyField = 'ID'
      SummaryGroups = <>
      SummarySeparator = ', '
      Align = alClient
      ParentShowHint = False
      PopupMenu = pmMain
      ShowHint = True
      TabOrder = 2
      OnDblClick = grdMainDblClick
      OnMouseMove = grdMainMouseMove
      DataSource = srcView
      Filter.Criteria = {00000000}
      FixedBandLineColor = clBtnFace
      GroupPanelColor = clBtnFace
      LookAndFeel = lfUltraFlat
      OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEnterShowEditor, edgoImmediateEditor, edgoTabThrough, edgoVertThrough]
      OptionsCustomize = [edgoBandSizing, edgoColumnSizing]
      OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
      OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
      ShowBands = True
      OnCustomDrawCell = grdMainCustomDrawCell
      object colID: TdxDBGridColumn
        Visible = False
        Width = 169
        BandIndex = 0
        RowIndex = 0
        FieldName = 'id'
      end
      object colDocType: TdxDBGridImageColumn
        Alignment = taCenter
        Caption = '*'
        HeaderAlignment = taCenter
        MinWidth = 16
        Width = 28
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
          '157')
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
          '2'
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
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
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
          '-6')
      end
      object colType: TdxDBGridColumn
        Alignment = taCenter
        Width = 85
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
        Width = 93
        BandIndex = 0
        RowIndex = 0
        FieldName = 'NUM'
      end
      object colOnDate: TdxDBGridColumn
        Tag = 1
        Alignment = taLeftJustify
        Caption = #1044#1072#1090#1072
        HeaderAlignment = taCenter
        Sorted = csUp
        Width = 105
        BandIndex = 0
        RowIndex = 0
        FieldName = 'ONDATE'
      end
      object colPrice: TdxDBGridColumn
        Alignment = taRightJustify
        Caption = #1042' '#1091#1095#1105#1090'. '#1074#1072#1083#1102#1090#1077
        HeaderAlignment = taCenter
        Width = 111
        BandIndex = 1
        RowIndex = 0
        FieldName = 'summall'
        OnGetText = colPriceGetText
      end
      object colCurrency: TdxDBGridColumn
        Caption = #1042#1072#1083#1102#1090#1072
        HeaderAlignment = taCenter
        Width = 55
        BandIndex = 1
        RowIndex = 0
        FieldName = 'SHORTNAME'
        OnGetText = colCurrencyGetText
      end
      object colRate: TdxDBGridColumn
        Caption = #1050#1091#1088#1089
        HeaderAlignment = taCenter
        Width = 62
        BandIndex = 1
        RowIndex = 0
        FieldName = 'ONVALUE'
      end
      object colNPrice: TdxDBGridColumn
        Alignment = taRightJustify
        Caption = #1042' '#1085#1072#1094'. '#1074#1072#1083#1102#1090#1077
        Width = 99
        BandIndex = 1
        RowIndex = 0
        OnGetText = colNPriceGetText
      end
      object colNCurrency: TdxDBGridColumn
        Caption = #1042#1072#1083#1102#1090#1072
        HeaderAlignment = taCenter
        Width = 55
        BandIndex = 1
        RowIndex = 0
        OnGetText = colNCurrencyGetText
      end
      object colName: TdxDBGridColumn
        Caption = #1050#1086#1085#1090#1088#1072#1075#1077#1085#1090
        HeaderAlignment = taCenter
        Width = 163
        BandIndex = 0
        RowIndex = 0
        OnGetText = colNameGetText
      end
      object colSaldo: TdxDBGridCurrencyColumn
        Caption = #1058#1077#1082'. '#1073#1072#1083#1072#1085#1089
        HeaderAlignment = taCenter
        Width = 74
        BandIndex = 1
        RowIndex = 0
        FieldName = 'saldo'
        DisplayFormat = ',0.00'
        Nullable = False
      end
    end
    object cbDocType: TcxComboBox
      Left = 415
      Top = 3
      Width = 183
      Height = 24
      ImeName = 'Russian'
      ParentFont = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.OnEditValueChanged = edFromDatePropertiesEditValueChanged
      Style.StyleController = dmData.scMain
      TabOrder = 1
    end
    object prdMain: TokPeriod
      Left = 10
      Top = 6
      Width = 275
      Height = 21
      AutoAlign = True
      CapType = 'Period:'
      CapMonth = 'Month:'
      CapYear = 'Year:'
      CapQuarter = 'Quarter:'
      CapFrom = 'Starting from:'
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
    object Panel1: TPanel
      Left = 0
      Top = 541
      Width = 932
      Height = 33
      Align = alBottom
      BevelInner = bvLowered
      ParentBackground = False
      TabOrder = 3
      DesignSize = (
        932
        33)
      object lBallance: TssLabel
        Left = 666
        Top = 9
        Width = 47
        Height = 16
        Alignment = taRightJustify
        Anchors = [akLeft, akBottom]
        Caption = #1041#1072#1083#1072#1085#1089':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        DisabledDraw = ddUser
        DisabledColor = clBtnShadow
      end
      object txtBallance: TssBevel
        Left = 722
        Top = 5
        Width = 200
        Height = 20
        Alignments.Horz = taRightJustify
        Anchors = [akLeft, akBottom]
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
    Width = 932
    inherited panTitleButtons: TssPanel
      Left = 874
    end
  end
  inherited panButtons: TPanel
    Top = 621
    Width = 932
    inherited btnOK: TxButton
      Left = 725
      Top = 9
      Anchors = [akTop]
    end
    inherited btnCancel: TxButton
      Left = 828
      Top = 9
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
      Left = 882
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 906
    end
    inherited btnHelp: TssSpeedButton
      Left = 858
    end
    object btnPrintDoc: TssSpeedButton
      Left = 32
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
      LeftMargin = 3
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
      LeftMargin = 3
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
    Left = 12
    Top = 172
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
  end
  object cdsView: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'kaid'
        ParamType = ptInput
      end
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
        Name = 'kaid1'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'fromdate1'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'todate1'
        ParamType = ptInput
      end>
    ProviderName = 'pKAgent_Turnover'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsViewBeforeOpen
    AfterOpen = cdsViewAfterOpen
    Macros = <
      item
        DataType = ftString
        Name = 'm'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'p'
        ParamType = ptUnknown
      end>
    Left = 44
    Top = 156
  end
  object srcView: TDataSource
    DataSet = mdView
    Left = 72
    Top = 156
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
    DataSource = srcView
    Left = 72
    Top = 184
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
  object mdView: TdxMemData
    Indexes = <>
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
    SortOptions = [soCaseInsensitive]
    Left = 120
    Top = 184
    object StringField1: TStringField
      FieldName = 'docnum'
      Size = 15
    end
    object DateField1: TDateField
      FieldName = 'DocDate'
    end
    object StringField2: TStringField
      FieldName = 'KAFullName'
      Size = 255
    end
    object StringField3: TStringField
      FieldName = 'EntName'
      Size = 255
    end
    object StringField4: TStringField
      FieldName = 'Reason'
      Size = 255
    end
    object StringField5: TStringField
      FieldName = 'Person'
      Size = 64
    end
    object IntegerField1: TIntegerField
      FieldName = 'PosNo'
    end
    object StringField6: TStringField
      FieldName = 'PosMatName'
      Size = 128
    end
    object StringField7: TStringField
      FieldName = 'PosMsrName'
      Size = 6
    end
    object FloatField1: TFloatField
      FieldName = 'PosAmount'
    end
    object FloatField2: TFloatField
      FieldName = 'PosPrice'
    end
    object StringField8: TStringField
      FieldName = 'PosSumm'
    end
    object StringField9: TStringField
      FieldName = 'AllSummNDSOut'
      Size = 64
    end
    object StringField10: TStringField
      FieldName = 'AllSummNDS'
      Size = 64
    end
    object StringField11: TStringField
      FieldName = 'AllSumm'
      Size = 64
    end
    object StringField12: TStringField
      DisplayWidth = 255
      FieldName = 'Propis'
      Size = 1024
    end
    object FloatField3: TFloatField
      FieldName = 'CurNDS'
    end
    object mdViewsaldo: TCurrencyField
      FieldName = 'saldo'
    end
  end
end
