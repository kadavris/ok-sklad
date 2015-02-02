inherited frmEditAtt: TfrmEditAtt
  Left = 422
  Top = 216
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'frmEditAtt'
  ClientHeight = 188
  ClientWidth = 554
  OnCloseQuery = FormCloseQuery
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 554
    Height = 106
    object ssBevel1: TssBevel
      Left = 4
      Top = 4
      Width = 545
      Height = 85
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
    object lNum: TLabel
      Left = 16
      Top = 50
      Width = 123
      Height = 16
      Caption = #1053#1086#1084#1077#1088' '#1076#1086#1074#1077#1088#1077#1085#1085#1086#1089#1090#1080
    end
    object lAttOndate: TLabel
      Left = 334
      Top = 52
      Width = 77
      Height = 16
      Caption = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
    end
    object lReceived: TLabel
      Left = 16
      Top = 20
      Width = 64
      Height = 16
      Caption = #1063#1077#1088#1077#1079' '#1082#1086#1075#1086
    end
    object edAttNum: TcxTextEdit
      Left = 177
      Top = 47
      Width = 144
      Height = 24
      Properties.MaxLength = 15
      Properties.OnChange = edNumPropertiesChange
      Style.StyleController = dmData.scMain
      TabOrder = 2
      ImeName = 'Russian'
      OnKeyDown = GoNextKeyDown
      OnKeyPress = GoNext
    end
    object edAttDate: TcxDateEdit
      Left = 431
      Top = 47
      Width = 98
      Height = 24
      ImeName = 'Russian'
      Properties.SaveTime = False
      Properties.ShowTime = False
      Properties.OnChange = edDatePropertiesChange
      Style.StyleController = dmData.scMain
      TabOrder = 1
      EditValue = 0d
    end
    object cbReceived: TcxComboBox
      Left = 177
      Top = 16
      Width = 352
      Height = 24
      ImeName = 'Russian'
      Properties.DropDownAutoWidth = False
      Properties.ImmediateDropDown = False
      Properties.MaxLength = 64
      Style.StyleController = dmData.scMain
      TabOrder = 0
      OnEnter = cbReceivedEnter
      OnExit = cbReceivedExit
      OnKeyPress = GoNext
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 554
    inherited panTitleButtons: TssPanel
      Left = 496
    end
  end
  inherited panButtons: TPanel
    Top = 153
    Width = 554
    inherited btnOK: TxButton
      Left = 347
    end
    inherited btnCancel: TxButton
      Left = 450
    end
    inherited btnApply: TxButton
      Left = 139
      Width = 108
      Visible = False
    end
  end
  inherited panToolBar: TPanel
    Width = 554
    inherited btnLock: TssSpeedButton
      Left = 464
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 492
    end
    inherited btnHelp: TssSpeedButton
      Left = 521
    end
  end
  inherited ilTitleBar: TImageList
    Left = 100
    Top = 8
  end
  inherited FormStorage: TssFormStorage
    Left = 36
    Top = 8
  end
  inherited ActionList: TActionList
    Left = 64
    Top = 8
  end
end
