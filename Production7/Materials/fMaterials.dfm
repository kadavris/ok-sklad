inherited fmMaterials: TfmMaterials
  object splMain: TSplitter [0]
    Left = 0
    Top = 122
    Width = 435
    Height = 3
    Cursor = crVSplit
    Align = alBottom
  end
  object pcMain: TcxPageControl [1]
    Left = 0
    Top = 125
    Width = 435
    Height = 141
    ActivePage = tsNotes
    Align = alBottom
    Images = dmData.Images
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnChange = pcMainChange
    object tsMain: TcxTabSheet
      Caption = 'tsMain'
      ImageIndex = 117
      object ssBevel2: TssBevel
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
      object ssBevel4: TssBevel
        Left = 0
        Top = 1
        Width = 1
        Height = 115
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
      object ssBevel5: TssBevel
        Left = 434
        Top = 1
        Width = 1
        Height = 115
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
      object ssBevel6: TssBevel
        Left = 0
        Top = 116
        Width = 435
        Height = 1
        Align = alBottom
        ColorGrBegin = clBtnFace
        ColorGrEnd = clBtnFace
        ColorInner = clBtnShadow
        ColorOuter = clBtnHighlight
        Edges = [beLeft, beRight, beTop, beBottom]
        GradientDirection = gdHorizontal
        HotTrack = False
        ImageIndex = 0
        Shape = bsTopLine
        UseGradient = False
      end
      object inspMain: TdxInspector
        Left = 1
        Top = 1
        Width = 433
        Height = 115
        Align = alClient
        BorderStyle = bsNone
        Color = clWindow
        TabOrder = 0
        DividerPos = 209
        GridColor = 13554646
        Flat = True
        MaxRowTextLineCount = 0
        Options = [ioBandSizing, ioColumnSizing, ioDynamicColumnSizing, ioEditing, ioRowAutoHeight]
        PaintStyle = ipsSimple
        OnDrawCaption = inspMainDrawCaption
        OnDrawValue = inspMainDrawValue
        Data = {
          6A0000000500000008000000000000000600000069724E616D65080000000000
          0000090000006972417274696B756C08000000000000000A00000069724D6174
          47726F757008000000000000000900000069724D656173757265080000000000
          0000040000006972574800000000}
        object irName: TdxInspectorTextRow
          Caption = '????????????'
          ReadOnly = True
        end
        object irArtikul: TdxInspectorTextRow
          Caption = '???????'
          ReadOnly = True
        end
        object irMeasure: TdxInspectorTextRow
          Caption = '??????? ?????????'
          ReadOnly = True
        end
        object irMatGroup: TdxInspectorTextRow
          Caption = '??????'
          ReadOnly = True
        end
        object irWH: TdxInspectorTextRow
          Caption = '?????, ???????????? ?? ?????????'
          ReadOnly = True
        end
      end
    end
    object tsAddInfo: TcxTabSheet
      Caption = 'tsAddInfo'
      ImageIndex = 117
      object ssBevel7: TssBevel
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
      object ssBevel10: TssBevel
        Left = 0
        Top = 1
        Width = 1
        Height = 115
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
      object ssBevel12: TssBevel
        Left = 0
        Top = 116
        Width = 435
        Height = 1
        Align = alBottom
        ColorGrBegin = clBtnFace
        ColorGrEnd = clBtnFace
        ColorInner = clBtnShadow
        ColorOuter = clBtnHighlight
        Edges = [beLeft, beRight, beTop, beBottom]
        GradientDirection = gdHorizontal
        HotTrack = False
        ImageIndex = 0
        Shape = bsTopLine
        UseGradient = False
      end
      object ssBevel13: TssBevel
        Left = 434
        Top = 1
        Width = 1
        Height = 115
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
      object inspAddInfo: TdxInspector
        Left = 1
        Top = 1
        Width = 433
        Height = 115
        Align = alClient
        BorderStyle = bsNone
        Color = clWindow
        TabOrder = 0
        DividerPos = 209
        GridColor = 13554646
        Flat = True
        MaxRowTextLineCount = 0
        Options = [ioBandSizing, ioColumnSizing, ioDynamicColumnSizing, ioEditing, ioRowAutoHeight]
        PaintStyle = ipsSimple
        OnDrawCaption = inspMainDrawCaption
        OnDrawValue = inspMainDrawValue
        Data = {
          9C0000000700000008000000000000000A000000697250726F64756365720800
          000000000000090000006972436F756E74727908000000000000000800000069
          72576569676874080000000000000006000000697253697A6508000000000000
          000B000000697244656D616E6443617408000000000000000900000069724261
          72436F646508000000000000000B00000069724D696E52657365727600000000}
        object irProducer: TdxInspectorTextRow
          Caption = '?????????????'
          ReadOnly = True
        end
        object irCountry: TdxInspectorTextRow
          Caption = '??????'
          ReadOnly = True
        end
        object irDemandCat: TdxInspectorTextRow
          Caption = '????????? ????? ??????'
          ReadOnly = True
        end
        object irBarCode: TdxInspectorTextRow
          Caption = '?????-???'
          ReadOnly = True
        end
        object irMinReserv: TdxInspectorTextRow
          Caption = '??????????? ???????? ?????'
          ReadOnly = True
        end
        object irWeight: TdxInspectorTextRow
          Caption = '???, ??'
          ReadOnly = True
        end
        object irSize: TdxInspectorTextRow
          Caption = '?????, ?.???.'
          ReadOnly = True
        end
      end
    end
    object tsPrice: TcxTabSheet
      Caption = 'tsPrice'
      ImageIndex = 82
      object grdPrices: TssDBGrid
        Left = 0
        Top = 0
        Width = 655
        Height = 117
        Hint = '??????? ?????????'
        DrawDragFrame = False
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'PTypeID'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        BandFont.Charset = DEFAULT_CHARSET
        BandFont.Color = clBlack
        BandFont.Height = -11
        BandFont.Name = 'Tahoma'
        BandFont.Style = [fsBold]
        DataSource = srcPrices
        Filter.Criteria = {00000000}
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clBlack
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        LookAndFeel = lfUltraFlat
        OptionsCustomize = [edgoBandMoving, edgoBandSizing, edgoColumnSizing]
        OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoHideFocusRect, edgoRowAutoHeight, edgoRowSelect, edgoUseBitmap]
        PreviewFont.Charset = DEFAULT_CHARSET
        PreviewFont.Color = clBlue
        PreviewFont.Height = -11
        PreviewFont.Name = 'Tahoma'
        PreviewFont.Style = [fsBold]
        OnColumnSorting = grdPricesColumnSorting
        OnCustomDrawCell = dbgMaterialsCustomDrawCell
        object colPTypeName: TdxDBGridColumn
          Alignment = taLeftJustify
          Caption = '??????? ?????????'
          HeaderAlignment = taCenter
          Sorted = csDown
          Width = 267
          BandIndex = 0
          RowIndex = 0
          FieldName = 'Name'
          OnGetText = colPTypeNameGetText
        end
        object colPType: TdxDBGridColumn
          Alignment = taLeftJustify
          HeaderAlignment = taCenter
          Sizing = False
          Width = 120
          BandIndex = 0
          RowIndex = 0
          FieldName = 'pptypeid'
          OnGetText = colPTypeGetText
        end
        object colPTypeExtra: TdxDBGridColumn
          Alignment = taLeftJustify
          Caption = '???????/????'
          HeaderAlignment = taCenter
          Width = 88
          BandIndex = 0
          RowIndex = 0
          FieldName = 'OnValue'
          OnGetText = colPTypeExtraGetText
        end
        object colPTypeType: TdxDBGridColumn
          Visible = False
          Width = 52
          BandIndex = 0
          RowIndex = 0
          FieldName = 'ExtraType'
        end
        object colPTypeCurrName: TdxDBGridColumn
          Visible = False
          Width = 118
          BandIndex = 0
          RowIndex = 0
          FieldName = 'CurrName'
        end
        object colPTypeDef: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'Def'
        end
        object colPName: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'pname'
        end
        object colPWithNDS: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'withnds'
        end
      end
    end
    object tsMC: TcxTabSheet
      Caption = 'tsMC'
      ImageIndex = 153
      object grdMC: TssDBGrid
        Left = 0
        Top = 0
        Width = 655
        Height = 117
        Hint = '??????????'
        DrawDragFrame = False
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'id'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        PopupMenu = pmMC
        ShowHint = True
        TabOrder = 0
        OnDblClick = grdMCDblClick
        BandFont.Charset = DEFAULT_CHARSET
        BandFont.Color = clBlack
        BandFont.Height = -11
        BandFont.Name = 'Tahoma'
        BandFont.Style = [fsBold]
        DataSource = srcMC
        Filter.Criteria = {00000000}
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clBlack
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        LookAndFeel = lfUltraFlat
        OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoStoreToRegistry, edgoTabThrough, edgoVertThrough]
        OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoRowSelect, edgoUseBitmap]
        PreviewFont.Charset = DEFAULT_CHARSET
        PreviewFont.Color = clBlue
        PreviewFont.Height = -11
        PreviewFont.Name = 'Tahoma'
        PreviewFont.Style = [fsBold]
        OnColumnSorting = grdPricesColumnSorting
        OnCustomDrawCell = dbgMaterialsCustomDrawCell
        LangManager = dmData.Lng
        OnGetOptionsTitle = grdMCGetOptionsTitle
        object colMCMatName: TdxDBGridColumn
          Tag = 1
          Alignment = taLeftJustify
          Caption = '???????????? ???????'
          HeaderAlignment = taCenter
          Width = 189
          BandIndex = 0
          RowIndex = 0
          FieldName = 'Name'
          OnGetText = colMCMatNameGetText
        end
        object colMCNotes: TdxDBGridMemoColumn
          Tag = 1
          Caption = '??????????'
          HeaderAlignment = taCenter
          Sorted = csUp
          Width = 252
          BandIndex = 0
          RowIndex = 0
          HeaderMaxLineCount = 1
          FieldName = 'Notes'
        end
        object colMCArtikul: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'artikul'
          OnGetText = colMCArtikulGetText
        end
        object colMCBarCode: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          Width = 80
          BandIndex = 0
          RowIndex = 0
          FieldName = 'barcode'
        end
        object colMCGrpName: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'grpname'
        end
        object colMCProducer: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'producer'
        end
        object colMCCountry: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'country'
        end
        object colMCMsrName: TdxDBGridColumn
          Tag = 1
          Alignment = taCenter
          HeaderAlignment = taCenter
          Visible = False
          Width = 60
          BandIndex = 0
          RowIndex = 0
          FieldName = 'msrname'
        end
        object colMCRemain: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          Width = 50
          BandIndex = 0
          RowIndex = 0
          FieldName = 'remain'
          OnGetText = colMCRemainGetText
        end
      end
    end
    object tsNotes: TcxTabSheet
      Caption = 'tsNotes'
      ImageIndex = 4
      OnShow = tsNotesShow
      DesignSize = (
        435
        117)
      object ssBevel14: TssBevel
        Left = 0
        Top = 1
        Width = 1
        Height = 115
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
        Top = 116
        Width = 435
        Height = 1
        Align = alBottom
        ColorGrBegin = clBtnFace
        ColorGrEnd = clBtnFace
        ColorInner = clBtnShadow
        ColorOuter = clBtnHighlight
        Edges = [beLeft, beRight, beTop, beBottom]
        GradientDirection = gdHorizontal
        HotTrack = False
        ImageIndex = 0
        Shape = bsTopLine
        UseGradient = False
      end
      object ssBevel17: TssBevel
        Left = 434
        Top = 1
        Width = 1
        Height = 115
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
      object memNotes: TcxMemo
        Left = 13
        Top = -1
        Width = 429
        Height = 119
        Anchors = [akLeft, akTop, akRight, akBottom]
        ImeName = 'Russian'
        ParentFont = False
        Properties.ReadOnly = True
        Style.BorderStyle = ebsNone
        Style.HotTrack = False
        Style.StyleController = dmData.scMain
        Style.TransparentBorder = True
        TabOrder = 0
      end
    end
    object tsAdd: TcxTabSheet
      Caption = 'tsAdd'
      ImageIndex = 51
      TabVisible = False
      object grdMats: TssDBGrid
        Left = 0
        Top = 0
        Width = 655
        Height = 117
        Hint = 'name'
        DrawDragFrame = False
        Bands = <
          item
          end>
        DefaultLayout = False
        HeaderPanelRowCount = 1
        KeyField = 'posid'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        DragMode = dmAutomatic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        PopupMenu = pmMats
        ShowHint = True
        TabOrder = 0
        OnDblClick = grdMatsDblClick
        OnDragDrop = grdMatsDragDrop
        OnDragOver = grdMatsDragOver
        OnKeyDown = grdMatsKeyDown
        BandColor = 12500670
        BandFont.Charset = DEFAULT_CHARSET
        BandFont.Color = clBlack
        BandFont.Height = -11
        BandFont.Name = 'Tahoma'
        BandFont.Style = [fsBold]
        DataSource = srcMats
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
        OptionsBehavior = [edgoAutoSort, edgoEditing, edgoEnterShowEditor, edgoExtMultiSelect, edgoImmediateEditor, edgoMultiSelect, edgoStoreToRegistry, edgoTabs, edgoVertThrough]
        OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseLocate]
        OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoShowButtonAlways, edgoUseBitmap]
        PreviewFont.Charset = DEFAULT_CHARSET
        PreviewFont.Color = clBlue
        PreviewFont.Height = -11
        PreviewFont.Name = 'Tahoma'
        PreviewFont.Style = [fsBold]
        ShowRowFooter = True
        OnColumnSorting = grdMatsColumnSorting
        OnCustomDrawCell = grdMatsCustomDrawCell
        LangManager = dmData.Lng
        OnGetOptionsTitle = grdMatsGetOptionsTitle
        object colRecNo: TdxDBGridColumn
          Alignment = taCenter
          Caption = '?'
          DisableEditor = True
          HeaderAlignment = taCenter
          MaxLength = 30
          MinWidth = 30
          Sizing = False
          Width = 35
          BandIndex = 0
          RowIndex = 0
          OnGetText = colRecNoGetText
        end
        object colMatName: TdxDBGridColumn
          Tag = 1
          DisableEditor = True
          HeaderAlignment = taCenter
          MaxLength = 300
          Width = 207
          BandIndex = 0
          RowIndex = 0
          FieldName = 'name'
          SummaryType = cstSum
          SummaryField = 'amount'
          SummaryFormat = '0.00'
        end
        object colMatArtikul: TdxDBGridColumn
          Tag = 1
          DisableEditor = True
          HeaderAlignment = taCenter
          Visible = False
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'artikul'
        end
        object colAmount: TdxDBGridColumn
          Tag = 2
          Alignment = taRightJustify
          HeaderAlignment = taCenter
          MaxLength = 91
          Width = 99
          BandIndex = 0
          RowIndex = 0
          FieldName = 'amount'
        end
        object colPrice: TdxDBGridColumn
          Tag = 2
          Alignment = taRightJustify
          HeaderAlignment = taCenter
          MaxLength = 120
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'price'
        end
        object colMatID: TdxDBGridColumn
          Visible = False
          Width = 37
          BandIndex = 0
          RowIndex = 0
          FieldName = 'matid'
        end
      end
    end
  end
  object panGrid: TPanel [2]
    Left = 0
    Top = 0
    Width = 435
    Height = 122
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object ssBevel3: TssBevel
      Left = 0
      Top = 1
      Width = 1
      Height = 95
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
    object ssBevel8: TssBevel
      Left = 434
      Top = 1
      Width = 1
      Height = 95
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
    object dbgMaterials: TssDBGrid
      Left = 1
      Top = 1
      Width = 433
      Height = 95
      Hint = '????????'
      DrawDragFrame = False
      Bands = <
        item
        end>
      DefaultLayout = True
      HeaderPanelRowCount = 1
      KeyField = 'MATID'
      SummaryGroups = <>
      SummarySeparator = ', '
      Align = alClient
      BorderStyle = bsNone
      DragMode = dmAutomatic
      ParentShowHint = False
      PopupMenu = pmMain
      ShowHint = True
      TabOrder = 0
      OnDblClick = dbgMaterialsDblClick
      OnDragDrop = dbgMaterialsDragDrop
      OnDragOver = dbgMaterialsDragOver
      OnKeyDown = dbgMaterialsKeyDown
      OnMouseDown = dbgMaterialsMouseDown
      OnMouseUp = dbgMaterialsMouseUp
      OnStartDrag = dbgMaterialsStartDrag
      DataSource = srcMaterials
      Filter.Criteria = {00000000}
      LookAndFeel = lfUltraFlat
      OptionsBehavior = [edgoAutoSort, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoStoreToRegistry, edgoTabThrough, edgoVertThrough]
      OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
      OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoRowSelect, edgoUseBitmap]
      OnCanBandDragging = dbgMaterialsCanBandDragging
      OnCanHeaderDragging = dbgMaterialsCanHeaderDragging
      OnCustomDrawCell = dbgMaterialsCustomDrawCell
      OnDragEndHeader = dbgMaterialsDragEndHeader
      OnDragOverHeader = dbgMaterialsDragOverHeader
      OnGetNodeDragText = dbgMaterialsGetNodeDragText
      OnSelectedCountChange = dbgMaterialsSelectedCountChange
      LangManager = dmData.Lng
      OnNeedAdjust = dbgMaterialsNeedAdjust
      OnGetOptionsTitle = dbgMaterialsGetOptionsTitle
      object colID: TdxDBGridColumn
        Visible = False
        BandIndex = 0
        RowIndex = 0
        FieldName = 'MATID'
      end
      object colType: TdxDBGridImageColumn
        Alignment = taLeftJustify
        HeaderAlignment = taCenter
        MinWidth = 16
        Sizing = False
        Width = 24
        BandIndex = 0
        RowIndex = 0
        FieldName = 'MTYPE'
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
          '132')
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
          '0'
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
          ''
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
      object colNum: TdxDBGridColumn
        Alignment = taLeftJustify
        Caption = '#'
        HeaderAlignment = taCenter
        Sizing = False
        Visible = False
        Width = 40
        BandIndex = 0
        RowIndex = 0
        FieldName = 'numex'
      end
      object colName: TdxDBGridColumn
        Tag = 2
        Alignment = taLeftJustify
        Caption = '????????'
        HeaderAlignment = taCenter
        Width = 384
        BandIndex = 0
        RowIndex = 0
        FieldName = 'NAME'
        OnGetText = colNameGetText
      end
      object colArtikul: TdxDBGridColumn
        Tag = 1
        Caption = '???????'
        HeaderAlignment = taCenter
        Width = 150
        BandIndex = 0
        RowIndex = 0
        FieldName = 'ARTIKUL'
        OnGetText = colNameGetText
        SummaryType = cstSum
      end
      object colMeasure: TdxDBGridColumn
        Tag = 1
        Alignment = taCenter
        Caption = '?.?.'
        HeaderAlignment = taCenter
        TabStop = False
        Width = 55
        BandIndex = 0
        RowIndex = 0
        FieldName = 'ShortName'
      end
      object colDef: TdxDBGridColumn
        Visible = False
        Width = 93
        BandIndex = 0
        RowIndex = 0
        FieldName = 'DEF'
      end
      object colNotes: TdxDBGridColumn
        Tag = 1
        HeaderAlignment = taCenter
        Visible = False
        BandIndex = 0
        RowIndex = 0
        FieldName = 'NOTES'
      end
      object colCurrName: TdxDBGridColumn
        Visible = False
        BandIndex = 0
        RowIndex = 0
        FieldName = 'CURRNAME'
      end
      object colRealNum: TdxDBGridColumn
        Visible = False
        BandIndex = 0
        RowIndex = 0
        FieldName = 'NUM'
      end
      object colCountry: TdxDBGridColumn
        Tag = 1
        HeaderAlignment = taCenter
        Visible = False
        Width = 150
        BandIndex = 0
        RowIndex = 0
        FieldName = 'CNAME'
      end
      object colProducer: TdxDBGridColumn
        Tag = 1
        HeaderAlignment = taCenter
        Visible = False
        Width = 100
        BandIndex = 0
        RowIndex = 0
        FieldName = 'PRODUCER'
      end
      object colWeight: TdxDBGridColumn
        Tag = 1
        HeaderAlignment = taCenter
        Visible = False
        Width = 70
        BandIndex = 0
        RowIndex = 0
        FieldName = 'WEIGHT'
      end
      object colMSize: TdxDBGridColumn
        Tag = 1
        HeaderAlignment = taCenter
        Visible = False
        Width = 70
        BandIndex = 0
        RowIndex = 0
        FieldName = 'MSIZE'
      end
      object colBarCode: TdxDBGridColumn
        Tag = 1
        HeaderAlignment = taCenter
        Visible = False
        Width = 100
        BandIndex = 0
        RowIndex = 0
        FieldName = 'BARCODE'
      end
      object colMinReserv: TdxDBGridColumn
        Tag = 1
        HeaderAlignment = taCenter
        Visible = False
        Width = 70
        BandIndex = 0
        RowIndex = 0
        FieldName = 'MINRESERV'
        OnGetText = colMinReservGetText
      end
      object colPrices: TdxDBGridColumn
        Visible = False
        BandIndex = 0
        RowIndex = 0
        FieldName = 'PRICES'
      end
      object colArchived: TdxDBGridColumn
        Visible = False
        BandIndex = 0
        RowIndex = 0
        FieldName = 'Archived'
      end
      object colMID: TdxDBGridColumn
        Visible = False
        BandIndex = 0
        RowIndex = 0
        FieldName = 'MID'
      end
      object colAvgPrice: TdxDBGridColumn
        Tag = 1
        BandIndex = 0
        RowIndex = 0
        FieldName = 'avgprice'
        OnGetText = colAvgPriceGetText
      end
      object colCF1: TdxDBGridColumn
        Visible = False
        BandIndex = 0
        RowIndex = 0
        FieldName = 'CF1'
      end
      object colCF2: TdxDBGridColumn
        Visible = False
        BandIndex = 0
        RowIndex = 0
        FieldName = 'CF2'
      end
      object colCF3: TdxDBGridColumn
        Visible = False
        BandIndex = 0
        RowIndex = 0
        FieldName = 'CF3'
      end
      object colCF4: TdxDBGridColumn
        Visible = False
        BandIndex = 0
        RowIndex = 0
        FieldName = 'CF4'
      end
      object colCF5: TdxDBGridColumn
        Visible = False
        BandIndex = 0
        RowIndex = 0
        FieldName = 'CF5'
      end
    end
    object panFooter: TPanel
      Left = 0
      Top = 96
      Width = 435
      Height = 26
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      DesignSize = (
        435
        26)
      object ssBevel1: TssBevel
        Left = 0
        Top = 0
        Width = 435
        Height = 26
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
      object lCount: TLabel
        Left = 517
        Top = 6
        Width = 29
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = 'Count'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object stCount: TssBevel
        Left = 560
        Top = 5
        Width = 86
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
        UseGradient = True
      end
      object ssBevel11: TssBevel
        Left = 1
        Top = 0
        Width = 653
        Height = 1
        Anchors = [akLeft, akTop, akRight]
        ColorGrBegin = clBtnFace
        ColorGrEnd = clBtnFace
        ColorInner = clBtnShadow
        ColorOuter = clBtnHighlight
        Edges = [beLeft, beRight, beTop, beBottom]
        GradientDirection = gdHorizontal
        HotTrack = False
        ImageIndex = 0
        Shape = bsTopLine
        UseGradient = False
      end
    end
  end
  inherited ActionList: TActionList
    Left = 396
    Top = 196
    object aNewEx: TAction [11]
      Category = 'All'
      Caption = 'aNewEx'
      ImageIndex = 3
      OnExecute = aNewExExecute
    end
    object aNewGrp: TAction [12]
      Category = 'All'
      Caption = 'aNewGrp'
      ImageIndex = 48
      ShortCut = 8237
      OnExecute = aNewGrpExecute
    end
    object aMatRsv: TAction [18]
      Caption = 'aMatRsv'
      ImageIndex = 100
      OnExecute = aMatRsvExecute
    end
    object aMatMove: TAction [19]
      Caption = 'aMatMove'
      ImageIndex = 61
      OnExecute = aMatMoveExecute
    end
    object aGotoAnalog: TAction [20]
      Caption = 'aGotoAnalog'
      ImageIndex = 168
      OnExecute = aGotoAnalogExecute
    end
    object aFindAtWH: TAction [21]
      Caption = 'aFindAtWH'
      ImageIndex = 50
      OnExecute = aFindAtWHExecute
    end
    object aMCMatMove: TAction [22]
      Caption = 'aMCMatMove'
      ImageIndex = 61
      OnExecute = aMCMatMoveExecute
    end
    object aMCMatRsv: TAction [23]
      Caption = 'aMCMatRsv'
      ImageIndex = 100
      OnExecute = aMCMatRsvExecute
    end
    object aMCMatInfo: TAction [24]
      Caption = 'aMCMatInfo'
      ImageIndex = 99
      OnExecute = aMCMatInfoExecute
    end
    object aMatsDel: TAction
      Category = 'Mats'
      Caption = 'aMatsDel'
      ImageIndex = 5
      ShortCut = 8238
      OnExecute = aMatsDelExecute
    end
    object aMatsColOptions: TAction
      Category = 'Mats'
      Caption = 'aMatsColOptions'
      OnExecute = aMatsColOptionsExecute
    end
    object aMatsSelectAll: TAction
      Category = 'Mats'
      Caption = 'aMatsSelectAll'
      OnExecute = aMatsSelectAllExecute
    end
    object aMCColParams: TAction
      Caption = 'aMCColParams'
      OnExecute = aMCColParamsExecute
    end
  end
  inherited pmMain: TTBPopupMenu
    OnPopup = pmMainPopup
    Left = 12
    object TBItem5: TTBItem [1]
      Action = aPatternInsert
    end
    object TBItem8: TTBItem [6]
      Action = aSelectAll
    end
    object TBItem6: TTBItem [7]
      Action = aCut
    end
    object TBItem7: TTBItem [8]
      Action = aPaste
    end
    object TBSeparatorItem3: TTBSeparatorItem [9]
    end
    object TBItem9: TTBItem [10]
      Action = aExcel
    end
    object TBSeparatorItem4: TTBSeparatorItem [11]
    end
    object TBItem11: TTBItem [12]
      Action = aMatMove
    end
    object TBItem12: TTBItem [13]
      Action = aMatRsv
    end
    object TBItem13: TTBItem [14]
      Action = aFindAtWH
    end
    object sepClip: TTBSeparatorItem [15]
    end
    object TBItem18: TTBItem [16]
      Action = aArchive
    end
    object TBItem17: TTBItem [17]
      Action = aShowArchived
    end
    object TBSeparatorItem9: TTBSeparatorItem [18]
    end
    object WebShopMenu: TTBSubmenuItem [19]
      Caption = 'WebShopz'
      ImageIndex = 210
      Images = dmData.Images
      Visible = False
    end
    object TBSeparatorItem6: TTBSeparatorItem [20]
    end
    object TBItem10: TTBItem [21]
      Action = aColParams
    end
  end
  object cdsMaterials: TssClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <
      item
        DataType = ftUnknown
        Name = 'grp'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'getprices'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'getarchived'
        ParamType = ptUnknown
      end>
    ProviderName = 'pMaterials_ListEx'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsMaterialsBeforeOpen
    AfterOpen = cdsMaterialsAfterOpen
    OnCalcFields = cdsMaterialsCalcFields
    Macros = <>
    Left = 332
    Top = 32
    object cdsMaterialsMATID: TIntegerField
      FieldName = 'MATID'
      ReadOnly = True
    end
    object cdsMaterialsMID: TIntegerField
      FieldName = 'MID'
      ReadOnly = True
    end
    object cdsMaterialsNAME: TStringField
      DisplayWidth = 255
      FieldName = 'NAME'
      ReadOnly = True
      Size = 255
    end
    object cdsMaterialsARTIKUL: TStringField
      FieldName = 'ARTIKUL'
      ReadOnly = True
      Size = 128
    end
    object cdsMaterialsNOTES: TStringField
      FieldName = 'NOTES'
      ReadOnly = True
      Size = 255
    end
    object cdsMaterialsGRPID: TIntegerField
      FieldName = 'GRPID'
      ReadOnly = True
    end
    object cdsMaterialsSHORTNAME: TStringField
      FieldName = 'SHORTNAME'
      ReadOnly = True
      Size = 6
    end
    object cdsMaterialsMTYPE: TIntegerField
      FieldName = 'MTYPE'
      ReadOnly = True
    end
    object cdsMaterialsWID: TIntegerField
      FieldName = 'WID'
      ReadOnly = True
    end
    object cdsMaterialsNUM: TIntegerField
      FieldName = 'NUM'
      ReadOnly = True
    end
    object cdsMaterialsnumex: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'numex'
      Calculated = True
    end
    object cdsMaterialsMINRESERV: TFloatField
      FieldName = 'MINRESERV'
    end
    object cdsMaterialsCID: TIntegerField
      FieldName = 'CID'
    end
    object cdsMaterialsDEMANDCAT: TIntegerField
      FieldName = 'DEMANDCAT'
    end
    object cdsMaterialsBARCODE: TStringField
      FieldName = 'BARCODE'
      Size = 64
    end
    object cdsMaterialsPRODUCER: TStringField
      FieldName = 'PRODUCER'
      Size = 255
    end
    object cdsMaterialsWEIGHT: TFloatField
      FieldName = 'WEIGHT'
    end
    object cdsMaterialsMSIZE: TFloatField
      FieldName = 'MSIZE'
    end
    object cdsMaterialsCNAME: TStringField
      FieldName = 'CNAME'
      Size = 128
    end
    object cdsMaterialsPRICES: TStringField
      FieldName = 'PRICES'
      Size = 2048
    end
    object cdsMaterialsARCHIVED: TIntegerField
      FieldName = 'ARCHIVED'
    end
    object cdsMaterialsAVGPRICE: TFloatField
      FieldName = 'AVGPRICE'
    end
    object cdsMaterialsCF1: TIntegerField
      FieldName = 'CF1'
    end
    object cdsMaterialsCF2: TIntegerField
      FieldName = 'CF2'
    end
    object cdsMaterialsCF3: TIntegerField
      FieldName = 'CF3'
    end
    object cdsMaterialsCF4: TIntegerField
      FieldName = 'CF4'
    end
    object cdsMaterialsCF5: TIntegerField
      FieldName = 'CF5'
    end
  end
  object cdsMatGroup: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pMatGroup_List'
    RemoteServer = dmData.SConnection
    Macros = <
      item
        DataType = ftString
        Name = 'grp'
        ParamType = ptUnknown
      end>
    Left = 344
    Top = 188
  end
  object cdsWHouse: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pWHouse_List'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsWHouseBeforeOpen
    Macros = <
      item
        DataType = ftString
        Name = 'm'
        ParamType = ptInput
      end>
    Left = 352
    Top = 196
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
    Left = 304
    Top = 212
  end
  object mdPrices: TssMemoryData
    FieldDefs = <>
    Left = 124
    Top = 181
    object mdPricesPTypeID: TIntegerField
      FieldName = 'PTypeID'
    end
    object mdPricesName: TStringField
      FieldName = 'Name'
      Size = 64
    end
    object mdPricesOnValue: TFloatField
      FieldName = 'OnValue'
    end
    object mdPricesCurrID: TIntegerField
      FieldName = 'CurrID'
    end
    object mdPricesExtraType: TIntegerField
      FieldName = 'ExtraType'
    end
    object mdPricesCurrName: TStringField
      FieldName = 'CurrName'
      Size = 24
    end
    object mdPricesDef: TIntegerField
      FieldName = 'Def'
    end
    object mdPricesSrc: TIntegerField
      FieldName = 'Src'
    end
    object mdPricesen: TIntegerField
      FieldName = 'en'
    end
    object mdPricespptypeid: TIntegerField
      FieldName = 'pptypeid'
    end
    object mdPricespname: TStringField
      FieldName = 'pname'
      Size = 64
    end
    object mdPriceswithnds: TIntegerField
      FieldName = 'withnds'
    end
  end
  object srcPrices: TDataSource
    DataSet = mdPrices
    Left = 152
    Top = 181
  end
  object srcMaterials: TssDataSource
    DataSet = cdsMaterials
    ChangeDelay = 250
    OnDelayedDataChange = srcMaterialsDelayedDataChange
    Left = 328
    Top = 84
  end
  object srcMC: TDataSource
    DataSet = cdsMC
    Left = 52
    Top = 181
  end
  object cdsMC: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'matid'
        ParamType = ptUnknown
      end>
    ProviderName = 'pMatChange_Get'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsMCBeforeOpen
    AfterOpen = cdsMCAfterOpen
    Macros = <
      item
        DataType = ftString
        Name = 'grp'
        ParamType = ptUnknown
      end>
    Left = 80
    Top = 181
  end
  object cdsPriceTypes: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pPriceTypes_List'
    RemoteServer = dmData.SConnection
    AfterOpen = cdsPriceTypesAfterOpen
    Macros = <
      item
        DataType = ftString
        Name = 'grp'
        ParamType = ptUnknown
      end>
    Left = 240
    Top = 44
  end
  object pmMC: TTBPopupMenu
    Images = dmData.Images
    Left = 232
    Top = 188
    object TBItem16: TTBItem
      Action = aMCMatInfo
    end
    object TBItem15: TTBItem
      Action = aMCMatMove
    end
    object TBItem14: TTBItem
      Action = aMCMatRsv
    end
    object TBSeparatorItem5: TTBSeparatorItem
    end
    object TBItem24: TTBItem
      Action = aGotoAnalog
      Images = dmData.Images
    end
    object TBSeparatorItem8: TTBSeparatorItem
    end
    object TBItem22: TTBItem
      Action = aMCColParams
    end
  end
  object mdMats: TssMemoryData
    FieldDefs = <>
    Left = 124
    Top = 221
    object mdMatsmatid: TIntegerField
      FieldName = 'matid'
    end
    object mdMatsname: TStringField
      FieldName = 'name'
      Size = 255
    end
    object mdMatsamount: TFloatField
      FieldName = 'amount'
    end
    object mdMatsprice: TFloatField
      FieldName = 'price'
    end
    object mdMatsartikul: TStringField
      FieldName = 'artikul'
      Size = 255
    end
    object mdMatsmid: TIntegerField
      FieldName = 'mid'
    end
    object mdMatsmsrname: TStringField
      FieldName = 'msrname'
      Size = 5
    end
    object mdMatsproducer: TStringField
      FieldName = 'producer'
      Size = 255
    end
    object mdMatsbarcode: TStringField
      FieldName = 'barcode'
      Size = 64
    end
    object mdMatsposid: TIntegerField
      FieldName = 'posid'
    end
    object mdMatsCF1: TIntegerField
      FieldName = 'CF1'
    end
    object mdMatsCF2: TIntegerField
      FieldName = 'CF2'
    end
    object mdMatsCF3: TIntegerField
      FieldName = 'CF3'
    end
    object mdMatsCF4: TIntegerField
      FieldName = 'CF4'
    end
    object mdMatsCF5: TIntegerField
      FieldName = 'CF5'
    end
  end
  object srcMats: TDataSource
    DataSet = mdMats
    Left = 152
    Top = 221
  end
  object pmMats: TTBPopupMenu
    Images = dmData.Images
    Left = 196
    Top = 188
    object TBItem21: TTBItem
      Action = aMatsSelectAll
    end
    object TBItem19: TTBItem
      Action = aMatsDel
    end
    object TBSeparatorItem7: TTBSeparatorItem
    end
    object TBItem20: TTBItem
      Action = aMatsColOptions
    end
  end
end
