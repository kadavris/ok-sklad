inherited fmDB: TfmDB
  object ssBevel3: TssBevel [0]
    Left = 0
    Top = 1
    Width = 1
    Height = 272
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
  object ssBevel9: TssBevel [1]
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
    UseGradient = False
  end
  object ssBevel8: TssBevel [2]
    Left = 442
    Top = 1
    Width = 1
    Height = 272
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
  object ssBevel12: TssBevel [3]
    Left = 0
    Top = 273
    Width = 443
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
  object grdMain: TdxDBGrid [4]
    Left = 1
    Top = 1
    Width = 441
    Height = 272
    DrawDragFrame = False
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'DBID'
    SummaryGroups = <>
    SummarySeparator = ', '
    Align = alClient
    BorderStyle = bsNone
    PopupMenu = pmMain
    TabOrder = 0
    OnDblClick = grdMainDblClick
    OnKeyDown = grdMainKeyDown
    DataSource = srcMain
    Filter.Criteria = {00000000}
    LookAndFeel = lfUltraFlat
    OptionsCustomize = [edgoBandMoving, edgoBandSizing, edgoColumnSizing]
    OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    OnCustomDrawCell = grdMainCustomDrawCell
    object colImg: TdxDBGridImageColumn
      Alignment = taLeftJustify
      MinWidth = 16
      Sizing = False
      Width = 30
      BandIndex = 0
      RowIndex = 0
      OnGetText = colImgGetText
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
        '123')
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
        '1')
    end
    object colCurrent: TdxDBGridCheckColumn
      Caption = 'Curr'
      DisableCaption = True
      DisableEditor = True
      HeaderAlignment = taCenter
      MaxLength = 20
      MinWidth = 20
      Sizing = False
      Sorted = csUp
      TabStop = False
      Width = 20
      BandIndex = 0
      RowIndex = 0
      OnGetText = colCurrentGetText
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object colName: TdxDBGridColumn
      Alignment = taLeftJustify
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      HeaderAlignment = taCenter
      Width = 167
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DESC'
    end
    object colDef: TdxDBGridColumn
      Visible = False
      Width = 330
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DEF'
    end
    object colID: TdxDBGridColumn
      Visible = False
      Width = 395
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DBID'
    end
    object colPath: TdxDBGridColumn
      Caption = #1055#1091#1090#1100' '#1082' '#1073#1072#1079#1077' '#1076#1072#1085#1085#1099#1093
      HeaderAlignment = taCenter
      Width = 244
      BandIndex = 0
      RowIndex = 0
      OnGetText = colPathGetText
    end
  end
  inherited ActionList: TActionList
    OnUpdate = ActionListUpdate
    Left = 60
    Top = 64
    object aReconnect: TAction
      Category = 'All'
      Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100#1089#1103' '#1082' '#1073#1072#1079#1077' '#1076#1072#1085#1085#1099#1093
      OnExecute = aReconnectExecute
    end
  end
  inherited pmMain: TTBPopupMenu
    Left = 32
    Top = 64
    object TBItem5: TTBItem [1]
      Action = aPatternInsert
    end
    object TBItem6: TTBItem [6]
      Action = aReconnect
    end
    object TBSeparatorItem3: TTBSeparatorItem [7]
    end
  end
  object srcMain: TDataSource
    DataSet = cdsMain
    OnDataChange = srcMainDataChange
    Left = 32
    Top = 104
  end
  object cdsMain: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pSysDB_List'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsMainBeforeOpen
    AfterOpen = cdsMainAfterOpen
    Macros = <>
    Left = 60
    Top = 104
  end
  object cdsParams: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pSysDBParams_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 60
    Top = 132
  end
end
