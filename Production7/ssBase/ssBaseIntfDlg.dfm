inherited frmBaseIntfDlg: TfrmBaseIntfDlg
  Left = 733
  Top = 349
  Caption = 'frmBaseIntfDlg'
  KeyPreview = True
  OldCreateOrder = True
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 16
  inherited panTitleBar: TssGradientPanel
    inherited panTitleButtons: TssPanel
      inherited btnTBMinimize: TssSpeedButton
        Height = 16
      end
      inherited btnTBMaximize: TssSpeedButton
        Height = 16
      end
      inherited btnTBClose: TssSpeedButton
        Height = 16
      end
    end
  end
  object panButtons: TPanel [1]
    Left = 0
    Top = 131
    Width = 339
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      339
      30)
    object btnOK: TxButton
      Left = 31
      Top = 3
      Width = 98
      Height = 25
      Action = aOK
      Anchors = [akRight, akBottom]
      ColorInner = clBtnShadow
      Gradient.ColorEnd = clWindow
      Gradient.Direction = gdVertical
      Gradient.Enabled = True
      TabOrder = 0
    end
    object btnCancel: TxButton
      Left = 134
      Top = 3
      Width = 98
      Height = 25
      Action = aCancel
      Anchors = [akRight, akBottom]
      ColorInner = clBtnShadow
      Gradient.ColorEnd = clWindow
      Gradient.Direction = gdVertical
      Gradient.Enabled = True
      OnKeyDown = GoNextKeyDown
      TabOrder = 1
    end
    object btnApply: TxButton
      Left = 237
      Top = 3
      Width = 99
      Height = 25
      Action = aApply
      Anchors = [akRight, akBottom]
      ColorInner = clBtnShadow
      Gradient.ColorEnd = clWindow
      Gradient.Direction = gdVertical
      Gradient.Enabled = True
      TabOrder = 2
    end
  end
  object ActionList: TActionList
    OnUpdate = ActionListUpdate
    Left = 40
    Top = 36
    object aApply: TAction
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      ShortCut = 16467
      OnExecute = aApplyExecute
    end
    object aOK: TAction
      Caption = 'OK'
      OnExecute = aOKExecute
    end
    object aCancel: TAction
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100
      OnExecute = aCancelExecute
    end
  end
end
