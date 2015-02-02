inherited fmEqType: TfmEqType
  object dbgEqType: TdxDBGrid [0]
    Left = 0
    Top = 0
    Width = 443
    Height = 274
    DrawDragFrame = False
    Bands = <
      item
      end>
    DefaultLayout = True
    HeaderPanelRowCount = 1
    KeyField = 'ETYPEID'
    SummaryGroups = <>
    SummarySeparator = ', '
    Align = alClient
    PopupMenu = pmMain
    TabOrder = 0
    OnDblClick = dbgEqTypeDblClick
    DataSource = dsEqType
    Filter.Criteria = {00000000}
    LookAndFeel = lfFlat
    OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoStoreToRegistry, edgoTabThrough, edgoVertThrough]
    OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
    OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
    OnCustomDrawCell = dbgEqTypeCustomDrawCell
    object colName: TdxDBGridColumn
      Width = 241
      Alignment = taLeftJustify
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      HeaderAlignment = taCenter
      BandIndex = 0
      RowIndex = 0
      FieldName = 'NAME'
    end
    object colDEF: TdxDBGridColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'DEF'
    end
    object dbgEqTypeColumn3: TdxDBGridColumn
      Visible = False
      BandIndex = 0
      RowIndex = 0
      FieldName = 'ETYPEID'
    end
  end
  inherited ActionList: TActionList
    Left = 60
  end
  object cdsEqType: TClientDataSet
    Left = 64
    Top = 104
    Aggregates = <>
    Params = <>
    ProviderName = 'pEqType_List'
    RemoteServer = dmData.SConnection
  end
  object dsEqType: TDataSource
    Left = 32
    Top = 104
    DataSet = cdsEqType
  end
end
