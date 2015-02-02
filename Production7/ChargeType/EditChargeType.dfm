inherited frmEditChargeType: TfrmEditChargeType
  Left = 351
  Top = 286
  VertScrollBar.Range = 0
  ActiveControl = edName
  BorderStyle = bsDialog
  Caption = 'frmEditChargeType'
  ClientHeight = 141
  ClientWidth = 562
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 562
    Height = 59
    object bvlMain: TssBevel
      Left = 5
      Top = 5
      Width = 550
      Height = 52
      Anchors = [akLeft, akTop, akRight]
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
      Top = 23
      Width = 86
      Height = 16
      Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
    end
    object edName: TcxTextEdit
      Left = 172
      Top = 18
      Width = 370
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      ParentFont = False
      Properties.MaxLength = 128
      Properties.OnChange = DataModified
      Style.StyleController = dmData.scMain
      TabOrder = 0
      ImeName = 'Russian'
      OnKeyDown = GoNextKeyDown
      OnKeyPress = GoNext
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 562
    inherited panTitleButtons: TssPanel
      Left = 504
    end
  end
  inherited panButtons: TPanel
    Top = 106
    Width = 562
    TabOrder = 3
    inherited btnOK: TxButton
      Left = 247
      Top = 7
    end
    inherited btnCancel: TxButton
      Left = 352
      Top = 7
    end
    inherited btnApply: TxButton
      Left = 457
      Top = 7
    end
  end
  inherited panToolBar: TPanel
    Width = 562
    TabOrder = 1
    inherited btnLock: TssSpeedButton
      Left = 471
      Width = 22
      Height = 22
      LeftMargin = 2
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 500
      Width = 22
      Height = 22
      LeftMargin = 2
    end
    inherited btnHelp: TssSpeedButton
      Left = 527
      Width = 22
      Height = 22
      LeftMargin = 2
    end
  end
  inherited ilTitleBar: TImageList
    Left = 72
    Top = 96
  end
  inherited FormStorage: TssFormStorage
    Left = 16
    Top = 96
  end
  inherited ActionList: TActionList
    Left = 44
    Top = 96
  end
end
