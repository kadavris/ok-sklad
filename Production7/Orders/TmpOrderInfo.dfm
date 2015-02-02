inherited frmTmpOrderInfo: TfrmTmpOrderInfo
  Left = 233
  Top = 167
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'frmTmpOrderInfo'
  ClientHeight = 256
  ClientWidth = 562
  PixelsPerInch = 96
  TextHeight = 16
  inherited panMain: TPanel
    Width = 562
    Height = 174
    object bvlMain: TssBevel
      Left = 5
      Top = 5
      Width = 550
      Height = 151
      Anchors = [akLeft, akTop, akRight, akBottom]
      ColorGrBegin = clBtnFace
      ColorGrEnd = clBtnFace
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      Style = bsSingle
      UseGradient = False
    end
    object lPerson: TLabel
      Left = 17
      Top = 22
      Width = 56
      Height = 16
      Caption = #1044#1086#1073#1072#1074#1080#1083':'
    end
    object txtPerson: TssBevel
      Left = 108
      Top = 20
      Width = 208
      Height = 24
      ColorGrBegin = clWindow
      ColorGrEnd = clWindow
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      UseGradient = True
    end
    object lTime: TLabel
      Left = 327
      Top = 22
      Width = 38
      Height = 16
      Caption = #1050#1086#1075#1076#1072':'
    end
    object txtTime: TssBevel
      Left = 379
      Top = 20
      Width = 165
      Height = 24
      Alignments.Horz = taCenter
      Anchors = [akLeft, akTop, akRight]
      ColorGrBegin = clWindow
      ColorGrEnd = clWindow
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      UseGradient = True
    end
    object lNotes: TLabel
      Left = 17
      Top = 57
      Width = 77
      Height = 16
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077':'
    end
    object txtNotes: TssBevel
      Left = 108
      Top = 54
      Width = 436
      Height = 88
      Alignments.Vert = vaTop
      Anchors = [akLeft, akTop, akRight, akBottom]
      ColorGrBegin = clWindow
      ColorGrEnd = clWindow
      ColorInner = clBtnShadow
      ColorOuter = clBtnShadow
      Edges = [beLeft, beRight, beTop, beBottom]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      GradientDirection = gdHorizontal
      HotTrack = False
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      UseGradient = True
    end
  end
  inherited panTitleBar: TssGradientPanel
    Width = 562
    inherited panTitleButtons: TssPanel
      Left = 504
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
  inherited panButtons: TPanel
    Top = 221
    Width = 562
    inherited btnOK: TxButton
      Left = 457
    end
    inherited btnCancel: TxButton
      Left = 32
      Visible = False
    end
    inherited btnApply: TxButton
      Left = 137
      Visible = False
    end
  end
  inherited panToolBar: TPanel
    Width = 562
    inherited btnLock: TssSpeedButton
      Left = 471
      Width = 25
      Height = 25
      LeftMargin = 4
    end
    inherited btnSendErrMessage: TssSpeedButton
      Left = 500
      Width = 25
      Height = 25
      LeftMargin = 4
    end
    inherited btnHelp: TssSpeedButton
      Left = 527
      Width = 25
      Height = 25
      LeftMargin = 4
    end
  end
  inherited ilTitleBar: TImageList
    Left = 68
    Top = 140
  end
  inherited FormStorage: TssFormStorage
    Left = 12
    Top = 140
  end
  inherited ActionList: TActionList
    Top = 140
  end
end
