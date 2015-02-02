inherited fmKAgent: TfmKAgent
  Width = 606
  Height = 267
  object panMain: TPanel [0]
    Left = 0
    Top = 0
    Width = 606
    Height = 267
    Align = alClient
    BevelOuter = bvNone
    Ctl3D = True
    ParentBackground = False
    ParentCtl3D = False
    TabOrder = 0
    object ssBevel3: TssBevel
      Left = 0
      Top = 0
      Width = 1
      Height = 70
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
    object ssBevel8: TssBevel
      Left = 605
      Top = 0
      Width = 1
      Height = 70
      Align = alRight
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
    object panBottom: TPanel
      Left = 0
      Top = 70
      Width = 606
      Height = 197
      Align = alBottom
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 0
      object pcEditKAgent: TcxPageControl
        Left = 0
        Top = 0
        Width = 606
        Height = 197
        ActivePage = tsNotes
        Align = alClient
        Images = dmData.Images
        LookAndFeel.Kind = lfUltraFlat
        TabOrder = 0
        OnChange = pcEditKAgentChange
        object PageMain: TcxTabSheet
          Caption = #1054#1089#1085#1086#1074#1085#1072#1103' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1103
          ImageIndex = 117
          DesignSize = (
            606
            173)
          object bvlBottomLine: TssBevel
            Left = 0
            Top = 191
            Width = 442
            Height = 1
            Anchors = [akLeft, akRight, akBottom]
            ColorGrBegin = clBtnFace
            ColorGrEnd = clBtnFace
            ColorInner = clBtnShadow
            ColorOuter = clBtnShadow
            Edges = [beBottom]
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Shape = bsFrame
            Style = bsSingle
            UseGradient = False
          end
          object ssBevel4: TssBevel
            Left = 0
            Top = 0
            Width = 606
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
          object ssBevel14: TssBevel
            Left = 0
            Top = 1
            Width = 1
            Height = 171
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
            Top = 172
            Width = 606
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
          object ssBevel16: TssBevel
            Left = 605
            Top = 1
            Width = 1
            Height = 171
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
            Width = 604
            Height = 171
            Align = alClient
            BorderStyle = bsNone
            Color = clWindow
            TabOrder = 0
            DividerPos = 202
            GridColor = 13554646
            Flat = True
            Options = [ioBandSizing, ioColumnSizing, ioDynamicColumnSizing, ioEditing, ioRowAutoHeight]
            PaintStyle = ipsSimple
            OnDrawCaption = inspDocDrawCaption
            OnDrawValue = inspDocDrawValue
            Data = {
              CD0000000A00000008000000000000000600000069724E616D65080000000000
              00000A000000697246756C6C4E616D6508000000000000000700000069724B54
              79706508000000000000000800000069724B414B696E6408000000000000000B
              000000697250726963655479706508000000000000000600000069724F4B504F
              08000000000000000500000069724B505008000000000000000A00000069724E
              445350617965720800000000000000050000006972494E4E0800000000000000
              090000006972436572744E756D00000000}
            object irName: TdxInspectorTextRow
              Caption = #1057#1086#1082#1088'. '#1085#1072#1079#1074#1072#1085#1080#1077
              ReadOnly = True
            end
            object irKAKind: TdxInspectorTextRow
              Caption = #1050#1077#1084' '#1103#1074#1083#1103#1077#1090#1089#1103
              ReadOnly = True
            end
            object irKType: TdxInspectorTextRow
              Caption = #1058#1080#1087' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1072
              ReadOnly = True
            end
            object irOKPO: TdxInspectorTextRow
              Caption = #1054#1050#1055#1054
              ReadOnly = True
            end
            object irFullName: TdxInspectorTextMemoRow
              Caption = #1055#1086#1083#1085#1086#1077' '#1085#1072#1079#1074#1072#1085#1080#1077
              ReadOnly = True
            end
            object irKPP: TdxInspectorTextRow
              Caption = #1050#1055#1055
              ReadOnly = True
            end
            object irNDSPayer: TdxInspectorTextRow
              Caption = #1055#1083#1072#1090#1077#1083#1100#1097#1080#1082' '#1053#1044#1057
              ReadOnly = True
            end
            object irINN: TdxInspectorTextRow
              Caption = #1048#1053#1053
              ReadOnly = True
            end
            object irCertNum: TdxInspectorTextRow
              Caption = #1053#1086#1084#1077#1088' '#1089#1074#1080#1076'-'#1074#1072
              ReadOnly = True
            end
            object irPriceType: TdxInspectorTextRow
              Caption = #1062#1077#1085#1086#1074#1072#1103' '#1082#1072#1090#1077#1075#1086#1088#1080#1103
              ReadOnly = True
              OnDrawValue = irPriceTypeDrawValue
            end
          end
        end
        object tsContacts: TcxTabSheet
          Caption = 'tsContacts'
          ImageIndex = 24
          object ssBevel17: TssBevel
            Left = 0
            Top = 1
            Width = 1
            Height = 171
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
          object ssBevel18: TssBevel
            Left = 0
            Top = 0
            Width = 606
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
          object ssBevel19: TssBevel
            Left = 605
            Top = 1
            Width = 1
            Height = 171
            Align = alRight
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
          object ssBevel20: TssBevel
            Left = 0
            Top = 172
            Width = 606
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
          object inspAddr: TdxInspector
            Left = 1
            Top = 1
            Width = 604
            Height = 171
            Align = alClient
            BorderStyle = bsNone
            Color = clWindow
            TabOrder = 0
            DividerPos = 158
            GridColor = 13554646
            Flat = True
            Options = [ioBandSizing, ioColumnSizing, ioDynamicColumnSizing, ioEditing, ioRowAutoHeight]
            PaintStyle = ipsSimple
            OnDrawCaption = inspDocDrawCaption
            OnDrawValue = inspDocDrawValue
            Data = {
              7D0000000600000008000000000000000B00000069724C6567616C4164647208
              000000000000000A000000697246616374416464720800000000000000070000
              00697250686F6E65080000000000000005000000697246617808000000000000
              000500000069725757570800000000000000070000006972454D61696C000000
              00}
            object irPhone: TdxInspectorTextRow
              Caption = #1058#1077#1083#1077#1092#1086#1085
              ReadOnly = True
            end
            object irFax: TdxInspectorTextRow
              Caption = #1060#1072#1082#1089
              ReadOnly = True
            end
            object irWWW: TdxInspectorTextHyperLinkRow
              Caption = 'Internet'
              ReadOnly = True
            end
            object irEMail: TdxInspectorTextHyperLinkRow
              Caption = 'E-Mail'
              ReadOnly = True
            end
            object irLegalAddr: TdxInspectorTextMemoRow
              Caption = #1070#1088#1080#1076#1080#1095#1077#1089#1082#1080#1081' '#1072#1076#1088#1077#1089
              ReadOnly = True
            end
            object irFactAddr: TdxInspectorTextMemoRow
              Caption = #1060#1072#1082#1090#1080#1095#1077#1089#1082#1080#1081' '#1072#1076#1088#1077#1089
              ReadOnly = True
            end
          end
        end
        object PagePersons: TcxTabSheet
          Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1099#1077' '#1083#1080#1094#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ImageIndex = 25
          ParentFont = False
          object ssBevel7: TssBevel
            Left = 731
            Top = 1
            Width = 1
            Height = 171
            Align = alRight
            ColorGrBegin = clBtnFace
            ColorGrEnd = clBtnFace
            ColorInner = clBtnShadow
            ColorOuter = clBtnShadow
            Edges = [beRight]
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Style = bsSingle
            UseGradient = False
          end
          object ssBevel10: TssBevel
            Left = 0
            Top = 0
            Width = 732
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
            Shape = bsBottomLine
            UseGradient = False
          end
          object ssBevel11: TssBevel
            Left = 0
            Top = 1
            Width = 1
            Height = 171
            Align = alLeft
            ColorGrBegin = clBtnFace
            ColorGrEnd = clBtnFace
            ColorInner = clBtnShadow
            ColorOuter = clBtnShadow
            Edges = [beRight]
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Style = bsSingle
            UseGradient = False
          end
          object ssBevel13: TssBevel
            Left = 0
            Top = 172
            Width = 732
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
            Shape = bsBottomLine
            UseGradient = False
          end
          object grdContact: TssDBGrid
            Left = 1
            Top = 1
            Width = 730
            Height = 171
            Hint = 'E-Mail'
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
            BorderStyle = bsNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnDblClick = grdContactDblClick
            BandFont.Charset = DEFAULT_CHARSET
            BandFont.Color = clBlack
            BandFont.Height = -11
            BandFont.Name = 'Tahoma'
            BandFont.Style = [fsBold]
            DataSource = srcPersons
            Filter.Criteria = {00000000}
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clBlack
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
            LookAndFeel = lfUltraFlat
            OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
            OptionsView = [edgoBandHeaderWidth, edgoRowAutoHeight, edgoRowSelect, edgoUseBitmap]
            PreviewFont.Charset = DEFAULT_CHARSET
            PreviewFont.Color = clBlue
            PreviewFont.Height = -11
            PreviewFont.Name = 'Tahoma'
            PreviewFont.Style = [fsBold]
            OnCustomDrawCell = grdContactCustomDrawCell
            object colCName: TdxDBGridColumn
              Caption = #1060#1048#1054
              HeaderAlignment = taCenter
              Width = 168
              BandIndex = 0
              RowIndex = 0
              FieldName = 'NAME'
              OnGetText = colCNameGetText
            end
            object colCJob: TdxDBGridColumn
              Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
              HeaderAlignment = taCenter
              Width = 121
              BandIndex = 0
              RowIndex = 0
              FieldName = 'Post'
              OnGetText = colCJobGetText
            end
            object colCEMail: TdxDBGridColumn
              Caption = 'E-Mail'
              HeaderAlignment = taCenter
              Width = 100
              BandIndex = 0
              RowIndex = 0
              FieldName = 'EMAIL'
            end
            object colCPhone: TdxDBGridColumn
              Caption = #1058#1077#1083#1077#1092#1086#1085
              HeaderAlignment = taCenter
              Width = 93
              BandIndex = 0
              RowIndex = 0
              FieldName = 'PHONE'
            end
            object colPJobType: TdxDBGridColumn
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'jobtype'
            end
          end
        end
        object PageAccounts: TcxTabSheet
          Caption = #1057#1095#1077#1090#1072
          ImageIndex = 26
          object ssBevel1: TssBevel
            Left = 731
            Top = 1
            Width = 1
            Height = 171
            Align = alRight
            ColorGrBegin = clBtnFace
            ColorGrEnd = clBtnFace
            ColorInner = clBtnShadow
            ColorOuter = clBtnShadow
            Edges = [beRight]
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Style = bsSingle
            UseGradient = False
          end
          object ssBevel2: TssBevel
            Left = 0
            Top = 172
            Width = 732
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
            Shape = bsBottomLine
            UseGradient = False
          end
          object ssBevel5: TssBevel
            Left = 0
            Top = 1
            Width = 1
            Height = 171
            Align = alLeft
            ColorGrBegin = clBtnFace
            ColorGrEnd = clBtnFace
            ColorInner = clBtnShadow
            ColorOuter = clBtnShadow
            Edges = [beRight]
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Style = bsSingle
            UseGradient = False
          end
          object ssBevel6: TssBevel
            Left = 0
            Top = 0
            Width = 732
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
            Shape = bsBottomLine
            UseGradient = False
          end
          object grdAcc: TssDBGrid
            Left = 1
            Top = 1
            Width = 730
            Height = 171
            Hint = 'Name'
            DrawDragFrame = False
            Bands = <
              item
              end>
            DefaultLayout = True
            HeaderPanelRowCount = 1
            KeyField = 'ACCID'
            SummaryGroups = <>
            SummarySeparator = ', '
            Align = alClient
            BorderStyle = bsNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            PopupMenu = pmAcc
            ShowHint = True
            TabOrder = 0
            OnDblClick = grdAccDblClick
            BandFont.Charset = DEFAULT_CHARSET
            BandFont.Color = clBlack
            BandFont.Height = -11
            BandFont.Name = 'Tahoma'
            BandFont.Style = [fsBold]
            DataSource = srcAcc
            Filter.Criteria = {00000000}
            HeaderFont.Charset = DEFAULT_CHARSET
            HeaderFont.Color = clBlack
            HeaderFont.Height = -11
            HeaderFont.Name = 'Tahoma'
            HeaderFont.Style = []
            LookAndFeel = lfUltraFlat
            OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
            OptionsView = [edgoBandHeaderWidth, edgoRowAutoHeight, edgoRowSelect, edgoUseBitmap]
            PreviewFont.Charset = DEFAULT_CHARSET
            PreviewFont.Color = clBlue
            PreviewFont.Height = -11
            PreviewFont.Name = 'Tahoma'
            PreviewFont.Style = [fsBold]
            OnCustomDrawCell = grdContactCustomDrawCell
            object colAccType: TdxDBGridColumn
              Alignment = taLeftJustify
              HeaderAlignment = taCenter
              Width = 120
              BandIndex = 0
              RowIndex = 0
              FieldName = 'TypeName'
              OnGetText = colAccTypeGetText
            end
            object colAccount: TdxDBGridColumn
              HeaderAlignment = taCenter
              Width = 120
              BandIndex = 0
              RowIndex = 0
              FieldName = 'AccNum'
            end
            object colMFO: TdxDBGridColumn
              HeaderAlignment = taCenter
              Sorted = csDown
              Width = 100
              BandIndex = 0
              RowIndex = 0
              FieldName = 'MFO'
            end
            object colBankName: TdxDBGridColumn
              HeaderAlignment = taCenter
              Width = 150
              BandIndex = 0
              RowIndex = 0
              FieldName = 'Name'
            end
          end
        end
        object tsDoc: TcxTabSheet
          Caption = 'tsDoc'
          ImageIndex = 68
          object ssBevel25: TssBevel
            Left = 605
            Top = 1
            Width = 1
            Height = 171
            Align = alRight
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
          object ssBevel26: TssBevel
            Left = 0
            Top = 0
            Width = 606
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
          object ssBevel27: TssBevel
            Left = 0
            Top = 1
            Width = 1
            Height = 171
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
          object ssBevel28: TssBevel
            Left = 0
            Top = 172
            Width = 606
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
          object inspDoc: TdxInspector
            Left = 1
            Top = 1
            Width = 604
            Height = 171
            Align = alClient
            BorderStyle = bsNone
            Color = clWindow
            TabOrder = 0
            DividerPos = 202
            GridColor = 13554646
            Flat = True
            Options = [ioBandSizing, ioColumnSizing, ioDynamicColumnSizing, ioEditing, ioRowAutoHeight]
            PaintStyle = ipsSimple
            OnDrawCaption = inspDocDrawCaption
            OnDrawValue = inspDocDrawValue
            Data = {
              74000000050000000800000000000000050000006972446F6308000000000000
              000B0000006972446F635365726965730800000000000000080000006972446F
              634E756D08000000000000000F0000006972446F6357686F50726F6475636508
              00000000000000090000006972446F634461746500000000}
            object irDoc: TdxInspectorTextRow
              Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
              ReadOnly = True
            end
            object irDocSeries: TdxInspectorTextRow
              Caption = #1057#1077#1088#1080#1103
              ReadOnly = True
            end
            object irDocNum: TdxInspectorTextRow
              Caption = #1053#1086#1084#1077#1088
              ReadOnly = True
            end
            object irDocWhoProduce: TdxInspectorTextMemoRow
              Caption = #1050#1077#1084' '#1074#1099#1076#1072#1085
              ReadOnly = True
            end
            object irDocDate: TdxInspectorTextRow
              Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
              ReadOnly = True
            end
          end
        end
        object tsNotes: TcxTabSheet
          Caption = #1056#1077#1082#1074#1080#1079#1080#1090#1099
          ImageIndex = 4
          OnShow = tsNotesShow
          object ssBevel21: TssBevel
            Left = 0
            Top = 1
            Width = 1
            Height = 171
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
          object ssBevel22: TssBevel
            Left = 0
            Top = 172
            Width = 606
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
          object ssBevel23: TssBevel
            Left = 0
            Top = 0
            Width = 606
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
          object ssBevel24: TssBevel
            Left = 605
            Top = 1
            Width = 1
            Height = 171
            Align = alRight
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
          object memNotes: TcxMemo
            Left = 1
            Top = 1
            Width = 604
            Height = 171
            Align = alClient
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
      end
    end
    object panGrid: TPanel
      Left = 1
      Top = 0
      Width = 604
      Height = 70
      Align = alClient
      BevelOuter = bvNone
      ParentBackground = False
      ParentColor = True
      TabOrder = 1
      object ssBevel9: TssBevel
        Left = 0
        Top = 1
        Width = 604
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
      object ssBevel29: TssBevel
        Left = 0
        Top = 0
        Width = 604
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
      object dbgKAgent: TssDBGrid
        Left = 0
        Top = 2
        Width = 604
        Height = 40
        Hint = #1050#1086#1085#1090#1072#1082#1090#1085#1099#1081' '#1090#1077#1083#1077#1092#1086#1085
        DrawDragFrame = False
        Bands = <
          item
          end>
        DefaultLayout = True
        HeaderPanelRowCount = 1
        KeyField = 'KAID'
        SummaryGroups = <>
        SummarySeparator = ', '
        Align = alClient
        BorderStyle = bsNone
        ParentShowHint = False
        PopupMenu = pmMain
        ShowHint = True
        TabOrder = 0
        OnDblClick = dbgKAgentDblClick
        OnKeyDown = dbgKAgentKeyDown
        DataSource = srcView
        Filter.Criteria = {00000000}
        LookAndFeel = lfUltraFlat
        OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoStoreToRegistry, edgoTabThrough, edgoVertThrough]
        OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
        OptionsView = [edgoBandHeaderWidth, edgoHideFocusRect, edgoRowSelect, edgoUseBitmap]
        OnCustomDrawCell = dbgKAgentCustomDrawCell
        OnSelectedCountChange = dbgKAgentSelectedCountChange
        Constraints.MinHeight = 40
        LangManager = dmData.Lng
        OnNeedAdjust = dbgKAgentNeedAdjust
        OnGetOptionsTitle = dbgKAgentGetOptionsTitle
        object colID: TdxDBGridColumn
          Visible = False
          Width = 77
          BandIndex = 0
          RowIndex = 0
          FieldName = 'KAID'
        end
        object colImg: TdxDBGridImageColumn
          Alignment = taCenter
          MinWidth = 16
          Sizing = False
          Width = 30
          BandIndex = 0
          RowIndex = 0
          FieldName = 'KTYPE'
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
            '76')
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
            '0'
            '1')
        end
        object colName: TdxDBGridColumn
          Tag = 1
          Alignment = taLeftJustify
          Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          HeaderAlignment = taCenter
          Width = 210
          BandIndex = 0
          RowIndex = 0
          FieldName = 'NAME'
        end
        object colFullName: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'FULLNAME'
        end
        object colJob: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          Width = 80
          BandIndex = 0
          RowIndex = 0
          FieldName = 'JOB'
          OnGetText = colJobGetText
        end
        object colPhone: TdxDBGridColumn
          Tag = 1
          Caption = #1050#1086#1085#1090#1072#1082#1090#1085#1099#1081' '#1090#1077#1083#1077#1092#1086#1085
          HeaderAlignment = taCenter
          MinWidth = 0
          Width = 100
          BandIndex = 0
          RowIndex = 0
          FieldName = 'kakind'
          OnGetText = colPhoneGetText
        end
        object colSaldo: TdxDBGridColumn
          Tag = 1
          Alignment = taRightJustify
          Caption = #1041#1072#1083#1083#1072#1085#1089
          HeaderAlignment = taCenter
          Width = 80
          BandIndex = 0
          RowIndex = 0
          FieldName = 'saldo'
          OnGetText = colSaldoGetText
        end
        object colKType: TdxDBGridColumn
          HeaderAlignment = taCenter
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'ktype'
        end
        object colCountry: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'COUNTRY'
        end
        object colDistrict: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'DISTRICT'
        end
        object colCity: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'CITY'
        end
        object colAddress: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'ADDRESS'
        end
        object colPostIndex: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'POSTINDEX'
        end
        object colPhoneEx: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'PHONE'
        end
        object colFax: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'FAX'
        end
        object colINN: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'INN'
        end
        object colCertNum: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'CERTNUM'
        end
        object colOKPO: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'OKPO'
        end
        object colKPP: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'KPP'
        end
        object colEMail: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'EMAIL'
        end
        object colWWW: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'WWW'
        end
        object colBirthDate: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'BIRTHDATE'
        end
        object colJobType: TdxDBGridColumn
          HeaderAlignment = taCenter
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'jobtype'
        end
        object colDef: TdxDBGridColumn
          HeaderAlignment = taCenter
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'def'
        end
        object colNotes: TdxDBGridColumn
          Tag = 1
          HeaderAlignment = taCenter
          Visible = False
          Width = 60
          BandIndex = 0
          RowIndex = 0
          FieldName = 'notes'
        end
        object colArchived: TdxDBGridColumn
          Visible = False
          BandIndex = 0
          RowIndex = 0
          FieldName = 'archived'
        end
      end
      object panFooter: TPanel
        Left = 0
        Top = 42
        Width = 604
        Height = 28
        Align = alBottom
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 1
        DesignSize = (
          604
          28)
        object lCount: TLabel
          Left = 669
          Top = 7
          Width = 106
          Height = 13
          Alignment = taRightJustify
          Anchors = [akRight, akBottom]
          Caption = #1042#1089#1077#1075#1086' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1086#1074':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object stCount: TssBevel
          Left = 789
          Top = 6
          Width = 102
          Height = 16
          Alignments.Horz = taRightJustify
          Anchors = [akRight, akBottom]
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
        object ssBevel12: TssBevel
          Left = 0
          Top = 27
          Width = 604
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
        object ssBevel30: TssBevel
          Left = 0
          Top = 0
          Width = 604
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
      end
    end
  end
  inherited ActionList: TActionList
    OnUpdate = ActionListUpdate
    object aNewAcc: TAction [14]
      Category = 'Acc'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 3
      ShortCut = 45
      OnExecute = aNewAccExecute
    end
    object aAccProps: TAction [15]
      Tag = 1
      Category = 'Acc'
      Caption = #1057#1074#1086#1081#1089#1090#1074#1072
      ImageIndex = 4
      ShortCut = 16397
      OnExecute = aNewAccExecute
    end
    object aDelAcc: TAction [16]
      Category = 'Acc'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      ShortCut = 16430
      OnExecute = aDelAccExecute
    end
    object aAccRefresh: TAction [17]
      Category = 'Acc'
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 6
      ShortCut = 116
      OnExecute = aAccRefreshExecute
    end
    object aMoveTo: TAction [18]
      Category = 'MoveTo'
      Caption = #1055#1077#1088#1077#1085#1077#1089#1090#1080' '#1074' '
      Visible = False
      OnExecute = aMoveToExecute
    end
    object aToEnt: TAction [19]
      Category = 'MoveTo'
      Caption = 'aToEnt'
      OnExecute = aToEntExecute
    end
    object aToPersons: TAction [20]
      Tag = 1
      Category = 'MoveTo'
      Caption = 'aToPersons'
      OnExecute = aToEntExecute
    end
    object aToWorkers: TAction [21]
      Tag = 2
      Category = 'MoveTo'
      Caption = 'aToWorkers'
      OnExecute = aToEntExecute
    end
    object aPersonNew: TAction [22]
      Category = 'Persons'
      Caption = 'aPersonNew'
      ImageIndex = 3
      ShortCut = 45
      OnExecute = aPersonNewExecute
    end
    object aPersonProps: TAction [23]
      Tag = 1
      Category = 'Persons'
      Caption = 'aPersonProps'
      ImageIndex = 4
      ShortCut = 16397
      OnExecute = aPersonNewExecute
    end
    object aPersonRefresh: TAction [24]
      Category = 'Persons'
      Caption = 'aPersonRefresh'
      ImageIndex = 6
      ShortCut = 116
      OnExecute = aPersonRefreshExecute
    end
    object aPersonDel: TAction [25]
      Category = 'Persons'
      Caption = 'aPersonDel'
      ImageIndex = 5
      ShortCut = 16430
      OnExecute = aPersonDelExecute
    end
    object aTurnover: TAction [26]
      Caption = #1054#1090#1095#1105#1090' '#1087#1086' '#1082#1086#1085#1090#1088#1072#1075#1077#1085#1090#1091
      ImageIndex = 116
      ShortCut = 16457
      OnExecute = aTurnoverExecute
    end
    object aRecalc: TAction [27]
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1073#1072#1083#1083#1072#1085#1089
      OnExecute = aRecalcExecute
    end
    object aRecalcAll: TAction [28]
      Caption = #1055#1077#1088#1077#1089#1095#1080#1090#1072#1090#1100' '#1073#1072#1083#1083#1072#1085#1089' '#1076#1083#1103' '#1074#1089#1077#1093
      OnExecute = aRecalcAllExecute
    end
    object aMakeDefEnt: TAction
      Caption = #1057#1076#1077#1083#1072#1090#1100' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1077' '#1086#1089#1085#1086#1074#1085#1099#1084
      ShortCut = 113
      OnExecute = aMakeDefEntExecute
    end
    object aOrdersInfo: TAction
      Caption = 'aOrdersInfo'
      ImageIndex = 203
      ShortCut = 16463
      OnExecute = aOrdersInfoExecute
    end
  end
  inherited pmMain: TTBPopupMenu
    OnPopup = pmMainPopup
    object TBItem8: TTBItem [1]
      Action = aPatternInsert
    end
    object TBItem9: TTBItem [6]
      Action = aTurnover
    end
    object TBItem26: TTBItem [7]
      Action = aOrdersInfo
    end
    object TBSeparatorItem9: TTBSeparatorItem [8]
    end
    object TBItem19: TTBItem [9]
      Action = aSelectAll
    end
    object TBSeparatorItem4: TTBSeparatorItem [10]
    end
    object TBItem10: TTBItem [11]
      Action = aRecalc
    end
    object TBItem11: TTBItem [12]
      Action = aRecalcAll
    end
    object TBSeparatorItem11: TTBSeparatorItem [13]
    end
    object TBItem24: TTBItem [14]
      Action = aArchive
    end
    object TBItem25: TTBItem [15]
      Action = aShowArchived
    end
    object TBSeparatorItem3: TTBSeparatorItem [16]
    end
    object TBSubmenuItem1: TTBSubmenuItem [17]
      Action = aMoveTo
      object TBItem6: TTBItem
        Action = aToPersons
      end
      object TBItem5: TTBItem
        Action = aToEnt
      end
      object TBItem7: TTBItem
        Action = aToWorkers
      end
    end
    object TBItem21: TTBItem [18]
      Action = aMakeDefEnt
    end
    object TBItem20: TTBItem [19]
      Action = aExcel
    end
    object TBSeparatorItem10: TTBSeparatorItem [20]
    end
    object TBItem23: TTBItem [21]
      Action = aColParams
    end
  end
  object srcAcc: TDataSource
    DataSet = cdsAcc
    Left = 184
    Top = 24
  end
  object cdsView: TssClientDataSet
    Aggregates = <>
    FilterOptions = [foCaseInsensitive]
    Params = <
      item
        DataType = ftUnknown
        Name = 'ondate'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'showarchived'
        ParamType = ptUnknown
      end>
    ProviderName = 'pKAgent_List'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsViewBeforeOpen
    AfterOpen = cdsViewAfterOpen
    Macros = <
      item
        DataType = ftString
        Name = 'm'
        ParamType = ptUnknown
      end>
    Left = 272
    Top = 24
  end
  object srcView: TssDataSource
    DataSet = cdsView
    ChangeDelay = 250
    OnDelayedDataChange = srcViewDataChange
    Left = 300
    Top = 24
  end
  object cdsAcc: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'kaid'
        ParamType = ptInput
        Value = '1'
      end>
    ProviderName = 'p_AgentAccount_List'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsAccBeforeOpen
    Macros = <>
    Left = 156
    Top = 24
  end
  object cdsPersons: TssClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'kaid'
        ParamType = ptInput
        Value = '1'
      end>
    ProviderName = 'pAgentPersons_List'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsPersonsBeforeOpen
    Macros = <>
    Left = 84
    Top = 24
  end
  object srcPersons: TDataSource
    DataSet = cdsPersons
    Left = 112
    Top = 24
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
    Left = 336
    Top = 24
  end
  object pmPersons: TTBPopupMenu
    Images = dmData.Images
    Left = 120
    Top = 132
    object TBItem12: TTBItem
      Action = aPersonNew
      Images = dmData.Images
    end
    object TBItem14: TTBItem
      Action = aPersonDel
    end
    object TBSeparatorItem5: TTBSeparatorItem
    end
    object TBItem15: TTBItem
      Action = aPersonRefresh
    end
    object TBSeparatorItem6: TTBSeparatorItem
    end
    object TBItem22: TTBItem
      Action = aPersonProps
    end
  end
  object pmAcc: TTBPopupMenu
    Images = dmData.Images
    Left = 148
    Top = 132
    object TBItem13: TTBItem
      Action = aNewAcc
      Images = dmData.Images
    end
    object TBItem16: TTBItem
      Action = aDelAcc
    end
    object TBSeparatorItem7: TTBSeparatorItem
    end
    object TBItem17: TTBItem
      Action = aAccRefresh
    end
    object TBSeparatorItem8: TTBSeparatorItem
    end
    object TBItem18: TTBItem
      Action = aAccProps
    end
  end
  object xlsExport: TssXLSExport
    XLSExportFile = xlsExpFile
    OnSaveField = xlsExportSaveField
    OnProgress = xlsExportProgress
    Left = 228
    Top = 108
  end
  object xlsExpFile: TXLSExportFile
    Left = 256
    Top = 108
  end
end
