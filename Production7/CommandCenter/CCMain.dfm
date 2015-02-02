inherited frmCCMain: TfrmCCMain
  Left = 387
  Top = 270
  Width = 921
  Height = 572
  Caption = 'ccmain'
  KeyPreview = True
  Position = poDefault
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 16
  inherited panTitleBar: TssGradientPanel
    Width = 905
    TabOrder = 3
    inherited panTitleButtons: TssPanel
      Left = 846
      inherited btnTBMinimize: TssSpeedButton
        Height = 16
      end
      inherited btnTBMaximize: TssSpeedButton
        Height = 16
      end
      inherited btnTBClose: TssSpeedButton
        Height = 16
      end
    end
  end
  object panButtons: TPanel [1]
    Left = 0
    Top = 500
    Width = 905
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    ParentColor = True
    TabOrder = 0
    Visible = False
    DesignSize = (
      905
      34)
    object bvlFooterSep: TssBevel
      Left = 0
      Top = 0
      Width = 905
      Height = 1
      Align = alTop
      ColorGrBegin = clBtnFace
      ColorGrEnd = clBtnFace
      ColorInner = clBtnShadow
      ColorOuter = clWindow
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Shape = bsTopLine
      UseGradient = False
    end
    object btnSelect: TxButton
      Left = 731
      Top = 7
      Width = 80
      Height = 22
      Action = aSelect
      Anchors = [akRight, akBottom]
      ColorInner = clBtnShadow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Gradient.ColorEnd = clWindow
      Gradient.Direction = gdVertical
      Gradient.Enabled = True
      ParentFont = False
      TabOrder = 0
    end
    object btnClose: TxButton
      Left = 815
      Top = 7
      Width = 80
      Height = 22
      Action = aClose
      Anchors = [akRight, akBottom]
      ColorInner = clBtnShadow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      Gradient.ColorEnd = clWindow
      Gradient.Direction = gdVertical
      Gradient.Enabled = True
      ParentFont = False
      TabOrder = 1
    end
  end
  object panMain: TPanel [2]
    Left = 0
    Top = 21
    Width = 905
    Height = 446
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    ParentColor = True
    TabOrder = 2
    object splMain: TSplitter
      Left = 210
      Top = 0
      Height = 446
      AutoSnap = False
      MinSize = 60
      OnCanResize = splMainCanResize
    end
    object panLeft: TPanel
      Left = 0
      Top = 0
      Width = 210
      Height = 446
      Align = alLeft
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 0
      object panLeftButtons: TPanel
        Left = 0
        Top = 0
        Width = 210
        Height = 30
        Align = alTop
        BevelOuter = bvSpace
        BorderStyle = bsSingle
        ParentBackground = False
        ParentColor = True
        TabOrder = 0
        DesignSize = (
          206
          26)
        object btnByGroup: TssSpeedButton
          Left = 6
          Top = 0
          Action = aByGroup
          Alignment = taLeftJustify
          AllwaysShowFrame = False
          ButtonType = ssbtChecked
          Checked = False
          GroupIndex = 100
          ImageIndex = 22
          Images = dmData.Images18x18
          LeftMargin = 5
          ParentShowHint = False
          ShowHint = True
          Style = ssbsUser
          ViewStyle = ssvsGlyphOnly
        end
        object btnByWHouse: TssSpeedButton
          Left = 30
          Top = 0
          Action = aByWHouse
          Alignment = taLeftJustify
          AllwaysShowFrame = False
          ButtonType = ssbtChecked
          Checked = False
          GroupIndex = 100
          ImageIndex = 26
          Images = dmData.Images18x18
          LeftMargin = 5
          ParentShowHint = False
          ShowHint = True
          Style = ssbsUser
          ViewStyle = ssvsGlyphOnly
        end
        object btnDrillDown: TssSpeedButton
          Left = 175
          Top = 0
          Action = aDrillDown
          Alignment = taLeftJustify
          AllwaysShowFrame = False
          Anchors = [akTop, akRight]
          ButtonType = ssbtChecked
          Checked = False
          GroupIndex = 0
          ImageIndex = 25
          Images = dmData.Images18x18
          LeftMargin = 4
          ParentShowHint = False
          ShowHint = True
          Style = ssbsUser
          ViewStyle = ssvsGlyphOnly
        end
        object btnShowGrp: TssSpeedButton
          Left = 151
          Top = 0
          Alignment = taLeftJustify
          AllwaysShowFrame = False
          Anchors = [akTop, akRight]
          ButtonType = ssbtChecked
          Checked = False
          Caption = 'aDrillDown'
          GroupIndex = 0
          ImageIndex = 23
          Images = dmData.Images18x18
          LeftMargin = 5
          ParentShowHint = False
          ShowHint = True
          Style = ssbsUser
          ViewStyle = ssvsGlyphOnly
          OnClick = btnShowGrpClick
        end
      end
      object panTree: TPanel
        Left = 0
        Top = 30
        Width = 210
        Height = 416
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 1
        object tlMain: TTreeView
          Left = 0
          Top = 0
          Width = 210
          Height = 416
          Align = alClient
          BevelInner = bvSpace
          BevelOuter = bvRaised
          BevelKind = bkFlat
          BorderStyle = bsNone
          DragMode = dmAutomatic
          HideSelection = False
          Images = dmData.Images
          Indent = 21
          ParentShowHint = False
          RightClickSelect = True
          ShowHint = True
          TabOrder = 0
          ToolTips = False
          OnChange = tlMainChange
          OnChanging = tlMainChanging
          OnCustomDrawItem = tlMainCustomDrawItem
          OnDragDrop = tlMainDragDrop
          OnDragOver = tlMainDragOver
          OnEdited = tlMainEdited
          OnEditing = tlMainEditing
          OnExpanding = tlMainExpanding
          OnGetImageIndex = tlMainGetImageIndex
          OnGetSelectedIndex = tlMainGetImageIndex
          OnMouseUp = tlMainMouseUp
        end
        object Button1: TButton
          Left = 68
          Top = 196
          Width = 75
          Height = 25
          Caption = 'Button1'
          TabOrder = 1
          Visible = False
          OnClick = Button1Click
        end
      end
    end
    object panRight: TssImagePanel
      Left = 213
      Top = 0
      Width = 692
      Height = 446
      Align = alClient
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 1
      Picture.Data = {07544269746D617000000000}
      object panBar: TPanel
        Left = 0
        Top = 0
        Width = 692
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        ParentBackground = False
        ParentColor = True
        TabOrder = 0
        DesignSize = (
          692
          30)
        object bvlBarTop: TssBevel
          Left = 0
          Top = 0
          Width = 692
          Height = 30
          Align = alClient
          ColorGrBegin = clBtnFace
          ColorGrEnd = clBtnFace
          ColorInner = clBtnShadow
          ColorOuter = clBtnShadow
          Edges = [beLeft, beRight, beTop]
          GradientDirection = gdHorizontal
          HotTrack = False
          ImageIndex = 0
          Style = bsSingle
          UseGradient = False
        end
        object btnDirUp: TssSpeedButton
          Left = 240
          Top = 3
          Action = aDirUp
          Alignment = taLeftJustify
          AllwaysShowFrame = False
          ButtonType = ssbtStandard
          Checked = False
          DisabledImageIndex = 10
          GroupIndex = 0
          ImageIndex = 10
          Images = dmData.Images18x18
          LeftMargin = 3
          ParentShowHint = False
          ShowHint = True
          Style = ssbsUser
          ViewStyle = ssvsGlyphOnly
        end
        object btnView: TssSpeedButton
          Left = 264
          Top = 3
          Action = aView
          Alignment = taLeftJustify
          AllwaysShowFrame = False
          ButtonType = ssbtStandard
          Checked = False
          DisabledImageIndex = 11
          GroupIndex = 0
          ImageIndex = 11
          Images = dmData.Images18x18
          LeftMargin = 3
          ParentShowHint = False
          ShowHint = True
          Style = ssbsUser
          ViewStyle = ssvsGlyphOnly
        end
        object btnHelp: TssSpeedButton
          Left = 656
          Top = 3
          Width = 26
          Action = aHelp
          Alignment = taLeftJustify
          AllwaysShowFrame = False
          Anchors = [akTop, akRight]
          ButtonType = ssbtStandard
          Checked = False
          GroupIndex = 0
          ImageIndex = 7
          Images = dmData.Images18x18
          LeftMargin = 4
          ParentShowHint = False
          ShowHint = True
          Style = ssbsUser
          ViewStyle = ssvsGlyphOnly
        end
        object btnNew: TssSpeedButton
          Left = 3
          Top = 3
          Action = aNew
          Alignment = taLeftJustify
          AllwaysShowFrame = False
          ButtonType = ssbtStandard
          Checked = False
          GroupIndex = 0
          ImageIndex = 0
          Images = dmData.Images18x18
          LeftMargin = 3
          ParentShowHint = False
          ShowHint = True
          Style = ssbsUser
          ViewStyle = ssvsGlyphOnly
        end
        object btnProps: TssSpeedButton
          Left = 51
          Top = 3
          Action = aProps
          Alignment = taLeftJustify
          AllwaysShowFrame = False
          ButtonType = ssbtStandard
          Checked = False
          GroupIndex = 0
          ImageIndex = 1
          Images = dmData.Images18x18
          LeftMargin = 3
          ParentShowHint = False
          ShowHint = True
          Style = ssbsUser
          ViewStyle = ssvsGlyphOnly
        end
        object btnRefresh: TssSpeedButton
          Left = 99
          Top = 3
          Action = aRefresh
          Alignment = taLeftJustify
          AllwaysShowFrame = False
          ButtonType = ssbtStandard
          Checked = False
          GroupIndex = 0
          ImageIndex = 3
          Images = dmData.Images18x18
          LeftMargin = 3
          ParentShowHint = False
          ShowHint = True
          Style = ssbsUser
          ViewStyle = ssvsGlyphOnly
        end
        object btnDel: TssSpeedButton
          Left = 75
          Top = 3
          Action = aDel
          Alignment = taLeftJustify
          AllwaysShowFrame = False
          ButtonType = ssbtStandard
          Checked = False
          GroupIndex = 0
          ImageIndex = 2
          Images = dmData.Images18x18
          LeftMargin = 3
          ParentShowHint = False
          ShowHint = True
          Style = ssbsUser
          ViewStyle = ssvsGlyphOnly
        end
        object btnCheck: TssSpeedButton
          Left = 123
          Top = 3
          Action = aCheck
          Alignment = taLeftJustify
          AllwaysShowFrame = False
          ButtonType = ssbtStandard
          Checked = False
          GroupIndex = 0
          ImageIndex = 21
          Images = dmData.Images18x18
          LeftMargin = 3
          ParentShowHint = False
          ShowHint = True
          Style = ssbsUser
          ViewStyle = ssvsGlyphOnly
        end
        object sepDyn: TBevel
          Left = 151
          Top = 5
          Width = 1
          Height = 22
          Shape = bsLeftLine
        end
        object btnDyn: TssSpeedButton
          Left = 155
          Top = 3
          Action = aDynamic
          Alignment = taLeftJustify
          AllwaysShowFrame = False
          ButtonType = ssbtChecked
          Checked = False
          GroupIndex = 0
          ImageIndex = 9
          Images = dmData.Images18x18
          LeftMargin = 3
          ParentShowHint = False
          ShowHint = True
          Style = ssbsUser
          ViewStyle = ssvsGlyphOnly
        end
        object sepPrint: TBevel
          Left = 182
          Top = 5
          Width = 1
          Height = 22
          Shape = bsLeftLine
        end
        object btnPrint: TssSpeedButton
          Left = 185
          Top = 3
          Action = aPrint
          Alignment = taLeftJustify
          AllwaysShowFrame = False
          ButtonType = ssbtStandard
          Checked = False
          GroupIndex = 0
          ImageIndex = 54
          Images = dmData.Images18x18
          LeftMargin = 3
          ParentShowHint = False
          ShowHint = True
          Style = ssbsUser
          ViewStyle = ssvsGlyphOnly
        end
        object btnExcel: TssSpeedButton
          Left = 209
          Top = 3
          Action = aExcel
          Alignment = taLeftJustify
          AllwaysShowFrame = False
          ButtonType = ssbtStandard
          Checked = False
          GroupIndex = 0
          ImageIndex = 20
          Images = dmData.Images18x18
          LeftMargin = 3
          ParentShowHint = False
          ShowHint = True
          Style = ssbsUser
          ViewStyle = ssvsGlyphOnly
        end
        object btnPatternNew: TssSpeedButton
          Left = 27
          Top = 3
          Action = aPatternNew
          Alignment = taLeftJustify
          AllwaysShowFrame = False
          ButtonType = ssbtStandard
          Checked = False
          GroupIndex = 0
          ImageIndex = 27
          Images = dmData.Images18x18
          LeftMargin = 3
          ParentShowHint = False
          ShowHint = True
          Style = ssbsUser
          ViewStyle = ssvsGlyphOnly
        end
        object btnReconnect: TssSpeedButton
          Left = 581
          Top = 3
          Width = 26
          Action = aReconnect
          Alignment = taLeftJustify
          AllwaysShowFrame = False
          Anchors = [akTop, akRight]
          ButtonType = ssbtStandard
          Checked = False
          GroupIndex = 0
          ImageIndex = 30
          Images = dmData.Images18x18
          LeftMargin = 3
          ParentShowHint = False
          ShowHint = True
          Style = ssbsUser
          ViewStyle = ssvsGlyphOnly
        end
        object btnLock: TssSpeedButton
          Left = 606
          Top = 3
          Width = 26
          Action = aLock
          Alignment = taLeftJustify
          AllwaysShowFrame = False
          Anchors = [akTop, akRight]
          ButtonType = ssbtStandard
          Checked = False
          GroupIndex = 0
          ImageIndex = 31
          Images = dmData.Images18x18
          LeftMargin = 4
          ParentShowHint = False
          ShowHint = True
          Style = ssbsUser
          ViewStyle = ssvsGlyphOnly
        end
        object btnErrMess: TssSpeedButton
          Left = 632
          Top = 3
          Action = aErrMess
          Alignment = taLeftJustify
          AllwaysShowFrame = False
          Anchors = [akTop, akRight]
          ButtonType = ssbtStandard
          Checked = False
          GroupIndex = 0
          ImageIndex = 36
          Images = dmData.Images18x18
          LeftMargin = 4
          ParentShowHint = False
          ShowHint = True
          Style = ssbsUser
          ViewStyle = ssvsGlyphOnly
        end
        object Bevel1: TBevel
          Left = 237
          Top = 5
          Width = 1
          Height = 22
          Shape = bsLeftLine
        end
        object Bevel3: TBevel
          Left = 577
          Top = 5
          Width = 2
          Height = 22
          Anchors = [akTop, akRight]
          Shape = bsLeftLine
        end
        object panFindTop: TPanel
          Left = 292
          Top = 1
          Width = 282
          Height = 28
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 0
          DesignSize = (
            282
            28)
          object txtLang2: TssLabel
            Left = 203
            Top = 4
            Width = 21
            Height = 18
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            Caption = 'EN'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            DisabledDraw = ddUser
            DisabledColor = clWindow
          end
          object btnFind: TssSpeedButton
            Left = 233
            Top = 2
            Width = 26
            Action = aFind
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = 18
            Images = dmData.Images18x18
            LeftMargin = 3
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
          end
          object btnFindParams: TssSpeedButton
            Left = 257
            Top = 2
            Action = aFindProps
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = 19
            Images = dmData.Images18x18
            LeftMargin = 3
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
          end
          object Bevel2: TBevel
            Left = 2
            Top = 4
            Width = 1
            Height = 22
            Shape = bsLeftLine
          end
          object edFind: TcxTextEdit
            Left = 8
            Top = 3
            Width = 193
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Properties.OnChange = edFindPropertiesChange
            TabOrder = 0
            ImeName = 'Russian'
          end
        end
      end
      object panGroup: TPanel
        Left = 0
        Top = 30
        Width = 692
        Height = 416
        Align = alClient
        BevelInner = bvLowered
        ParentBackground = False
        ParentColor = True
        TabOrder = 1
        DesignSize = (
          692
          416)
        object lvGroup: TcxListView
          Left = 2
          Top = 2
          Width = 688
          Height = 412
          Columns = <
            item
              Width = 200
            end>
          ColumnClick = False
          IconOptions.AutoArrange = True
          ItemIndex = -1
          ReadOnly = True
          ShowColumnHeaders = False
          ViewStyle = vsSmallIcon
          OnCustomDrawItem = lvGroupCustomDrawItem
          OnGetImageIndex = lvGroupGetImageIndex
          Align = alClient
          ParentColor = False
          Style.BorderColor = clGray
          Style.BorderStyle = cbsSingle
          Style.HotTrack = False
          TabOrder = 0
          ImeName = 'Russian'
          OnDblClick = lvGroupDblClick
        end
        object panData: TPanel
          Left = 2
          Top = 2
          Width = 688
          Height = 412
          Align = alClient
          BevelOuter = bvNone
          Color = clGray
          ParentBackground = False
          TabOrder = 1
        end
        object panNoAccess: TPanel
          Left = 113
          Top = 94
          Width = 449
          Height = 202
          Anchors = [akLeft, akTop, akRight, akBottom]
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Color = clWindow
          ParentBackground = False
          TabOrder = 2
          Visible = False
          object txtNoAccess: TssBevel
            Left = 2
            Top = 2
            Width = 445
            Height = 198
            Align = alClient
            Alignments.Horz = taCenter
            Caption = 'txtNoAccess'
            ColorGrBegin = clWindow
            ColorGrEnd = clWindow
            ColorInner = clBtnShadow
            ColorOuter = clBtnShadow
            Edges = [beLeft, beRight, beTop, beBottom]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Style = bsSingle
            UseGradient = True
          end
        end
      end
    end
  end
  object panFindBottom: TPanel [3]
    Left = 0
    Top = 467
    Width = 905
    Height = 33
    Align = alBottom
    BevelOuter = bvNone
    UseDockManager = False
    ParentBackground = False
    ParentColor = True
    TabOrder = 1
    Visible = False
    DesignSize = (
      905
      33)
    object btnFind2: TssSpeedButton
      Left = 787
      Top = 7
      Width = 108
      Height = 22
      Action = aFind2
      Alignment = taCenter
      AllwaysShowFrame = True
      Anchors = [akTop, akRight]
      ButtonType = ssbtStandard
      Checked = False
      Caption = #1053#1072#1081#1090#1080' '#1076#1072#1083#1077#1077
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      GroupIndex = 0
      ImageIndex = 18
      LeftMargin = 3
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsCaptionGlyph
    end
    object lFindBy: TssLabel
      Left = 5
      Top = 10
      Width = 52
      Height = 16
      Alignment = taRightJustify
      Caption = #1055#1086#1080#1089#1082' '#1087#1086
      DisabledDraw = ddUser
      DisabledColor = clBtnShadow
    end
    object txtLang: TssLabel
      Left = 608
      Top = 8
      Width = 21
      Height = 18
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'EN'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      DisabledDraw = ddUser
      DisabledColor = clBtnShadow
    end
    object edFind2: TcxTextEdit
      Left = 349
      Top = 6
      Width = 260
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      Properties.OnChange = edFind2PropertiesChange
      TabOrder = 3
      ImeName = 'Russian'
      OnKeyPress = edFind2KeyPress
    end
    object cbFindField: TcxComboBox
      Left = 68
      Top = 6
      Width = 137
      Height = 24
      ImeName = 'Russian'
      Properties.DropDownListStyle = lsFixedList
      Properties.OnEditValueChanged = cbFindFieldPropertiesEditValueChanged
      Style.ButtonStyle = btsSimple
      TabOrder = 0
    end
    object cbFindCriteria: TcxComboBox
      Left = 208
      Top = 6
      Width = 137
      Height = 24
      ImeName = 'Russian'
      Properties.DropDownListStyle = lsFixedList
      Properties.Items.Strings = (
        '???????')
      Properties.OnEditValueChanged = cbFindCriteriaPropertiesEditValueChanged
      Style.ButtonStyle = btsSimple
      TabOrder = 1
    end
    object chbContextFind: TcxCheckBox
      Left = 637
      Top = 6
      Width = 140
      Height = 24
      Anchors = [akTop, akRight]
      Properties.DisplayUnchecked = 'False'
      Properties.Glyph.Data = {
        2A0A0000424D2A0A0000000000003600000028000000410000000D0000000100
        180000000000F4090000C40E0000C40E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00FF00
        FF00000000000000000000000000000000000000000000000000000000000000
        0000FF00FFFF00FF000000000000000000000000000000000000000000000000
        000000000000000000FF00FFFF00FF0000000000000000000000000000000000
        00000000000000000000000000000000FF00FFFF00FF80808080808080808080
        8080808080808080808080808080808080808080808080FF00FFFF00FF808080
        808080808080808080808080808080808080808080808080808080808080FF00
        FF00FF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF000000FF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FF808080FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FF00FFFF00
        FF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80
        8080FF00FF00FF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF000000FF00FFFF00FF000000FFFFFFFFFFFFFFFFFF000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FF000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FF8080
        80FFFFFFFFFFFFFFFFFF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FF
        00FFFF00FF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF808080FF00FF00FF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FF000000FFFFFFFFFFFF000000
        000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FF000000FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF
        00FF808080FFFFFFFFFFFF808080808080808080FFFFFFFFFFFFFFFFFFFFFFFF
        808080FF00FFFF00FF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF808080FF00FF00FF00FF000000FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FF000000FFFFFF0000
        00000000000000000000000000FFFFFFFFFFFFFFFFFF000000FF00FFFF00FF00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000
        FF00FFFF00FF808080FFFFFF808080808080808080808080808080FFFFFFFFFF
        FFFFFFFF808080FF00FFFF00FF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF808080FF00FF00FF00FF000000FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FF000000FF
        FFFF000000000000FFFFFF000000000000000000FFFFFFFFFFFF000000FF00FF
        FF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF000000FF00FFFF00FF808080FFFFFF808080808080FFFFFF80808080808080
        8080FFFFFFFFFFFF808080FF00FFFF00FF808080FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FF00FF00FF00FF000000FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FF
        000000FFFFFF000000FFFFFFFFFFFFFFFFFF000000000000000000FFFFFF0000
        00FF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF000000FF00FFFF00FF808080FFFFFF808080FFFFFFFFFFFFFFFFFF
        808080808080808080FFFFFF808080FF00FFFF00FF808080FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FF00FF00FF00FF000000
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00
        FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000FF
        FFFF000000FF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF000000FF00FFFF00FF808080FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFF808080808080FFFFFF808080FF00FFFF00FF808080FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FF00FF00FF00
        FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00
        0000FF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        000000FFFFFF000000FF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FF808080FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FFFFFF808080FF00FFFF00FF808080
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FF00
        FF00FF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF000000FF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FF000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FF808080FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080FF00FFFF00
        FF808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80
        8080FF00FF00FF00FF0000000000000000000000000000000000000000000000
        00000000000000000000FF00FFFF00FF00000000000000000000000000000000
        0000000000000000000000000000000000FF00FFFF00FF000000000000000000
        000000000000000000000000000000000000000000000000FF00FFFF00FF8080
        80808080808080808080808080808080808080808080808080808080808080FF
        00FFFF00FF808080808080808080808080808080808080808080808080808080
        808080808080FF00FF00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF00}
      Properties.GlyphCount = 5
      Properties.NullStyle = nssUnchecked
      Properties.Caption = #1050#1086#1085#1090#1077#1082#1089#1085#1099#1081' '#1087#1086#1080#1089#1082
      State = cbsChecked
      Style.TransparentBorder = True
      TabOrder = 2
      ImeName = 'Russian'
      OnClick = chbContextFindClick
    end
  end
  inherited ilTitleBar: TImageList
    Left = 44
    Top = 112
  end
  object FormStorage: TssFormStorage
    Active = False
    Options = [fpState]
    UseRegistry = True
    StoredProps.Strings = (
      'panLeft.Width')
    StoredValues = <
      item
        Name = 'svGroupView'
        KeyString = 'GroupView'
        OnSave = FormStorageStoredValues0Save
        OnRestore = FormStorageStoredValues0Restore
      end
      item
        Name = 'svViewType'
        KeyString = 'ViewType'
      end>
    Left = 684
    Top = 136
  end
  object srcTree: TDataSource
    DataSet = cdsTree
    Left = 156
    Top = 112
  end
  object cdsTree: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'treeid'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'shortname'
        ParamType = ptUnknown
      end>
    ProviderName = 'pCC_TreeList'
    RemoteServer = dmData.SConnection
    AfterOpen = cdsTreeAfterOpen
    Macros = <>
    Left = 108
    Top = 112
  end
  object pmGroup: TTBPopupMenu
    Left = 612
    Top = 184
    object TBItem1: TTBItem
      Action = aGroupLargeIcons
      GroupIndex = 2
    end
    object TBItem2: TTBItem
      Action = aGroupSmallIcons
      GroupIndex = 2
    end
    object TBItem4: TTBItem
      Action = aGroupList
      GroupIndex = 2
    end
    object TBItem3: TTBItem
      Action = aGroupTable
      GroupIndex = 2
    end
  end
  object pmTree: TTBPopupMenu
    OnPopup = pmTreePopup
    Left = 40
    Top = 168
    object TBItem5: TTBItem
      Action = aTreeColExp
      Options = [tboDefault]
    end
    object TBSeparatorItem1: TTBSeparatorItem
    end
    object TBSubmenuItem1: TTBSubmenuItem
      Action = aTreeNew
      object miNewWebCatLabel: TTBItem
        Caption = 'miNewWebCatLabel'
        DisplayMode = nbdmImageAndText
        ImageIndex = 25
      end
      object miNewWebCat: TTBEditItem
        Caption = 'New web cat'
        DisplayMode = nbdmImageAndText
        EditWidth = 32
        ImageIndex = 21
        OnAcceptText = miNewWebCatAcceptText
      end
      object miNewWebCatSep: TTBSeparatorItem
      end
      object imnuNewGrp: TTBItem
        Action = aTreeGrpNew
      end
      object TBItem18: TTBItem
        Action = aNewDCGroup
      end
    end
    object TBItem7: TTBItem
      Action = aTreeRename
    end
    object TBItem6: TTBItem
      Action = aTreeRefresh
    end
    object sepDel: TTBSeparatorItem
    end
    object TBItem9: TTBItem
      Action = aTreeDel
      ImageIndex = 5
    end
    object TBSeparatorItem2: TTBSeparatorItem
    end
    object TBItem14: TTBItem
      Action = aPaste
    end
    object sepClip: TTBSeparatorItem
    end
    object TBItem10: TTBItem
      Action = aTreeProps
    end
  end
  object pmFind: TTBPopupMenu
    OnPopup = pmFindPopup
    Left = 652
    Top = 184
    object mnuFindParamsSep: TTBSeparatorItem
    end
    object mnuFindBegin: TTBItem
      Action = aFindBegin
      GroupIndex = 2
    end
    object mnuFindConcurr: TTBItem
      Action = aFindConcurr
      GroupIndex = 2
    end
    object mnuFindSubstr: TTBItem
      Action = aFindSubstr
      GroupIndex = 2
    end
    object TBSeparatorItem3: TTBSeparatorItem
    end
    object TBItem11: TTBItem
      Action = aContextFind
    end
  end
  object pmPayDoc: TTBPopupMenu
    OnPopup = pmPayDocPopup
    Left = 444
    Top = 144
    object TBItem12: TTBItem
      Action = aPrintPayOrder
    end
    object TBItem13: TTBItem
      Action = aPrintInCashOrder
    end
  end
  object pmWBMov: TTBPopupMenu
    OnPopup = pmPayDocPopup
    Left = 400
    Top = 180
    object TBItem15: TTBItem
      Action = aWBMovPrint
    end
    object TBItem17: TTBItem
      Action = aWBMovPrintW
    end
    object TBItem16: TTBItem
      Action = aWBMovPrintPT
    end
    object TBItem8: TTBItem
      Action = aWBMovPrintTorg13
    end
  end
  object ActionList1: TActionList
    OnUpdate = ActionList1Update
    Left = 508
    Top = 144
    object aFind: TAction
      Category = 'Find'
      Caption = #1055#1086#1080#1089#1082
      ImageIndex = 18
      OnExecute = aFindExecute
    end
    object aFindProps: TAction
      Category = 'Find'
      Caption = 'aFindProps'
      ImageIndex = 19
      OnExecute = aFindPropsExecute
    end
    object aFindBegin: TAction
      Category = 'Find'
      AutoCheck = True
      Caption = #1057#1085#1072#1095#1072#1083#1072
      Checked = True
      GroupIndex = 2
      OnExecute = aFindBeginExecute
    end
    object aFindConcurr: TAction
      Category = 'Find'
      AutoCheck = True
      Caption = #1055#1086#1083#1085#1086#1077' '#1089#1086#1074#1087#1072#1076#1077#1085#1080#1077
      GroupIndex = 2
      OnExecute = aFindConcurrExecute
    end
    object aFindSubstr: TAction
      Category = 'Find'
      AutoCheck = True
      Caption = #1063#1072#1089#1090#1080#1095#1085#1086#1077' '#1089#1086#1074#1087#1072#1076#1077#1085#1080#1077
      GroupIndex = 2
      OnExecute = aFindSubstrExecute
    end
    object aContextFind: TAction
      Category = 'Find'
      Caption = #1050#1086#1085#1090#1077#1082#1089#1090#1085#1099#1081' '#1087#1086#1080#1089#1082
      Checked = True
      OnExecute = aContextFindExecute
    end
    object aFind2: TAction
      Tag = 1
      Category = 'Find'
      Caption = #1055#1086#1080#1089#1082
      ImageIndex = 18
      ShortCut = 16460
      OnExecute = aFindExecute
    end
    object aWBMovPrint: TAction
      Category = 'WBMov'
      Caption = 'aWBMovPrint'
      OnExecute = aWBMovPrintExecute
    end
    object aWBMovPrintW: TAction
      Category = 'WBMov'
      Caption = 'aWBMovPrintW'
      OnExecute = aWBMovPrintWExecute
    end
    object aWBMovPrintPT: TAction
      Category = 'WBMov'
      Caption = 'aWBMovPrintPT'
      OnExecute = aWBMovPrintPTExecute
    end
    object aPrintPayOrder: TAction
      Category = 'PayDoc'
      Caption = #1055#1083#1072#1090#1105#1078#1085#1086#1077' '#1087#1086#1088#1091#1095#1077#1085#1080#1077
      OnExecute = aPrintPayOrderExecute
    end
    object aPrintInCashOrder: TAction
      Category = 'PayDoc'
      Caption = #1055#1088#1080#1093#1086#1076#1085#1099#1081' '#1082#1072#1089#1089#1086#1074#1099#1081' '#1086#1088#1076#1077#1088
      OnExecute = aPrintInCashOrderExecute
    end
    object aNew: TAction
      Caption = 'aNew'
      ImageIndex = 0
      ShortCut = 45
      OnExecute = aNewExecute
    end
    object aDel: TAction
      Caption = 'aDel'
      ImageIndex = 2
      ShortCut = 16430
      OnExecute = aDelExecute
    end
    object aRefresh: TAction
      Caption = 'aRefresh'
      ImageIndex = 3
      ShortCut = 116
      OnExecute = aRefreshExecute
    end
    object aProps: TAction
      Tag = 1
      Caption = 'aProps'
      Enabled = False
      ImageIndex = 1
      ShortCut = 16397
      OnExecute = aPropsExecute
    end
    object aPrint: TAction
      Caption = 'aPrint'
      Enabled = False
      ImageIndex = 54
      ShortCut = 16464
      OnExecute = aPrintExecute
    end
    object aExcel: TAction
      Caption = 'aExcel'
      ImageIndex = 20
      OnExecute = aExcelExecute
    end
    object aDynamic: TAction
      Caption = 'aDynamic'
      ImageIndex = 9
      OnExecute = aDynamicExecute
    end
    object aDirUp: TAction
      Caption = 'aDirUp'
      Enabled = False
      ImageIndex = 10
      OnExecute = aDirUpExecute
    end
    object aView: TAction
      Caption = 'aView'
      Enabled = False
      ImageIndex = 11
      OnExecute = aViewExecute
    end
    object aHelp: TAction
      Caption = 'aHelp'
      ImageIndex = 7
      ShortCut = 112
      OnExecute = aHelpExecute
    end
    object aCheck: TAction
      Caption = 'aCheck'
      ImageIndex = 21
      ShortCut = 113
      OnExecute = aCheckExecute
    end
    object aSelect: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      ShortCut = 16467
      OnExecute = aSelectExecute
    end
    object aClose: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ShortCut = 27
      OnExecute = aCloseExecute
    end
    object aLock: TAction
      Caption = 'aLock'
      ImageIndex = 31
      OnExecute = aLockExecute
    end
    object aPatternNew: TAction
      Caption = 'aPatternNew'
      ImageIndex = 27
      ShortCut = 16429
      OnExecute = aPatternNewExecute
    end
    object aErrMess: TAction
      Caption = 'aErrMess'
      ImageIndex = 36
      OnExecute = aErrMessExecute
    end
    object aReconnect: TAction
      Caption = 'aReconnect'
      ImageIndex = 30
      OnExecute = aReconnectExecute
    end
    object aByGroup: TAction
      Caption = 'aByGroup'
      GroupIndex = 100
      ImageIndex = 22
      OnExecute = aByGroupExecute
    end
    object aByWHouse: TAction
      Caption = 'aByWHouse'
      GroupIndex = 100
      ImageIndex = 26
      OnExecute = aByWHouseExecute
    end
    object aDrillDown: TAction
      AutoCheck = True
      Caption = 'aDrillDown'
      ImageIndex = 25
      OnExecute = aDrillDownExecute
    end
    object aWBMovPrintTorg13: TAction
      Category = 'WBMov'
      Caption = 'aWBMovPrintTorg13'
      OnExecute = aWBMovPrintTorg13Execute
    end
    object aShowTree: TAction
      Category = 'Service'
      Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1076#1077#1088#1077#1074#1086
      Checked = True
      ShortCut = 122
      OnExecute = aShowTreeExecute
    end
    object aGroupSmallIcons: TAction
      Category = 'GroupView'
      Caption = 'aGroupSmallIcons'
      Checked = True
      GroupIndex = 1
      OnExecute = aGroupSmallIconsExecute
    end
    object aGroupLargeIcons: TAction
      Tag = 1
      Category = 'GroupView'
      Caption = '??????? ??????'
      GroupIndex = 1
      OnExecute = aGroupSmallIconsExecute
    end
    object aNewEx: TAction
      Category = 'Action'
      Caption = 'aNewEx'
      ImageIndex = 0
      Visible = False
      OnExecute = aNewExExecute
    end
    object aGroupList: TAction
      Tag = 2
      Category = 'GroupView'
      Caption = '??????'
      GroupIndex = 1
      OnExecute = aGroupSmallIconsExecute
    end
    object aGroupTable: TAction
      Tag = 3
      Category = 'GroupView'
      Caption = '???????'
      GroupIndex = 1
      OnExecute = aGroupSmallIconsExecute
    end
    object aNewGrp: TAction
      Category = 'Action'
      Caption = 'aNewGrp'
      ShortCut = 8237
      OnExecute = aNewGrpExecute
    end
    object aTreeRefresh: TAction
      Category = 'Tree'
      Caption = 'aTreeRefresh'
      ImageIndex = 3
      ShortCut = 116
      OnExecute = aTreeRefreshExecute
    end
    object aTreeRename: TAction
      Category = 'Tree'
      Caption = 'aTreeRename'
      OnExecute = aTreeRenameExecute
    end
    object aTreeColExp: TAction
      Category = 'Tree'
      Caption = 'aTreeColExp'
      OnExecute = aTreeColExpExecute
    end
    object aNewMain: TAction
      Category = 'Action'
      Caption = 'aNewMain'
      ShortCut = 45
      OnExecute = aNewMainExecute
    end
    object aTreeDel: TAction
      Category = 'Tree'
      Caption = 'aTreeDel'
      ImageIndex = 2
      OnExecute = aTreeDelExecute
    end
    object aTreeNew: TAction
      Category = 'Tree'
      Caption = 'aTreeNew'
      ImageIndex = 0
      OnExecute = aTreeNewExecute
    end
    object aTreeGrpNew: TAction
      Category = 'Tree'
      Caption = 'aTreeGrpNew'
      OnExecute = aTreeGrpNewExecute
    end
    object aTreeProps: TAction
      Category = 'Tree'
      Caption = 'aTreeProps'
      ImageIndex = 1
      OnExecute = aTreePropsExecute
    end
    object aPaste: TAction
      Category = 'Tree'
      Caption = 'aPaste'
      ImageIndex = 52
      OnExecute = aPasteExecute
    end
    object aNewDCGroup: TAction
      Category = 'Tree'
      Caption = 'aNewDCGroup'
      OnExecute = aNewDCGroupExecute
    end
  end
  object FrameList: TokFrameList
    OnChange = FrameListChange
    Left = 92
    Top = 168
  end
  object frDoc: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    Left = 140
    Top = 172
    ReportForm = {19000000}
  end
end
