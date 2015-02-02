inherited frmEditBank: TfrmEditBank
  Left = 331
  Top = 206
  VertScrollBar.Range = 0
  ActiveControl = gbContact
  BorderStyle = bsDialog
  Caption = 'frmEditBank'
  ClientHeight = 507
  ClientWidth = 832
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 832
    Height = 425
    object tvMain: TcxTreeList
      Left = 5
      Top = 2
      Width = 265
      Height = 416
      Anchors = [akLeft, akTop, akBottom]
      Bands = <
        item
          Caption.Text = 'Band1'
        end>
      BufferedPaint = False
      Images = dmData.Images
      OptionsBehavior.CellHints = True
      OptionsData.Deleting = False
      OptionsSelection.CellSelect = False
      OptionsSelection.HideFocusRect = False
      OptionsView.ScrollBars = ssVertical
      OptionsView.ColumnAutoWidth = True
      OptionsView.Headers = False
      PopupMenu = pmTree
      TabOrder = 0
      OnSelectionChanged = tvMainSelectionChanged
      object colNAme: TcxTreeListColumn
        DataBinding.ValueType = 'String'
        Position.ColIndex = 0
        Position.RowIndex = 0
        Position.BandIndex = 0
        Width = 263
      end
    end
    object pcMain: TcxPageControl
      Left = 276
      Top = -4
      Width = 550
      Height = 422
      ActivePage = tsContact
      Anchors = [akLeft, akTop, akRight, akBottom]
      Images = dmData.Images
      TabOrder = 1
      object tsMain: TcxTabSheet
        Caption = 'tsMain'
        ImageIndex = 24
        TabVisible = False
        object gbMain: TssGroupBox
          Left = 0
          Top = 0
          Width = 550
          Height = 422
          Align = alClient
          Alignment = alTopLeft
          Caption = 'gbMain'
          TabOrder = 0
          Edges = [beLeft, beRight, beTop, beBottom]
          DesignSize = (
            550
            422)
          object lName: TLabel
            Left = 18
            Top = 33
            Width = 56
            Height = 16
            Caption = #1053#1072#1079#1074#1072#1085#1080#1077
          end
          object lMFO: TLabel
            Left = 18
            Top = 62
            Width = 29
            Height = 16
            Caption = #1052#1060#1054
          end
          object lAddress: TLabel
            Left = 18
            Top = 110
            Width = 35
            Height = 16
            Caption = #1040#1076#1088#1077#1089
          end
          object lWWW: TLabel
            Left = 18
            Top = 255
            Width = 45
            Height = 16
            Caption = 'Internet'
          end
          object btnWWW: TssSpeedButton
            Left = 504
            Top = 251
            Width = 20
            Height = 20
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            Caption = 'aShowTurnIn'
            GroupIndex = 0
            ImageIndex = 45
            Images = dmData.Images
            LeftMargin = 1
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
          end
          object lCorAcc: TLabel
            Left = 18
            Top = 199
            Width = 55
            Height = 16
            Caption = #1050#1086#1088'. '#1089#1095#1105#1090
          end
          object edName: TcxTextEdit
            Left = 123
            Top = 28
            Width = 408
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            Properties.MaxLength = 128
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 0
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edMFO: TcxTextEdit
            Left = 123
            Top = 58
            Width = 139
            Height = 24
            Properties.MaxLength = 10
            Style.StyleController = dmData.scMain
            TabOrder = 1
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object memAddr: TcxMemo
            Left = 123
            Top = 103
            Width = 408
            Height = 90
            Anchors = [akLeft, akTop, akRight]
            ImeName = 'Russian'
            Properties.MaxLength = 255
            Style.StyleController = dmData.scMain
            TabOrder = 2
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edWWW: TcxButtonEdit
            Left = 123
            Top = 249
            Width = 365
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            Properties.Buttons = <
              item
                Default = True
                Kind = bkGlyph
                Visible = False
              end>
            Properties.MaxLength = 64
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 4
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object chbDefault: TcxCheckBox
            Left = 122
            Top = 278
            Width = 420
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            Properties.DisplayUnchecked = 'False'
            Properties.OnEditValueChanged = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 5
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edCorAcc: TcxTextEdit
            Left = 123
            Top = 194
            Width = 408
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            Properties.MaxLength = 64
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 3
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
        end
      end
      object tsContact: TcxTabSheet
        Caption = 'tsContact'
        ImageIndex = 18
        ParentShowHint = False
        ShowHint = False
        TabVisible = False
        object gbContact: TssGroupBox
          Left = 0
          Top = 0
          Width = 550
          Height = 422
          Align = alClient
          Alignment = alTopLeft
          Caption = 'gbContact'
          TabOrder = 0
          Edges = [beLeft, beRight, beTop, beBottom]
          DesignSize = (
            550
            422)
          object panPersonButtons: TPanel
            Left = 2
            Top = 18
            Width = 546
            Height = 44
            Align = alTop
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 0
            object btnDelPerson: TssSpeedButton
              Left = 238
              Top = 10
              Width = 113
              Height = 31
              Action = aCDel
              Alignment = taCenter
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              GroupIndex = 0
              ImageIndex = 2
              Images = dmData.Images18x18
              LeftMargin = 3
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object btnPropsPerson: TssSpeedButton
              Left = 124
              Top = 10
              Width = 114
              Height = 31
              Action = aCUpd
              Alignment = taCenter
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              GroupIndex = 0
              ImageIndex = 1
              Images = dmData.Images18x18
              LeftMargin = 3
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object btnAddPerson: TssSpeedButton
              Left = 7
              Top = 10
              Width = 117
              Height = 31
              Action = aCIns
              Alignment = taCenter
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              GroupIndex = 0
              ImageIndex = 0
              Images = dmData.Images18x18
              LeftMargin = 3
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
          end
          object grdPersons: TdxDBGrid
            Left = 10
            Top = 64
            Width = 529
            Height = 347
            DrawDragFrame = False
            Bands = <
              item
              end>
            DefaultLayout = True
            HeaderPanelRowCount = 1
            KeyField = 'personid'
            SummaryGroups = <>
            SummarySeparator = ', '
            PopupMenu = pmPersons
            TabOrder = 1
            OnDblClick = grdPersonsDblClick
            OnKeyDown = grdPersonsKeyDown
            DataSource = srcContact
            Filter.Criteria = {00000000}
            LookAndFeel = lfUltraFlat
            OptionsCustomize = [edgoBandMoving, edgoBandSizing, edgoColumnSizing]
            OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks]
            OptionsView = [edgoAutoWidth, edgoBandHeaderWidth, edgoRowAutoHeight, edgoRowSelect, edgoUseBitmap]
            Anchors = [akLeft, akTop, akRight, akBottom]
            object colFIO: TdxDBGridColumn
              Alignment = taLeftJustify
              HeaderAlignment = taCenter
              Width = 229
              BandIndex = 0
              RowIndex = 0
              FieldName = 'name'
            end
            object colJob: TdxDBGridColumn
              HeaderAlignment = taCenter
              Sorted = csUp
              Width = 135
              BandIndex = 0
              RowIndex = 0
              FieldName = 'job'
            end
          end
        end
      end
      object tsPerson: TcxTabSheet
        Caption = 'tsPerson'
        ImageIndex = 1
        TabVisible = False
        object gbPerson: TssGroupBox
          Left = 0
          Top = 0
          Width = 550
          Height = 422
          Align = alClient
          Alignment = alTopLeft
          Caption = ' '
          TabOrder = 0
          Edges = [beLeft, beRight, beTop, beBottom]
          OnMouseEnter = gbPersonMouseEnter
          OnMouseLeave = gbPersonMouseLeave
          DesignSize = (
            550
            422)
          object lFIO: TLabel
            Left = 18
            Top = 89
            Width = 27
            Height = 16
            Caption = #1060#1048#1054
          end
          object lJob: TLabel
            Left = 18
            Top = 118
            Width = 66
            Height = 16
            Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100
          end
          object lPhone: TLabel
            Left = 18
            Top = 165
            Width = 53
            Height = 16
            Caption = #1058#1077#1083#1077#1092#1086#1085
          end
          object lEMail: TLabel
            Left = 18
            Top = 196
            Width = 35
            Height = 16
            Caption = 'E-Mail'
          end
          object lNotes: TLabel
            Left = 18
            Top = 244
            Width = 72
            Height = 16
            Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
          end
          object btnEMail: TssSpeedButton
            Left = 509
            Top = 193
            Width = 20
            Height = 20
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            Caption = 'aShowTurnIn'
            GroupIndex = 0
            ImageIndex = 46
            Images = dmData.Images
            LeftMargin = 3
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
          end
          object edFIO: TcxDBTextEdit
            Left = 135
            Top = 85
            Width = 403
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            DataBinding.DataField = 'name'
            DataBinding.DataSource = srcContact
            ImeName = 'Russian'
            Properties.MaxLength = 128
            Properties.OnChange = edFIOPropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 0
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edJob: TcxDBTextEdit
            Left = 135
            Top = 114
            Width = 403
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            DataBinding.DataField = 'job'
            DataBinding.DataSource = srcContact
            ImeName = 'Russian'
            Properties.MaxLength = 128
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 1
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edPhone: TcxDBTextEdit
            Left = 135
            Top = 161
            Width = 403
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            DataBinding.DataField = 'phone'
            DataBinding.DataSource = srcContact
            ImeName = 'Russian'
            Properties.MaxLength = 64
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 2
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edEMail: TcxDBTextEdit
            Left = 135
            Top = 191
            Width = 372
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            DataBinding.DataField = 'email'
            DataBinding.DataSource = srcContact
            ImeName = 'Russian'
            Properties.MaxLength = 64
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 3
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object memNotes: TcxDBMemo
            Left = 135
            Top = 239
            Width = 403
            Height = 101
            Anchors = [akLeft, akTop, akRight]
            DataBinding.DataField = 'notes'
            DataBinding.DataSource = srcContact
            ImeName = 'Russian'
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 4
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object Panel3: TPanel
            Left = 2
            Top = 18
            Width = 546
            Height = 49
            Align = alTop
            BevelOuter = bvNone
            ParentBackground = False
            TabOrder = 5
            DesignSize = (
              546
              49)
            object ssSpeedButton4: TssSpeedButton
              Left = 238
              Top = 10
              Width = 113
              Height = 31
              Action = aCDel
              Alignment = taCenter
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              GroupIndex = 0
              ImageIndex = 2
              Images = dmData.Images18x18
              LeftMargin = 3
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object ssSpeedButton5: TssSpeedButton
              Left = 124
              Top = 10
              Width = 114
              Height = 31
              Action = aCUpd
              Alignment = taCenter
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              GroupIndex = 0
              ImageIndex = 1
              Images = dmData.Images18x18
              LeftMargin = 3
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object ssSpeedButton6: TssSpeedButton
              Left = 7
              Top = 10
              Width = 117
              Height = 31
              Action = aCIns
              Alignment = taCenter
              AllwaysShowFrame = False
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              GroupIndex = 0
              ImageIndex = 0
              Images = dmData.Images18x18
              LeftMargin = 3
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object bvlPersonSep: TssBevel
              Left = 0
              Top = 48
              Width = 546
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
            object btnPersonLevelUp: TssSpeedButton
              Left = 376
              Top = 12
              Width = 20
              Height = 20
              Alignment = taLeftJustify
              AllwaysShowFrame = False
              Anchors = [akTop, akRight]
              ButtonType = ssbtStandard
              Checked = False
              Caption = 'aShowTurnIn'
              GroupIndex = 0
              ImageIndex = 21
              Images = dmData.Images
              LeftMargin = 1
              ParentShowHint = False
              ShowHint = True
              Style = ssbsUser
              ViewStyle = ssvsGlyphOnly
            end
            object btnLevelUp: TssSpeedButton
              Left = 505
              Top = 12
              Width = 20
              Height = 20
              Alignment = taLeftJustify
              AllwaysShowFrame = False
              Anchors = [akTop, akRight]
              ButtonType = ssbtStandard
              Checked = False
              Caption = 'aShowTurnIn'
              GroupIndex = 0
              ImageIndex = 21
              Images = dmData.Images
              LeftMargin = 1
              ParentShowHint = False
              ShowHint = True
              Style = ssbsUser
              ViewStyle = ssvsGlyphOnly
              OnClick = btnLevelUpClick
            end
          end
        end
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 832
    TabOrder = 3
    inherited panTitleButtons: TssPanel
      Left = 774
    end
  end
  inherited panButtons: TPanel
    Top = 472
    Width = 832
    inherited btnOK: TxButton
      Left = 520
    end
    inherited btnCancel: TxButton
      Left = 623
    end
    inherited btnApply: TxButton
      Left = 726
    end
  end
  inherited panToolBar: TPanel
    Width = 832
    TabOrder = 2
    inherited btnLock: TssSpeedButton
      Left = 780
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 800
    end
    inherited btnHelp: TssSpeedButton
      Left = 757
    end
  end
  inherited FormStorage: TssFormStorage
    Left = 12
    Top = 268
  end
  inherited ActionList: TActionList
    Images = dmData.Images18x18
    Top = 268
    object aCIns: TAction
      Category = 'Contact'
      Caption = 'aCIns'
      ImageIndex = 0
      ShortCut = 45
      OnExecute = aCInsExecute
    end
    object aCUpd: TAction
      Tag = 1
      Category = 'Contact'
      Caption = 'aCUpd'
      ImageIndex = 1
      ShortCut = 16397
      OnExecute = aCInsExecute
    end
    object aCDel: TAction
      Category = 'Contact'
      Caption = 'aCDel'
      ImageIndex = 2
      ShortCut = 16430
      OnExecute = aCDelExecute
    end
  end
  object mdContact: TssMemoryData
    FieldDefs = <>
    Left = 136
    Top = 89
    object mdContactname: TStringField
      FieldName = 'name'
      Size = 128
    end
    object mdContactjob: TStringField
      FieldName = 'job'
      Size = 64
    end
    object mdContactphone: TStringField
      FieldName = 'phone'
      Size = 64
    end
    object mdContactemail: TStringField
      FieldName = 'email'
      Size = 64
    end
    object mdContactnotes: TStringField
      FieldName = 'notes'
      Size = 255
    end
    object mdContactpersonid: TIntegerField
      FieldName = 'personid'
    end
    object mdContactfnode: TIntegerField
      FieldName = 'fnode'
    end
  end
  object srcContact: TDataSource
    DataSet = mdContact
    Left = 164
    Top = 89
  end
  object pmPersons: TTBPopupMenu
    Images = dmData.Images18x18
    Left = 68
    Top = 268
    object TBItem1: TTBItem
      Action = aCIns
      Images = dmData.Images18x18
    end
    object TBItem4: TTBItem
      Action = aCDel
    end
    object TBSeparatorItem1: TTBSeparatorItem
    end
    object TBItem5: TTBItem
      Action = aCUpd
    end
  end
  object pmTree: TTBPopupMenu
    Images = dmData.Images18x18
    Left = 60
    Top = 160
    object TBItem2: TTBItem
      Action = aCIns
      Images = dmData.Images18x18
    end
    object TBItem3: TTBItem
      Action = aCDel
    end
  end
end
