inherited fmAllReports: TfmAllReports
  object PanMaster: TPanel [0]
    Left = 0
    Top = 0
    Width = 443
    Height = 81
    Align = alClient
    BevelOuter = bvNone
    Caption = 'PanMaster'
    ParentBackground = False
    TabOrder = 0
    object bvlTop: TssBevel
      Left = 0
      Top = 0
      Width = 443
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
    object ssBevel4: TssBevel
      Left = 0
      Top = 1
      Width = 1
      Height = 1
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
    object ssBevel8: TssBevel
      Left = 442
      Top = 1
      Width = 1
      Height = 1
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
    object dbgReports: TdxDBGrid
      Left = 1
      Top = 1
      Width = 441
      Height = 1
      DrawDragFrame = False
      Bands = <
        item
        end>
      DefaultLayout = True
      HeaderPanelRowCount = 1
      KeyField = 'REPID'
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
      PopupMenu = pmMain
      TabOrder = 0
      OnDblClick = dbgReportsDblClick
      BandFont.Charset = DEFAULT_CHARSET
      BandFont.Color = clBlack
      BandFont.Height = -11
      BandFont.Name = 'Tahoma'
      BandFont.Style = [fsBold]
      DataSource = dsReports
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
      OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoStoreToRegistry, edgoTabThrough, edgoVertThrough]
      OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
      OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowAutoHeight, edgoRowSelect, edgoUseBitmap]
      PreviewFont.Charset = DEFAULT_CHARSET
      PreviewFont.Color = clBlue
      PreviewFont.Height = -11
      PreviewFont.Name = 'Tahoma'
      PreviewFont.Style = [fsBold]
      OnChangeNode = dbgReportsChangeNode
      OnCustomDrawCell = dbgReportsCustomDrawCell
      object colDocImg: TdxDBGridImageColumn
        Alignment = taLeftJustify
        Caption = 'WType'
        DisableCaption = True
        MinWidth = 16
        Sizing = False
        Sorted = csUp
        Width = 25
        BandIndex = 0
        RowIndex = 0
        FieldName = 'num'
        OnGetText = colDocImgGetText
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
          '148')
        LargeImages = dmData.LargeImages
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
          '1')
      end
      object colRepName: TdxDBGridColumn
        Caption = #1054#1090
        HeaderAlignment = taCenter
        MaxLength = 500
        MinWidth = 150
        Sizing = False
        Width = 400
        BandIndex = 0
        RowIndex = 0
        FieldName = 'NAME'
      end
    end
    object DBChart1: TDBChart
      Left = 0
      Top = -8
      Width = 443
      Height = 89
      AnimatedZoom = True
      AnimatedZoomSteps = 9
      BackWall.Brush.Color = clWhite
      BackWall.Color = clSilver
      LeftWall.Brush.Color = clWhite
      MarginTop = 5
      Title.Text.Strings = (
        'TDBChart')
      BackColor = clSilver
      Chart3DPercent = 25
      Legend.Alignment = laBottom
      Legend.DividingLines.Visible = True
      Legend.Font.Charset = DEFAULT_CHARSET
      Legend.Font.Color = clBlack
      Legend.Font.Height = -8
      Legend.Font.Name = 'Arial'
      Legend.Font.Style = []
      Legend.LegendStyle = lsSeries
      Legend.ShadowSize = 0
      View3D = False
      View3DOptions.Elevation = 316
      View3DOptions.Perspective = 0
      View3DOptions.Rotation = 360
      View3DOptions.Zoom = 102
      Align = alBottom
      BevelOuter = bvNone
      Color = clCaptionText
      TabOrder = 1
      Visible = False
    end
  end
  object DBGrid1: TDBGrid [1]
    Left = 0
    Top = 81
    Width = 443
    Height = 153
    Align = alBottom
    ImeName = 'Russian'
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
  end
  object DBGrid2: TDBGrid [2]
    Left = 0
    Top = 234
    Width = 443
    Height = 20
    Align = alBottom
    DataSource = dsDetail
    ImeName = 'Russian'
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
  end
  object DBGrid3: TDBGrid [3]
    Left = 0
    Top = 254
    Width = 443
    Height = 20
    Align = alBottom
    DataSource = dsSubDetail
    ImeName = 'Russian'
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
  end
  object dbgRef: TdxDBTreeList [4]
    Left = -4
    Top = 100
    Width = 443
    Height = 40
    DrawDragFrame = False
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'matid'
    ParentField = 'grpid'
    DragMode = dmAutomatic
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    Visible = False
    BandFont.Charset = DEFAULT_CHARSET
    BandFont.Color = clWindowText
    BandFont.Height = -11
    BandFont.Name = 'Tahoma'
    BandFont.Style = []
    GridLineColor = clBtnFace
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'Tahoma'
    HeaderFont.Style = []
    HideFocusRect = True
    Images = dmData.Images
    LookAndFeel = lfUltraFlat
    OptionsBehavior = [etoAutoDragDrop, etoAutoDragDropCopy, etoAutoSort, etoDragExpand, etoDragScroll, etoEditing, etoEnterShowEditor, etoImmediateEditor, etoMultiSelect, etoTabThrough]
    OptionsDB = [etoAutoCalcKeyValue, etoCancelOnExit, etoCanDelete, etoCanNavigation, etoCheckHasChildren, etoConfirmDelete, etoLoadAllRecords, etoSyncSelection]
    OptionsView = [etoAutoWidth, etoBandHeaderWidth, etoRowSelect, etoUseBitmap, etoUseImageIndexForSelected]
    PreviewFont.Charset = DEFAULT_CHARSET
    PreviewFont.Color = clBlue
    PreviewFont.Height = -11
    PreviewFont.Name = 'Tahoma'
    PreviewFont.Style = []
    ShowGrid = True
    TreeLineColor = clGrayText
    OnGetImageIndex = dbgRefGetImageIndex
    OnGetSelectedIndex = dbgRefGetImageIndex
    object colMatId: TdxDBTreeListColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'matid'
    end
    object colGrpId: TdxDBTreeListColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'grpid'
    end
    object colMatName: TdxDBTreeListColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'matname'
    end
    object colMsrName: TdxDBTreeListColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'msrname'
    end
    object colAmount: TdxDBTreeListColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'amount'
    end
    object colSummdef: TdxDBTreeListColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'summdef'
    end
    object colNDSIn: TdxDBTreeListColumn
      BandIndex = 0
      RowIndex = 0
    end
    object colSummIn: TdxDBTreeListColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'summin'
    end
    object colNdsOut: TdxDBTreeListColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ndsout'
    end
    object colNdsDif: TdxDBTreeListColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ndsdif'
    end
    object colPribNDS: TdxDBTreeListColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'pribnds'
    end
    object colPrib: TdxDBTreeListColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Prib'
    end
    object colKoefNDS: TdxDBTreeListColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'KoefNDS'
    end
    object colKoef: TdxDBTreeListColumn
      BandIndex = 0
      RowIndex = 0
      FieldName = 'koef'
    end
    object colRsv: TdxDBTreeListColumn
      BandIndex = 0
      RowIndex = 0
    end
    object colArtikul: TdxDBTreeListColumn
      BandIndex = 0
      RowIndex = 0
    end
    object colProducer: TdxDBTreeListColumn
      BandIndex = 0
      RowIndex = 0
    end
  end
  inherited ActionList: TActionList
    Left = 60
  end
  inherited pmMain: TTBPopupMenu
    inherited TBItem1: TTBItem
      Visible = False
    end
    inherited TBItem2: TTBItem
      Visible = False
    end
    inherited TBSeparatorItem1: TTBSeparatorItem
      Visible = False
    end
    inherited TBItem4: TTBItem
      Visible = False
    end
    inherited TBSeparatorItem2: TTBSeparatorItem
      Visible = False
    end
    inherited TBItem3: TTBItem
      Visible = False
    end
    object TBItem5: TTBItem
      Action = aPrint
    end
  end
  object cdsReports: TssClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'REPID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'GRPID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NAME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 128
      end
      item
        Name = 'FIL'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DOCIMG'
        Attributes = [faRequired]
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'grpid'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'pRep_List'
    RemoteServer = dmData.SConnection
    StoreDefs = True
    BeforeOpen = cdsReportsBeforeOpen
    AfterOpen = cdsReportsAfterOpen
    Macros = <>
    Left = 26
    Top = 56
  end
  object dsReports: TssDataSource
    DataSet = cdsReports
    ChangeDelay = 250
    OnDelayedDataChange = dsReportsDelayedDataChange
    Left = 58
    Top = 56
  end
  object cdsMaster: TssMemoryData
    FieldDefs = <>
    Left = 16
    Top = 203
  end
  object dsMaster: TDataSource
    DataSet = cdsMaster
    OnDataChange = dsMasterDataChange
    Left = 46
    Top = 204
  end
  object cdsDetail: TssClientDataSet
    Aggregates = <>
    Params = <>
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 46
    Top = 232
  end
  object dsDetail: TDataSource
    DataSet = cdsDetail
    OnDataChange = dsDetailDataChange
    Left = 76
    Top = 232
  end
  object cdsSubDetailFetch: TssClientDataSet
    Aggregates = <>
    Params = <>
    RemoteServer = dmData.SConnection
    AfterOpen = cdsSubDetailFetchAfterOpen
    Macros = <>
    Left = 219
    Top = 149
  end
  object dsSubDetail: TDataSource
    DataSet = cdsSubDetail
    Left = 249
    Top = 149
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnBeginBand = frReport1BeginBand
    OnGetValue = frReport1GetValue
    OnBeforePrint = frReport1BeforePrint
    Left = 24
    Top = 104
    ReportForm = {19000000}
  end
  object frDBDSMaster: TfrDBDataSet
    DataSource = dsMaster
    Left = 77
    Top = 204
  end
  object frDBDSDetail: TfrDBDataSet
    DataSource = dsDetail
    Left = 106
    Top = 232
  end
  object frDBDSSubDetail: TfrDBDataSet
    DataSource = dsSubDetail
    Left = 280
    Top = 149
  end
  object cdsMaster2: TssMemoryData
    FieldDefs = <
      item
        Name = 'KAID'
        Attributes = [faReadonly]
        DataType = ftInteger
      end
      item
        Name = 'KANAME'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 64
      end>
    Left = 201
    Top = 204
  end
  object dsMaster2: TDataSource
    DataSet = cdsMaster2
    OnDataChange = dsMaster2DataChange
    Left = 230
    Top = 205
  end
  object frDBDSMaster2: TfrDBDataSet
    DataSource = dsMaster2
    Left = 260
    Top = 205
  end
  object cdsDetail2: TssClientDataSet
    Aggregates = <>
    Params = <>
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 232
    Top = 234
  end
  object dsDetail2: TDataSource
    DataSet = cdsDetail2
    Left = 262
    Top = 234
  end
  object frDBDSDetail2: TfrDBDataSet
    DataSource = dsDetail2
    Left = 292
    Top = 234
  end
  object frCheckBoxObject1: TfrCheckBoxObject
    Left = 72
    Top = 104
  end
  object frChartObject1: TfrChartObject
    Left = 112
    Top = 104
  end
  object tmpDS: TssClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    RemoteServer = dmData.SConnection
    StoreDefs = True
    Macros = <>
    Left = 114
    Top = 24
  end
  object cdsSubDetail: TssMemoryData
    FieldDefs = <>
    Left = 176
    Top = 152
  end
end
