inherited frmBaseWBDocDlgWithPayment: TfrmBaseWBDocDlgWithPayment
  Left = 434
  Top = 211
  Width = 919
  Caption = 'frmBaseWBDocDlgWithPayment'
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Top = 47
    Width = 911
    Height = 459
    inherited panData: TPanel
      Width = 911
      Height = 459
      inherited panPos: TPanel
        Width = 911
        Height = 261
        DesignSize = (
          911
          261)
        inherited gbPos: TssGroupBox
          Left = 0
          Width = 908
          Height = 250
          HotTrack = False
          DesignSize = (
            908
            250)
          inherited lTotalCurr: TLabel
            Top = 223
          end
          inherited lSummCurr: TssBevel
            Top = 222
          end
          inherited lTotal: TLabel
            Top = 223
          end
          inherited lTotNDSOut: TLabel
            Left = 357
            Top = 223
            Alignment = taRightJustify
          end
          inherited lSummDefNoNDS: TssBevel
            Left = 418
            Top = 222
          end
          inherited lTotNDS: TLabel
            Left = 555
            Top = 223
            Alignment = taRightJustify
          end
          inherited lSummDefNDS: TssBevel
            Left = 592
            Top = 222
          end
          inherited lTot: TLabel
            Left = 730
            Top = 223
            Alignment = taRightJustify
          end
          inherited lSummDef: TssBevel
            Left = 779
            Top = 222
          end
          inherited dbgWaybillDet: TssDBGrid
            Width = 887
            Height = 159
            Hint = ''
            Filter.Criteria = {00000000}
            inherited colMeasureName: TdxDBGridColumn
              Width = 43
            end
            inherited colPriceWONDS: TdxDBGridColumn
              Width = 79
            end
          end
        end
      end
      inherited panHeader: TPanel
        Width = 911
        DesignSize = (
          911
          198)
        inherited gbHeader: TssGroupBox
          Width = 534
          Anchors = [akLeft, akTop, akRight]
          DesignSize = (
            534
            193)
          inherited lOndate: TLabel
            Left = 201
            Anchors = [akTop, akRight]
          end
          inherited btnSetTime: TssSpeedButton
            Left = 500
          end
          inherited edRate: TssCalcEdit
            EditValue = 1.000000000000000000
          end
          inherited edDate: TcxDateEdit
            Left = 239
            Anchors = [akTop, akRight]
            OnKeyPress = nil
          end
          inherited edTime: TcxTimeEdit
            Left = 393
            Anchors = [akTop, akRight]
            Properties.OnChange = nil
            OnKeyPress = nil
          end
        end
        object gbPayment: TssGroupBox
          Left = 575
          Top = 1
          Width = 333
          Height = 193
          Alignment = alTopLeft
          Anchors = [akTop, akRight]
          Caption = ' '
          TabOrder = 1
          TabStop = False
          Edges = [beLeft, beRight, beTop, beBottom]
          HideCaption = True
          HotTrack = False
          DesignSize = (
            333
            193)
          object lPayType: TssLabel
            Left = 17
            Top = 74
            Width = 73
            Height = 16
            Caption = #1058#1080#1087' '#1088#1072#1089#1095#1105#1090#1072
            Enabled = False
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lPaySumm: TssLabel
            Left = 18
            Top = 162
            Width = 37
            Height = 16
            Caption = #1057#1091#1084#1084#1072
            Enabled = False
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lPayCurr: TssLabel
            Left = 212
            Top = 162
            Width = 44
            Height = 16
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            Caption = #1042#1072#1083#1102#1090#1072
            Enabled = False
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object lPayMPerson: TssLabel
            Left = 18
            Top = 133
            Width = 69
            Height = 16
            Caption = #1063#1077#1088#1077#1079' '#1082#1086#1075#1086':'
            Enabled = False
            DisabledDraw = ddUser
            DisabledColor = clBtnShadow
          end
          object btnPayMPerson: TssSpeedButton
            Left = 295
            Top = 127
            Width = 27
            Height = 27
            Alignment = taCenter
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            DisabledImages = dmData.Images18x18dis
            Enabled = False
            GroupIndex = 0
            ImageIndex = 18
            Images = dmData.Images18x18
            LeftMargin = 1
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnMouseDown = btnPayMPersonMouseDown
            OnMouseUp = btnCashDesksMouseUp
          end
          object btnFinPay: TssSpeedButton
            Left = 295
            Top = 68
            Width = 27
            Height = 27
            Alignment = taLeftJustify
            AllwaysShowFrame = False
            Anchors = [akTop, akRight]
            ButtonType = ssbtStandard
            Checked = False
            Caption = 'aFinance'
            DisabledImages = dmData.Images18x18dis
            Enabled = False
            GroupIndex = 0
            ImageIndex = 44
            Images = dmData.Images18x18
            LeftMargin = 2
            ParentShowHint = False
            ShowHint = True
            Style = ssbsUser
            ViewStyle = ssvsGlyphOnly
            OnMouseDown = btnFinPayMouseDown
            OnMouseUp = btnFinPayMouseUp
          end
          object chbPay: TcxCheckBox
            Left = 10
            Top = 7
            Width = 257
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            Properties.Alignment = taLeftJustify
            Properties.DisplayUnchecked = 'False'
            Properties.Caption = #1054#1087#1083#1072#1090#1072' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
            TabOrder = 0
            ImeName = 'Russian'
            OnClick = chbPayClick
            OnKeyDown = chbPayKeyDown
            OnKeyPress = chbPayKeyPress
          end
          object edPaySumm: TssCalcEdit
            Left = 103
            Top = 158
            Width = 98
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            EditValue = 0.000000000000000000
            Enabled = False
            ImeName = 'Russian'
            ParentFont = False
            Properties.OnChange = PayDocModified
            Style.StyleController = dmData.scMain
            Style.ButtonStyle = btsSimple
            TabOrder = 5
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            CalcColor = clBtnFace
            DecimalPlaces = 2
          end
          object cbPayCurr: TssDBLookupCombo
            Left = 261
            Top = 158
            Width = 63
            Height = 24
            Anchors = [akTop, akRight]
            Enabled = False
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.OnChange = cbPayCurrPropertiesChange
            Properties.OnEditValueChanged = PayDocModified
            Style.StyleController = dmData.scMain
            Style.ButtonStyle = btsSimple
            TabOrder = 6
            OnKeyPress = cbPayCurrKeyPress
            EmptyValue = 0
            KeyField = 'CURRID'
            ListField = 'SHORTNAME'
            ListSource = dsCurr
          end
          object lcbPayMPerson: TssDBLookupCombo
            Left = 103
            Top = 128
            Width = 191
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            Enabled = False
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownListStyle = lsEditFixedList
            Properties.OnChange = PayDocModified
            Properties.OnEditValueChanged = lcbPayMPersonPropertiesEditValueChanged
            Style.StyleController = dmData.scMain
            TabOrder = 4
            OnEnter = lcbCashDesksEnter
            OnExit = lcbCashDesksExit
            OnKeyPress = GoNext
            EmptyValue = 0
            KeyField = 'kaid'
            ListField = 'Name'
            ListSource = srcPayMPersons
          end
          object lcbPayType: TssDBLookupCombo
            Left = 103
            Top = 69
            Width = 191
            Height = 24
            Anchors = [akLeft, akTop, akRight]
            Enabled = False
            ImeName = 'Russian'
            ParentFont = False
            Properties.DropDownListStyle = lsFixedList
            Properties.OnChange = PayDocModified
            Properties.OnEditValueChanged = lcbPayTypePropertiesEditValueChanged
            Properties.OnInitPopup = lcbPayTypePropertiesInitPopup
            Style.StyleController = dmData.scMain
            TabOrder = 2
            OnEnter = lcbPayTypeEnter
            OnExit = lcbPayTypeExit
            OnKeyPress = GoNext
            EmptyValue = 0
            KeyField = 'ptypeid'
            ListField = 'name'
            ListSource = srcPayType
          end
          object pcPayType: TssPageControl
            Left = 15
            Top = 96
            Width = 307
            Height = 30
            ActivePage = tsCash
            HideTabs = True
            Style = 3
            TabOrder = 3
            TabStop = False
            object tsCash: TcxTabSheet
              Caption = 'tsCash'
              ImageIndex = 0
              TabVisible = False
              DesignSize = (
                307
                30)
              object lCashDesks: TssLabel
                Left = 4
                Top = 7
                Width = 38
                Height = 16
                Caption = #1050#1072#1089#1089#1072':'
                Enabled = False
                DisabledDraw = ddUser
                DisabledColor = clBtnShadow
              end
              object btnCashDesks: TssSpeedButton
                Left = 276
                Top = 1
                Width = 27
                Height = 27
                Alignment = taLeftJustify
                AllwaysShowFrame = False
                Anchors = [akTop, akRight]
                ButtonType = ssbtStandard
                Checked = False
                DisabledImages = dmData.Images18x18dis
                Enabled = False
                GroupIndex = 0
                ImageIndex = 18
                Images = dmData.Images18x18
                LeftMargin = 2
                ParentShowHint = False
                ShowHint = True
                Style = ssbsUser
                ViewStyle = ssvsGlyphOnly
                OnMouseDown = btnCashDesksMouseDown
                OnMouseUp = btnCashDesksMouseUp
              end
              object lcbCashDesks: TssDBLookupCombo
                Left = 89
                Top = 2
                Width = 185
                Height = 24
                Anchors = [akTop, akRight]
                Enabled = False
                ImeName = 'Russian'
                ParentFont = False
                Properties.DropDownListStyle = lsEditFixedList
                Properties.OnChange = PayDocModified
                Style.StyleController = dmData.scMain
                TabOrder = 0
                OnEnter = lcbCashDesksEnter
                OnExit = lcbCashDesksExit
                OnKeyPress = GoNext
                EmptyValue = 0
                KeyField = 'cashid'
                ListField = 'name'
                ListSource = srcCashDesks
              end
            end
            object tsCashless: TcxTabSheet
              Caption = 'tsCashless'
              ImageIndex = 1
              TabVisible = False
              object lAcc: TssLabel
                Left = 4
                Top = 7
                Width = 23
                Height = 16
                Caption = #1056'/'#1089':'
                Enabled = False
                DisabledDraw = ddUser
                DisabledColor = clBtnShadow
              end
              object lcbAccount: TssDBLookupCombo
                Left = 89
                Top = 2
                Width = 215
                Height = 26
                Enabled = False
                ImeName = 'Russian'
                Properties.DropDownListStyle = lsEditFixedList
                Properties.OnChange = PayDocModified
                Style.StyleController = dmData.scMain
                TabOrder = 0
                OnKeyPress = GoNext
                EmptyValue = 0
                KeyField = 'accid'
                ListField = 'fullname'
                ListSource = srcEntAcc
              end
            end
          end
          object edPayNum: TokPayDocSearchEdit
            Left = 18
            Top = 37
            Width = 306
            Height = 31
            Anchors = [akLeft, akTop, akRight]
            ButtonsLeftMargin = 2
            CapRef = 'Incoming Payments Register'
            EditMode = True
            EditorOffset = 90
            DisabledImages = dmData.Images18x18dis
            Enabled = False
            Images = dmData.Images18x18
            ImageIndexRef = 47
            LangManager = dmData.Lng
            RemoteServer = dmData.SConnection
            ShowLng = False
            ShowButtons = sbtHide
            SearchNames.Strings = (
              'Payment No.;docnum')
            SearchType = stBegin
            TabOrder = 1
            OnChange = edPayNumChange
            OnKeyDown = GoNextKeyDown
            OnEditorChange = edPayNumEditorChange
            PayDocType = pdtIn
            DesignSize = (
              306
              31)
          end
        end
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 911
    Height = 21
    inherited panTitleButtons: TssPanel
      Left = 850
      Height = 17
      inherited btnTBMinimize: TssSpeedButton
        Left = 1
        Width = 16
        Height = 16
      end
      inherited btnTBMaximize: TssSpeedButton
        Width = 16
        Height = 16
      end
      inherited btnTBClose: TssSpeedButton
        Width = 16
        Height = 16
      end
    end
  end
  inherited panButtons: TPanel
    Width = 911
    DesignSize = (
      911
      35)
    inherited btnOK: TxButton
      Left = 604
    end
    inherited btnCancel: TxButton
      Left = 705
    end
    inherited btnApply: TxButton
      Left = 807
    end
  end
  inherited panToolBar: TPanel
    Top = 21
    Width = 911
    DesignSize = (
      911
      26)
    inherited btnLock: TssSpeedButton
      Left = 999
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 1026
    end
    inherited btnHelp: TssSpeedButton
      Left = 1055
    end
  end
  inherited srcCashDesks: TDataSource
    Left = 572
    Top = 424
  end
  inherited cdsCashDesks: TssClientDataSet
    AfterOpen = cdsCashDesksAfterOpen
    Left = 568
    Top = 384
  end
  inherited srcEntAcc: TDataSource
    Left = 564
    Top = 332
  end
  object cdsPayType: TssClientDataSet [12]
    Aggregates = <>
    Params = <>
    ProviderName = 'pPayType_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 448
    Top = 315
  end
  object srcPayType: TDataSource [13]
    DataSet = cdsPayType
    Left = 445
    Top = 275
  end
  object cdsPayMPersons: TssClientDataSet [14]
    Aggregates = <>
    Params = <>
    ProviderName = 'p_Persons_List'
    RemoteServer = dmData.SConnection
    Macros = <>
    Left = 448
    Top = 408
  end
  object srcPayMPersons: TDataSource [15]
    DataSet = cdsPayMPersons
    Left = 445
    Top = 360
  end
  inherited cdsEntAcc: TssClientDataSet
    OnCalcFields = cdsEntAccCalcFields
    Left = 560
    Top = 284
  end
  inherited cdsCurr: TssClientDataSet
    Left = 48
    Top = 334
  end
  inherited dsCurr: TDataSource
    Left = 53
    Top = 286
  end
end
