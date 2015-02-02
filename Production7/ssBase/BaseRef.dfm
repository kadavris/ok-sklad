inherited fmBaseRef: TfmBaseRef
  object panClient: TPanel [0]
    Left = 0
    Top = 0
    Width = 443
    Height = 274
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object ssBevel3: TssBevel
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
    object ssBevel9: TssBevel
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
    object ssBevel8: TssBevel
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
    object ssBevel12: TssBevel
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
    object pcMainList: TcxPageControl
      Left = 1
      Top = 1
      Width = 441
      Height = 272
      ActivePage = tsMainList
      Align = alClient
      TabOrder = 0
      object tsMainList: TcxTabSheet
        Caption = 'tsMainList'
        ImageIndex = 0
        TabVisible = False
        object grdMain: TssDBGrid
          Left = 0
          Top = 0
          Width = 441
          Height = 272
          DrawDragFrame = False
          Bands = <
            item
            end>
          DefaultLayout = True
          HeaderPanelRowCount = 1
          KeyField = 'TYPEID'
          SummaryGroups = <>
          SummarySeparator = ', '
          Align = alClient
          BorderStyle = bsNone
          ParentShowHint = False
          PopupMenu = pmMain
          ShowHint = True
          TabOrder = 0
          OnDblClick = grdMainDblClick
          OnKeyDown = grdMainKeyDown
          DataSource = srcMain
          Filter.Criteria = {00000000}
          LookAndFeel = lfUltraFlat
          OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoTabThrough, edgoVertThrough]
          OptionsCustomize = [edgoBandMoving, edgoBandSizing, edgoColumnSizing]
          OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
          OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoHideFocusRect, edgoRowSelect, edgoUseBitmap]
          OnCustomDrawCell = grdMainCustomDrawCell
          OnSelectedCountChange = grdMainSelectedCountChange
        end
      end
    end
  end
  inherited ActionList: TActionList
    Left = 80
    object aExportCSV: TAction [18]
      Category = 'All'
      Caption = 'aExportCSV'
    end
    object aImportCSV: TAction [19]
      Category = 'All'
      Caption = 'aImportCSV'
    end
  end
  object cdsMain: TssClientDataSet
    Left = 80
    Top = 88
    Aggregates = <>
    FilterOptions = [foCaseInsensitive, foNoPartialCompare]
    Params = <>
    RemoteServer = dmData.SConnection
    AfterOpen = cdsMainAfterOpen
    Macros = <>
  end
  object srcMain: TssDataSource
    Left = 28
    Top = 88
    DataSet = cdsMain
    ChangeDelay = 250
    OnDelayedDataChange = srcMainDelayedDataChange
  end
end
