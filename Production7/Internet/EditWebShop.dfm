inherited frmEditWebShop: TfrmEditWebShop
  Left = 494
  Top = 312
  Width = 797
  Height = 603
  Caption = 'frmEditWebShop'
  Constraints.MinHeight = 500
  Constraints.MinWidth = 740
  OnCloseQuery = FormCloseQuery
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 781
    Height = 484
    object cxSplitter1: TcxSplitter
      Left = 178
      Top = 0
      Width = 8
      Height = 484
      Cursor = crHSplit
      HotZoneClassName = 'TcxMediaPlayer9Style'
      HotZone.SizePercent = 50
      HotZone.LightColor = clWhite
      Control = tvMain
      OnMoved = cxSplitter1Moved
    end
    object pcMain: TcxPageControl
      Left = 186
      Top = 0
      Width = 595
      Height = 484
      ActivePage = tsGroups
      Align = alClient
      Images = dmData.Images
      LookAndFeel.Kind = lfUltraFlat
      TabOrder = 1
      object tsMain: TcxTabSheet
        Caption = 'Main'
        ImageIndex = 210
        TabVisible = False
        object gbXML: TssGroupBox
          Left = 0
          Top = 262
          Width = 603
          Height = 230
          Align = alClient
          Alignment = alTopLeft
          Caption = ' XML Interface '
          TabOrder = 0
          TabStop = False
          Edges = [beLeft, beRight, beTop, beBottom]
          DesignSize = (
            595
            222)
          object lXMLSecKey: TssLabel
            Left = 14
            Top = 122
            Width = 125
            Height = 16
            AutoSize = False
            Caption = 'Security Key'
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lXMLLogin: TssLabel
            Left = 14
            Top = 58
            Width = 120
            Height = 16
            AutoSize = False
            Caption = 'Login'
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lXMLURL: TssLabel
            Left = 14
            Top = 28
            Width = 125
            Height = 16
            AutoSize = False
            Caption = 'URL'
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lXMLPassword: TssLabel
            Left = 15
            Top = 89
            Width = 124
            Height = 16
            AutoSize = False
            Caption = 'Password'
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object edXMLLogin: TcxTextEdit
            Left = 143
            Top = 54
            Width = 273
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            BeepOnEnter = False
            Properties.HideSelection = False
            Properties.MaxLength = 64
            Style.StyleController = dmData.scMain
            TabOrder = 2
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
          end
          object edXMLURL: TcxTextEdit
            Left = 143
            Top = 23
            Width = 273
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            BeepOnEnter = False
            Enabled = False
            Properties.HideSelection = False
            Properties.MaxLength = 255
            Style.StyleController = dmData.scMain
            TabOrder = 0
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
          end
          object cbXMLUseDefURL: TcxCheckBox
            Left = 434
            Top = 25
            Width = 149
            Height = 24
            Anchors = [akTop, akRight]
            Properties.DisplayUnchecked = 'False'
            Properties.OnChange = cbXMLUseDefURLPropertiesChange
            Properties.Caption = 'Use default'
            State = cbsChecked
            TabOrder = 1
            ImeName = 'Russian'
          end
          object edXMLPassword: TcxTextEdit
            Left = 143
            Top = 85
            Width = 273
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            BeepOnEnter = False
            Properties.EchoMode = eemPassword
            Properties.HideSelection = False
            Properties.MaxLength = 64
            Style.StyleController = dmData.scMain
            TabOrder = 3
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
          end
          object edXMLSecKey: TcxTextEdit
            Left = 143
            Top = 116
            Width = 273
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            BeepOnEnter = False
            Properties.EchoMode = eemPassword
            Properties.HideSelection = False
            Properties.MaxLength = 64
            Style.StyleController = dmData.scMain
            TabOrder = 4
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
          end
        end
        object gbMainInfo: TssGroupBox
          Left = 0
          Top = 0
          Width = 595
          Height = 262
          Align = alTop
          Alignment = alTopLeft
          Caption = ' General infomation '
          TabOrder = 1
          TabStop = False
          Edges = [beLeft, beRight, beTop, beBottom]
          DesignSize = (
            595
            262)
          object lDescription: TssLabel
            Left = 15
            Top = 128
            Width = 124
            Height = 16
            AutoSize = False
            Caption = 'Description'
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lSiteName: TssLabel
            Left = 14
            Top = 32
            Width = 125
            Height = 16
            AutoSize = False
            Caption = 'Name'
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lDocPrefix: TssLabel
            Left = 14
            Top = 62
            Width = 125
            Height = 16
            AutoSize = False
            Caption = 'Doc Prefix'
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lDocSuffix: TssLabel
            Left = 14
            Top = 91
            Width = 125
            Height = 16
            AutoSize = False
            Caption = 'Doc Suffix'
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object edSiteName: TcxTextEdit
            Left = 143
            Top = 28
            Width = 432
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            Properties.MaxLength = 128
            Style.StyleController = dmData.scMain
            TabOrder = 0
            ImeName = 'Russian'
            OnKeyPress = GoNext
          end
          object edDescription: TcxMemo
            Left = 143
            Top = 128
            Width = 433
            Height = 124
            Anchors = [akLeft, akTop, akRight]
            ImeName = 'Russian'
            Properties.MaxLength = 1023
            Properties.ScrollBars = ssVertical
            TabOrder = 3
          end
          object edDocPrefix: TcxTextEdit
            Left = 143
            Top = 58
            Width = 432
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            Properties.MaxLength = 128
            Style.StyleController = dmData.scMain
            TabOrder = 1
            ImeName = 'Russian'
            OnKeyPress = GoNext
          end
          object edDocSuffix: TcxTextEdit
            Left = 143
            Top = 87
            Width = 432
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            Properties.MaxLength = 128
            Style.StyleController = dmData.scMain
            TabOrder = 2
            ImeName = 'Russian'
            OnKeyPress = GoNext
          end
        end
      end
      object tsLanguages: TcxTabSheet
        Caption = ' Languages '
        ImageIndex = 4
        TabVisible = False
        object gbLanguages: TssGroupBox
          Left = 0
          Top = 0
          Width = 595
          Height = 484
          Align = alClient
          Alignment = alTopLeft
          Caption = ' Available in languages '
          TabOrder = 0
          TabStop = False
          Edges = [beLeft, beRight, beTop, beBottom]
          DesignSize = (
            595
            484)
          object clbLanguages: TcxCheckListBox
            Left = 15
            Top = 25
            Width = 331
            Height = 456
            EditValue = 0
            OnClickCheck = clbLanguagesClickCheck
            Anchors = [akLeft, akTop, akRight, akBottom]
            Columns = 0
            ImeName = 'Russian'
            Items = <>
            ScrollWidth = 0
            TabOrder = 0
            TabWidth = 0
          end
          object lLangListInfo: TcxLabel
            Left = 359
            Top = 25
            Width = 235
            Height = 80
            Anchors = [akTop, akRight]
            AutoSize = False
            Properties.WordWrap = True
            TabOrder = 1
            ImeName = 'Russian'
            Caption = 
              'This is a list of languages that will be shown on the product ed' +
              'iting form'
          end
        end
      end
      object tsTransfer: TcxTabSheet
        Caption = 'tsTransfer'
        ImageIndex = 20
        TabVisible = False
        object gbTransfer: TssGroupBox
          Left = 0
          Top = 0
          Width = 595
          Height = 484
          Align = alClient
          Alignment = alTopLeft
          Caption = 'gbTransfer'
          TabOrder = 0
          Edges = [beLeft, beRight, beTop, beBottom]
          DesignSize = (
            595
            484)
          object butTransfer: TssSpeedButton
            Left = 404
            Top = 158
            Width = 112
            Height = 30
            Active = True
            Alignment = taCenter
            AllwaysShowFrame = True
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            Caption = 'Transfer!'
            Color = clWhite
            DroppedDown = True
            GroupIndex = 0
            ImageIndex = 20
            Images = dmData.Images
            LeftMargin = 4
            PopupMenu = pmTransfer
            Style = ssbsFlat
            ViewStyle = ssvsCaptionGlyph
            OnClick = butTransferClick
          end
          object tvTransferList: TcxTreeView
            Left = 15
            Top = 21
            Width = 282
            Height = 167
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Style.StyleController = dmData.scMain
            TabOrder = 0
            OnDblClick = tvTransferListDblClick
            Images = dmData.Images
            Indent = 20
            MultiSelectStyle = [msControlSelect]
            ReadOnly = True
          end
          object gbTransferProcess: TssGroupBox
            Left = 304
            Top = 18
            Width = 289
            Height = 135
            Alignment = alTopLeft
            Anchors = [akTop, akRight]
            Caption = ' Process '
            TabOrder = 1
            Edges = [beLeft, beRight, beTop, beBottom]
            DesignSize = (
              289
              135)
            object Animate1: TAnimate
              Left = 10
              Top = 17
              Width = 272
              Height = 60
              Anchors = [akTop, akRight]
              CommonAVI = aviCopyFiles
              StopFrame = 31
            end
            object pbTotal: TcxProgressBar
              Left = 11
              Top = 89
              Width = 270
              Height = 25
              Anchors = [akTop, akRight]
              AutoSize = False
              Properties.BeginColor = clSkyBlue
              Properties.EndColor = clMoneyGreen
              Properties.BarStyle = cxbsGradient
              Properties.ShowOverload = True
              Properties.OverloadBeginColor = clMoneyGreen
              Properties.OverloadEndColor = clLime
              Properties.PeakValue = 100
              Style.Shadow = False
              TabOrder = 1
              ImeName = 'Russian'
            end
            object pbCurrent: TcxProgressBar
              Left = 11
              Top = 111
              Width = 270
              Height = 15
              Anchors = [akTop, akRight]
              AutoSize = False
              Properties.BeginColor = clGray
              Properties.EndColor = clLime
              Properties.ShowText = False
              Properties.BarStyle = cxbsGradient
              Properties.OverloadValue = 100
              Properties.ShowOverload = True
              Properties.OverloadBeginColor = clBlue
              Properties.OverloadEndColor = clGreen
              Properties.PeakValue = 100
              Style.Shadow = False
              TabOrder = 2
              ImeName = 'Russian'
            end
          end
          object lTransferLog: TcxLabel
            Left = 15
            Top = 192
            Width = 549
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Properties.Alignment.Horz = taCenter
            TabOrder = 2
            ImeName = 'Russian'
          end
          object memoTransferLog: TMemo
            Left = 15
            Top = 222
            Width = 576
            Height = 251
            Anchors = [akLeft, akTop, akRight]
            BevelInner = bvLowered
            BevelKind = bkFlat
            BevelOuter = bvRaised
            BorderStyle = bsNone
            ImeName = 'Russian'
            ScrollBars = ssBoth
            TabOrder = 3
            WordWrap = False
          end
        end
      end
      object tsGroups: TcxTabSheet
        Caption = ' Groups '
        ImageIndex = 1
        TabVisible = False
        object gbGroups: TcxGroupBox
          Left = 0
          Top = 0
          Width = 595
          Height = 484
          HelpType = htKeyword
          HelpKeyword = 'WWW Groups'
          Align = alClient
          Alignment = alTopLeft
          Caption = ' Groups '
          TabOrder = 0
          DesignSize = (
            595
            484)
          object tvGroups: TcxTreeView
            Left = 15
            Top = 25
            Width = 289
            Height = 440
            Anchors = [akLeft, akTop, akRight, akBottom]
            Style.StyleController = dmData.scMain
            TabOrder = 0
            OnKeyUp = tvGroupsKeyUp
            OnMouseDown = tvGroupsMouseDown
            HideSelection = False
            Indent = 20
            MultiSelectStyle = [msControlSelect]
            ReadOnly = True
            SortType = stText
            StateImages = dmData.Images18x18
          end
          object panGroupsRight: TPanel
            Left = 305
            Top = 25
            Width = 273
            Height = 449
            Anchors = [akTop, akRight, akBottom]
            BevelOuter = bvNone
            UseDockManager = False
            ParentBackground = False
            TabOrder = 1
            DesignSize = (
              273
              449)
            object lGroupsInfo: TLabel
              Left = 8
              Top = 1
              Width = 264
              Height = 69
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              Caption = 
                'This is a tree of product groups as it will be found on this web' +
                ' site. Create a new group and then edit it names for the differe' +
                'nt languages that you choosed on the "Languages" page'
              WordWrap = True
            end
            object gbGrpMETA: TcxGroupBox
              Left = 7
              Top = 177
              Width = 265
              Height = 272
              Alignment = alTopLeft
              Anchors = [akLeft, akTop, akRight, akBottom]
              Caption = ' META '
              TabOrder = 0
              DesignSize = (
                265
                272)
              object lGrpMTitle: TssLabel
                Left = 8
                Top = 25
                Width = 105
                Height = 16
                AutoSize = False
                Caption = 'Title'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                DisabledDraw = ddUser
                DisabledColor = clBtnShadow
              end
              object lGrpMKeywords: TssLabel
                Left = 9
                Top = 49
                Width = 126
                Height = 16
                Anchors = [akTop, akRight]
                AutoSize = False
                Caption = 'Keywords'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                DisabledDraw = ddUser
                DisabledColor = clBtnShadow
              end
              object lGrpMDescription: TssLabel
                Left = 11
                Top = 148
                Width = 125
                Height = 16
                Anchors = [akTop, akRight]
                AutoSize = False
                Caption = 'Description'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                DisabledDraw = ddUser
                DisabledColor = clBtnShadow
              end
              object edGrpMTitle: TcxTextEdit
                Left = 48
                Top = 20
                Width = 209
                Height = 24
                Anchors = [akLeft, akTop, akRight]
                Properties.MaxLength = 128
                Properties.OnChange = edGrpNamePropertiesChange
                Style.StyleController = dmData.scMain
                TabOrder = 0
                ImeName = 'Russian'
                OnKeyPress = GoNext
              end
              object memoGrpMDescription: TcxMemo
                Left = 8
                Top = 167
                Width = 249
                Height = 95
                Anchors = [akLeft, akTop, akRight, akBottom]
                ImeName = 'Russian'
                Properties.MaxLength = 1023
                Properties.ScrollBars = ssVertical
                Properties.OnChange = edGrpNamePropertiesChange
                TabOrder = 2
              end
              object memoGrpMKeywords: TcxMemo
                Left = 8
                Top = 73
                Width = 249
                Height = 66
                Anchors = [akLeft, akTop, akRight]
                ImeName = 'Russian'
                Properties.MaxLength = 1023
                Properties.ScrollBars = ssVertical
                Properties.OnChange = edGrpNamePropertiesChange
                TabOrder = 1
              end
            end
            object gbGrpMain: TcxGroupBox
              Left = 7
              Top = 64
              Width = 265
              Height = 110
              Alignment = alTopLeft
              Anchors = [akLeft, akTop, akRight]
              Caption = 'gbGrpMain'
              TabOrder = 1
              DesignSize = (
                265
                110)
              object lGrpName: TssLabel
                Left = 16
                Top = 25
                Width = 96
                Height = 16
                AutoSize = False
                Caption = 'Name'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                DisabledDraw = ddUser
                DisabledColor = clBtnShadow
              end
              object butWWWcopyDown: TssSpeedButton
                Left = 232
                Top = 20
                Alignment = taLeftJustify
                AllwaysShowFrame = False
                Anchors = [akTop, akRight]
                ButtonType = ssbtStandard
                Checked = False
                DisabledImages = dmData.Images18x18dis
                GroupIndex = 0
                ImageIndex = 35
                Images = dmData.Images18x18
                LeftMargin = 4
                ParentShowHint = False
                ShowHint = True
                Style = ssbsUser
                ViewStyle = ssvsGlyphOnly
                OnClick = butWWWcopyDownClick
              end
              object lGrpDescription: TssLabel
                Left = 16
                Top = 54
                Width = 94
                Height = 16
                AutoSize = False
                Caption = 'Description'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                DisabledDraw = ddUser
                DisabledColor = clBtnShadow
              end
              object lGrpPosition: TssLabel
                Left = 48
                Top = 82
                Width = 131
                Height = 16
                Anchors = [akTop, akRight]
                AutoSize = False
                Caption = 'Position'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                Visible = False
                DisabledDraw = ddUser
                DisabledColor = clBtnShadow
              end
              object edGrpName: TcxTextEdit
                Left = 105
                Top = 21
                Width = 127
                Height = 24
                Anchors = [akLeft, akTop, akRight]
                Properties.MaxLength = 128
                Properties.OnChange = edGrpNamePropertiesChange
                Style.StyleController = dmData.scMain
                TabOrder = 0
                ImeName = 'Russian'
                OnKeyPress = GoNext
              end
              object edGrpDescription: TcxTextEdit
                Left = 104
                Top = 49
                Width = 152
                Height = 24
                Anchors = [akTop, akRight]
                Properties.MaxLength = 128
                Properties.OnChange = edGrpNamePropertiesChange
                Style.StyleController = dmData.scMain
                TabOrder = 1
                ImeName = 'Russian'
                OnKeyPress = GoNext
              end
              object cbGrpCustomAlias: TcxCheckBox
                Left = 9
                Top = 78
                Width = 143
                Height = 24
                Properties.DisplayUnchecked = 'False'
                Properties.OnChange = cbGrpCustomAliasPropertiesChange
                Properties.Caption = 'Custom alias'
                TabOrder = 2
                ImeName = 'Russian'
              end
              object edGrpAlias: TcxTextEdit
                Left = 104
                Top = 78
                Width = 152
                Height = 24
                Anchors = [akLeft, akTop, akRight]
                Properties.MaxLength = 128
                Properties.OnChange = edGrpNamePropertiesChange
                Style.StyleController = dmData.scMain
                TabOrder = 3
                ImeName = 'Russian'
                OnKeyPress = GoNext
              end
            end
          end
        end
      end
    end
    object tvMain: TcxTreeView
      Left = 0
      Top = 0
      Width = 178
      Height = 484
      Align = alLeft
      Style.Shadow = False
      TabOrder = 2
      OnClick = tvMainSelectionChanged
      Images = dmData.Images
      Indent = 20
      MultiSelectStyle = [msControlSelect]
      RightClickSelect = True
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 781
    inherited panTitleButtons: TssPanel
      Left = 723
      inherited btnTBMinimize: TssSpeedButton
        Height = 14
      end
      inherited btnTBMaximize: TssSpeedButton
        Height = 14
      end
      inherited btnTBClose: TssSpeedButton
        Height = 14
      end
    end
  end
  inherited panButtons: TPanel
    Top = 531
    Width = 781
    Height = 34
    inherited btnOK: TxButton
      Left = 477
      Top = 9
      Width = 99
      Height = 24
    end
    inherited btnCancel: TxButton
      Left = 581
      Top = 9
      Width = 97
      Height = 24
    end
    inherited btnApply: TxButton
      Left = 682
      Top = 9
      Width = 99
      Height = 24
    end
  end
  inherited panToolBar: TPanel
    Width = 781
    inherited btnLock: TssSpeedButton
      Left = 738
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 762
    end
    inherited btnHelp: TssSpeedButton
      Left = 714
    end
  end
  inherited ilTitleBar: TImageList
    Left = 8
    Top = 52
  end
  inherited FormStorage: TssFormStorage
    Options = []
    Left = 40
    Top = 108
  end
  inherited ActionList: TActionList
    OnUpdate = nil
    Left = 68
    Top = 108
    object aMIns: TAction [5]
      Category = 'Measure'
      ImageIndex = 24
      ShortCut = 16429
    end
    object aPricesAdd: TAction [6]
      Category = 'Prices'
      Caption = '????????'
      ImageIndex = 0
      ShortCut = 45
    end
    object aPricesProps: TAction [7]
      Tag = 1
      Category = 'Prices'
      Caption = '????????'
      ImageIndex = 1
      ShortCut = 16397
    end
    object aPricesDel: TAction [8]
      Category = 'Prices'
      Caption = '???????'
      ImageIndex = 2
      ShortCut = 16430
    end
    object aMCNew: TAction
      Category = 'MC'
      Caption = 'aMCNew'
      ImageIndex = 0
      ShortCut = 45
    end
    object aMCProps: TAction
      Tag = 1
      Category = 'MC'
      Caption = 'aMCProps'
      ImageIndex = 1
      ShortCut = 16397
    end
    object aMCDel: TAction
      Category = 'MC'
      Caption = 'aMCDel'
      ImageIndex = 2
      ShortCut = 16430
    end
    object aMatMove: TAction
      Caption = 'aMatMove'
      ImageIndex = 61
      ShortCut = 16461
    end
    object aMatRsv: TAction
      Caption = 'aMatRsv'
      ImageIndex = 100
      ShortCut = 16466
    end
  end
  object pmTransfer: TssPopupMenu
    Images = dmData.Images
    OnChange = pmTransferChange
    Left = 73
    Top = 230
    object miTransferIO: TMenuItem
      Caption = 'miTransferIO'
      SubMenuImages = dmData.Images
      Default = True
      ImageIndex = 20
    end
    object miTransferIn: TMenuItem
      Caption = 'miTransferIn'
      SubMenuImages = dmData.Images
      ImageIndex = 55
    end
    object miTransferOut: TMenuItem
      Caption = 'miTransferOut'
      SubMenuImages = dmData.Images
      ImageIndex = 56
    end
  end
  object pmGroups: TTBPopupMenu
    Images = dmData.Images
    Skin = dmData.sknMain
    Left = 253
    Top = 118
    object miGroupsNoLangsWarn: TTBItem
      Caption = 'Please select language(s) first'
      DisplayMode = nbdmImageAndText
      ImageIndex = 129
      Visible = False
    end
    object miGroupsAdd: TTBEditItem
      Caption = 'Add'
      DisplayMode = nbdmImageAndText
      EditCaption = 'Add'
      EditWidth = 256
      MaxLength = 63
      ImageIndex = 3
      OnAcceptText = miGroupsAddAcceptText
    end
    object miGroupsDelete: TTBItem
      Caption = 'Delete'
      DisplayMode = nbdmImageAndText
      ImageIndex = 5
      OnClick = miGroupsDeleteClick
    end
  end
end
