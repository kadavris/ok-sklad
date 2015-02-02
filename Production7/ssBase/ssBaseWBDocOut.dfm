inherited frmBaseWBDocOut: TfrmBaseWBDocOut
  Left = 164
  Top = 202
  Width = 816
  ActiveControl = chbPosting
  Caption = 'frmBaseWBDocOut'
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 800
    inherited panData: TPanel
      Width = 800
      inherited panPos: TPanel
        Top = 194
        Width = 800
        Height = 257
        DesignSize = (
          800
          257)
        inherited gbPos: TssGroupBox
          Left = 6
          Width = 801
          Height = 257
          Caption = 'gbPos'
          HideCaption = True
          DesignSize = (
            801
            257)
          inherited lTotalCurr: TLabel
            Top = 230
            Visible = False
          end
          inherited lSummCurr: TssBevel
            Top = 227
            Visible = False
          end
          inherited lTotal: TLabel
            Left = 354
            Top = 230
          end
          inherited lTotNDSOut: TLabel
            Left = 459
            Top = 230
          end
          inherited lSummDefNoNDS: TssBevel
            Left = 522
            Top = 227
          end
          inherited lTotNDS: TLabel
            Left = 647
            Top = 230
          end
          inherited lSummDefNDS: TssBevel
            Left = 684
            Top = 227
          end
          inherited lTot: TLabel
            Left = 1
            Top = 230
          end
          inherited lSummDef: TssBevel
            Left = 1
            Top = 227
          end
          object btnNew: TssSpeedButton [9]
            Left = 7
            Top = 20
            Width = 117
            Height = 30
            Action = aCIns
            Alignment = taLeftJustify
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
            ImageIndex = 0
            Images = dmData.Images18x18
            LeftMargin = 8
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsCaptionGlyph
          end
          object btnProps: TssSpeedButton [10]
            Left = 124
            Top = 20
            Width = 118
            Height = 30
            Action = aCUpd
            Alignment = taLeftJustify
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
            LeftMargin = 8
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsCaptionGlyph
          end
          object btnDel: TssSpeedButton [11]
            Left = 242
            Top = 20
            Width = 119
            Height = 30
            Action = aCDel
            Alignment = taLeftJustify
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
            LeftMargin = 8
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsCaptionGlyph
          end
          inherited dbgWaybillDet: TssDBGrid
            Left = 7
            Width = 786
            Height = 163
            Hint = 'matname'
            PopupMenu = pmMain
            OnDblClick = dbgWaybillDetDblClick
            Filter.Criteria = {00000000}
            OnCustomDrawCell = dbgWaybillDetCustomDrawCell
            OnGetOptionsTitle = dbgWaybillDetGetOptionsTitle
            inherited colRecNo: TdxDBGridColumn [0]
            end
            inherited colPosType: TdxDBGridImageColumn [1]
              DisableDragging = True
            end
            inherited colStatus: TdxDBGridImageColumn [2]
              FieldName = 'status'
              OnGetText = colStatusGetText
            end
            inherited colMatName: TdxDBGridColumn [3]
              MinWidth = 100
            end
            inherited colArtikul: TdxDBGridColumn [4]
              MinWidth = 80
            end
            inherited colBarCode: TdxDBGridColumn [5]
            end
            inherited colAmount: TdxDBGridColumn [6]
              MaxLength = 90
              MinWidth = 60
              OnGetText = colAmountGetText
            end
            inherited colMeasureName: TdxDBGridColumn [7]
              Sizing = False
            end
            inherited colNDSRate: TdxDBGridColumn [8]
            end
            inherited colPriceInCurr: TdxDBGridColumn [9]
              Width = 122
              FieldName = 'PriceCurrTXT'
              OnGetText = nil
            end
            inherited colSummCurr: TdxDBGridColumn [10]
              FieldName = 'SummCurrTXT'
              OnGetText = nil
            end
            inherited colOnValue: TdxDBGridColumn [11]
              MinWidth = 50
              Width = 98
            end
            inherited colPrice: TdxDBGridColumn [12]
              MinWidth = 50
              FieldName = 'pricedef'
            end
            inherited colSummWONDS: TdxDBGridColumn [13]
              MinWidth = 50
              FieldName = 'summwonds'
            end
            inherited colSummDef: TdxDBGridColumn [14]
              MinWidth = 50
              FieldName = 'summdef'
            end
            inherited colWHouseName: TdxDBGridColumn [15]
            end
            inherited colSerial: TdxDBGridColumn [16]
              MinWidth = 100
              Width = 100
            end
            inherited colProducer: TdxDBGridColumn [17]
            end
            inherited colPriceWONDS: TdxDBGridColumn [18]
              Caption = ''
              MinWidth = 50
              FieldName = 'pricedefwonds'
            end
            inherited colPosId: TdxDBGridColumn [19]
            end
            inherited colMatId: TdxDBGridColumn [20]
            end
            inherited colWId: TdxDBGridColumn [21]
            end
            inherited colNDS: TdxDBGridColumn [22]
              MinWidth = 50
              FieldName = 'summnds'
            end
            inherited colNorm: TdxDBGridColumn [23]
              Tag = 0
            end
            inherited colDiscount: TdxDBGridColumn [24]
              Tag = 0
            end
            inherited colPType: TdxDBGridColumn [25]
              DisableDragging = True
            end
          end
          object edFind: TokGridSearchEdit
            Left = 592
            Top = 20
            Width = 200
            Height = 30
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
            TabOrder = 1
            Grid = dbgWaybillDet
            DesignSize = (
              200
              30)
          end
        end
      end
      inherited panHeader: TPanel
        Width = 800
        Height = 194
        DesignSize = (
          800
          194)
        inherited gbHeader: TssGroupBox
          Width = 539
          Height = 195
          Caption = 'gbHeader'
          DesignSize = (
            539
            195)
          inherited lOndate: TLabel
            Left = 204
            Top = 50
          end
          inherited btnSetTime: TssSpeedButton
            Left = 505
            Top = 44
          end
          object lNum: TLabel [4]
            Left = 18
            Top = 49
            Width = 29
            Height = 16
            Caption = 'lNum'
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
            Left = 33
            Top = 100
            Width = 45
            Height = 16
            Caption = 'lReason'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lNotes: TLabel [6]
            Left = 284
            Top = 138
            Width = 35
            Height = 16
            Caption = 'lNotes'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          inherited edRate: TssCalcEdit
            Left = 212
            TabOrder = 7
          end
          inherited cbCurr: TssDBLookupCombo
            TabOrder = 6
          end
          inherited edDate: TcxDateEdit
            Left = 243
            Top = 46
            OnKeyPress = edDateKeyPress
          end
          inherited edTime: TcxTimeEdit
            Left = 396
            Top = 46
            Properties.OnChange = edTimePropertiesChange
            OnKeyPress = GoNext
          end
          object chbPosting: TcxCheckBox
            Left = 14
            Top = 17
            Width = 163
            Height = 26
            AutoSize = False
            ParentFont = False
            Properties.Alignment = taLeftJustify
            Properties.DisplayUnchecked = 'False'
            Properties.OnChange = chbPostingPropertiesChange
            Properties.Caption = 'chbPosting'
            State = cbsChecked
            Style.StyleController = dmData.scMain
            TabOrder = 0
            ImeName = 'Russian'
            OnEnter = CtrlEnter
            OnExit = CtrlExit
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edNum1: TcxTextEdit
            Left = 103
            Top = 44
            Width = 84
            Height = 26
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.MaxLength = 15
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 1
            ImeName = 'Russian'
            OnEnter = CtrlEnter
            OnExit = CtrlExit
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edReason: TcxTextEdit
            Left = 103
            Top = 100
            Width = 174
            Height = 24
            ParentFont = False
            Properties.MaxLength = 128
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 4
            ImeName = 'Russian'
            OnEnter = CtrlEnter
            OnExit = CtrlExit
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edNotes: TcxTextEdit
            Left = 334
            Top = 133
            Width = 172
            Height = 24
            ParentFont = False
            ParentShowHint = False
            Properties.MaxLength = 255
            Properties.OnChange = DataModified
            ShowHint = True
            Style.StyleController = dmData.scMain
            TabOrder = 5
            ImeName = 'Russian'
            OnEnter = CtrlEnter
            OnExit = CtrlExit
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
        end
        inherited gbPayment: TssGroupBox
          Left = 544
          Width = 263
          Height = 195
          DesignSize = (
            263
            195)
          inherited lPayType: TssLabel
            Left = 14
          end
          inherited lPaySumm: TssLabel
            Left = 15
          end
          inherited lPayCurr: TssLabel
            Left = 203
          end
          inherited lPayMPerson: TssLabel
            Left = 15
          end
          inherited btnPayMPerson: TssSpeedButton
            Left = 227
          end
          inherited btnFinPay: TssSpeedButton
            Left = 227
          end
          inherited chbPay: TcxCheckBox
            Left = 6
            Width = 256
            Properties.OnChange = chbPayPropertiesChange
            Properties.Caption = #1054#1087#1083#1072#1090#1072' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
          end
          inherited edPaySumm: TssCalcEdit
            Left = 100
            Width = 85
          end
          inherited cbPayCurr: TssDBLookupCombo
            Left = 195
          end
          inherited lcbPayMPerson: TssDBLookupCombo
            Left = 100
            Width = 125
          end
          inherited lcbPayType: TssDBLookupCombo
            Left = 100
            Width = 125
          end
          inherited pcPayType: TssPageControl
            inherited tsCash: TcxTabSheet
              inherited btnCashDesks: TssSpeedButton
                ImageIndex = 42
              end
            end
          end
          inherited edPayNum: TokPayDocSearchEdit
            Left = 15
            Width = 247
            DesignSize = (
              247
              31)
          end
        end
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 800
    inherited panTitleButtons: TssPanel
      Left = 739
    end
  end
  inherited panButtons: TPanel
    Width = 800
    DesignSize = (
      800
      35)
    inherited btnOK: TxButton
      Left = 511
    end
    inherited btnCancel: TxButton
      Left = 616
    end
    inherited btnApply: TxButton
      Left = 1
    end
  end
  inherited panToolBar: TPanel
    Width = 800
    DesignSize = (
      800
      26)
    inherited btnLock: TssSpeedButton
      Left = 753
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 777
    end
    inherited btnHelp: TssSpeedButton
      Left = 729
    end
    inherited btnSvcInfo: TssSpeedButton
      Left = 92
    end
    inherited btnFinance: TssSpeedButton
      Left = 121
    end
  end
  inherited ilTitleBar: TImageList
    Left = 200
    Top = 0
  end
  inherited FormStorage: TssFormStorage
    Left = 152
    Top = 4
  end
  inherited ActionList: TActionList
    Left = 240
    Top = 0
    object aRemoveRsv: TAction [9]
      Category = 'Det'
      Caption = 'aRemoveRsv'
      ImageIndex = 113
      OnExecute = aRemoveRsvExecute
    end
    inherited aShowGridOptions: TAction
      Category = 'Det'
    end
    inherited aShowRealPrice: TAction
      Category = 'Det'
    end
    object aCIns: TAction [15]
      Category = 'Det'
      Caption = 'aCIns'
      ImageIndex = 0
      ShortCut = 45
      OnExecute = aCInsExecute
    end
    object aCUpd: TAction [16]
      Category = 'Det'
      Caption = 'aCUpd'
      ImageIndex = 1
      ShortCut = 16397
      OnExecute = aCUpdExecute
    end
    object aCDel: TAction [17]
      Category = 'Det'
      Caption = 'aCDel'
      ImageIndex = 2
      ShortCut = 16430
      OnExecute = aCDelExecute
    end
    object aSelectAll: TAction [18]
      Category = 'Det'
      Caption = 'aSelectAll'
      ShortCut = 16449
      OnExecute = aSelectAllExecute
    end
    object aShowSN: TAction [19]
      Category = 'Det'
      Caption = 'aShowSN'
      OnExecute = aShowSNExecute
    end
    object aSetRsv: TAction [20]
      Category = 'Det'
      Caption = 'aSetRsv'
      ImageIndex = 113
      OnExecute = aSetRsvExecute
    end
    object aSetRsvAll: TAction [21]
      Category = 'Det'
      Caption = 'aSetRsvAll'
      ImageIndex = 113
      OnExecute = aSetRsvAllExecute
    end
    object aRemoveRsvAll: TAction [22]
      Category = 'Det'
      Caption = 'aRemoveRsvAll'
      ImageIndex = 113
      OnExecute = aRemoveRsvAllExecute
    end
    object aCurAction: TAction [23]
      Caption = 'aCurAction'
      ShortCut = 16429
      OnExecute = aCurActionExecute
    end
    object aActivateFind: TAction
      Caption = 'aActivateFind'
      ShortCut = 16454
      OnExecute = aActivateFindExecute
    end
  end
  inherited mdDet: TdxMemData
    OnCalcFields = mdDetCalcFields
    inherited mdDetpostype: TIntegerField [0]
    end
    object mdDetstatus: TIntegerField [1]
      FieldName = 'status'
    end
    inherited mdDetposid: TIntegerField [2]
    end
    inherited mdDetwbillid: TIntegerField [3]
    end
    inherited mdDetmatid: TIntegerField [4]
    end
    inherited mdDetwid: TIntegerField [5]
    end
    inherited mdDetnorm: TFloatField [6]
    end
    inherited mdDetamount: TFloatField [7]
    end
    inherited mdDetcurrid: TIntegerField [8]
    end
    inherited mdDetcurrname: TStringField [9]
    end
    inherited mdDetptypeid: TIntegerField [10]
    end
    inherited mdDetprice: TFloatField [11]
    end
    inherited mdDetdiscount: TFloatField [12]
    end
    inherited mdDetonvalue: TFloatField [13]
    end
    inherited mdDetondate: TDateTimeField [14]
    end
    inherited mdDetnds: TFloatField [15]
    end
    inherited mdDetnum: TIntegerField [16]
    end
    inherited mdDetmatname: TStringField [17]
    end
    inherited mdDetmsrname: TStringField [18]
    end
    inherited mdDetartikul: TStringField [19]
    end
    inherited mdDetwhname: TStringField [20]
    end
    inherited mdDetpersonid: TIntegerField [21]
    end
    object mdDetsummcurr: TFloatField
      FieldName = 'summcurr'
    end
    object mdDetpricedef: TFloatField
      FieldName = 'pricedef'
    end
    object mdDetpricedefwonds: TFloatField
      FieldName = 'pricedefwonds'
    end
    object mdDetsummdef: TFloatField
      FieldName = 'summdef'
    end
    object mdDetsummnds: TFloatField
      FieldName = 'summnds'
    end
    object mdDetsummwonds: TFloatField
      FieldName = 'summwonds'
    end
    object mdDetPriceCurrTXT: TStringField
      FieldKind = fkCalculated
      FieldName = 'PriceCurrTXT'
      Calculated = True
    end
    object mdDetSummCurrTXT: TStringField
      FieldKind = fkCalculated
      FieldName = 'SummCurrTXT'
      Calculated = True
    end
  end
  object pmMain: TTBPopupMenu
    Images = dmData.Images18x18
    Skin = dmData.sknMain
    Left = 20
    Top = 272
    object TBItem3: TTBItem
      Action = aCIns
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
      Images = dmData.Images
    end
    object TBItem15: TTBItem
      Action = aRemoveRsv
      Images = dmData.Images
    end
    object TBItem18: TTBItem
      Action = aRemoveRsvAll
      Images = dmData.Images
    end
    object TBSeparatorItem7: TTBSeparatorItem
    end
    object TBItem23: TTBItem
      Action = aShowSN
    end
    object TBSeparatorItem9: TTBSeparatorItem
    end
    object TBItem16: TTBItem
      Action = aMatInfo
      Images = dmData.Images
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
  object mdTmpIds: TdxMemData
    Indexes = <>
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
    SortOptions = []
    AfterPost = mdDetAfterPost
    AfterDelete = mdDetAfterDelete
    Left = 171
    Top = 286
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
  object mdWMatTurn: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 157
    Top = 315
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
  object mdWMatTurnOld: TdxMemData
    Indexes = <>
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
    SortOptions = []
    AfterPost = mdDetAfterPost
    AfterDelete = mdDetAfterDelete
    Left = 187
    Top = 315
  end
  object frDoc: TfrReport
    Dataset = frDBDataSet1
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnEndDoc = frDocEndDoc
    OnGetValue = frDocGetValue
    Left = 174
    Top = 392
    ReportForm = {19000000}
  end
  object frDBDataSet1: TfrDBDataSet
    DataSet = mdReport
    Left = 202
    Top = 392
  end
  object mdReport: TdxMemData
    Indexes = <>
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
    SortOptions = []
    Left = 230
    Top = 392
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
    Left = 302
    Top = 365
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
    object mdPositiondocnum: TStringField
      FieldName = 'docnum'
    end
    object mdPositiondocdate: TDateTimeField
      FieldName = 'docdate'
    end
    object mdPositiondocnumtxt: TStringField
      FieldKind = fkCalculated
      FieldName = 'docnumtxt'
      Size = 128
      Calculated = True
    end
    object mdPositionwhname: TStringField
      FieldName = 'whname'
      Size = 64
    end
    object mdPositionprice: TFloatField
      FieldName = 'price'
    end
    object mdPositionpricetxt: TStringField
      Alignment = taRightJustify
      FieldKind = fkCalculated
      FieldName = 'pricetxt'
      Calculated = True
    end
    object mdPositionSN: TStringField
      FieldName = 'SN'
      Size = 64
    end
    object mdPositionwtype: TIntegerField
      FieldName = 'wtype'
    end
    object mdPositionwbillid: TIntegerField
      FieldName = 'wbillid'
    end
    object mdPositiongtd: TStringField
      FieldName = 'gtd'
      Size = 64
    end
    object mdPositionproducer: TStringField
      FieldName = 'producer'
      Size = 255
    end
    object mdPositioncertnum: TStringField
      FieldName = 'certnum'
      Size = 64
    end
    object mdPositioncertdate: TDateTimeField
      FieldName = 'certdate'
    end
    object mdPositionpostype: TIntegerField
      FieldName = 'postype'
    end
  end
  object cdsRsv_Temp: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'pSysRsv_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 268
    Top = 312
  end
  object cdsPersonName: TssClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'p_Persons_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 416
    Top = 384
  end
  object srcPersonName: TDataSource
    DataSet = cdsPersonName
    Left = 449
    Top = 384
  end
end
