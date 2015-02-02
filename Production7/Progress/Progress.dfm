inherited frmProgress: TfrmProgress
  Left = 785
  Top = 245
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = 'frmProgress'
  ClientHeight = 534
  ClientWidth = 511
  OldCreateOrder = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnHide = FormHide
  PixelsPerInch = 96
  TextHeight = 16
  inherited panTitleBar: TssGradientPanel
    Width = 511
    inherited panTitleButtons: TssPanel
      Left = 452
    end
  end
  object panAnime: TPanel [1]
    Left = 0
    Top = 21
    Width = 511
    Height = 93
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      511
      93)
    object Animate: TAnimate
      Left = 10
      Top = 12
      Width = 488
      Height = 70
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Color = clBtnFace
      CommonAVI = aviCopyFiles
      ParentColor = False
      StopFrame = 1
    end
  end
  object panMain: TPanel [2]
    Left = 0
    Top = 114
    Width = 511
    Height = 55
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    DesignSize = (
      511
      55)
    object lText: TLabel
      Left = 20
      Top = 0
      Width = 28
      Height = 16
      Caption = 'lText'
    end
    object pbMain: TProgressBar
      Left = 20
      Top = 18
      Width = 467
      Height = 20
      Anchors = [akLeft, akTop, akRight]
      Step = 1
      TabOrder = 0
    end
  end
  object panDetail: TPanel [3]
    Left = 0
    Top = 169
    Width = 511
    Height = 51
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 3
    DesignSize = (
      511
      51)
    object lDet: TLabel
      Left = 20
      Top = 4
      Width = 22
      Height = 16
      Anchors = [akLeft, akBottom]
      Caption = 'lDet'
    end
    object pbDet: TProgressBar
      Left = 20
      Top = 22
      Width = 467
      Height = 20
      Anchors = [akLeft, akRight, akBottom]
      Step = 1
      TabOrder = 0
    end
  end
  object panButtons: TPanel [4]
    Left = 0
    Top = 489
    Width = 511
    Height = 45
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 4
    DesignSize = (
      511
      45)
    object butOK: TButton
      Left = 5
      Top = 10
      Width = 114
      Height = 31
      Caption = 'OK'
      TabOrder = 0
      OnClick = butOKClick
    end
    object butCancel: TButton
      Left = 389
      Top = 10
      Width = 114
      Height = 31
      Anchors = [akTop, akRight]
      Caption = 'Cancel'
      TabOrder = 1
      OnClick = butCancelClick
    end
    object butSkip: TButton
      Left = 202
      Top = 10
      Width = 114
      Height = 31
      Caption = 'Skip'
      TabOrder = 2
      OnClick = butSkipClick
    end
  end
  object panLog: TPanel [5]
    Left = 0
    Top = 220
    Width = 511
    Height = 261
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 5
    object gbLog: TGroupBox
      Left = 0
      Top = 0
      Width = 511
      Height = 261
      Align = alClient
      Caption = ' Log '
      TabOrder = 0
      object log: TMemo
        Left = 10
        Top = 18
        Width = 491
        Height = 233
        Align = alCustom
        Anchors = [akLeft, akTop, akRight, akBottom]
        ImeName = 'Russian'
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
end
