inherited fmBank: TfmBank
  object pcMain: TcxPageControl [0]
    Left = 0
    Top = 86
    Width = 435
    Height = 180
    ActivePage = tsContact
    Align = alBottom
    Images = dmData.Images
    TabOrder = 0
    OnChange = pcMainChange
    object tsAddr: TcxTabSheet
      Caption = #1040#1076#1088#1077#1089
      ImageIndex = 117
      object ssBevel2: TssBevel
        Left = 0
        Top = 1
        Width = 1
        Height = 154
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
      object ssBevel5: TssBevel
        Left = 0
        Top = 155
        Width = 435
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
      object ssBevel6: TssBevel
        Left = 434
        Top = 1
        Width = 1
        Height = 154
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
      object inspMain: TdxInspector
        Left = 1
        Top = 1
        Width = 433
        Height = 154
        Align = alClient
        BorderStyle = bsNone
        Color = clWindow
        TabOrder = 0
        DividerPos = 115
        GridColor = clBtnFace
        MaxRowTextLineCount = 0
        Options = [ioAutoWidth, ioBandSizing, ioColumnSizing, ioDynamicColumnSizing, ioEditing, ioRowAutoHeight]
        PaintStyle = ipsSimple
        OnDrawCaption = inspMainDrawCaption
        OnDrawValue = inspMainDrawValue
        Data = {
          3F00000003000000080000000000000005000000697257575708000000000000
          00060000006972416464720800000000000000080000006972436F7241636300
          000000}
        object irWWW: TdxInspectorTextHyperLinkRow
          Caption = 'WWW'
          ReadOnly = True
        end
        object irAddr: TdxInspectorTextMemoRow
          Caption = #1040#1076#1088#1077#1089
          ReadOnly = True
        end
        object irCorAcc: TdxInspectorTextRow
          Caption = #1050#1086#1088'. '#1089#1095#1105#1090
          ReadOnly = True
        end
      end
    end
    object tsContact: TcxTabSheet
      Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
      ImageIndex = 25
      object grdContact: TdxDBGrid
        Left = 0
        Top = 0
        Width = 435
        Height = 156
        DrawDragFrame = False
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'PERSONID'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        PopupMenu = pmMain
        TabOrder = 0
        DataSource = srcContact
        Filter.Criteria = {00000000}
        LookAndFeel = lfUltraFlat
        OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowAutoHeight, edgoRowSelect, edgoUseBitmap]
        OnCustomDrawCell = grdContactCustomDrawCell
        object colCName: TdxDBGridColumn
          Caption = #1060#1048#1054
          HeaderAlignment = taCenter
          Width = 147
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAME'
          OnGetText = colCNameGetText
        end
        object colCJob: TdxDBGridColumn
          Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
          HeaderAlignment = taCenter
          Width = 105
          BandIndex = 0
          RowIndex = 0
          FieldName = 'JOB'
        end
        object colCPhone: TdxDBGridColumn
          Caption = #1058#1077#1083#1077#1092#1086#1085
          HeaderAlignment = taCenter
          Width = 87
          BandIndex = 0
          RowIndex = 0
          FieldName = 'PHONE'
        end
        object colCEMail: TdxDBGridColumn
          Caption = 'E-Mail'
          HeaderAlignment = taCenter
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'EMAIL'
        end
      end
    end
  end
  object panGrid: TPanel [1]
    Left = 0
    Top = 0
    Width = 435
    Height = 86
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object ssBevel3: TssBevel
      Left = 0
      Top = 1
      Width = 1
      Height = 84
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
    object ssBevel1: TssBevel
      Left = 434
      Top = 1
      Width = 1
      Height = 84
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
      Top = 85
      Width = 435
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
    object dbgBank: TdxDBGrid
      Left = 1
      Top = 1
      Width = 433
      Height = 84
      DrawDragFrame = False
      Bands = <
        item
        end>
      DefaultLayout = True
      HeaderPanelRowCount = 1
      KeyField = 'BANKID'
      SummaryGroups = <>
      SummarySeparator = ', '
      Align = alClient
      BorderStyle = bsNone
      PopupMenu = pmMain
      TabOrder = 0
      OnDblClick = dbgBankDblClick
      OnKeyDown = dbgBankKeyDown
      DataSource = dsBank
      Filter.Criteria = {00000000}
      LookAndFeel = lfUltraFlat
      OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoTabThrough, edgoVertThrough]
      OptionsCustomize = [edgoBandMoving, edgoBandSizing]
      OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
      OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoRowSelect, edgoUseBitmap]
      OnCustomDrawCell = dbgBankCustomDrawCell
      OnSelectedCountChange = dbgBankSelectedCountChange
      object colImg: TdxDBGridImageColumn
        Alignment = taLeftJustify
        MinWidth = 16
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
          '97')
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
          '1')
      end
      object colMFO: TdxDBGridColumn
        Tag = 1
        Caption = #1052#1060#1054
        HeaderAlignment = taCenter
        Sorted = csUp
        Width = 95
        BandIndex = 0
        RowIndex = 0
        FieldName = 'MFO'
      end
      object colName: TdxDBGridColumn
        Tag = 1
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        HeaderAlignment = taCenter
        Width = 301
        BandIndex = 0
        RowIndex = 0
        FieldName = 'NAME'
      end
      object colDef: TdxDBGridColumn
        Visible = False
        Width = 175
        BandIndex = 0
        RowIndex = 0
        FieldName = 'DEF'
      end
      object colBankID: TdxDBGridColumn
        Visible = False
        Width = 48
        BandIndex = 0
        RowIndex = 0
        FieldName = 'BANKID'
      end
      object colAddr: TdxDBGridColumn
        Tag = 1
        Visible = False
        Width = 61
        BandIndex = 0
        RowIndex = 0
        FieldName = 'ADDRESS'
      end
      object colWWW: TdxDBGridColumn
        Tag = 1
        Visible = False
        Width = 40
        BandIndex = 0
        RowIndex = 0
        FieldName = 'WWW'
      end
    end
  end
  inherited ActionList: TActionList
    Left = 160
    Top = 104
  end
  inherited pmMain: TTBPopupMenu
    Left = 132
    Top = 104
    object TBItem5: TTBItem [1]
      Action = aPatternInsert
    end
    object TBItem6: TTBItem [6]
      Action = aSelectAll
    end
    object TBSeparatorItem3: TTBSeparatorItem [7]
    end
    object TBItem7: TTBItem [8]
      Action = aExcel
    end
    object TBSeparatorItem4: TTBSeparatorItem [9]
    end
  end
  object cdsBank: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pBanks_List'
    RemoteServer = dmData.SConnection
    Left = 64
    Top = 84
  end
  object dsBank: TDataSource
    DataSet = cdsBank
    OnDataChange = dsBankDataChange
    Left = 36
    Top = 84
  end
  object cdsContact: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'bankid'
        ParamType = ptInput
        Value = '3'
      end>
    ProviderName = 'pBankPersons_List'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsContactBeforeOpen
    Macros = <>
    Left = 244
    Top = 200
  end
  object srcContact: TDataSource
    DataSet = cdsContact
    Left = 272
    Top = 200
  end
end
