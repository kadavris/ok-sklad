inherited frmEditOrderOut: TfrmEditOrderOut
  Left = 352
  Top = 250
  Width = 866
  ActiveControl = edKAgent
  Caption = 'frmEditOrderOut'
  Constraints.MinWidth = 820
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 850
    Height = 448
    inherited panData: TPanel
      Width = 850
      Height = 448
      inherited panPos: TPanel
        Top = 186
        Width = 850
        Height = 262
        inherited gbPos: TssGroupBox
          Width = 850
          Height = 262
          Align = alClient
          HideCaption = True
          DesignSize = (
            850
            262)
          inherited lTotalCurr: TLabel
            Top = 236
          end
          inherited lSummCurr: TssBevel
            Left = 97
            Top = 234
          end
          inherited lTotal: TLabel
            Left = 221
            Top = 236
          end
          inherited lTotNDSOut: TLabel
            Left = 497
            Top = 239
          end
          inherited lSummDefNoNDS: TssBevel
            Left = 559
            Top = 236
          end
          inherited lTotNDS: TLabel
            Left = 688
            Top = 239
          end
          inherited lSummDefNDS: TssBevel
            Left = 721
            Top = 236
          end
          inherited lTot: TLabel
            Left = 300
            Top = 236
          end
          inherited lSummDef: TssBevel
            Left = 348
            Top = 235
          end
          inherited dbgWaybillDet: TssDBGrid
            Left = 8
            Top = 42
            Width = 833
            Height = 184
            PopupMenu = pmMain
            OnDblClick = dbgWaybillDetDblClick
            OnKeyPress = dbgWaybillDetKeyPress
            Filter.Criteria = {00000000}
            OnCustomDrawCell = dbgWaybillDetCustomDrawCell
            OnGetOptionsTitle = dbgWaybillDetGetOptionsTitle
            inherited colStatus: TdxDBGridImageColumn
              FieldName = 'status'
              OnGetText = colStatusGetText
            end
            inherited colPosId: TdxDBGridColumn
              Width = 67
            end
            inherited colArtikul: TdxDBGridColumn
              Width = 106
            end
            inherited colBarCode: TdxDBGridColumn
              Width = 107
            end
            inherited colNorm: TdxDBGridColumn
              Width = 63
            end
            inherited colWHouseName: TdxDBGridColumn
              Width = 108
            end
            inherited colAmount: TdxDBGridColumn
              OnGetText = colAmountGetText
            end
            inherited colPrice: TdxDBGridColumn
              FieldName = 'pricewithnds'
            end
            inherited colPriceWONDS: TdxDBGridColumn
              Width = 85
              FieldName = 'pricewonds'
            end
            inherited colPriceInCurr: TdxDBGridColumn
              Width = 67
            end
            inherited colNDSRate: TdxDBGridColumn
              Width = 63
            end
            inherited colNDS: TdxDBGridColumn
              Width = 73
              FieldName = 'sumnds'
            end
            inherited colSummWONDS: TdxDBGridColumn
              Width = 84
              FieldName = 'sumwonds'
            end
            inherited colSummDef: TdxDBGridColumn
              Width = 123
              FieldName = 'sumwithnds'
            end
            inherited colSummCurr: TdxDBGridColumn
              Width = 115
              FieldName = 'sumcurr'
            end
            inherited colMatId: TdxDBGridColumn
              Width = 67
            end
            inherited colWId: TdxDBGridColumn
              Width = 67
            end
            inherited colPType: TdxDBGridColumn
              Width = 67
            end
            inherited colOnValue: TdxDBGridColumn
              Width = 67
            end
            inherited colDiscount: TdxDBGridColumn
              Width = 67
            end
            inherited colSerial: TdxDBGridColumn
              Width = 106
            end
            inherited colProducer: TdxDBGridColumn
              Tag = 1
              Width = 106
            end
            inherited colGTD: TdxDBGridColumn
              Tag = 1
              Width = 106
            end
            inherited colCertNum: TdxDBGridColumn
              Tag = 1
              Width = 106
            end
            inherited colCertDate: TdxDBGridColumn
              Tag = 1
              Width = 84
            end
            inherited colNotes: TdxDBGridColumn
              Width = 107
            end
            inherited colCardNum: TdxDBGridColumn
              Tag = 1
              Width = 75
            end
            inherited colCardHolder: TdxDBGridColumn
              Tag = 1
              Width = 107
            end
          end
          object panPosBar: TPanel
            Left = 6
            Top = 4
            Width = 843
            Height = 34
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            ParentBackground = False
            ParentColor = True
            TabOrder = 1
            DesignSize = (
              843
              34)
            object btnProps: TssSpeedButton
              Left = 127
              Top = 2
              Width = 118
              Height = 31
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
              Left = 244
              Top = 2
              Width = 118
              Height = 31
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
            object btnPosAdd: TssSpeedButton
              Left = 1
              Top = 2
              Width = 127
              Height = 31
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
              Left = 595
              Top = 2
              Width = 239
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
                239
                31)
            end
          end
        end
      end
      inherited panHeader: TPanel
        Width = 850
        Height = 186
        DesignSize = (
          850
          186)
        inherited gbHeader: TssGroupBox
          Left = 4
          Top = 2
          Width = 605
          Height = 184
          DesignSize = (
            605
            184)
          inherited lRate: TLabel
            Left = 454
            Top = 124
            Anchors = [akTop, akRight]
            Visible = True
          end
          inherited lCurr: TLabel
            Left = 287
            Top = 124
            Anchors = [akTop, akRight]
            Visible = True
          end
          inherited lOndate: TLabel
            Left = -64
            Top = 9
          end
          inherited btnSetTime: TssSpeedButton
            Left = 305
            Top = 4
            Width = 25
            Height = 25
            LeftMargin = 4
          end
          object lNum: TLabel [4]
            Left = 9
            Top = 34
            Width = 37
            Height = 16
            Caption = #1053#1086#1084#1077#1088
          end
          object lReason: TLabel [5]
            Left = 9
            Top = 124
            Width = 64
            Height = 16
            Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
          end
          object lNotes: TLabel [6]
            Left = 7
            Top = 154
            Width = 77
            Height = 16
            Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
          end
          object lPersonname: TLabel [7]
            Left = 278
            Top = 95
            Width = 56
            Height = 16
            Anchors = [akTop, akRight]
            Caption = #1042#1099#1089#1090#1072#1074#1080#1083
          end
          object btnPersonName: TssSpeedButton [8]
            Left = 568
            Top = 91
            Action = aAddKA
            Alignment = taCenter
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = 18
            Images = dmData.Images
            LeftMargin = 4
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnMouseDown = btnPersonNameMouseDown
            OnMouseUp = btnPersonNameMouseUp
          end
          inherited edRate: TssCalcEdit
            Left = 500
            Top = 119
            Anchors = [akTop, akRight]
            TabOrder = 10
            Visible = True
          end
          inherited cbCurr: TssDBLookupCombo
            Left = 352
            Top = 119
            Width = 94
            Anchors = [akTop, akRight]
            TabOrder = 9
            Visible = True
          end
          inherited edDate: TcxDateEdit
            Left = 83
            Top = 4
            TabOrder = 1
            OnKeyPress = edDateKeyPress
          end
          inherited edTime: TcxTimeEdit
            Left = 200
            Top = 4
            Properties.OnChange = edTimePropertiesChange
            TabOrder = 2
            OnKeyPress = GoNext
          end
          object edNum1: TcxTextEdit
            Left = 84
            Top = 32
            Width = 226
            Height = 26
            Anchors = [akLeft, akTop, akRight]
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
          object chbToDate: TcxCheckBox
            Left = 337
            Top = 31
            Width = 157
            Height = 27
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment = taLeftJustify
            Properties.DisplayUnchecked = 'False'
            Properties.OnChange = chbToDatePropertiesChange
            Properties.Caption = #1076#1077#1081#1089#1090#1074#1080#1090#1077#1083#1077#1085' '#1076#1086
            Style.BorderColor = clBtnShadow
            Style.BorderStyle = ebsUltraFlat
            Style.Shadow = False
            TabOrder = 5
            ImeName = 'Russian'
            OnKeyPress = GoNext
          end
          object edToDate: TcxDateEdit
            Left = 496
            Top = 31
            Width = 101
            Height = 24
            Anchors = [akTop, akRight]
            ImeName = 'Russian'
            ParentFont = False
            Properties.SaveTime = False
            Properties.ShowTime = False
            Style.StyleController = dmData.scMain
            TabOrder = 6
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            EditValue = 0d
          end
          object edReason: TcxTextEdit
            Left = 84
            Top = 119
            Width = 181
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Properties.MaxLength = 128
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 7
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edNotes: TcxTextEdit
            Left = 85
            Top = 149
            Width = 509
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            ParentShowHint = False
            Properties.MaxLength = 255
            Properties.OnChange = DataModified
            ShowHint = True
            Style.StyleController = dmData.scMain
            TabOrder = 8
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edContr: TokContractSearchEdit
            Left = 9
            Top = 87
            Width = 256
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
            TabOrder = 4
            OnChange = edContrChange
            ContractType = ctOut
            DesignSize = (
              256
              31)
          end
          object edKAgent: TokKASearchEdit
            Left = 9
            Top = 58
            Width = 586
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
            TabOrder = 3
            OnChange = edKAgentChange
            OnEnter = edKAgentEnter
            OnExit = edKAgentExit
            LoadContracts = True
            SearchMode = smAll
            DesignSize = (
              586
              31)
          end
          object lcbPersonName: TssDBLookupCombo
            Left = 350
            Top = 90
            Width = 217
            Height = 24
            Anchors = [akTop, akRight]
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownListStyle = lsEditFixedList
            Style.StyleController = dmData.scMain
            TabOrder = 11
            OnEnter = lcbPersonNameEnter
            OnExit = lcbPersonNameExit
            OnKeyPress = lcbPersonNameKeyPress
            EmptyValue = 0
            KeyField = 'kaid'
            ListField = 'Name'
            ListSource = srcPayMPersons
          end
        end
        inherited gbPayment: TssGroupBox
          Left = 608
          Top = 2
          Width = 249
          Height = 184
          DesignSize = (
            249
            184)
          inherited lPayType: TssLabel
            Left = 11
            Top = 65
          end
          inherited lPaySumm: TssLabel
            Left = 11
            Top = 154
          end
          inherited lPayCurr: TssLabel
            Left = 192
            Top = 154
          end
          inherited lPayMPerson: TssLabel
            Left = 11
            Top = 124
          end
          inherited btnPayMPerson: TssSpeedButton
            Left = 216
            Top = 118
            Width = 22
            Height = 22
            Action = aAddKA
          end
          inherited btnFinPay: TssSpeedButton
            Left = 216
            Top = 59
            Width = 22
            Height = 22
            Action = aAddKA
            ImageIndex = 18
          end
          inherited chbPay: TcxCheckBox
            Left = 5
            Top = 4
            Width = 171
            Properties.OnChange = chbPayPropertiesChange
            Properties.Caption = #1054#1087#1083#1072#1090#1072' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
          end
          inherited edPaySumm: TssCalcEdit
            Left = 62
            Top = 149
            Width = 106
          end
          inherited cbPayCurr: TssDBLookupCombo
            Left = 168
            Top = 149
            Width = 68
          end
          inherited lcbPayMPerson: TssDBLookupCombo
            Left = 96
            Top = 119
            Width = 113
          end
          inherited lcbPayType: TssDBLookupCombo
            Left = 96
            Top = 60
            Width = 113
          end
          inherited pcPayType: TssPageControl
            Left = 6
            Top = 87
            Width = 235
            ActivePage = tsCashless
            Anchors = [akLeft, akTop, akRight]
            inherited tsCash: TcxTabSheet
              inherited btnCashDesks: TssSpeedButton
                Left = 1
                Action = aAddKA
              end
              inherited lcbCashDesks: TssDBLookupCombo
                Left = 87
                Width = 83
              end
            end
            inherited tsCashless: TcxTabSheet
              inherited lAcc: TssLabel
                Left = 6
              end
              inherited lcbAccount: TssDBLookupCombo
                Left = 91
                Width = 142
                Height = 24
                ParentFont = False
              end
            end
          end
          inherited edPayNum: TokPayDocSearchEdit
            Left = 11
            Top = 28
            Width = 230
            EditorOffset = 82
            DesignSize = (
              230
              31)
          end
        end
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 850
    DesignSize = (
      850
      21)
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
      Anchors = [akLeft, akTop, akRight]
      AutoSize = True
      Captions.Strings = (
        '888')
      HotTrackColor = clInfoBk
      ShowHint = True
      OnItemClick = lEntExItemClick
      OnGetHintText = lEntExGetHintText
    end
    inherited panTitleButtons: TssPanel
      Left = 789
    end
  end
  inherited panButtons: TPanel
    Top = 495
    Width = 850
    Height = 38
    DesignSize = (
      850
      38)
    inherited btnOK: TxButton
      Left = 543
    end
    inherited btnCancel: TxButton
      Left = 647
    end
    inherited btnApply: TxButton
      Left = 751
    end
  end
  inherited panToolBar: TPanel
    Width = 850
    DesignSize = (
      850
      26)
    inherited btnLock: TssSpeedButton
      Left = 799
      Width = 22
      Height = 22
      LeftMargin = 4
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 823
      Width = 22
      Height = 22
      LeftMargin = 4
    end
    inherited btnHelp: TssSpeedButton
      Left = 775
      Width = 22
      Height = 22
      LeftMargin = 4
    end
    inherited btnBallance: TssSpeedButton
      Left = 31
      Width = 22
      Height = 22
      LeftMargin = 4
    end
    inherited btnPrint: TssSpeedButton
      Left = 4
      Width = 22
      Height = 22
      LeftMargin = 4
    end
    inherited btnMatInfo: TssSpeedButton
      Left = 58
      Width = 22
      Height = 22
      LeftMargin = 4
    end
    inherited btnSvcInfo: TssSpeedButton
      Left = 90
      Width = 22
      Height = 22
      LeftMargin = 4
    end
    inherited btnFinance: TssSpeedButton
      Left = 149
      Width = 22
      Height = 22
      LeftMargin = 4
    end
    object btnOrdersInfo: TssSpeedButton
      Left = 122
      Top = 1
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
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
  end
  inherited ilTitleBar: TImageList
    Left = 516
    Top = 6
  end
  inherited FormStorage: TssFormStorage
    Left = 448
    Top = 6
  end
  inherited ActionList: TActionList
    Left = 484
    Top = 6
    object aRemoveRsv: TAction [1]
      Category = 'det'
      Caption = #1054#1089#1074#1086#1073#1086#1076#1080#1090#1100
      ImageIndex = 113
      OnExecute = aRemoveRsvExecute
    end
    object aSetRsv: TAction [2]
      Category = 'det'
      Caption = 'aSetRsv'
      ImageIndex = 113
      OnExecute = aSetRsvExecute
    end
    object aSelectAll: TAction [4]
      Category = 'det'
      Caption = 'aSelectAll'
      ShortCut = 16449
      OnExecute = aSelectAllExecute
    end
    object aRemoveRsvAll: TAction [6]
      Category = 'det'
      Caption = 'aRemoveRsvAll'
      ImageIndex = 113
      OnExecute = aRemoveRsvAllExecute
    end
    object aSetRsvAll: TAction [8]
      Category = 'det'
      Caption = 'aSetRsvAll'
      ImageIndex = 113
      OnExecute = aSetRsvAllExecute
    end
    inherited aSvcInfo: TAction
      Visible = True
    end
    inherited aFinance: TAction
      Visible = True
    end
    object aCIns: TAction
      Category = 'det'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 3
      ShortCut = 45
      OnExecute = aCInsExecute
    end
    object aCUpd: TAction
      Tag = 1
      Category = 'det'
      Caption = #1057#1074#1086#1081#1089#1090#1074#1072
      ImageIndex = 4
      ShortCut = 16397
      OnExecute = aCUpdExecute
    end
    object aCDel: TAction
      Category = 'det'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 5
      ShortCut = 16430
      OnExecute = aCDelExecute
    end
    object aSetTime: TAction
      Category = 'addon'
      ImageIndex = 95
      OnExecute = aSetTimeExecute
    end
    object aAddKA: TAction
      Category = 'addon'
      ImageIndex = 18
      ShortCut = 16429
      OnExecute = aAddKAExecute
    end
    object aSetKurs: TAction
      Category = 'addon'
    end
    object aAddSvc: TAction
      Category = 'det'
      Caption = 'aAddSvc'
      ImageIndex = 15
      ShortCut = 8237
      OnExecute = aAddSvcExecute
    end
    object aAddMat: TAction
      Category = 'det'
      Caption = 'aAddMat'
      ImageIndex = 14
      OnExecute = aAddMatExecute
    end
    object aShowSN: TAction
      Category = 'det'
      Caption = 'aShowSN'
      OnExecute = aShowSNExecute
    end
    object aChangeEnt: TAction
      Caption = 'aChangeEnt'
      ShortCut = 16423
      OnExecute = aChangeEntExecute
    end
    object aChangeEntAcc: TAction
      Caption = 'aChangeEntAcc'
      ShortCut = 24615
      OnExecute = aChangeEntAccExecute
    end
    object aChangeEntBW: TAction
      Tag = 1
      Caption = 'aChangeEntBW'
      ShortCut = 16421
      OnExecute = aChangeEntExecute
    end
    object aChangeEntAccBW: TAction
      Tag = 1
      Caption = 'aChangeEntAccBW'
      ShortCut = 24613
      OnExecute = aChangeEntAccExecute
    end
    object aAddMatList: TAction
      Caption = 'aAddMatList'
      ImageIndex = 184
      OnExecute = aAddMatListExecute
    end
    object aSetDiscount: TAction
      Caption = 'aSetDiscount'
      OnExecute = aSetDiscountExecute
    end
    object aOrdersInfo: TAction
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
    Left = 324
  end
  inherited mdDet: TdxMemData
    object mdDetstatus: TIntegerField [0]
      FieldName = 'status'
    end
    object mdDetbySN: TIntegerField [1]
      FieldName = 'bySN'
    end
    object mdDettaxsum: TFloatField [2]
      FieldName = 'taxsum'
    end
  end
  inherited cdsEntAcc: TssClientDataSet
    Params = <
      item
        DataType = ftUnknown
        Name = 'kaid'
        ParamType = ptUnknown
      end>
    ProviderName = 'p_EntAccounts_ListEx'
    BeforeOpen = cdsEntAccBeforeOpen
  end
  object dsPayType: TDataSource
    DataSet = cdsPayType
    Left = 53
    Top = 349
  end
  object dsmdWMatTurn: TDataSource
    Left = 96
    Top = 312
  end
  object mdWMatTurnOld: TdxMemData
    Indexes = <>
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
    SortOptions = []
    AfterPost = mdDetAfterPost
    AfterDelete = mdDetAfterDelete
    Left = 267
    Top = 301
  end
  object dsmdWMatTurnOld: TDataSource
    DataSet = mdWMatTurnOld
    Left = 591
    Top = 244
  end
  object mdTmpIds: TdxMemData
    Indexes = <>
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
    SortOptions = []
    AfterPost = mdDetAfterPost
    AfterDelete = mdDetAfterDelete
    Left = 532
    Top = 250
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
  object dsmdTmpIds: TDataSource
    DataSet = mdTmpIds
    Left = 560
    Top = 250
  end
  object mdWMatTurn: TdxMemData
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
  object pmMain: TTBPopupMenu
    Images = dmData.Images
    Left = 232
    Top = 288
    object imnuAdd: TTBSubmenuItem
      object TBItem1: TTBItem
        Action = aAddMat
        Images = dmData.Images
      end
      object TBItem26: TTBItem
        Action = aAddMatList
        Images = dmData.Images
      end
      object TBSeparatorItem11: TTBSeparatorItem
      end
      object TBItem17: TTBItem
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
    object TBItem23: TTBItem
      Action = aSetRsvAll
    end
    object TBItem24: TTBItem
      Action = aRemoveRsv
    end
    object TBItem15: TTBItem
      Action = aRemoveRsvAll
    end
    object TBSeparatorItem9: TTBSeparatorItem
    end
    object TBItem22: TTBItem
      Action = aShowSN
    end
    object TBItem27: TTBItem
      Action = aSetDiscount
    end
    object TBSeparatorItem7: TTBSeparatorItem
    end
    object TBItem16: TTBItem
      Action = aMatInfo
    end
    object TBItem18: TTBItem
      Action = aSvcInfo
    end
    object TBItem5: TTBItem
      Action = aShowRealPrice
    end
    object TBSeparatorItem2: TTBSeparatorItem
    end
    object TBItem21: TTBItem
      Action = aShowGridOptions
    end
    object TBItem4: TTBItem
      Action = aCUpd
    end
  end
  object mdPosition: TssMemoryData
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
    Left = 624
    Top = 279
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
    object mdPositionwhname: TStringField
      FieldName = 'whname'
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
  end
  object mdRsv: TssMemoryData
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
    Left = 656
    Top = 279
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
    object mdRsvSN: TStringField
      FieldName = 'SN'
      Size = 64
    end
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
    Left = 90
    Top = 262
  end
  object mdReport: TdxMemData
    Indexes = <>
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
    SortOptions = []
    Left = 685
    Top = 244
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = mdReport
    Left = 656
    Top = 244
  end
  object frDoc: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    ModifyPrepared = False
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnBeginDoc = frDocBeginDoc
    OnEndDoc = frDocEndDoc
    OnGetValue = frDocGetValue
    Left = 627
    Top = 244
    ReportForm = {19000000}
  end
  object pmMatSvc: TTBPopupMenu
    Images = dmData.Images
    Left = 128
    Top = 312
    object TBItem19: TTBItem
      Action = aAddMat
    end
    object TBItem25: TTBItem
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
  object cdsRsv_Temp: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pSysRsv_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 276
    Top = 344
  end
  object FsrcTaxes: TfrDBDataSet
    DataSet = mdTaxes
    Left = 274
    Top = 404
  end
  object mdTaxes: TdxMemData
    Indexes = <>
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
    SortOptions = []
    Left = 302
    Top = 404
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
    Left = 49
    Top = 300
  end
  object kaEnt: TokKAgent
    RemoteServer = dmData.SConnection
    LoadContracts = False
    OnAccountChange = kaEntAccountChange
    Left = 191
    Top = 313
  end
  object DataSource1: TDataSource
    DataSet = mdPosition
    Left = 623
    Top = 308
  end
end
