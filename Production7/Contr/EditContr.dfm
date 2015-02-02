inherited frmEditContr: TfrmEditContr
  Left = 565
  Top = 226
  Width = 936
  Height = 554
  Caption = 'frmEditContr'
  Constraints.MinWidth = 780
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 928
    Height = 442
    TabOrder = 3
    object ssBevel2: TssBevel [0]
      Left = 5
      Top = 36
      Width = 922
      Height = 548
      Anchors = [akLeft, akTop, akRight, akBottom]
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
    inherited panData: TPanel
      Width = 928
      Height = 442
      inherited panPos: TPanel
        Top = 200
        Width = 928
        Height = 242
        inherited gbPos: TssGroupBox
          Left = 4
          Width = 923
          Height = 237
          inherited lTotalCurr: TLabel
            Top = 210
          end
          inherited lSummCurr: TssBevel
            Left = 121
            Top = 208
            Height = 22
          end
          inherited lTotal: TLabel
            Left = 435
            Top = 210
          end
          inherited lTotNDSOut: TLabel
            Left = 525
            Top = 210
          end
          inherited lSummDefNoNDS: TssBevel
            Left = 581
            Top = 208
            Width = 129
            Height = 22
          end
          inherited lTotNDS: TLabel
            Left = 749
            Top = 210
          end
          inherited lSummDefNDS: TssBevel
            Left = 786
            Top = 208
            Height = 22
          end
          inherited lTot: TLabel
            Left = 246
            Top = 210
          end
          inherited lSummDef: TssBevel
            Left = 293
            Top = 208
            Width = 120
            Height = 22
          end
          inherited btnNew: TssSpeedButton
            Top = 7
            ParentFont = True
          end
          inherited btnProps: TssSpeedButton
            Top = 7
            ParentFont = True
          end
          inherited btnDel: TssSpeedButton
            Top = 7
            ParentFont = True
          end
          inherited dbgWaybillDet: TssDBGrid
            Top = 44
            Width = 904
            Height = 161
            Hint = #8470
            ParentFont = True
            Filter.Criteria = {00000000}
            inherited colMatName: TdxDBGridColumn
              Width = 440
            end
            inherited colArtikul: TdxDBGridColumn
              Width = 129
            end
            inherited colBarCode: TdxDBGridColumn
              Width = 131
            end
            inherited colNDSRate: TdxDBGridColumn
              Width = 76
            end
            inherited colPriceInCurr: TdxDBGridColumn
              Width = 159
            end
            inherited colOnValue: TdxDBGridColumn
              Tag = 0
              Width = 128
            end
            inherited colWHouseName: TdxDBGridColumn [12]
              Tag = 0
              Width = 132
            end
            inherited colSummWONDS: TdxDBGridColumn
              Tag = 0
              Width = 101
            end
            inherited colSummDef: TdxDBGridColumn
              Tag = 0
              Visible = False
              Width = 126
            end
            inherited colPrice: TdxDBGridColumn [15]
              Tag = 0
              Visible = False
              Width = 85
            end
            inherited colSerial: TdxDBGridColumn
              Tag = 0
              Width = 131
            end
            inherited colProducer: TdxDBGridColumn
              Width = 129
            end
            inherited colPriceWONDS: TdxDBGridColumn
              Tag = 0
              Width = 131
            end
            inherited colPosId: TdxDBGridColumn
              Width = 81
            end
            inherited colMatId: TdxDBGridColumn
              Width = 81
            end
            inherited colWId: TdxDBGridColumn
              Width = 81
            end
            inherited colNDS: TdxDBGridColumn
              Tag = 0
              Width = 89
            end
            inherited colNorm: TdxDBGridColumn
              Width = 76
            end
            inherited colDiscount: TdxDBGridColumn
              Width = 81
            end
            inherited colPType: TdxDBGridColumn
              Width = 81
            end
            inherited colGTD: TdxDBGridColumn
              Width = 129
            end
            inherited colCertNum: TdxDBGridColumn
              Width = 129
            end
            inherited colCertDate: TdxDBGridColumn
              Width = 101
            end
            inherited colNotes: TdxDBGridColumn
              Width = 131
            end
          end
          inherited edFind: TokGridSearchEdit
            Left = 664
            Top = 9
          end
        end
      end
      inherited panHeader: TPanel
        Width = 928
        Height = 200
        inherited gbPayment: TssGroupBox [0]
          Left = 766
          Width = 161
          inherited lPayCurr: TssLabel
            Left = 1
          end
          inherited btnPayMPerson: TssSpeedButton
            Left = 1
          end
          inherited btnFinPay: TssSpeedButton
            Left = 1
          end
          inherited chbPay: TcxCheckBox
            Width = 138
            Properties.Caption = #1054#1087#1083#1072#1090#1072' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
          end
          inherited edPaySumm: TssCalcEdit
            Width = 95
          end
          inherited cbPayCurr: TssDBLookupCombo
            Left = 1
          end
          inherited lcbPayMPerson: TssDBLookupCombo
            Width = 160
          end
          inherited lcbPayType: TssDBLookupCombo
            Width = 160
          end
          inherited edPayNum: TokPayDocSearchEdit
            Width = 160
          end
        end
        inherited gbHeader: TssGroupBox [1]
          Left = 4
          Width = 923
          Height = 200
          inherited lRate: TLabel
            Left = 225
            Top = 169
          end
          inherited lCurr: TLabel
            Top = 170
            Visible = True
          end
          inherited lOndate: TLabel
            Left = 282
            Top = 7
          end
          inherited btnSetTime: TssSpeedButton
            Left = 570
            Top = 5
            LeftMargin = 1
          end
          inherited lNum: TLabel
            Left = 9
            Top = 36
            ParentColor = True
            ParentFont = True
          end
          inherited lReason: TLabel
            Left = 9
            Top = 117
            ParentFont = True
            Visible = False
          end
          object lFPath: TLabel [6]
            Left = 630
            Top = 124
            Width = 75
            Height = 16
            Anchors = [akTop, akRight]
            Caption = #1060#1072#1081#1083' '#1076#1086#1075#1086#1088#1072
          end
          object btnAddFPath: TssSpeedButton [7]
            Left = 886
            Top = 121
            Width = 20
            Height = 20
            Alignment = taCenter
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            Caption = 'aAddFPath'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            GroupIndex = 0
            ImageIndex = 49
            Images = dmData.Images
            LeftMargin = 2
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnClick = aAddFPathExecute
          end
          inherited lNotes: TLabel
            Left = 9
            Top = 91
            ParentFont = True
          end
          object lPersonname: TLabel [9]
            Left = 9
            Top = 142
            Width = 74
            Height = 16
            Caption = 'lPersonname'
          end
          object btnPersonName: TssSpeedButton [10]
            Left = 570
            Top = 140
            Width = 20
            Height = 20
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            GroupIndex = 0
            ImageIndex = 25
            Images = dmData.Images
            LeftMargin = 3
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnClick = btnPersonNameClick
          end
          object stCurrShortName: TssBevel [11]
            Left = 157
            Top = 62
            Width = 50
            Height = 23
            Alignments.Horz = taCenter
            Anchors = [akTop, akRight]
            ColorGrBegin = clWindow
            ColorGrEnd = clWindow
            ColorInner = clBtnShadow
            ColorOuter = clBtnShadow
            Edges = [beLeft, beRight, beTop, beBottom]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            GradientDirection = gdVertical
            HotTrack = False
            ImageIndex = 0
            UseGradient = True
          end
          object stMeasureName: TssBevel [12]
            Left = 861
            Top = 91
            Width = 50
            Height = 23
            Alignments.Horz = taCenter
            Anchors = [akTop, akRight]
            Caption = #1096#1090'.'
            ColorGrBegin = clWindow
            ColorGrEnd = clWindow
            ColorInner = clBtnShadow
            ColorOuter = clBtnShadow
            Edges = [beLeft, beRight, beTop, beBottom]
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clMaroon
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            GradientDirection = gdVertical
            HotTrack = False
            ImageIndex = 0
            UseGradient = True
          end
          object ssBevel1: TssBevel [13]
            Left = 605
            Top = -2
            Width = 16
            Height = 203
            Anchors = [akTop, akRight]
            ColorGrBegin = clBtnFace
            ColorGrEnd = clBtnFace
            ColorInner = clBtnShadow
            ColorOuter = clBtnShadow
            Edges = [beLeft, beRight, beTop, beBottom]
            GradientDirection = gdHorizontal
            HotTrack = False
            ImageIndex = 0
            Shape = bsLeftLine
            Style = bsSingle
            UseGradient = False
          end
          object lToDate: TLabel [14]
            Left = 630
            Top = 36
            Width = 44
            Height = 16
            Anchors = [akTop, akRight]
            Caption = 'lToDate'
          end
          inherited edRate: TssCalcEdit
            Left = 266
            Top = 165
            ParentFont = True
          end
          inherited cbCurr: TssDBLookupCombo
            Left = 102
            Top = 165
            Width = 93
            ParentFont = True
            Visible = True
          end
          inherited edDate: TcxDateEdit
            Left = 315
            Top = 4
            Width = 130
            ParentFont = True
            TabOrder = 9
          end
          inherited edTime: TcxTimeEdit
            Left = 449
            Top = 4
            Width = 119
            ParentFont = True
            TabOrder = 10
          end
          inherited chbPosting: TcxCheckBox
            Left = 4
            Top = 4
            Properties.Caption = 'chbPosting'
          end
          inherited edNum1: TcxTextEdit
            Left = 100
            Top = 31
            Width = 195
            ParentFont = True
          end
          inherited edReason: TcxTextEdit
            Left = 101
            Top = 112
            Width = 491
            Anchors = [akLeft, akTop, akRight]
            ParentFont = True
            Visible = False
          end
          inherited edNotes: TcxTextEdit
            Left = 100
            Top = 86
            Width = 491
            Anchors = [akLeft, akTop, akRight]
            ParentFont = True
            TabOrder = 3
          end
          object edFindKA: TokKASearchEdit
            Left = 9
            Top = 56
            Width = 582
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
            EditorOffset = 91
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
            TabOrder = 2
            OnChange = DataModified
            OnRefButtonClick = edFindKARefButtonClick
            SearchMode = smAll
            DesignSize = (
              582
              31)
          end
          object edFPath: TcxTextEdit
            Left = 758
            Top = 119
            Width = 121
            Height = 24
            Anchors = [akTop, akRight]
            BeepOnEnter = False
            Properties.ReadOnly = False
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 16
            ImeName = 'Russian'
            OnEnter = CtrlEnter
            OnExit = CtrlExit
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edToDate: TcxDateEdit
            Left = 757
            Top = 31
            Width = 114
            Height = 24
            Anchors = [akTop, akRight]
            ImeName = 'Russian'
            Properties.SaveTime = False
            Properties.ShowTime = False
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 11
            OnEnter = CtrlEnter
            OnExit = CtrlExit
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            EditValue = 0d
          end
          object edSumm: TssCalcEdit
            Left = 757
            Top = 60
            Width = 154
            Height = 24
            Anchors = [akTop, akRight]
            EditValue = 0.000000000000000000
            ImeName = 'Russian'
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            Style.ButtonStyle = btsSimple
            TabOrder = 13
            OnEnter = CtrlEnter
            OnExit = CtrlExit
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            CalcColor = clBtnFace
            DecimalPlaces = 2
          end
          object chbSumm: TcxCheckBox
            Left = 608
            Top = 60
            Width = 154
            Height = 26
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            Properties.Alignment = taLeftJustify
            Properties.DisplayUnchecked = 'False'
            Properties.OnChange = DataModified
            Properties.OnEditValueChanged = chbSummPropertiesEditValueChanged
            Properties.Caption = #1057#1091#1084#1084#1072' '#1082#1086#1085#1090#1088#1072#1082#1090#1072
            Style.BorderColor = clBtnShadow
            Style.BorderStyle = ebsUltraFlat
            Style.Shadow = False
            Style.StyleController = dmData.scMain
            TabOrder = 12
            ImeName = 'Russian'
            OnEnter = CtrlEnter
            OnExit = CtrlExit
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object chbAllAmount: TcxCheckBox
            Left = 608
            Top = 91
            Width = 154
            Height = 26
            TabStop = False
            Anchors = [akTop, akRight]
            AutoSize = False
            Enabled = False
            Properties.Alignment = taLeftJustify
            Properties.DisplayUnchecked = 'False'
            Properties.OnChange = DataModified
            Properties.OnEditValueChanged = chbAllAmountPropertiesEditValueChanged
            Properties.Caption = #1054#1073#1097#1077#1077' '#1082#1086#1083'-'#1074#1086
            Style.BorderColor = clBtnShadow
            Style.BorderStyle = ebsUltraFlat
            Style.Shadow = False
            Style.StyleController = dmData.scMain
            TabOrder = 14
            ImeName = 'Russian'
            OnEnter = CtrlEnter
            OnExit = CtrlExit
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edAmount: TssCalcEdit
            Left = 757
            Top = 90
            Width = 98
            Height = 24
            Anchors = [akTop, akRight]
            EditValue = 0.000000000000000000
            ImeName = 'Russian'
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            Style.ButtonStyle = btsSimple
            TabOrder = 15
            OnEnter = CtrlEnter
            OnExit = CtrlExit
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            CalcColor = clBtnFace
            DecimalPlaces = 2
          end
          object lcbPersonName: TssDBLookupCombo
            Left = 102
            Top = 138
            Width = 465
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            ImeName = 'Russian'
            Properties.DropDownListStyle = lsEditFixedList
            Properties.OnChange = DataModified
            Style.StyleController = dmData.scMain
            TabOrder = 5
            OnEnter = CtrlEnter
            OnExit = CtrlExit
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            EmptyValue = 0
            KeyField = 'kaid'
            ListField = 'Name'
            ListSource = srcPayMPersons
          end
          object chbExport: TcxCheckBox
            Left = 357
            Top = 31
            Width = 235
            Height = 24
            Anchors = [akTop, akRight]
            ParentFont = False
            Properties.Alignment = taLeftJustify
            Properties.DisplayUnchecked = 'False'
            Properties.OnChange = chbPostingPropertiesChange
            Properties.OnEditValueChanged = chbExportPropertiesEditValueChanged
            Properties.Caption = 'chbExport'
            Style.StyleController = dmData.scMain
            TabOrder = 8
            ImeName = 'Russian'
            OnEnter = CtrlEnter
            OnExit = CtrlExit
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
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
    Top = 489
    Width = 928
    inherited btnOK: TxButton
      Left = 615
    end
    inherited btnCancel: TxButton
      Left = 720
    end
    inherited btnApply: TxButton
      Left = 821
    end
  end
  inherited panToolBar: TPanel
    Width = 928
    TabOrder = 0
    inherited btnLock: TssSpeedButton
      Left = 877
      Width = 20
      Height = 20
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 901
      Width = 20
      Height = 20
    end
    inherited btnHelp: TssSpeedButton
      Left = 853
      Width = 20
      Height = 20
    end
    inherited btnBallance: TssSpeedButton
      Left = 43
      Width = 20
      Height = 20
    end
    inherited btnPrint: TssSpeedButton
      Left = 5
      Width = 20
      Height = 20
    end
    inherited btnMatInfo: TssSpeedButton
      Left = 62
      Width = 20
      Height = 20
      Visible = False
    end
    inherited btnSvcInfo: TssSpeedButton
      Left = 81
      Width = 20
      Height = 20
    end
    inherited btnFinance: TssSpeedButton
      Left = 100
      Width = 20
      Height = 20
    end
    object ssSpeedButton1: TssSpeedButton
      Left = 24
      Top = 1
      Width = 20
      Height = 20
      Action = aPrintF
      Alignment = taLeftJustify
      AllwaysShowFrame = False
      ButtonType = ssbtStandard
      Checked = False
      GroupIndex = 0
      ImageIndex = 68
      Images = dmData.Images
      LeftMargin = 4
      ParentShowHint = False
      ShowHint = True
      Style = ssbsUser
      ViewStyle = ssvsGlyphOnly
    end
  end
  inherited ilTitleBar: TImageList
    Left = 88
    Top = 255
  end
  inherited FormStorage: TssFormStorage
    Left = 32
    Top = 255
  end
  inherited ActionList: TActionList
    Images = dmData.Images
    Left = 60
    Top = 255
    inherited aRemoveRsv: TAction
      Visible = False
    end
    inherited aShowSN: TAction
      Visible = False
    end
    inherited aSetRsv: TAction
      Visible = False
    end
    inherited aSetRsvAll: TAction
      Visible = False
    end
    inherited aRemoveRsvAll: TAction
      Visible = False
    end
    object aPrintF: TAction
      Caption = 'aPrintF'
      ImageIndex = 68
      OnExecute = aPrintFExecute
    end
  end
  inherited dsDet: TDataSource
    Left = 304
    Top = 235
  end
  inherited mdDet: TdxMemData
    BeforePost = mdDetBeforePost
    Left = 268
    Top = 235
    object mdDetshippedamount: TFloatField
      FieldName = 'shippedamount'
    end
  end
  inherited srcCashDesks: TDataSource
    Left = 696
    Top = 332
  end
  inherited cdsCashDesks: TssClientDataSet
    Left = 696
    Top = 288
  end
  inherited srcEntAcc: TDataSource
    Left = 360
    Top = 232
  end
  inherited cdsPayType: TssClientDataSet
    Left = 512
    Top = 235
  end
  inherited srcPayType: TDataSource
    Left = 577
    Top = 235
  end
  inherited cdsPayMPersons: TssClientDataSet
    Left = 512
    Top = 284
  end
  inherited srcPayMPersons: TDataSource
    Left = 601
    Top = 284
  end
  inherited cdsEntAcc: TssClientDataSet
    Left = 412
    Top = 232
  end
  inherited cdsCurr: TssClientDataSet
    Left = 504
    Top = 386
  end
  inherited dsCurr: TDataSource
    Left = 577
    Top = 386
  end
  inherited mdTmpIds: TdxMemData
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
    Left = 35
    Top = 414
  end
  inherited mdWMatTurn: TdxMemData
    Left = 37
    Top = 323
  end
  inherited mdWMatTurnOld: TdxMemData
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
    Left = 35
    Top = 371
  end
  inherited frDoc: TfrReport
    ReportForm = {19000000}
  end
  inherited mdReport: TdxMemData
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
  end
  inherited mdPosition: TssMemoryData
    Left = 266
    Top = 285
  end
  inherited cdsRsv_Temp: TssClientDataSet
    Left = 708
    Top = 232
  end
  inherited cdsPersonName: TssClientDataSet
    Left = 508
    Top = 336
  end
  inherited srcPersonName: TDataSource
    Left = 605
    Top = 332
  end
  object OpenDlg: TOpenDialog
    Left = 196
    Top = 237
  end
end
