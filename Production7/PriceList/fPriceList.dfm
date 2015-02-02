inherited fmPriceList: TfmPriceList
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 225
    Width = 435
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object PanMaster: TPanel [1]
    Left = 0
    Top = 0
    Width = 435
    Height = 225
    Align = alTop
    BevelOuter = bvNone
    Caption = 'PanMaster'
    ParentBackground = False
    TabOrder = 0
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
    object ssBevel4: TssBevel
      Left = 0
      Top = 30
      Width = 1
      Height = 164
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
      Left = 434
      Top = 30
      Width = 1
      Height = 164
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
    object ssBevel12: TssBevel
      Left = 0
      Top = 194
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
    object dbgPriceList: TssDBGrid
      Left = 1
      Top = 30
      Width = 433
      Height = 164
      Hint = 'DELETED'
      DrawDragFrame = False
      Bands = <
        item
        end>
      DefaultLayout = True
      HeaderPanelRowCount = 1
      KeyField = 'PLID'
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
      PopupMenu = pmMain
      ShowHint = True
      TabOrder = 0
      OnDblClick = dbgPriceListDblClick
      BandFont.Charset = DEFAULT_CHARSET
      BandFont.Color = clBlack
      BandFont.Height = -11
      BandFont.Name = 'Tahoma'
      BandFont.Style = [fsBold]
      DataSource = dsPriceList
      Filter.Criteria = {00000000}
      GridLineColor = clBtnFace
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
      OptionsView = [edgoBandHeaderWidth, edgoRowAutoHeight, edgoRowSelect, edgoUseBitmap]
      PreviewFont.Charset = DEFAULT_CHARSET
      PreviewFont.Color = clBlue
      PreviewFont.Height = -11
      PreviewFont.Name = 'Tahoma'
      PreviewFont.Style = [fsBold]
      OnChangeNode = dbgPriceListChangeNode
      OnCustomDrawCell = dbgPriceListCustomDrawCell
      object colDocImg: TdxDBGridImageColumn
        Alignment = taLeftJustify
        DisableCaption = True
        MinWidth = 16
        Sizing = False
        Width = 25
        BandIndex = 0
        RowIndex = 0
        FieldName = 'DELETED'
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
          '154')
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
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          '0')
      end
      object colOnDate: TdxDBGridColumn
        Alignment = taCenter
        HeaderAlignment = taCenter
        MaxLength = 100
        MinWidth = 90
        Sizing = False
        Width = 90
        BandIndex = 0
        RowIndex = 0
        FieldName = 'ONDATE'
        OnGetText = colOnDateGetText
      end
      object colName: TdxDBGridColumn
        HeaderAlignment = taCenter
        Width = 37
        BandIndex = 0
        RowIndex = 0
        FieldName = 'NAME'
      end
      object colCrName: TdxDBGridColumn
        Alignment = taCenter
        HeaderAlignment = taCenter
        Sorted = csUp
        Width = 71
        BandIndex = 0
        RowIndex = 0
        FieldName = 'CRNAME'
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
      object ssBevel2: TssBevel
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
      object prdMain: TokPeriod
        Left = 6
        Top = 5
        Width = 291
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
          291
          21)
      end
    end
    object panFooter: TPanel
      Left = 0
      Top = 195
      Width = 435
      Height = 30
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 2
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
      object lDocsCount: TLabel
        Left = 586
        Top = 8
        Width = 96
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = #1042#1089#1077#1075#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074':'
      end
      object stCount: TssBevel
        Left = 694
        Top = 7
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
    end
  end
  object pcMain: TcxPageControl [2]
    Left = 0
    Top = 228
    Width = 435
    Height = 38
    ActivePage = PagePositions
    Align = alClient
    Images = dmData.Images
    TabOrder = 1
    OnResize = pcMainResize
    object PagePositions: TcxTabSheet
      ImageIndex = 14
      object ssBevel14: TssBevel
        Left = 0
        Top = 1
        Width = 1
        Height = 12
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
        Top = 13
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
        Height = 12
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
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 433
        Height = 12
        Align = alClient
        BevelOuter = bvNone
        Color = clCaptionText
        ParentBackground = False
        TabOrder = 0
        object dbgListDet: TssDBGrid
          Left = 0
          Top = 0
          Width = 433
          Height = 12
          DrawDragFrame = False
          Bands = <
            item
            end>
          DefaultLayout = True
          HeaderPanelRowCount = 1
          KeyField = 'PLDETID'
          SummaryGroups = <>
          SummarySeparator = ', '
          Align = alClient
          BorderStyle = bsNone
          ParentShowHint = False
          PopupMenu = pmDet
          ShowHint = True
          TabOrder = 0
          DataSource = dsListDet
          Filter.Criteria = {00000000}
          LookAndFeel = lfUltraFlat
          OptionsBehavior = [edgoDragScroll, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoTabThrough, edgoVertThrough]
          OptionsCustomize = [edgoBandSizing]
          OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
          OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
          OnCustomDrawCell = dbgListDetCustomDrawCell
          object dbgListDetRecId: TdxDBGridColumn
            Visible = False
            BandIndex = 0
            RowIndex = 0
            FieldName = 'RecId'
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    OnUpdate = ActionListUpdate
    Left = 78
    Top = 64
    inherited aPatternInsert: TAction [1]
    end
    inherited aProperties: TAction [2]
    end
    inherited aDel: TAction [3]
    end
    inherited aRefresh: TAction [4]
    end
    inherited aDynamic: TAction [5]
    end
    inherited aFind: TAction [6]
    end
    inherited aPrint: TAction [7]
    end
    inherited aCheck: TAction [8]
    end
    inherited aDrillDown: TAction [9]
    end
    inherited aShowFilter: TAction [10]
      Checked = True
    end
    inherited aColParams: TAction [11]
    end
    inherited aCopy: TAction [12]
    end
    inherited aExcel: TAction [13]
    end
    inherited aCut: TAction [14]
    end
    inherited aNew: TAction [15]
    end
    inherited aPaste: TAction [16]
    end
    inherited aSelectAll: TAction [17]
    end
    inherited aShowArchived: TAction [18]
    end
    object aMatInfo: TAction
      Category = 'det'
      Caption = 'aMatInfo'
      ImageIndex = 99
      ShortCut = 16457
      OnExecute = aMatInfoExecute
    end
    object aMatMove: TAction
      Category = 'det'
      Caption = 'aMatMove'
      ImageIndex = 61
      ShortCut = 16461
      OnExecute = aMatMoveExecute
    end
    object aMatRsv: TAction
      Category = 'det'
      Caption = 'aMatRsv'
      ImageIndex = 100
      ShortCut = 16466
      OnExecute = aMatRsvExecute
    end
    object aGrpInfo: TAction
      Category = 'det'
      Caption = 'aGrpInfo'
      ImageIndex = 154
      ShortCut = 16457
      OnExecute = aGrpInfoExecute
    end
    object aSvcInfo: TAction
      Category = 'det'
      Caption = 'aSvcInfo'
      ImageIndex = 160
      OnExecute = aSvcInfoExecute
    end
  end
  inherited pmMain: TTBPopupMenu
    Left = 48
    Top = 64
    object TBItem8: TTBItem [1]
      Action = aPatternInsert
    end
    object TBItem5: TTBItem [6]
      Action = aPrint
    end
    object TBItemPrintLbl: TTBItem [7]
      Tag = 1
      Caption = 'print label'
      ImageIndex = 4
      ShortCut = 16460
      OnClick = TBItemPrintLblClick
    end
    object TBSeparatorItem3: TTBSeparatorItem [8]
    end
    object TBItem6: TTBItem [9]
      Action = aCheck
    end
    object TBItem7: TTBItem
      Action = aShowFilter
    end
  end
  object dsPriceList: TssDataSource
    DataSet = cdsPriceList
    ChangeDelay = 250
    OnDelayedDataChange = dsPriceListDelayedDataChange
    Left = 221
    Top = 64
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
    Left = 480
    Top = 124
  end
  object cdsPriceList: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftDateTime
        Name = 'fromdate'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftDateTime
        Name = 'todate'
        ParamType = ptInput
        Value = 0d
      end>
    ProviderName = 'p_PriceList_List'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsPriceListBeforeOpen
    Macros = <>
    Left = 184
    Top = 64
  end
  object dsListDet: TDataSource
    DataSet = mdListDet
    Left = 322
    Top = 144
  end
  object mdListDet: TssMemoryData
    FieldDefs = <>
    Left = 352
    Top = 144
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnGetValue = frReport11GetValue
    OnBeforePrint = frReport1BeforePrint
    OnPrintColumn = frReport1PrintColumn
    Left = 260
    Top = 144
    ReportForm = {
      19000000E8080000190000000001000100FFFFFFFFFF09000000340800009A0B
      00000000000000000000000000000000000000FFFF00000000FFFF0000000000
      000000000500506167653100030400466F726D000F000080DC00000078000000
      7C0100002C010000000000000200D5000000050042616E643100020100000000
      F4000000F50200000F0000003000050001000000000000000000FFFFFF1F0000
      00000C0066724442446174615365743100000000000000FFFF00000000000200
      0000010000000000000001000000C8000000140000000100000000000002003A
      010000050042616E643300020100000000B7000000F502000028000000300004
      0001000000000000000000FFFFFF1F00000000000000000000000000FFFF0000
      00000002000000010000000000000001000000C8000000140000000100000000
      00000200A60100000C005265706F72745469746C653100020100000000240000
      00F50200008E0000003000000001000000000000000000FFFFFF1F0000000000
      0000000000000000FFFF000000000002000000010000000000000001000000C8
      00000014000000010000000000000200140200000E005265706F727453756D6D
      61727931000201000000001C010000F50200003C000000300001000100000000
      0000000000FFFFFF1F00000000000000000000000000FFFF0000000000020000
      00010000000000000001000000C800000014000000010000000000000200A302
      0000050042616E643200020117000000000000000A0000002F04000030001300
      01000000000000000000FFFFFF1F000000002A0042616E64313D667255736572
      44617461736574313B42616E64333D66725573657244617461736574323B0000
      0000000000FFFF000000000002000000010000000000000001000000C8000000
      140000000100000000000000002803000005004D656D6F4300020017000000F4
      0000000A0000000F00000004000F0001000000000000000000FFFFFF1F2C0200
      0000000001000700205B43656C6C5D00000000FFFF0000000000020000000100
      0000000500417269616C00080000000000000000000A000000CC000200000000
      00FFFFFF0000000002000000000000000000AE03000005004D656D6F48000200
      17000000B70000000A0000002800000006000F0001000000000000000000FFFF
      FF1F2C020000000000010008005B4865616465725D00000000FFFF0000000000
      0200000001000000000500417269616C000A0000000200000000000A000000CC
      00020000000000FFFFFF0000000002000000000000000100050400000700456E
      744C6F676F000200170000003000000078000000780000000500000001000000
      000000000000FFFFFF1F2C020000000000000000000000FFFF00000000000200
      0000010000000000000504000000008C04000005004D656D6F31000200910000
      0024000000EB010000370000000700000001000000000000000000FFFFFF1F2C
      020000000000010009005B656E746E616D655D00000000FFFF00000000000200
      000001000000000500417269616C000A00000002000000000012000000CC0002
      0000000000FFFFFF00000000020000000000000000001405000005004D656D6F
      33000200910000008A0000004C02000028000000030000000100000000000000
      0000FFFFFF1F2C02000000000001000A005B7265707469746C655D00000000FF
      FF00000000000200000001000000020500417269616C000B0000000200000000
      000A000000CC00020000000000FFFFFF00000000020000000000000000009905
      000005004D656D6F32000200160000001C010000C70200003C00000003000000
      01000000000000000000FFFFFF1F2C020000000000010007005B6E6F7465735D
      00000000FFFF00000000000200000001000000070500417269616C0009000000
      0100000000000A000000CC00020000000000FFFFFF0000000002000000000000
      0000002C06000005004D656D6F35000200910000005C0000004C0200002D0000
      000300000001000000000000000000FFFFFF1F2C020000000000020008005B65
      6E746164725D0D0A005B656E7470686F6E655D00000000FFFF00000000000200
      000001000000020500417269616C000A0000000000000000000A000000CC0002
      0000000000FFFFFF0000000002000000000000000000B206000005004D656D6F
      360002007E020000240000005F0000000F0000000F0000000100000000000000
      0000FFFFFF1F2C020000000000010008005B6F6E646174655D00000000FFFF00
      000000000200000001000000020500417269616C000800000000000000000009
      000000CC00020000000000FFFFFF000000000200000000000000FEFEFF000000
      000000000000000000FDFF0100000000FC0100000000FC0100000000FC010000
      0000FC0100000000FC01000000000000000000000000000000005800716E8900
      6FA1E2400DF333AA77A8E2400000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005800
      000000005800FC013EAE0DCD3AB1E340}
  end
  object frUserDataset1: TfrUserDataset
    RangeEnd = reCount
    Left = 291
    Top = 112
  end
  object frUserDataset2: TfrUserDataset
    RangeEnd = reCount
    Left = 323
    Top = 112
  end
  object frDBDataSet1: TfrDBDataSet
    DataSource = dsListDet
    Left = 292
    Top = 144
  end
  object xlsExport: TssXLSExport
    XLSExportFile = xlsExpFile
    Left = 84
    Top = 124
  end
  object xlsExpFile: TXLSExportFile
    Left = 112
    Top = 124
  end
  object pmDet: TTBPopupMenu
    Images = dmData.Images
    Left = 200
    Top = 292
    object TBItem9: TTBItem
      Action = aMatInfo
      Images = dmData.Images
    end
    object TBItem10: TTBItem
      Action = aMatMove
    end
    object TBItem11: TTBItem
      Action = aMatRsv
    end
    object TBItem12: TTBItem
      Action = aGrpInfo
    end
    object TBItem13: TTBItem
      Action = aSvcInfo
    end
    object TBSeparatorItem4: TTBSeparatorItem
    end
    object TBItemDetLabelPrint: TTBItem
      Caption = 'aPrint'
      ImageIndex = 9
      ShortCut = 16460
      OnClick = TBItemPrintLblClick
    end
  end
  object frBarCodeObject1: TfrBarCodeObject
    Left = 396
    Top = 52
  end
  object frReportLabels: TfrReport
    Dataset = frDBDataSetLbl
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Labels'
    RebuildPrinter = False
    OnGetValue = frReportLabelsGetValue
    Left = 44
    Top = 176
    ReportForm = {19000000}
  end
  object frDBDataSetLbl: TfrDBDataSet
    DataSet = mdRep
    Left = 76
    Top = 176
  end
  object mdRep: TssMemoryData
    FieldDefs = <>
    Left = 108
    Top = 176
  end
  object frShapeObject1: TfrShapeObject
    Left = 428
    Top = 52
  end
  object frRoundRectObject1: TfrRoundRectObject
    Left = 460
    Top = 52
  end
end
