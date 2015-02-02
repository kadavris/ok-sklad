inherited fmUserGroups: TfmUserGroups
  object grdMain: TdxDBGrid [0]
    Left = 0
    Top = 0
    Width = 443
    Height = 277
    DrawDragFrame = False
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'GRPID'
    SummaryGroups = <>
    SummarySeparator = ', '
    Align = alClient
    PopupMenu = pmMain
    TabOrder = 0
    OnDblClick = grdMainDblClick
    DataSource = dsEqType
    Filter.Criteria = {00000000}
    LookAndFeel = lfFlat
    OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    OnCustomDrawCell = grdMainCustomDrawCell
    object colName: TdxDBGridColumn
      Width = 241
      Alignment = taLeftJustify
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      HeaderAlignment = taCenter
      Sorted = csUp
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME'
    end
  end
  inherited ActionList: TActionList
    Left = 60
  end
  object cdsView: TClientDataSet
    Left = 64
    Top = 104
    Aggregates = <>
    Params = <>
    ProviderName = 'pUserGroups_List'
    RemoteServer = dmData.SConnection
  end
  object dsEqType: TDataSource
    Left = 32
    Top = 104
    DataSet = cdsView
  end
end
