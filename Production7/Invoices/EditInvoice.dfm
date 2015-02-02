inherited frmEditInvoice: TfrmEditInvoice
  Left = 340
  Top = 193
  Width = 875
  Height = 618
  ActiveControl = edEnt
  Caption = 'frmEditInvoice'
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnConstrainedResize = FormConstrainedResize
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 867
    Height = 511
    TabOrder = 1
    inherited panData: TPanel
      Width = 867
      Height = 511
      inherited panPos: TPanel
        Top = 241
        Width = 867
        Height = 270
        inherited gbPos: TssGroupBox
          Left = 4
          Top = 1
          Width = 860
          Height = 261
          HideCaption = True
          DesignSize = (
            860
            261)
          inherited lTotalCurr: TLabel
            Top = 235
          end
          inherited lSummCurr: TssBevel
            Top = 232
            Height = 22
          end
          inherited lTotal: TLabel
            Left = 237
            Top = 235
          end
          inherited lTotNDSOut: TLabel
            Left = 351
            Top = 235
          end
          inherited lSummDefNoNDS: TssBevel
            Left = 404
            Top = 232
            Height = 22
          end
          inherited lTotNDS: TLabel
            Left = 538
            Top = 235
          end
          inherited lSummDefNDS: TssBevel
            Left = 567
            Top = 232
            Height = 22
          end
          inherited lTot: TLabel
            Left = 691
            Top = 235
          end
          inherited lSummDef: TssBevel
            Left = 734
            Top = 232
            Height = 22
          end
          inherited dbgWaybillDet: TssDBGrid
            Left = 7
            Top = 40
            Width = 846
            Height = 187
            Hint = #1042' '#1090#1086#1084' '#1095#1080#1089#1083#1077' '#1072#1082#1094#1080#1079
            HeaderMinRowCount = 4
            PopupMenu = pmMain
            OnDblClick = dbgWaybillDetDblClick
            OnKeyPress = dbgWaybillDetKeyPress
            Filter.Criteria = {00000000}
            OnCustomDrawCell = dbgWaybillDetCustomDrawCell
            OnCustomDrawColumnHeader = dbgWaybillDetCustomDrawColumnHeader
            OnGetOptionsTitle = dbgWaybillDetGetOptionsTitle
            inherited colPosType: TdxDBGridImageColumn
              Caption = ''
            end
            inherited colStatus: TdxDBGridImageColumn
              Visible = False
            end
            inherited colPosId: TdxDBGridColumn
              Width = 42
            end
            inherited colRecNo: TdxDBGridColumn
              Visible = False
            end
            inherited colMatName: TdxDBGridColumn
              Caption = 
                #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072' ('#1086#1087#1080#1089#1072#1085#1080#1077' '#1074#1099#1087#1086#1083#1085#1077#1085#1085#1099#1093' '#1088#1072#1073#1086#1090', '#1086#1082#1072#1079#1072#1085#1085#1099#1093' '#1091#1089#1083#1091#1075 +
                ')'
              Width = 131
            end
            inherited colArtikul: TdxDBGridColumn
              Width = 62
            end
            inherited colBarCode: TdxDBGridColumn
              Width = 53
            end
            inherited colNorm: TdxDBGridColumn
              Tag = 0
              Width = 41
            end
            inherited colWHouseName: TdxDBGridColumn
              Width = 109
            end
            inherited colMeasureName: TdxDBGridColumn [9]
              Caption = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077'- '#1088#1077#1085#1080#1103
              Width = 49
            end
            inherited colAmount: TdxDBGridColumn [10]
              Caption = #1050#1086#1083#1080'- '#1095#1077#1089#1090#1074#1086
              Width = 38
              OnGetText = colAmountGetText
            end
            inherited colPrice: TdxDBGridColumn
              Caption = #1062#1077#1085#1072' ('#1090#1072#1088#1080#1092' '#1079#1072' '#1077#1076#1080#1085#1080#1094#1091' '#1080#1079#1084#1077#1088#1077#1085#1080#1103')'
              Visible = False
              Width = 74
              FieldName = 'pricewithnds'
            end
            inherited colPriceWONDS: TdxDBGridColumn
              Caption = #1062#1077#1085#1072' ('#1090#1072#1088#1080#1092' '#1079#1072' '#1077#1076#1080#1085#1080#1094#1091' '#1080#1079#1084#1077#1088#1077#1085#1080#1103')'
              Visible = True
              Width = 72
              FieldName = 'pricewonds'
            end
            inherited colPriceInCurr: TdxDBGridColumn
              Width = 42
            end
            inherited colSummWONDS: TdxDBGridColumn [14]
              Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1090#1086#1074#1072#1088#1086#1074' ('#1088#1072#1073#1086#1090', '#1091#1089#1083#1091#1075') '#1074#1089#1077#1075#1086' '#1073#1077#1079' '#1085#1072#1083#1086#1075#1072
              Visible = True
              Width = 86
              FieldName = 'sumwonds'
            end
            object colExsize: TdxDBGridColumn [15]
              Caption = #1042' '#1090#1086#1084' '#1095#1080#1089#1083#1077' '#1072#1082#1094#1080#1079
              HeaderAlignment = taCenter
              Width = 35
              BandIndex = 0
              RowIndex = 0
            end
            inherited colNDSRate: TdxDBGridColumn [16]
              Caption = #1053#1072#1083#1086'- '#1075#1086#1074#1072#1103' '#1089#1090#1072#1074#1082#1072
              Visible = True
              Width = 46
            end
            inherited colNDS: TdxDBGridColumn [17]
              Caption = #1057#1091#1084#1084#1072' '#1085#1072#1083#1086#1075#1072
              Visible = True
              Width = 44
              FieldName = 'sumnds'
            end
            inherited colSummDef: TdxDBGridColumn
              Caption = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1090#1086#1074#1072#1088#1086#1074' ('#1088#1072#1073#1086#1090', '#1091#1089#1083#1091#1075') '#1074#1089#1077#1075#1086' '#1089' '#1091#1095#1105#1090#1086#1084' '#1085#1072#1083#1086#1075#1072
              Width = 87
              FieldName = 'sumwithnds'
            end
            inherited colSummCurr: TdxDBGridColumn
              Visible = False
              Width = 61
              FieldName = 'sumcurr'
            end
            inherited colMatId: TdxDBGridColumn
              Width = 42
            end
            inherited colWId: TdxDBGridColumn
              Width = 42
            end
            inherited colPType: TdxDBGridColumn
              Width = 42
            end
            inherited colOnValue: TdxDBGridColumn
              Width = 42
            end
            inherited colDiscount: TdxDBGridColumn
              Tag = 0
              Width = 42
            end
            inherited colSerial: TdxDBGridColumn
              Width = 54
            end
            inherited colProducer: TdxDBGridColumn
              Tag = 1
              Width = 54
            end
            object colCountry: TdxDBGridColumn [27]
              Caption = #1057#1090#1088#1072#1085#1072' '#1087#1088#1086#1080#1089#1093#1086#1078#1076#1077#1085#1080#1103
              HeaderAlignment = taCenter
              Width = 54
              BandIndex = 0
              RowIndex = 0
              FieldName = 'country'
            end
            inherited colGTD: TdxDBGridColumn
              Tag = 1
              Caption = #1053#1086#1084#1077#1088' '#1075#1088#1091#1079#1086#1074#1086#1081' '#1090#1072#1084#1086#1078#1077#1085#1085#1086#1081' '#1076#1077#1082#1083#1072#1088#1072#1094#1080#1080
              Visible = True
              Width = 89
            end
            inherited colCertNum: TdxDBGridColumn
              Tag = 1
              Width = 54
            end
            inherited colCertDate: TdxDBGridColumn
              Tag = 1
              Width = 45
            end
            inherited colNotes: TdxDBGridColumn
              Width = 54
            end
          end
          object panPosBar: TPanel
            Left = 2
            Top = 7
            Width = 851
            Height = 32
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            ParentBackground = False
            ParentColor = True
            TabOrder = 1
            DesignSize = (
              851
              32)
            object btnProps: TssSpeedButton
              Left = 130
              Top = 0
              Width = 119
              Height = 27
              Action = aCUpd
              Alignment = taLeftJustify
              AllwaysShowFrame = True
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              GroupIndex = 0
              ImageIndex = 4
              Images = dmData.Images18x18
              LeftMargin = 8
              ParentShowHint = False
              ShowHint = True
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object btnDel: TssSpeedButton
              Left = 247
              Top = 0
              Width = 119
              Height = 27
              Action = aCDel
              Alignment = taLeftJustify
              AllwaysShowFrame = True
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              GroupIndex = 0
              ImageIndex = 5
              Images = dmData.Images18x18
              LeftMargin = 8
              ParentShowHint = False
              ShowHint = True
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object btnAdd: TssSpeedButton
              Left = 5
              Top = 0
              Width = 127
              Height = 27
              Action = aCIns
              Alignment = taLeftJustify
              AllwaysShowFrame = True
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              DroppedDown = True
              GroupIndex = 0
              ImageIndex = 3
              Images = dmData.Images18x18
              LeftMargin = 8
              ParentShowHint = False
              PopupMenu = pmMatSvc
              ShowHint = True
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object edFind: TokGridSearchEdit
              Left = 603
              Top = 0
              Width = 248
              Height = 31
              Anchors = [akTop, akRight]
              ButtonsLeftMargin = 3
              CapFind = 'Search'
              CapFindParams = 'Search options'
              CapContextFind = 'Context search'
              CapFindBegin = 'From the beginning'
              CapFindConcurr = 'Full match'
              CapFindSubstr = 'Partial match'
              EditorOffset = 0
              DisabledImages = dmData.Images18x18dis
              Images = dmData.Images18x18
              ImageIndexFind = 18
              ImageIndexFindParams = 19
              LangManager = dmData.Lng
              ShowCaptions = False
              ShowButtons = sbtNoRef
              SearchNames.Strings = (
                'Name;matname'
                'Model;artikul')
              SearchType = stBegin
              Skin = dmData.sknMain
              StyleController = dmData.scMain
              TabOrder = 0
              Grid = dbgWaybillDet
              DesignSize = (
                248
                31)
            end
          end
        end
      end
      inherited panHeader: TPanel
        Width = 867
        Height = 241
        DesignSize = (
          867
          241)
        inherited gbHeader: TssGroupBox
          Left = 4
          Top = 2
          Width = 533
          Height = 236
          DesignSize = (
            533
            236)
          inherited lRate: TLabel
            Top = 193
          end
          inherited lCurr: TLabel
            Top = 193
          end
          inherited lOndate: TLabel
            Left = 223
            Top = 16
          end
          inherited btnSetTime: TssSpeedButton
            Left = 497
            Top = 12
          end
          object lNum: TLabel [4]
            Left = 9
            Top = 16
            Width = 80
            Height = 16
            Caption = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            Transparent = True
          end
          object lEntAddr: TLabel [5]
            Left = 266
            Top = 58
            Width = 40
            Height = 16
            Anchors = [akTop, akRight]
            Caption = #1040#1076#1088#1077#1089':'
          end
          object btnEntAddr: TssSpeedButton [6]
            Left = 497
            Top = 55
            Width = 22
            Height = 22
            Action = aNextAddr
            Alignment = taLeftJustify
            AllwaysShowFrame = True
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = -1
            Images = dmData.Images
            LeftMargin = 5
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsCaptionOnly
            OnMouseDown = btnEntAddrMouseDown
          end
          object ssBevel12: TssBevel [7]
            Left = 1
            Top = 47
            Width = 524
            Height = 1
            Anchors = [akLeft, akTop, akRight]
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
          object lShipEntAddr: TLabel [8]
            Left = 266
            Top = 86
            Width = 40
            Height = 16
            Anchors = [akTop, akRight]
            Caption = #1040#1076#1088#1077#1089':'
          end
          object btnShipEntAddr: TssSpeedButton [9]
            Left = 497
            Top = 83
            Width = 22
            Height = 22
            Action = aNextAddr
            Alignment = taLeftJustify
            AllwaysShowFrame = True
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = -1
            Images = dmData.Images
            LeftMargin = 5
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsCaptionOnly
            OnMouseDown = btnEntAddrMouseDown
          end
          object lShipKAAddr: TLabel [10]
            Left = 266
            Top = 168
            Width = 40
            Height = 16
            Anchors = [akTop, akRight]
            Caption = #1040#1076#1088#1077#1089':'
          end
          object btnShipKAAddr: TssSpeedButton [11]
            Left = 497
            Top = 165
            Width = 22
            Height = 22
            Action = aNextAddr
            Alignment = taLeftJustify
            AllwaysShowFrame = True
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = -1
            Images = dmData.Images
            LeftMargin = 5
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsCaptionOnly
            OnMouseDown = btnEntAddrMouseDown
          end
          object lKAAddr: TLabel [12]
            Left = 266
            Top = 194
            Width = 40
            Height = 16
            Anchors = [akTop, akRight]
            Caption = #1040#1076#1088#1077#1089':'
          end
          object btnKAAddr: TssSpeedButton [13]
            Left = 497
            Top = 192
            Width = 22
            Height = 22
            Action = aNextAddr
            Alignment = taLeftJustify
            AllwaysShowFrame = True
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = -1
            Images = dmData.Images
            LeftMargin = 5
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsCaptionOnly
            OnMouseDown = btnEntAddrMouseDown
          end
          object lEmployee: TLabel [14]
            Left = 9
            Top = 114
            Width = 104
            Height = 16
            Caption = #1054#1090#1087#1091#1089#1082' '#1087#1088#1086#1080#1079#1074#1105#1083':'
            Transparent = True
          end
          object lEmployeeTitle: TLabel [15]
            Left = 10
            Top = 135
            Width = 71
            Height = 16
            Anchors = [akTop, akRight]
            Caption = #1044#1086#1083#1078#1085#1086#1089#1090#1100':'
            Transparent = True
          end
          inherited edRate: TssCalcEdit
            Left = 10
            Top = 212
            TabOrder = 12
          end
          inherited cbCurr: TssDBLookupCombo
            Top = 188
            TabOrder = 11
          end
          inherited edDate: TcxDateEdit
            Left = 267
            Top = 11
            TabOrder = 1
          end
          inherited edTime: TcxTimeEdit
            Left = 385
            Top = 11
            TabOrder = 2
          end
          object edNum1: TcxTextEdit
            Left = 113
            Top = 11
            Width = 91
            Height = 26
            Anchors = [akLeft, akRight, akBottom]
            AutoSize = False
            ParentFont = False
            Properties.MaxLength = 15
            Properties.OnChange = edNum1PropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 0
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edEnt: TokKASearchEdit
            Left = 9
            Top = 51
            Width = 253
            Height = 31
            Anchors = [akLeft, akTop, akRight]
            ButtonsLeftMargin = 3
            CapFind = 'Search'
            CapFindParams = 'Search options'
            CapRef = 'Our Companies Directory'
            CapContextFind = 'Context search'
            CapFindBegin = 'From the beginning'
            CapFindConcurr = 'Full match'
            CapFindSubstr = 'Partial match'
            EditorOffset = 74
            DisabledImages = dmData.Images18x18dis
            Images = dmData.Images18x18
            ImageIndexRef = 28
            ImageIndexFind = 18
            ImageIndexFindParams = 19
            LangManager = dmData.Lng
            RemoteServer = dmData.SConnection
            ShowLng = False
            ShowButtons = sbtOnlyRef
            SearchNames.Strings = (
              'Short name;name')
            SearchType = stBegin
            StyleController = dmData.scMain
            TabOrder = 3
            OnChange = edEntChange
            LoadPersons = True
            SearchMode = smOwnFirms
            DesignSize = (
              253
              31)
          end
          object edEntAddr: TcxTextEdit
            Left = 315
            Top = 54
            Width = 174
            Height = 25
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            ParentShowHint = False
            Properties.MaxLength = 15
            Properties.ReadOnly = True
            Properties.OnChange = edEntAddrPropertiesChange
            ShowHint = True
            Style.StyleController = dmData.scMain
            TabOrder = 4
            ImeName = 'Russian'
            OnEnter = edEntAddrEnter
            OnExit = edEntAddrExit
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edShipEnt: TokKASearchEdit
            Left = 9
            Top = 79
            Width = 253
            Height = 30
            Anchors = [akLeft, akTop, akRight]
            ButtonsLeftMargin = 3
            CapFind = 'Search'
            CapFindParams = 'Search options'
            CapRef = 'Business Partners Directory'
            CapContextFind = 'Context search'
            CapFindBegin = 'From the beginning'
            CapFindConcurr = 'Full match'
            CapFindSubstr = 'Partial match'
            EditorOffset = 74
            DisabledImages = dmData.Images18x18dis
            Images = dmData.Images18x18
            ImageIndexRef = 28
            ImageIndexFind = 18
            ImageIndexFindParams = 19
            LangManager = dmData.Lng
            RemoteServer = dmData.SConnection
            ShowLng = False
            ShowButtons = sbtOnlyRef
            SearchNames.Strings = (
              'Short name;name')
            SearchType = stBegin
            StyleController = dmData.scMain
            TabOrder = 5
            OnChange = edShipEntChange
            OnKeyDown = edShipEntKeyDown
            SearchMode = smAll
            DesignSize = (
              253
              30)
          end
          object edShipEntAddr: TcxTextEdit
            Left = 315
            Top = 81
            Width = 174
            Height = 26
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            ParentShowHint = False
            Properties.MaxLength = 15
            Properties.ReadOnly = True
            Properties.OnChange = edEntAddrPropertiesChange
            ShowHint = True
            Style.StyleController = dmData.scMain
            TabOrder = 6
            ImeName = 'Russian'
            OnEnter = edShipEntAddrEnter
            OnExit = edShipEntAddrExit
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edShipKA: TokKASearchEdit
            Left = 9
            Top = 161
            Width = 253
            Height = 30
            Anchors = [akLeft, akTop, akRight]
            ButtonsLeftMargin = 3
            CapFind = 'Search'
            CapFindParams = 'Search options'
            CapRef = 'Business Partners Directory'
            CapContextFind = 'Context search'
            CapFindBegin = 'From the beginning'
            CapFindConcurr = 'Full match'
            CapFindSubstr = 'Partial match'
            EditorOffset = 74
            DisabledImages = dmData.Images18x18dis
            Images = dmData.Images18x18
            ImageIndexRef = 28
            ImageIndexFind = 18
            ImageIndexFindParams = 19
            LangManager = dmData.Lng
            RemoteServer = dmData.SConnection
            ShowLng = False
            ShowButtons = sbtOnlyRef
            SearchNames.Strings = (
              'Short name;name')
            SearchType = stBegin
            StyleController = dmData.scMain
            TabOrder = 7
            OnChange = edShipKAChange
            SearchMode = smAll
            DesignSize = (
              253
              30)
          end
          object edShipKAAddr: TcxTextEdit
            Left = 315
            Top = 163
            Width = 174
            Height = 26
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            ParentShowHint = False
            Properties.MaxLength = 15
            Properties.ReadOnly = True
            Properties.OnChange = edEntAddrPropertiesChange
            ShowHint = True
            Style.StyleController = dmData.scMain
            TabOrder = 8
            ImeName = 'Russian'
            OnEnter = edShipKAAddrEnter
            OnExit = edShipKAAddrExit
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edKAgent: TokKASearchEdit
            Left = 9
            Top = 187
            Width = 253
            Height = 31
            Anchors = [akLeft, akTop, akRight]
            ButtonsLeftMargin = 3
            CapFind = 'Search'
            CapFindParams = 'Search options'
            CapRef = 'Business Partners Directory'
            CapContextFind = 'Context search'
            CapFindBegin = 'From the beginning'
            CapFindConcurr = 'Full match'
            CapFindSubstr = 'Partial match'
            EditorOffset = 74
            DisabledImages = dmData.Images18x18dis
            Images = dmData.Images18x18
            ImageIndexRef = 28
            ImageIndexFind = 18
            ImageIndexFindParams = 19
            LangManager = dmData.Lng
            RemoteServer = dmData.SConnection
            ShowLng = False
            ShowButtons = sbtOnlyRef
            SearchNames.Strings = (
              'Short name;name')
            SearchType = stBegin
            StyleController = dmData.scMain
            TabOrder = 9
            OnChange = edKAgentChange
            OnKeyDown = edKAgentKeyDown
            SearchMode = smAll
            DesignSize = (
              253
              31)
          end
          object edKAAddr: TcxTextEdit
            Left = 315
            Top = 190
            Width = 174
            Height = 25
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            ParentShowHint = False
            Properties.MaxLength = 15
            Properties.ReadOnly = True
            Properties.OnChange = edEntAddrPropertiesChange
            ShowHint = True
            Style.StyleController = dmData.scMain
            TabOrder = 10
            ImeName = 'Russian'
            OnEnter = edKAAddrEnter
            OnExit = edKAAddrExit
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object lShipper: TcxTextEdit
            Left = 138
            Top = 135
            Width = 199
            Height = 24
            Anchors = [akTop, akRight]
            Properties.ReadOnly = True
            TabOrder = 13
            ImeName = 'Russian'
          end
          object lcbShipper: TssDBLookupCombo
            Left = 138
            Top = 109
            Width = 199
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownListStyle = lsEditFixedList
            Properties.OnChange = PayDocModified
            Properties.OnEditValueChanged = lcbPayMPersonPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 14
            OnKeyPress = GoNext
            EmptyValue = 0
            KeyField = 'kaid'
            ListField = 'Name'
            ListSource = srcShippers
          end
        end
        inherited gbPayment: TssGroupBox
          Left = 537
          Top = 2
          Width = 328
          Height = 236
          Caption = ''
          Edges = [beRight, beTop, beBottom]
          DesignSize = (
            328
            236)
          inherited lPayType: TssLabel
            Left = 7
            Top = 71
          end
          inherited lPaySumm: TssLabel
            Left = 7
            Top = 170
          end
          inherited lPayCurr: TssLabel
            Left = 8
            Top = 199
          end
          inherited lPayMPerson: TssLabel
            Left = 7
          end
          inherited btnPayMPerson: TssSpeedButton
            Left = 288
            Top = 129
            Action = aAddKA
          end
          inherited btnFinPay: TssSpeedButton
            Left = 288
            Action = aAddKA
            ImageIndex = 18
          end
          inherited chbPay: TcxCheckBox
            Left = 2
            Width = 97
            Properties.OnChange = chbPayPropertiesChange
            Properties.Caption = #1055#1083#1072#1090#1105#1078
            Style.StyleController = dmData.scMain
          end
          inherited edPaySumm: TssCalcEdit
            Left = 92
            Top = 163
            Width = 189
          end
          inherited cbPayCurr: TssDBLookupCombo
            Left = 91
            Top = 194
            Width = 106
          end
          inherited lcbPayMPerson: TssDBLookupCombo
            Left = 91
            Width = 196
            Anchors = [akTop, akRight]
          end
          inherited lcbPayType: TssDBLookupCombo
            Left = 91
            Top = 66
            Width = 196
            Anchors = [akTop, akRight]
          end
          inherited pcPayType: TssPageControl
            Left = 5
            Top = 95
            Width = 319
            Height = 33
            ActivePage = tsCashless
            inherited tsCash: TcxTabSheet
              inherited btnCashDesks: TssSpeedButton
                Left = 289
                Action = aAddKA
              end
              inherited lcbCashDesks: TssDBLookupCombo
                Left = 92
                Width = 196
              end
            end
            inherited tsCashless: TcxTabSheet
              inherited lcbAccount: TssDBLookupCombo
                Left = 92
                Width = 226
                Height = 24
                Anchors = [akTop, akRight]
                ParentFont = False
              end
            end
          end
          inherited edPayNum: TokPayDocSearchEdit
            Left = 1
            Width = 315
            Anchors = [akTop, akRight]
          end
          object cbSelectPay: TcxComboBox
            Left = 91
            Top = 7
            Width = 225
            Height = 24
            Anchors = [akTop, akRight]
            Enabled = False
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.OnEditValueChanged = cbSelectPayPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 7
            OnKeyPress = GoNext
          end
        end
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 867
    TabOrder = 0
    object lEntEx: TxLabelEx [0]
      Left = 52
      Top = 5
      Width = 21
      Height = 16
      AutoSize = True
      Captions.Strings = (
        '888')
      HotTrackColor = clInfoBk
      ShowHint = True
      OnItemClick = lEntExItemClick
    end
    object lTitle: TLabel [1]
      Left = 5
      Top = 5
      Width = 25
      Height = 16
      Caption = 'Test'
      Transparent = True
      OnMouseDown = panTitleBarMouseDown
    end
    inherited panTitleButtons: TssPanel
      Left = 806
    end
  end
  inherited panButtons: TPanel
    Top = 558
    Width = 867
    Height = 30
    TabOrder = 2
    DesignSize = (
      867
      30)
    inherited btnOK: TxButton
      Left = 559
      Top = 2
      OnKeyDown = GoNextKeyDown
    end
    inherited btnCancel: TxButton
      Left = 663
      Top = 2
    end
    inherited btnApply: TxButton
      Left = 766
      Top = 2
      OnKeyDown = GoNextKeyDown
    end
  end
  inherited panToolBar: TPanel
    Width = 867
    inherited btnLock: TssSpeedButton
      Left = 841
      DroppedDownArrowRange = 25
      LeftMargin = 4
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 813
      DroppedDownArrowRange = 25
      LeftMargin = 4
    end
    inherited btnHelp: TssSpeedButton
      Left = 785
      DroppedDownArrowRange = 25
      LeftMargin = 4
    end
    inherited btnBallance: TssSpeedButton
      Left = 28
      DroppedDownArrowRange = 25
      LeftMargin = 4
    end
    inherited btnPrint: TssSpeedButton
      Left = 4
      DroppedDownArrowRange = 25
      LeftMargin = 4
    end
    inherited btnMatInfo: TssSpeedButton
      Left = 51
      DroppedDownArrowRange = 25
      LeftMargin = 4
    end
    inherited btnSvcInfo: TssSpeedButton
      Left = 97
      DroppedDownArrowRange = 25
      LeftMargin = 4
    end
    inherited btnFinance: TssSpeedButton
      Left = 74
      Width = 25
      DroppedDownArrowRange = 25
      LeftMargin = 4
    end
  end
  inherited ilTitleBar: TImageList
    Left = 256
    Top = 8
  end
  inherited FormStorage: TssFormStorage
    Options = []
    Left = 48
    Top = 351
  end
  inherited ActionList: TActionList
    Top = 379
    object aCIns: TAction [5]
      Category = 'det'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 3
      ShortCut = 45
      OnExecute = aCInsExecute
    end
    object aCUpd: TAction [6]
      Tag = 1
      Category = 'det'
      Caption = #1057#1074#1086#1081#1089#1090#1074#1072
      ImageIndex = 4
      ShortCut = 16397
      OnExecute = aCUpdExecute
    end
    object aCDel: TAction [7]
      Category = 'det'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      ShortCut = 16430
      OnExecute = aCDelExecute
    end
    object aAddKA: TAction [8]
      Category = 'addon'
      ImageIndex = 18
      ShortCut = 16429
      OnExecute = aAddKAExecute
    end
    object aPersons: TAction [10]
      Category = 'addon'
      Caption = 'aPersons'
      ImageIndex = 67
      ShortCut = 16429
    end
    object aSetKurs: TAction [11]
      Category = 'addon'
    end
    object aSelectAll: TAction [12]
      Caption = 'aSelectAll'
      ShortCut = 16449
      OnExecute = aSelectAllExecute
    end
    object aPayMPersons: TAction [13]
      Category = 'addon'
      Caption = 'aPayMPersons'
      Enabled = False
      ShortCut = 16429
    end
    inherited aFinance: TAction
      Visible = True
    end
    object aNextAddr: TAction
      Caption = #1070
      ShortCut = 24615
      OnExecute = aNextAddrExecute
    end
    object aAddMat: TAction
      Caption = #1058#1086#1074#1072#1088
      ImageIndex = 14
      ShortCut = 45
      OnExecute = aAddMatExecute
    end
    object aAddSvc: TAction
      Caption = #1059#1089#1083#1091#1075#1091
      ImageIndex = 15
      ShortCut = 8237
      OnExecute = aAddSvcExecute
    end
    object aChangeEnt: TAction
      Caption = 'aChangeEnt'
      ShortCut = 16423
      OnExecute = aChangeEntExecute
    end
    object aActivateFind: TAction
      Caption = 'aActivateFind'
      ShortCut = 16454
      OnExecute = aActivateFindExecute
    end
  end
  inherited dsDet: TDataSource
    OnDataChange = dsDetDataChange
    Left = 544
    Top = 7
  end
  inherited mdDet: TdxMemData
    Left = 516
    Top = 7
    object mdDetcountry: TStringField
      FieldName = 'country'
      Size = 128
    end
    object mdDettaxsum: TFloatField
      FieldName = 'taxsum'
    end
  end
  object cdsPersonName: TssClientDataSet [9]
    Aggregates = <>
    Params = <>
    ProviderName = 'p_Persons_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 523
    Top = 432
  end
  object srcPersonName: TDataSource [10]
    DataSet = cdsPersonName
    Left = 552
    Top = 432
  end
  object pmMain: TTBPopupMenu [11]
    Images = dmData.Images
    Skin = dmData.sknMain
    Left = 267
    Top = 377
    object TBItem1: TTBItem
      Action = aCIns
      Images = dmData.Images
    end
    object TBItem2: TTBItem
      Action = aCDel
    end
    object TBSeparatorItem1: TTBSeparatorItem
    end
    object TBItem9: TTBItem
      Action = aSelectAll
    end
    object TBSeparatorItem7: TTBSeparatorItem
    end
    object TBItem14: TTBItem
      Action = aMatInfo
    end
    object TBItem5: TTBItem
      Action = aShowRealPrice
    end
    object TBSeparatorItem2: TTBSeparatorItem
    end
    object TBItem15: TTBItem
      Action = aShowGridOptions
      Visible = False
    end
    object TBItem4: TTBItem
      Action = aCUpd
    end
  end
  object cdsFind: TssClientDataSet [12]
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
    Left = 222
    Top = 378
  end
  object frDoc: TfrReport [13]
    Dataset = fsrcDoc
    InitialZoom = pzDefault
    ModifyPrepared = False
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frDocGetValue
    Left = 296
    Top = 406
    ReportForm = {19000000}
  end
  object fsrcDoc: TfrDBDataSet [14]
    DataSet = mdReport
    Left = 325
    Top = 406
  end
  object mdReport: TdxMemData [15]
    Indexes = <>
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
    SortOptions = []
    Left = 267
    Top = 406
  end
  inherited srcCashDesks: TDataSource
    Left = 524
    Top = 403
  end
  inherited cdsCashDesks: TssClientDataSet
    Left = 552
    Top = 403
  end
  inherited srcEntAcc: TDataSource
    Left = 524
    Top = 374
  end
  inherited cdsPayType: TssClientDataSet
    Left = 420
    Top = 375
  end
  inherited srcPayType: TDataSource
    Left = 449
    Top = 375
  end
  inherited cdsPayMPersons: TssClientDataSet
    Left = 420
    Top = 404
  end
  inherited srcPayMPersons: TDataSource
    DataSet = cdsShippers
    Left = 449
    Top = 404
  end
  inherited cdsEntAcc: TssClientDataSet
    Left = 552
    Top = 374
  end
  inherited cdsCurr: TssClientDataSet
    Left = 420
    Top = 433
  end
  inherited dsCurr: TDataSource
    Left = 449
    Top = 433
  end
  object pmMatSvc: TTBPopupMenu
    Images = dmData.Images
    Skin = dmData.sknMain
    Left = 116
    Top = 356
    object TBItem19: TTBItem
      Action = aAddMat
    end
    object TBItem20: TTBItem
      Action = aAddSvc
    end
  end
  object mdTaxes: TdxMemData
    Indexes = <>
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
    SortOptions = []
    Left = 306
    Top = 440
    object mdTaxestaxid: TIntegerField
      FieldName = 'taxid'
    end
    object mdTaxesname: TStringField
      FieldName = 'name'
      Size = 64
    end
    object mdTaxesonvalue: TFloatField
      FieldName = 'onvalue'
    end
    object mdTaxestaxsumm: TFloatField
      FieldName = 'taxsum'
    end
  end
  object FsrcTaxes: TfrDBDataSet
    DataSet = mdTaxes
    Left = 278
    Top = 440
  end
  object srcEnt: TDataSource
    DataSet = dmData.cdsEnt
    OnDataChange = srcEntDataChange
    Left = 169
    Top = 356
  end
  object cdsShippers: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'p_Persons_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 423
    Top = 12
  end
  object srcShippers: TDataSource
    DataSet = cdsShippers
    OnDataChange = srcShippersDataChange
    Left = 452
    Top = 12
  end
end
