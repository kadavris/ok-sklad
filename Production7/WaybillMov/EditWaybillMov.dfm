inherited frmEditWaybillMov: TfrmEditWaybillMov
  Left = 386
  Top = 255
  Width = 875
  Height = 551
  Caption = 'frmEditWaybillMov'
  OnConstrainedResize = FormConstrainedResize
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 867
    Height = 439
    inherited panData: TPanel
      Width = 867
      Height = 439
      inherited panPos: TPanel
        Top = 212
        Width = 867
        Height = 227
        Align = alBottom
        inherited gbPos: TssGroupBox
          Left = 0
          Width = 867
          Height = 227
          Align = alClient
          inherited lTotalCurr: TLabel
            Top = 202
          end
          inherited lSummCurr: TssBevel
            Left = 97
            Top = 199
          end
          inherited lTotal: TLabel
            Left = 229
            Top = 199
            Anchors = [akLeft, akBottom]
          end
          inherited lTotNDSOut: TLabel
            Left = 494
            Top = 199
            Anchors = [akLeft, akBottom]
          end
          inherited lSummDefNoNDS: TssBevel
            Left = 556
            Top = 199
            Anchors = [akLeft, akBottom]
          end
          inherited lTotNDS: TLabel
            Left = 708
            Top = 199
            Anchors = [akLeft, akBottom]
          end
          inherited lSummDefNDS: TssBevel
            Left = 742
            Top = 199
            Anchors = [akLeft, akBottom]
          end
          inherited lTot: TLabel
            Left = 310
            Top = 199
            Anchors = [akLeft, akBottom]
          end
          inherited lSummDef: TssBevel
            Left = 365
            Top = 199
            Anchors = [akLeft, akBottom]
          end
          inherited btnNew: TssSpeedButton
            Top = 6
            Width = 127
            AllwaysShowFrame = True
            DroppedDown = True
            PopupMenu = pmMatSvc
          end
          inherited btnProps: TssSpeedButton
            Left = 133
            Top = 6
            AllwaysShowFrame = True
          end
          inherited btnDel: TssSpeedButton
            Left = 250
            Top = 6
            AllwaysShowFrame = True
          end
          inherited dbgWaybillDet: TssDBGrid
            Top = 42
            Width = 852
            Height = 151
            Hint = 'amount'
            OnKeyPress = dbgWaybillDetKeyPress
            Filter.Criteria = {00000000}
            inherited colMatName: TdxDBGridColumn
              Width = 261
            end
            inherited colArtikul: TdxDBGridColumn
              Width = 119
            end
            inherited colOnValue: TdxDBGridColumn
              Width = 99
            end
            inherited colSummWONDS: TdxDBGridColumn
              Width = 79
            end
            inherited colPriceWONDS: TdxDBGridColumn [16]
              Width = 99
            end
            inherited colPosId: TdxDBGridColumn [17]
            end
            inherited colMatId: TdxDBGridColumn [18]
            end
            inherited colWId: TdxDBGridColumn [19]
            end
            inherited colNDS: TdxDBGridColumn [20]
            end
            inherited colNorm: TdxDBGridColumn [21]
            end
            inherited colDiscount: TdxDBGridColumn [22]
            end
            inherited colPType: TdxDBGridColumn [23]
            end
            inherited colGTD: TdxDBGridColumn [24]
              Tag = 1
            end
            inherited colCertNum: TdxDBGridColumn [25]
              Tag = 1
            end
            inherited colCertDate: TdxDBGridColumn [26]
              Tag = 1
              Width = 79
            end
            inherited colProducer: TdxDBGridColumn [27]
              Tag = 1
            end
            inherited colSerial: TdxDBGridColumn [28]
            end
          end
          inherited edFind: TokGridSearchEdit
            Left = 594
            Top = 6
            Width = 264
          end
        end
      end
      inherited panHeader: TPanel
        Width = 867
        Height = 193
        inherited gbHeader: TssGroupBox
          Left = 0
          Top = 0
          Width = 569
          Height = 193
          Align = alLeft
          inherited lRate: TLabel
            Left = 217
            Top = 162
          end
          inherited lCurr: TLabel
            Top = 161
          end
          inherited lOndate: TLabel
            Left = 122
            Top = 15
            Width = 34
            Caption = #1044#1072#1090#1072':'
          end
          inherited btnSetTime: TssSpeedButton
            Left = 347
            Top = 12
          end
          inherited lNum: TLabel
            Left = 9
            Top = 46
            ParentFont = True
          end
          object lWhouseOut: TssLabel [5]
            Left = 9
            Top = 75
            Width = 57
            Height = 16
            Caption = #1053#1072' '#1089#1082#1083#1072#1076':'
            Layout = tlCenter
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lWhouseIn: TssLabel [6]
            Left = 9
            Top = 106
            Width = 64
            Height = 16
            Caption = #1057#1086' '#1089#1082#1083#1072#1076#1072':'
            Layout = tlCenter
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object btnWHouseOut: TssSpeedButton [7]
            Left = 346
            Top = 72
            Width = 22
            Height = 22
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            Caption = 'aCurAction'
            DisabledImages = dmData.Images18x18dis
            GroupIndex = 0
            ImageIndex = 26
            Images = dmData.Images18x18
            LeftMargin = 2
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnClick = btnWHouseOutClick
          end
          object btnWHouseIn: TssSpeedButton [8]
            Left = 346
            Top = 102
            Width = 22
            Height = 22
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            Caption = 'aCurAction'
            DisabledImages = dmData.Images18x18dis
            GroupIndex = 0
            ImageIndex = 26
            Images = dmData.Images18x18
            LeftMargin = 2
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnClick = btnWHouseInClick
          end
          object lMiddlePerson: TLabel [9]
            Left = 381
            Top = 8
            Width = 79
            Height = 16
            Anchors = [akTop, akRight]
            Caption = 'lMiddlePerson'
          end
          object lPersonOut: TLabel [10]
            Left = 381
            Top = 54
            Width = 62
            Height = 16
            Anchors = [akTop, akRight]
            Caption = 'lPersonOut'
          end
          object lPersonIn: TLabel [11]
            Left = 381
            Top = 100
            Width = 53
            Height = 16
            Anchors = [akTop, akRight]
            Caption = 'lPersonIn'
          end
          object btnMiddlePerson: TssSpeedButton [12]
            Left = -138
            Top = 12
            Width = 27
            Height = 29
            Alignment = taCenter
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            DisabledImages = dmData.Images18x18dis
            GroupIndex = 0
            ImageIndex = 32
            Images = dmData.Images18x18
            LeftMargin = 1
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnClick = btnMiddlePersonClick
          end
          object btnPersonOut: TssSpeedButton [13]
            Left = -138
            Top = 42
            Width = 27
            Height = 27
            Alignment = taCenter
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            DisabledImages = dmData.Images18x18
            GroupIndex = 0
            ImageIndex = 32
            Images = dmData.Images18x18
            LeftMargin = 1
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnClick = btnPersonOutClick
          end
          object btnPersonIn: TssSpeedButton [14]
            Left = -138
            Top = 70
            Width = 27
            Height = 28
            Alignment = taCenter
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            DisabledImages = dmData.Images18x18dis
            GroupIndex = 0
            ImageIndex = 32
            Images = dmData.Images18x18
            LeftMargin = 1
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnClick = btnPersonInClick
          end
          inherited lReason: TLabel
            Left = 9
            Top = 135
            Width = 69
            Caption = #1054#1089#1085#1086#1074#1072#1085#1080#1077':'
            ParentFont = True
          end
          object ssBevel1: TssBevel [16]
            Left = 375
            Top = -5
            Width = 17
            Height = 198
            Anchors = [akTop, akRight]
            ColorGrBegin = clBtnFace
            ColorGrEnd = clBtnFace
            ColorInner = clBtnShadow
            ColorOuter = clBtnShadow
            Edges = [beLeft]
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Style = bsSingle
            UseGradient = False
          end
          inherited lNotes: TLabel
            Left = 381
            Top = 146
            Anchors = [akTop, akRight]
            ParentFont = True
          end
          inherited edRate: TssCalcEdit
            Left = 257
            Top = 156
            Width = 79
            ParentFont = True
            TabOrder = 12
          end
          inherited cbCurr: TssDBLookupCombo
            Left = 92
            Top = 156
            Width = 101
            ParentFont = True
            TabOrder = 11
          end
          inherited edDate: TcxDateEdit
            Left = 157
            Top = 11
            Width = 101
            ParentFont = True
          end
          inherited edTime: TcxTimeEdit
            Left = 264
            Top = 11
            Width = 82
            ParentFont = True
          end
          inherited chbPosting: TcxCheckBox
            Left = 4
            Top = 9
            Width = 117
            ParentFont = True
            Properties.Caption = 'chbPosting'
          end
          inherited edNum1: TcxTextEdit
            Left = 91
            Top = 42
            Width = 278
            ParentFont = True
          end
          inherited edReason: TcxTextEdit
            Left = 91
            Top = 130
            Width = 278
            Anchors = [akLeft, akTop, akRight]
            ParentFont = True
            TabOrder = 6
          end
          inherited edNotes: TcxTextEdit
            Left = 397
            Top = 166
            Width = 164
            Anchors = [akTop, akRight]
            ParentFont = True
            TabOrder = 10
          end
          object lcbWHouseOut: TssDBLookupCombo
            Left = 91
            Top = 71
            Width = 254
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ImeName = 'Russian'
            Properties.DropDownListStyle = lsEditFixedList
            Properties.OnChange = lcbWHouseOutPropertiesChange
            Properties.OnEditValueChanged = lcbWHouseOutPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 4
            OnEnter = CtrlEnter
            OnExit = CtrlExit
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            EmptyValue = 0
            KeyField = 'wid'
            ListField = 'Name'
            ListSource = dsWhouse
          end
          object lcbWHouseIn: TssDBLookupCombo
            Left = 91
            Top = 101
            Width = 254
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ImeName = 'Russian'
            Properties.DropDownListStyle = lsEditFixedList
            Properties.OnChange = lcbWHouseOutPropertiesChange
            Properties.OnEditValueChanged = lcbWHouseOutPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 5
            OnEnter = CtrlEnter
            OnExit = CtrlExit
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            EmptyValue = 0
            KeyField = 'wid'
            ListField = 'Name'
            ListSource = dsWhouse
          end
          object lcbMiddlePerson: TssDBLookupCombo
            Left = 397
            Top = 30
            Width = 164
            Height = 24
            Anchors = [akTop, akRight]
            ImeName = 'Russian'
            Properties.DropDownListStyle = lsEditFixedList
            Properties.OnChange = lcbWHouseOutPropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 7
            OnEnter = CtrlEnter
            OnExit = CtrlExit
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            EmptyValue = 0
            KeyField = 'kaid'
            ListField = 'Name'
            ListSource = dsPersonName
          end
          object lcbPersonNameOut: TssDBLookupCombo
            Left = 397
            Top = 75
            Width = 164
            Height = 24
            Anchors = [akTop, akRight]
            ImeName = 'Russian'
            Properties.DropDownListStyle = lsEditFixedList
            Properties.OnChange = lcbWHouseOutPropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 8
            OnEnter = CtrlEnter
            OnExit = CtrlExit
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            EmptyValue = 0
            KeyField = 'kaid'
            ListField = 'Name'
            ListSource = dsPersonName
          end
          object lcbPersonNameIn: TssDBLookupCombo
            Left = 397
            Top = 121
            Width = 164
            Height = 24
            Anchors = [akTop, akRight]
            ImeName = 'Russian'
            Properties.DropDownAutoWidth = False
            Properties.DropDownListStyle = lsEditFixedList
            Properties.DropDownWidth = 179
            Properties.ImmediatePost = True
            Properties.ImmediateUpdateText = True
            Properties.OnChange = lcbWHouseOutPropertiesChange
            Style.StyleController = dmData.scMain
            TabOrder = 9
            OnEnter = CtrlEnter
            OnExit = CtrlExit
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            EmptyValue = 0
            KeyField = 'kaid'
            ListField = 'Name'
            ListSource = dsPersonName
          end
        end
        inherited gbPayment: TssGroupBox
          Left = 601
          Top = 0
          Width = 266
          Height = 193
          Align = alRight
          inherited lPayCurr: TssLabel
            Left = 425
          end
          inherited btnPayMPerson: TssSpeedButton
            Left = 515
          end
          inherited btnFinPay: TssSpeedButton
            Left = 515
          end
          inherited chbPay: TcxCheckBox
            Width = 238
            Properties.Caption = #1054#1087#1083#1072#1090#1072' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
          end
          inherited edPaySumm: TssCalcEdit
            Width = 159
            ParentFont = True
          end
          inherited cbPayCurr: TssDBLookupCombo
            Left = 477
          end
          inherited lcbPayMPerson: TssDBLookupCombo
            Width = 159
            ParentFont = True
          end
          inherited lcbPayType: TssDBLookupCombo
            Width = 159
            ParentFont = True
          end
          inherited pcPayType: TssPageControl
            Width = 240
            inherited tsCash: TcxTabSheet
              inherited lcbCashDesks: TssDBLookupCombo
                Left = 78
                Width = 163
                ParentFont = True
              end
            end
          end
          inherited edPayNum: TokPayDocSearchEdit
            Width = 244
          end
        end
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 867
    inherited panTitleButtons: TssPanel
      Left = 806
    end
  end
  inherited panButtons: TPanel
    Top = 486
    Width = 867
    inherited btnOK: TxButton
      Left = 550
    end
    inherited btnCancel: TxButton
      Left = 654
    end
    inherited btnApply: TxButton
      Left = 760
    end
  end
  inherited panToolBar: TPanel
    Width = 867
    inherited btnLock: TssSpeedButton
      Left = 816
      Width = 20
      Height = 20
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 840
      Width = 20
      Height = 20
    end
    inherited btnHelp: TssSpeedButton
      Left = 792
      Width = 20
      Height = 20
    end
    inherited btnBallance: TssSpeedButton
      Left = 23
      Width = 20
      Height = 20
      Visible = False
    end
    inherited btnPrint: TssSpeedButton
      Left = 4
      Width = 20
      Height = 20
    end
    inherited btnMatInfo: TssSpeedButton
      Left = 84
      Width = 20
      Height = 20
    end
    inherited btnSvcInfo: TssSpeedButton
      Left = 46
      Width = 20
      Height = 20
    end
    inherited btnFinance: TssSpeedButton
      Left = 65
      Width = 20
      Height = 20
    end
  end
  inherited ilTitleBar: TImageList
    Top = 4
  end
  inherited FormStorage: TssFormStorage
    Left = 128
    Top = 340
  end
  inherited ActionList: TActionList
    Left = 236
    Top = 4
    object aAddMat: TAction
      Caption = 'aAddMat'
      ImageIndex = 14
      OnExecute = aAddMatExecute
    end
    object aAddMatList: TAction
      Caption = 'aAddMatList'
      ImageIndex = 184
      OnExecute = aAddMatListExecute
    end
  end
  inherited srcCashDesks: TDataSource
    Left = 580
  end
  inherited pmMain: TTBPopupMenu
    object mnuAdd: TTBSubmenuItem [0]
      object TBItem1: TTBItem
        Action = aAddMat
        Images = dmData.Images
      end
      object TBItem6: TTBItem
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
    Left = 499
  end
  inherited mdWMatTurn: TdxMemData
    Left = 485
  end
  inherited mdWMatTurnOld: TdxMemData
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
    Left = 499
    Top = 332
  end
  inherited frDoc: TfrReport
    Left = 176
    ReportForm = {19000000}
  end
  inherited mdReport: TdxMemData
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
  end
  object cdsWhouse: TssClientDataSet [26]
    Aggregates = <>
    Params = <>
    ProviderName = 'pWHouse_List'
    RemoteServer = dmData.SConnection
    BeforeOpen = cdsWhouseBeforeOpen
    Macros = <
      item
        DataType = ftString
        Name = 'm'
        ParamType = ptInput
      end>
    Left = 134
    Top = 98
    object cdsWhouseWID: TIntegerField
      FieldName = 'WID'
      ReadOnly = True
    end
    object cdsWhouseNAME: TStringField
      FieldName = 'NAME'
      ReadOnly = True
      Size = 64
    end
    object cdsWhouseADDR: TStringField
      FieldName = 'ADDR'
      ReadOnly = True
      Size = 255
    end
    object cdsWhouseNOTES: TStringField
      FieldName = 'NOTES'
      ReadOnly = True
      Size = 255
    end
    object cdsWhouseDELETED: TIntegerField
      FieldName = 'DELETED'
      ReadOnly = True
    end
    object cdsWhouseDEF: TIntegerField
      FieldName = 'DEF'
      ReadOnly = True
    end
  end
  object dsWhouse: TDataSource [27]
    DataSet = cdsWhouse
    Left = 162
    Top = 98
  end
  inherited mdPosition: TssMemoryData
    Top = 3
  end
  object dsPersonName: TDataSource [29]
    DataSet = cdsPersonName
    Left = 449
    Top = 8
  end
  object srcPersonNameIn: TDataSource [30]
    Left = 585
    Top = 8
  end
  object pmMatSvc: TTBPopupMenu
    Images = dmData.Images
    Skin = dmData.sknMain
    Left = 56
    Top = 268
    object TBItem19: TTBItem
      Action = aAddMat
    end
    object itmAddMatList: TTBItem
      Action = aAddMatList
    end
  end
end
