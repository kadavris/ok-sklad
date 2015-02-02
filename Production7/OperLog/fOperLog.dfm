inherited fmOperLog: TfmOperLog
  object panFilter: TPanel [0]
    Left = 0
    Top = 0
    Width = 435
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
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
    object lFunction: TLabel
      Left = 279
      Top = 9
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = #1056#1072#1079#1076#1077#1083':'
    end
    object bvlRight: TssBevel
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
    object lUser: TLabel
      Left = 1
      Top = 9
      Width = 76
      Height = 13
      Alignment = taRightJustify
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100':'
    end
    object lcbFunctions: TssDBLookupCombo
      Left = 330
      Top = 5
      Width = 112
      Height = 24
      ImeName = 'Russian'
      ParentFont = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.Items.Strings = (
        'All'
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
        'All'
        'All'
        'All')
      Properties.OnChange = lcbFunctionsPropertiesChange
      Properties.OnEditValueChanged = lcbUsersPropertiesEditValueChanged
      Style.StyleController = dmData.scMain
      TabOrder = 0
      Text = 'All'
      DisplayEmpty = 'All'
      EmptyValue = 0
      KeyField = 'funid'
      ListField = 'name'
      ListSource = srcFunctions
    end
    object lcbUsers: TssDBLookupCombo
      Left = 1
      Top = 5
      Width = 95
      Height = 24
      ImeName = 'Russian'
      ParentFont = False
      Properties.DropDownListStyle = lsEditFixedList
      Properties.Items.Strings = (
        'All'
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
        'All'
        'All'
        'All')
      Properties.OnChange = lcbUsersPropertiesChange
      Properties.OnEditValueChanged = lcbUsersPropertiesEditValueChanged
      Style.StyleController = dmData.scMain
      TabOrder = 1
      Text = 'All'
      DisplayEmpty = 'All'
      EmptyValue = -1
      KeyField = 'userid'
      ListField = 'name'
      ListSource = srcUsers
    end
    object prdMain: TokPeriod
      Left = 6
      Top = 5
      Width = 267
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
      OnChange = prdMainChange
      TabOrder = 2
      ViewType = vtShort
      LangManager = dmData.Lng
      DesignSize = (
        267
        21)
    end
  end
  object grdMain: TdxDBGrid [1]
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
    KeyField = 'OPID'
    SummaryGroups = <>
    SummarySeparator = ', '
    Align = alClient
    PopupMenu = pmMain
    TabOrder = 1
    OnDblClick = grdMainDblClick
    DataSource = srcMain
    Filter.Criteria = {00000000}
    HideFocusRect = True
    HideSelectionColor = 10724259
    HighlightColor = clNavy
    LookAndFeel = lfUltraFlat
    OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoStoreToRegistry, edgoTabThrough, edgoVertThrough]
    OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoRowSelect, edgoUseBitmap]
    OnCustomDrawCell = grdMainCustomDrawCell
    OnSelectedCountChange = grdMainSelectedCountChange
    object colID: TdxDBGridColumn
      Visible = False
      Width = 85
      BandIndex = 0
      RowIndex = 0
      FieldName = 'OPID'
    end
    object colDocType: TdxDBGridImageColumn
      Alignment = taLeftJustify
      Caption = '*'
      MinWidth = 16
      Sizing = False
      Width = 25
      BandIndex = 0
      RowIndex = 0
      FieldName = 'OPCODE'
      Images = dmData.Images14x14
      ImageIndexes.Strings = (
        '0'
        '1'
        '2')
      Values.Strings = (
        'U'
        'I'
        'D')
    end
    object colOnDate: TdxDBGridColumn
      Alignment = taCenter
      Caption = #1044#1072#1090#1072' '#1086#1087#1077#1088#1072#1094#1080#1080
      HeaderAlignment = taCenter
      Sizing = False
      Width = 120
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ONDATE'
    end
    object colFunction: TdxDBGridColumn
      Caption = #1056#1072#1079#1076#1077#1083
      HeaderAlignment = taCenter
      Sizing = False
      Sorted = csUp
      Width = 200
      BandIndex = 0
      RowIndex = 0
      FieldName = 'FNAME'
    end
    object colNum: TdxDBGridColumn
      Alignment = taLeftJustify
      HeaderAlignment = taCenter
      Sizing = False
      Width = 70
      BandIndex = 0
      RowIndex = 0
      FieldName = 'docnum'
    end
    object colState: TdxDBGridColumn
      Alignment = taLeftJustify
      Sizing = False
      Width = 60
      BandIndex = 0
      RowIndex = 0
      OnGetText = colStateGetText
    end
    object colUser: TdxDBGridColumn
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      HeaderAlignment = taCenter
      Sizing = False
      Width = 100
      BandIndex = 0
      RowIndex = 0
      FieldName = 'USERNAME'
      OnGetText = colUserGetText
    end
    object colBefore: TdxDBGridColumn
      Alignment = taLeftJustify
      Caption = #1057#1086#1076#1077#1088#1078#1072#1085#1080#1077
      HeaderAlignment = taCenter
      Sizing = False
      Visible = False
      Width = 280
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATABEFORE'
    end
    object colAfter: TdxDBGridColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DATAAFTER'
    end
  end
  inherited ActionList: TActionList
    Left = 248
    Top = 152
    object aClear: TAction
      Category = 'All'
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1078#1091#1088#1085#1072#1083' '#1089#1086#1073#1099#1090#1080#1081
      OnExecute = aClearExecute
    end
  end
  inherited pmMain: TTBPopupMenu
    Left = 220
    Top = 152
    object TBItem5: TTBItem [5]
      Action = aSelectAll
    end
    object TBItem6: TTBItem [6]
      Action = aClear
    end
    object TBSeparatorItem3: TTBSeparatorItem [7]
    end
  end
  object cdsMain: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'shortname'
        ParamType = ptUnknown
      end
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
    ProviderName = 'pOperLog_List'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsMainBeforeOpen
    AfterOpen = cdsMainAfterOpen
    Macros = <
      item
        DataType = ftString
        Name = 'm'
        ParamType = ptUnknown
      end>
    Left = 248
    Top = 112
  end
  object srcMain: TDataSource
    DataSet = cdsMain
    Left = 220
    Top = 112
  end
  object cdsUsers: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pSysUsers_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 272
    Top = 68
  end
  object srcUsers: TDataSource
    DataSet = cdsUsers
    Left = 244
    Top = 68
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
    Left = 148
    Top = 68
  end
  object srcFunctions: TDataSource
    DataSet = cdsFunctions
    Left = 120
    Top = 68
  end
end
