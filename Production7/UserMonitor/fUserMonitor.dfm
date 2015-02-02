inherited fmUserMonitor: TfmUserMonitor
  object grdMain: TssDBGrid [0]
    Left = 0
    Top = 0
    Width = 435
    Height = 266
    Hint = 'interval'
    DrawDragFrame = False
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'userid'
    SummaryGroups = <>
    SummarySeparator = ', '
    Align = alClient
    ParentShowHint = False
    PopupMenu = pmMain
    ShowHint = True
    TabOrder = 0
    DataSource = srcView
    Filter.Criteria = {00000000}
    LookAndFeel = lfUltraFlat
    OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    OnCustomDrawCell = grdMainCustomDrawCell
    object colUserName: TdxDBGridColumn
      Alignment = taLeftJustify
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      HeaderAlignment = taCenter
      Sizing = False
      Sorted = csDown
      Width = 200
      BandIndex = 0
      RowIndex = 0
      FieldName = 'name'
    end
    object colLogin: TdxDBGridColumn
      Caption = #1051#1086#1075#1080#1085
      HeaderAlignment = taCenter
      Sizing = False
      Width = 94
      BandIndex = 0
      RowIndex = 0
      FieldName = 'login'
    end
    object colFun: TdxDBGridColumn
      Caption = #1052#1086#1076#1091#1083#1100
      HeaderAlignment = taCenter
      Sizing = False
      Width = 193
      BandIndex = 0
      RowIndex = 0
      OnCustomDrawCell = colFunCustomDrawCell
      FieldName = 'funid'
      OnGetText = colFunGetText
    end
    object colInterval: TdxDBGridColumn
      Alignment = taLeftJustify
      HeaderAlignment = taCenter
      Sizing = False
      Width = 150
      BandIndex = 0
      RowIndex = 0
      FieldName = 'interval'
      OnGetText = colIntervalGetText
    end
  end
  inherited ActionList: TActionList
    Left = 60
    Top = 72
  end
  inherited pmMain: TTBPopupMenu
    Left = 32
    Top = 72
    inherited TBItem1: TTBItem
      Visible = False
    end
    inherited TBItem2: TTBItem
      Visible = False
    end
    inherited TBSeparatorItem1: TTBSeparatorItem
      Visible = False
    end
    inherited TBSeparatorItem2: TTBSeparatorItem
      Visible = False
    end
    inherited TBItem3: TTBItem
      Visible = False
    end
  end
  object srcView: TDataSource
    DataSet = cdsMain
    Left = 32
    Top = 104
  end
  object Timer: TTimer
    Interval = 2000
    OnTimer = TimerTimer
    Left = 92
    Top = 72
  end
  object cdsMain: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pSysActiveUsers_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 60
    Top = 104
  end
  object cdsUTV: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'profid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'lang'
        ParamType = ptUnknown
      end>
    ProviderName = 'pUserTreeView_Get'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsUTVBeforeOpen
    Macros = <>
    Left = 140
    Top = 104
  end
end
