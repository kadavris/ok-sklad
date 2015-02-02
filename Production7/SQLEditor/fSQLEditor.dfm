inherited fmSQLEditor: TfmSQLEditor
  Width = 527
  Height = 284
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 122
    Width = 527
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object panTop: TPanel [1]
    Left = 0
    Top = 0
    Width = 527
    Height = 122
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object ssBevel3: TssBevel
      Left = 0
      Top = 1
      Width = 1
      Height = 120
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
      Width = 527
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
    object ssBevel12: TssBevel
      Left = 0
      Top = 121
      Width = 527
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
    object ssBevel8: TssBevel
      Left = 526
      Top = 1
      Width = 1
      Height = 120
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
    object memSQL: TMemo
      Left = 1
      Top = 1
      Width = 492
      Height = 120
      Align = alClient
      BorderStyle = bsNone
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ImeName = 'Russian'
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
      OnKeyDown = memSQLKeyDown
    end
    object panExec: TPanel
      Left = 493
      Top = 1
      Width = 33
      Height = 120
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      DesignSize = (
        33
        120)
      object ssBevel1: TssBevel
        Left = 0
        Top = 0
        Width = 1
        Height = 120
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
      object btnExecute: TssSpeedButton
        Left = 5
        Top = 4
        Width = 23
        Height = 23
        Action = aExecute
        Alignment = taLeftJustify
        AllwaysShowFrame = False
        Anchors = [akTop, akRight]
        ButtonType = ssbtStandard
        Checked = False
        GroupIndex = 0
        ImageIndex = 172
        Images = dmData.Images
        LeftMargin = 3
        ParentShowHint = False
        ShowHint = True
        Style = ssbsUser
        ViewStyle = ssvsGlyphOnly
      end
    end
  end
  object pcMain: TcxPageControl [2]
    Left = 0
    Top = 125
    Width = 527
    Height = 159
    ActivePage = tsRes
    Align = alClient
    TabOrder = 1
    object tsRes: TcxTabSheet
      Caption = #1056#1077#1079#1091#1083#1100#1090#1072#1090' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103
      ImageIndex = 0
      object panRes: TPanel
        Left = 0
        Top = 115
        Width = 527
        Height = 21
        Align = alBottom
        Alignment = taLeftJustify
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        object ssBevel2: TssBevel
          Left = 0
          Top = 0
          Width = 1
          Height = 20
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
        object ssBevel4: TssBevel
          Left = 526
          Top = 0
          Width = 1
          Height = 20
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
        object ssBevel5: TssBevel
          Left = 0
          Top = 20
          Width = 527
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
      end
      object grdMain: TssDBGrid
        Left = 0
        Top = 0
        Width = 527
        Height = 115
        Hint = 'Name'
        DrawDragFrame = False
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'bankid'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        DataSource = srcSQL
        Filter.Criteria = {00000000}
        LookAndFeel = lfUltraFlat
        OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoTabThrough, edgoVertThrough]
        OptionsCustomize = [edgoBandMoving, edgoBandSizing, edgoColumnSizing]
        OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoRowSelect, edgoUseBitmap]
        ShowGrid = False
        ShowHeader = False
      end
    end
    object tsMessages: TcxTabSheet
      Caption = 'Messages'
      ImageIndex = 1
      object MemoMessages: TMemo
        Left = 0
        Top = 0
        Width = 527
        Height = 136
        Align = alClient
        ImeName = 'Russian'
        Lines.Strings = (
          '')
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
  inherited ActionList: TActionList
    object aExecute: TAction
      Category = 'All'
      Caption = 'aExecute'
      ImageIndex = 172
      ShortCut = 16453
      OnExecute = aExecuteExecute
    end
  end
  object cdsSQL: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pSQL'
    RemoteServer = dmData.SConnection
    AfterOpen = cdsSQLAfterOpen
    AfterClose = cdsSQLAfterClose
    Macros = <
      item
        DataType = ftString
        Name = 'm'
        ParamType = ptUnknown
      end>
    Left = 136
    Top = 23
  end
  object srcSQL: TDataSource
    DataSet = cdsSQL
    Left = 164
    Top = 23
  end
end
