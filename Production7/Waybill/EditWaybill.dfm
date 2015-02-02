inherited frmEditWaybill: TfrmEditWaybill
  Left = 377
  Top = 241
  Width = 890
  Height = 509
  ActiveControl = edKAgent
  Caption = 'frmEditWaybill'
  Constraints.MinHeight = 420
  Constraints.MinWidth = 790
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnConstrainedResize = FormConstrainedResize
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 874
    Height = 382
    TabOrder = 1
    inherited panData: TPanel
      Width = 874
      Height = 382
      inherited panPos: TPanel
        Top = 186
        Width = 874
        Height = 196
        DesignSize = (
          874
          196)
        inherited gbPos: TssGroupBox
          Left = 4
          Top = -1
          Width = 873
          Height = 200
          HideCaption = True
          DesignSize = (
            873
            200)
          inherited lTotalCurr: TLabel
            Top = 174
          end
          inherited lSummCurr: TssBevel
            Left = 97
            Top = 172
          end
          inherited lTotal: TLabel
            Left = 238
            Top = 174
          end
          inherited lTotNDSOut: TLabel
            Left = 321
            Top = 174
          end
          inherited lSummDefNoNDS: TssBevel
            Left = 382
            Top = 172
          end
          inherited lTotNDS: TLabel
            Left = 510
            Top = 174
          end
          inherited lSummDefNDS: TssBevel
            Left = 545
            Top = 172
          end
          inherited lTot: TLabel
            Left = 699
            Top = 174
          end
          inherited lSummDef: TssBevel
            Left = 747
            Top = 172
          end
          inherited dbgWaybillDet: TssDBGrid
            Left = 7
            Top = 44
            Width = 859
            Height = 125
            PopupMenu = pmMain
            OnDblClick = dbgWaybillDetDblClick
            OnKeyPress = dbgWaybillDetKeyPress
            Filter.Criteria = {00000000}
            OnCustomDrawCell = dbgWaybillDetCustomDrawCell
            OnGetOptionsTitle = dbgWaybillDetGetOptionsTitle
            inherited colStatus: TdxDBGridImageColumn
              Visible = False
            end
            inherited colPosId: TdxDBGridColumn
              Width = 68
            end
            inherited colMatName: TdxDBGridColumn
              Width = 305
            end
            inherited colArtikul: TdxDBGridColumn
              Width = 102
            end
            inherited colBarCode: TdxDBGridColumn
              Width = 98
            end
            inherited colNorm: TdxDBGridColumn
              Tag = 0
              Width = 64
            end
            inherited colWHouseName: TdxDBGridColumn
              Width = 104
            end
            inherited colAmount: TdxDBGridColumn
              OnGetText = colAmountGetText
            end
            inherited colPrice: TdxDBGridColumn
              FieldName = 'pricewithnds'
            end
            inherited colPriceWONDS: TdxDBGridColumn
              Width = 84
              FieldName = 'pricewonds'
            end
            inherited colPriceInCurr: TdxDBGridColumn
              Width = 68
            end
            inherited colNDSRate: TdxDBGridColumn
              Width = 64
            end
            inherited colNDS: TdxDBGridColumn
              Width = 74
              FieldName = 'sumnds'
              OnGetText = colSummDefGetText
            end
            inherited colSummWONDS: TdxDBGridColumn
              Width = 83
              FieldName = 'sumwonds'
              OnGetText = colSummDefGetText
            end
            inherited colSummDef: TdxDBGridColumn
              Width = 95
              FieldName = 'sumwithnds'
              OnGetText = colSummDefGetText
            end
            inherited colSummCurr: TdxDBGridColumn
              Width = 82
              FieldName = 'sumcurr'
              OnGetText = colSummDefGetText
            end
            inherited colMatId: TdxDBGridColumn
              Width = 68
            end
            inherited colWId: TdxDBGridColumn
              Width = 68
            end
            inherited colPType: TdxDBGridColumn
              Width = 68
            end
            inherited colOnValue: TdxDBGridColumn
              Width = 68
            end
            inherited colDiscount: TdxDBGridColumn
              Tag = 0
              Width = 68
            end
            inherited colSerial: TdxDBGridColumn
              Width = 102
            end
            inherited colProducer: TdxDBGridColumn
              Tag = 1
              Width = 102
            end
            inherited colGTD: TdxDBGridColumn
              Tag = 1
              Width = 102
            end
            inherited colCertNum: TdxDBGridColumn
              Tag = 1
              Width = 102
            end
            inherited colCertDate: TdxDBGridColumn
              Tag = 1
              Width = 83
            end
            inherited colNotes: TdxDBGridColumn
              Width = 103
            end
            inherited colCardNum: TdxDBGridColumn
              Width = 71
            end
            inherited colCardHolder: TdxDBGridColumn
              Width = 101
            end
            object colSvcToPrice: TdxDBGridColumn
              Visible = False
              Width = 65
              BandIndex = 0
              RowIndex = 0
              FieldName = 'svctoprice'
            end
            object colUF1: TdxDBGridColumn
              Caption = 'UF1'
              Visible = False
              Width = 35
              BandIndex = 0
              RowIndex = 0
            end
            object colUF2: TdxDBGridColumn
              Caption = 'colUF2'
              Visible = False
              BandIndex = 0
              RowIndex = 0
            end
            object colUF3: TdxDBGridColumn
              Caption = 'colUF3'
              Visible = False
              BandIndex = 0
              RowIndex = 0
            end
            object colUF4: TdxDBGridColumn
              Caption = 'colUF4'
              Visible = False
              BandIndex = 0
              RowIndex = 0
            end
            object colUF5: TdxDBGridColumn
              Caption = 'colUF5'
              Visible = False
              BandIndex = 0
              RowIndex = 0
            end
          end
          object panPosBar: TPanel
            Left = 2
            Top = 7
            Width = 864
            Height = 32
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            ParentBackground = False
            ParentColor = True
            TabOrder = 1
            DesignSize = (
              864
              32)
            object btnProps: TssSpeedButton
              Left = 130
              Top = 0
              Width = 119
              Height = 31
              Action = aCUpd
              Alignment = taLeftJustify
              AllwaysShowFrame = True
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              GroupIndex = 0
              ImageIndex = 1
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
              Height = 31
              Action = aCDel
              Alignment = taLeftJustify
              AllwaysShowFrame = True
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              GroupIndex = 0
              ImageIndex = 2
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
              Height = 31
              Action = aCIns
              Alignment = taLeftJustify
              AllwaysShowFrame = True
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              DroppedDown = True
              GroupIndex = 0
              ImageIndex = 0
              Images = dmData.Images18x18
              LeftMargin = 8
              ParentColorEx = False
              ParentShowHint = False
              PopupMenu = pmMatSvc
              ShowHint = True
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object edFind: TokGridSearchEdit
              Left = 609
              Top = 0
              Width = 255
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
                255
                31)
            end
          end
        end
      end
      inherited panHeader: TPanel
        Width = 874
        Height = 186
        DesignSize = (
          874
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
            Visible = True
          end
          object lNum: TLabel [1]
            Left = 9
            Top = 34
            Width = 80
            Height = 16
            Caption = #8470' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
            Transparent = True
          end
          object lReason: TLabel [2]
            Left = 9
            Top = 124
            Width = 64
            Height = 16
            Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077
          end
          object lPersonname: TLabel [3]
            Left = 321
            Top = 154
            Width = 43
            Height = 16
            Alignment = taRightJustify
            Caption = #1055#1088#1080#1085#1103#1083
          end
          object btnPersonName: TssSpeedButton [4]
            Left = 580
            Top = 150
            Width = 20
            Height = 20
            Action = aAddKA
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = 18
            Images = dmData.Images
            LeftMargin = 1
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnMouseDown = btnPersonNameMouseDown
            OnMouseUp = btnPersonNameMouseUp
          end
          object lNotes: TLabel [5]
            Left = 287
            Top = 124
            Width = 77
            Height = 16
            Alignment = taRightJustify
            Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
          end
          inherited lCurr: TLabel
            Visible = True
          end
          inherited lOndate: TLabel
            Left = 296
            Top = 34
          end
          inherited btnSetTime: TssSpeedButton
            Left = 580
            Top = 31
          end
          inherited edRate: TssCalcEdit
            Left = 210
            TabOrder = 12
            Visible = True
          end
          inherited cbCurr: TssDBLookupCombo
            TabOrder = 11
            Visible = True
          end
          object chbPosting: TcxCheckBox [11]
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
            Style.StyleController = dmData.scMain
            TabOrder = 0
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object chbCheckNDS: TcxCheckBox [12]
            Left = 245
            Top = 2
            Width = 175
            Height = 28
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment = taLeftJustify
            Properties.DisplayUnchecked = 'False'
            Properties.OnChange = chbCheckNDSPropertiesChange
            Properties.Caption = #1062#1077#1085#1099' '#1074#1082#1083#1102#1095#1072#1102#1090' '#1053#1044#1057
            Style.StyleController = dmData.scMain
            TabOrder = 1
            Visible = False
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edNum1: TcxTextEdit [13]
            Left = 100
            Top = 30
            Width = 165
            Height = 25
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.MaxLength = 15
            Properties.OnChange = edNum1PropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 2
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edReason: TcxTextEdit [14]
            Left = 100
            Top = 119
            Width = 177
            Height = 24
            ParentFont = False
            Properties.MaxLength = 128
            Properties.OnChange = datamodified
            Style.StyleController = dmData.scMain
            TabOrder = 4
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object lcbPersonName: TssDBLookupCombo [15]
            Left = 368
            Top = 149
            Width = 209
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownListStyle = lsEditFixedList
            Properties.OnChange = datamodified
            Properties.OnEditValueChanged = lcbPersonNamePropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 6
            OnEnter = lcbPersonNameEnter
            OnExit = lcbPersonNameExit
            OnKeyPress = lcbPersonNameKeyPress
            EmptyValue = 0
            KeyField = 'kaid'
            ListField = 'Name'
            ListSource = srcPersonName
          end
          object edKAgent: TokKASearchEdit [16]
            Left = 9
            Top = 58
            Width = 592
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
              592
              31)
          end
          object edNotes: TcxTextEdit [17]
            Left = 368
            Top = 119
            Width = 233
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Properties.MaxLength = 255
            Properties.OnChange = datamodified
            Style.StyleController = dmData.scMain
            TabOrder = 5
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edContr: TokContractSearchEdit [18]
            Left = 9
            Top = 87
            Width = 267
            Height = 31
            ButtonsLeftMargin = 2
            CapRef = 'Contract Register'
            EditorOffset = 74
            DisabledImages = dmData.Images18x18dis
            Images = dmData.Images18x18
            ImageIndexRef = 46
            LangManager = dmData.Lng
            RemoteServer = dmData.SConnection
            ShowLng = False
            ShowButtons = sbtOnlyRef
            SearchNames.Strings = (
              'Contract;num')
            SearchType = stBegin
            Skin = dmData.sknMain
            TabOrder = 9
            OnChange = edContrChange
            ContractType = ctIn
            DesignSize = (
              267
              31)
          end
          inherited edDate: TcxDateEdit
            Left = 351
            Top = 30
            TabOrder = 7
            OnKeyPress = edDateKeyPress
          end
          inherited edTime: TcxTimeEdit
            Left = 472
            Top = 30
            Properties.OnChange = edTimePropertiesChange
            TabOrder = 8
            OnKeyPress = GoNext
          end
          object lcbWH: TokWHouseSearchEdit
            Left = 284
            Top = 87
            Width = 317
            Height = 31
            Anchors = [akLeft, akTop, akRight]
            ButtonsLeftMargin = 4
            CapRef = 'Warehouses Directory'
            EditorOffset = 81
            Images = dmData.Images
            ImageIndexRef = 50
            LangManager = dmData.Lng
            RemoteServer = dmData.SConnection
            ShowLng = False
            ShowButtons = sbtOnlyRef
            SearchNames.Strings = (
              'Warehouse:;name')
            SearchType = stBegin
            Skin = dmData.sknMain
            StyleController = dmData.scMain
            TabOrder = 10
            OnChange = lcbWHChange
            OnKeyDown = GoNextKeyDown
            ViewMode = vmList
            DesignSize = (
              317
              31)
          end
        end
        inherited gbPayment: TssGroupBox
          Left = 608
          Top = 2
          Width = 269
          Height = 184
          DesignSize = (
            269
            184)
          inherited lPayType: TssLabel
            Left = 7
            Top = 59
          end
          inherited lPaySumm: TssLabel
            Left = 7
            Top = 136
          end
          inherited lPayCurr: TssLabel
            Left = 9
          end
          inherited lPayMPerson: TssLabel
            Left = 7
            Top = 111
          end
          inherited btnPayMPerson: TssSpeedButton
            Left = 245
            Top = 108
            Width = 20
            Height = 20
            Action = aAddKA
          end
          inherited btnFinPay: TssSpeedButton
            Left = 246
            Top = 56
            Width = 20
            Height = 20
            ImageIndex = 18
            OnClick = aAddKAExecute
          end
          inherited chbPay: TcxCheckBox
            Left = 2
            Top = 4
            Width = 266
            Properties.OnChange = chbPayPropertiesChange
            Properties.Caption = #1054#1087#1083#1072#1090#1072' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
          end
          inherited edPaySumm: TssCalcEdit
            Left = 97
            Top = 131
            Width = 160
            ParentFont = True
          end
          inherited cbPayCurr: TssDBLookupCombo
            Left = 97
            Top = 157
            Width = 96
            ParentFont = True
          end
          inherited lcbPayMPerson: TssDBLookupCombo
            Left = 97
            Top = 106
            Width = 148
            ParentFont = True
          end
          inherited lcbPayType: TssDBLookupCombo
            Left = 97
            Top = 54
            Width = 144
            ParentFont = True
          end
          inherited pcPayType: TssPageControl
            Left = 5
            Top = 77
            Width = 256
            ActivePage = tsCashless
            Anchors = [akLeft, akTop, akRight]
            inherited tsCash: TcxTabSheet
              DesignSize = (
                256
                30)
              inherited btnCashDesks: TssSpeedButton
                Left = 1
                Action = aAddKA
              end
              inherited lcbCashDesks: TssDBLookupCombo
                Left = 92
                Width = 62
              end
            end
            inherited tsCashless: TcxTabSheet
              DesignSize = (
                256
                30)
              inherited lcbAccount: TssDBLookupCombo
                Left = 92
                Width = 157
                Height = 24
                Anchors = [akLeft, akTop, akRight]
              end
            end
          end
          inherited edPayNum: TokPayDocSearchEdit
            Left = 7
            Top = 24
            Width = 261
            EditorOffset = 73
            StyleController = dmData.scMain
            DesignSize = (
              261
              31)
          end
        end
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 874
    TabOrder = 0
    inherited panTitleButtons: TssPanel
      Left = 813
    end
  end
  inherited panButtons: TPanel
    Top = 429
    Width = 874
    Height = 42
    TabOrder = 2
    DesignSize = (
      874
      42)
    inherited btnOK: TxButton
      Left = 576
      Top = 9
      OnKeyDown = GoNextKeyDown
    end
    inherited btnCancel: TxButton
      Left = 680
      Top = 9
    end
    inherited btnApply: TxButton
      Left = 781
      Top = 9
      OnKeyDown = GoNextKeyDown
    end
  end
  inherited panToolBar: TPanel
    Width = 874
    DesignSize = (
      874
      26)
    inherited btnLock: TssSpeedButton
      Left = 837
      Top = 3
      Width = 20
      Height = 20
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 861
      Top = 3
      Width = 20
      Height = 20
    end
    inherited btnHelp: TssSpeedButton
      Left = 813
      Top = 3
      Width = 20
      Height = 20
    end
    inherited btnBallance: TssSpeedButton
      Left = 8
      Width = 20
      Height = 20
      LeftMargin = 1
    end
    inherited btnPrint: TssSpeedButton
      Left = 118
      Width = 20
      Height = 20
      LeftMargin = 1
    end
    object btnOrdersInfo: TssSpeedButton [5]
      Left = 30
      Top = 1
      Width = 20
      Height = 20
      Action = aOrdersInfo
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 203
      Images = dmData.Images
      LeftMargin = 1
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
    inherited btnMatInfo: TssSpeedButton
      Left = 96
      Width = 20
      Height = 20
      LeftMargin = 1
    end
    inherited btnSvcInfo: TssSpeedButton
      Left = 52
      Width = 20
      Height = 20
      LeftMargin = 1
    end
    inherited btnFinance: TssSpeedButton
      Left = 74
      Width = 20
      Height = 20
      LeftMargin = 1
    end
  end
  inherited ilTitleBar: TImageList
    Left = 696
    Top = 260
  end
  inherited FormStorage: TssFormStorage
    Options = []
    Left = 48
    Top = 295
  end
  inherited ActionList: TActionList
    Top = 339
    object aCIns: TAction [5]
      Category = 'det'
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 0
      ShortCut = 45
      OnExecute = aCInsExecute
    end
    object aCUpd: TAction [6]
      Tag = 1
      Category = 'det'
      Caption = #1057#1074#1086#1081#1089#1090#1074#1072
      ImageIndex = 1
      ShortCut = 16397
      OnExecute = aCUpdExecute
    end
    object aCDel: TAction [7]
      Category = 'det'
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 2
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
    object aAddMat: TAction [22]
      Caption = #1058#1086#1074#1072#1088
      ImageIndex = 14
      OnExecute = aAddMatExecute
    end
    object aAddSvc: TAction [23]
      Caption = #1059#1089#1083#1091#1075#1091
      ImageIndex = 15
      ShortCut = 8237
      OnExecute = aAddSvcExecute
    end
    object aAddMatList: TAction [24]
      Caption = #1058#1086#1074#1072#1088#1099' '#1089#1087#1080#1089#1082#1086#1084
      ImageIndex = 184
      OnExecute = aAddMatListExecute
    end
    object aAddSvcList: TAction [25]
      Caption = 'aAddSvcList'
      ImageIndex = 209
      OnExecute = aAddSvcListExecute
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
  end
  inherited dsDet: TDataSource
    Left = 344
    Top = 243
  end
  inherited mdDet: TdxMemData
    BeforeDelete = mdDetBeforeDelete
    Left = 316
    Top = 243
    object mdDetsvctoprice: TIntegerField
      FieldName = 'svctoprice'
    end
    object mdDetuf1: TIntegerField
      FieldName = 'uf1'
    end
    object mdDetuf2: TIntegerField
      FieldName = 'uf2'
    end
    object mdDetuf3: TIntegerField
      FieldName = 'uf3'
    end
    object mdDetuf4: TIntegerField
      FieldName = 'uf4'
    end
    object mdDetuf5: TIntegerField
      FieldName = 'uf5'
    end
  end
  object cdsPersonName: TssClientDataSet [9]
    Aggregates = <>
    Params = <>
    ProviderName = 'p_Persons_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 560
    Top = 324
  end
  object srcPersonName: TDataSource [10]
    DataSet = cdsPersonName
    Left = 532
    Top = 324
  end
  object pmMain: TTBPopupMenu [11]
    Images = dmData.Images
    Skin = dmData.sknMain
    Left = 266
    Top = 293
    object itmAdd: TTBSubmenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 3
      object TBItem6: TTBItem
        Action = aAddMat
      end
      object TBItem8: TTBItem
        Action = aAddMatList
      end
      object TBSeparatorItem4: TTBSeparatorItem
      end
      object TBItem7: TTBItem
        Action = aAddSvc
      end
      object TBItem10: TTBItem
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
    Left = 162
    Top = 106
  end
  object frDoc: TfrReport [13]
    Dataset = fsrcDoc
    InitialZoom = pzDefault
    ModifyPrepared = False
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frDocGetValue
    Left = 295
    Top = 338
    ReportForm = {19000000}
  end
  object fsrcDoc: TfrDBDataSet [14]
    DataSet = mdReport
    Left = 324
    Top = 338
  end
  object mdReport: TdxMemData [15]
    Indexes = <>
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
    SortOptions = [soDesc, soCaseInsensitive]
    Left = 266
    Top = 338
  end
  inherited srcCashDesks: TDataSource
    Top = 295
  end
  inherited cdsCashDesks: TssClientDataSet
    Top = 295
  end
  inherited srcEntAcc: TDataSource
    Top = 266
  end
  inherited cdsEntAcc: TssClientDataSet
    Top = 266
  end
  inherited cdsCurr: TssClientDataSet
    Left = 436
    Top = 365
  end
  inherited dsCurr: TDataSource
    Left = 385
    Top = 365
  end
  object pmMatSvc: TTBPopupMenu
    Images = dmData.Images
    Skin = dmData.sknMain
    Left = 104
    Top = 263
    object TBItem19: TTBItem
      Action = aAddMat
    end
    object TBItem3: TTBItem
      Action = aAddMatList
    end
    object TBSeparatorItem3: TTBSeparatorItem
    end
    object TBItem20: TTBItem
      Action = aAddSvc
    end
    object TBItem1: TTBItem
      Action = aAddSvcList
    end
  end
  object mdSvc: TdxMemData
    Indexes = <>
    SortOptions = []
    AfterPost = mdDetAfterPost
    AfterDelete = mdDetAfterDelete
    Left = 316
    Top = 275
    object IntegerField1: TIntegerField
      DefaultExpression = '0'
      FieldName = 'posid'
    end
    object FloatField1: TFloatField
      FieldName = 'amount'
    end
    object FloatField2: TFloatField
      FieldName = 'price'
    end
    object FloatField4: TFloatField
      FieldName = 'nds'
    end
    object FloatField6: TFloatField
      FieldName = 'norm'
    end
    object IntegerField11: TIntegerField
      FieldName = 'svctoprice'
    end
    object mdSvctotal: TFloatField
      FieldName = 'total'
    end
    object mdSvctotalwithnds: TStringField
      FieldName = 'totalwithnds'
    end
  end
  object DataSource1: TDataSource
    DataSet = mdSvc
    Left = 344
    Top = 275
  end
end
