inherited frmEditWriteOff: TfrmEditWriteOff
  Left = 265
  Top = 232
  Width = 936
  Height = 509
  Caption = 'frmEditWriteOff'
  Constraints.MinHeight = 430
  Constraints.MinWidth = 900
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Top = 45
    Width = 928
    Height = 404
    inherited panData: TPanel
      Width = 928
      Height = 404
      inherited panPos: TPanel
        Top = 193
        Width = 928
        Height = 211
        inherited gbPos: TssGroupBox
          Left = 4
          Width = 915
          Height = 206
          inherited lTotalCurr: TLabel
            Left = 12
            Top = 180
          end
          inherited lSummCurr: TssBevel
            Left = 114
            Top = 178
          end
          inherited lTotal: TLabel
            Left = 291
            Top = 180
          end
          inherited lTotNDSOut: TLabel
            Left = 396
            Top = 180
          end
          inherited lSummDefNoNDS: TssBevel
            Left = 458
            Top = 178
          end
          inherited lTotNDS: TLabel
            Left = 584
            Top = 180
          end
          inherited lSummDefNDS: TssBevel
            Left = 621
            Top = 178
          end
          inherited lTot: TLabel
            Left = 739
            Top = 180
          end
          inherited lSummDef: TssBevel
            Left = 788
            Top = 178
            Width = 120
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
            Width = 900
            Height = 129
            Hint = 'matname'
            Filter.Criteria = {00000000}
            inherited colPriceWONDS: TdxDBGridColumn [16]
              Width = 100
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
            Left = 442
            Top = 6
            Width = 250
          end
        end
      end
      inherited panHeader: TPanel
        Width = 928
        Height = 193
        inherited gbHeader: TssGroupBox
          Left = 4
          Top = 2
          Width = 453
          Height = 191
          inherited lRate: TLabel
            Left = 217
          end
          inherited lOndate: TLabel
            Left = 210
            Top = 34
            Width = 34
            Caption = #1044#1072#1090#1072':'
          end
          inherited btnSetTime: TssSpeedButton
            Left = 426
            Top = 32
          end
          inherited lNum: TLabel
            Left = 9
            Top = 36
          end
          object lWhouseOut: TssLabel [5]
            Left = 9
            Top = 57
            Width = 85
            Height = 32
            AutoSize = False
            Caption = 'lWhouseOut'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            WordWrap = True
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object btnWHouseOut: TssSpeedButton [6]
            Left = 426
            Top = 61
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
          inherited lReason: TLabel
            Left = 9
            Top = 95
          end
          inherited lNotes: TLabel
            Left = 9
            Top = 124
          end
          inherited edRate: TssCalcEdit
            Left = 261
            Top = 150
            TabOrder = 9
          end
          inherited cbCurr: TssDBLookupCombo
            Top = 150
            Width = 93
            TabOrder = 8
          end
          inherited edDate: TcxDateEdit
            Left = 247
            Top = 31
            Width = 99
            TabOrder = 3
          end
          inherited edTime: TcxTimeEdit
            Left = 348
            Top = 31
            Width = 76
            TabOrder = 4
          end
          inherited chbPosting: TcxCheckBox
            Left = 4
            Top = 2
            Properties.Caption = 'chbPosting'
          end
          inherited edNum1: TcxTextEdit
            Left = 100
            Top = 31
            Width = 107
            TabOrder = 2
          end
          inherited edReason: TcxTextEdit
            Left = 100
            Top = 90
            Width = 346
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 6
          end
          inherited edNotes: TcxTextEdit
            Left = 100
            Top = 119
            Width = 346
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 7
          end
          object lcbWHouseOut: TssDBLookupCombo
            Left = 100
            Top = 60
            Width = 320
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownListStyle = lsEditFixedList
            Properties.OnChange = DataModified
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
          object chbLosses: TcxCheckBox
            Left = 162
            Top = 2
            Width = 285
            Height = 26
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment = taLeftJustify
            Properties.DisplayUnchecked = 'False'
            Properties.OnChange = chbPostingPropertiesChange
            Properties.Caption = #1057#1091#1084#1084#1072' '#1089#1087#1080#1089#1072#1085#1080#1103' '#1083#1086#1078#1080#1090#1089#1103' '#1085#1072' '#1091#1073#1099#1090#1082#1080
            State = cbsChecked
            Style.StyleController = dmData.scMain
            TabOrder = 1
            ImeName = 'Russian'
            OnEnter = CtrlEnter
            OnExit = CtrlExit
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
        end
        inherited gbPayment: TssGroupBox
          Left = 657
          Width = 262
          Height = 192
          TabOrder = 2
          inherited lPayType: TssLabel
            Left = 5
          end
          inherited lPaySumm: TssLabel
            Left = 6
          end
          inherited lPayCurr: TssLabel
            Left = 198
          end
          inherited lPayMPerson: TssLabel
            Left = 6
          end
          inherited btnPayMPerson: TssSpeedButton
            Left = 236
            Top = 129
            Width = 22
            Height = 22
          end
          inherited btnFinPay: TssSpeedButton
            Left = 236
            Top = 70
            Width = 22
            Height = 22
          end
          inherited chbPay: TcxCheckBox
            Left = 5
            Width = 186
            Properties.Caption = #1054#1087#1083#1072#1090#1072' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
          end
          inherited edPaySumm: TssCalcEdit
            Left = 91
            Width = 94
          end
          inherited cbPayCurr: TssDBLookupCombo
            Left = 184
            Width = 74
          end
          inherited lcbPayMPerson: TssDBLookupCombo
            Left = 91
            Width = 142
          end
          inherited lcbPayType: TssDBLookupCombo
            Left = 91
            Width = 142
          end
          inherited pcPayType: TssPageControl
            Left = 6
            Width = 255
            inherited tsCash: TcxTabSheet
              inherited btnCashDesks: TssSpeedButton
                Left = 230
                Top = 3
                Width = 22
                Height = 22
              end
              inherited lcbCashDesks: TssDBLookupCombo
                Left = 58
                Width = 167
              end
            end
          end
          inherited edPayNum: TokPayDocSearchEdit
            Left = 6
            Width = 251
          end
        end
        object gbComm: TssGroupBox
          Left = 455
          Top = 2
          Width = 204
          Height = 191
          Alignment = alTopLeft
          Anchors = [akTop, akRight]
          Caption = 'Comission'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          TabStop = False
          Edges = [beLeft, beRight, beTop, beBottom]
          HideCaption = True
          HotTrack = False
          DesignSize = (
            204
            191)
          object btnPerson2: TssSpeedButton
            Left = 177
            Top = 121
            Width = 22
            Height = 22
            Alignment = taCenter
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = 25
            Images = dmData.Images
            LeftMargin = 1
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnClick = btnPerson2Click
          end
          object btnPerson1: TssSpeedButton
            Left = 177
            Top = 81
            Width = 22
            Height = 22
            Alignment = taCenter
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = 25
            Images = dmData.Images
            LeftMargin = 1
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnClick = btnPerson1Click
          end
          object btnChairman: TssSpeedButton
            Left = 177
            Top = 38
            Width = 22
            Height = 22
            Alignment = taCenter
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = 25
            Images = dmData.Images
            LeftMargin = 1
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnClick = btnChairmanClick
          end
          object lChairman: TLabel
            Left = 5
            Top = 19
            Width = 88
            Height = 16
            Caption = #1055#1088#1077#1076#1089#1077#1076#1072#1090#1077#1083#1100':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lPerson1: TLabel
            Left = 5
            Top = 65
            Width = 49
            Height = 16
            Caption = 'lPerson1'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lPerson2: TLabel
            Left = 5
            Top = 102
            Width = 49
            Height = 16
            Caption = 'lPerson2'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lPerson3: TLabel
            Left = 5
            Top = 146
            Width = 49
            Height = 16
            Caption = 'lPerson3'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object btnPerson3: TssSpeedButton
            Left = 177
            Top = 163
            Width = 22
            Height = 22
            Alignment = taCenter
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = 25
            Images = dmData.Images
            LeftMargin = 1
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnClick = btnPerson3Click
          end
          object lCommission: TssLabel
            Left = 5
            Top = 2
            Width = 116
            Height = 16
            Caption = #1057#1086#1089#1090#1072#1074' '#1082#1086#1084#1080#1089#1089#1080#1080':'
            DisabledDraw = ddStandard
            DisabledColor = clBlack
          end
          object lcbChairman: TssDBLookupCombo
            Left = 27
            Top = 38
            Width = 150
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownListStyle = lsEditFixedList
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 0
            OnEnter = CtrlEnter
            OnExit = CtrlExit
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            EmptyValue = 0
            KeyField = 'kaid'
            ListField = 'Name'
            ListSource = dsPersonName
          end
          object lcbPerson1: TssDBLookupCombo
            Left = 27
            Top = 80
            Width = 150
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownListStyle = lsEditFixedList
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 1
            OnEnter = CtrlEnter
            OnExit = CtrlExit
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            EmptyValue = 0
            KeyField = 'kaid'
            ListField = 'Name'
            ListSource = dsPersonName
          end
          object lcbPerson2: TssDBLookupCombo
            Left = 27
            Top = 120
            Width = 150
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownAutoWidth = False
            Properties.DropDownListStyle = lsEditFixedList
            Properties.DropDownWidth = 179
            Properties.ImmediatePost = True
            Properties.ImmediateUpdateText = True
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 2
            OnEnter = CtrlEnter
            OnExit = CtrlExit
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            EmptyValue = 0
            KeyField = 'kaid'
            ListField = 'Name'
            ListSource = dsPersonName
          end
          object lcbPerson3: TssDBLookupCombo
            Left = 27
            Top = 162
            Width = 150
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownAutoWidth = False
            Properties.DropDownListStyle = lsEditFixedList
            Properties.DropDownWidth = 179
            Properties.ImmediatePost = True
            Properties.ImmediateUpdateText = True
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 3
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
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 928
    inherited panTitleButtons: TssPanel
      Left = 867
    end
  end
  inherited panButtons: TPanel
    Top = 449
    Width = 928
    Height = 30
    inherited btnOK: TxButton
      Left = 612
      Top = 2
    end
    inherited btnCancel: TxButton
      Left = 717
      Top = 2
    end
    inherited btnApply: TxButton
      Left = 821
      Top = 2
    end
  end
  inherited panToolBar: TPanel
    Width = 928
    Height = 24
    inherited btnLock: TssSpeedButton
      Left = 871
      Width = 22
      Height = 22
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 895
      Width = 22
      Height = 22
    end
    inherited btnHelp: TssSpeedButton
      Left = 847
      Width = 22
      Height = 22
    end
    inherited btnBallance: TssSpeedButton
      Left = 85
      Width = 22
      Height = 22
      Visible = False
    end
    inherited btnPrint: TssSpeedButton
      Left = 4
      Width = 22
      Height = 22
    end
    inherited btnMatInfo: TssSpeedButton
      Left = 31
      Width = 22
      Height = 22
    end
    inherited btnSvcInfo: TssSpeedButton
      Left = 112
      Width = 22
      Height = 22
    end
    inherited btnFinance: TssSpeedButton
      Left = 58
      Width = 22
      Height = 22
    end
  end
  inherited ilTitleBar: TImageList
    Left = 56
    Top = 232
  end
  inherited FormStorage: TssFormStorage
    Left = 312
    Top = 380
  end
  inherited ActionList: TActionList
    Left = 84
    Top = 232
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
  inherited dsDet: TDataSource
    Left = 340
    Top = 267
  end
  inherited mdDet: TdxMemData
    Left = 336
    Top = 227
  end
  inherited srcCashDesks: TDataSource
    Left = 668
    Top = 408
  end
  inherited cdsCashDesks: TssClientDataSet
    Left = 672
    Top = 360
  end
  inherited srcEntAcc: TDataSource
    Left = 676
    Top = 284
  end
  inherited cdsPayType: TssClientDataSet
    Top = 283
  end
  inherited srcPayType: TDataSource
    Top = 235
  end
  inherited cdsPayMPersons: TssClientDataSet
    Top = 376
  end
  inherited srcPayMPersons: TDataSource
    Top = 336
  end
  inherited cdsEntAcc: TssClientDataSet
    Left = 680
    Top = 236
  end
  inherited pmMain: TTBPopupMenu
    Left = 204
    Top = 280
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
    Left = 576
    Top = 232
  end
  inherited mdWMatTurn: TdxMemData
    Left = 578
    Top = 276
  end
  inherited mdWMatTurnOld: TdxMemData
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
    Left = 576
    Top = 320
  end
  inherited frDoc: TfrReport
    ReportForm = {19000000}
  end
  inherited mdReport: TdxMemData
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
  end
  inherited mdPosition: TssMemoryData
    Left = 850
    Top = 305
  end
  inherited cdsPersonName: TssClientDataSet
    Left = 568
    Top = 376
  end
  inherited srcPersonName: TDataSource
    Left = 569
    Top = 416
  end
  object cdsWhouse: TssClientDataSet
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
    Left = 126
    Top = 290
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
  object dsWhouse: TDataSource
    DataSet = cdsWhouse
    Left = 130
    Top = 338
  end
  object dsPersonName: TDataSource
    DataSet = cdsPersonName
    Left = 793
    Top = 332
  end
  object pmMatSvc: TTBPopupMenu
    Images = dmData.Images
    Skin = dmData.sknMain
    Left = 200
    Top = 228
    object TBItem19: TTBItem
      Action = aAddMat
    end
    object itmAddMatList: TTBItem
      Action = aAddMatList
    end
  end
end
