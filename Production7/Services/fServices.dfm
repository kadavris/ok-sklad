inherited fmServices: TfmServices
  inherited panClient: TPanel
    Height = 104
    inherited ssBevel3: TssBevel
      Height = 77
    end
    inherited ssBevel8: TssBevel
      Height = 77
    end
    inherited ssBevel12: TssBevel
      Top = 78
      Height = 0
    end
    inherited pcMainList: TcxPageControl
      Height = 77
      inherited tsMainList: TcxTabSheet
        inherited grdMain: TssDBGrid
          Height = 77
          Hint = 'artikul'
          KeyField = 'svcid'
          DragMode = dmAutomatic
          OnStartDrag = grdMainStartDrag
          Filter.Criteria = {00000000}
          OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoRowSelect, edgoUseBitmap]
          object colImg: TdxDBGridImageColumn
            Alignment = taLeftJustify
            MinWidth = 16
            Sizing = False
            Width = 25
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
              '159')
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
              '1')
          end
          object colName: TdxDBGridColumn
            Tag = 1
            HeaderAlignment = taCenter
            Sizing = False
            Width = 100
            BandIndex = 0
            RowIndex = 0
            FieldName = 'Name'
          end
          object colDef: TdxDBGridColumn
            Visible = False
            BandIndex = 0
            RowIndex = 0
          end
          object colID: TdxDBGridColumn
            Visible = False
            BandIndex = 0
            RowIndex = 0
            FieldName = 'svcid'
          end
          object colArtikul: TdxDBGridColumn
            Tag = 1
            HeaderAlignment = taCenter
            Sizing = False
            Width = 150
            BandIndex = 0
            RowIndex = 0
            FieldName = 'artikul'
          end
          object colMsrName: TdxDBGridColumn
            Alignment = taCenter
            HeaderAlignment = taCenter
            Sizing = False
            Width = 55
            BandIndex = 0
            RowIndex = 0
            FieldName = 'msrname'
          end
          object colPrice: TdxDBGridColumn
            Tag = 1
            Alignment = taRightJustify
            HeaderAlignment = taCenter
            Width = 100
            BandIndex = 0
            RowIndex = 0
            FieldName = 'price'
            OnGetText = colPriceGetText
          end
          object colShortName: TdxDBGridColumn
            Tag = 1
            Visible = False
            BandIndex = 0
            RowIndex = 0
            FieldName = 'shortname'
          end
          object colMID: TdxDBGridColumn
            Visible = False
            BandIndex = 0
            RowIndex = 0
            FieldName = 'mid'
          end
          object colCurrID: TdxDBGridColumn
            Visible = False
            BandIndex = 0
            RowIndex = 0
            FieldName = 'currid'
          end
        end
      end
    end
    object panFooter: TPanel
      Left = 0
      Top = 78
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
        Left = 269
        Top = 6
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = #1042#1089#1077#1075#1086' '#1091#1089#1083#1091#1075
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object stCount: TssBevel
        Left = 336
        Top = 5
        Width = 102
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
        Width = 441
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
  object pcMain: TcxPageControl [1]
    Left = 0
    Top = 104
    Width = 435
    Height = 162
    ActivePage = tsAdd
    Align = alBottom
    Images = dmData.Images
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
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
        Height = 136
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
        Height = 136
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
        Top = 137
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
        Height = 136
        Align = alClient
        BorderStyle = bsNone
        Color = clWindow
        TabOrder = 0
        DividerPos = 157
        GridColor = 13554646
        Flat = True
        MaxRowTextLineCount = 0
        Options = [ioBandSizing, ioColumnSizing, ioDynamicColumnSizing, ioEditing, ioRowAutoHeight]
        PaintStyle = ipsSimple
        OnDrawCaption = inspMainDrawCaption
        OnDrawValue = inspMainDrawValue
        Data = {
          A10000000800000008000000000000000600000069724E616D65080000000000
          0000090000006972417274696B756C08000000000000000900000069724D6561
          7375726508000000000000000500000069724772700800000000000000090000
          00697249735472616E7308000000000000000700000069725072696365080000
          00000000000600000069725479706508000000000000000600000069724E6F72
          6D00000000}
        object irName: TdxInspectorTextRow
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
          ReadOnly = True
        end
        object irArtikul: TdxInspectorTextRow
          Caption = #1040#1088#1090#1080#1082#1091#1083
          ReadOnly = True
        end
        object irGrp: TdxInspectorTextRow
          Caption = #1043#1088#1091#1087#1087#1072
          ReadOnly = True
        end
        object irPrice: TdxInspectorTextRow
          Caption = #1062#1077#1085#1072
          ReadOnly = True
        end
        object irIsTrans: TdxInspectorTextRow
          Caption = #1058#1088#1072#1085#1089#1087#1086#1088#1090#1085#1072#1103
          ReadOnly = True
        end
        object irType: TdxInspectorTextRow
          Caption = #1058#1080#1087' '#1091#1089#1083#1091#1075#1080
          ReadOnly = True
        end
        object irMeasure: TdxInspectorTextRow
          Caption = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
          ReadOnly = True
        end
        object irNorm: TdxInspectorTextRow
          Caption = #1053#1086#1088#1084#1072
          ReadOnly = True
        end
      end
    end
    object tsNotes: TcxTabSheet
      Caption = 'tsNotes'
      ImageIndex = 4
      OnShow = tsNotesShow
      DesignSize = (
        435
        138)
      object ssBevel15: TssBevel
        Left = 0
        Top = 1
        Width = 1
        Height = 136
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
      object ssBevel16: TssBevel
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
      object ssBevel17: TssBevel
        Left = 0
        Top = 137
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
      object ssBevel18: TssBevel
        Left = 434
        Top = 1
        Width = 1
        Height = 136
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
        Width = 424
        Height = 124
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
      ImageIndex = 2
      TabVisible = False
      object grdAdd: TssDBGrid
        Tag = 1
        Left = 0
        Top = 0
        Width = 435
        Height = 138
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
        PopupMenu = pmAdd
        ShowHint = True
        TabOrder = 0
        OnDragDrop = grdAddDragDrop
        OnDragOver = grdAddDragOver
        OnKeyDown = grdAddKeyDown
        BandColor = 12500670
        BandFont.Charset = DEFAULT_CHARSET
        BandFont.Color = clBlack
        BandFont.Height = -11
        BandFont.Name = 'Tahoma'
        BandFont.Style = [fsBold]
        DataSource = srcAdd
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
        OnCustomDrawCell = grdAddCustomDrawCell
        LangManager = dmData.Lng
        OnGetOptionsTitle = grdAddGetOptionsTitle
        object colAddRecNo: TdxDBGridColumn
          Alignment = taCenter
          Caption = #8470
          DisableEditor = True
          HeaderAlignment = taCenter
          MaxLength = 30
          MinWidth = 30
          Sizing = False
          Width = 35
          BandIndex = 0
          RowIndex = 0
          OnGetText = colAddRecNoGetText
        end
        object colAddName: TdxDBGridColumn
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
        object colAddArtikul: TdxDBGridColumn
          Tag = 1
          DisableEditor = True
          HeaderAlignment = taCenter
          Visible = False
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'artikul'
        end
        object colAddAmount: TdxDBGridColumn
          Tag = 2
          Alignment = taRightJustify
          HeaderAlignment = taCenter
          MaxLength = 91
          Width = 99
          BandIndex = 0
          RowIndex = 0
          FieldName = 'amount'
        end
        object colAddPrice: TdxDBGridColumn
          Tag = 2
          Alignment = taRightJustify
          HeaderAlignment = taCenter
          MaxLength = 120
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'price'
        end
        object colAddID: TdxDBGridColumn
          Visible = False
          Width = 37
          BandIndex = 0
          RowIndex = 0
          FieldName = 'matid'
        end
      end
    end
  end
  inherited ActionList: TActionList
    Top = 28
    object aNewGrp: TAction
      Category = 'All'
      Caption = 'aNewGrp'
      OnExecute = aNewGrpExecute
    end
    object aAddSelectAll: TAction
      Category = 'Add'
      Caption = 'aAddSelectAll'
      OnExecute = aAddSelectAllExecute
    end
    object aAddDel: TAction
      Category = 'Add'
      Caption = 'aAddDel'
      ImageIndex = 5
      ShortCut = 8238
      OnExecute = aAddDelExecute
    end
    object aAddColOptions: TAction
      Category = 'Add'
      Caption = 'aAddColOptions'
      OnExecute = aAddColOptionsExecute
    end
  end
  inherited pmMain: TTBPopupMenu
    Top = 28
    object TBItem5: TTBItem [1]
      Action = aPatternInsert
    end
    object TBSeparatorItem3: TTBSeparatorItem [5]
    end
    object TBItem6: TTBItem [6]
      Action = aSelectAll
    end
    object TBItem8: TTBItem [7]
      Action = aCut
    end
    object TBItem9: TTBItem [8]
      Action = aPaste
    end
    object TBItem7: TTBItem [10]
      Action = aExcel
    end
    object TBSeparatorItem4: TTBSeparatorItem [11]
    end
  end
  inherited cdsMain: TssClientDataSet
    Params = <
      item
        DataType = ftUnknown
        Name = 'pid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pid'
        ParamType = ptUnknown
      end>
    ProviderName = 'pSvc_List'
    BeforeOpen = cdsMainBeforeOpen
    Macros = <
      item
        DataType = ftString
        Name = 'm'
        ParamType = ptUnknown
      end>
  end
  inherited srcMain: TssDataSource
    ChangeDelay = 0
  end
  object srcAdd: TDataSource
    DataSet = mdAdd
    Left = 128
    Top = 197
  end
  object mdAdd: TssMemoryData
    Tag = 1
    FieldDefs = <>
    Left = 100
    Top = 197
    object mdAddmatid: TIntegerField
      FieldName = 'matid'
    end
    object mdAddname: TStringField
      FieldName = 'name'
      Size = 255
    end
    object mdAddamount: TFloatField
      FieldName = 'amount'
    end
    object mdAddprice: TFloatField
      FieldName = 'price'
    end
    object mdAddartikul: TStringField
      FieldName = 'artikul'
      Size = 255
    end
    object mdAddmid: TIntegerField
      FieldName = 'mid'
    end
    object mdAddmsrname: TStringField
      FieldName = 'msrname'
      Size = 5
    end
    object mdAddproducer: TStringField
      FieldName = 'producer'
      Size = 255
    end
    object mdAddbarcode: TStringField
      FieldName = 'barcode'
      Size = 64
    end
    object mdAddposid: TIntegerField
      FieldName = 'posid'
    end
  end
  object pmAdd: TTBPopupMenu
    Images = dmData.Images
    Left = 156
    Top = 197
    object TBItem21: TTBItem
      Action = aAddDel
    end
    object TBItem19: TTBItem
      Action = aAddSelectAll
    end
    object TBSeparatorItem7: TTBSeparatorItem
    end
    object TBItem20: TTBItem
      Action = aAddColOptions
    end
  end
end
