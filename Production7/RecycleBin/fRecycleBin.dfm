inherited fmRecycleBin: TfmRecycleBin
  object grdMain: TssDBGrid [0]
    Left = 0
    Top = 29
    Width = 435
    Height = 237
    Hint = 'IMAGEINDEX'
    DrawDragFrame = False
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'DelID'
    SummaryGroups = <>
    SummarySeparator = ', '
    Align = alClient
    ParentShowHint = False
    PopupMenu = pmMain
    ShowHint = True
    TabOrder = 0
    OnClick = grdMainClick
    OnDblClick = grdMainDblClick
    DataSource = srcView
    Filter.Criteria = {00000000}
    LookAndFeel = lfUltraFlat
    OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoTabThrough, edgoVertThrough]
    OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoRowSelect, edgoUseBitmap]
    object colDelID: TdxDBGridColumn
      Visible = False
      Width = 37
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DELID'
    end
    object colImageIndex: TdxDBGridImageColumn
      Alignment = taCenter
      HeaderAlignment = taCenter
      MinWidth = 16
      Sizing = False
      Width = 32
      BandIndex = 0
      RowIndex = 0
      FieldName = 'IMAGEINDEX'
      OnGetText = colImageIndexGetText
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
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        '164'
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        '179'
        ''
        ''
        ''
        ''
        ''
        ''
        '186')
    end
    object colName: TdxDBGridColumn
      Alignment = taLeftJustify
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      HeaderAlignment = taCenter
      Sizing = False
      Width = 248
      BandIndex = 0
      RowIndex = 0
      FieldName = 'TEXTSTR'
    end
    object colUserName: TdxDBGridColumn
      HeaderAlignment = taCenter
      Sizing = False
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'username'
    end
    object colOnTime: TdxDBGridColumn
      Alignment = taCenter
      Caption = #1042#1088#1077#1084#1103' '#1091#1076#1072#1083#1077#1085#1080#1103
      HeaderAlignment = taCenter
      Sizing = False
      Width = 110
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ONTIME'
    end
    object colFunID: TdxDBGridColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'Funid'
    end
    object colClassName: TdxDBGridColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'classname'
    end
    object colID: TdxDBGridColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ID'
    end
    object colGType: TdxDBGridColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'gtype'
    end
    object colTabID: TdxDBGridColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'tabid'
    end
  end
  object grdTree: TdxDBTreeList [1]
    Left = 0
    Top = 29
    Width = 435
    Height = 237
    DrawDragFrame = False
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'ID'
    ParentField = 'PID'
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PopupMenu = pmMain
    TabOrder = 1
    Visible = False
    AutoExpandOnSearch = False
    BandFont.Charset = DEFAULT_CHARSET
    BandFont.Color = clWindowText
    BandFont.Height = -11
    BandFont.Name = 'Tahoma'
    BandFont.Style = []
    DataSource = srcTree
    GridLineColor = clBtnFace
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'Tahoma'
    HeaderFont.Style = []
    ImageIndexFieldName = 'IMAGEINDEX'
    Images = dmData.Images
    LookAndFeel = lfUltraFlat
    OptionsBehavior = [etoAutoDragDrop, etoAutoDragDropCopy, etoAutoSort, etoDragExpand, etoDragScroll, etoEditing, etoEnterShowEditor, etoImmediateEditor, etoMultiSelect, etoTabThrough]
    OptionsView = [etoBandHeaderWidth, etoHideFocusRect, etoRowSelect, etoUseBitmap, etoUseImageIndexForSelected]
    PreviewFont.Charset = DEFAULT_CHARSET
    PreviewFont.Color = clBlue
    PreviewFont.Height = -11
    PreviewFont.Name = 'Tahoma'
    PreviewFont.Style = []
    ShowGrid = True
    TreeLineColor = clGradientInactiveCaption
    OnGetImageIndex = grdTreeGetImageIndex
    OnGetSelectedIndex = grdTreeGetImageIndex
    OnCustomDrawCell = grdTreeCustomDrawCell
    OnSelectedCountChange = grdTreeSelectedCountChange
    object colRID: TdxDBTreeListColumn
      Visible = False
      Width = 20
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ID'
    end
    object colTFun: TdxDBTreeListColumn
      HeaderAlignment = taCenter
      Sizing = False
      Width = 331
      BandIndex = 0
      RowIndex = 0
      FieldName = 'textstr'
    end
    object colRImageIndex: TdxDBTreeListColumn
      Sizing = False
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'IMAGEINDEX'
    end
    object colTUserName: TdxDBTreeListColumn
      HeaderAlignment = taCenter
      Sizing = False
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'username'
    end
    object colROnTime: TdxDBTreeListColumn
      Alignment = taCenter
      Caption = #1042#1088#1077#1084#1103' '#1091#1076#1072#1083#1077#1085#1080#1103
      HeaderAlignment = taCenter
      Sizing = False
      Sorted = csUp
      Width = 110
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ontime'
    end
    object colTTabID: TdxDBTreeListColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'tabid'
    end
    object colTDelID: TdxDBTreeListColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'delid'
    end
    object colTClassName: TdxDBTreeListColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'classname'
    end
    object colTGType: TdxDBTreeListColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'gtype'
    end
    object colTFunID: TdxDBTreeListColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'funid'
    end
  end
  object panFilter: TPanel [2]
    Left = 0
    Top = 0
    Width = 435
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    DesignSize = (
      435
      29)
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
    object lUser: TLabel
      Left = 446
      Top = 9
      Width = 80
      Height = 16
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Who removed'
    end
    object lFun: TLabel
      Left = 244
      Top = 9
      Width = 42
      Height = 16
      Alignment = taRightJustify
      Caption = 'Section'
    end
    object lFromDate: TssLabel
      Left = 25
      Top = 9
      Width = 8
      Height = 16
      Alignment = taRightJustify
      Caption = #1057
      Enabled = False
      DisabledDraw = ddUser
      DisabledColor = clBtnShadow
    end
    object lToDate: TssLabel
      Left = 143
      Top = 9
      Width = 15
      Height = 16
      Alignment = taRightJustify
      Caption = #1055#1086
      Enabled = False
      DisabledDraw = ddUser
      DisabledColor = clBtnShadow
    end
    object lcbFunctions: TssDBLookupCombo
      Left = 300
      Top = 3
      Width = 133
      Height = 24
      ImeName = 'Russian'
      ParentFont = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.Items.Strings = (
        '*'
        '*'
        '*'
        '*'
        '*'
        '*'
        '*'
        '*'
        '*')
      Properties.OnChange = lcbFunctionsPropertiesChange
      Properties.OnEditValueChanged = lcbFunctionsPropertiesEditValueChanged
      Style.StyleController = dmData.scMain
      TabOrder = 0
      Text = '*'
      DisplayEmpty = '*'
      EmptyValue = 0
      KeyField = 'funid'
      ListField = 'name'
      ListSource = srcFunctions
    end
    object lcbUsers: TssDBLookupCombo
      Left = 547
      Top = 4
      Width = 121
      Height = 24
      ImeName = 'Russian'
      ParentFont = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.Items.Strings = (
        '*'
        '*'
        '*'
        '*'
        '*'
        '*'
        '*'
        '*'
        '*')
      Properties.OnChange = lcbUsersPropertiesChange
      Properties.OnEditValueChanged = lcbUsersPropertiesEditValueChanged
      Style.StyleController = dmData.scMain
      TabOrder = 1
      Text = '*'
      DisplayEmpty = '*'
      EmptyValue = -1
      KeyField = 'userid'
      ListField = 'name'
      ListSource = srcUsers
    end
    object edFromDate: TcxDateEdit
      Left = 36
      Top = 5
      Width = 77
      Height = 24
      BeepOnEnter = False
      Enabled = False
      ImeName = 'Russian'
      ParentFont = False
      Properties.ReadOnly = False
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      Style.StyleController = dmData.scMain
      TabOrder = 2
    end
    object edToDate: TcxDateEdit
      Left = 161
      Top = 5
      Width = 76
      Height = 24
      BeepOnEnter = False
      Enabled = False
      ImeName = 'Russian'
      ParentFont = False
      Properties.ReadOnly = False
      Style.LookAndFeel.Kind = lfFlat
      Style.LookAndFeel.NativeStyle = False
      Style.StyleController = dmData.scMain
      TabOrder = 3
    end
  end
  inherited ActionList: TActionList
    OnUpdate = ActionListUpdate
    Left = 60
    Top = 72
    object aRestore: TAction
      Category = 'All'
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100
      OnExecute = aRestoreExecute
    end
    object aRestoreAll: TAction
      Category = 'All'
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1074#1089#1105
      OnExecute = aRestoreAllExecute
    end
    object aEmpty: TAction
      Category = 'All'
      Caption = #1059#1076#1072#1083#1080#1090#1100
    end
    object aEmptyAll: TAction
      Category = 'All'
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1082#1086#1088#1079#1080#1085#1091
      OnExecute = aEmptyAllExecute
    end
    object aTree: TAction
      Category = 'View'
      Caption = #1054#1090#1086#1073#1088#1072#1078#1072#1090#1100' '#1074' '#1076#1077#1088#1077#1074#1077
      OnExecute = aTreeExecute
    end
    object aLocateAfterRestore: TAction
      Caption = 'aLocateAfterRestore'
      Checked = True
      OnExecute = aLocateAfterRestoreExecute
    end
  end
  inherited pmMain: TTBPopupMenu
    Left = 32
    Top = 72
    object TBItem6: TTBItem [0]
      Action = aRestore
    end
    object TBItem7: TTBItem [1]
      Action = aRestoreAll
    end
    object TBSeparatorItem3: TTBSeparatorItem [2]
    end
    inherited TBItem1: TTBItem
      Visible = False
    end
    object TBItem8: TTBItem [5]
      Action = aEmptyAll
    end
    object TBItem5: TTBItem [9]
      Action = aTree
    end
    object TBItem9: TTBItem [10]
      Action = aLocateAfterRestore
    end
    inherited TBItem3: TTBItem
      Visible = False
    end
  end
  object srcView: TDataSource
    DataSet = cdsView
    Left = 32
    Top = 104
  end
  object cdsView: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'shortname'
        ParamType = ptUnknown
      end>
    ProviderName = 'pRBin_List'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsViewBeforeOpen
    AfterOpen = cdsViewAfterOpen
    Macros = <
      item
        DataType = ftString
        Name = 'm'
        ParamType = ptUnknown
      end>
    Left = 60
    Top = 104
  end
  object srcTree: TDataSource
    DataSet = mdTree
    Left = 32
    Top = 144
  end
  object mdTree: TssMemoryData
    FieldDefs = <>
    Left = 60
    Top = 144
    object mdTreetextstr: TStringField
      DisplayWidth = 128
      FieldName = 'textstr'
      Size = 128
    end
    object mdTreeontime: TDateTimeField
      FieldName = 'ontime'
    end
    object mdTreename: TStringField
      FieldName = 'name'
      Size = 128
    end
    object mdTreefunid: TIntegerField
      FieldName = 'funid'
    end
    object mdTreeimageindex: TIntegerField
      FieldName = 'imageindex'
    end
    object mdTreetabid: TIntegerField
      FieldName = 'tabid'
    end
    object mdTreeid: TIntegerField
      FieldName = 'id'
    end
    object mdTreepid: TIntegerField
      FieldName = 'pid'
    end
    object mdTreedelid: TIntegerField
      FieldName = 'delid'
    end
    object mdTreeclassname: TStringField
      FieldName = 'classname'
      Size = 128
    end
    object mdTreeusername: TStringField
      FieldName = 'username'
      Size = 64
    end
    object mdTreegtype: TIntegerField
      FieldName = 'gtype'
    end
  end
  object cdsFunctions: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'shortname'
        ParamType = ptUnknown
      end>
    ProviderName = 'pOperLog_FunList'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsFunctionsBeforeOpen
    Macros = <>
    Left = 112
    Top = 56
  end
  object srcFunctions: TDataSource
    DataSet = cdsFunctions
    Left = 84
    Top = 56
  end
  object cdsUsers: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pSysUsers_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 364
    Top = 73
    object cdsUsersUSERID: TIntegerField
      FieldName = 'USERID'
      Required = True
    end
    object cdsUsersNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 24
    end
    object cdsUsersPASS: TStringField
      FieldName = 'PASS'
      Required = True
      Size = 24
    end
    object cdsUsersSYSNAME: TStringField
      FieldName = 'SYSNAME'
      Required = True
      Size = 31
    end
    object cdsUsersFULLNAME: TStringField
      FieldName = 'FULLNAME'
      Size = 128
    end
  end
  object srcUsers: TDataSource
    DataSet = cdsUsers
    Left = 336
    Top = 73
  end
end
