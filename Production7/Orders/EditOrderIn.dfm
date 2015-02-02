inherited frmEditOrderIn: TfrmEditOrderIn
  Left = 404
  Top = 266
  Width = 867
  Height = 556
  Caption = 'frmEditOrderIn'
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 859
    Height = 437
    inherited panData: TPanel
      Width = 859
      Height = 437
      inherited panPos: TPanel
        Top = 218
        Width = 859
        Height = 219
        DesignSize = (
          859
          219)
        inherited gbPos: TssGroupBox
          Top = 5
          Width = 855
          Height = 204
          DesignSize = (
            855
            204)
          inherited lTotalCurr: TLabel
            Top = 178
          end
          inherited lSummCurr: TssBevel
            Top = 175
          end
          inherited lTotal: TLabel
            Left = 231
            Top = 178
          end
          inherited lTotNDSOut: TLabel
            Left = 337
            Top = 178
          end
          inherited lSummDefNoNDS: TssBevel
            Left = 399
            Top = 175
          end
          inherited lTotNDS: TLabel
            Left = 527
            Top = 178
          end
          inherited lSummDefNDS: TssBevel
            Left = 561
            Top = 175
          end
          inherited lTot: TLabel
            Left = 680
            Top = 178
          end
          inherited lSummDef: TssBevel
            Left = 728
            Top = 175
          end
          inherited dbgWaybillDet: TssDBGrid
            Width = 840
            Hint = 'pricewithnds'
            Filter.Criteria = {00000000}
            inherited colSerial: TdxDBGridColumn
              Tag = 0
            end
            inherited colProducer: TdxDBGridColumn
              Tag = 0
            end
            inherited colGTD: TdxDBGridColumn
              Tag = 0
            end
            inherited colCertNum: TdxDBGridColumn
              Tag = 0
            end
            inherited colCertDate: TdxDBGridColumn
              Tag = 0
            end
            object colLocked: TdxDBGridColumn
              Visible = False
              BandIndex = 0
              RowIndex = 0
              FieldName = 'locked'
            end
          end
          inherited panPosBar: TPanel
            Width = 845
            inherited edFind: TokGridSearchEdit
              Left = 588
            end
          end
        end
      end
      inherited panHeader: TPanel
        Width = 859
        Height = 218
        inherited gbHeader: TssGroupBox
          Width = 629
          Height = 216
          inherited lRate: TLabel
            Left = 198
            Top = 155
          end
          inherited lReason: TLabel
            Left = 68
            Top = -123
            Visible = False
          end
          inherited lPersonname: TLabel
            Left = 12
            Top = 126
          end
          inherited btnPersonName: TssSpeedButton
            Left = 329
            Top = 119
            Width = 25
            Height = 25
            LeftMargin = 4
          end
          inherited lNotes: TLabel
            Left = 10
            Top = 187
          end
          inherited lCurr: TLabel
            Top = 155
          end
          inherited lOndate: TLabel
            Left = 306
          end
          inherited btnSetTime: TssSpeedButton
            Left = 595
            Width = 25
            Height = 25
            LeftMargin = 4
          end
          inherited edRate: TssCalcEdit
            Left = 253
            Top = 153
          end
          inherited cbCurr: TssDBLookupCombo
            Left = 95
            Top = 151
            Width = 93
          end
          inherited chbPosting: TcxCheckBox
            Properties.Caption = #1055#1088#1086#1074#1077#1089#1090#1080' '#1076#1086#1082#1091#1084#1077#1085#1090
            Visible = False
          end
          inherited chbCheckNDS: TcxCheckBox
            Left = 362
            Width = 228
            Properties.Caption = #1062#1077#1085#1099' '#1074#1082#1083#1102#1095#1072#1102#1090' '#1053#1044#1057
          end
          inherited edNum1: TcxTextEdit
            Left = 96
            Width = 194
          end
          inherited edReason: TcxTextEdit
            Left = 143
            Top = -123
            Visible = False
          end
          inherited lcbPersonName: TssDBLookupCombo
            Left = 96
            Top = 121
            Width = 231
            TabOrder = 14
          end
          inherited edKAgent: TokKASearchEdit
            Width = 613
            EditorOffset = 87
          end
          inherited edNotes: TcxTextEdit
            Left = 96
            Top = 182
            Width = 527
          end
          inherited edContr: TokContractSearchEdit
            Top = 89
            Width = 288
            EditorOffset = 87
            TabOrder = 8
          end
          inherited edDate: TcxDateEdit
            Left = 360
            TabOrder = 6
          end
          inherited edTime: TcxTimeEdit
            Left = 488
            TabOrder = 7
          end
          inherited lcbWH: TokWHouseSearchEdit
            Left = 305
            Width = 318
            Height = 34
            EditorOffset = 70
            ParentColor = False
            TabOrder = 13
            DesignSize = (
              318
              34)
          end
          object chbToDate: TcxCheckBox
            Left = 377
            Top = 121
            Width = 124
            Height = 27
            Anchors = [akTop, akRight]
            AutoSize = False
            ParentFont = False
            Properties.Alignment = taLeftJustify
            Properties.DisplayUnchecked = 'False'
            Properties.OnChange = chbToDatePropertiesChange
            Properties.Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1076#1086
            Style.BorderColor = clBtnShadow
            Style.BorderStyle = ebsUltraFlat
            Style.Shadow = False
            Style.StyleController = dmData.scMain
            TabOrder = 9
            ImeName = 'Russian'
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
          end
          object edToDate: TcxDateEdit
            Left = 509
            Top = 121
            Width = 114
            Height = 24
            Anchors = [akTop, akRight]
            ImeName = 'Russian'
            ParentFont = False
            Properties.SaveTime = False
            Properties.ShowTime = False
            Properties.OnChange = datamodified
            Style.StyleController = dmData.scMain
            TabOrder = 10
            OnKeyDown = GoNextKeyDown
            OnKeyPress = GoNext
            EditValue = 0d
          end
        end
        inherited gbPayment: TssGroupBox
          Left = 632
          Width = 224
          Height = 216
          inherited lPaySumm: TssLabel
            Left = 10
            Top = 146
          end
          inherited lPayCurr: TssLabel
            Left = 6
            Top = 188
          end
          inherited lPayMPerson: TssLabel
            Top = 116
          end
          inherited btnPayMPerson: TssSpeedButton
            Left = 195
            Top = 112
            Width = 25
            Height = 25
            Anchors = [akTop]
            LeftMargin = 4
          end
          inherited btnFinPay: TssSpeedButton
            Left = 193
            Top = 55
            Width = 25
            Height = 25
            Anchors = [akTop]
            LeftMargin = 4
          end
          inherited chbPay: TcxCheckBox
            Width = 200
            Properties.Caption = #1054#1087#1083#1072#1090#1072' '#1087#1086' '#1076#1086#1082#1091#1084#1077#1085#1090#1091
          end
          inherited edPaySumm: TssCalcEdit
            Top = 141
            Width = 120
          end
          inherited cbPayCurr: TssDBLookupCombo
            Top = 181
            Width = 81
          end
          inherited lcbPayMPerson: TssDBLookupCombo
            Top = 113
            Width = 100
          end
          inherited lcbPayType: TssDBLookupCombo
            Width = 96
          end
          inherited pcPayType: TssPageControl
            Left = 3
            Top = 80
            Width = 218
            ActivePage = tsCash
            inherited tsCash: TcxTabSheet
              inherited btnCashDesks: TssSpeedButton
                Left = 192
                Width = 25
                Height = 25
                LeftMargin = 4
              end
              inherited lcbCashDesks: TssDBLookupCombo
                Left = 46
                Width = 139
              end
            end
            inherited tsCashless: TcxTabSheet
              inherited lAcc: TssLabel
                Anchors = [akTop, akRight]
              end
              inherited lcbAccount: TssDBLookupCombo
                Width = 119
              end
            end
          end
          inherited edPayNum: TokPayDocSearchEdit
            Width = 213
          end
        end
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 859
    inherited panTitleButtons: TssPanel
      Left = 798
    end
  end
  inherited panButtons: TPanel
    Top = 484
    Width = 859
    inherited btnOK: TxButton
      Left = 539
    end
    inherited btnCancel: TxButton
      Left = 642
    end
    inherited btnApply: TxButton
      Left = 749
    end
  end
  inherited panToolBar: TPanel
    Width = 859
    inherited btnLock: TssSpeedButton
      Left = 803
      Top = 1
      Width = 25
      Height = 25
      LeftMargin = 4
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 831
      Top = 1
      Width = 25
      Height = 25
      LeftMargin = 4
    end
    inherited btnHelp: TssSpeedButton
      Left = 775
      Top = 1
      Width = 25
      Height = 25
      LeftMargin = 4
    end
    inherited btnBallance: TssSpeedButton
      Left = 30
      Width = 25
      Height = 25
      LeftMargin = 4
    end
    inherited btnPrint: TssSpeedButton
      Left = 2
      Width = 25
      Height = 25
      LeftMargin = 4
    end
    inherited btnOrdersInfo: TssSpeedButton
      Left = 59
      Width = 25
      Height = 25
      LeftMargin = 4
    end
    inherited btnMatInfo: TssSpeedButton
      Left = 86
      Width = 25
      Height = 25
      LeftMargin = 4
    end
    inherited btnSvcInfo: TssSpeedButton
      Left = 140
      Width = 25
      Height = 25
      LeftMargin = 4
    end
    inherited btnFinance: TssSpeedButton
      Left = 113
      Width = 25
      Height = 25
      LeftMargin = 4
    end
  end
  inherited mdDet: TdxMemData
    OnFilterRecord = mdDetFilterRecord
    object mdDetlocked: TIntegerField
      FieldName = 'locked'
    end
    object mdDetdeleted: TIntegerField
      FieldName = 'deleted'
    end
  end
  inherited cdsFind: TssClientDataSet
    Left = 182
    Top = 10
  end
  inherited frDoc: TfrReport
    ReportForm = {19000000}
  end
  inherited mdReport: TdxMemData
    Persistent.Data = {566572CDCCCCCCCCCCFC3F00000000}
  end
end
