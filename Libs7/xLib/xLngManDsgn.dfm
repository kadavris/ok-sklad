object frmLngManDsgn: TfrmLngManDsgn
  Left = 197
  Top = 122
  Width = 586
  Height = 461
  Caption = 'Language Resources Editor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnResize = FormResize
  DesignSize = (
    578
    434)
  PixelsPerInch = 96
  TextHeight = 13
  object pcMain: TPageControl
    Left = 8
    Top = 8
    Width = 562
    Height = 387
    ActivePage = tsRes
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    OnChange = pcMainChange
    object tsFiles: TTabSheet
      Caption = 'Languages'
      DesignSize = (
        554
        359)
      object tlFiles: TdxTreeList
        Left = 4
        Top = 4
        Width = 458
        Height = 351
        DrawDragFrame = False
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        TabOrder = 0
        HideSelection = False
        Options = [aoColumnSizing, aoEditing, aoTabs, aoTabThrough, aoImmediateEditor, aoAutoWidth, aoAutoSort]
        OptionsEx = [aoUseBitmap, aoBandHeaderWidth, aoAutoCalcPreviewLines, aoBandSizing, aoBandMoving, aoEnterShowEditor, aoDragScroll, aoDragExpand, aoAutoSortRefresh, aoAnsiSort]
        TreeLineColor = clGrayText
        ShowGrid = True
        ShowLines = False
        ShowRoot = False
        GridLineColor = clBtnFace
        OnGetImageIndex = tlMainGetImageIndex
        OnGetSelectedIndex = tlMainGetImageIndex
        OnEdited = tlFilesEdited
        Anchors = [akLeft, akTop, akRight, akBottom]
        object colDesc: TdxTreeListColumn
          Caption = 'Description'
          HeaderAlignment = taCenter
          Width = 70
          BandIndex = 0
          RowIndex = 0
        end
        object colName: TdxTreeListColumn
          Caption = 'Language'
          HeaderAlignment = taCenter
          Width = 157
          BandIndex = 0
          RowIndex = 0
        end
        object colFileName: TdxTreeListButtonColumn
          Caption = 'Filename'
          HeaderAlignment = taCenter
          Width = 227
          BandIndex = 0
          RowIndex = 0
          Buttons = <
            item
              Default = True
            end>
          OnButtonClick = colFileNameButtonClick
        end
      end
      object xButton1: TxButton
        Left = 470
        Top = 98
        Width = 80
        Height = 25
        Action = aFClear
        Anchors = [akTop, akRight]
        Gradient.ColorEnd = clBtnHighlight
        Gradient.Direction = gdVertical
        Gradient.Enabled = True
        HotTrackShadowColor = clMedGray
        TabOrder = 1
      end
      object xButton2: TxButton
        Left = 470
        Top = 34
        Width = 80
        Height = 25
        Action = aFDelete
        Anchors = [akTop, akRight]
        Gradient.ColorEnd = clBtnHighlight
        Gradient.Direction = gdVertical
        Gradient.Enabled = True
        HotTrackShadowColor = clMedGray
        TabOrder = 2
      end
      object xButton3: TxButton
        Left = 470
        Top = 5
        Width = 80
        Height = 25
        Action = aFAdd
        Anchors = [akTop, akRight]
        Gradient.ColorEnd = clBtnHighlight
        Gradient.Direction = gdVertical
        Gradient.Enabled = True
        HotTrackShadowColor = clMedGray
        TabOrder = 3
      end
    end
    object tsRes: TTabSheet
      Caption = 'Resources'
      ImageIndex = 1
      DesignSize = (
        554
        359)
      object xBevel1: TxBevel
        Left = 466
        Top = 200
        Width = 84
        Height = 43
        Alignment = taLeftJustify
        Anchors = [akTop, akRight]
        ColorInner = clBtnShadow
        ColorOuter = clBtnShadow
        Edges = []
      end
      object tlMain: TdxTreeList
        Left = 4
        Top = 4
        Width = 456
        Height = 351
        DrawDragFrame = False
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        PopupMenu = pmMain
        TabOrder = 0
        HideSelection = False
        Images = ilMain
        Options = [aoColumnSizing, aoEditing, aoTabs, aoTabThrough, aoRowSelect, aoAutoSort]
        OptionsEx = [aoUseBitmap, aoBandHeaderWidth, aoAutoCalcPreviewLines, aoBandSizing, aoBandMoving, aoEnterShowEditor, aoDragScroll, aoDragExpand, aoMultiSort, aoAnsiSort]
        TreeLineColor = clGrayText
        ShowGrid = True
        GridLineColor = clBtnFace
        OnExit = tlMainExit
        OnGetImageIndex = tlMainGetImageIndex
        OnGetSelectedIndex = tlMainGetImageIndex
        OnCustomDrawCell = tlMainCustomDrawCell
        OnChangedColumnsWidth = tlMainChangedColumnsWidth
        OnColumnClick = tlMainColumnClick
        OnColumnSorting = tlMainColumnSorting
        OnChangeNode = tlMainChangeNode
        OnCollapsed = tlMainCollapsed
        OnEdited = tlMainEdited
        OnEditing = tlMainEditing
        OnExpanded = tlMainExpanded
        Anchors = [akLeft, akTop, akRight, akBottom]
        object colKey: TdxTreeListColumn
          Caption = 'Section/Key'
          HeaderAlignment = taCenter
          Width = 173
          BandIndex = 0
          RowIndex = 0
        end
      end
      object btnNewSection: TxButton
        Left = 466
        Top = 4
        Width = 84
        Height = 25
        Action = aNewSection
        Anchors = [akTop, akRight]
        Gradient.ColorEnd = clBtnHighlight
        Gradient.Direction = gdVertical
        Gradient.Enabled = True
        HotTrackShadowColor = clMedGray
        TabOrder = 1
      end
      object btnNewValue: TxButton
        Left = 466
        Top = 32
        Width = 84
        Height = 25
        Action = aNewValue
        Anchors = [akTop, akRight]
        Gradient.ColorEnd = clBtnHighlight
        Gradient.Direction = gdVertical
        Gradient.Enabled = True
        HotTrackShadowColor = clMedGray
        TabOrder = 2
      end
      object btnDelete: TxButton
        Left = 466
        Top = 60
        Width = 84
        Height = 25
        Action = aDelete
        Anchors = [akTop, akRight]
        Gradient.ColorEnd = clBtnHighlight
        Gradient.Direction = gdVertical
        Gradient.Enabled = True
        HotTrackShadowColor = clMedGray
        TabOrder = 3
      end
      object rbtOnlyActive: TRadioButton
        Left = 471
        Top = 203
        Width = 73
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'Only Active'
        Checked = True
        TabOrder = 4
        TabStop = True
        OnClick = rbtOnlyActiveClick
      end
      object rbtAll: TRadioButton
        Left = 471
        Top = 221
        Width = 72
        Height = 17
        Anchors = [akTop, akRight]
        Caption = 'All'
        TabOrder = 5
        OnClick = rbtOnlyActiveClick
      end
      object Panel1: TPanel
        Left = 466
        Top = 183
        Width = 84
        Height = 18
        Anchors = [akTop, akRight]
        BevelOuter = bvNone
        Caption = 'Stretch'
        Color = clBtnShadow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object btnExpand: TxButton
        Left = 466
        Top = 107
        Width = 84
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Expand'
        Gradient.ColorEnd = clBtnHighlight
        Gradient.Direction = gdVertical
        Gradient.Enabled = True
        HotTrackShadowColor = clMedGray
        OnClick = btnExpandClick
        TabOrder = 7
      end
      object btnCollapse: TxButton
        Left = 466
        Top = 135
        Width = 84
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Collapse'
        Gradient.ColorEnd = clBtnHighlight
        Gradient.Direction = gdVertical
        Gradient.Enabled = True
        HotTrackShadowColor = clMedGray
        OnClick = btnCollapseClick
        TabOrder = 8
      end
    end
  end
  object btnClose: TxButton
    Left = 490
    Top = 402
    Width = 80
    Height = 25
    Action = aClose
    Anchors = [akRight, akBottom]
    Gradient.ColorEnd = clBtnHighlight
    Gradient.Direction = gdVertical
    Gradient.Enabled = True
    HotTrackShadowColor = clMedGray
    TabOrder = 1
  end
  object ActionList: TActionList
    OnUpdate = ActionListUpdate
    Left = 148
    Top = 120
    object aClose: TAction
      Caption = 'Close'
      ShortCut = 27
      OnExecute = aCloseExecute
    end
    object aNewSection: TAction
      Caption = 'New Section'
      ShortCut = 16429
      OnExecute = aNewSectionExecute
    end
    object aNewValue: TAction
      Caption = 'New Value'
      ShortCut = 45
      OnExecute = aNewValueExecute
    end
    object aDelete: TAction
      Caption = 'Delete'
      ShortCut = 16430
      OnExecute = aDeleteExecute
    end
    object aOpen: TAction
      Caption = 'Open'
      OnExecute = aOpenExecute
    end
    object aFClear: TAction
      Category = 'Files'
      Caption = 'Clear'
      OnExecute = aFClearExecute
    end
    object aFDelete: TAction
      Category = 'Files'
      Caption = 'Delete'
      OnExecute = aFDeleteExecute
    end
    object aFAdd: TAction
      Category = 'Files'
      Caption = 'Add'
      OnExecute = aFAddExecute
    end
  end
  object ilMain: TImageList
    Left = 176
    Top = 120
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001001000000000000008
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00003A675446AF318E2D8E2D8E2D
      8E2D8E2D8E2D8E2D8E2DAF3154463A6700000000000000000000000000000000
      0000000000000000000000000000000000000000DE7B7B6F5A6B5A6B5A6B5A6B
      5A6B5A6B5A6B5A6B5A6B5A6B7B6FDE7B0000FF7FDE7B7B6F5A6B5A6B5A6B5A6B
      5A6B5A6B5A6B5A6B5A6B5A6B5A6B7B6FDE7B0000F535DB52BB52BB4EBB4EDB56
      DB56BB52BA52BA52BA525646CF31F85E00000000000000000000000000000000
      000000000000000000000000000000000000DE7B18633146CE39CE39CE39CE39
      CE39CE39CE39CE39CE39CE3931461863DE7BDE7B39671042AD35AD35AD35AD35
      AD35AD35AD35AD35AD35AD35AD35104239670000163A9E6B9F679F679F637F5F
      7F5F7F5B5F575F575F53FC5A8E2DF85A00000000000000000000000000000000
      0000000000000000000000000000000000007B6FC151C151C151C151C151C151
      C151C151C151C151C151C1518C3131467B6F7B6F035A035AE359E255E255C255
      C151C151A151A04DA04DA04D804D292510420000373ABE6FBF6B9F679F679F63
      7F5F7F5B5F5B5F575F57FC5A8E2DF85A00000000000000000000000000000000
      00000000000000000000000000000000000063626362F37F4D7F4D7F4D7F4D7F
      4D7F4D7F4D7F4D7F4D7F655EC151CE395A6B045E2C7F045EF37F4D7F4D7F4D7F
      4D7F4D7F4D7F4D7F4D7F876AF37F804DAD350000383EFA5A784A784A9F639F67
      7E63B95278467846DC461C5B8E2DF85A00000000000000000000000000000000
      000000000000000000000000000000000000636263628F7BF37F8F7F8F7F8F7F
      8F7F8F7F8F7F8F7F6F7FC86EE34D8C31F75E245E2C7F245EF37F8F7F8F7F8F7F
      8F7F8F7F8F7F8F7F8F7FA86EF37FA04DAD350000593E5266A1708E51BF6B9F67
      5D63E6584050E944DC461C5B8E2DF85A00000000000000000000000000000000
      00000000000000000000000000000000000063628466E86AF37FB07FB07FB07F
      B07FB07FB07FB07F907FE87663628C31314625622C7F4562F37FB07FB07FB07F
      B07FB07FB07FB07FB07FC972F37FA04DAD3500007942DF77106A6D51784A784A
      784A615C404C5E5B7F5F1C5B8E2DF85A00000000000000000000000000000000
      0000000000000000000000000000000000006362C8728466F47FD27FD27FD27F
      D27FD27FD27FD27FD27FEA72EB66C151CE3925622C7F6666F37FD27FD27FD27F
      D27FD27FD27FD27FD27FEA76F37FA04DAD3500009A42DF779D73A074AE591066
      E6606060AF4D9F637F5F1C5B8E2DF85A00000000000000000000000000000000
      00000000000000000000000000000000000063624E7F6362D17BF37FF37FF37F
      F37FF37FF37FF37FF37F0B7FF27FE34DCE3945624D7F6666F37FF37FF37FF37F
      F37FF37FF37FF37FF37F0C7FF37FA151AD350000BB42DF7BFF7B8A69F349BE6F
      A168605C5E5F9F679F631C5B8E2DF85A00000000000000000000000000000000
      0000000000000000000000000000000000006362507F6362ED6E00000000FE7F
      00000000000000000000907F0000E351314645628F7F4562FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F907FFF7FC15131460000BB42FF7FFF7B9D77A268CF59
      A0708F4DBF6B9F679F671D5B8E2DF85A00000000000000000000000000000000
      0000000000000000000000000000000000006362B07F0A736362636263626362
      6362636263626362636263626362235A18634666B07F907F4562456245624562
      456245622562245E045E035A035A035A7B6F0000BB42FF7FFF7FFF7B8A69C078
      80645E63BF6FBF6B9F671D5FAF31F85A00000000000000000000000000000000
      0000000000000000000000000000000000006362D37FD17FD17FD17FD17FD17F
      000000000000000000006362E34D1863DE7B6666D27FD17FD17FD17FD17FD17F
      FF7FFF7FFF7FFF7FFF7FE25531467B6FFF7F0000BB42FF7FFF7FFF7F3973C07C
      AF51DF73DF73BF6FBF6B1D5BF139196300000000000000000000000000000000
      00000000000000000000000000000000000063620000F37FF37FF37FF37F0000
      6362636263626362636263627B6FDE7B00006666FF7FF37FF37FF37FF37FFF7F
      245E045E035A035A035AE3597B6FDE7BFF7F0000BB42FF7F0000FF7FFF7F516E
      BE73DF775F675F67DE56D131754A7B6B00000000000000000000000000000000
      0000000000000000000000000000000000000000846600000000000000006362
      1863DE7B0000000000000000000000000000FF7F6666FF7FFF7FFF7FFF7F2562
      3967DE7BFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000BB420000000000000000FF7F
      FF7BFF7B9E229E223B22123E1963BE7700000000000000000000000000000000
      0000000000000000000000000000000000000000000084668466846684667B6F
      DE7B00000000000000000000000000000000FF7FFF7F66666666466645627B6F
      DE7BFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000BB4200000000000000000000
      00000000BB42BC3AD131D7569C73FF7F00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000BB42BB42BB42BB42BB42BB42
      BB469A42BB42DF77000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFF0000800100008001000080010000
      0000000080010000000000008001000000000000800100000000000080010000
      0000000080010000000000008001000000000000800100000DF4000080010000
      000000008001000001F00000800100004201000090010000BC7F0000BC010000
      C0FF0000BF810000FFFF0000801F000000000000000000000000000000000000
      000000000000}
  end
  object pmMain: TPopupMenu
    Left = 208
    Top = 120
    object NewSection1: TMenuItem
      Action = aNewSection
    end
    object NewValue1: TMenuItem
      Action = aNewValue
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Delete1: TMenuItem
      Action = aDelete
    end
  end
end
