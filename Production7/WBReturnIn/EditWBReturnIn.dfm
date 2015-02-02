inherited frmEditWBReturnIn: TfrmEditWBReturnIn
  Left = 416
  Top = 281
  Width = 813
  Height = 586
  ActiveControl = edKAgent
  Caption = 'frmEditWBReturnIn'
  Constraints.MinHeight = 470
  Constraints.MinWidth = 780
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 805
    Height = 467
    TabOrder = 1
    inherited panData: TPanel
      Width = 805
      Height = 467
      inherited panPos: TPanel
        Top = 188
        Width = 805
        Height = 279
        inherited gbPos: TssGroupBox
          Width = 805
          Height = 279
          Align = alClient
          HideCaption = True
          inherited lTotalCurr: TLabel
            Top = 253
            Visible = False
          end
          inherited lSummCurr: TssBevel
            Left = 89
            Top = 253
            Visible = False
          end
          inherited lTotal: TLabel
            Left = 210
            Top = 253
            Anchors = [akLeft, akBottom]
          end
          inherited lTotNDSOut: TLabel
            Left = 458
            Top = 253
            Anchors = [akLeft, akBottom]
          end
          inherited lSummDefNoNDS: TssBevel
            Left = 521
            Top = 253
            Anchors = [akLeft, akBottom]
          end
          inherited lTotNDS: TLabel
            Left = 656
            Top = 253
            Anchors = [akLeft, akBottom]
          end
          inherited lSummDefNDS: TssBevel
            Left = 689
            Top = 253
            Anchors = [akLeft, akBottom]
          end
          inherited lTot: TLabel
            Left = 283
            Top = 253
          end
          inherited lSummDef: TssBevel
            Left = 330
            Top = 253
            Width = 121
            Anchors = [akLeft, akBottom]
          end
          inherited dbgWaybillDet: TssDBGrid
            Left = 6
            Top = 41
            Width = 795
            Height = 208
            Hint = 'matname'
            PopupMenu = pmMain
            OnDblClick = dbgWaybillDetDblClick
            Filter.Criteria = {00000000}
            OnGetOptionsTitle = dbgWaybillDetGetOptionsTitle
            inherited colPosType: TdxDBGridImageColumn
              Visible = False
            end
            inherited colStatus: TdxDBGridImageColumn
              Visible = False
            end
            inherited colPosId: TdxDBGridColumn
              Width = 67
            end
            inherited colMatName: TdxDBGridColumn
              Width = 321
            end
            inherited colArtikul: TdxDBGridColumn
              Width = 107
            end
            inherited colBarCode: TdxDBGridColumn
              Width = 108
            end
            inherited colNorm: TdxDBGridColumn
              Width = 63
            end
            inherited colWHouseName: TdxDBGridColumn
              Width = 109
            end
            inherited colPrice: TdxDBGridColumn
              FieldName = 'pricewithnds'
            end
            inherited colPriceWONDS: TdxDBGridColumn
              Width = 86
              FieldName = 'pricewonds'
            end
            inherited colPriceInCurr: TdxDBGridColumn
              Tag = 0
              Width = 67
            end
            inherited colNDSRate: TdxDBGridColumn
              Width = 63
            end
            inherited colNDS: TdxDBGridColumn
              Width = 76
              FieldName = 'sumnds'
            end
            inherited colSummWONDS: TdxDBGridColumn
              Width = 85
              FieldName = 'sumwonds'
            end
            inherited colSummDef: TdxDBGridColumn
              Width = 95
              FieldName = 'sumwithnds'
            end
            inherited colSummCurr: TdxDBGridColumn
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
              Width = 107
            end
            inherited colProducer: TdxDBGridColumn
              Width = 107
            end
            inherited colGTD: TdxDBGridColumn
              Width = 107
            end
            inherited colCertNum: TdxDBGridColumn
              Width = 107
            end
            inherited colCertDate: TdxDBGridColumn
              Width = 85
            end
            inherited colNotes: TdxDBGridColumn
              Width = 108
            end
            inherited colCardHolder: TdxDBGridColumn
              Width = 101
            end
            object colRate: TdxDBGridColumn
              Visible = False
              Width = 68
              BandIndex = 0
              RowIndex = 0
              FieldName = 'onvalue'
            end
          end
          object panPosBar: TPanel
            Left = 1
            Top = 6
            Width = 803
            Height = 32
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            ParentBackground = False
            ParentColor = True
            TabOrder = 1
            DesignSize = (
              803
              32)
            object btnProps: TssSpeedButton
              Left = 121
              Top = 0
              Width = 118
              Height = 31
              Action = aCUpd
              Alignment = taLeftJustify
              AllwaysShowFrame = True
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              GroupIndex = 0
              ImageIndex = 21
              Images = dmData.Images18x18
              LeftMargin = 8
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object btnDel: TssSpeedButton
              Left = 238
              Top = 0
              Width = 118
              Height = 31
              Action = aCDel
              Alignment = taLeftJustify
              AllwaysShowFrame = True
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
              LeftMargin = 8
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              Style = ssbsUser
              ViewStyle = ssvsCaptionGlyph
            end
            object btnAdd: TssSpeedButton
              Left = 5
              Top = 0
              Width = 117
              Height = 31
              Action = aCIns
              Alignment = taLeftJustify
              AllwaysShowFrame = True
              ButtonType = ssbtStandard
              Checked = False
              DisabledImages = dmData.Images18x18dis
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
              ViewStyle = ssvsCaptionGlyph
            end
            object edFind: TokGridSearchEdit
              Left = 555
              Top = 0
              Width = 242
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
                242
                31)
            end
          end
        end
      end
      inherited panHeader: TPanel
        Width = 805
        Height = 188
        inherited gbHeader: TssGroupBox
          Left = 0
          Top = 0
          Width = 475
          Height = 188
          Align = alClient
          inherited lRate: TLabel
            Left = 175
            Top = 155
            Visible = True
          end
          inherited lCurr: TLabel
            Top = 155
            Visible = True
          end
          inherited lOndate: TLabel
            Left = 316
          end
          inherited btnSetTime: TssSpeedButton
            Left = 34
          end
          object lNum: TLabel [4]
            Left = 9
            Top = 36
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
            Top = 95
            Width = 69
            Height = 16
            Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lPersonname: TLabel [6]
            Left = 300
            Top = 155
            Width = 43
            Height = 16
            Alignment = taRightJustify
            Caption = #1055#1088#1080#1085#1103#1083
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object btnPersonName: TssSpeedButton [7]
            Left = 34
            Top = 150
            Width = 26
            Height = 26
            Action = aAddKA
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = 28
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
            Left = 9
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
            Top = 150
            Width = 80
            Enabled = False
            TabOrder = 8
            Visible = True
          end
          inherited cbCurr: TssDBLookupCombo
            Left = 98
            Top = 150
            Enabled = False
            TabOrder = 7
            Visible = True
          end
          inherited edDate: TcxDateEdit
            Left = 355
          end
          inherited edTime: TcxTimeEdit
            Left = 34
          end
          object chbPosting: TcxCheckBox
            Left = 2
            Top = 2
            Width = 164
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
          object edNum1: TcxTextEdit
            Left = 98
            Top = 31
            Width = 213
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.MaxLength = 15
            Properties.OnChange = edNum1PropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 1
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edReason: TcxTextEdit
            Left = 98
            Top = 90
            Width = 376
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Properties.MaxLength = 128
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 5
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object lcbPersonName: TssDBLookupCombo
            Left = 350
            Top = 150
            Width = 124
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownListStyle = lsEditFixedList
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 9
            OnEnter = lcbPersonNameEnter
            OnExit = lcbPersonNameExit
            OnKeyPress = lcbPersonNameKeyPress
            EmptyValue = 0
            KeyField = 'kaid'
            ListField = 'Name'
            ListSource = srcPersonName
          end
          object edKAgent: TokKASearchEdit
            Left = 9
            Top = 58
            Width = 465
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
            TabOrder = 4
            LoadContracts = True
            SearchMode = smAll
            DesignSize = (
              465
              31)
          end
          object edNotes: TcxTextEdit
            Left = 98
            Top = 119
            Width = 376
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ParentFont = False
            Properties.MaxLength = 255
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 6
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
        end
        inherited gbPayment: TssGroupBox
          Left = 475
          Top = 0
          Width = 330
          Height = 188
          Align = alRight
          inherited lPayType: TssLabel
            Left = 12
            Top = 68
            Anchors = [akTop, akRight]
          end
          inherited lPaySumm: TssLabel
            Left = 14
            Top = 156
            Anchors = [akTop, akRight]
          end
          inherited lPayCurr: TssLabel
            Left = 185
            Top = 156
          end
          inherited lPayMPerson: TssLabel
            Left = 14
            Top = 127
            Anchors = [akTop, akRight]
          end
          inherited btnPayMPerson: TssSpeedButton
            Top = 122
            Width = 31
            Action = aAddKA
            ImageIndex = 28
          end
          inherited btnFinPay: TssSpeedButton
            Left = 294
            Top = 63
            Action = aAddKA
            ImageIndex = 28
          end
          inherited chbPay: TcxCheckBox
            Left = 9
            Top = 10
            Width = 272
            Properties.OnChange = chbPayPropertiesChange
            Properties.Caption = #1054#1087#1083#1072#1090#1072' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
          end
          inherited edPaySumm: TssCalcEdit
            Top = 151
            Width = 70
            Anchors = [akTop, akRight]
          end
          inherited cbPayCurr: TssDBLookupCombo
            Left = 242
            Top = 151
            Width = 80
          end
          inherited lcbPayMPerson: TssDBLookupCombo
            Top = 122
            Width = 183
            Anchors = [akTop, akRight]
            AutoSize = False
          end
          inherited lcbPayType: TssDBLookupCombo
            Top = 63
            Width = 187
            Anchors = [akTop, akRight]
          end
          inherited pcPayType: TssPageControl
            Left = 11
            Top = 90
            Width = 311
            ActivePage = tsCashless
            inherited tsCash: TcxTabSheet
              inherited btnCashDesks: TssSpeedButton
                Left = 279
                Top = 2
                Action = aAddKA
                ImageIndex = 28
              end
              inherited lcbCashDesks: TssDBLookupCombo
                Width = 190
              end
            end
            inherited tsCashless: TcxTabSheet
              inherited lAcc: TssLabel
                Anchors = [akTop, akRight]
              end
              inherited lcbAccount: TssDBLookupCombo
                Left = 92
                Width = 219
                Anchors = [akTop, akRight]
                AutoSize = False
                ParentFont = False
              end
            end
          end
          inherited edPayNum: TokPayDocSearchEdit
            Left = 12
            Top = 31
            Width = 309
            Anchors = [akTop, akRight]
          end
        end
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 805
    TabOrder = 3
    inherited panTitleButtons: TssPanel
      Left = 744
    end
  end
  inherited panButtons: TPanel
    Top = 514
    Width = 805
    Height = 42
    TabOrder = 2
    inherited btnOK: TxButton
      Left = 474
      Top = 9
      OnKeyDown = GoNextKeyDown
    end
    inherited btnCancel: TxButton
      Left = 578
      Top = 9
    end
    inherited btnApply: TxButton
      Left = 682
      Top = 9
      OnKeyDown = GoNextKeyDown
    end
  end
  inherited panToolBar: TPanel
    Width = 805
    TabOrder = 0
    inherited btnLock: TssSpeedButton
      Left = 34
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 34
    end
    inherited btnHelp: TssSpeedButton
      Left = 34
    end
    inherited btnBallance: TssSpeedButton
      Left = 32
    end
    inherited btnPrint: TssSpeedButton
      Left = 5
    end
    inherited btnMatInfo: TssSpeedButton
      Left = 59
    end
    inherited btnSvcInfo: TssSpeedButton
      Left = 113
    end
    inherited btnFinance: TssSpeedButton
      Left = 140
    end
    object btnOrdersInfo: TssSpeedButton
      Left = 86
      Top = 1
      Width = 28
      Height = 29
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
    Left = 248
    Top = 28
  end
  inherited FormStorage: TssFormStorage
    Options = []
    Left = 48
    Top = 295
  end
  inherited ActionList: TActionList
    Top = 323
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
      ImageIndex = 21
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
      ImageIndex = 28
      ShortCut = 16429
      OnExecute = aAddKAExecute
    end
    object aSelectAll: TAction [10]
      Caption = 'aSelectAll'
      ShortCut = 16449
      OnExecute = aSelectAllExecute
    end
    object aPayMPersons: TAction [11]
      Category = 'addon'
      Caption = 'aPayMPersons'
      Enabled = False
      ShortCut = 16429
      OnExecute = aPayMPersonsExecute
    end
    object aOrdersInfo: TAction
      Caption = 'aOrdersInfo'
      ImageIndex = 203
      ShortCut = 16463
      OnExecute = aOrdersInfoExecute
    end
    object aAddMat: TAction
      Caption = 'aAddMat'
      ImageIndex = 14
      OnExecute = aAddMatExecute
    end
    object aAddMatList: TAction
      Caption = 'aAddMatList'
      ImageIndex = 184
    end
    object aActivateFind: TAction
      Caption = 'aActivateFind'
      ShortCut = 16454
      OnExecute = aActivateFindExecute
    end
  end
  inherited mdDet: TdxMemData
    OnCalcFields = mdDetCalcFields
    Left = 328
    Top = 395
    object mdDetsourceid: TIntegerField
      FieldName = 'sourceid'
    end
    object mdDetpposid: TIntegerField
      FieldName = 'pposid'
    end
  end
  inherited cdsPayType: TssClientDataSet
    Left = 388
    Top = 351
  end
  inherited srcPayType: TDataSource
    Left = 417
    Top = 351
  end
  inherited cdsPayMPersons: TssClientDataSet
    Left = 388
    Top = 380
  end
  inherited srcPayMPersons: TDataSource
    Left = 417
    Top = 380
  end
  inherited cdsCurr: TssClientDataSet
    Left = 388
    Top = 410
  end
  inherited dsCurr: TDataSource
    Left = 493
    Top = 330
  end
  object dsPayType: TDataSource
    DataSet = cdsPayType
    Left = 649
    Top = 259
  end
  object cdsPersonName: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'p_Persons_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 620
    Top = 288
  end
  object srcPersonName: TDataSource
    DataSet = cdsPersonName
    Left = 649
    Top = 288
  end
  object pmMain: TTBPopupMenu
    Images = dmData.Images
    Skin = dmData.sknMain
    Left = 267
    Top = 309
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
    object TBSeparatorItem3: TTBSeparatorItem
    end
    object TBItem3: TTBItem
      Action = aShowGridOptions
    end
    object TBSeparatorItem2: TTBSeparatorItem
    end
    object TBItem4: TTBItem
      Action = aCUpd
    end
  end
  object frDoc: TfrReport
    Dataset = fsrcDoc
    InitialZoom = pzDefault
    ModifyPrepared = False
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frDocGetValue
    Left = 296
    Top = 338
    ReportForm = {19000000}
  end
  object fsrcDoc: TfrDBDataSet
    DataSet = mdReport
    Left = 325
    Top = 338
  end
  object mdReport: TdxMemData
    Indexes = <>
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
    SortOptions = []
    Left = 266
    Top = 338
  end
  object pmMatSvc: TTBPopupMenu
    Images = dmData.Images
    Skin = dmData.sknMain
    Left = 112
    Top = 288
    object TBItem19: TTBItem
      Action = aAddMat
    end
    object itmAddMatList: TTBItem
      Action = aAddMatList
    end
    object TBSeparatorItem10: TTBSeparatorItem
    end
    object TBItem20: TTBItem
    end
  end
end
