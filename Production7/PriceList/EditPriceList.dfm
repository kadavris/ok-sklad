inherited frmEditPriceList: TfrmEditPriceList
  Left = 349
  Top = 272
  Width = 852
  Height = 566
  ActiveControl = edName
  Caption = 'frmEditPriceList'
  Constraints.MinHeight = 300
  Constraints.MinWidth = 600
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnConstrainedResize = FormConstrainedResize
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 844
    Height = 454
    object panHeader: TPanel
      Left = 0
      Top = 0
      Width = 844
      Height = 53
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      object gbMainInfo: TssGroupBox
        Left = 0
        Top = 0
        Width = 844
        Height = 53
        Align = alClient
        Alignment = alTopLeft
        Caption = 'gbMainInfo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Edges = [beLeft, beRight, beTop]
        HideCaption = True
        HotTrack = False
        DesignSize = (
          844
          53)
        object lName: TLabel
          Left = 536
          Top = 18
          Width = 108
          Height = 16
          Alignment = taRightJustify
          Caption = 'Name of document'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object lOndate: TLabel
          Left = 13
          Top = 18
          Width = 29
          Height = 16
          Alignment = taRightJustify
          Caption = #1044#1072#1090#1072
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lCurr: TLabel
          Left = 167
          Top = 18
          Width = 51
          Height = 16
          Alignment = taRightJustify
          Caption = 'Currency'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lKurs: TLabel
          Left = 342
          Top = 18
          Width = 57
          Height = 16
          Alignment = taRightJustify
          Caption = 'Exch. rate'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object sbKurs: TssSpeedButton
          Left = 412
          Top = 16
          Width = 96
          Height = 21
          Action = aSetKurs
          Alignment = taCenter
          AllwaysShowFrame = True
          ButtonType = ssbtStandard
          Checked = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          GroupIndex = 0
          ImageIndex = -1
          Images = dmData.Images
          LeftMargin = 4
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Style = ssbsUser
          ViewStyle = ssvsCaptionOnly
        end
        object edName: TcxTextEdit
          Left = 650
          Top = 14
          Width = 193
          Height = 25
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          ParentFont = False
          Properties.MaxLength = 128
          Properties.OnChange = edNamePropertiesChange
          Style.StyleController = dmData.scMain
          TabOrder = 0
          ImeName = 'Russian'
          OnKeyDown = GoNextKeyDown
        end
        object edDate: TcxDateEdit
          Left = 54
          Top = 14
          Width = 95
          Height = 24
          ImeName = 'Russian'
          ParentFont = False
          Properties.SaveTime = False
          Properties.ShowTime = False
          Properties.OnChange = edDatePropertiesChange
          Style.BorderColor = clRed
          Style.BorderStyle = ebsUltraFlat
          Style.Shadow = False
          Style.StyleController = dmData.scMain
          Style.ButtonStyle = btsSimple
          TabOrder = 1
          OnKeyDown = GoNextKeyDown
          EditValue = 0d
        end
        object cbCurr: TssDBLookupCombo
          Left = 230
          Top = 14
          Width = 86
          Height = 24
          ImeName = 'Russian'
          ParentFont = False
          Properties.DropDownListStyle = lsFixedList
          Properties.OnChange = cbCurrPropertiesChange
          Style.StyleController = dmData.scMain
          Style.ButtonStyle = btsSimple
          TabOrder = 2
          EmptyValue = 0
          KeyField = 'CURRID'
          ListField = 'SHORTNAME'
          ListSource = dsCurr
        end
      end
    end
    object PanPositions: TPanel
      Left = 0
      Top = 53
      Width = 844
      Height = 315
      Align = alClient
      BevelOuter = bvNone
      Caption = 'PanPositions'
      ParentBackground = False
      TabOrder = 1
      object gbPositions: TssGroupBox
        Left = 0
        Top = 0
        Width = 425
        Height = 315
        Align = alLeft
        Alignment = alTopLeft
        Caption = 'gbPositions'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Edges = [beLeft, beRight, beTop, beBottom]
        HideCaption = True
        HotTrack = False
        DesignSize = (
          425
          315)
        object panPosBtn: TPanel
          Left = 10
          Top = 9
          Width = 405
          Height = 35
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          object btnAdd: TssSpeedButton
            Left = 4
            Top = 0
            Width = 40
            Action = aIns
            Alignment = taCenter
            AllwaysShowFrame = False
            ButtonType = ssbtStandard
            Checked = False
            DroppedDown = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            GroupIndex = 0
            ImageIndex = 0
            Images = dmData.Images18x18
            LeftMargin = 8
            ParentFont = False
            ParentShowHint = False
            PopupMenu = pmMatSvc
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
          end
          object btnProps: TssSpeedButton
            Left = 49
            Top = 0
            Action = aPropMat
            Alignment = taCenter
            AllwaysShowFrame = False
            ButtonType = ssbtStandard
            Checked = False
            DisabledImages = dmData.Images18x18dis
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            GroupIndex = 0
            ImageIndex = 1
            Images = dmData.Images18x18
            LeftMargin = 4
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
          end
          object btnDel: TssSpeedButton
            Left = 76
            Top = 0
            Action = aDel
            Alignment = taCenter
            AllwaysShowFrame = False
            ButtonType = ssbtStandard
            Checked = False
            DisabledImages = dmData.Images18x18dis
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            GroupIndex = 0
            ImageIndex = 2
            Images = dmData.Images18x18
            LeftMargin = 4
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
          end
          object btnFullExpand: TssSpeedButton
            Left = 140
            Top = 0
            Action = aExpandAll
            Alignment = taCenter
            AllwaysShowFrame = False
            ButtonType = ssbtChecked
            Checked = True
            DisabledImages = dmData.Images18x18dis
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            GroupIndex = 0
            ImageIndex = 25
            Images = dmData.Images18x18
            LeftMargin = 4
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
          end
          object btnColsParam: TssSpeedButton
            Left = 167
            Top = 0
            Action = aColsParams
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = 40
            Images = dmData.Images
            LeftMargin = 4
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
          end
          object btnUseLogo: TssSpeedButton
            Left = 194
            Top = 0
            Action = aUseLogo
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            ButtonType = ssbtChecked
            Checked = False
            GroupIndex = 0
            ImageIndex = 118
            Images = dmData.Images
            LeftMargin = 4
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
          end
          object btnGetWMat: TssSpeedButton
            Left = 113
            Top = 0
            Action = aGetWMat
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = 50
            Images = dmData.Images
            LeftMargin = 4
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
          end
          object sepDyn: TBevel
            Left = 108
            Top = 1
            Width = 2
            Height = 27
            Shape = bsLeftLine
          end
        end
        object dbgListDet: TdxDBGrid
          Left = 12
          Top = 46
          Width = 403
          Height = 259
          DrawDragFrame = False
          Bands = <
            item
            end>
          DefaultLayout = True
          HeaderPanelRowCount = 1
          KeyField = 'pldetid'
          SummaryGroups = <>
          SummarySeparator = ', '
          DragMode = dmAutomatic
          PopupMenu = pmListDet
          TabOrder = 1
          OnDragDrop = dbgListDetDragDrop
          OnDragOver = dbgListDetDragOver
          DataSource = dsListDet
          Filter.Criteria = {00000000}
          LookAndFeel = lfUltraFlat
          OptionsBehavior = [edgoDragScroll, edgoEditing, edgoEnterShowEditor, edgoImmediateEditor, edgoMultiSelect, edgoTabThrough, edgoVertThrough]
          OptionsDB = [edgoCancelOnExit, edgoCanDelete, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
          OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoUseBitmap]
          OnChangeColumn = dbgListDetChangeColumn
          OnChangedColumnsWidth = dbgListDetChangedColumnsWidth
          OnCustomDrawCell = dbgListDetCustomDrawCell
          OnDragEndHeader = dbgListDetDragEndHeader
          OnColumnMoved = dbgListDetColumnMoved
          Anchors = [akLeft, akTop, akRight, akBottom]
        end
      end
      object gbRef: TssGroupBox
        Left = 433
        Top = 0
        Width = 411
        Height = 315
        Align = alClient
        Alignment = alTopLeft
        Caption = 'gbRef'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        Edges = [beLeft, beRight, beTop, beBottom]
        HideCaption = True
        HotTrack = False
        DesignSize = (
          411
          315)
        object panRefPosBtn: TPanel
          Left = 10
          Top = 9
          Width = 400
          Height = 34
          Anchors = [akLeft, akTop, akRight]
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          DesignSize = (
            400
            34)
          object btnFind: TssSpeedButton
            Left = 338
            Top = 0
            Action = aFind
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = 52
            Images = dmData.Images
            LeftMargin = 4
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
          end
          object btnFindParams: TssSpeedButton
            Left = 362
            Top = 0
            Action = aFindParams
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = 53
            Images = dmData.Images
            LeftMargin = 4
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
          end
          object btnRefMat: TssSpeedButton
            Left = 4
            Top = 0
            Action = aRefMat
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            ButtonType = ssbtChecked
            Checked = False
            GroupIndex = 0
            ImageIndex = 14
            Images = dmData.Images
            LeftMargin = 4
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
          end
          object btnRefServ: TssSpeedButton
            Left = 28
            Top = 0
            Action = aRefServ
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            ButtonType = ssbtChecked
            Checked = False
            GroupIndex = 0
            ImageIndex = 15
            Images = dmData.Images
            LeftMargin = 4
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
          end
          object txtLang: TLabel
            Left = 318
            Top = 4
            Width = 16
            Height = 16
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            Caption = 'RU'
            Color = clBtnFace
            ParentColor = False
          end
          object edFind: TcxTextEdit
            Left = 179
            Top = 1
            Width = 136
            Height = 24
            Anchors = [akTop, akRight]
            ParentFont = False
            Properties.OnChange = edFindPropertiesChange
            TabOrder = 0
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
          end
        end
        object pcRef: TcxPageControl
          Left = 10
          Top = 46
          Width = 390
          Height = 259
          ActivePage = PageMat
          Anchors = [akLeft, akTop, akRight, akBottom]
          Focusable = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          HideTabs = True
          Images = dmData.Images
          ParentFont = False
          TabOrder = 1
          TabPosition = tpLeft
          TabWidth = 143
          object PageServ: TcxTabSheet
            Caption = #1059#1089#1083#1091#1075#1080
            ImageIndex = 15
            object dbgSrv: TdxDBTreeList
              Left = 0
              Top = 0
              Width = 294
              Height = 369
              DrawDragFrame = False
              Bands = <
                item
                end>
              DefaultLayout = True
              HeaderPanelRowCount = 1
              KeyField = 'SvcID'
              ParentField = 'PID'
              Align = alClient
              DragMode = dmAutomatic
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              PopupMenu = pmRef
              TabOrder = 0
              OnDragOver = dbgRefDragOver
              BandFont.Charset = DEFAULT_CHARSET
              BandFont.Color = clWindowText
              BandFont.Height = -11
              BandFont.Name = 'Tahoma'
              BandFont.Style = []
              DataSource = dsSrvRef
              GridLineColor = clBtnFace
              HeaderFont.Charset = DEFAULT_CHARSET
              HeaderFont.Color = clWindowText
              HeaderFont.Height = -11
              HeaderFont.Name = 'Tahoma'
              HeaderFont.Style = []
              HideFocusRect = True
              Images = dmData.Images
              LookAndFeel = lfUltraFlat
              OptionsBehavior = [etoAutoDragDrop, etoAutoDragDropCopy, etoAutoSort, etoDragExpand, etoDragScroll, etoEditing, etoEnterShowEditor, etoImmediateEditor, etoMultiSelect, etoTabThrough]
              OptionsDB = [etoAutoCalcKeyValue, etoCancelOnExit, etoCanNavigation, etoCheckHasChildren, etoConfirmDelete, etoLoadAllRecords, etoSyncSelection]
              OptionsView = [etoAutoWidth, etoBandHeaderWidth, etoRowSelect, etoUseBitmap, etoUseImageIndexForSelected]
              PreviewFont.Charset = DEFAULT_CHARSET
              PreviewFont.Color = clBlue
              PreviewFont.Height = -11
              PreviewFont.Name = 'Tahoma'
              PreviewFont.Style = []
              ShowGrid = True
              TreeLineColor = clGrayText
              OnGetImageIndex = dbgSrvGetImageIndex
              OnGetSelectedIndex = dbgSrvGetImageIndex
              object colSvcName: TdxDBTreeListColumn
                HeaderAlignment = taCenter
                Sorted = csUp
                BandIndex = 0
                RowIndex = 0
                FieldName = 'NAME'
              end
              object colSvcISGROUP: TdxDBTreeListColumn
                HeaderAlignment = taCenter
                Visible = False
                BandIndex = 0
                RowIndex = 0
                FieldName = 'ISGRP'
              end
              object colSvcPid: TdxDBTreeListColumn
                HeaderAlignment = taCenter
                Visible = False
                BandIndex = 0
                RowIndex = 0
                FieldName = 'PID'
              end
              object colSvcId: TdxDBTreeListColumn
                HeaderAlignment = taCenter
                Visible = False
                BandIndex = 0
                RowIndex = 0
                FieldName = 'svcid'
              end
              object colSvcArtikul: TdxDBTreeListColumn
                HeaderAlignment = taCenter
                BandIndex = 0
                RowIndex = 0
                FieldName = 'artikul'
              end
              object colSvcMsrName: TdxDBTreeListColumn
                HeaderAlignment = taCenter
                MinWidth = 10
                Visible = False
                Width = 20
                BandIndex = 0
                RowIndex = 0
                FieldName = 'MSRNAME'
              end
              object colSvcRemain: TdxDBTreeListColumn
                HeaderAlignment = taCenter
                VertAlignment = tlCenter
                Visible = False
                BandIndex = 0
                RowIndex = 0
                FieldName = 'remain'
              end
              object colSvcPrice: TdxDBTreeListColumn
                HeaderAlignment = taCenter
                Visible = False
                BandIndex = 0
                RowIndex = 0
                FieldName = 'Price'
              end
            end
          end
          object PageMat: TcxTabSheet
            Caption = #1058#1086#1074#1072#1088#1099
            ImageIndex = 14
            object panRef: TPanel
              Left = 0
              Top = 0
              Width = 390
              Height = 259
              Align = alClient
              BevelOuter = bvNone
              Caption = 'panRef'
              ParentBackground = False
              TabOrder = 0
              object dbgRef: TdxDBTreeList
                Left = 0
                Top = 0
                Width = 390
                Height = 259
                DrawDragFrame = False
                Bands = <
                  item
                  end>
                DefaultLayout = True
                HeaderPanelRowCount = 1
                KeyField = 'ID'
                ParentField = 'PID'
                Align = alClient
                DragMode = dmAutomatic
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                PopupMenu = pmRef
                TabOrder = 0
                OnDragOver = dbgRefDragOver
                BandFont.Charset = DEFAULT_CHARSET
                BandFont.Color = clWindowText
                BandFont.Height = -11
                BandFont.Name = 'Tahoma'
                BandFont.Style = []
                DataSource = dsMatRef
                GridLineColor = clBtnFace
                HeaderFont.Charset = DEFAULT_CHARSET
                HeaderFont.Color = clWindowText
                HeaderFont.Height = -11
                HeaderFont.Name = 'Tahoma'
                HeaderFont.Style = []
                HideFocusRect = True
                Images = dmData.Images
                LookAndFeel = lfUltraFlat
                OptionsBehavior = [etoAutoDragDrop, etoAutoDragDropCopy, etoAutoSort, etoDragExpand, etoDragScroll, etoEditing, etoEnterShowEditor, etoImmediateEditor, etoMultiSelect, etoTabThrough]
                OptionsDB = [etoAutoCalcKeyValue, etoCancelOnExit, etoCanNavigation, etoCheckHasChildren, etoConfirmDelete, etoLoadAllRecords, etoSyncSelection]
                OptionsView = [etoAutoWidth, etoBandHeaderWidth, etoRowSelect, etoUseBitmap, etoUseImageIndexForSelected]
                PreviewFont.Charset = DEFAULT_CHARSET
                PreviewFont.Color = clBlue
                PreviewFont.Height = -11
                PreviewFont.Name = 'Tahoma'
                PreviewFont.Style = []
                ShowGrid = True
                TreeLineColor = clGrayText
                OnGetImageIndex = dbgRefGetImageIndex
                OnGetSelectedIndex = dbgRefGetImageIndex
                OnCanNodeSelected = dbgRefCanNodeSelected
                object colRefName: TdxDBTreeListColumn
                  HeaderAlignment = taCenter
                  Sorted = csUp
                  BandIndex = 0
                  RowIndex = 0
                  FieldName = 'NAME'
                end
                object colRefIsGroup: TdxDBTreeListColumn
                  HeaderAlignment = taCenter
                  Visible = False
                  BandIndex = 0
                  RowIndex = 0
                  FieldName = 'ISGROUP'
                end
                object colRefId: TdxDBTreeListColumn
                  HeaderAlignment = taCenter
                  Visible = False
                  BandIndex = 0
                  RowIndex = 0
                  FieldName = 'ID'
                end
                object colRefPid: TdxDBTreeListColumn
                  HeaderAlignment = taCenter
                  Visible = False
                  BandIndex = 0
                  RowIndex = 0
                  FieldName = 'PID'
                end
                object colRefArt: TdxDBTreeListColumn
                  HeaderAlignment = taCenter
                  BandIndex = 0
                  RowIndex = 0
                  FieldName = 'ART'
                end
                object colRefMsrName: TdxDBTreeListColumn
                  HeaderAlignment = taCenter
                  MinWidth = 10
                  Visible = False
                  Width = 20
                  BandIndex = 0
                  RowIndex = 0
                  FieldName = 'MSRNAME'
                end
                object colRefRemain: TdxDBTreeListColumn
                  HeaderAlignment = taCenter
                  VertAlignment = tlCenter
                  Visible = False
                  BandIndex = 0
                  RowIndex = 0
                  FieldName = 'remain'
                end
                object colRefPrice: TdxDBTreeListColumn
                  HeaderAlignment = taCenter
                  Visible = False
                  BandIndex = 0
                  RowIndex = 0
                  FieldName = 'Price'
                end
              end
            end
          end
          object PageSet: TcxTabSheet
            Caption = #1050#1086#1084#1087#1083#1077#1082#1090#1099
            ImageIndex = 124
            inline fmNA2: TfmNA
              Left = 0
              Top = 0
              Width = 0
              Height = 0
              Align = alClient
              TabOrder = 0
              inherited txtNA: TssBevel
                Width = 0
                Height = 0
                Caption = 'N/A'
                Font.Height = -16
              end
            end
          end
        end
      end
      object cxSplitter1: TcxSplitter
        Left = 425
        Top = 0
        Width = 8
        Height = 315
        Cursor = crHSplit
        HotZoneClassName = 'TcxMediaPlayer9Style'
        HotZone.SizePercent = 50
        HotZone.LightColor = clWhite
        PositionAfterOpen = 50
        MinSize = 300
        ResizeUpdate = True
        Control = gbPositions
        OnAfterOpen = cxSplitter1AfterOpen
        OnAfterClose = cxSplitter1AfterClose
        Color = clBtnFace
        ShowHint = True
        ParentColor = False
        ParentShowHint = False
      end
    end
    object gbNotes: TssGroupBox
      Left = 0
      Top = 368
      Width = 844
      Height = 86
      Align = alBottom
      Alignment = alTopLeft
      Caption = 'gbNotes'
      Constraints.MinHeight = 70
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      Edges = [beLeft, beRight, beBottom]
      HideCaption = True
      HotTrack = False
      DesignSize = (
        844
        86)
      object lNotes: TLabel
        Left = 10
        Top = 7
        Width = 72
        Height = 16
        Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edNotes: TcxMemo
        Left = 9
        Top = 27
        Width = 834
        Height = 49
        Anchors = [akLeft, akTop, akRight, akBottom]
        ImeName = 'Russian'
        Lines.Strings = (
          '4545')
        ParentFont = False
        Properties.MaxLength = 255
        Properties.OnChange = edNotesPropertiesChange
        Style.StyleController = dmData.scMain
        TabOrder = 0
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 844
    TabOrder = 3
    inherited panTitleButtons: TssPanel
      Left = 786
    end
  end
  inherited panButtons: TPanel
    Top = 501
    Width = 844
    inherited btnOK: TxButton
      Left = 539
    end
    inherited btnCancel: TxButton
      Left = 644
    end
    inherited btnApply: TxButton
      Left = 744
    end
  end
  inherited panToolBar: TPanel
    Width = 844
    TabOrder = 2
    inherited btnLock: TssSpeedButton
      Left = 792
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 816
    end
    inherited btnHelp: TssSpeedButton
      Left = 768
    end
    object btnSvcInfo: TssSpeedButton
      Left = 83
      Top = 0
      Action = aSvcInfo
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 160
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object btnMatInfo: TssSpeedButton
      Left = 56
      Top = 0
      Action = aMatInfo
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 99
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object ssSpeedButton1: TssSpeedButton
      Left = 29
      Top = 0
      Action = aExport
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 54
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    object btnPrint: TssSpeedButton
      Left = 2
      Top = 0
      Action = aPrint
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 9
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
  end
  inherited ilTitleBar: TImageList
    Left = 228
    Top = 444
  end
  inherited FormStorage: TssFormStorage
    StoredProps.Strings = (
      'aExpandAll.Checked'
      'pcRef.ActivePage')
    Left = 164
    Top = 444
  end
  inherited ActionList: TActionList
    Left = 106
    Top = 445
    object aFind: TAction [0]
      Category = 'Find'
      Caption = 'aFind'
      ImageIndex = 52
      OnExecute = aFindExecute
    end
    object aFindParams: TAction [1]
      Category = 'Find'
      Caption = 'aFindParams'
      ImageIndex = 53
      OnExecute = aFindParamsExecute
    end
    object aShowProdImage: TAction [2]
      Category = 'det'
      Caption = 'Product Image'
      OnExecute = aShowProdImageExecute
    end
    object aFindBegin: TAction [5]
      Category = 'Find'
      AutoCheck = True
      Caption = 'aFindBegin'
      Checked = True
      GroupIndex = 3
      OnExecute = aFindBeginExecute
    end
    object aSelectAll: TAction
      Category = 'det'
      Caption = 'aSelectAll'
      ShortCut = 16449
      OnExecute = aSelectAllExecute
    end
    object aDeleteColum: TAction
      Category = 'det'
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1082#1086#1083#1086#1085#1082#1091
      ImageIndex = 5
      OnExecute = aDeleteColumExecute
    end
    object aColums: TAction
      Caption = #1057#1090#1086#1083#1073#1094#1099
    end
    object aShowName: TAction
      Category = 'det'
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      OnExecute = aShowNameExecute
    end
    object aCreateColum: TAction
      Category = 'det'
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1091#1102' '#1082#1086#1083#1086#1085#1082#1091
      OnExecute = aCreateColumExecute
    end
    object aShowArt: TAction
      Category = 'det'
      Caption = #1040#1088#1090#1080#1082#1091#1083
      OnExecute = aShowArtExecute
    end
    object aShowMsr: TAction
      Category = 'det'
      Caption = #1045#1076'. '#1080#1079#1084'.'
      OnExecute = aShowMsrExecute
    end
    object aShowAmount: TAction
      Category = 'det'
      Caption = 'aShowAmount'
      OnExecute = aShowAmountExecute
    end
    object aPriceClick: TAction
      Category = 'det'
      Caption = 'aPriceClick'
      OnExecute = aPriceClickExecute
    end
    object aSetPriceDef: TAction
      Category = 'det'
      Caption = 'aSetPriceDef'
      OnExecute = aSetPriceDefExecute
    end
    object aCurrClick: TAction
      Caption = 'aCurrClick'
      OnExecute = aCurrClickExecute
    end
    object aAlignLeft: TAction
      Category = 'det'
      Caption = 'aAlignLeft'
      ImageIndex = 120
      OnExecute = aAlignLeftExecute
    end
    object aAlignRight: TAction
      Category = 'det'
      Caption = 'aAlignRight'
      ImageIndex = 122
      OnExecute = aAlignRightExecute
    end
    object aExpandAll: TAction
      AutoCheck = True
      Caption = 'aExpandAll'
      Checked = True
      ImageIndex = 25
      OnExecute = aExpandAllExecute
    end
    object aAlignCenter: TAction
      Category = 'det'
      Caption = 'aAlignCenter'
      ImageIndex = 121
      OnExecute = aAlignCenterExecute
    end
    object aColsParams: TAction
      Category = 'det'
      Caption = 'aColsParams'
      ImageIndex = 40
      OnExecute = aColsParamsExecute
    end
    object aContextFind: TAction
      Category = 'Find'
      AutoCheck = True
      Caption = 'aContextFind'
      Checked = True
      OnExecute = aContextFindExecute
    end
    object aFindConcurr: TAction
      Category = 'Find'
      AutoCheck = True
      Caption = 'aFindConcurr'
      GroupIndex = 3
      OnExecute = aFindConcurrExecute
    end
    object aFindSubstr: TAction
      Category = 'Find'
      AutoCheck = True
      Caption = 'aFindSubstr'
      GroupIndex = 3
      OnExecute = aFindSubstrExecute
    end
    object aSetColums: TAction
      Category = 'det'
      Caption = #1054#1087#1088#1077#1076#1077#1083#1080#1090#1100'...'
    end
    object aUseLogo: TAction
      AutoCheck = True
      Caption = 'aUseLogo'
      ImageIndex = 118
      OnExecute = aUseLogoExecute
    end
    object aMatInfo: TAction
      Caption = 'aMatInfo'
      ImageIndex = 99
      OnExecute = aMatInfoExecute
    end
    object aPrint: TAction
      Caption = 'aPrint'
      ImageIndex = 9
      OnExecute = aPrintExecute
    end
    object aGetWMat: TAction
      Caption = 'aGetWMat'
      ImageIndex = 50
      OnExecute = aGetWMatExecute
    end
    object aExport: TAction
      Caption = 'aExport'
      ImageIndex = 54
      OnExecute = aExportExecute
    end
    object aRefMat: TAction
      AutoCheck = True
      Caption = 'aRefMat'
      ImageIndex = 14
      OnExecute = aRefMatExecute
    end
    object aRefServ: TAction
      AutoCheck = True
      Caption = 'aRefServ'
      ImageIndex = 15
      OnExecute = aRefServExecute
    end
    object aRefSet: TAction
      AutoCheck = True
      Caption = 'aRefSet'
      ImageIndex = 124
      OnExecute = aRefSetExecute
    end
    object aAddMat: TAction
      Category = 'det'
      Caption = 'aAddMat'
      ImageIndex = 0
      ShortCut = 45
      OnExecute = aAddMatExecute
    end
    object aAddGrp: TAction
      Category = 'det'
      Caption = 'aAddGrp'
      ShortCut = 16429
      OnExecute = aAddGrp1Execute
    end
    object aDel: TAction
      Category = 'det'
      Caption = 'aDel'
      ImageIndex = 2
      ShortCut = 16430
      OnExecute = aDelExecute
    end
    object aPropMat: TAction
      Category = 'det'
      Caption = 'aPropMat'
      ImageIndex = 1
      ShortCut = 16397
      OnExecute = aPropMatExecute
    end
    object aSetKurs: TAction
      Category = 'det'
      Caption = 'aSetKurs'
      OnExecute = aSetKursExecute
    end
    object aSetAmount: TAction
      Category = 'det'
      Caption = 'aSetAmount'
      OnExecute = aSetAmountExecute
    end
    object aSetPriceDefAll: TAction
      Category = 'det'
      Caption = 'aSetPriceDefAll'
      OnExecute = aSetPriceDefAllExecute
    end
    object aSvcInfo: TAction
      Caption = 'aSvcInfo'
      ImageIndex = 160
      OnExecute = aSvcInfoExecute
    end
    object aIns: TAction
      Caption = 'aIns'
      ImageIndex = 0
      OnExecute = aInsExecute
    end
    object aAddSvc: TAction
      Category = 'det'
      Caption = 'aAddSvc'
      ImageIndex = 15
      OnExecute = aAddSvcExecute
    end
    object aAddSvcGrp: TAction
      Category = 'det'
      Caption = 'aAddSvcGrp'
      OnExecute = aAddSvcGrpExecute
    end
  end
  object cdsMatRef: TssClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ISGROUP'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PID'
        DataType = ftInteger
      end
      item
        Name = 'NAME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 128
      end
      item
        Name = 'ART'
        DataType = ftString
        Size = 128
      end
      item
        Name = 'MSRNAME'
        Attributes = [faRequired]
        DataType = ftString
        Size = 6
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'p_PLMatRef'
    RemoteServer = dmData.SConnection
    StoreDefs = True
    Macros = <>
    Left = 587
    Top = 147
  end
  object dsMatRef: TDataSource
    DataSet = cdsMatRef
    Left = 639
    Top = 147
  end
  object dsListDet: TDataSource
    DataSet = mdListDet
    Left = 298
    Top = 232
  end
  object pmListDet: TTBPopupMenu
    Images = dmData.Images18x18
    OnPopup = pmListDetPopup
    Left = 152
    Top = 200
    object TBSubmenuItem1: TTBSubmenuItem
      Action = aIns
      object TBItem2: TTBItem
        Action = aAddMat
        ImageIndex = 14
        Images = dmData.Images
      end
      object TBItem7: TTBItem
        Action = aAddGrp
      end
      object TBSeparatorItem11: TTBSeparatorItem
      end
      object TBItem17: TTBItem
        Action = aAddSvc
        Images = dmData.Images
      end
      object TBItem18: TTBItem
        Action = aAddSvcGrp
      end
    end
    object TBItem3: TTBItem
      Action = aDel
    end
    object TBItem5: TTBItem
      Action = aPropMat
    end
    object TBSeparatorItem1: TTBSeparatorItem
    end
    object TBItem4: TTBItem
      Action = aSelectAll
    end
    object TBSeparatorItem8: TTBSeparatorItem
    end
    object tbCreateNewColum: TTBItem
      Action = aCreateColum
      Caption = #1057#1086#1079#1076'. '#1085' '#1082#1086#1083
    end
    object TBItem9: TTBItem
      Action = aDeleteColum
      ImageIndex = 2
    end
    object tbColName: TTBEditItem
      Caption = #1053#1072#1079#1074
      EditCaption = #1053#1072#1079#1074
      EditWidth = 100
      Text = #1074#1072#1074#1099#1072
      OnAcceptText = mpItemNameAcceptText
    end
    object TBSeparatorItem4: TTBSeparatorItem
    end
    object tbAlLeft: TTBItem
      Action = aAlignLeft
      Images = dmData.Images
    end
    object tbAlCenter: TTBItem
      Action = aAlignCenter
      Images = dmData.Images
    end
    object tbAlRight: TTBItem
      Action = aAlignRight
      Images = dmData.Images
    end
    object TBSeparatorItem9: TTBSeparatorItem
    end
    object TBItem14: TTBItem
      Action = aSetPriceDef
    end
    object TBItem6: TTBItem
      Action = aSetPriceDefAll
    end
    object TBItem8: TTBItem
      Action = aSetAmount
    end
    object TBSeparatorItem10: TTBSeparatorItem
    end
    object TBSubCols: TTBSubmenuItem
      Caption = 'Cols'
      object tbShowName: TTBItem
        Action = aShowName
      end
      object tbShowArt: TTBItem
        Action = aShowArt
      end
      object tbShowMsr: TTBItem
        Action = aShowMsr
      end
      object tbShowAmount: TTBItem
        Action = aShowAmount
      end
      object tbShowProdImage: TTBItem
        Action = aShowProdImage
      end
      object TBSeparatorItem2: TTBSeparatorItem
      end
      object tbSetCols: TTBItem
        Action = aColsParams
        Images = dmData.Images
      end
    end
    object TBSeparatorItem5: TTBSeparatorItem
    end
  end
  object mdCols: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 258
    Top = 168
    object mdColsColName: TStringField
      FieldName = 'ColName'
    end
    object mdColsCurrId: TStringField
      FieldName = 'CurrId'
    end
  end
  object DataSource1: TDataSource
    DataSet = mdCols
    Left = 322
    Top = 168
  end
  object cdsCurr: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pCurrency_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 584
    Top = 282
    object cdsCurrCURRID: TIntegerField
      FieldName = 'CURRID'
      ReadOnly = True
    end
    object cdsCurrNAME: TStringField
      FieldName = 'NAME'
      ReadOnly = True
      Size = 24
    end
    object cdsCurrSHORTNAME: TStringField
      FieldName = 'SHORTNAME'
      ReadOnly = True
      Size = 3
    end
    object cdsCurrDEF: TIntegerField
      FieldName = 'DEF'
      ReadOnly = True
    end
    object cdsCurrDELETED: TIntegerField
      FieldName = 'DELETED'
      ReadOnly = True
    end
    object cdsCurrREPSHORTNAME: TStringField
      FieldName = 'REPSHORTNAME'
      ReadOnly = True
      Size = 10
    end
    object cdsCurrREPFRACNAME: TStringField
      FieldName = 'REPFRACNAME'
      ReadOnly = True
      Size = 10
    end
    object cdsCurrCURTYPE: TIntegerField
      FieldName = 'CURTYPE'
      ReadOnly = True
    end
  end
  object dsCurr: TDataSource
    DataSet = cdsCurr
    Left = 629
    Top = 282
  end
  object pmFind: TTBPopupMenu
    Left = 452
    Top = 156
    object mnuPosName: TTBItem
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      Checked = True
      GroupIndex = 11
      OnClick = mnuPosNameClick
    end
    object mnuPosArtikul: TTBItem
      Tag = 1
      Caption = #1040#1088#1090#1080#1082#1091#1083
      GroupIndex = 11
      OnClick = mnuPosArtikulClick
    end
    object TBSeparatorItem6: TTBSeparatorItem
    end
    object TBItem10: TTBItem
      Action = aFindBegin
      GroupIndex = 4
    end
    object TBItem11: TTBItem
      Action = aFindSubstr
      GroupIndex = 4
    end
    object TBItem12: TTBItem
      Action = aFindConcurr
      GroupIndex = 4
    end
    object TBSeparatorItem7: TTBSeparatorItem
    end
    object TBItem13: TTBItem
      Action = aContextFind
    end
  end
  object mdListDet: TssMemoryData
    FieldDefs = <>
    Left = 250
    Top = 232
  end
  object frUserDataset1: TfrUserDataset
    RangeEnd = reCount
    Left = 235
    Top = 312
  end
  object frUserDataset2: TfrUserDataset
    RangeEnd = reCount
    Left = 311
    Top = 312
  end
  object frDBDataSet1: TfrDBDataSet
    DataSource = dsListDet
    Left = 384
    Top = 312
  end
  object frReport1: TfrReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnGetValue = frReport1GetValue
    OnBeforePrint = frReport1BeforePrint
    OnPrintColumn = frReport1PrintColumn
    Left = 172
    Top = 309
    ReportForm = {
      19000000E2070000190000000001000100FFFFFFFFFF09000000340800009A0B
      00000000000000000000000000002800000000FFFF00000000FFFF0000000000
      000000000500506167653100030400466F726D000F000080DC00000078000000
      7C0100002C010000000000000200D5000000050042616E643100020100000000
      F4000000F60200000F0000003100050001000000000000000000FFFFFF1F0000
      00000C0066724442446174615365743100000000000000FFFF00000000000200
      0000010000000000000001000000C8000000140000000100000000000002003A
      010000050042616E643300020100000000B7000000F602000028000000300004
      0001000000000000000000FFFFFF1F00000000000000000000000000FFFF0000
      00000002000000010000000000000001000000C8000000140000000100000000
      00000200A60100000C005265706F72745469746C653100020100000000240000
      00F60200008E0000003000000001000000000000000000FFFFFF1F0000000000
      0000000000000000FFFF000000000002000000010000000000000001000000C8
      00000014000000010000000000000200140200000E005265706F727453756D6D
      61727931000201000000001C010000F60200003C000000300001000100000000
      0000000000FFFFFF1F00000000000000000000000000FFFF0000000000020000
      00010000000000000001000000C8000000140000000100000000000002007F02
      00000B0050616765466F6F746572310002010000000068010000F60200000E00
      00003000030001000000000000000000FFFFFF1F000000000000000000000000
      00FFFF000000000002000000010000000000000001000000C800000014000000
      0100000000000002000E030000050042616E643200020117000000000000000A
      0000002F0400003000130001000000000000000000FFFFFF1F000000002A0042
      616E64313D66725573657244617461736574313B42616E64333D667255736572
      44617461736574323B00000000000000FFFF0000000000020000000100000000
      00000001000000C8000000140000000100000000000000009303000005004D65
      6D6F4300020017000000F40000000A0000000F00000007000F00010000000000
      00000000FFFFFF1F2C02000000000001000700205B43656C6C5D00000000FFFF
      00000000000200000001000000000500417269616C0008000000000000000000
      0A000000CC00020000000000FFFFFF0000000002000000000000000000190400
      0005004D656D6F4800020017000000B70000000A0000002800000006000F0001
      000000000000000000FFFFFF1F2C020000000000010008005B4865616465725D
      00000000FFFF00000000000200000001000000000500417269616C0008000000
      0200000000000A000000CC00020000000000FFFFFF0000000002000000000000
      000100700400000700456E744C6F676F00020017000000300000007800000078
      0000000500000001000000000000000000FFFFFF1F2C02000000000000000000
      0000FFFF00000000000200000001000000000000700400000000F70400000500
      4D656D6F310002009100000024000000EB010000370000000700000001000000
      000000000000FFFFFF1F2C020000000000010009005B656E746E616D655D0000
      0000FFFF00000000000200000001000000000500417269616C000A0000000200
      0000000012000000CC00020000000000FFFFFF00000000020000000000000000
      007F05000005004D656D6F33000200980000008A0000004C0200002800000003
      00000001000000000000000000FFFFFF1F2C02000000000001000A005B726570
      7469746C655D00000000FFFF0000000000020000000100000002050041726961
      6C000B0000000200000000000A000000CC00020000000000FFFFFF0000000002
      0000000000000000000406000005004D656D6F32000200120000001C010000D2
      0200003C0000000700000001000000000000000000FFFFFF1F2C020000000000
      010007005B6E6F7465735D00000000FFFF000000000002000000010000000705
      00417269616C00090000000100000000000A000000CC00020000000000FFFFFF
      00000000020000000000000000009706000005004D656D6F3500020098000000
      5C0000004C0200002D0000000300000001000000000000000000FFFFFF1F2C02
      0000000000020008005B656E746164725D0D0A005B656E7470686F6E655D0000
      0000FFFF00000000000200000001000000020500417269616C000A0000000000
      000000000A000000CC00020000000000FFFFFF00000000020000000000000000
      001D07000005004D656D6F3600020085020000240000005F0000000F0000000F
      00000001000000000000000000FFFFFF1F2C020000000000010008005B6F6E64
      6174655D00000000FFFF00000000000200000001000000020500417269616C00
      0800000000000000000009000000CC00020000000000FFFFFF00000000020000
      00000000000000A807000006004D656D6F323200020074020000680100007000
      00000E0000000F00000001000000000000000000FFFFFF1F2C02000000000001
      000C00CBE8F1F2205B50414745235D00000000FFFF0000000000020000000100
      0000020500417269616C000800000000000000000009000000CC000200000000
      00FFFFFF000000000200000000000000FEFEFF000000000000000000000000FD
      FF0100000000FC01000000000000000000000000000000005800716E89006FA1
      E24031D3CF2178AEE340}
  end
  object xlsExport: TssXLSExport
    XLSExportFile = xlsExpFile
    Left = 297
    Top = 448
  end
  object xlsExpFile: TXLSExportFile
    Left = 357
    Top = 448
  end
  object pmRef: TTBPopupMenu
    Left = 508
    Top = 196
    object TBItem1: TTBItem
      Action = aSelectAll
    end
  end
  object cdsSrvRef: TssClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'p_PLSvcRef'
    RemoteServer = dmData.SConnection
    StoreDefs = True
    Macros = <>
    Left = 587
    Top = 199
  end
  object dsSrvRef: TDataSource
    DataSet = cdsSrvRef
    Left = 639
    Top = 199
  end
  object pmMatSvc: TTBPopupMenu
    Images = dmData.Images
    Left = 56
    Top = 196
    object TBItem19: TTBItem
      Action = aAddMat
      ImageIndex = 14
    end
    object TBItem20: TTBItem
      Action = aAddGrp
    end
    object TBSeparatorItem3: TTBSeparatorItem
    end
    object TBItem15: TTBItem
      Action = aAddSvc
    end
    object TBItem16: TTBItem
      Action = aAddSvcGrp
    end
  end
  object frCrossObject1: TfrCrossObject
    Left = 248
    Top = 360
  end
end
