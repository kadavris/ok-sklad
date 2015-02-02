inherited frmSetPanels: TfrmSetPanels
  Left = 480
  Top = 311
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'frmSetPanels'
  ClientHeight = 194
  ClientWidth = 440
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 440
    Height = 112
    object bvlMain: TssBevel
      Left = 4
      Top = 2
      Width = 435
      Height = 103
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
  end
  inherited panTitleBar: TssGradientPanel
    Width = 440
    inherited panTitleButtons: TssPanel
      Left = 382
    end
  end
  inherited panButtons: TPanel
    Top = 159
    Width = 440
    inherited btnOK: TxButton
      Left = 130
    end
    inherited btnCancel: TxButton
      Left = 234
    end
    inherited btnApply: TxButton
      Left = 339
    end
  end
  inherited panToolBar: TPanel
    Width = 440
    inherited btnLock: TssSpeedButton
      Left = 391
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 415
    end
    inherited btnHelp: TssSpeedButton
      Left = 367
    end
  end
  inherited ilTitleBar: TImageList
    Left = 16
    Top = 20
  end
  inherited FormStorage: TssFormStorage
    Left = 32
    Top = 76
  end
  inherited ActionList: TActionList
    Left = 44
    Top = 20
  end
end
