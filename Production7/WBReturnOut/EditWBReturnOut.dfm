inherited frmEditWBReturnOut: TfrmEditWBReturnOut
  Left = 452
  Top = 271
  Width = 824
  Height = 585
  ActiveControl = edFindKA
  Caption = 'frmEditWBReturnOut'
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 816
    Height = 467
    inherited panData: TPanel
      Width = 816
      Height = 467
      inherited panPos: TPanel
        Top = 183
        Width = 816
        Height = 284
        inherited gbPos: TssGroupBox
          Left = 4
          Top = 1
          Width = 811
          Height = 273
          inherited lTotalCurr: TLabel
            Top = 247
          end
          inherited lSummCurr: TssBevel
            Left = 337
            Top = 245
          end
          inherited lTotal: TLabel
            Left = 215
            Top = 247
            Anchors = [akLeft, akBottom]
          end
          inherited lTotNDSOut: TLabel
            Left = 462
            Top = 247
            Anchors = [akLeft, akBottom]
          end
          inherited lSummDefNoNDS: TssBevel
            Left = 526
            Top = 245
            Anchors = [akLeft, akBottom]
          end
          inherited lTotNDS: TLabel
            Left = 652
            Top = 247
            Anchors = [akLeft, akBottom]
          end
          inherited lSummDefNDS: TssBevel
            Left = 689
            Top = 245
            Anchors = [akLeft, akBottom]
          end
          inherited lTot: TLabel
            Left = 294
            Top = 247
            Anchors = [akLeft, akBottom]
          end
          inherited lSummDef: TssBevel
            Left = 85
            Top = 245
            Width = 120
            Anchors = [akLeft, akBottom]
          end
          inherited btnNew: TssSpeedButton
            Top = 6
            Width = 127
            DroppedDown = True
            PopupMenu = pmMatSvc
          end
          inherited btnProps: TssSpeedButton
            Left = 133
            Top = 6
          end
          inherited btnDel: TssSpeedButton
            Left = 250
            Top = 6
          end
          inherited dbgWaybillDet: TssDBGrid
            Top = 42
            Width = 800
            Height = 195
            Hint = 'sumwithnds'
            Filter.Criteria = {00000000}
            inherited colPrice: TdxDBGridColumn
              FieldName = 'pricewithnds'
            end
            inherited colSummWONDS: TdxDBGridColumn
              FieldName = 'sumwonds'
            end
            inherited colSummDef: TdxDBGridColumn
              FieldName = 'sumwithnds'
            end
            inherited colPriceWONDS: TdxDBGridColumn [16]
              Width = 100
              FieldName = 'pricewonds'
            end
            inherited colPosId: TdxDBGridColumn [17]
            end
            inherited colMatId: TdxDBGridColumn [18]
            end
            inherited colWId: TdxDBGridColumn [19]
            end
            inherited colNDS: TdxDBGridColumn [20]
              FieldName = 'sumnds'
            end
            inherited colNorm: TdxDBGridColumn [21]
            end
            inherited colDiscount: TdxDBGridColumn [22]
            end
            inherited colPType: TdxDBGridColumn [23]
            end
            inherited colProducer: TdxDBGridColumn [24]
              Tag = 1
            end
            inherited colSerial: TdxDBGridColumn [25]
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
          end
          inherited edFind: TokGridSearchEdit
            Left = 582
            Top = 6
            Width = 220
          end
        end
      end
      inherited panHeader: TPanel
        Width = 816
        Height = 183
        inherited gbHeader: TssGroupBox
          Left = 4
          Width = 573
          Height = 182
          Anchors = [akLeft, akTop, akRight, akBottom]
          inherited lRate: TLabel
            Top = 153
          end
          inherited lOndate: TLabel
            Left = 244
            Top = 36
            Width = 34
            Caption = #1044#1072#1090#1072':'
          end
          inherited btnSetTime: TssSpeedButton
            Left = 537
            Top = 30
            Width = 25
            Height = 25
            LeftMargin = 4
          end
          inherited lNum: TLabel
            Left = 9
            Top = 34
            Width = 42
            Caption = #1053#1086#1084#1077#1088':'
          end
          object lReceived: TLabel [5]
            Left = 9
            Top = 95
            Width = 69
            Height = 16
            Caption = #1063#1077#1088#1077#1079' '#1082#1086#1075#1086':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lAttNum: TssBevel [6]
            Left = 406
            Top = 91
            Width = 159
            Height = 20
            Anchors = [akTop, akRight]
            ColorGrBegin = clWindow
            ColorGrEnd = clWindow
            ColorInner = clBtnShadow
            ColorOuter = clBtnShadow
            Edges = [beLeft, beRight, beTop, beBottom]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            GradientDirection = gdVertical
            HotTrack = False
            ImageIndex = 0
            ParentShowHint = False
            ShowHint = True
            UseGradient = True
            WordBreak = False
          end
          object lPersonname: TLabel [7]
            Left = 270
            Top = 123
            Width = 59
            Height = 16
            Anchors = [akTop, akRight]
            Caption = #1054#1090#1087#1091#1089#1090#1080#1083':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object btnPersonName: TssSpeedButton [8]
            Left = 538
            Top = 117
            Alignment = taCenter
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            DisabledImages = dmData.Images18x18dis
            GroupIndex = 0
            ImageIndex = 32
            Images = dmData.Images18x18
            LeftMargin = 4
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnClick = btnPersonNameClick
          end
          inherited lReason: TLabel
            Left = 9
            Top = 123
            Width = 69
            Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077':'
          end
          inherited lNotes: TLabel
            Left = 9
            Top = 153
            Width = 77
            Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
          end
          inherited edRate: TssCalcEdit
            Left = 188
            Top = 148
            TabOrder = 11
          end
          inherited cbCurr: TssDBLookupCombo
            Left = 108
            Top = 148
            Width = 59
            TabOrder = 10
          end
          inherited edDate: TcxDateEdit
            Left = 283
            Top = 31
            Width = 100
          end
          inherited edTime: TcxTimeEdit
            Left = 443
            Top = 31
            Width = 93
          end
          inherited chbPosting: TcxCheckBox
            Left = 2
            Top = 2
            Properties.Caption = 'chbPosting'
          end
          inherited edNum1: TcxTextEdit
            Top = 31
            Width = 132
          end
          inherited edReason: TcxTextEdit
            Top = 118
            Width = 152
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 7
          end
          inherited edNotes: TcxTextEdit
            Left = 103
            Top = 148
            Width = 463
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 9
          end
          object edFindKA: TokKASearchEdit
            Left = 9
            Top = 57
            Width = 556
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
            EditorOffset = 77
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
            Skin = dmData.sknMain
            TabOrder = 4
            OnChange = edFindKAChange
            SearchMode = smAll
            DesignSize = (
              556
              30)
          end
          object cbReceived: TcxComboBox
            Left = 103
            Top = 89
            Width = 152
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownAutoWidth = False
            Properties.ImmediateDropDown = False
            Properties.Items.Strings = (
              'fgfgfd'
              'dfgdfg')
            Properties.MaxLength = 64
            Style.StyleController = dmData.scMain
            TabOrder = 5
            Text = 'cbReceived'
            OnEnter = CtrlEnter
            OnExit = CtrlExit
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object chbAtt: TcxCheckBox
            Left = 262
            Top = 89
            Width = 139
            Height = 25
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentColor = False
            ParentFont = False
            Properties.Alignment = taLeftJustify
            Properties.DisplayUnchecked = 'False'
            Properties.OnChange = chbAttPropertiesChange
            Properties.Caption = #1087#1086' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1080
            Style.BorderColor = clBtnShadow
            Style.BorderStyle = ebsUltraFlat
            Style.Color = clBtnFace
            Style.Shadow = False
            Style.StyleController = dmData.scMain
            TabOrder = 6
            ImeName = 'Russian'
            OnEnter = CtrlEnter
            OnExit = CtrlExit
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object lcbPersonName: TssDBLookupCombo
            Left = 341
            Top = 118
            Width = 196
            Height = 24
            Anchors = [akTop, akRight]
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownListStyle = lsEditFixedList
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 8
            OnEnter = CtrlEnter
            OnExit = CtrlExit
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            EmptyValue = 0
            KeyField = 'kaid'
            ListField = 'Name'
            ListSource = srcPayMPersons
          end
        end
        inherited gbPayment: TssGroupBox
          Left = 576
          Width = 239
          Height = 182
          inherited lPayType: TssLabel
            Left = 8
            Top = 64
            Anchors = [akTop, akRight]
          end
          inherited lPaySumm: TssLabel
            Left = 8
            Top = 153
            Anchors = [akTop, akRight]
          end
          inherited lPayCurr: TssLabel
            Left = 165
            Top = 153
          end
          inherited lPayMPerson: TssLabel
            Left = 8
            Top = 123
            Anchors = [akTop, akRight]
          end
          inherited btnPayMPerson: TssSpeedButton
            Left = 213
            Top = 117
            Width = 25
            Height = 25
            ImageIndex = 32
            LeftMargin = 4
            OnClick = btnPayMPersonClick
          end
          inherited btnFinPay: TssSpeedButton
            Left = 205
            Top = 58
            Width = 25
            Height = 25
            LeftMargin = 4
            OnClick = btnFinPayClick
          end
          inherited chbPay: TcxCheckBox
            Left = 8
            Top = 2
            Width = 182
            Anchors = [akTop, akRight]
            Properties.Caption = #1054#1087#1083#1072#1090#1072' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
          end
          inherited edPaySumm: TssCalcEdit
            Left = 58
            Top = 148
            Width = 103
            Anchors = [akTop, akRight]
          end
          inherited cbPayCurr: TssDBLookupCombo
            Left = 160
            Top = 148
            Width = 72
          end
          inherited lcbPayMPerson: TssDBLookupCombo
            Left = 80
            Top = 118
            Width = 133
            Anchors = [akTop, akRight]
          end
          inherited lcbPayType: TssDBLookupCombo
            Left = 88
            Top = 59
            Width = 117
            Anchors = [akTop, akRight]
          end
          inherited pcPayType: TssPageControl
            Left = 5
            Top = 86
            Width = 181
            ActivePage = tsCashless
            inherited tsCash: TcxTabSheet
              inherited btnCashDesks: TssSpeedButton
                Left = 1
                OnClick = btnCashDesksClick
              end
              inherited lcbCashDesks: TssDBLookupCombo
                Width = 180
                OnKeyDown = GoNextKeyDown
              end
            end
            inherited tsCashless: TcxTabSheet
              inherited lAcc: TssLabel
                Anchors = [akTop, akRight]
              end
              inherited lcbAccount: TssDBLookupCombo
                Left = 70
                Width = 110
                Height = 24
                Anchors = [akTop, akRight]
                ParentFont = False
                OnEnter = CtrlEnter
                OnExit = CtrlExit
                OnKeyDown = GoNextKeyDown
              end
            end
          end
          inherited edPayNum: TokPayDocSearchEdit
            Left = 8
            Top = 27
            Width = 182
            Anchors = [akTop, akRight]
          end
        end
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 816
    inherited panTitleButtons: TssPanel
      Left = 755
    end
  end
  inherited panButtons: TPanel
    Top = 514
    Width = 816
    Height = 41
    inherited btnOK: TxButton
      Left = 505
      Top = 9
    end
    inherited btnCancel: TxButton
      Left = 611
      Top = 9
    end
    inherited btnApply: TxButton
      Left = 711
      Top = 9
    end
  end
  inherited panToolBar: TPanel
    Width = 816
    inherited btnLock: TssSpeedButton
      Left = 765
      LeftMargin = 4
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 789
      LeftMargin = 4
    end
    inherited btnHelp: TssSpeedButton
      Left = 741
      LeftMargin = 4
    end
    inherited btnBallance: TssSpeedButton
      Left = 31
      LeftMargin = 4
    end
    inherited btnPrint: TssSpeedButton
      Left = 4
      LeftMargin = 4
    end
    inherited btnMatInfo: TssSpeedButton
      Left = 58
      LeftMargin = 4
    end
    inherited btnSvcInfo: TssSpeedButton
      Left = 139
      LeftMargin = 4
    end
    inherited btnFinance: TssSpeedButton
      Left = 112
      Width = 25
      LeftMargin = 4
    end
    object btnOrdersInfo: TssSpeedButton
      Left = 85
      Top = 1
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
    Top = 304
  end
  inherited FormStorage: TssFormStorage
    Left = 88
    Top = 280
  end
  inherited ActionList: TActionList
    Top = 304
    object aAddMat: TAction [11]
      Caption = 'aAddMat'
      ImageIndex = 14
      OnExecute = aAddMatExecute
    end
    object aAddMatList: TAction [13]
      Caption = 'aAddMatList'
      ImageIndex = 184
      OnExecute = aAddMatListExecute
    end
    object aOrdersInfo: TAction
      Caption = 'aOrdersInfo'
      ImageIndex = 203
      ShortCut = 16463
      OnExecute = aOrdersInfoExecute
    end
  end
  inherited pmMain: TTBPopupMenu
    object mnuAdd: TTBSubmenuItem [0]
      object TBItem6: TTBItem
        Action = aAddMat
        Images = dmData.Images
      end
      object TBItem1: TTBItem
        Action = aAddMatList
        Images = dmData.Images
      end
    end
    inherited TBItem3: TTBItem
      Visible = False
    end
  end
  inherited mdTmpIds: TdxMemData
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
  end
  inherited mdWMatTurnOld: TdxMemData
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
  end
  inherited frDoc: TfrReport
    ReportForm = {19000000}
  end
  inherited mdReport: TdxMemData
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
  end
  inherited mdPosition: TssMemoryData
    Left = 446
  end
  object dsPayType: TDataSource
    DataSet = cdsPayType
    Left = 245
    Top = 1
  end
  object pmMatSvc: TTBPopupMenu
    Images = dmData.Images
    Skin = dmData.sknMain
    Left = 76
    Top = 320
    object TBItem19: TTBItem
      Action = aAddMat
    end
    object itmAddMatList: TTBItem
      Action = aAddMatList
    end
  end
end
