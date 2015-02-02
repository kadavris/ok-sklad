inherited frmEditWaybillOut: TfrmEditWaybillOut
  Left = 458
  Top = 254
  Width = 855
  Height = 549
  ActiveControl = edKAgent
  Caption = 'frmEditWaybillOut'
  Constraints.MinWidth = 850
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Top = 45
    Width = 839
    Height = 441
    inherited panData: TPanel
      Width = 839
      Height = 441
      inherited panPos: TPanel
        Top = 193
        Width = 839
        Height = 248
        DesignSize = (
          839
          248)
        inherited gbPos: TssGroupBox
          Left = 4
          Top = 5
          Width = 842
          Height = 239
          HideCaption = True
          DesignSize = (
            842
            239)
          inherited lTotalCurr: TLabel
            Top = 213
          end
          inherited lSummCurr: TssBevel
            Left = 97
            Top = 211
          end
          inherited lTotal: TLabel
            Left = 233
            Top = 213
            Anchors = [akLeft, akBottom]
          end
          inherited lTotNDSOut: TLabel
            Left = 482
            Top = 213
            Anchors = [akLeft, akBottom]
          end
          inherited lSummDefNoNDS: TssBevel
            Left = 536
            Top = 211
            Anchors = [akLeft, akBottom]
          end
          inherited lTotNDS: TLabel
            Left = 663
            Top = 213
            Anchors = [akLeft, akBottom]
          end
          inherited lSummDefNDS: TssBevel
            Left = 699
            Top = 211
            Anchors = [akLeft, akBottom]
          end
          inherited lTot: TLabel
            Left = 311
            Top = 213
            Anchors = [akLeft, akBottom]
          end
          inherited lSummDef: TssBevel
            Left = 358
            Top = 211
            Anchors = [akLeft, akBottom]
          end
          object panPosBar: TPanel [9]
            Left = 2
            Top = 5
            Width = 839
            Height = 34
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            ParentBackground = False
            ParentColor = True
            TabOrder = 0
            DesignSize = (
              839
              34)
            object btnPosAdd: TssSpeedButton
              Left = 5
              Top = 2
              Width = 127
              Height = 31
              Action = aCIns
              Alignment = taLeftJustify
              AllwaysShowFrame = False
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
            object btnPosProps: TssSpeedButton
              Left = 130
              Top = 2
              Width = 119
              Height = 31
              Action = aCUpd
              Alignment = taLeftJustify
              AllwaysShowFrame = False
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
            object btnPosDel: TssSpeedButton
              Left = 247
              Top = 2
              Width = 119
              Height = 31
              Action = aCDel
              Alignment = taLeftJustify
              AllwaysShowFrame = False
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
            object edFind: TokGridSearchEdit
              Left = 580
              Top = 2
              Width = 247
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
              StyleController = dmData.scMain
              TabOrder = 0
              Grid = dbgWaybillDet
              DesignSize = (
                247
                31)
            end
          end
          inherited dbgWaybillDet: TssDBGrid
            Left = 7
            Top = 44
            Width = 825
            Height = 160
            ParentFont = True
            PopupMenu = pmMain
            TabOrder = 1
            OnDblClick = dbgWaybillDetDblClick
            OnKeyPress = dbgWaybillDetKeyPress
            Filter.Criteria = {00000000}
            OnCustomDrawCell = dbgWaybillDetCustomDrawCell
            OnGetOptionsTitle = dbgWaybillDetGetOptionsTitle
            inherited colStatus: TdxDBGridImageColumn
              MinWidth = 25
              Width = 25
              FieldName = 'status'
              OnGetText = colStatusGetText
            end
            inherited colNorm: TdxDBGridColumn
              OnGetText = colNormGetText
            end
            inherited colAmount: TdxDBGridColumn [8]
              OnGetText = colAmountGetText
            end
            inherited colWHouseName: TdxDBGridColumn [9]
            end
            inherited colPrice: TdxDBGridColumn
              FieldName = 'pricewithnds'
            end
            inherited colPriceWONDS: TdxDBGridColumn
              FieldName = 'pricewonds'
            end
            inherited colPriceInCurr: TdxDBGridColumn
              OnGetText = colPriceInCurrGetText
            end
            inherited colNDS: TdxDBGridColumn
              FieldName = 'sumnds'
            end
            inherited colSummWONDS: TdxDBGridColumn
              FieldName = 'sumwonds'
            end
            inherited colSummDef: TdxDBGridColumn
              Width = 88
              FieldName = 'sumwithnds'
            end
            inherited colSummCurr: TdxDBGridColumn
              FieldName = 'sumcurr'
            end
            inherited colProducer: TdxDBGridColumn
              Tag = 1
            end
            inherited colGTD: TdxDBGridColumn
              Tag = 1
            end
            inherited colCertNum: TdxDBGridColumn
              Tag = 1
            end
            inherited colCertDate: TdxDBGridColumn
              Tag = 1
            end
            object colWarrantyPeriod: TdxDBGridColumn [30]
              Tag = 1
              Alignment = taLeftJustify
              HeaderAlignment = taCenter
              Visible = False
              Width = 72
              BandIndex = 0
              RowIndex = 0
              FieldName = 'warrantyperiod'
              OnGetText = colWarrantyPeriodGetText
            end
            object colWarrantyPeriodType: TdxDBGridColumn [31]
              Visible = False
              Width = 98
              BandIndex = 0
              RowIndex = 0
              FieldName = 'warrantyperiodtype'
            end
            inherited colCardNum: TdxDBGridColumn
              Tag = 1
            end
            inherited colCardHolder: TdxDBGridColumn
              Tag = 1
            end
          end
        end
      end
      inherited panHeader: TPanel
        Width = 839
        Height = 193
        DesignSize = (
          839
          193)
        inherited gbHeader: TssGroupBox
          Left = 4
          Top = 7
          Width = 567
          Height = 184
          DesignSize = (
            567
            184)
          inherited lRate: TLabel
            Visible = True
          end
          inherited lCurr: TLabel
            Visible = True
          end
          inherited lOndate: TLabel
            Left = 275
          end
          inherited btnSetTime: TssSpeedButton
            Left = 531
            Top = 32
          end
          object lNum: TLabel [4]
            Left = 9
            Top = 37
            Width = 42
            Height = 16
            Caption = #1053#1086#1084#1077#1088':'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object lReason: TLabel [5]
            Left = 9
            Top = 124
            Width = 64
            Height = 16
            Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lPersonname: TLabel [6]
            Left = 311
            Top = 154
            Width = 59
            Height = 16
            Alignment = taRightJustify
            Caption = #1054#1090#1087#1091#1089#1090#1080#1083':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object btnPersonName: TssSpeedButton [7]
            Left = 539
            Top = 150
            Width = 22
            Height = 22
            Action = aPersons
            Alignment = taCenter
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = 67
            Images = dmData.Images
            LeftMargin = 2
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnMouseDown = btnPersonNameMouseDown
            OnMouseUp = btnPersonNameMouseUp
          end
          object lNotes: TLabel [8]
            Left = 289
            Top = 124
            Width = 77
            Height = 16
            Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          inherited edRate: TssCalcEdit
            Left = 212
            TabOrder = 11
            Visible = True
          end
          inherited cbCurr: TssDBLookupCombo
            Left = 84
            Width = 77
            TabOrder = 10
            Visible = True
          end
          inherited edDate: TcxDateEdit
            Left = 312
            ParentFont = True
            TabOrder = 3
            OnKeyPress = edDateKeyPress
          end
          inherited edTime: TcxTimeEdit
            Left = 426
            ParentFont = True
            Properties.OnChange = edTimePropertiesChange
            TabOrder = 4
            OnKeyPress = GoNext
          end
          object chbPosting: TcxCheckBox
            Left = 4
            Top = 4
            Width = 163
            Height = 26
            AutoSize = False
            ParentFont = False
            Properties.Alignment = taLeftJustify
            Properties.DisplayUnchecked = 'False'
            Properties.OnChange = chbPostingPropertiesChange
            Properties.Caption = #1055#1088#1086#1074#1077#1089#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090
            State = cbsChecked
            TabOrder = 0
            ImeName = 'Russian'
            OnClick = chbPostingClick
            OnKeyPress = GoNext
          end
          object edNum1: TcxTextEdit
            Left = 84
            Top = 31
            Width = 183
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Properties.MaxLength = 15
            Properties.OnChange = edNum1PropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 2
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = edNum1KeyPress
          end
          object edReason: TcxTextEdit
            Left = 84
            Top = 119
            Width = 181
            Height = 24
            Properties.MaxLength = 128
            Properties.OnChange = edReasonPropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 8
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object lcbPersonName: TssDBLookupCombo
            Left = 374
            Top = 149
            Width = 165
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ImeName = 'Russian'
            Properties.DropDownListStyle = lsEditFixedList
            Properties.OnChange = lcbPersonNamePropertiesChange
            Properties.OnEditValueChanged = lcbPersonNamePropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 12
            OnEnter = lcbPersonNameEnter
            OnExit = lcbPersonNameExit
            OnKeyPress = lcbPersonNameKeyPress
            EmptyValue = 0
            KeyField = 'kaid'
            ListField = 'Name'
            ListSource = srcPersonName
          end
          object edNotes: TcxTextEdit
            Left = 374
            Top = 119
            Width = 186
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ParentShowHint = False
            Properties.MaxLength = 255
            Properties.OnChange = DataModified
            ShowHint = True
            Style.StyleController = dmData.scMain
            TabOrder = 9
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object chbRetNDS: TcxCheckBox
            Left = 239
            Top = 4
            Width = 292
            Height = 26
            AutoSize = False
            ParentFont = False
            Properties.Alignment = taLeftJustify
            Properties.DisplayUnchecked = 'False'
            Properties.OnChange = chbPostingPropertiesChange
            Properties.Caption = #1042#1086#1079#1074#1088#1072#1097#1072#1090#1100' '#1053#1044#1057' '#1089' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            Style.StyleController = dmData.scMain
            TabOrder = 1
            ImeName = 'Russian'
            OnKeyPress = GoNext
          end
          object btnAtt: TxButton
            Left = 306
            Top = 91
            Width = 253
            Height = 23
            Anchors = [akTop, akRight]
            Caption = #1044#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1100' '#8470'11 '#1086#1090' 23.09.2005'
            ColorInner = clBtnShadow
            Gradient.Direction = gdVertical
            Gradient.Enabled = True
            OnClick = btnAttClick
            OnKeyDown = btnAttKeyDown
            OnMouseUp = btnAttMouseUp
            TabOrder = 7
          end
          object edContr: TokContractSearchEdit
            Left = 9
            Top = 87
            Width = 274
            Height = 31
            Anchors = [akLeft, akTop, akRight]
            ButtonsLeftMargin = 2
            CapRef = 'Contract Register'
            EditorOffset = 74
            DisabledImages = dmData.Images18x18dis
            Images = dmData.Images18x18
            ImageIndexRef = 45
            LangManager = dmData.Lng
            RemoteServer = dmData.SConnection
            ShowLng = False
            ShowButtons = sbtOnlyRef
            SearchNames.Strings = (
              'Contract;num')
            SearchType = stBegin
            StyleController = dmData.scMain
            TabOrder = 6
            OnChange = edContrChange
            ContractType = ctOut
            DesignSize = (
              274
              31)
          end
          object edKAgent: TokKASearchEdit
            Left = 9
            Top = 58
            Width = 550
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
            SearchNames.Strings = (
              'Short name;name')
            SearchType = stBegin
            StyleController = dmData.scMain
            TabOrder = 5
            OnChange = edKAgentChange
            OnEnter = edKAgentEnter
            OnExit = edKAgentExit
            LoadContracts = True
            SearchMode = smAll
            DesignSize = (
              550
              31)
          end
        end
        inherited gbPayment: TssGroupBox
          Left = 570
          Top = 7
          Width = 274
          Height = 184
          DesignSize = (
            274
            184)
          inherited lPayType: TssLabel
            Left = 10
            Top = 65
          end
          inherited lPaySumm: TssLabel
            Left = 10
            Top = 154
          end
          inherited lPayCurr: TssLabel
            Left = 204
            Top = 154
            Alignment = taLeftJustify
          end
          inherited lPayMPerson: TssLabel
            Left = 10
            Top = 124
          end
          inherited btnPayMPerson: TssSpeedButton
            Left = 242
            Top = 120
            Width = 22
            Height = 22
            Action = aPersons
            ImageIndex = 67
            LeftMargin = 2
          end
          inherited btnFinPay: TssSpeedButton
            Left = 242
            Top = 61
            Width = 22
            Height = 22
            Action = aPersons
            ImageIndex = 67
          end
          inherited chbPay: TcxCheckBox
            Left = 5
            Top = 2
            Width = 164
            Properties.OnChange = chbPayPropertiesChange
            Properties.Caption = #1054#1087#1083#1072#1090#1072' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
          end
          inherited edPaySumm: TssCalcEdit
            Left = 95
            Top = 149
            ParentFont = True
          end
          inherited cbPayCurr: TssDBLookupCombo
            Left = 192
            Top = 149
            Width = 74
            ParentFont = True
          end
          inherited lcbPayMPerson: TssDBLookupCombo
            Left = 95
            Top = 119
            Width = 146
            ParentFont = True
          end
          inherited lcbPayType: TssDBLookupCombo
            Left = 95
            Top = 60
            Width = 146
            ParentFont = True
          end
          inherited pcPayType: TssPageControl
            Left = 6
            Top = 87
            Width = 259
            inherited tsCash: TcxTabSheet
              inherited btnCashDesks: TssSpeedButton
                Left = 237
                Top = 3
                Width = 22
                Height = 22
                Action = aPersons
                ImageIndex = 67
              end
              inherited lcbCashDesks: TssDBLookupCombo
                Left = 98
                Width = 136
                ParentFont = True
              end
            end
            inherited tsCashless: TcxTabSheet
              inherited lcbAccount: TssDBLookupCombo
                Width = 145
                Height = 24
                Anchors = [akLeft, akTop, akRight]
                ParentFont = False
              end
            end
          end
          inherited edPayNum: TokPayDocSearchEdit
            Left = 10
            Top = 28
            Width = 256
            DesignSize = (
              256
              31)
          end
        end
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 839
    object lTitle: TLabel [0]
      Left = 7
      Top = 5
      Width = 28
      Height = 16
      Caption = 'lTitle'
      Transparent = True
      OnMouseDown = panTitleBarMouseDown
    end
    object lEntEx: TxLabelEx [1]
      Left = 54
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
    inherited panTitleButtons: TssPanel
      Left = 778
    end
  end
  inherited panButtons: TPanel
    Top = 486
    Width = 839
    Height = 25
    DesignSize = (
      839
      25)
    inherited btnOK: TxButton
      Left = 531
      Top = 0
    end
    inherited btnCancel: TxButton
      Left = 635
      Top = 0
    end
    inherited btnApply: TxButton
      Left = 739
      Top = 0
    end
  end
  inherited panToolBar: TPanel
    Width = 839
    Height = 24
    DesignSize = (
      839
      24)
    inherited btnLock: TssSpeedButton
      Left = 795
      Top = 1
      Width = 22
      Height = 22
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 816
      Top = 1
      Width = 22
      Height = 22
    end
    inherited btnHelp: TssSpeedButton
      Left = 768
      Top = 1
      Width = 22
      Height = 22
    end
    inherited btnBallance: TssSpeedButton
      Left = 31
      Top = 2
      Width = 22
      Height = 22
    end
    inherited btnPrint: TssSpeedButton
      Left = 4
      Top = 2
      Width = 22
      Height = 22
    end
    inherited btnMatInfo: TssSpeedButton
      Left = 139
      Top = 2
      Width = 22
      Height = 22
    end
    inherited btnSvcInfo: TssSpeedButton
      Left = 85
      Top = 2
      Width = 22
      Height = 22
    end
    inherited btnFinance: TssSpeedButton
      Left = 112
      Top = 2
      Width = 22
      Height = 22
    end
    object btnOrdersInfo: TssSpeedButton
      Left = 58
      Top = 2
      Width = 22
      Height = 22
      Action = aOrdersInfo
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 203
      Images = dmData.Images
      LeftMargin = 2
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
  end
  inherited ilTitleBar: TImageList
    Left = 36
    Top = 256
  end
  inherited FormStorage: TssFormStorage
    Left = 183
    Top = 4
  end
  inherited ActionList: TActionList
    Left = 468
    Top = 2
    object aCIns: TAction [0]
      Category = 'det'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 3
      ShortCut = 45
      OnExecute = aCInsExecute
    end
    object aPersons: TAction [2]
      Category = 'addon'
      Caption = 'aPersons'
      ImageIndex = 67
      ShortCut = 16429
      OnExecute = aPersonsExecute
    end
    object aCDel: TAction [3]
      Category = 'det'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      ShortCut = 16430
      OnExecute = aCDelExecute
    end
    object aCUpd: TAction [8]
      Tag = 1
      Category = 'det'
      Caption = #1057#1074#1086#1081#1089#1090#1074#1072
      ImageIndex = 4
      ShortCut = 16397
      OnExecute = aCUpdExecute
    end
    object aAddKA: TAction [9]
      Category = 'addon'
      ImageIndex = 28
      ShortCut = 16429
    end
    object aSetKurs: TAction [10]
      Category = 'addon'
    end
    object aRemoveRsv: TAction [11]
      Category = 'det'
      Caption = 'aRemoveRsv'
      ImageIndex = 113
      OnExecute = aRemoveRsvExecute
    end
    object aRemoveRsvAll: TAction [12]
      Caption = 'aRemoveRsvAll'
      ImageIndex = 113
      OnExecute = aRemoveRsvAllExecute
    end
    object aSetRsvAll: TAction [13]
      Caption = 'aSetRsvAll'
      ImageIndex = 113
      OnExecute = aSetRsvAllExecute
    end
    object aSelectAll: TAction [14]
      Caption = 'aSelectAll'
      ShortCut = 16449
      OnExecute = aSelectAllExecute
    end
    object aPayMPersons: TAction [15]
      Category = 'addon'
      Caption = 'aPayMPersons'
      Enabled = False
      ImageIndex = 32
      ShortCut = 16429
    end
    object aSetRsv: TAction [16]
      Category = 'det'
      Caption = 'aSetRsv'
      ImageIndex = 113
      OnExecute = aSetRsvExecute
    end
    inherited aSvcInfo: TAction
      Visible = True
    end
    object aAddSvc: TAction [22]
      Caption = #1059#1089#1083#1091#1075#1091
      ImageIndex = 15
      ShortCut = 8237
      OnExecute = aAddSvcExecute
    end
    object aAddMat: TAction [23]
      Caption = #1058#1086#1074#1072#1088
      ImageIndex = 14
      OnExecute = aAddMatExecute
    end
    object aShowSN: TAction [26]
      Category = 'det'
      Caption = 'aShowSN'
      OnExecute = aShowSNExecute
    end
    inherited aFinance: TAction
      Visible = True
    end
    object aChangeEnt: TAction [29]
      Caption = 'aChangeEnt'
      ShortCut = 16423
      OnExecute = aChangeEntExecute
    end
    object aAtt: TAction [30]
      Caption = 'aAtt'
      OnExecute = aAttExecute
    end
    object aAddMatList: TAction [31]
      Caption = 'aAddMatList'
      ImageIndex = 184
      OnExecute = aAddMatListExecute
    end
    object aSetDiscount: TAction [32]
      Caption = 'aSetDiscount'
      OnExecute = aSetDiscountExecute
    end
    object aOrdersInfo: TAction
      Category = 'det'
      Caption = 'aOrdersInfo'
      ImageIndex = 203
      ShortCut = 16463
      OnExecute = aOrdersInfoExecute
    end
    object aActivateFind: TAction
      Caption = 'aActivateFind'
      ShortCut = 16454
      OnExecute = aActivateFindExecute
    end
    object aAddSvcList: TAction
      Caption = 'aAddSvcList'
      ImageIndex = 209
      OnExecute = aAddSvcListExecute
    end
  end
  inherited dsDet: TDataSource
    Left = 276
    Top = 267
  end
  inherited mdDet: TdxMemData
    BeforeDelete = mdDetBeforeDelete
    OnCalcFields = mdDetCalcFields
    object mdDetbySN: TIntegerField [0]
      FieldName = 'bySN'
    end
    object mdDetRealPosID: TIntegerField [1]
      FieldName = 'realposid'
    end
    object mdDettaxsum: TFloatField [2]
      FieldName = 'taxsum'
    end
    object mdDetwarrantyperiod: TIntegerField [3]
      DisplayWidth = 10
      FieldName = 'warrantyperiod'
    end
    object mdDetwarrantyperiodtype: TIntegerField [4]
      DisplayWidth = 10
      FieldName = 'warrantyperiodtype'
    end
    object mdDetstatus: TIntegerField [5]
      FieldName = 'status'
    end
  end
  object dsPayType: TDataSource [9]
    DataSet = cdsPayType
    Left = 313
    Top = 5
  end
  object cdsPersonName: TssClientDataSet [10]
    Aggregates = <>
    Params = <>
    ProviderName = 'p_Persons_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 412
    Top = 252
  end
  object srcPersonName: TDataSource [11]
    DataSet = cdsPersonName
    Left = 445
    Top = 252
  end
  object dsmdWMatTurn: TDataSource [12]
    DataSet = mdWMatTurn
    Left = 80
    Top = 407
  end
  object mdWMatTurnOld: TdxMemData [13]
    Indexes = <>
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
    SortOptions = []
    Left = 239
    Top = 365
  end
  object dsmdWMatTurnOld: TDataSource [14]
    DataSet = mdWMatTurnOld
    Left = 339
    Top = 365
  end
  object mdTmpIds: TdxMemData [15]
    Indexes = <>
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
    SortOptions = []
    Left = 479
    Top = 298
    object mdTmpIdsfree: TIntegerField
      FieldName = 'free'
      Required = True
    end
    object mdTmpIdsSourceID: TIntegerField
      FieldName = 'SourceID'
      Required = True
    end
    object mdTmpIdsTmpId: TIntegerField
      FieldName = 'TmpId'
      Required = True
    end
    object mdTmpIdsamount: TFloatField
      FieldName = 'amount'
      Required = True
    end
    object mdTmpIdsposid: TIntegerField
      FieldName = 'posid'
      Required = True
    end
    object mdTmpIdsforall: TIntegerField
      FieldName = 'forall'
      Required = True
    end
  end
  object dsmdTmpIds: TDataSource [16]
    DataSet = mdTmpIds
    Left = 479
    Top = 270
  end
  object cdsFind: TssClientDataSet [17]
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
    Left = 120
    Top = 256
  end
  object pmMain: TTBPopupMenu [18]
    Images = dmData.Images
    Left = 704
    Top = 268
    object imnuAdd: TTBSubmenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 3
      OnClick = imnuAddClick
      object TBItem1: TTBItem
        Action = aAddMat
      end
      object TBItem24: TTBItem
        Action = aAddMatList
      end
      object TBSeparatorItem11: TTBSeparatorItem
      end
      object TBItem21: TTBItem
        Action = aAddSvc
      end
      object TBItem6: TTBItem
        Action = aAddSvcList
      end
    end
    object TBItem2: TTBItem
      Action = aCDel
    end
    object TBSeparatorItem1: TTBSeparatorItem
    end
    object TBItem9: TTBItem
      Action = aSelectAll
    end
    object TBSeparatorItem8: TTBSeparatorItem
    end
    object TBItem14: TTBItem
      Action = aSetRsv
      Images = dmData.Images
    end
    object TBItem17: TTBItem
      Action = aSetRsvAll
    end
    object TBItem15: TTBItem
      Action = aRemoveRsv
    end
    object TBItem18: TTBItem
      Action = aRemoveRsvAll
    end
    object TBSeparatorItem7: TTBSeparatorItem
    end
    object TBItem23: TTBItem
      Action = aShowSN
    end
    object TBItem25: TTBItem
      Action = aSetDiscount
    end
    object TBSeparatorItem9: TTBSeparatorItem
    end
    object TBItem16: TTBItem
      Action = aMatInfo
    end
    object TBItem22: TTBItem
      Action = aSvcInfo
    end
    object TBItem5: TTBItem
      Action = aShowRealPrice
    end
    object TBSeparatorItem2: TTBSeparatorItem
    end
    object itmColOptions: TTBItem
      Action = aShowGridOptions
    end
    object TBItem4: TTBItem
      Action = aCUpd
    end
  end
  inherited cdsCashDesks: TssClientDataSet
    Left = 560
    Top = 352
  end
  object mdPosition: TssMemoryData [21]
    FieldDefs = <
      item
        Name = 'matid'
        DataType = ftInteger
      end
      item
        Name = 'wid'
        DataType = ftInteger
      end
      item
        Name = 'posid'
        DataType = ftInteger
      end
      item
        Name = 'amount'
        DataType = ftFloat
      end
      item
        Name = 'ondate'
        DataType = ftDateTime
      end
      item
        Name = 'price'
        DataType = ftCurrency
      end
      item
        Name = 'currid'
        DataType = ftInteger
      end
      item
        Name = 'onvalue'
        DataType = ftFloat
      end
      item
        Name = 'NDS'
        DataType = ftFloat
      end
      item
        Name = 'Discount'
        DataType = ftFloat
      end>
    Left = 568
    Top = 7
    object mdPositionmatid: TIntegerField
      FieldName = 'matid'
    end
    object mdPositionwid: TIntegerField
      FieldName = 'wid'
    end
    object mdPositionposid: TIntegerField
      FieldName = 'posid'
    end
    object mdPositionamount: TFloatField
      FieldName = 'amount'
    end
    object mdPositionondate: TDateTimeField
      FieldName = 'ondate'
    end
    object mdPositionprice: TCurrencyField
      FieldName = 'price'
    end
    object mdPositioncurrid: TIntegerField
      FieldName = 'currid'
    end
    object mdPositiononvalue: TFloatField
      FieldName = 'onvalue'
    end
    object mdPositionNDS: TFloatField
      FieldName = 'NDS'
    end
    object mdPositionDiscount: TFloatField
      FieldName = 'Discount'
    end
    object mdPositioncurrname: TStringField
      FieldName = 'currname'
    end
    object mdPositionSN: TStringField
      FieldName = 'SN'
      Size = 64
    end
    object mdPositiongtd: TStringField
      FieldName = 'gtd'
      Size = 64
    end
    object mdPositioncertnum: TStringField
      FieldName = 'certnum'
      Size = 64
    end
    object mdPositioncertdate: TDateTimeField
      FieldName = 'certdate'
    end
    object mdPositionproducer: TStringField
      FieldName = 'producer'
      Size = 255
    end
    object mdPositionpostype: TIntegerField
      FieldName = 'postype'
    end
    object mdPositiondocnum: TStringField
      FieldName = 'docnum'
    end
    object mdPositiondocdate: TDateTimeField
      FieldName = 'docdate'
    end
    object mdPositionwhname: TStringField
      FieldName = 'whname'
    end
  end
  object mdRsv: TssMemoryData [22]
    FieldDefs = <
      item
        Name = 'matid'
        DataType = ftInteger
      end
      item
        Name = 'wid'
        DataType = ftInteger
      end
      item
        Name = 'posid'
        DataType = ftInteger
      end
      item
        Name = 'amount'
        DataType = ftFloat
      end
      item
        Name = 'ondate'
        DataType = ftDateTime
      end
      item
        Name = 'price'
        DataType = ftCurrency
      end
      item
        Name = 'currid'
        DataType = ftInteger
      end
      item
        Name = 'onvalue'
        DataType = ftFloat
      end
      item
        Name = 'NDS'
        DataType = ftFloat
      end
      item
        Name = 'Discount'
        DataType = ftFloat
      end>
    Left = 616
    Top = 7
    object mdRsvSN: TStringField
      FieldName = 'SN'
      Size = 64
    end
    object IntegerField1: TIntegerField
      FieldName = 'matid'
    end
    object IntegerField2: TIntegerField
      FieldName = 'wid'
    end
    object IntegerField3: TIntegerField
      FieldName = 'posid'
    end
    object FloatField1: TFloatField
      FieldName = 'amount'
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'ondate'
    end
    object IntegerField4: TIntegerField
      FieldName = 'currid'
    end
    object FloatField2: TFloatField
      FieldName = 'onvalue'
    end
    object FloatField3: TFloatField
      FieldName = 'NDS'
    end
    object FloatField4: TFloatField
      FieldName = 'Discount'
    end
    object mdRsvpricein: TFloatField
      FieldName = 'pricein'
    end
    object mdRsvcurrname: TStringField
      FieldName = 'currname'
    end
  end
  object frDBDataSet1: TfrDBDataSet [23]
    DataSet = mdReport
    Left = 682
    Top = 412
  end
  object frDoc: TfrReport [24]
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnBeginDoc = frDocBeginDoc
    OnEndDoc = frDocEndDoc
    OnGetValue = frDocGetValue
    OnUserFunction = frDocUserFunction
    Left = 654
    Top = 412
    ReportForm = {19000000}
  end
  object mdReport: TdxMemData [25]
    Indexes = <>
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
    SortOptions = [soDesc, soCaseInsensitive]
    Left = 710
    Top = 412
  end
  object mdWMatTurn: TdxMemData [26]
    Indexes = <>
    SortOptions = []
    BeforeDelete = mdWMatTurnBeforeDelete
    AfterDelete = mdWMatTurnAfterDelete
    Left = 52
    Top = 407
    object mdWMatTurnposid: TIntegerField
      FieldName = 'posid'
    end
    object mdWMatTurnmatid: TIntegerField
      FieldName = 'matid'
    end
    object mdWMatTurnwid: TIntegerField
      FieldName = 'wid'
    end
    object mdWMatTurnturntype: TIntegerField
      FieldName = 'turntype'
    end
    object mdWMatTurnsourceid: TIntegerField
      FieldName = 'sourceid'
    end
    object mdWMatTurnamount: TFloatField
      FieldName = 'amount'
    end
    object mdWMatTurnondate: TDateTimeField
      FieldName = 'ondate'
    end
    object mdWMatTurnflag: TIntegerField
      FieldName = 'flag'
    end
    object mdWMatTurnSN: TStringField
      FieldName = 'SN'
      Size = 64
    end
  end
  object pmMatSvc: TTBPopupMenu [27]
    Images = dmData.Images
    Left = 668
    Top = 268
    object TBItem19: TTBItem
      Action = aAddMat
    end
    object itmAddMatList: TTBItem
      Action = aAddMatList
    end
    object TBSeparatorItem10: TTBSeparatorItem
    end
    object TBItem20: TTBItem
      Action = aAddSvc
    end
    object TBItem3: TTBItem
      Action = aAddSvcList
    end
  end
  inherited srcEntAcc: TDataSource
    Left = 668
    Top = 316
  end
  inherited cdsPayType: TssClientDataSet
    Left = 568
    Top = 308
  end
  inherited srcPayType: TDataSource
    Left = 572
    Top = 268
  end
  inherited srcPayMPersons: TDataSource
    Left = 444
  end
  inherited cdsEntAcc: TssClientDataSet
    Left = 672
    Top = 364
  end
  inherited cdsCurr: TssClientDataSet
    Top = 340
  end
  inherited dsCurr: TDataSource
    Left = 52
    Top = 300
  end
  object mdAcc: TdxMemData
    Indexes = <>
    SortOptions = []
    AfterPost = mdDetAfterPost
    AfterDelete = mdDetAfterDelete
    Left = 272
    Top = 311
  end
  object cdsRsv_Temp: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pSysRsv_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 180
    Top = 264
  end
  object FsrcTaxes: TfrDBDataSet
    DataSet = mdTaxes
    Left = 730
    Top = 340
  end
  object mdTaxes: TdxMemData
    Indexes = <>
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
    SortOptions = []
    Left = 758
    Top = 340
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
  object srcEnt: TDataSource
    DataSet = dmData.cdsEnt
    OnDataChange = srcEntDataChange
    Left = 337
    Top = 208
  end
  object mdDC: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 416
    Top = 391
    object mdDCcardid: TIntegerField
      FieldName = 'cardid'
    end
    object mdDCtotal: TFloatField
      FieldName = 'total'
    end
    object mdDCposid: TIntegerField
      FieldName = 'posid'
    end
  end
  object mdDCT: TssMemoryData
    FieldDefs = <>
    Left = 444
    Top = 391
    object mdDCTtreshold: TFloatField
      FieldName = 'treshold'
    end
    object mdDCTonvalue: TFloatField
      FieldName = 'onvalue'
    end
    object mdDCTcardid: TIntegerField
      FieldName = 'cardid'
    end
  end
  object DataSource1: TDataSource
    DataSet = mdAcc
    Left = 340
    Top = 311
  end
end
