inherited fmWebShops: TfmWebShops
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
          KeyField = 'id'
          DragMode = dmAutomatic
          OnStartDrag = grdMainStartDrag
          Filter.Criteria = {00000000}
          OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoRowSelect, edgoUseBitmap]
          OnCustomDrawCell = nil
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
              '159'
              '160'
              '161'
              '162'
              '163'
              '164'
              '165'
              '166'
              '167'
              '168'
              '169'
              '170'
              '171'
              '172'
              '173'
              '174'
              '175'
              '176'
              '177'
              '178'
              '179'
              '180'
              '181'
              '182'
              '183'
              '184'
              '185'
              '186'
              '187'
              '188'
              '189'
              '190'
              '191'
              '192'
              '193'
              '194'
              '195'
              '196'
              '197'
              '198'
              '199'
              '200'
              '201'
              '202'
              '203'
              '204'
              '205'
              '206'
              '207'
              '208'
              '209')
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
          object colDescription: TdxDBGridColumn
            Caption = 'Description'
            Width = 300
            BandIndex = 0
            RowIndex = 0
            FieldName = 'description'
          end
          object colID: TdxDBGridColumn
            Visible = False
            BandIndex = 0
            RowIndex = 0
            FieldName = 'id'
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
        Left = 304
        Top = 6
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = 'Total'
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
    ActivePage = tsMain
    Align = alBottom
    Images = dmData.Images
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Visible = False
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
        Data = {1A0000000100000008000000000000000600000069724E616D6500000000}
        object irName: TdxInspectorTextRow
          Caption = 'Name'
          ReadOnly = True
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
    ProviderName = 'pWebShops_List'
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
  object pmAdd: TTBPopupMenu
    Images = dmData.Images
    Left = 156
    Top = 197
    object TBItem21: TTBItem
      Caption = 'aAddDel'
      ImageIndex = 5
      ShortCut = 8238
    end
    object TBItem19: TTBItem
      Caption = 'aAddSelectAll'
    end
    object TBSeparatorItem7: TTBSeparatorItem
    end
    object TBItem20: TTBItem
      Caption = 'aAddColOptions'
    end
  end
end
