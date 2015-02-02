inherited fmCurrency: TfmCurrency
  object pcMain: TcxPageControl [0]
    Left = 0
    Top = 0
    Width = 435
    Height = 266
    ActivePage = tsMain
    Align = alClient
    TabOrder = 0
    object tsDetail: TcxTabSheet
      Caption = 'tsDetail'
      ImageIndex = 0
      TabVisible = False
      object splMain: TSplitter
        Left = 217
        Top = 0
        Height = 274
      end
      object dbgView: TdxDBGrid
        Left = 0
        Top = 0
        Width = 217
        Height = 274
        DrawDragFrame = False
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'CURRID'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alLeft
        TabOrder = 0
        OnDblClick = dbgViewDblClick
        DataSource = srcView
        Filter.Criteria = {00000000}
        LookAndFeel = lfFlat
        OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
        OnCustomDrawCell = dbgViewCustomDrawCell
        object colName: TdxDBGridColumn
          Alignment = taLeftJustify
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          HeaderAlignment = taCenter
          Width = 172
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAME'
        end
        object colShortName: TdxDBGridColumn
          Alignment = taLeftJustify
          Caption = #1057#1086#1082#1088'.'
          HeaderAlignment = taCenter
          Sorted = csDown
          Width = 55
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHORTNAME'
        end
        object colDef: TdxDBGridColumn
          Visible = False
          Width = 20
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DEF'
        end
      end
      object grdRate: TdxDBGrid
        Left = 220
        Top = 0
        Width = 223
        Height = 274
        DrawDragFrame = False
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'RATEID'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        PopupMenu = pmMain
        TabOrder = 1
        OnDblClick = grdRateDblClick
        DataSource = srcRate
        Filter.Criteria = {00000000}
        LookAndFeel = lfUltraFlat
        OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoStoreToRegistry, edgoTabThrough, edgoVertThrough]
        OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoHideFocusRect, edgoRowSelect, edgoUseBitmap]
        OnCustomDrawCell = grdRateCustomDrawCell
        OnSelectedCountChange = grdMainSelectedCountChange
        object colRateIDEx: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'RATEID'
        end
        object colOndate: TdxDBGridColumn
          Alignment = taCenter
          Caption = #1044#1072#1090#1072
          HeaderAlignment = taCenter
          Sizing = False
          Sorted = csUp
          Width = 123
          BandIndex = 0
          RowIndex = 0
          FieldName = 'ONDATE'
        end
        object colRate: TdxDBGridCurrencyColumn
          Alignment = taRightJustify
          Caption = #1050#1091#1088#1089
          HeaderAlignment = taCenter
          Sizing = False
          Width = 84
          BandIndex = 0
          RowIndex = 0
          FieldName = 'onvalue'
          DisplayFormat = ',0.000'
          Nullable = False
        end
        object colBaseCurr: TdxDBGridColumn
          Alignment = taLeftJustify
          Caption = #1041#1072#1079#1086#1074#1072#1103' '#1074#1072#1083#1102#1090#1072
          HeaderAlignment = taCenter
          Width = 20
          BandIndex = 0
          RowIndex = 0
          OnCustomDrawCell = colBaseCurrCustomDrawCell
        end
      end
    end
    object tsMain: TcxTabSheet
      Caption = 'tsMain'
      ImageIndex = 1
      TabVisible = False
      object grdMain: TdxDBGrid
        Left = 0
        Top = 0
        Width = 435
        Height = 266
        DrawDragFrame = False
        Bands = <
          item
            Caption = #1042#1072#1083#1102#1090#1072
          end
          item
            Caption = #1055#1077#1095#1072#1090#1100' '#1074' '#1086#1090#1095#1105#1090#1072#1093
          end>
        DefaultLayout = False
        HeaderPanelRowCount = 1
        KeyField = 'CURRID'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        PopupMenu = pmMain
        TabOrder = 0
        OnDblClick = grdMainDblClick
        DataSource = srcView
        Filter.Criteria = {00000000}
        LookAndFeel = lfUltraFlat
        OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoTabThrough, edgoVertThrough]
        OptionsCustomize = []
        OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoRowSelect, edgoUseBitmap]
        ShowBands = True
        OnCustomDrawCell = grdMainCustomDrawCell
        OnSelectedCountChange = grdMainSelectedCountChange
        object colID: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'CURRID'
        end
        object colVShortName: TdxDBGridColumn
          Tag = 1
          Alignment = taLeftJustify
          Caption = #1057#1086#1082#1088'.'
          HeaderAlignment = taCenter
          Sizing = False
          Width = 49
          BandIndex = 0
          RowIndex = 0
          FieldName = 'SHORTNAME'
        end
        object colVName: TdxDBGridColumn
          Tag = 1
          Alignment = taLeftJustify
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          HeaderAlignment = taCenter
          Sizing = False
          Sorted = csDown
          Width = 164
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAME'
        end
        object colVDef: TdxDBGridColumn
          Visible = False
          Width = 24
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DEF'
        end
        object colVOnDate: TdxDBGridColumn
          Tag = 1
          Alignment = taCenter
          Caption = #1044#1072#1090#1072
          HeaderAlignment = taCenter
          Sizing = False
          Width = 79
          BandIndex = 0
          RowIndex = 0
          OnGetText = colVOnDateGetText
        end
        object colVOnValue: TdxDBGridColumn
          Tag = 1
          Alignment = taRightJustify
          Caption = #1050#1091#1088#1089
          HeaderAlignment = taCenter
          Sizing = False
          Width = 69
          BandIndex = 0
          RowIndex = 0
          OnGetText = colVOnValueGetText
        end
        object colVBase: TdxDBGridColumn
          Tag = 1
          Alignment = taLeftJustify
          Caption = #1041#1072#1079#1086#1074#1072#1103' '#1074#1072#1083#1102#1090#1072
          HeaderAlignment = taCenter
          Sizing = False
          Width = 50
          BandIndex = 0
          RowIndex = 0
          OnGetText = colVBaseGetText
        end
        object colRateID: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          OnGetText = colRateIDGetText
        end
        object colRepShortName: TdxDBGridColumn
          Tag = 1
          Caption = #1057#1086#1082#1088'. '#1094#1077#1083#1086#1077
          HeaderAlignment = taCenter
          Sizing = False
          Width = 76
          BandIndex = 1
          RowIndex = 0
          FieldName = 'REPSHORTNAME'
        end
        object colRepFracName: TdxDBGridColumn
          Tag = 1
          Caption = #1057#1086#1082#1088'. '#1076#1088#1086#1073#1085#1086#1077
          Sizing = False
          Width = 89
          BandIndex = 1
          RowIndex = 0
          FieldName = 'REPFRACNAME'
        end
      end
    end
  end
  inherited ActionList: TActionList
    Left = 60
    Top = 64
  end
  inherited pmMain: TTBPopupMenu
    Left = 24
    Top = 52
    object TBItem6: TTBItem [5]
      Action = aSelectAll
    end
    object TBSeparatorItem3: TTBSeparatorItem [6]
    end
    object TBItem7: TTBItem [7]
      Action = aExcel
    end
    object TBSeparatorItem4: TTBSeparatorItem [8]
    end
    object TBItem5: TTBItem [9]
      Action = aDynamic
    end
  end
  object cdsView: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pCurrency_List'
    RemoteServer = dmData.SConnection
    AfterOpen = cdsViewAfterOpen
    Left = 60
    Top = 104
  end
  object srcView: TDataSource
    DataSet = cdsView
    OnDataChange = srcViewDataChange
    Left = 32
    Top = 104
  end
  object cdsRate: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'ondate'
        ParamType = ptInput
      end>
    ProviderName = 'prvCurrRate'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsRateBeforeOpen
    Left = 124
    Top = 64
  end
  object srcRate: TDataSource
    DataSet = cdsRate
    Left = 96
    Top = 64
  end
  object cdsValue: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'ondate'
        ParamType = ptInput
      end>
    ProviderName = 'pCurrency_Rate'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsValueBeforeOpen
    Left = 60
    Top = 140
  end
end
