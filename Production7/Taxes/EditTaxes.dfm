inherited frmEditTaxes: TfrmEditTaxes
  Left = 270
  Top = 253
  VertScrollBar.Range = 0
  ActiveControl = edName
  BorderStyle = bsDialog
  Caption = 'frmEditTaxes'
  ClientHeight = 289
  ClientWidth = 562
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 562
    Height = 207
    object bvlMain: TssBevel
      Left = 5
      Top = 1
      Width = 551
      Height = 203
      Anchors = [akLeft, akTop, akRight, akBottom]
      ColorGrBegin = clBtnFace
      ColorGrEnd = clBtnFace
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object lName: TLabel
      Left = 22
      Top = 20
      Width = 86
      Height = 16
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    end
    object lOnValue: TssLabel
      Left = 22
      Top = 52
      Width = 66
      Height = 16
      Caption = #1057#1090#1072#1074#1082#1072', %:'
      DisabledDraw = ddUser
      DisabledColor = clBtnShadow
    end
    object edName: TcxTextEdit
      Left = 128
      Top = 15
      Width = 415
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Properties.MaxLength = 64
      Properties.OnChange = DataModified
      Style.StyleController = dmData.scMain
      TabOrder = 0
      ImeName = 'Russian'
      OnKeyDown = GoNextKeyDown
      OnKeyPress = GoNext
    end
    object edOnValue: TssCalcEdit
      Left = 128
      Top = 47
      Width = 97
      Height = 24
      Anchors = [akTop, akRight]
      EditValue = 0.000000000000000000
      ImeName = 'Russian'
      ParentFont = False
      Properties.Alignment.Horz = taRightJustify
      Properties.OnChange = DataModified
      Style.StyleController = dmData.scMain
      Style.PopupBorderStyle = epbsFlat
      TabOrder = 2
      OnKeyDown = GoNextKeyDown
      OnKeyPress = GoNext
      CalcColor = clBtnFace
      DecimalPlaces = 3
    end
    object gbType: TssGroupBox
      Left = 128
      Top = 81
      Width = 415
      Height = 116
      Alignment = alTopLeft
      Caption = ' '#1056#1072#1089#1087#1088#1086#1089#1090#1088#1072#1085#1103#1077#1090#1089#1103' '#1085#1072'  '
      TabOrder = 1
      Edges = [beLeft, beRight, beTop, beBottom]
      HotTrack = False
      object rbtPersons: TcxRadioButton
        Left = 12
        Top = 52
        Width = 285
        Height = 21
        Caption = #1092#1080#1079#1080#1095#1077#1089#1082#1080#1093' '#1083#1080#1094
        TabOrder = 0
        OnClick = DataModified
      end
      object rbtFirms: TcxRadioButton
        Left = 12
        Top = 78
        Width = 285
        Height = 20
        Caption = #1102#1088#1080#1076#1080#1095#1077#1089#1082#1080#1093' '#1083#1080#1094
        TabOrder = 1
        OnClick = DataModified
      end
      object rbtAll: TcxRadioButton
        Left = 12
        Top = 26
        Width = 285
        Height = 21
        Caption = #1074#1089#1077#1093
        Checked = True
        TabOrder = 2
        TabStop = True
        OnClick = DataModified
      end
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 562
    inherited panTitleButtons: TssPanel
      Left = 504
    end
  end
  inherited panButtons: TPanel
    Top = 254
    Width = 562
    TabOrder = 3
    inherited btnOK: TxButton
      Left = 249
      Top = 7
    end
    inherited btnCancel: TxButton
      Left = 353
      Top = 7
    end
    inherited btnApply: TxButton
      Left = 458
      Top = 7
    end
  end
  inherited panToolBar: TPanel
    Width = 562
    TabOrder = 1
    inherited btnLock: TssSpeedButton
      Left = 509
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 533
      Width = 22
    end
    inherited btnHelp: TssSpeedButton
      Left = 484
    end
  end
  inherited ilTitleBar: TImageList
    Left = 59
    Top = 162
  end
  inherited FormStorage: TssFormStorage
    Left = 3
    Top = 162
  end
  inherited ActionList: TActionList
    Left = 31
    Top = 162
  end
end
